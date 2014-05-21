---
layout: obsolete
title: "Mono:Runtime:Documentation:Other"
lastmodified: '2012-10-27'
permalink: /old_site/Mono:Runtime:Documentation:Other/
redirect_from:
  - /Mono:Runtime:Documentation:Other/
---

Mono:Runtime:Documentation:Other
================================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#faster-runtime-builds">1 Faster runtime builds</a></li>
<li><a href="#runtime-debugging-methods">2 Runtime debugging methods</a>
<ul>
<li><a href="#debugging-crashes-which-dont-happen-inside-gdb-or-only-happen-when-a-test-program-is-ran-in-a-loop">2.1 Debugging crashes which don't happen inside gdb, or only happen when a test program is ran in a loop</a></li>
<li><a href="#setting-native-breakpoints-in-managed-methods">2.2 Setting native breakpoints in managed methods</a></li>
<li><a href="#displaying-jit-debug-output">2.3 Displaying JIT debug output</a></li>
<li><a href="#displaying-runtime-debug-output">2.4 Displaying runtime debug output</a></li>
<li><a href="#mono-debug-count-">2.5 mono_debug_count ()</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Faster runtime builds
=====================

To speed up runtime builds, use one or more of the following:

-   Turn off optimization by passing CFLAGS=-O0 to configure.
-   Turn off generation of libmono by passing --disable-libraries to configure.
-   Build in parallel, i.e. using make -j4.

Runtime debugging methods
=========================

Debugging crashes which don't happen inside gdb, or only happen when a test program is ran in a loop
----------------------------------------------------------------------------------------------------

Set the MONO\_DEBUG env variable to 'suspend-to-sigsegv'. This causes the runtime native SIGSEGV handler to spin in a loop, so gdb can be attached to the running process.

Setting native breakpoints in managed methods
---------------------------------------------

Use the --break \<METHOD\> command line argument. The JIT will generate a native breakpoint (INT on x86) into the prolog of the given method. Use --break-at-bb \<METHOD\> \<bb num\> to set a breakpoint at the start of a given basic block.

Displaying JIT debug output
---------------------------

Use the -v -v -v -v command line argument. Set the MONO\_VERBOSE\_METHOD env variable to display output for only one method.

Displaying runtime debug output
-------------------------------

Set the MONO\_LOG\_LEVEL env variable to 'debug'. The log output is useful for diagnosing assembly loading/AOT/pinvoke problems.

mono\_debug\_count ()
---------------------

This is useful for debugging problems where a piece of code is executed many times, and we need to find out which run causes the runtime to misbehave, i.e. which method is miscompiled by the JIT etc. It works by changing

``` bash
do_something ()
```

To:

``` bash
if (mono_debug_count ()) {
  <do something>
}
```

mono\_debug\_count () is controlled by the COUNT env variable, the first COUNT times it is called, it will return TRUE, after that, it will return FALSE. This allows us to find out exactly which execution of \<do something\> causes the problem by running the application while varying the value of COUNT using a binary search.

