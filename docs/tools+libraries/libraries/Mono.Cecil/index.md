---
title: Mono.Cecil
redirect_from:
  - /Cecil/
---

[Cecil](https://github.com/jbevain/cecil) is a library written by [Jb Evain](http://evain.net/) to generate and inspect programs and libraries in the ECMA CIL format. With Cecil, you can load existing managed assemblies, browse all the contained types, modify them on the fly and save back to the disk the modified assembly.

Today it is used by the Mono [Debugger](/docs/debug+profile/debug/debugger/), the bug-finding and compliance checking tool [Gendarme](/docs/tools+libraries/tools/gendarme/) and [many other tools](https://github.com/jbevain/cecil/wiki/Users).

Mailing List
============

There is a Google Group to discuss everything Cecil related: [mono-cecil](https://groups.google.com/group/mono-cecil)

Release Notes and Development Updates
=====================================

Visit [cecil.pe](http://cecil.pe) to get the latest updates.

Using Cecil
===========

Check the Cecil [wiki](https://github.com/jbevain/cecil/wiki/HOWTO) for some usage examples.

Download
========

Get the [Mono.Cecil](https://www.nuget.org/packages/Mono.Cecil/) NuGet package.

Documentation
=============

You can visit, and even contribute, to Cecil's [wiki](https://github.com/jbevain/cecil/wiki/).

Differences with Reflection/Reflection.Emit
===========================================

Reflection and Reflection.Emit only expose a subset of all the features in a CLI image. Since we want to remain compatible with the Microsoft implementation, we can not add or change the behavior of this library to be more complete.

Two big differences are that:

-   Cecil has support for extracting the CIL bytecodes.
-   Cecil does not need to load the assembly or have compatible assemblies to introspect the images.
