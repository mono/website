---
layout: docpage
navgroup: docs
title: Runtime projects
---

Current Projects for the Mono Runtime

These track the projects for the VM team.

Ongoing Projects
================

Soft Debugger
-------------

The [Soft Debugger]({{ site.github.url }}/docs/advanced/runtime/docs/soft-debugger/) is a new debugger technology, used primarily by Mono on the iPhone.

Compacting GC
-------------

Work towards the [Generational GC]({{ site.github.url }}/docs/advanced/garbage-collector/sgen/).

Our current plan is:

-   Complete the GC in single-threaded mode.
-   Activate the new GC on SVN.
-   Debug/fix any issues with the GC.
-   Implement a multi-threaded version of the major collector.

Lead: Paolo

LLVM as a Code Generation Backend
---------------------------------

Use the LLVM code optimized as a backend for Mono's JIT. For more information see the [Mono LLVM]({{ site.github.url }}/docs/advanced/mono-llvm/) page.

Lead: Zoltan

Reflection Fixes
----------------

Support for User defined Types (used by PostSharp and other similar tools).

This is a very time intensive task as it requires to test all entry points in corlib that take System.Type or System.Reflection.\* types.

Continuations
-------------

Support for [Continuations]({{ site.github.url }}/old_site/Continuations "Continuations") is supported in versions of Mono after April 16th (to be publicly available in Mono 2.6).

Read more about [Continuations]({{ site.github.url }}/old_site/Continuations "Continuations") here.

Reflection.Emit Fixes
---------------------

Fix executing SRE code(used by F\# and Boo interactive Boo Shells and DLR debug mode).

This is a series of small tasks:

-   Finish lifting generic instantiations to managed code. We still lack inflated generic method and inflated generic method over inflated generic type.

-   Remove the two stage setup of MonoClass. This step is a bit more complicated and will lead to quite a lot of internal changes to the runtime reflection code.

-   Review all code in the runtime that make assumptions on SRE objects, this should lead to a lot of simplification and fixing long standing bugs.

Lead:

Runtime Fixes
-------------

Fix tail call support for F\#

Add generic variance support (Required by C\# 4.0). This is a low priority project as it will be released only in 2010.

Security: Moonlight
-------------------

-   Metadata validation.
-   System.Reflection.Emit code audit.
-   IL validation.
-   CoreCLR Security system.

Performance
-----------

### Frameless methods on x86

On x86 we can avoid using the frame pointer and gaining an extra register.

Lead: Mark Probst

### Generics code improvements

Generics IL is a bit different from regular code and the current JIT doesn't properly handle it.

Areas where can can improve:

-   Avoid LDADDR for constrained calls on reference types.
-   Intrinsify and remove boxing for methods on System.Object over primitive types. This is important to make generic collections produce code close to the manually crafted equivalent.

Console Ports
-------------

Work to port and support Mono on the [Mono:Wii]({{ site.github.url }}/docs/about-mono/supported-platforms/wii/) and the [Mono:PlayStation3]({{ site.github.url }}/docs/about-mono/supported-platforms/playstation3/).

The Wii port is ready; The PlayStation3 port is finished, but requires some work to package and polish the sharp edges.

Innovative Features
-------------------

-   Paolo's Continuation Framework.

### API Changes

As part of Mono 2.8, we will be breaking the embedding API to clean up many issues that have cropped over the years.

You can read more about them in the [Mono\_Runtime\_API\_Changes]({{ site.github.url }}/old_site/Mono_Runtime_API_Changes "Mono Runtime API Changes") page.

Cross Compilation
-----------------

Support for configuring Mono as a cross-compiler. Initially it is OK to mandate that the host and the target have the same endianess and the same word size.

The most important scenario is MacOS X/Intel host compiling for iPhone/ARM target.

Low Priority Projects
=====================

-   Mono.Simd for NEON (ARM processors) and/or VMX (Cell Processor).
-   C++ bindings without C glue.

Completed Projects
==================

-   [Linear]({{ site.github.url }}/docs/advanced/runtime/docs/linear-ir/): An update to the JIT's internal representation (IR).
-   JIT Regalloc: A new register allocation framework.
-   [SafeHandles]({{ site.github.url }}/docs/advanced/safehandles/): Support for 2.0 SafeHandles.

