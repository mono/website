---
title: "GitHubBranches"
lastmodified: '2011-12-14'
permalink: /archived/GitHubBranches/
redirect_from:
  - /GitHubBranches/
---

GitHubBranches
==============

Documentation for some developer branches on GitHub.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#httpsgithubcomvargazmono">1 https://github.com/vargaz/mono</a>
<ul>
<li><a href="#aot-direct-icalls">1.1 aot-direct-icalls</a></li>
<li><a href="#inline-wrappers">1.2 inline-wrappers</a></li>
<li><a href="#llvm-varargs">1.3 llvm-varargs</a></li>
<li><a href="#mcs-parallel-build">1.4 mcs-parallel-build</a></li>
<li><a href="#mk">1.5 mk</a></li>
<li><a href="#normal-throw-trampolines">1.6 normal-throw-trampolines</a></li>
<li><a href="#resume-unwind">1.7 resume-unwind</a></li>
<li><a href="#soft-breakpoints">1.8 soft-breakpoints</a></li>
<li><a href="#thumb2">1.9 thumb2</a></li>
<li><a href="#unwind-info-for-epilogs">1.10 unwind-info-for-epilogs</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

[https://github.com/vargaz/mono](https://github.com/vargaz/mono)
================================================================

Most of these branches are unfinished/work-in-progress.

aot-direct-icalls
-----------------

Proof of concept implementation of calling icalls directly from AOT code in static mode.

inline-wrappers
---------------

Inline managed-to-native wrappers into their callers, to reduce icall overhead.

llvm-varargs
------------

Change the vararg calling convention to be compatible with the platform ABI, so vararg methods can be compiled using LLVM.

mcs-parallel-build
------------------

Building the class libs in parallel.

mk
--

automake/libtool replacement using GNU Make facilities. This has the following advantages:

-   faster.
-   no need for the Makefile.am -\> Makefile.in -\> Makefile transitions, normal Makefile's can be used.
-   the configuration information is in a single conf.mk file which is directly editable.

normal-throw-trampolines
------------------------

Throwing exceptions using the normal mono trampolines instead of the specialized ones currently used.

resume-unwind
-------------

Implementation of finally blocks in the style of the c++ ehabi.

soft-breakpoints
----------------

Implementation of breakpoints using trampolines instead of page faults.

thumb2
------

Thumb2 support for ARM.

unwind-info-for-epilogs
-----------------------

Emit precise unwind info for method epilogs.

