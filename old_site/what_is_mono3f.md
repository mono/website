---
layout: obsolete
title: "What is Mono%3F"
permalink: /old_site/What_is_Mono%3F/
redirect_from:
  - /What_is_Mono%3F/
---

What is Mono%3F
===============

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#what-is-mono">1 What is Mono?</a></li>
<li><a href="#the-importance-of-a-free-implementation-of-the-ecma-standards">2 The Importance of a free implementation of the ECMA standards</a></li>
<li><a href="#state-of-mono">3 State of Mono</a></li>
<li><a href="#mono-and-licensing">4 Mono and Licensing</a></li>
</ul></td>
</tr>
</tbody>
</table>

What is Mono?
=============

Mono is a community-built implementation of the .NET Framework for a wide range of operating systems and CPU architectures. In reality, Microsoft's .NET Framework is only the most common implementation of an ECMA standard, numbers 334 and 335, which allows for programs to be developed on any platform and run on any other platform.

ECMA 334/335's architecture is a win for programmers. It reduces the cost of development and improves maintainability by taking care of the low-level boring details. This allows programmers to focus on innovation and on having fun.

As of this writing, Mono supports Linux, Unix, Windows, MacOS and other embedded systems as the host OS, and Intel, PPC, Sparc, ARM and HPPA as the host CPUs.

The Mono project's work currently includes the basics:

-   C\# compiler, a virtual machine, an advanced code generation engine (for just-in-time compilation and pre-compilation of code).
-   Class libraries to support ASP.NET WebForms, WebServices, ADO.NET databases and Windows.Forms
-   Mono, Unix or Gnome specific libraries.

However, we have not limited ourselves to implementing the Microsoft APIs. Mono ships with various libraries that exploit features unique to Unix, Gnome, and other free/open source software.

Conceptually:

[Image:two-stacks.png]

Mono allows developers to build Unix/Linux applications with Gtk+ and Gnome for the desktop; to work with vector graphics using the powerful Cairo library; and to build advanced GUIs based on the Mozilla libraries. This makes the Mono framework an excellent choice for building Linux/Unix applications.

Mono's libraries support third-party databases (Postgres, MySQL, DB2, Sybase, SqlLite), standards-compliant directory services (LDAP). In addition to XML Schema support, Mono libraries provide validators and readers for Relax NG-based systems.

If you're a developer with Windows experience, Mono makes it easy for you to build Linux applications. If you have Linux experience, Mono makes your code faster to build and easier to port to other platforms.

The Importance of a free implementation of the ECMA standards
=============================================================

Today the .NET/ECMA virtual machine is one of the most advanced commercial VMs available, and we want to bring the benefits of this virtual machine to Linux developers. We also want Linux to compete in the marketplace in terms of programmer productivity.

It is also key to allow Windows developers to support more than one platform with their codebase, instead of requiring them to rewrite their code to support Linux or the Mac: they can share the engine of their applications, and port their GUI to native libraries: Gtk on Linux, and Cocoa on Mac, while keeping all of their code in C\# and obtaining the benefits of this rich VM and all of the class libraries available for them.

In a way, you get to reuse your knowledge, your experience, your staff to support more platforms, and you can reduce your costs of development.

State of Mono
=============

The Mono 1.0 series includes the execution environment, the C\# compiler, the pre-compiler, JIT engine and associated libraries.

The ASP.NET WebForms, ASP.NET Web Services, ADO.NET, Remoting, serialization, DirectoryServices are all functional and being used on a day-to-day basis.

The major components that will not ship in the Mono 1.0 time frame are Code Access Security (CAS), Windows.Forms and EnterpriseServices (which we are not likely to support at any point) nor support for COM components.

COM is not wildly used in Unix, only a few apps use it, and when they do, its their own version of COM (Mozilla and OpenOffice), so we have no plans at this point for that.

For more information, you might want to read the [Mono Roadmap](http://www.go-mono.com/mono-roadmap.html) , which contains the precise plans for future relases of Mono, or the [FAQ]({{site.github.url}}/about/faq.html) .

Mono and Licensing
==================

The Mono runtime is licensed under the terms of the GNU LGPL, but it is also available under a commercial license for those who want to add proprietary extensions to the virtual machine. For licensing details, contact mono-licensing@ximian.com.

The Mono Compilers (C\#, VB.NET) are licensed under the terms of the GNU GPL.

The Mono class libraries are licensed under the terms of the MIT X11 license, which is a very lax open source license.

