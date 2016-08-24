---
title: PowerPC
redirect_from:
  - /Mono%3APowerPC/
  - /Mono_PowerPC_Port/
---

The PowerPC port is complete (native code generator (JIT) and interpreter).

It works on [Mac OS X](/docs/about-mono/supported-platforms/osx/), [Linux/PPC](/docs/about-mono/supported-platforms/linux/), [Nintendo Wii](/docs/about-mono/supported-platforms/wii/) and [Sony PlayStation 3](/docs/about-mono/supported-platforms/playstation3/).

The port owner is Paolo Molaro.

Documentation
-------------

**PowerPC architecture:**

-   [PowerPC Programming environments manual](http://www.freescale.com/files/product/doc/MPCFPE32B.pdf), ([errata](http://www.freescale.com/files/product/doc/MPCFPE32BAD.pdf) document).

-   [G4 (7410) User's manual](http://www.freescale.com/files/32bit/doc/ref_manual/MPC7410UM.pdf), ([errata](http://www.freescale.com/files/32bit/doc/ref_manual/MPC7410UMAD.pdf) document).

A nice introduction to PowerPC assembly language at [http://www.ibm.com/developerworks/linux/library/l-ppc/](http://www.ibm.com/developerworks/linux/library/l-ppc/)

**Calling conventions:**

-   Linux on PPC32 uses the [The PowerPC SystemV ABI specification](http://refspecs.linux-foundation.org/elf/elfspec_ppc.pdf).
-   On MacOS X, the conventions are documented in the [Mach-O Runtime Architecture](https://developer.apple.com/library/mac/documentation/DeveloperTools/Conceptual/MachORuntime/).


