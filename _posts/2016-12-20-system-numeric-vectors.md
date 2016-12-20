---
layout: blog
title: System.Numeric.Vectors are now accelerated in Mono
author: Miguel de Icaza
tags: [runtime]
---

While Mono has had support for SIMD instructions in the form of the
[Mono.SIMD API](http://tirania.org/blog/archive/2008/Nov-03.html),
this API was limited to run on x86 platforms.

.NET introduced the
[System.Numeric.Vectors](https://msdn.microsoft.com/en-us/library/dn858218(v=vs.111).aspx)
API which sports a more general design that adapts to the SIMD
registers available on different platforms.

The `master` branch of Mono now treats the various Vector operations
as runtime intrinsics, so they are hardware accelerated.  They are
supported by both the Mono JIT compiler on x86-x64 platforms and via
LLVM's optimizating compiler on x86-64 and every other Mono/LLVM supported
platform.

We would love to see you try it and share your experience with us.
