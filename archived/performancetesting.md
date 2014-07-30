---
title: "PerformanceTesting"
lastmodified: '2006-05-17'
permalink: /archived/PerformanceTesting/
redirect_from:
  - /PerformanceTesting/
---

PerformanceTesting
==================

Runtime
=======

Tomas Kalibera from Charles University in Prague has a project that tracks the performance of the Mono runtime, see his project page [here](http://nenya.ms.mff.cuni.cz/projects/mono/index.phtml).

Their Mono Performance testing project tracks performance improvements and regressions on a number of tests and tracks the corresponding changes in the Mono source code that caused the change.

Any tests that are part of the mono/tests also become performance tests, the status can be tracked in the following page 24 hours after they are commited: [http://nenya.ms.mff.cuni.cz/projects/mono/benchmarks/rtests.phtml](http://nenya.ms.mff.cuni.cz/projects/mono/benchmarks/rtests.phtml)

XML
===

XMLMark is a test suite for XML stacks (Java and .NET), the paper is available [here](http://www.process64.com/articles/xmlmark1/).

An easy to use port for Mono on Linux (with the patches described in the paper plus a Makefile ready to run) is available [here](http://primates.ximian.com/~miguel/tmp/xmlmark1.1.tar.gz).

A progress report since we found this paper with graphs is maintained by Atsushi [here](http://monkey.workarea.jp/mono/xml/XMLmark/).

Language Shootout
=================

The Language Shoutout compares a set of simple benchmarks with implementations on different languages and frameworks, it is available [here](http://shootout.alioth.debian.org/debian/csharp.php)

