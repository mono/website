---
layout: obsolete
title: "CSharp Compiler"
lastmodified: '2012-03-28'
permalink: /old_site/CSharp_Compiler/
redirect_from:
  - /CSharp_Compiler/
  - /CSharp/
  - /Mcs/
  - /Mono_CSharp_Compiler/
---

CSharp Compiler
===============

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#introduction">1 Introduction</a>
<ul>
<li><a href="#compiler-service">1.1 Compiler Service</a></li>
<li><a href="#state-of-the-compiler">1.2 State of the Compiler</a></li>
<li><a href="#specification">1.3 Specification</a></li>
<li><a href="#working-with-mcs">1.4 Working with MCS</a>
<ul>
<li><a href="#obtaining-mcs">1.4.1 Obtaining MCS</a></li>
<li><a href="#running-mcs">1.4.2 Running MCS</a></li>
<li><a href="#reporting-bugs">1.4.3 Reporting Bugs</a></li>
</ul></li>
</ul></li>
<li><a href="#implementation-details">2 Implementation details</a>
<ul>
<li><a href="#cil-optimizations">2.1 CIL Optimizations.</a>
<ul>
<li><a href="#open-bugs">2.1.1 Open bugs</a></li>
</ul></li>
</ul></li>
<li><a href="#slides">3 Slides</a></li>
<li><a href="#history">4 History</a></li>
<li><a href="#common-questions">5 Common Questions</a></li>
</ul></td>
</tr>
</tbody>
</table>

Introduction
------------

The Mono C\# compiler is considered feature complete for C\# 1.0, C\# 2.0, C\# 3.0 and C\# 4.0 ([ECMA]({{site.github.url}}/old_site/ECMA "ECMA")). A preview of C\# 5.0 is distributed with Mono 2.11 or when building Mono from our trunk source code release.

Historically, various version of same compiler existed.

-   **gmcs**: compiler to target the 2.0 mscorlib.
-   **smcs**: compiler to target the 2.1 mscorlib, to build [Moonlight]({{site.github.url}}/old_site/Moonlight "Moonlight") applications.
-   **dmcs**: compiler to target the 4.0 mscorlib.

Starting with Mono version 2.11 a new unified compiler **mcs** is available. It replaces all previous runtime specific compilers (gmcs, dmcs, smcs). They still exist (as scripts only) to ease the migration path to mcs but we recommend to use mcs.

Bug reports or any compiler issue can be [filed on our bug tracking system.]({{site.github.url}}/old_site/Bugs "Bugs")

The compiler is able to compile itself and many more C\# programs (there is a test suite included that you can use). The compiler is routinely used to compile Mono, roughly four million lines of C\# code and a few other projects.

The compiler is also fairly fast. On a IBM ThinkPad t40 it compiles 18,000 lines of C\# code per second.

### Compiler Service

Starting with Mono 2.2 it supports a [Compiler Service]({{site.github.url}}/old_site/CsharpRepl "CsharpRepl") that applications can consume.

The compiler can be used as a service by using the Mono.CSharp.Evaluator class in the Mono.Sharp.dll assembly.

Both a console and GUI [read-eval-print]({{site.github.url}}/old_site/CsharpRepl "CsharpRepl") shells are distributed as part of Mono 2.2 and are both built on top of the above service.

### State of the Compiler

The (**mcs**) compiler defaults to the latest language specification available.

All C\# 2.0 features are supported including:

