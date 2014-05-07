---
layout: obsolete
title: "Mono:Runtime:Documentation:LLVM"
permalink: /old_site/Mono:Runtime:Documentation:LLVM/
redirect_from:
  - /Mono:Runtime:Documentation:LLVM/
---

Mono:Runtime:Documentation:LLVM
===============================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#LLVM_Backend">1 LLVM Backend</a>
<ul>
<li><a href="#Usage">1.1 Usage</a></li>
<li><a href="#Architecture">1.2 Architecture</a></li>
<li><a href="#Sources">1.3 Sources</a></li>
<li><a href="#The_LLVM_Mono_Branch">1.4 The LLVM Mono Branch</a>
<ul>
<li><a href="#Changes_relative_to_stock_LLVM">1.4.1 Changes relative to stock LLVM</a></li>
<li><a href="#Branches">1.4.2 Branches</a></li>
<li><a href="#Maintaining_the_repository">1.4.3 Maintaining the repository</a></li>
</ul></li>
<li><a href="#Restrictions">1.5 Restrictions</a>
<ul>
<li><a href="#Exception_Handlers">1.5.1 Exception Handlers</a></li>
<li><a href="#Generics_sharing">1.5.2 Generics sharing</a></li>
<li><a href="#Varargs">1.5.3 Varargs</a></li>
</ul></li>
<li><a href="#Implementation_details">1.6 Implementation details</a>
<ul>
<li><a href="#Virtual_calls">1.6.1 Virtual calls</a></li>
<li><a href="#Interface_calls">1.6.2 Interface calls</a></li>
<li><a href="#Unwind_info">1.6.3 Unwind info</a></li>
<li><a href="#Exception_Handling">1.6.4 Exception Handling</a></li>
</ul></li>
<li><a href="#Generic_Sharing">1.7 Generic Sharing</a></li>
<li><a href="#AOT_Support">1.8 AOT Support</a></li>
<li><a href="#Porting_the_backend_to_new_architectures">1.9 Porting the backend to new architectures</a></li>
<li><a href="#LLVM_problems">1.10 LLVM problems</a></li>
<li><a href="#Future_Work">1.11 Future Work</a>
<ul>
<li><a href="#Array_Bounds_Check_.28ABC.29_elimination">1.11.1 Array Bounds Check (ABC) elimination</a></li>
</ul></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

LLVM Backend
============

Mono now includes an experimental backend which compiles methods to native code using LLVM instead of the built in JIT.

Usage
-----

The llvm back end can be enabled by passing --enable-llvm=yes to configure. LLVM 2.6 or later is required.

Architecture
------------

The backend works as follows:

-   first, normal mono JIT IR is generated from the IL code
-   the IR is transformed to SSA form
-   the IR is converted to the LLVM IR
-   the LLVM IR is compiled by LLVM into native code

LLVM is accessed through the LLVM C binding.

The backend doesn't currently support all IL features, like vararg calls. Methods using such features are compiled using the normal mono JIT. Thus LLVM compiled and JITted code can coexist in the same process.

Sources
-------

The backend is in the files mini-llvm.c and mini-llvm-cpp.c. The former contains the bulk of the backend, while the latter contains c++ code which is needed because of deficiencies in the LLVM C binding which the backend uses.

The LLVM Mono Branch
--------------------

We maintain a fork/branch of LLVM with various changes to enable better integration with mono. The repo is at:

