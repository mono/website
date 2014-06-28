---
layout: obsolete
title: "Runtime Projects"
lastmodified: '2010-06-27'
permalink: /old_site/Runtime_Projects/
redirect_from:
  - /Runtime_Projects/
---

Runtime Projects
================

Current Projects for the Mono Runtime

These track the projects for the VM team.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#ongoing-projects">1 Ongoing Projects</a>
<ul>
<li><a href="#soft-debugger">1.1 Soft Debugger</a></li>
<li><a href="#compacting-gc">1.2 Compacting GC</a></li>
<li><a href="#llvm-as-a-code-generation-backend">1.3 LLVM as a Code Generation Backend</a></li>
<li><a href="#reflection-fixes">1.4 Reflection Fixes</a></li>
<li><a href="#continuations">1.5 Continuations</a></li>
<li><a href="#reflectionemit-fixes">1.6 Reflection.Emit Fixes</a></li>
<li><a href="#runtime-fixes">1.7 Runtime Fixes</a></li>
<li><a href="#security-moonlight">1.8 Security: Moonlight</a></li>
<li><a href="#performance">1.9 Performance</a>
<ul>
<li><a href="#frameless-methods-on-x86">1.9.1 Frameless methods on x86</a></li>
<li><a href="#generics-code-improvements">1.9.2 Generics code improvements</a></li>
</ul></li>
<li><a href="#console-ports">1.10 Console Ports</a></li>
<li><a href="#innovative-features">1.11 Innovative Features</a>
<ul>
<li><a href="#api-changes">1.11.1 API Changes</a></li>
</ul></li>
<li><a href="#cross-compilation">1.12 Cross Compilation</a></li>
</ul></li>
<li><a href="#low-priority-projects">2 Low Priority Projects</a></li>
<li><a href="#completed-projects">3 Completed Projects</a></li>
</ul></td>
</tr>
</tbody>
</table>

Ongoing Projects
================

Soft Debugger
-------------

The [Soft Debugger]({{ site.github.url }}/old_site/Mono:Runtime:Documentation:SoftDebugger) is a new debugger technology, used primarily by Mono on the iPhone.

Compacting GC
-------------

Work towards the [Generational GC]({{ site.github.url }}/old_site/Generational_GC "Generational GC").

Our current plan is:

-   Complete the GC in single-threaded mode.
-   Activate the new GC on SVN.
-   Debug/fix any issues with the GC.
-   Implement a multi-threaded version of the major collector.

Lead: Paolo

LLVM as a Code Generation Backend
---------------------------------

Use the LLVM code optimized as a backend for Mono's JIT. For more information see the [Mono LLVM]({{ site.github.url }}/old_site/Mono_LLVM "Mono LLVM") page.

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

Work to port and support Mono on the [Mono:Wii]({{ site.github.url }}/old_site/Mono:Wii "Mono:Wii") and the [Mono:PlayStation3]({{ site.github.url }}/old_site/Mono:PlayStation3 "Mono:PlayStation3").

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

-   [Linear]({{ site.github.url }}/old_site/Linear_IR): An update to the JIT's internal representation (IR).
-   [JIT Regalloc](/index.php?title=JIT_Regalloc&action=edit&redlink=1 "JIT Regalloc (page does not exist)"): A new register allocation framework.
-   [SafeHandles]({{ site.github.url }}/old_site/SafeHandles "SafeHandles"): Support for 2.0 SafeHandles.


