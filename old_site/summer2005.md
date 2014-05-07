---
layout: obsolete
title: "Summer2005"
permalink: /old_site/Summer2005/
redirect_from:
  - /Summer2005/
---

Summer2005
==========

During the Summer of 2005, the Mono project will be mentoring a group of students as part of Google's Open Source Summer of Code initiative.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#The_Members">1 The Members</a></li>
<li><a href="#The_Objectives">2 The Objectives</a></li>
<li><a href="#GCC_CIL">3 GCC CIL</a>
<ul>
<li><a href="#Objectives">3.1 Objectives</a></li>
<li><a href="#Notes">3.2 Notes</a></li>
</ul></li>
<li><a href="#Managed_C.2B.2B_extensions_to_GCC">4 Managed C++ extensions to GCC</a></li>
<li><a href="#Ruby.NET">5 Ruby.NET</a>
<ul>
<li><a href="#Objectives_2">5.1 Objectives</a></li>
</ul></li>
<li><a href="#MSBuild_implementation">6 MSBuild implementation</a>
<ul>
<li><a href="#Objectives_3">6.1 Objectives</a></li>
</ul></li>
<li><a href="#Diva">7 Diva</a>
<ul>
<li><a href="#Objectives_4">7.1 Objectives</a></li>
</ul></li>
<li><a href="#ASP.NET_GUI_Designer">8 ASP.NET GUI Designer</a>
<ul>
<li><a href="#Objectives_5">8.1 Objectives</a></li>
</ul></li>
<li><a href="#XAML_Compiler">9 XAML Compiler</a>
<ul>
<li><a href="#Objectives_6">9.1 Objectives</a></li>
</ul></li>
<li><a href="#MonoDoc">10 MonoDoc</a>
<ul>
<li><a href="#Objectives_7">10.1 Objectives</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

The Members
===========

