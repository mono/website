---
layout: obsolete
title: "Mono:X86"
permalink: /old_site/Mono:X86/
redirect_from:
  - /Mono:X86/
---

Mono:X86
========

Mono's main developers use x86 systems and its the most tuned version, currently it supports:

-   Linux.
-   Windows.
-   BSD (Requires a modern version for proper thread support).
-   Solaris/x86

Mono on x86 supports both Just-in-Time (JIT) compilation as well as Ahead-of-Time ([AOT]({{site.github.url}}/old_site/AOT "AOT")) compilation, the later produces Position Independent Code.

X86 Specific Optimizations
==========================

-   Thread local storage (TLS): on systems that support TLS, Mono is able to take advantage of it.
-   x86 peephole optimizations.
-   Instruction selector is able to pick best instructions on x86.