-   [Anonymous methods](http://msdn2.microsoft.com/library/0yw3tz5k.aspx)
-   [Iterators](http://msdn2.microsoft.com/library/dscyy5s0.aspx)
-   [Partial classes](http://msdn2.microsoft.com/library/wa80x488.aspx)
-   [Generics](http://msdn2.microsoft.com/en-US/library/512aeb7t(vs.80).aspx)
-   [Nullable types](http://msdn2.microsoft.com/library/1t3y8s4s.aspx)
-   [Friend assemblies](http://msdn2.microsoft.com/library/0tke9fxk(en-us,vs.80).aspx)
-   [Static classes](http://msdn2.microsoft.com/library/79b3xss3.aspx)
-   [Covariance and contravariance](http://msdn2.microsoft.com/library/ms173174.aspx)
-   [Access modifiers on properties](http://msdn2.microsoft.com/library/75e8y5dd.aspx)
-   [Fixed buffers](http://msdn2.microsoft.com/library/zycewsya.aspx)
-   [External assembly alias](http://msdn2.microsoft.com/library/e59b22c5(en-us,vs.80).aspx)
-   [namespace alias qualifier](http://msdn2.microsoft.com/library/htccxtad(en-us,vs.80).aspx)
-   [Inline warning control](http://msdn2.microsoft.com/library/441722ys.aspx).

All C\# 3.0 features are supported including:

-   Extension methods
-   Query expressions (LINQ)
-   Expression trees
-   Automatically implemented properties
-   Lambda expressions
-   Anonymous types
-   Collection initializers
-   Object initializers
-   Implicitly typed arrays
-   Partial methods

All C\# 4.0 features are supported including:

-   Dynamic binding support
-   Generic type variance
-   Optional parameters
-   Named arguments

All C\# 5.0 feature are supported including:

-   Asynchronous programming support
-   Caller info attributes

If you want to limit the mcs compiler to be a strict 2.0 compiler, use the -langversion:ISO-2 flag, further options are available for each language version.

### Specification

The C\# 2.0 specification is available on the [third edition of the ECMA 334 standard](http://www.ecma-international.org/publications/standards/Ecma-334.htm).

An on-line and hyperlinked version of the C\# 1.0 specification is available from [Jon Jagger's](http://www.jaggersoft.com) site [here](http://www.jaggersoft.com/csharp_standard/).

The specification shipped with Monodoc, and available on our web downloads is based on Jon's original XML documentation that he extracted from the ECMA 334 specification.

### Working with MCS

#### Obtaining MCS

The Mono C\# compiler is part of the \`mono' module in the Mono Git you can get it from our [source code]({{site.github.url}}/old_site/SourceCodeRepository "SourceCodeRepository") server, or you can get nightly [download page]({{site.github.url}}/old_site/Downloads "Downloads").

You can also browse or download a snapshot of the compiler alone:

-   [browse the sources](http://github.com/mono/mono/tree/master/mcs/mcs/).

If you are interested in developing the C\# compiler, the C\# Compiler as a Service or the interactive shell on Windows we provide Visual Studio solutions that work on VS 2008 and 2010 and allow developers to quickly get the compiler up and running.

To do this, download the entire MCS tree from:

-   [http://github.com/mono/mono/tree/master/mcs/](http://github.com/mono/mono/tree/master/mcs/).

And then open the Visual Studio solution on mcs/tools/csharp, this will build the Mono.CSharp.dll compiler as a service as well as the command line interactive C\# shell "csharp".

#### Running MCS

MCS is written in C\# and uses heavily the .NET APIs (in particular it uses System.Reflection and System.Reflection.Emit). MCS runs on Linux with the Mono runtime and on Windows with both the .NET runtime and the Mono runtime.

#### Reporting Bugs

You can submit bugs by filing the bugs against the C\# compiler in our [Bugs]({{site.github.url}}/old_site/Bugs "Bugs") page.

When you report a bug, try to provide a small test case that would show the error so we can include this as part of the Mono C\# regression test suite. If the bug is an error or a warning that we do not flag, write a sample program called \`csXXXX.cs' where XXXX is the code number that is used by the Microsoft C\# compiler that illustrates the problem. That way we can also do regression tests on the invalid input.

Implementation details
----------------------

The compiler is documented in the file [mcs/docs/compiler](http://github.com/mono/mono/blob/master/mcs/docs/compiler.txt)

### CIL Optimizations.

The compiler performs a number of simple optimizations on its input: constant folding (this is required by the C\# language spec) and can perform dead code elimination.

Other more interesting optimizations like hoisting are not possible at this point since the compiler output at this point does not generate an intermediate representation that is suitable to perform basic block computation.

Adding an intermediate layer to enable the basic block computation to the compiler should be a simple task, but we are considering having a generic CIL optimizer. Since all the information that is required to perform basic block-based optimizations is available at the CIL level, we might just skip this step altogether and have just a generic IL optimizer that would perform hoisting on arbitrary CIL programs, not only those produced by MCS.

If this tool is further expanded to perform constant folding (not needed for our C\# compiler, as it is already in there) and dead code elimination, other compiler authors might be able to use this generic CIL optimizer in their projects reducing their time to develop a production compiler.

#### Open bugs

See the [bugs page]({{site.github.url}}/old_site/Bugs) for more information. A test suite is maintained to track the progress of the compiler and various programs are routinely compiled and ran.

Slides
------

Slides for the Mono C\# Compiler presentation at .NET ONE are available [here](http://primates.ximian.com/~miguel/slides-europe-nov-2002/Mono_C_Sharp_Overview_1007.sxi) in StarOffice format.

History
-------

MCS was able to parse itself on April 2001, MCS compiled itself for the first time on December 28 2001. MCS became self hosting on January 3rd, 2002.

The Mono Runtime and the Mono execution engine were able to make our compiler self hosting on March 12, 2002.

On July 2003 work started on the generics support of mcs. Since the core of the compiler was used in production and in the development of Mono itself, a fork of the compiler was created. This fork is \`gmcs'. The \`gmcs' fork merges all of the changes from mcs on a regular basis and will eventually become the default compiler.

Support for the third edition of the C\# standard became available on the Mono 1.1.8 release in the summer of 2005.

The compiler was originally written as an attempt to learn the C\# language, it began as a tokenizer for the language, and then evolved into a parser for the language and later got the semantic analysis and code generation features in place. This explains the difference in coding styles from the tokenizer (which is the earliest code) and the code generation (which came at later phases).

Miguel de Icaza started the compiler and did most of the early work. He was later was joined by Ravi Pratap who would take over attributes, delegates, and overload resolution.

Martin Baulig wrote the flow analysis code as well as the generics support. Harinath Raja fixed and refactored large parts of the compiler, rearchitected flow analysis and fixed many of the early design mistakes.

Harinath Raja has been the compiler maintainer for the last two years and was in charge of making the compiler conform to the standard and productized many areas in the compiler, from fixing the name resolution hacks, to performance, to correctness, to simplifying many of the complexity that had crawled into the compiler over the years

Marek Safar initially focused on improving the warnings, error messages and made the compiler more robust as part of his work to make the compiler CLS compliant (Common Language Specification errors and warnings). He later implemented extension methods, delegate type inference and has been a mentor to new compiler authors for a long time.

Atsushi Enomoto wrote the support for inline documentation.

Sebastien Pouliot wrote all the code required to sign assemblies, delay sign them and deal with keys.

Ben Maurer did a lot of profiling work on the mcs compiler and helped fixed some of the problems in it.

Scott Peterson contributed in 2007 many of the foundation blocks for C\# 3 (var, support, anonymous types, automatic properties, variable type inference and object and collection initializers).

In 2007 Marek Safar took over the maintenance of the compiler and he completed the C\# 3.0 implementation, lambdas, mutators, type inferencing and LINQ expressions.

In 2008 Miguel de Icaza turned the compiler into a reusable library (Mono.CSharp.dll) and introduced the [Interactive C\# Shell]({{site.github.url}}/old_site/CsharpRepl "CsharpRepl").

In 2009 Marek Safar evolved the compiler to support C\# 4.0, adding support for the dynamic data type, named parameters, default parameter values as well as co/contravariance support.

Many other developers contributed fixes and other small components in the compiler.

Common Questions
----------------

**What is the difference between dmcs, gmcs and smcs**

They are the same compiler with three different set of defaults.

-   **dmcs**: references the 4.0-profile libraries (the APIs as defined in .NET 4.0) and supports C\# 4.0.
-   **gmcs**: references the 2.0-profile libraries (the APIs as defined in .NET 2.0 and .NET 3.5) and exposes the full C\# 3.0 language.
-   **smcs**: references the 2.1-profile libraries (the APIs defined for Silverlight) and exposes the full C\# 3.0 language. This is the compiler used for creating Silverlight/[Moonlight]({{site.github.url}}/old_site/Moonlight "Moonlight") applications.


