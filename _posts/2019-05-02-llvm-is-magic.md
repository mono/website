---
layout: blog
title: "LLVM is Magic: Teaching Mono to use LLVM better"
author: Alexander Kyte
tags: [codegen]
---

The performance of modern software can be bewildering. Tiny bits of plastic and wire routinely astound, outperforming the supercomputers of yesteryear. Far from a rarity, our systems make such a feat the default. We trust things to be fast, considering almost any delay a fault. We are all told about the evils of premature optimization.

This performance largely comes from leveraging a small number of important optimizations. When people hear about “parallelism” in the context of computer hardware, they think about multithreaded programs running on multicore multiprocessors. The performance of code that isn’t so “multi” relies just as much on parallelism. When a processor runs sequential user code, operations that don’t depend on each other will run at the same time.

In order to avoid having unused hardware idling while drawing power, code has to be reordered. There always must be enough work to do in parallel, or performance drops very quickly. The real world doesn’t like to cooperate with our optimizations all of the time though. When the available work is not enough to stay busy, the processor has to start guessing at the results of operations. When it guesses wrong (a branch prediction miss), code can end up running even slower than if the processor had never even tried to optimize.

When Mono is asked to run a function, the resulting performance depends in large part on the ability to correctly reorder operations to keep the processor busy doing useful work. Recently, we have been taking performance very seriously. When we compared ourselves against the CoreCLR using the dotnet performance harness (https://github.com/mono/mono/issues/13104), we found that Mono’s default code generation backend lags by a noticeable margin. When using LLVM, we were a lot closer than one would expect. Nevertheless, it was clear from community benchmarks that we weren’t getting as much out of LLVM as some other language projects have been able to.

Profiling of benchmarks with low-level tools and manual analysis of the code we emit for the benchmarks lead to us spotting a number of categorical issues that we fixed.

Direct Calls
--------------------------------

A compiler can often make some very surprising optimizations by looking at the entire program and figuring out optimizations that span multiple functions. It will take the body of one function and put it in another (inlining), identify when calling a function with the provided arguments leads to an early exit without doing any work (call removal), and remove safety checks that can be proven to be redundant. None of these are possible when a compiler can’t see which functions call which other functions.

Mono was relying on a mutable table of function addresses to find the destination of every call site. The emitted code would go through this table. Therefore at compile-time, the compiler didn’t even have the guarantee that the called function existed, let alone enough information to inline it. The code generated had to work in a set of scenarios that Mono ensured couldn’t happen. It wasn’t specialized on the program semantics.

By changing how we set up resources used by native code, we were able to instead make all calls to other functions in the same CLR Assembly into direct calls. The CPU branch predictor, LLVM inliner, and general LLVM optimizer all benefitted. There is some hope to eventually enable direct calls throughout the entire application. This work is ongoing.


GC Safepoints
--------------------------------

The process of reordering instructions for performance doesn’t happen a single time. It is repeated at multiple layers. Mono compiles the bytecode into LLVM IR using these techniques and by exploiting the semantics of bytecode. LLVM compiles the IR to machine code and optimizes and reorders using LLVM semantics. Lastly, the CPU reorders and rewrites instructions to best run it.

As you move along this chain, the lifetimes of the variables and how they contribute to the return value of the function becomes more and more difficult to ascertain. It’s easy to introduce “barriers” around which code cannot be reordered because the code generator at that level of IR doesn’t know that moving the code around there won’t impact the semantics at a higher level. This is where many inefficiencies in generated assembly will sneak in.

One such issue we faced was around GC Safepoints. The emitted code relies on the Mono runtime to garbage collect the memory allocated for it. This means that Mono relies on the emitted code to yield to Mono to do that work periodically. It doesn’t matter where these yields happen, as long as we are sure that they happen every now and then. In particular, we don’t want to be able to loop indefinitely and avoid making this check. Such an infinite loop could lock up the entire runtime.

When we place this Safepoint somewhere though, it appears very heavyweight to the underlying code generator. We are calling into the runtime and allowing it to touch every byte on the heap (and maybe on the stack). Rather than emitting such a yield ourselves, we’ve realized that we can rely on LLVM’s support for GC Safepoints. This keeps the IR we feed into LLVM free of all of the distracting “fog” of Safepoints being inserted everywhere.

This enables LLVM to make optimizations such as realizing that a loop can be turned into a vector instruction. If there were a necessary runtime invoke in the middle of the loop, it would be very unsafe to vectorize it. Because LLVM chooses where to put the Safepoint, it can simply place it after the vectorization. This reduction in IR size enables the inliner to do things that were not even remotely possible before we had made it.

Nonnull And Inter-Procedural Optimization
--------------------------------

A number of ASP.NET-relevant benchmarks informed us that we had some problems with our inter-procedural optimization story. The integers passed to functions seemed to be correctly considered by LLVM when deciding on dead code elimination during inlining, but managed strings and newly-allocated objects posed an issue. They could potentially be `null`, and LLVM had no way of knowing otherwise.

String constants are represented in a special way in our IR. So are the calls to allocate new objects. Both of these were given the LLVM attribute `nonnull`. This annotation, when applied to function parameters, would lead to comparisons against NULL being simplified and dead code removed by LLVM. The problem is that LLVM refused to say that because all of our call sites declare an argument `nonnull`, that the function parameter should get that attribute. This makes sense. The runtime doesn’t even know that it’s safe to do. What if the method were reflected, and `null` were passed in that argument position?

The answer to that problem came from working at the level of managed IR. The Mono project has a [linker](https://github.com/mono/linker/) that we used to remove uncalled methods from compiled assemblies. This also finds all callers of a method through reflection. Limitations in static reflection reverse-engineering (the halting problem!) means that we have manual annotation fallbacks there which are already in use. Therefore, we added a mode to the linker that annotates the methods that are not reflected in the program. The code generator can then do inter-procedural optimization by marking arguments with `nonnull` attributes when the call sites allow it.

Where this is expected to have the most impact is on the WebAssembly platform. WASM forces all code to do explicit null checks. This backend improvement identifies many of the unnecessary null checks and optimizes them out.

Alias Analysis
--------------------------------

One of the more frustrating things for an optimizer is having a pointer with no definite story of where it came from. As soon as the optimizer sees it being accessed, it has to declare that it doesn’t have complete certitude that other memory didn’t just go wrong. Pointer loads can’t be cached in registers, instead creating repeated loads that can stress the cache hierarchy.

Mono, unfortunately, created such a dangerous creature every time we needed to access a string, make an indirect function call, allocate an object, or interact with the runtime. All of our loads from the runtime-code interop table (called the Global Offsets Table) were interpreted as loading an integer. If it actually was a pointer (most of the time), we had to do a cast. This cast convinced the optimizer to simply give up. Likewise, the pointers returned from objects created with ‘new' were potential aliases of other objects on the stack.

Our first fix was to mark the pointers returned from allocation functions as `noalias`. This is a very strong restriction on a function, promising that every time we call it we get a new pointer. Those semantics almost assure that only allocators return a `noalias` pointer. Secondly, we turned the interop table into a giant, typed struct. All of the reads were then given the correct type. These two changes removed many `inttoptr` and `bitcast` LLVM operations, making alias analysis a lot more tractable.

IR Analysis And Readability
--------------------------------

Performance isn’t the only reason to have code that clearly communicates what it wants to accomplish.

Whether a computer or a human, reading LLVM IR before these changes could be difficult. We had a lot of extra GC Safepoint calls. All function calls were through a table mutated at runtime. All resource loads from that table are followed by lots of casts and conversions with their own set of widening (or not) semantics. There are null checks around everything, even accessing memory that was just allocated. Filtering the signal from the noise is slow, arduous, and error-prone.

These improvements leave the IR looking a lot closer to a C equivalent of the managed code, with statements correlating much easier. This makes it easier to feed the output of AOT into the tools in the larger LLVM ecosystem. For instance:

   - http://seahorn.github.io is a static analysis framework for LLVM IR that now sees a lot more of the call graph and dataflow in the program.
   - https://polly.llvm.org is a global loop and memory access optimizer. For the same reasons that these changes stop obfuscating our loops for LLVM, they also help other loop analyzers.
   - https://github.com/google/souper is a code scheduler and optimizer that uses experimental methods to generate better IR at the lowest levels. By fixing our alias analysis and removing GC Safepoint calls, we increase the length of sequences of code to be optimized and allow it to have confidence in the lifetimes of variables it sees.


Conclusion
--------------------------------

So I hope that I’ve convinced you that LLVM really is magic. Very specific incantations have to be said at very specific times, in just the right way, to unlock immense speed and power. Picture the Sorcerer’s Apprentice from Fantasia.

Our incantations were pretty good for the longest time. They produced quality code, but they got in the way of LLVM seeing the whole big picture. Going forward, we aspire to generate native code that really shows off what the LLVM backend is capable of. When it’s able to get a clear perspective of what the developer intended, LLVM really is magic. By making that translation clearer, we aspire to put that power in everyone’s hands.

