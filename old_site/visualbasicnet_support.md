---
layout: obsolete
title: "VisualBasic.NET support"
lastmodified: '2010-07-07'
permalink: /old_site/VisualBasic.NET_support/
redirect_from:
  - /VisualBasic.NET_support/
  - /Language_Basic/
  - /Language_BASIC/
  - /Visual_Basic/
  - /VisualBasic/
---

VisualBasic.NET support
=======================

 Visual Basic.NET support in Mono is relatively new. The Visual Basic runtime has been available for Mono for a while, and with the release of Mono 1.2.3, the Visual Basic support is complete, with the introduction of a self-hosting compiler and class libraries for Visual Basic development on any of the Mono supported systems. For more information, read [Novell's announcement](http://www.novell.com/news/press/item.jsp?id=1289) on the Visual Basic compiler.

Having a native compiler for Visual Basic not only allows developers that wish to complete develop in a Mono supported platform, but also allows applications that depend on the CodeDOM (ASP.NET for example) to be developed using Visual Basic. Something that before the availability of the compiler was not possible.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#new-visual-basic-framework">1 New Visual Basic Framework</a></li>
<li><a href="#the-compiler">2 The compiler</a>
<ul>
<li><a href="#compiler-status">2.1 Compiler Status</a></li>
<li><a href="#installation">2.2 Installation</a>
<ul>
<li><a href="#from-packages">2.2.1 From Packages</a></li>
<li><a href="#from-source-code">2.2.2 From Source Code</a></li>
</ul></li>
<li><a href="#faq-for-the-visual-basic-framework">2.3 FAQ for the Visual Basic Framework</a>
<ul>
<li><a href="#what-is-the-role-of-the-compiler-in-the-development-process">2.3.1 What is the role of the compiler in the development process?</a></li>
<li><a href="#why-is-this-new-vb-compiler-important">2.3.2 Why is this new VB compiler important?</a></li>
<li><a href="#what-are-the-uses-of-a-native-visual-basicnet-compiler-on-unix">2.3.3 What are the uses of a native Visual Basic.NET compiler on Unix?</a></li>
<li><a href="#for-which-version-of-visual-basic-will-this-compiler-work-and-when-is-it-available">2.3.4 For which version of Visual Basic will this compiler work and when is it available?</a></li>
<li><a href="#if-someone-is-using-net-30-will-this-work">2.3.5 If someone is using .NET 3.0, will this work?</a></li>
<li><a href="#is-this-part-of-the-recent-novell-microsoft-agreement">2.3.6 Is this part of the recent Novell-Microsoft agreement?</a></li>
<li><a href="#is-the-visual-basic-8-compiler-considered-stable">2.3.7 Is the Visual Basic 8 compiler considered stable?</a></li>
<li><a href="#will-applications-compiled-using-the-vb-compiler-in-linux-or-mac-run-on-windows">2.3.8 Will applications compiled using the VB compiler in Linux (or Mac) run on Windows?</a></li>
<li><a href="#do-applications-compiled-under-linux-require-the-vb-runtime-to-run">2.3.9 Do applications compiled under Linux require the VB runtime to run?</a></li>
<li><a href="#will-there-be-a-performance-lag-in-compiling-and-running-vbnet-apps-on-other-platforms">2.3.10 Will there be a performance lag in compiling and running VB.NET apps on other platforms?</a></li>
</ul></li>
</ul></li>
<li><a href="#old-visual-basic-framework">3 Old Visual Basic Framework</a></li>
</ul></td>
</tr>
</tbody>
</table>

New Visual Basic Framework
==========================

A new Visual Basic.NET framework is under development, and it consists of two components: a new VB.NET compiler written in VB.NET (developed by Rolf Bjarne Kvinge) and a new VB.NET runtime developed completely in VB.NET under development at Mainsoft by Rafael Mizrahi and Boris Kirzner.

The new runtime is being developed in VB.NET and does no longer require the ILASM and Perl hacks that were required to implement the Visual Basic runtime as we did in the past. The new runtime also contains a large collection of regression tests to ensure that the quality of the runtime, something that we did not have in the past.

The compiler
============

Vbnc is a CIL compiler for the Visual Basic.Net language, written in Visual Basic.Net. The compiler is targeting the 2.0 version of the CIL language, and due to the implementation of the reflecion api in .NET it is currently impossible to generate 1.0 assemblies.

Compiler Status
---------------

The compiler is mostly feature-complete (compared to Visual Basic 8 (Visual Studio 2005)), with the following exceptions:

-   The support for Option Explicit Off is not implemented (no plans for this for the moment)
-   XML comments (no plans for this for the moment)

Installation
------------

### From Packages

Starting with Mono 1.2.3, packages of the Mono Visual Basic Compiler and Visual Basic Runtime are available at our [Downloads]({{site.github.url}}/old_site/Downloads "Downloads") page.

### From Source Code

The code is currently available from SVN from the module **mono-basic**, alternatively a source code package is available from our [Downloads]({{site.github.url}}/old_site/Downloads "Downloads") page.

To install Mono Basic, use the usual:

``` bash
   $ ./configure
   $ make && sudo make install
```

Then you will be able to use **vbnc** as your command line compiler to build Visual Basic applications.

FAQ for the Visual Basic Framework
----------------------------------

### What is the role of the compiler in the development process?

A compiler is a computer program that translates text written in a computer language (the source language) into another computer language (the target language). The most common reason for wanting to translate source code is to create an executable program. By creating the Visual Basic compiler, the Mono Project has developed a program, written in Visual Basic itself, that can translate Visual Basic language into computer language that will allow the application to be executable across across multiple platforms, including Linux.

### Why is this new VB compiler important?

This is a milestone step forward in the Mono project. There are a huge number of developers worldwide who write using Visual Basic and this VB compiler makes it possible for those developers to write applications that run on Linux without needing any specific Linux expertise. Also, developers can now do Visual Basic development \*in\* Linux as opposed to using Linux only as a deployment target.

### What are the uses of a native Visual Basic.NET compiler on Unix?

It allows:

-   Developers to develop applications natively on Unix.
-   Developers can continue to use Visual Studio on Windows and run the resulting binaries on Linux, allowing them to move their development to Unix when needed.
-   The hosting of VB.NET-based ASP.NET applications on Unix.

### For which version of Visual Basic will this compiler work and when is it available?

The new Visual Basic compiler is an implementation of Visual Basic.NET version 8, so it has support for new features in the language such as generics. The current Mono 2.6 release (available from our [Downloads]({{site.github.url}}/old_site/Downloads "Downloads") page) includes the Visual Basic 8 compiler written in Visual Basic 8, and Mainsoft's Visual Basic runtime for 2.0. The compiler only targets the 2.0 framework API, while the runtime supports both 1.0 and 2.0 profiles.

### If someone is using .NET 3.0, will this work?

.NET 3.0 is essentially a new set of libraries for .NET 2.0. We're working on some of these pieces right now, but we have not released any of this yet. The first one will be WCF, then followed at some point by WPF. So right now, if you're dependent on 3.0 APIs, you wont be able to port. But there are not many of these applications out there yet.

### Is this part of the recent Novell-Microsoft agreement?

No. The Mono project is sponsored by Novell, but it is not part of the technical cooperation agreement announced between Novell and Microsoft in November 2006. Mono developers have been working on the compiler for some time. It is a significant technical achievement. Since it is open source, the technology is available for others to use.

### Is the Visual Basic 8 compiler considered stable?

We consider the compiler right now to be feature complete. That doesn't mean that it is bug free. Although there is enormous set of test suites that we run against it, people are still going to run into bugs, which they are encouraged to report at our [Bugs]({{site.github.url}}/old_site/Bugs "Bugs") page.

### Will applications compiled using the VB compiler in Linux (or Mac) run on Windows?

Yes, they will require .NET 2.0 to be installed.

### Do applications compiled under Linux require the VB runtime to run?

Mono offers this as an option. Either you install Mono's Visual Basic runtime, or you can use a Mono process called "Bundling" that will generate a static executable with no external dependencies to run your binary.

### Will there be a performance lag in compiling and running VB.NET apps on other platforms?

There are certain API calls that are Windows-specific which we have mapped to Linux, but the majority of applications do not depend strongly on Windows. The one bit that is not supported are COM components, since Linux has no equivalent to COM. If a Visual Basic application requires COM or ActiveX controls, those will not run.

Old Visual Basic Framework
==========================

For information about the old visual basic framework in Mono, see our [Old Visual Basic]({{site.github.url}}/old_site/Old_Visual_Basic "Old Visual Basic") page.