-   Jaen Saul: [\#Ruby.NET](#Ruby.NET) implementation
-   Jb Evain: [Cecil/Write]({{site.github.url}}/old_site/Cecil "Cecil") support
-   Jeyasankar Kottalam: [GCC CIL](#GCC_CIL) backend
-   Marek Sieradzki: [MSBuild](#MSBuild) implementation
-   Michael Hutchinson: [ASP.NET GUI Designer](#ASP.NET_GUI_Designer)
-   Aaron Tomb: Bug finder
-   Blagovest Dachev: [ASP.NET GUI Designer](#ASP.NET_GUI_Designer)
-   Hans Hesse: Managed C++ front-end
-   Iain McCoy: [XAML compiler](#XAML_compiler)
-   Michael Dominic: [Diva Video Editor](#Diva)
-   Raphael Romeikat: PHP Compiler for .NET
-   Dmitry Bobrovsky: XSLT Compiler
-   Mario Sopena Novales: [Monodoc](#Monodoc) improvements
-   Pedro Martínez Julia: Windows.Forms 2 controls
-   Tino Morenz: QNX Port
-   Florian Groß: Ruby.NET

The Objectives
==============

The objective is to turn you into active members of the open source community, by exposing you to the process, the community and the tools.

There were 280 applications submitted for the Mono project, and your application was selected based on your application, the description of your project, your previous background and the importance of your project.

There were many other applications that we could not accept. So we want to make every project that was selected successful. To do so, we will be coaching you and we will be giving you some advice as you go along.

We have been working on Mono for a long time and we have researched many of the topics that you are going to be working on. We know that the summer is short, so if you are having any trouble getting your work done, do not hessitate to contact me with questions.

I will be your initial mentor, but as your project develops, you will work with other members of the team.

GCC CIL
=======

Location: [Forge Project](http://forge.novell.com/modules/xfmod/project/?gcc-cil)

Blog: [http://gcc-cil.blogspot.com/](http://gcc-cil.blogspot.com/)

### Objectives

The new version of GCC has a new internal representation called "GENERIC" (which is later transformed into "GIMPLE") which is suitable as a representation that we can use to generate ECMA CIL byte codes.

The task would be to write a backend to GCC4 that generates CIL byte codes.

This project should compile C initially, but should allow for external methods to be invoked through P/Invoke and structure passing and returning must be implemented.

Another component is that some mechanism for passing enough information to the backend must be arranged, this is so that we can emit proper CIL metadata for methods.

Some documentation can be found in gcc/doc (tree.defs has some explanations) and some older documentation is available [here as well](http://gcc.gnu.org/ml/gcc/2002-08/msg01397.html)

Acceptance criteria: a non-trivial C application compiled to CIL should be demostrated to run on top of the Mono VM. For example, GNU tar, Midnight Commander, vi or anything moderately interesting (hello world does not count)

### Notes

To build:

If you want to try it out, you'll need to check out the code and perform a GCC build with --target=clr-unknown-none . The build will fail after building the compiler proper, but that's fine. Just cd into the "gcc" subdirectory of your build directory and use the cc1 executable. e.g. "./cc1 nqueens.c" will compile nqueens.c to nqueens.s with default options.

Then you can ilasm the .s file and execute it.

Managed C++ extensions to GCC
=============================

This project should extend the semantics of G++ to support the managed extensions as described on the ECMA standard.

Since the extensions are quite big, and it is not possible to do the whole thing during the summer, a submission should scope what things will be implemented. The compiler does not have to generate the code, but it must dump a description of the managed information it gather.

The specification is available here:

[ECMA C++](http://www.plumhall.com/ecma/)

Ruby.NET
========

### Objectives

A compiler for the Ruby language that would JIT-compile Ruby code into CIL code.

The compiler should be written in C\#. Since Ruby is dynamic and will require the "eval" functionality to be available at runtime, we do not want to have two runtimes loaded at the same time. Alternatively, if you think you can pull this off, you can write Ruby.NET in Ruby.NET, but this probably will require more time than you have this summer to complete

A complete compiler is probably very hard to do, so we are willing to trade off completeness for maintainability of the code (maintainability does not mean over-engineered).

If an existing piece of Ruby.NET code can be reused (there are a few implementations) it is acceptable to use that as a foundation as long as a proposal is presented on how you plan on completing the missing pieces.

It is also acceptable to use as many Ruby libraries as you want from the official Ruby distribution.

Acceptance criteria: The resulting compiler should be able to run successfully the test at: ruby-1.8.2/sample/test.rb

MSBuild implementation
======================

### Objectives

MSBuild is a new "make-like" program to compile applications.

An MSBuild implementation in C\#.

Acceptance Criteria:

-   Should parse MSBuild files (you might want to consider using the XMLSerializer).
-   Support for the following tasks:
    -   AL
    -   Copy
    -   Csc
    -   Delete
    -   Exec
    -   FindUnderPath
    -   Generate\* tasks
    -   MakeDir/RemoveDir
    -   Touch
    -   SignFile
    -   Register/UnregisterAssembly
    -   WriteLinesToFile
-   Conditionals
-   Transforms
-   Command-line compatibility
-   Code must be maintainable after you deliver the code, so we can maintain the code on an ongoing basis

This implements the Microsoft.Build.\* namespaces and assemblies

Diva
====

[Blog](http://diva.mdk.org.pl/) / [Diva Novel Forge project](http://forge.novell.com/modules/xfmod/project/?diva)

### Objectives

Create a video editing GUI tool using Mono, Gtk\# and GStreamer

ASP.NET GUI Designer
====================

Blago is working on the Mozilla side.

Michael is working on the MonoDevelop side.

### Objectives

Use the Mozilla editing engine to become a GUI designer where ASP.NET controls can be dragged and dropped, properties examined, text inserted, etc.

We do not need a full blown designer or IDE as we will be integrating the resulting work into MonoDevelop. We only care about the necessary extensions to be in place to actually provide this functionality.

Acceptance criteria:

-   Selection of asp.net controls should show handles around the controls.
-   Allow for editing of the HTML text.
-   Selection of user-defined custom controls at the control-level, not the individual HTML level.
-   Properties rendered when a control is selected
-   Have a way of changing the properties and have the changes be reflected in the UI.
-   Support double-clicking on a control (simple or compound) to trigger an event.
-   Write out the HTML with high-level descriptions (ie, if an asp.net input control is there, we need \<asp:input\> generated, not \<input\>).

The GUI must be written using Gtk\#, as we plan to integrate this into MonoDevelop. But you do not need to do a stellar job there. What matters is that the previous items can be achieved.

XAML Compiler
=============

Location: Mono SVN repository.

### Objectives

1.  A compiler, xamlc, that takes a xaml file and emits a c\# file
2.  The bits of System.Windows.Serialization needed to support the xaml compiler
3.  The bits of System.Windows.Serialization that provide useful hooks, such as the Parser class that produces an instance of the class described by a xaml file.

MonoDoc
=======

Location: Mono SVN repository.

Blog: [http://msopena.blogspot.com](http://msopena.blogspot.com)

### Objectives

Monodoc improvements.

