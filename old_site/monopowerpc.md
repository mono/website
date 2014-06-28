---
layout: obsolete
title: "Mono:PowerPC"
lastmodified: '2009-02-12'
permalink: /old_site/Mono:PowerPC/
redirect_from:
  - /Mono:PowerPC/
  - /Mono_PowerPC_Port/
---

Mono:PowerPC
============

The PowerPC port is complete (native code generator (JIT) and interpreter).

It works on [Mac OS X]({{ site.github.url }}/old_site/Mono:OSX "Mono:OSX"), [Linux/PPC]({{ site.github.url }}/old_site/Mono:Linux "Mono:Linux"), [Nintendo Wii]({{ site.github.url }}/old_site/Mono:Wii "Mono:Wii") and [Sony PlayStation 3]({{ site.github.url }}/old_site/Mono:PlayStation3 "Mono:PlayStation3").

The port owner is Paolo Molaro.

Documentation
-------------

**PowerPC architecture:**

-   [PowerPC Programming environments manual](http://www.freescale.com/files/product/doc/MPCFPE32B.pdf), ([errata](http://www.freescale.com/files/product/doc/MPCFPE32BAD.pdf) document).

-   [G4 (7410) User's manual](http://www.freescale.com/files/32bit/doc/ref_manual/MPC7410UM.pdf) , ([errata](http://www.freescale.com/files/32bit/doc/ref_manual/MPC7410UMAD.pdf) document).

A nice introduction to PowerPC assembly language at [http://www-106.ibm.com/developerworks/library/l-ppc/](http://www-106.ibm.com/developerworks/library/l-ppc/)

**Calling conventions:**

-   Linux on PPC32 uses the [The PowerPC SystemV ABI specification](http://refspecs.freestandards.org/elf/elfspec_ppc.pdf).
-   On MacOS X, the conventions are documented in the [Mach-O Runtime Architecture](http://developer.apple.com/documentation/DeveloperTools/Conceptual/MachORuntime/MachORuntime.pdf).


