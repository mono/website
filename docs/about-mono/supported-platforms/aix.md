---
title: IBM AIX and i
---

As of the 5.12 release, Mono now supports the IBM [AIX](https://en.wikipedia.org/wiki/IBM_AIX) and [i](https://en.wikipedia.org/wiki/IBM_i) (also known as i5/OS or OS/400) on 64-bit big-endian [PowerPC](/docs/about-mono/supported-platforms/powerpc/). These wildly different operating systems are binary compatible, although limitations on i's PASE can sometimes hinder the AIX port.

The port, while incomplete, is mostly fully functional and capable of bootstrapping the runtime, C# compiler, and core libraries using mcs. Currently unsupported for AIX-specific reasons is the AOT compiler, and for general PPC reasons, the interpreter and Roslyn.

The effort to port to these platforms is documented in a [blog post](/news/2018/05/29/mono-on-aix-and-ibm-i/).

This port is maintained by Calvin Buckley.
