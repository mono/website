---
title: Languages
redirect_from:
  - /Languages/
---

Multiple languages can be used with the Mono platform. The Mono project provides [C#](/docs/about-mono/languages/csharp/), [Basic](/docs/about-mono/languages/visualbasic/), and [Ilasm](/docs/tools+libraries/tools/monodis/) compilers, and there are both open source and commercial compilers that can be used with Mono.

It's important to note that any language that compiles to pure IL should work under Mono. Some languages such as Microsoft's Managed C++ do not always compile to pure IL, so they will not always work as expected, since they are not truly platform independent.

## Mono-compatible compilers

### C\#

The main C# compiler of the Mono Project is [**mcs**](/docs/about-mono/languages/csharp/). It covers all the features in C# 3.0 (2.6), 4.0, 5.0 and 6.0, including 3.0 LINQ, 4.0 dynamic and 5.0 async-await support.

C# is specified in the ISO/IEC 23271:2006 and ECMA 334 standards. Microsoft has [granted access to their patents](http://port25.technet.com/archive/2009/07/06/the-ecma-c-and-cli-standards.aspx) under their [Community Promise](https://msdn.microsoft.com/en-us/openspecifications/dn750984/).

### F\#

[F#](http://fsharp.org/) is a hybrid language that brings flavors of functional languages and imperative languages, developed by Microsoft. They release compiler that targets Mono in [some releases](http://blogs.msdn.com/b/dsyme/archive/2010/04/12/f-2-0-released-as-part-of-visual-studio-2010.aspx).

### Java

Java applications can run in Mono, see the [Java](/docs/about-mono/languages/java/) page for more details.

### Scala

Scala is a modern language primarily targeting Java, and it's ported to .NET as [Scala.NET](http://www.scala-lang.org/node/168), which is also known to run on Mono.

### Boo

[Boo](http://boo-language.github.io/) is a statically-typed language supporting dynamic scripting and meta-programming capabilities (extensible compiler, extensible syntax, macros...) with a syntax similar to Python. For details on the particular language features see the [Boo Language Wiki](https://github.com/boo-lang/boo/wiki) page.

### Nemerle

[Nemerle](http://www.nemerle.org) is a new hybrid (functional, object-oriented and imperative) programming language for the .NET platform.

### Visual Basic.NET

See our [BASIC Language](/docs/about-mono/languages/visualbasic/) page for more details.

### Python

There are two possible choices here: PythonNet and IronPython.

**PythonNet:** [Brian Lloyd](mailto:brian@No.Spam.zope.com) wrote a bridge to link the Python runtime with the .NET runtime. More information on the PS.NET project can be found [here](http://pythonnet.github.io/). This uses the real Python engine and provides a bridge between the Python world and the .NET world to interoperate.

**IronPython:** is Jim Hugunin's compiler for Python, it is a complete implementation of Python from scratch that compiles Python code into native CIL. More information is available on [the IronPython site](http://ironpython.net/)

### JavaScript

[IronJS](https://github.com/fholm/IronJS) is a DLR-based Javascript implementation that targets Mono as well as .NET.

Historically Mono used to ship 'mjs', an implementation of the JavaScript language as part of its distribution, the main author behind this effort is César Natarén.

For more details see [JScript](/archived/jscript)

### Oberon

Check out [Oberon for .NET](http://www.oberon.ethz.ch/archives/systemsarchive/dot_net) project.

### PHP

[PeachPie](https://www.peachpie.io/) is almost complete implementation of PHP based on Roslyn compiler platform, supported by .NET Foundation. It covers compilation to CLI, runtime and extension libraries allowing to run entire PHP applications as native .NET programs or libraries. See [compatibility status](https://docs.peachpie.io/compatibility-status/) for details.

### Object Pascal

[RemObjects](http://www.remobjects.com) ships an object pascal compiler. Their product is supported in both .NET and Mono.

Their [Delphi Prism](http://edn.embarcadero.com/prism) compiler support Mono out of the box.

### Lua

[NLua](http://nlua.org/) is the bind between Lua world and the .NET world. It allows the usage of Lua from C#, on Windows, Linux, Mac, iOS , Android, Windows Phone 7 and 8.

### Cobra

[Cobra](http://cobra-language.com/) both codes fast and runs fast. It also has language-level support for software quality.

Cobra combines productivity-boosting features that are otherwise scattered across multiple languages.

### Synergy-DBL

[Synergy-DBL](http://www.synergex.com/language) is a flexible, object-oriented language that runs on Mono on Android, iOS, and Linux, as well as on .NET and other platforms.

### Other languages

-   [Component Pascal](http://www.cfbsoftware.com/gpcp/)
-   [Delta Forth](http://www.bocan.ro/deltaforthnet)
-   [DotLisp](http://sourceforge.net/projects/dotlisp)
-   [#Smalltalk](http://www.refactory.com/tools/sharp-smalltalk)

## Supporting GCC languages

The choosen strategy is to use the GCC4 GIMPLE backend to target CIL bytecodes, as planned in the [GCC CIL](/archived/summer2006#gcc-cil-backend) SOC project (or the [2005 attempt](/archived/summer2005#gcc-cil)).

In 2006, the [Gcc4cil](/archived/gcc4cil) project was publicly announced. For now it supports the C language but it could be extended to support more gcc front ends.

## Missing languages

Here is a list of a few languages that we would like to see supported. We will try to maintain a set of links here with technical information for those interested in porting, implementing or adapting a compiler for any of these languages:

### C

#### Using LCC

[LCC](http://www.cs.princeton.edu/software/lcc) 4.2 has been recently released. This release adds support for compiling ANSI C programs to CIL. Note that the CIL support only works on Win32 right now, but should be easy to convert to Mono/other architectures.

LCC is not an open source compiler, but it is free as long as you do not profit from selling it.

#### Using GCC

See [Gcc4cil](/archived/gcc4cil).

### Ruby

[Ruby.Net](http://rubydotnet.googlegroups.com/web/Home.htm) from Queensland University.

The compiler can be used to statically compile a Ruby source file into a verifiable .NET v2.0 assembly or it can be used to directly execute a Ruby source file (compile, load and execute).

[IronRuby](http://ironruby.net/) from Wilco Bauwer, includes an interactive Ruby Console and works with Mono.

### ADA

A# is an ADA compiler for the CIL platform, it can be downloaded from: [here](http://asharp.martincarlisle.com/).

### Other PHP Efforts

[Phalanger](https://github.com/devsense/phalanger/) is a fairly complete PHP 5.4 to CLI compiler that can even integrate with VS 2010.

[PHP4Mono Project](http://php4mono.sourceforge.net/) an effort that was funded by the Google Summer of Code 2005.

There is an older effort by Sterling to allow PHP developers to use Mono code, see this [site](http://pecl.php.net/package/mono/).

## Other Languages

Languages which are believed to work, but have not had a complete run of all their regression tests:

### Tachy

A subset of Scheme language called [Tachy](https://github.com/jeffdik/tachy/tree/master/src).

### Mixing with other languages

See [Mixing with other languages](/docs/about-mono/languages/mixing-with-other-languages/).

## .net-language links

[Brian Ritchie](https://bitbucket.org/brianritchie/wiki/wiki/.NET%20Languages) have a list of a lot of .NET languages.

[Language Comparison](http://bean.wikidot.com/comparecsharpironpythonboo) - A simple comparison of some languages can be used with the Mono platform.
