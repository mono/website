---
title: Projects
redirect_from:
  - /StudentProjects/
  - /GSoC/
---

This is the Mono Project's project ideas page. For general information and rules about participating in
[Google Summer of Code (GSoC)](http://code.google.com/soc/) for the Mono Project, please see our
[overview page](/community/google-summer-of-code/).

This page lists some ideas for Mono GSoC projects that students can apply for. Additionally, we encourage students
to submit their own interesting Mono-related project proposals. In past years, roughly 20% of the accepted
proposals were original ideas from students instead of from our suggestions. You can submit more than one proposal,
so you can submit your own ideas as well as apply for one from this list - but only one can be chosen, of course!

You can use the following links to jump to sections that you're interested in:

**[MonoDevelop / Xamarin Studio IDE](#monodevelop--xamarin-studio-ide)**

Help developers build applications by improving the cross-platform MonoDevelop / Xamarin Studio IDE

* [MonoDevelop code complexity metrics](#monodevelop-code-complexity-metrics)
* [Unit tests code coverage visualised inside MonoDevelop editor](#unit-tests-code-coverage-visualised-inside-monodevelop-editor)
* [Code Contracts Support](#code-contracts-support)
* [Improve Auto-Documentation System](#improve-auto-documentation-system)
* [Visual Basic with Roslyn in MD](#visual-basic-with-roslyn-in-md)
* [Overhaul MonoDevelop C/C++ addin](#overhaul-monodevelop-cc-addin)
* [Support for Symbol Servers](#support-for-symbol-servers)
* [Lambda support in debugger expression evaluator](#lambda-support-in-debugger-expression-evaluator)
* [Reuse MonoDevelop Roslyn compilation to perform compile](#reuse-monodevelop-roslyn-compilation-to-perform-compile)
* [Debugging disassembled code could use C# decompiler to generate source](#debugging-disassembled-code-could-use-c-decompiler-to-generate-source)

**[Compilers and Tools](#compilers-and-tools)**

Work on Mono's tools and compilers

* [A ccache-like tool for managed languages](#a-ccache-like-tool-for-managed-languages)

**[Mono Runtime](#mono-runtime)**

Improve the core Mono runtime and JIT

* [Sgen improvements](#sgen-improvements)
* [Succinct data structure implementations to replace glib dependencies](#succinct-data-structure-implementations-to-replace-glib-dependencies)
* [Allocator for sgen blocks](#allocator-for-sgen-blocks)
* [Improve our dynamic checking mode](#improve-our-dynamic-checking-mode)
* [Improve sgen debugging](#improve-sgen-debugging)
* [Implement Reflection.Emit Save support using ikvm.reflect.](#implement-reflectionemit-save-support-using-ikvmreflect)
* [Make sgen's binary protocol a general purpose runtime tool](#make-sgens-binary-protocol-a-general-purpose-runtime-tool)
* [LLVM Sanitizers](#llvm-sanitizers)
* [Implement a LLDB plugin that can understands the mono runtime](#implement-a-lldb-plugin-that-can-understands-the-mono-runtime)
* [JIT optimizations](#jit-optimizations)
* [Extend the profiler](#extend-the-profiler)
* [Lightweight pinvoke-debugging](#lightweight-pinvoke-debugging)
* [RR integration](#rr-integration)
* [Statistical analysis tool for flaky tests](#statistical-analysis-tool-for-flaky-tests)
* [Implement Clang static analyser checkers that would verify runtime invariants](#implement-clang-static-analyser-checkers-that-would-verify-runtime-invariants)

**[Microsoft .NET and Mono integration](#microsoft-net-and-mono-integration)**

Work on blending the worlds of open source .NET and Mono projects together

* [Import ThreadPool from CoreRT](#import-threadpool-from-corert)
* [Import System.IO.FileStream from CoreFX](#import-systemiofilestream-from-corefx)
* [Import Process from CoreFX](#import-process-from-corefx)
* [Import reference source System.Web* assemblies](#import-reference-source-systemweb-assemblies)

**[Platforms and Bindings](#platforms-and-bindings)**

Bindings to native toolkits and libraries, including GTK#, Xamarin.Android, Xamarin.iOS, Xamarin.Mac and UrhoSharp

* [CppSharp / Maintenance & Improvement tasks](#cppsharp--maintenance--improvement-tasks)
* [CppSharp / Continue Mono/.NET bindings for Qt](#cppsharp--continue-mononet-bindings-for-qt)
* [Support building Xamarin.Android on Windows](#support-building-xamarinandroid-on-windows)
* [Port Xamarin.Android unit tests to xUnit](#port-xamarinandroid-unit-tests-to-xunit)

**[Other Ideas](#other-ideas)**

Suggest your own ideas for a project

**[Contacting the Mono Team](#contacting-the-mono-team)**

How to get in touch with us and ask questions

## MonoDevelop / Xamarin Studio IDE

### MonoDevelop code complexity metrics

**Complexity:** Medium

Code complexity metrics are a tool for helping to make your code easier to understand.

This project will use a code metrics library called [ArchiMetrics](https://github.com/jjrdk/ArchiMetrics). It's based on Roslyn, the same C# parsing/analysis/compilation library that we already use inside MonoDevelop, so should be straightforward to integrate.

Your proposal should describe how you plan to integrate the code metrics inside the IDE. For example, you may use tooltips, pads, [markers in the editor](http://netcodemetrics.codeplex.com), CodeLens, or any other means of displaying the metrics in a way that is informative and useful. It is strongly suggested that you investigate approaches that other IDEs such as Visual Studio, Eclipse and IntelliJ have taken.

**Deliverables**: A code metrics addin for MonoDevelop that integrates multiple metrics in a useful way.

**Mentors:** Mike Krüger

### Unit tests code coverage visualised inside MonoDevelop editor

**Complexity:** Easy

The Mono runtime supports outputting an xml file containing information about which lines were executed. This could be used to collect code coverage information when running unit tests, which could be visualized in the text editor.

This project would involve adding support to the MonoDevelop.UnitTesting AddIn to collect code coverage information when running tests, and to display that information visually in the editor.

**Deliverables**: Add support to MonoDevelop to collect code coverage information when running tests, and display it visually in the text editor.

**Mentors:** Iain Holmes, Kirill Osenkov

### Code Contracts Support

**Complexity:** Medium

The goal of this project is to add Code COntracts support to Mono using the open-source [.NET Code Code Contracts support](https://github.com/Microsoft/CodeContracts).

For more information, see:

* [https://msdn.microsoft.com/en-us/library/dd264808%28v=vs.110%29.aspx](https://msdn.microsoft.com/en-us/library/dd264808%28v=vs.110%29.aspx)
* [http://research.microsoft.com/en-us/projects/contracts/](http://research.microsoft.com/en-us/projects/contracts/)

This is a technology that is made of four components:

* APIs in mscorlib that are used to specify things like preconditions and post conditions
* The use of these APIs in user code
* Tools to modify binaries to insert/remove code contracts instrumentation
* IDE support for the tools.

We have already done the first step, and as we import more code from .NET, the second step will be done for us in the core libraries.

This task focuses on two things:

* Porting the tools to modify binaries to insert/remove code
* IDE support for the tools

The first step should be relatively simple.   The code is open source, and might require some minimal changes to run on Unix with Mono.

The second step includes extending the MonoDevelop IDE to add the configuration options to use Code Contracts and call the code contract tools at the appropriate times. The UI looks like the attached screenshot, and under the hood it works using MSBuild targets.

**Deliverables**: Code contracts tools working on Mono and integrated into MonoDevelop.

**Mentors:** Aleksey Kliger

### Improve Auto-Documentation System

**Complexity:** Medium

MonoDevelop has an addin that automatically generates documentation comments based on the member types and  naming conventions. This is very useful, as it gets the boilerplate out the way leaving more time for the developer to add meaningful details.

However, sometimes its assumptions do not hold and the resulting docs  do not make sense. Although this is funny, we would like to fix it.

This is an ideal project for a student interested in linguistics, parsing & understanding natural language.

Your proposal should describe the approaches you intend to use to fix the issue, and a number of cases where the generated docs could be improved.

**Deliverables:** Fix the docs generation for the cases covered in your proposal.

**Mentors:** Mike Krüger

### Visual Basic with Roslyn in MD

**Complexity:** Medium

Overhaul the VB language binding addin or rewrite it from scratch and
make use of the full VB .NET support in Roslyn (without mono-basic). The CSharpBinding addin is a good starting point and reference.

Main goals:

* Compatibility with Visual Studio projects
* Panels for editing all project options
* Updated project templates
* Integration into the MonoDevelop type system
* Code completion ported from Roslyn EditorFeatures
* Other standard IDE language integration (code folding, document outline, symbol tooltips, Find References, etc)

Optional:

* Mac/Linux support (depends on MSBuild and Roslyn compilers being included in Mono)
* VB.NET source analysis
* VB.NET refactorings ported from Roslyn EditorFeatures
* Semantic highlighting

**Deliverables**: VB.NET support in MonoDevelop with updated project options and templates, and Roslyn-based code completion

**Mentors:** Vsevolod Kukol

### Overhaul MonoDevelop C/C++ addin

**Complexity:** Medium

The [MonoDevelop C/C++ addin](https://github.com/mhutch/cbinding) was substantially updated as part of Summer of Code 2015. However, there are still many things that could be done to improve it!

There's far more than could be done in a single Summer of Code, so feel free to pick and choose from the list of tasks when writing your proposal:

* detect missing dependencies (libclang, CMake etc) and prompting the user to install them
* improve the code completion and add a test suite
* adding various refactorings
* integrating the [Clang Source Analyzer](https://clang-analyzer.llvm.org)
* improving the GDB debugger integration
* integrating the LLDB debugger
* making the addin usable on Windows with msvc, clang and/or mingw32 gcc
* improving the file and project templates
* anything else you can think of!

Your proposal can include any of that you find interesting and feel can be realistically be completed in addition to the core tasks.

**Deliverables:** a set of improvements to the C/C++ addin, as specified in your proposal

**Mentors:** Mikayla Hutchinson

### Support for Symbol Servers

**Complexity:** Hard

Support for downloading symbol packages from symbol servers on demand and using them in the debugger. This is primarily useful for NuGet.

Making this work will require implementing support for handling debugger symbols on the client (IDE) side instead of the debugger agent.

**Deliverables**: Support for downloading symbol packages and using them when debugging apps.

**Mentors:** David Karlas

### Lambda support in debugger expression evaluator

**Complexity:** Hard

Support for lambdas in the MonoDevelop debugger's expression evaluator, used in the Immediate pad. This will require compiling the lambdas locally and uploading them to the debuggee.

Roslyn has [support for compiling expressions](https://github.com/dotnet/roslyn/tree/master/src/ExpressionEvaluator) that could be used as a basis for this.

**Deliverables**: Support for lambdas in the Immediate pad.

**Mentors:** David Karlas, Kirill Osenkov

### Reuse MonoDevelop Roslyn compilation to perform compile

**Complexity:** Medium

MonoDevelop now uses the Roslyn compiler for its type system, and keeps fully updated Roslyn compilations in memory. It should be possible when building for the build engine to connect back the the IDE and use the existing Roslyn compilations for code generation, in the same way that Visual Studio does. This will greatly improve compile time during development.

This will require implementing the MSBuild ICscHostObject interface in the MonoDevelop build system and having the Csc build task delegate the code generation to the in-process compiler.

**Deliverables**: Fully implement ICscHostObject in the MonoDevelop build system, including tests.

**Mentors:** David Karlas, Kirill Osenkov

### Debugging disassembled code could use C# decompiler to generate source

**Complexity:** Medium

MonoDevelop already has IL->C# logic, and the debugger already supports stepping into methods without code. These two components have to be combined to give a user the option to see C# code instead of IL when stepping into methods without source code.

**Deliverables:** Ability to see C# instead of IL when debugging methods without source code.

**Mentors:** David Karlas, Kirill Osenkov

## Compilers and Tools

### A ccache-like tool for managed languages

**Complexity:** Medium

C-based languages (C/C++/Objective-C) have ccache to cache results of compilations to make rebuilds faster.

It would be nice to have something similar for C#/VB/F#.

This can be used as a starting point to identify the set of inputs for C#/VB:
[https://github.com/dotnet/roslyn/blob/master/docs/compilers/Deterministic%20Inputs.md](https://github.com/dotnet/roslyn/blob/master/docs/compilers/Deterministic%20Inputs.md)

ccache (for reference): [https://github.com/ccache/ccache](https://github.com/ccache/ccache)

**Deliverables**: a functional tool for C# that works on linux + mac, with a test suite, and is able to cache/lookup everything during a (re)build of the mono BCL.

**Mentors:** Rolf Bjarne Kvinge

## Mono Runtime

### Sgen improvements

**Complexity:** Medium

List of SGen projects to consider:

* Store-replacing write barrier
* Crash-safe process/heap dump & analysis tool
* Improve our canaries (better handle nursery & AOT)
* Improve heap checker to handle roots
* Reduce the number of roots the runtime register (types and threads)

Your proposal proposal may include one of these or a combination of several of them.

**Deliverables**: the sgen improvements described in your proposal, passing all tests.

**Mentors:** Jonathan Purdy, Vlad Brezae

### Succinct data structure implementations to replace glib dependencies

**Complexity:** Medium

Bitmask-driven data structures allow for SIMD operations on the data structure's top-level structure schema. They're space-efficient, cache-efficient, and they're easy to debug after a crash because the bitmask and the data structure have a minimal number of pointers.

Offering succinct arrays (no nulls) and other data structures as drop-in replacements might be ways to significantly reduce memory footprint for some specific use cases.

Benchmarking is necessary to find those use-cases.

Deliverables:

* Implement full replacement for GArray and ensure passes GLib GArray tests.

* Benchmark high-allocation places and see if the succinct replacement helps

* (Optional) Implement replacement for ghashtable which supports bare minimum of operations, using CTries

* (Optional) Use CTries in high-contention environments or high-allocation environments and benchmark uses that have savings

**Mentors:** Alexander Kyte

### Allocator for sgen blocks

**Complexity:** Hard

Most of the objects in sgen are allocated in major blocks. We don't allocate the blocks in an organised way, we allocate them in chunks and free them individually. This leads to incapability of freeing them on some targets, virtual space fragmentation and bad structure.

We need to allocate blocks in well determined contiguous regions that we can keep track of and have sgen's compaction mechanism account for this structure.

**Deliverables** : Implement an allocator for sgen blocks

**Mentors:** Vlad Brezae

### Improve our dynamic checking mode

**Complexity:** Medium

One way we're improving how we test mono is by having a build mode with a lot of extra checks done.

This project would extend it with some number of the following improvements, to be specified in your proposal:

* Integrate the existing offline lock checker tool into checked builds
* Extend the memory management audit points to more places
* Continue the work of verifying memory stores
* Optimize the mm checker
* Add fault injection mode [1]
* Add do-a-lot mode [2]
* Implement other checked modes (TBD)

[1] It's very hard to produce test cases for a lot of failure conditions, so injecting faults instead is a much easier way to test those paths.

[2] Some important, but rarely done, runtime mechanisms are not well tested since they naturally happen very rarely. The idea is to identify a few and have a checked-build mode that triggers then *A LOT*.

**Deliverables**: Implement the dynamic checking mode improvements listed in your proposal.

**Mentors:** Jonathan Purdy, Andi Mcclure

### Improve sgen debugging

**Complexity:** Medium

In order to debug issues with our garbage collector, we have a set of functions that we invoke (at runtime or from gdb) in order to check the state of the heap.

We encounter problems with these debugging functions crashing on invalid heap states (we need safe dereferencing of invalid pointers and recovering) or not being fully supported on all configurations.

**Deliverables**: Make debug functions crash safe. Expand support for nursery canaries.

**Mentors:** Vlad Brezae

### Implement Reflection.Emit Save support using ikvm.reflect

**Complexity:** Medium

Currently, the support for saving assemblies when using Reflection.Emit is implemented in the runtime using C code that directly fills mono runtime metadata. Since this code is rarely used nowadays, and it duplicates the well maintained IKVM.reflect, this task should reimplement this functionality by using IKVM.reflect to generate a byte blob which then can be passed to the runtime (e.g. as a method implementation) instead of directly populating internal runtime types.

This would make the runtime smaller by removing error prone C code, etc.

One approach is to implement System.Reflection.Emit.AssemblyBuilder.Save () by traversing the SRE objects and convert them into IKVM.Reflect objects and then use the IKVM.reflect AssemblyBuilder.Save to write the assembly to disk.

Additionally, this is an opportunity to expand our System.Reflection.Emit test suite.

**Mentors:** Aleksey Kliger

### Make sgen's binary protocol a general purpose runtime tool

**Complexity:** Medium

SGen's binary protocol proved to be an invaluable troubleshooting tool.

It's a flight-recorder kind of tool that should be accessible for all part of the runtime.

This project is to extract it from sgen and make it a general purpose tool for the runtime.

In addition, it should add probes for a few runtime facilities:

* threadpool events
* JIT activity
* ???

A good use case would be to use it to replace the runtime's dtrace probes.

Additionally, improving the tooling around processing binprot files can be part of this project.

**Deliverables**: Extract the binary protocol from sgen and use it to replace the runtime's dtrace probes.

**Mentors:** Vlad Brezae, Jonathan Purdy

### LLVM Sanitizers

**Complexity:** Medium

Integrate the LLVM sanitizers into the runtime.

This includes a series of tasks:

* Extend the JIT to emit read barriers when loading from the heap.
* At runtime, load the tsan library and hook it using read/write barriers.

An additional goal would be to figure out how to have tsan reports include C# debug information.

**Deliverables**:  Basic integration of tsan

**Mentors:** Alexander Kyte, Rodrigo Kumpera

### Implement a LLDB plugin that can understands the mono runtime

**Complexity:** Hard

LLDB support plugins and we should write one that exposes as much as possible of the runtime. A few ideas:

* object layout, introspection and heap walking
* unwinding and symbolifying managed methods
* lookup line information for managed methods
* pretty print all runtime structs
* threadpool introspection?

Note that some work on this has been done already and can be found [here](https://github.com/mono/lldb) and [here](https://github.com/mono/lldb-binaries).

**Deliverables:** One or more of the above bullet points, as listed in your proposals.

**Mentors:** João Matos, Zoltan Varga

### JIT optimizations

**Complexity:** Hard

There are a few JIT optimizations that we could profile from:

* type propagation. Right now we perform zero type propagation in the JIT, leading to a lot of missed opportunities.
* delayed/iterated inlining & casting. Allow those to be performed after method-to-ir. This would allow us to do a TON of VERY profitable strength reduction.

**Deliverables**: Implementation of a JIT optimization from the above list, or another of your suggestion. Must pass all unit tests.

**Mentors:** Rodrigo Kumpera, Bernhard Urban

### Extend the profiler

**Complexity:** Medium

The runtime profiler module could use some love.

Here are a few projects that students could tackle:

* Prefix compression of stacks. Most stack traces, specially the big ones, share a lot in common. The idea is to LZ this puppy.
* Add tagging to the profiler and the runtime API (and then at least to objects and gchandles). Tags allow the runtime or an embedder to report interesting objects to the profiler.
* Add tracepoints to the profiler and instrument a few places in the runtime and BCL.

**Deliverables**: Implement one the suggested projects, including tests.

**Mentors:** Rodrigo Kumpera

### Lightweight pinvoke-debugging

**Complexity:** Medium

Right now, a customer is free to pinvoke into a bad function and destroy data structures. Are there runtime debugging things we can do to prevent this from seeming like a mono bug to the customer?

If pinvoke were to use memmap to get a pointer that could not be written to, we could prevent unintended writes from unmanaged code from silently happening.

Valgrind integration might be a non-invasive way to do this too.

Lastly, we could always just hash and re-verify our mempools before and after pinvokes. These ideas and others could be explored by a student with the right background.

I would mentor this project. Worth noting, this would probably be a specific "debug mode". I can't imagine this being overhead-free.

Deliverables:

* Produce tests cases with common pinvoke usage errors that corrupts runtime/managed memory

* Create a debug mode (a flag for MONO_DEBUG) that would detect one or more of the identified cases at runtime. Detection means aborting the runtime with enough context to help the user identify the faulty code.

* Reporting of issues in user-friendly way

**Mentors:** Alexander Kyte

### RR integration

**Complexity:** Medium

RR is a debugger that allows for recording of execution in a way that can be replayed later in a debugger. The results of syscalls are fed back into the program to replicate the environment the program saw over time.

The runtime can be debugged with RR on linux, but this is mostly useful for low-level debugging.

We have two options here: We can expose managed logging and heap/stack snapshotting to the debugger-agent and do this is a managed way. This allows us to work on ARM, linux, windows, ios, etc. The downside is that we don't get to replay state changes in unmanaged code.

Alternatively, we can have the student create glue code for using rr to debug the entire runtime remotely, and add in the hooks to get the information on managed methods from the runtime. Someone can then record a crash on their machine as it is happening, and submit it with a bug report.

I believe that the latter idea would make bug reports an order of magnitude more useful. By removing the difficulty of reproducing crashes, we may save our own developers a lot of time.

Deliverables:

* Get RR debugging of mono working interactively
* Create automated RR client that records and replays mono
* Create infrastructure to use RR client and create self contained "debug me" blob

**Mentors:** Alexander Kyte, Rodrigo Kumpera

### Statistical analysis tool for flaky tests

**Complexity:** Medium

Flaky tests are not like normal tests. They fail when execution races in such a way as to make assumptions fail. They usually do not indicate a bug in the runtime itself.

Flaky tests have distinctive behavior that is different from normal tests. Across all tests, they'll go from failing to green to failing with a regularity that is independent of the changes made to the commit. Flaky tests will also not fail together in the same way as code broken by a change that breaks a subsystem.

It can and has become a statistical discipline.
[https://www.youtube.com/watch?v=CrzpkF1-VsA](https://www.youtube.com/watch?v=CrzpkF1-VsA)

We want both a tool which is general-purpose for C# projects and a flake analysis of the BCL as a C# project.

A statistical analysis of flakes would allow us to avoid re-running every failure, would allow us to indicate that a failure to a flaky test is probably genuine, and would bring some suggestions and sanity to our build output.

Deliverables:

* Create tools (not running services!) that collect historical global test coverage changes across all master builders. Have them emit an XML summary. This can be slow, as long as it is tractable.

* Study the statistical properties of flaky tests, and study the classes of flaky tests in the mono BCL that are linked to one another. Perhaps better understand the flakes that will flaky together or will only genuinely fail together.

* Create a nunit patch that can detect if the current test is in an XML file which lists the flaky tests, and how to behave for each flake

**Mentors:** Andi Mcclure, Alexander Kyte

### Implement Clang static analyser checkers that would verify runtime invariants

**Complexity:** Medium

Clang static analyser support writing custom rules.

Add new rules that understand idioms in the runtime (and maybe extra hints on it) to verify multiple conditions:

* Managed exception cleaningness;
* Managed allocation OOM handling;
* Correct lock ordering;
* GC invariants;
* AppDomain invariants;

Together with the clang work, this project should annotate the runtime to verify those properties as needed.

**Deliverables:** One or more of the above bullet points.

**Mentors:** Jonathan Purdy

## Microsoft .NET and Mono integration

Microsoft open sourced large chunks of code the past couple of years:

* ReferenceSource: the source code for the class libraries of .NET as it ships on Windows
* CoreFX: a fresh take on the distribution of the class libraries for a new, slimmer, smaller runtime
* CoreCLR: their C/C++ based runtime, JIT, GC for running on Mac, Linux and Windows
* Roslyn: Microsoft's C# and VB compiler as a service
* CodeContracts: the tools needed to instrument your code

We are tracking various ideas in the [.NET Integration in Mono](https://trello.com/b/vRPTMfdz/net-framework-integration-into-mono) trello board.

### Import ThreadPool from CoreRT

**Complexity:** Medium

`System.Threading.ThreadPool` is the main class that allow users to launch background tasks, and it's one of the component that the TPL is based on. It's a core component of Mono and the .NET platform. Its quality and reliability is key to a stable and fast development platform.

The goal is to replace our BCL implementation of [`System.Threading.ThreadPool`](https://github.com/mono/mono/blob/master/mcs/class/referencesource/mscorlib/system/threading/threadpool.cs), with the [CoreRT one](https://github.com/dotnet/corert/blob/master/src/System.Private.CoreLib/src/System/Threading/ThreadPool.cs). This would allow us to get closer to .NET Core code quality and behaviour.

All changes made to adapt `System.Threading.ThreadPool` to Mono would then be upstreamed to the .NET foundation [CoreRT repo](https://github.com/dotnet/corert)

**Deliverables**: Integrate `ThreadPool` from CoreRT into Mono and upstream any necessary changes.

**Mentors:** Ludovic Henry

### Import System.IO.FileStream from CoreFX

**Complexity:** Medium

`System.IO.FileStream` is the main class that allow users to read and write to files, pipes and consoles. It's a core component of Mono and the .NET platform. Its quality and reliability is key to a stable and fast development platform.

The goal is to replace our BCL implementation of [`System.IO.FileStream`](https://github.com/mono/mono/blob/master/mcs/class/corlib/System.IO/FileStream.cs), with the [CoreFX one](https://github.com/dotnet/corefx/blob/master/src/System.IO.FileSystem/src/System/IO/FileStream.cs). This would allow us to get closer to .NET Core code quality and behaviour.

All changes made to adapt `System.IO.FileStream` to Mono would then be upstreamed to the .NET foundation [CoreFx repo](https://github.com/dotnet/corefx)

**Deliverables**: Integrate `FileStream` from CoreFX into Mono and upstream any necessary changes.

**Mentors:** Ludovic Henry

### Import Process from CoreFX

**Complexity:** Medium

`System.Diagnostics.Process` is the main class that allow users to launch and access other processes. It's a core component of Mono and the .NET platform. Its quality and reliability is key to a stable and fast development platform.

The goal is to replace our BCL implementation of [`System.Diagnostics.Process`](https://github.com/mono/mono/blob/master/mcs/class/System/System.Diagnostics/Process.cs), with the [CoreFX one](https://github.com/dotnet/corefx/blob/master/src/System.Diagnostics.Process/src/System/Diagnostics/Process.cs). This would allow us to get closer to .NET Core code quality and behaviour.

All changes made to adapt `System.Diagnostics.Process` to Mono would then be upstreamed to the .NET foundation [CoreFx repo](https://github.com/dotnet/corefx)

**Deliverables**: Integrate `Process` from CoreFX into Mono and upstream any necessary changes.

**Mentors:** Ludovic Henry

### Import reference source System.Web* assemblies

**Complexity:** Medium

Mono has its own implementation of the System.Web assemblies. Microsoft has open-sourced their Reference Source implementation. We would like to replace Mono's existing implementation with Reference Source in order to increase compatibility, and fix bugs and missing features..

**Deliverables**: integrate the Reference Source System.Web.* assemblies into Mono, passing Mono test suite on Windows and Unix.

**Mentors:** Marek Safar

## Platforms and Bindings

### CppSharp / Maintenance & Improvement tasks

**Complexity:** Medium

CppSharp has been getting very popular and users have found numerous bugs and missing features. In addition, many people prefer directly downloading binaries which CppSharp only has available to certain platforms.

This task is going to present the student with a large list of these three types of relatively short tasks. The goal is to complete as many of them as possible, along with unit tests where applicable.

The tasks are listed at [https://github.com/mono/CppSharp/issues](https://github.com/mono/CppSharp/issues). The list below contains a few examples of each type of task:

* features – switch from explicit to sequential layouts which would allow other features, such as universal C bindings, to be implemented; add support for STD containers; handle parameters of type array;
* bugs – correctly patch virtual tables of 64-bit Itanium libraries; fix the support for std::string; handle partially defined structs in C;
* deployment – add 32-bit NuGet for Windows; publish binaries for Linux and macOS by getting them directly from our Travis CI; add 64-bit Windows and macOS build to that same CI.

Related code:
[https://github.com/mono/CppSharp](https://github.com/mono/CppSharp)

Feel free to get in touch with @tritao if you’re interested in this and would like more guidance.

**Deliverables**: C++ and C# code which resolves as many tasks as possible, along with a unit test for each task unless it belongs to the deployment type.

**Mentors:** João Matos

### CppSharp / Continue Mono/.NET bindings for Qt

**Complexity:** Hard

As part of this task you’ll need to continue the bindings effort for the Qt framework so that it can be used with Mono/.NET languages such as C#, similar to the existing bindings of GTK# for GTK+.

QtSharp has reached alpha status and it needs the final improvements to make it a complete product. The necessary work can be broken down into five categories:

* Type maps for basic types – mostly because of the relatively new support for wrapping templates, QtSharp still only has a type map for QString ↔ string. Many other basic type maps are necessary for an opitmal coding experience. Deliverables: The following type maps: QList<>, QVector<> ↔ List<>; QMap<,>, QHash<,> ↔ Dictionary<,>; and QChar<> ↔ char.
* Qt Quick support –  enables writing of Qt Quick applications using C#. Deliverables: the ability to include QML files in the application (an integrated in Visual Studio/MonoDevelop editor is not included, for now external editors such as Qt Creator will have to be used) and working interaction between C# and QML (property changes and emitting of signals in QML must call the corresponding C# code);
* Documentation package – online and off-line documentation for QtSharp. Deliverables: A compressed directory containing a complete DOxygen documentation package for QtSharp. The documentation itself is generated as XML code comments which DOxygen then takes from the source files and uses a configuration file to generate the package.
* Binaries – users must be able to download binaries for each platform QtSharp currently supports, namely all three major desktop platforms – Windows, Linux and OS X. Deliverables: Build scripts to produce and upload Qt# binaries.
* Auto-memory management – this feature is deliberately last in the list because it may or may not be reasonable. The problem is that the only way to implement it is to use managed destructors to call their native counterparts, and the former are, in short, not guaranteed to be called. In long, each managed destructor (or finaliser) must take less than two seconds of execution time and all finalisers combined must take less than forty. If either condition fails, the VM terminates the process without calling the remaining finalisers([source 1](https://blogs.msdn.microsoft.com/oldnewthing/20100809-00/?p=13203), [source 2](http://blog.stephencleary.com/2009/08/finalizers-at-process-exit.html)) which would lead to leaks in native memory. On the other hand, if the bindings are correct, a finaliser would only take an instant so the time limit should be more than enough for all of them. Basically, it can be done but it really is a stretch of the capabilities of the VM, so what's certain is that this task must be left last – if implemented at all. Deliverables: Generation of managed destructors (finalisers) to call their native counterparts in order to free the memory allocated for the native part of wrapped objects.

Related code:

* [https://github.com/mono/CppSharp](https://github.com/mono/CppSharp)
* [https://gitlab.com/ddobrev/QtSharp](https://gitlab.com/ddobrev/QtSharp)
* [https://techbase.kde.org/Development/Languages/Qyoto](https://techbase.kde.org/Development/Languages/Qyoto) – obsolete bindings for Qt which can however give some ideas, for example for type maps

Feel free to get in touch with @tritao if you’re interested in this and would like more guidance.

**Deliverables:** Improve the Qt bindings generator to the point that they can be used for a non-trivial Qt sample written in idiomatic C#, with and without QML.

**Mentors:** João Matos

### Support building Xamarin.Android on Windows

**Complexity:** Hard

Xamarin.Android uses MSBuild to "drive" the building of the product.

This does *not* mean that MSBuild is used for *everything*; many of the projects use the MSBuild `<Exec/>` task to invoke `configure`, `make`, `cmake`, and various other utilities to build various dependencies such as mono.

The GSOC project would be to improve the xamarin-android repo so that it can be built on Windows.

**Simplifications**: This *need not* include building the mono runtimes. Many -- but not all! -- dependencies are cached in a "bundle", to speed up build times. This bundle contains the mono runtimes for all supported architectures. The initial version of Windows build support should rely on this bundle, which (I assume) will drastically reduce the work required.

Which isn't to say that this will be *easy*. I don't expect this to be easy.

**Mentors:** Jonathan Pryor

### Port Xamarin.Android unit tests to xUnit

**Complexity:** Medium

.NET CoreFX/etc. use xUnit for unit tests. It would be useful if all our platforms could standardize on a single unit testing stack, presumably xUnit.

This task would require checking to see if xUnit is missing any features required by Xamarin.Android (e.g. `instrumentation`-based execution), migrate the existing unit tests to use xUnit, support on-device unit test execution and "downloading" of unit test results for display, and documentation of how it all works.

**Deliverables**: Port the Xamarin.Android unit tests to xUnit.

**Mentors:** Jonathan Pryor

## Other Ideas

If a project is not listed here, but you think you have a great idea, feel free to
[contact the Mono team, mentors and org admins](#contacting-the-mono-team) to discuss or suggest your own project ideas.

Over the past years we have picked projects that were not listed here because they were great ideas, and we had students
that were passionate about those projects. In the end, most of these projects were a success.

Do not be afraid to pick up a project that would be interesting and also help the Mono universe.

You can find some additional ideas on the
[Gnome ideas page](https://wiki.gnome.org/Outreach/SummerOfCode/2017/Ideas) (Mono-based projects in Gnome: Banshee, Blam, Tasque,
Tomboy, GBrainy, Mistelix, F-Spot, ChronoJump, SparkleShare, LongoMatch).

## Contacting the Mono Team

If you have questions or suggestions that you want to make in real-time and talk to a member of the team, please join us
on IRC on the server "irc.gnome.org" in channel "#monosoc", "#monodev" or the "#mono" channel. Various mentors and
students from past years are usually there and can answer some quick questions about the program and about Mono.

The mailing lists are a very important communication channel, students should use them to get more information and
feedback about ideas and proposals. Community engagement is essential for a successful summer of code, so get involved!

For any questions you may have about the program itself and to talk to the Mono GSoC admin, you can use
[soc@xamarin.com](mailto:soc@xamarin.com).

### Mailing Lists

[https://lists.dot.net/mailman/listinfo/mono-devel-list](https://lists.dot.net/mailman/listinfo/mono-devel-list)
A mailing list dedicated to discussions about developing Mono itself, such as development of the runtime, class libraries, and related Mono projects.

[https://lists.dot.net/mailman/listinfo/monodevelop-devel-list](https://lists.dot.net/mailman/listinfo/monodevelop-devel-list)
Discussion on the development/implementation of MonoDevelop.

A complete breakdown of all Mono mailing lists is available at [Mailing Lists](/community/help/mailing-lists/).
