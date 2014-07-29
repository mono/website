---
layout: obsolete
title: "Mono Rationale"
lastmodified: '2005-09-06'
permalink: /archived/Mono_Rationale/
redirect_from:
  - /Mono_Rationale/
---

Mono Rationale
==============

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#the-mono-project">1 The Mono Project</a>
<ul>
<li><a href="#background">1.1 Background.</a></li>
<li><a href="#another-explanation">1.2 Another explanation</a></li>
<li><a href="#microsofts-net">1.3 Microsoft's .NET</a></li>
<li><a href="#the-common-language-infrastructure-platform">1.4 The Common Language Infrastructure platform.</a></li>
<li><a href="#ecma-standards">1.5 ECMA standards.</a></li>
<li><a href="#mono-an-open-source-common-language-infrastructure-implementation">1.6 Mono: an Open Source Common Language Infrastructure implementation.</a></li>
<li><a href="#what-makes-up-mono">1.7 What makes up Mono?</a></li>
<li><a href="#why-use-gnome-components">1.8 Why use GNOME components?</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

The Mono Project
================

by Miguel de Icaza

(This document is out-dated, it's kept here just for historic purposes).

Background.
-----------

The GNOME project goal was to bring missing technologies to UNIX and make it competitive in the current market place for desktop applications. We also realized early on that language independence was important, and that is why GNOME APIs were coded using a standard that allowed the APIs to be easily wrapped for other languages. Our APIs are available to most programming languages on UNIX (Perl, Python, Scheme, C++, Objective-C, Ada). Later on we decided to use better methods for encapsulating our APIs, and we started to use CORBA to define interfaces to components. We complemented it with policy and a set of standard GNOME interfaces for easily creating reusable, language independent components, controls and compound documents. This technology is known as [Bonobo](http://developer.ximian.com/articles/whitepapers/bonobo). Interfaces to Bonobo exist for C, Perl, Python, and Java. CORBA is good when you define coarse interfaces, and most Bonobo interfaces are coarse. The only problem is that Bonobo/CORBA interfaces are not good for small interfaces. For example, an XML parsing Bonobo/CORBA component would be inefficient compared to a C API.

Another explanation
-------------------

I recently explained our motivations to Dave Winer, and he posted it [here](http://scriptingnews.userland.com/stories/storyReader%241275)

Microsoft's .NET
----------------

The Microsoft .NET initiative is confusing because it is a company wide effort that ranges from development tools to end user applications. .NET is a branding formative that has been applied to:

-   The .NET development platform, a new platform for writing software.

-   Web services.

-   Microsoft Server Applications.

-   New tools that use the new development platform.

-   Hailstorm, the Passport centralized single-signon system that is being integrated into Windows XP. Mono is an implementation of the .NET development platform.

The Common Language Infrastructure platform.
--------------------------------------------

Microsoft has created a new development platform. The highlights of this new development platform are:

-   A runtime environment that provides garbage collection, threading and a virtual machine specification (The Virtual Execution System, VES)

-   A comprehensive class library.

-   A new language, C\#. Very similar to Java, C\# allows programmers to use all the features available on the .NET runtime.

-   A language specification that compilers can follow if they want to generate classes and code that can interoperate with other programming languages (The Common Language Specification: CLS)

The Common Language Infrastructure platform is similar to the goals we had in GNOME of giving language independence to programmers. It is more mature, documented, larger in scope, and has a consistent design.

Any API that is written using a CLS provider language can be used by any language that is a CLS consumer. Compilers generate code in a format called Common Intermediate Language (CIL) which is an intermediate representation of a compiled program and is easy to compile to native code or compiled using Just-in-Time (JIT) engines. The restrictions placed by the runtime on the CIL byte codes ensures that it is possible to do a good job at optimizing the code in a JIT compiler. There is not really a lot of innovation in this platform: we have seen all of these concepts before, and we are all familiar with how these things work.

What makes the Common Language Infrastructure development platform interesting is that it is a good mix of technologies that have been nicely integrated.

The .NET development platform is essentially a new foundation for program development that gives Microsoft a room to grow for the coming years.

ECMA standards.
---------------

Microsoft has submitted the specifications of C\#, the runtime, the metadata and the other various bits of the .NET development platform to the [ECMA](http://www.ecma.ch) for standarization. You can get a copy of the specifications submitted to ECMA from: [http://www.dotnetexperts.com/ecma](http://www.dotnetexperts.com/ecma)

Mono: an Open Source Common Language Infrastructure implementation.
-------------------------------------------------------------------

Ximian has begun work on Mono, a project that aims to bring the Common Language Infrastructure platform to free systems. When the GNU project was launched, they picked the best operating system that was available out there, and they began to clone it: UNIX. The .NET development platform is a very rich, powerful, and well designed platform that would help improve the free software development platform. Just like the GNU project began to clone UNIX sixteen years ago, we will be cloning the .NET development platform because it is a great platform to build on.

What makes up Mono?
-------------------

There are various pieces that make up Mono today:

-   A C\# compiler.

-   The Virtual Execution System: that has the

Just-in-Time compiler, garbage collector, loader, threading engine.

-   A byte code interpreter is provided for quickly

porting Mono to new systems and debugging the JIT purposes, but it is not intended to be the ideal execution environment.

-   An implemenation of the .NET class libraries:

Remoting, Reflection, Reflection.Emit, Xml, Xpath, Xslt, Xml Serialization, Web Services support.

-   Cross platform class libraries for data access:

Postgress, MySQL, DB2, TDS, Sybase, Oracle, ODBC and Gnome's GDA.

-   UNIX class libraries: Mono.Posix

-   Gnome-specific class libraries: The Gtk\# family.

-   A code pre-compiler to generate native code ahead of

time.

-   Gtk\# a toolkit to develop GNOME applications on UNIX and Windows.

-   An implementation of the Remoting infrastructure in .NET

 Other work-in-progress components:

-   A VB.NET compiler and JScript compilers are in the works.

-   Web services on the server side.

-   We are planning to include Remoting.CORBA as part of Mono standard distribution.

Why use GNOME components?
-------------------------

GNOME is an umbrella project that consists of infrastructural components (GUI toolkit, XML libraries, CORBA implementation, printing architecture, imaging system), a desktop environment, and productivity applications. The GNOME infrastructural components can be used to quickly implement various pieces of the class libraries without reinventing the wheel, and since all those components are licensed under the terms of the GNU LGPL it is a perfect fit. Libart will be used to implement the Drawing.2D API; Gtk+ and the GNOME libraries will be used to implement the WinForms API and of course Glib and libxml will be used in various places

