---
title: How to make a good bug report
---

1.  Submit a **test case**, the smaller, the better. You can do this by clicking on the "Create a new attachment" link. When attaching a file, please set the correct MIME type from the list. For source code, "Plain text" is ok. For tar.gz or .gz files, you can enter "application/x-gzip" in the "Other" text box.
2.  Run the test against Microsofts .Net to see what it does and if this is an actual bug.
3.  Use [bugzilla.xamarin.com](http://bugzilla.xamarin.com) to report the bug. In **addition** to bugzilla, posting to the list is fine if the bug merits larger exposure or design discussions to solve; posting to the list twice or more is just a way to annoy people and make them waste time, especially when you start a new thread about it.
4.  If the test involves libraries or assemblies that are not part of mono, add infomation on where to download all dependencies, and how to compile/install them.
5.  If compiling the test case requires more than: `mcs test.cs` provide the **full command line** you used to compile the test.
6.  If running the test requires more than: `mono test.exe ` provide the **full command line** needed to replicate the bug.
7.  Provide info about the version of the software you're using (both mono and the operating system or relevant libraries).
8.  Provide the output you expect the test case to produce.
9.  Provide the actual output **you** get from the test case.
10. If you are new to bug reporting, understand how you should set "priority" for your report. People tend to set **CRITICAL or BLOCKER** where they should not. Please keep in mind: no matter how important the bug is for you, it is nothing to do with the importance of the bug itself.
11. Do not expect us to debug your software. We can not debug every application that is submitted to us, to improve the response time, you should create a self-contained test case that isolates the problem.

Please include at least 6 items from the list in your bug report. Incomplete bug reports are very hard to understand, reproduce and fix.

See also [bug severity definitions]({{ site.github.url }}/commmunity/bugs/bug-severity-definitions/).