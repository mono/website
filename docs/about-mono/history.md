---
title: History
redirect_from:
  - /History/
---

Here are some historical data points about Mono:

Early Posts
===========

-   [Mono and GNOME, the long reply](http://mail.gnome.org/archives/gnome-hackers/2002-February/msg00031.html) [Local Copy](/archived/mailpostlongreply)
-   [Mono early history](http://lists.ximian.com/archives/public/mono-list/2003-October/016345.html) [Local Copy](/archived/mailpostearlystory)

Milestones
==========

2001
----

-   June 30: the Mono project is announced.

-   Aug 21: a remote compilation service is setup so that people who are contributing to Mono can submit their code over a web page and compile the code with the Microsoft C# compiler.

-   Aug 28: the Mono runtime runs "Hello World" for the first time. Hello World consists of 1821 CIL instructions, performs 66 subroutine calls and loads 12 classes from the corlib.dll

-   Sep 4: the monoburg tree pattern matching instruction selector is checked into CVS, this is the beginning of the Mono native code generator engine.

-   Sep 5: Mono's C# compiler which is written in C# compiles its first program: "Hello world" on Windows using the .NET runtime. The resulting executable runs on Linux as well with the runtime from August 28th.

-   Sep 10: Dietmar Maurer checks the x86 code generation rules for monoburg.

-   Sep 17: the first version of Gtk# is checked into Mono's CVS repository.

-   Sep 18: Mono 0.7 is released ([release notes](http://www.go-mono.com/archive/mono-0.7)).

-   Sep 21: Dick Porter gets the initial thread support into Mono's interpreter; Paolo Molaro implemented many new opcodes; Dietmar Maurer got long operations and mul/div working on the JIT engine; Ravi rewrote the Method selector for expressions to be conformant; Miguel gets i++ working in the compiler.

-   Sep 26: A build system based on Ant is contributed by Sergey and Sean. We will be maintaining a dual build system based on Makefiles and Ant for quite some time.

-   Oct 4th: The reflection support is complete enough to generate a sample program.

-   Oct 5th: Sergey publishes his IL assembler.

-   Nov 4th: Mike posts an [update on Gtk#](http://lists.ximian.com/archives/public/gtk-sharp-list/2001-November/000017.html)

-   Nov 14th: Paolo Molaro checks in the code that makes the C# compiler run and compile "Hello world" on Linux for the first time.

-   Nov 30th: Dietmar gets the JIT in good shape: All the tests that we had with the Mono interpreter now pass and execute with the Mono JIT engine.

-   Dec 11st: the JIT engine is able to host the Mono C# compiler and run all of its regression tests.

-   Dec 28th: The Mono C# compiler compiles itself, but the code generated is not correct yet.

2002
----

-   Jan 3: Mono's C# compiler can bootstrap itself using the .NET runtime. The next stage is to get it bootstrapping with the Mono runtime.

-   Jan 4: Mono gains Unicode support.

-   Jan 21: Dick posts a screenshot of a simple web server running on Mono: [here](http://primates.ximian.com/~miguel/dick-mis-server.png). This web server is used to test and exercise our IO layer.

-   Jan 23: the mono-patches mailing list debuts. Each patch is mailed to people in this mailing list. The era of asynchronous reviews begins.

-   Jan 28: Mono class libraries are relicensed from the LGPL to the [MIT X11](http://www.opensource.org/licenses/mit-license.html) license.

-   Jan 29: Dan Lewis contributes System.Text.RegularExpressions.

-   Feb 11: Initial ports of the Mono interpreter to SPARC and PowerPC.

-   Feb 13: Dietmar checks-in the code to support AppDomains, Nick Drochak has lead the group to use NUnit for testing the current implementation of our class libraries.

-   Feb 22: Mono 0.9 is [released](http://www.go-mono.com/archive/mono-0.9).

-   Feb 25: Sergey's StrongARM port of Mono's interpreter is checked in.

-   Mar 7: First time the Mono's C# compiler compiles on Linux.

-   Mar 12: Paolo managed to make Mono's C# compiler self-hosting on Linux.

-   June 25: Piers Haken contributes the initial XPath implementation to Mono and Dick Porter contributes the Process class and its related infrastructure to Mono.

-   June 30: The Mono C# compiler is able to build mscorlib, the last piece to achieve self-hosting of the Mono runtime.

2004
----

-   June 30th: Mono 1.0 is released.

2016
----

-   Mono joins the .NET Foundation
