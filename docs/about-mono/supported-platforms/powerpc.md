---
title: PowerPC
redirect_from:
  - /Mono%3APowerPC/
  - /Mono_PowerPC_Port/
---

The PowerPC port is complete, although less supported than other architectures.

It works on [Mac OS X](/docs/about-mono/supported-platforms/osx/), [Linux](/docs/about-mono/supported-platforms/linux/), [IBM AIX](/docs/about-mono/supported-platforms/aix/), [IBM i](/docs/about-mono/supported-platforms/aix/), [Nintendo Wii](/docs/about-mono/supported-platforms/wii/) and [Sony PlayStation 3](/docs/about-mono/supported-platforms/playstation3/).

The port owner is Bernhard Urban.

Documentation
-------------

## PowerPC architecture

-   [PowerPC Programming environments manual](http://www.freescale.com/files/product/doc/MPCFPE32B.pdf), ([errata](http://www.freescale.com/files/product/doc/MPCFPE32BAD.pdf) document).

-   [G4 (7410) User's manual](http://www.freescale.com/files/32bit/doc/ref_manual/MPC7410UM.pdf), ([errata](http://www.freescale.com/files/32bit/doc/ref_manual/MPC7410UMAD.pdf) document).

A nice introduction to PowerPC assembly language at [http://www.ibm.com/developerworks/linux/library/l-ppc/](http://www.ibm.com/developerworks/linux/library/l-ppc/)

## Calling conventions

-   On Mac OS X, the conventions are documented in the [Mach-O Runtime Architecture](https://developer.apple.com/library/mac/documentation/DeveloperTools/Conceptual/MachORuntime/).
-   On AIX and i, the conventions are documented in the [AIX assembler language reference](https://www.ibm.com/support/knowledgecenter/en/ssw_aix_61/com.ibm.aix.alangref/idalangref_subrutine_link_conv.htm).

### Linux

-   Linux on PPC32 uses the [The PowerPC SystemV ABI specification](http://refspecs.linux-foundation.org/elf/elfspec_ppc.pdf).
-   On 64-bit PowerPC, there are two calling conventions. One is the ELF v1 ABI used on almost all big-endian systems, which are similar to AIX and use function descriptors.
-   The other 64-bit PowerPC calling convention is the ELF v2 ABI, used by little-endian systems and a few big-endian systems. This ABI has no function desxcriptors and is closer to the PPC32 ABI.
