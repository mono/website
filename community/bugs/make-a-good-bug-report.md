---
title: How to make a good bug report
---

1.  Submit a **test case**, the smaller, the better. You can either add a code sample to the bug report or zip your project and attach it.
2.  Run the test against Microsofts .NET to see what it does and if this is an actual bug.
3.  Use [GitHub issues](https://github.com/mono/mono/issues) to report the bug.
4.  If the test involves libraries or assemblies that are not part of Mono, add infomation on where to download all dependencies, and how to compile/install them.
5.  If compiling the test case requires more than: `csc test.cs` provide the **full command line** you used to compile the test.
6.  If running the test requires more than: `mono test.exe` provide the **full command line** needed to replicate the bug.
7.  Provide info about the version of the software you're using (both Mono and the operating system or relevant libraries).
8.  Provide the output you expect the test case to produce.
9.  Provide the actual output **you** get from the test case.
10. Do not expect us to debug your software. We cannot debug every application that is submitted to us. To improve the response time, you should create a self-contained test case that isolates the problem.

Please include at least 6 items from the list in your bug report. Incomplete bug reports are very hard to understand, reproduce and fix.
