---
title: ".NET Framework Architecture"
lastmodified: '2007-12-19'
redirect_from:
  - /.NET_Framework_Architecture/
---

.NET Framework Architecture
===========================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#the-big-picture">1 The Big Picture</a></li>
<li><a href="#class-library">2 Class Library</a>
<ul>
<li><a href="#namespaces">2.1 Namespaces</a></li>
<li><a href="#assemblies">2.2 Assemblies</a></li>
</ul></li>
<li><a href="#common-language-infrastructure">3 Common Language Infrastructure</a></li>
<li><a href="#common-language-specification">4 Common Language Specification</a></li>
<li><a href="#managed-and-unmanaged-code">5 Managed and Unmanaged Code</a></li>
<li><a href="#bibliography">6 Bibliography</a></li>
<li><a href="#contributors">7 Contributors</a></li>
</ul></td>
</tr>
</tbody>
</table>

The Big Picture
===============

When approaching something as complex as .NET, it helps to have some idea of how it relates to your work. The following diagram provides some context for where your application fits into the Mono/.NET framework.

[![Figure 1](/archived/images/4/43/Context.png)](/archived/images/4/43/Context.png "Figure 1")

 NOTE: This is a greatly simplified view; we're ignoring ASP.NET and ADO.NET for now.

Refer to the above diagram for the following sections.

Class Library
=============

The class library provides a comprehensive set of facilities for application development. Primarily written in C#, it can be used by any language, thanks to the Common Language Specification .

The class library is structured into Namespaces, and deployed in shared libraries known as Assemblies. When we speak of the .NET framework , we are primarily referring to this class library.

Namespaces
----------

Namespaces are a mechanism for logically grouping similar classes into a hierarchical structure. This prevents naming conflicts. The structure is implemented using dot-separated words. The top level namespace for most of the .NET framework is System . Under the System namespace you'll find the following:

-   System.IO
-   System.Net
-   System.Net.Sockets
-   System.Reflection
-   System.Threading
-   ...and many others. For a complete list, see the [Mono class library status page](http://mono.ximian.com/class-status/).

There are other top-level namespaces as well; Accessibility , and Windows are examples. You can also create your own namespaces: just prefix them with the name of your organization. Microsoft.VisualBasic is an example.

Assemblies
----------

Assemblies are the physical packaging of the class libraries. These are .dll files, but don't confuse them with Win32 shared libraries. Examples are

-   mscorlib.dll
-   System.dll
-   System.Data.dll
-   Accessibility.dll Note that namespaces are often distributed among several assemblies. Again, see the [Mono class library status page](http://mono.ximian.com/class-status/).

An assembly can also be composed of several files.

Common Language Infrastructure
==============================

More commonly known as the Common Language Runtime , this is implemented by the Mono executable. This runtime is used to execute the compiled .NET application. The common language infrastructure is defined by ECMA standard [ECMA-335](https://www.ecma-international.org/publications-and-standards/standards/ecma-335/) .

To run your application, you must invoke the runtime with the relevant parameters.

Common Language Specification
=============================

This is specified in [ECMA-335](https://www.ecma-international.org/publications-and-standards/standards/ecma-335/),chapter 6. It defines the interface to the CLI, such as conventions like the underlying types for Enum.

The Mono compiler generates an image that conforms to the CLS. This is the Common Intermediate Language . The Mono runtime takes this image and runs it.

The ECMA standard formally defines a library that conforms to the CLS as a framework .

Managed and Unmanaged Code
==========================

Within a native .NET/Mono application, all code is *managed*; that is, it is governed by the CLI's style of memory management and thread safety. .NET/Mono applications can use legacy code, which is referred to as *unmanaged*, by using the `System.InterOpServices` libraries to create C# bindings. Many of the libraries which ship with Mono use this feature of the CLI; in particular, the [Gtk#](/GtkSharp) libraries are C# wrappers around the underlying C libraries.

Bibliography
============

ECMA Standard [334](https://www.ecma-international.org/publications-and-standards/standards/ecma-334/) , the C# language specification.

ECMA Standard [335](https://www.ecma-international.org/publications-and-standards/standards/ecma-335/) , the Common Language Infrastructure.

MSDN documentation for the .NET framework is [here.](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpguide/html/cpconinsidenetframework.asp)

O'Reilly [C# in a Nutshell](http://www.oreilly.com/catalog/csharpnut/chapter/ch01.html) is definitely recommended.

Contributors
============

Johannes Roith, Norman Lorrain, Jon Kessler, Shane Landrum