[http://github.com/mono/llvm](http://github.com/mono/llvm)

The LLVM backend is currently only supported when using this version of LLVM. When using this version, it can compile about 99% of mscorlib methods.

The GIT repo is forked from the unofficial LLVM git mirror at:

[http://github.com/earl/llvm-mirror](http://github.com/earl/llvm-mirror)

### Changes relative to stock LLVM

The branch currently contains the following changes:

-   additional mono specific calling conventions.
-   support for loads/stores which can fault using LLVM intrinsics.
-   support for saving the stack locations of some variables into the exception handling info emitted by LLVM.
-   support for stores into TLS on x86.
-   the LLVM version string is changed to signal that this is a branch, i.e. it looks like "2.8svn-mono".
-   workarounds to force LLVM to generate direct calls on amd64.
-   support for passing a blockaddress value as a parameter.
-   emission of EH/unwind info in a mono-specific compact format.

The changes consist of about 1.5k lines of code. The majority of this is the EH table emission.

To view all changes, use:

``` bash
git diff `git merge-base mirror/master mono`..mono
```

### Branches

-   'mono' is branched off mirror/master and contains our changes
-   'mono-\<VER\>' is a branch which work with mono version \<VER\>, i.e. 'mono-2.10' is a version which works with mono-2.10.

### Maintaining the repository

The 'mono' branch is maintained by regularly rebasing it on top of 'mirror/master'. This makes examining our changes easier. To merge changes from llvm-mirror to this repo, do:

``` bash
git remote add mirror http://github.com/earl/llvm-mirror.git
git checkout mono
git fetch mirror
git rebase mirror/master
<fix conflicts/commit>
git push origin mono:mono
```

Due to the rapid pace of development, and the frequent reorganization/refactoring of LLVM code, merge conflicts are pretty common, so maintaining our fork is time consuming. A subset of our changes can probably be submitted to upstream LLVM, but it would require some effort to clean them up, document them, etc.

Restrictions
------------

There are a number of constructs that are not supported by the LLVM backend. In those cases the Mono code generation engine will fall back to Mono's default compilation engine. Most of the restrictions are lifted when using Mono's LLVM branch.

### Exception Handlers

These are currently not supported when using stock LLVM, mainly because LLVM doesn't support implicit exceptions thrown by the execution of instructions.

An implicit exception is for example a NullReferenceException that would be raised when you access an invalid memory location, typically in Mono and .NET, an uninitialized pointer.

### Generics sharing

These are currently not supported when using stock LLVM.

The main problem here is the hidden rgctx argument passed to/received by generic shared methods. We can't force LLVM to pass this argument, which is passed in an extra non-ABI register in mono.

### Varargs

These are implemented using a special calling convention in mono, i.e. passing a hidden 'signature cookie' argument, and passing all vararg arguments on the stack. LLVM doesn't support this calling convention.

It might be possible to support this using the [LLVM vararg intrinsics](http://llvm.org/docs/LangRef.html#int_varargs).

Implementation details
----------------------

### Virtual calls

The problem here is that the trampoline handing virtual calls needs to be able to obtain the vtable address and the offset. This is currently done by an arch specific function named mono\_arch\_get\_vcall\_slot\_addr (), which works by disassembling the calling code to find out which register contains the vtable address. This doesn't work for LLVM since we can't control the format of the generated code, so disassembly would be very hard. Also, sometimes the code generated by LLVM is such that the vtable address cannot be obtained at all, i.e.:

     mov %rax, <offset>(%rax)
     call %rax

To work around these problems, we use a separate vtable trampoline for each vtable slot index. The trampoline obtains the 'this' argument from the registers/stack, whose location is dicated by the calling convention. The 'this' argument plus the slot index can be used to compute the vtable slot and the called method.

### Interface calls

The problem here is that these calls receive a hidden argument called the IMT argument which is passed in a non-ABI register by the JIT, which cannot be done with LLVM. So we call a trampoline instead, which sets the IMT argument, then makes the virtual call.

### Unwind info

The JIT needs unwind info to unwind through LLVM generated methods. This is solved by obtaining the exception handling info generated by LLVM, then extracting the unwind info from it.

### Exception Handling

Methods with exception clauses are supported, altough there are some corner cases in the class library tests which still fail when ran with LLVM.

LLVM uses the platform specific exception handling abi, which is the c++ ehabi on linux, while we use our home grown exception handling system. To make these two work together, we only use one LLVM EH intrinsic, the llvm.eh.selector intrinsic. This will force LLVM to generate exception handling tables. We decode those tables in mono\_unwind\_decode\_fde () to obtain the addresses of the try-catch clauses, and save those to MonoJitInfo, just as with JIT compiled code. Finally clauses are handled differently than with JITted code. Instead of calling them from mono\_handle\_exception (), we save the exception handling state in TLS, then branch to them the same way we would branch to a catch handler. the code generated from ENDFINALLY will call mono\_resume\_unwind (), which will resume exception handling from the information saved in TLS.

Implicit exceptions are implemented by adding a bunch of LLVM intrinsics to do loads/stores, and calling them using the LLVM 'invoke' instruction.

Instead of generating DWARF/c++ EHABI exception handling tables, we generate our own tables using a mono specific format, which the mono runtime reads during execution. This has the following advantages:

-   the tables are compact and take up less space.
-   we can generate a lookup table similar to .eh\_frame\_hdr which is normally generated by the linker, allowing us to support OSX/iOS, since the apple linker doesn't support .eh\_frame\_hdr.
-   the tables are pointed to by a normal global symbol, instead of residing in a separate segment, whose address cannot be looked up under OSX.

Generic Sharing
---------------

Generic Sharing is only supported when using the LLVM mono branch.

There are two problems here: passing/receiving the hidden rgctx argument passed to some shared methods, and obtaining its value/the value of 'this' during exception handling.

The former is implemented by adding a new mono specific calling convention which passes the 'rgctx' argument in the non-ABI register where mono expects it, i.e. R10 on amd64. The latter is implemented by marking the variables where these are stored with a mono specific LLVM custom metadata, and modifying LLVM to emit the final stack location of these variables into the exception handling info, where the runtime can retrieve it.

AOT Support
-----------

There is some support for using LLVM for AOT compilation. This is implemented by emitting the LLVM IR into a LLVM bytecode file, then using the LLVM llc compiler to compile it, producing a .s file, then we append our normal AOT data structures, plus the code for methods not supported by LLVM to this file.

A runtime which is not configured by --enable-llvm=yes can be made to use LLVM compiled AOT modules by using the --llvm command line argument: mono --llvm hello.exe

Porting the backend to new architectures
----------------------------------------

The following changes has to be made to port the LLVM backend to a new architecture:

-   Define MONO\_ARCH\_LLVM\_SUPPORTED in mini-\<ARCH\>.h.
-   Implement mono\_arch\_get\_llvm\_call\_info () in mini-\<ARCH\>.h. This function is a variant of the arch specific get\_call\_info () function, it should return calling convention information for a signature.
-   Define MONO\_CONTEXT\_SET\_LLVM\_EXC\_REG() in mini-\<ARCH\>.h to the register used to pass the exception object to LLVM compiled landing pads. This is usually defined by the platform ABI.
-   Implement the LLVM exception throwing trampolines in exceptions-\<ARCH\>.c. These trampolines differ from the normal ones because they receive the PC address of the throw site, instead of a displacement from the start of the method. See exceptions-amd64.c for an example.
-   Implement the resume\_unwind () trampoline, which is similar to the throw trampolines, but instead of throwing an exception, it should call mono\_resume\_unwind () with the constructed MonoContext.

LLVM problems
-------------

Here is a list of problems whose solution would probably require changes to LLVM itself. Some of these problems are solved in various ways by changes on the LLVM Mono Branch.

-   the llvm.sqrt intrinsic doesn't work with NaNs, even through the underlying C function/machine instruction probably works with them. Worse, an optimization pass transforms sqrt(NaN) to 0.0, changing program behaviour, and masking the problem.
-   there is no fabs intrinsic, instead llc seems to replace calls to functions named 'fabs' with the corresponding assembly, even if they are not the fabs from libm ?
-   There is no way to tell LLVM that a result of a load is constant, i.e. in a loop like this:

<!-- -->

      for (int i = 0; i < arr.Length; ++i)
         arr [i] = 0

The arr.Length load cannot be moved outside the loop, since the store inside the loop can alias it. There is a llvm.invariant.start/end intrinsic, but that seems to be only useful for marking a memory area as invariant inside a basic block, so it cannot be used to mark a load globally invariant.

[http://hlvm.llvm.org/bugs/show\_bug.cgi?id=5441](http://hlvm.llvm.org/bugs/show_bug.cgi?id=5441)

-   LLVM has no support for implicit exceptions:

[http://llvm.org/bugs/show\_bug.cgi?id=1269](http://llvm.org/bugs/show_bug.cgi?id=1269)

-   LLVM thinks that loads from a NULL address lead to undefined behaviour, while it is quite well defined on most unices (SIGSEGV signal being sent). If an optimization pass determines that the source address of a load is NULL, it changes it to undef/unreachable, changing program behaviour. The only way to work around this seems to be marking all loads as volatile, which probably doesn't help optimizations.
-   There seems to be no way to disable specific optimizations when running 'opt', i.e. do -std-compile-opts except tailcallelim.
-   The x86 JIT seems to generate normal calls as

<!-- -->

      mov reg, imm
      call *reg

This makes it hard/impossible to patch the calling address after the called method has been compiled. \<p\> [http://lists.cs.uiuc.edu/pipermail/llvmdev/2009-December/027999.html](http://lists.cs.uiuc.edu/pipermail/llvmdev/2009-December/027999.html)

-   LLVM doesn't emit unwind info on arm, neither the DWARF style, or the ARM style.

[ARM Exception Handling ABI](http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ihi0038a/index.html)

[GAS Directives to emit ARM unwind info](http://sourceware.org/binutils/docs-2.20/as/ARM-Directives.html#ARM-Directives)

-   LLVM Bugs: [[1]](http://llvm.org/bugs/show_bug.cgi?id=6102)

Future Work
-----------

### Array Bounds Check (ABC) elimination

Mono already contains a ABC elimination pass, which is fairly effective at eliminating simple bounds check, i.e. the one in:

for (int i = 0; i \< arr.Length; ++i)

      sum += arr [i];

However, it has problems with "partially redundant" check, i.e. checks which cannot be proven to be reduntant, but they are unlikely to be hit at runtime. With LLVM's extensive analysis and program transformation passes, it might be possible to eliminate these from loops, by changing them to loop-invariant checks and hoisting them out of loops, i.e. changing:

      for (int i = 0; i < len; ++i)
        sum += arr [i];

to:

      if (len < arr.Length) {
          <loop without checks>
      } else {
          <loop with checks>
      }

LLVM has a LoopUnswitch pass which can do something like this for constant expressions, it needs to be extended to handle the ABC checks too. Unfortunately, this cannot be done currently because the arr.Length instruction is converted to a volatile load by mono's LLVM backend, since it can fault if arr is null. This means that the load is not loop invariant, so it cannot be hoisted out of the loop.

An experimental version of this optimization which can only handle simple cases is now in mono's llvm repository:

[http://github.com/mono/llvm/tree/mono-abcrem](http://github.com/mono/llvm/tree/mono-abcrem)

