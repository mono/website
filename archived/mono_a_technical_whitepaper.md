---
layout: obsolete
title: "Mono, a technical whitepaper"
lastmodified: '2007-03-12'
permalink: /archived/Mono,_a_technical_whitepaper/
redirect_from:
  - /Mono,_a_technical_whitepaper/
---

Mono, a technical whitepaper
============================

*Note:* this is a very early draft of the Mono technical white paper some chapters are nothing more than placeholders right now with awkwardly written content.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#executive-overview">1 Executive Overview</a>
<ul>
<li><a href="#mono-increases-developer-productivity">1.1 Mono increases developer productivity</a></li>
<li><a href="#mono-brings-more-software-to-linux">1.2 Mono brings more software to Linux</a></li>
<li><a href="#mono-reuses-existing-knowledge-work">1.3 Mono reuses existing knowledge, work</a></li>
<li><a href="#mono-provides-cross-platform-development">1.4 Mono provides cross-platform development</a></li>
<li><a href="#mono-open-source-development-platform">1.5 Mono, open source development platform</a></li>
</ul></li>
<li><a href="#overview">2 Overview</a>
<ul>
<li><a href="#target-audience">2.1 Target Audience</a></li>
<li><a href="#introduction-to-mono">2.2 Introduction to Mono</a>
<ul>
<li><a href="#features-and-benefits">2.2.1 Features and Benefits</a></li>
</ul></li>
<li><a href="#the-mono-rationale">2.3 The Mono rationale</a>
<ul>
<li><a href="#opportunities">2.3.1 Opportunities</a></li>
<li><a href="#solution">2.3.2 Solution</a></li>
</ul></li>
<li><a href="#the-mono-community-and-open-source-projects">2.4 The Mono community and open source projects</a></li>
</ul></li>
<li><a href="#developer-personalities">3 Developer Personalities</a>
<ul>
<li><a href="#microsoft-net-developer">3.1 Microsoft .NET developer</a>
<ul>
<li><a href="#aspnet-web-application-and-web-services-applications">3.1.1 ASP.NET Web Application and Web Services Applications</a></li>
<li><a href="#desktop-applications-with-systemwindowsforms">3.1.2 Desktop Applications with System.Windows.Forms</a></li>
</ul></li>
<li><a href="#it-developer">3.2 IT Developer</a></li>
<li><a href="#isv-developer">3.3 ISV developer</a></li>
<li><a href="#linux-desktop-applications-developer">3.4 Linux Desktop applications developer</a></li>
<li><a href="#mac-os-x-developer">3.5 Mac OS X developer</a></li>
<li><a href="#unix-developer">3.6 Unix developer</a></li>
<li><a href="#web-applications-developer">3.7 Web Applications developer</a></li>
<li><a href="#embeded-system-application-developer">3.8 Embeded system application developer</a></li>
</ul></li>
<li><a href="#mono-technical-overview">4 Mono Technical Overview</a>
<ul>
<li><a href="#features-list">4.1 Features List</a></li>
<li><a href="#runtime-environment">4.2 Runtime environment</a>
<ul>
<li><a href="#virtual-machine">4.2.1 Virtual Machine</a></li>
<li><a href="#supported-platforms">4.2.2 Supported Platforms</a>
<ul>
<li><a href="#linux">4.2.2.1 Linux</a></li>
<li><a href="#mac-os-x">4.2.2.2 Mac OS X</a></li>
<li><a href="#windows">4.2.2.3 Windows</a></li>
<li><a href="#unixes">4.2.2.4 Unixes</a></li>
</ul></li>
<li><a href="#language-support">4.2.3 Language Support</a>
<ul>
<li><a href="#c">4.2.3.1 C#</a></li>
<li><a href="#java">4.2.3.2 Java</a></li>
<li><a href="#vbnet">4.2.3.3 VB.NET</a></li>
<li><a href="#ironpython-and-boo">4.2.3.4 Ironpython and Boo</a></li>
<li><a href="#miscelaneous-languages">4.2.3.5 Miscelaneous languages</a></li>
</ul></li>
<li><a href="#embedding-the-runtime">4.2.4 Embedding the runtime</a></li>
</ul></li>
<li><a href="#developer-productivity">4.3 Developer Productivity</a></li>
<li><a href="#system-classes">4.4 System Classes</a></li>
<li><a href="#web-application-and-web-services">4.5 Web Application and Web Services</a>
<ul>
<li><a href="#aspnet">4.5.1 ASP.NET</a></li>
<li><a href="#xsp-apache-and-mod-mono">4.5.2 XSP, Apache and mod_mono</a></li>
</ul></li>
<li><a href="#desktop-applications-development">4.6 Desktop Applications development</a>
<ul>
<li><a href="#systemwindowsforms">4.6.1 System.Windows.Forms</a></li>
<li><a href="#gtk">4.6.2 Gtk#</a></li>
<li><a href="#cocoa">4.6.3 Cocoa#</a></li>
<li><a href="#others">4.6.4 Others</a></li>
</ul></li>
<li><a href="#database-connectivity">4.7 Database Connectivity</a></li>
<li><a href="#interactions-with-native-libraries">4.8 Interactions with native libraries</a></li>
<li><a href="#migration-of-existing-net-applications">4.9 Migration of existing .NET applications</a></li>
<li><a href="#compatible-libraries-and-components">4.10 Compatible libraries and components</a></li>
<li><a href="#mono-packaging">4.11 Mono packaging</a></li>
</ul></li>
<li><a href="#mono-licensing">5 Mono Licensing</a>
<ul>
<li><a href="#open-source-license">5.1 Open Source license</a></li>
<li><a href="#commercial-license">5.2 Commercial license</a></li>
</ul></li>
<li><a href="#mono-applications">6 Mono Applications</a>
<ul>
<li><a href="#open-source">6.1 Open Source</a></li>
<li><a href="#commercial">6.2 Commercial</a></li>
</ul></li>
<li><a href="#simplified-mono-roadmap">7 Simplified Mono Roadmap</a>
<ul>
<li><a href="#mono-10">7.1 Mono 1.0</a></li>
<li><a href="#mono-12">7.2 Mono 1.2</a></li>
<li><a href="#mono-20">7.3 Mono 2.0</a></li>
</ul></li>
<li><a href="#references">8 References</a></li>
<li><a href="#conclusion">9 Conclusion</a></li>
</ul></td>
</tr>
</tbody>
</table>

Executive Overview
------------------

Mono is a comprehensive and unified open source development platform based on the .NET framework that allows IT and ISV developers to build Linux and cross-platform applications (MacOS X, S390, Sun Solaris) with unprecedented productivity.

Incorporating key components from the .NET development platform: a C\# compiler, and a portable execution system Mono provides:

-   Advanced development environment for writing Linux applications with unprecedented productivity.
-   Comprehensive APIs for delivering rich client, web services and server-side applications.
-   Cross-platform deployment capabilities, supporting Linux, Sun Solaris, Apple MacOS X, Microsoft Windows NT/XP and various other UNIX systems on a variety of architectures.
-   Highly productive tools that facilitate the creation of product APIs and SDKs that are language independent across multiple operating systems.

Why should you care about Mono ? Because it will change the way software is developed for cross-platform use on both Linux and Windows.

→ insert here something about the benefits of open source for commercial endeavors

→ from miguel's interview on Novell.com

### Mono increases developer productivity

Mono brings a very modern development platform for Linux; it allows software developers to reuse components that, so far, were only available on Windows and gives them access to many components that used to be out of reach for Linux.

The creation of Mono was a reaction to the Ximian Evolution development experience. Evolution is the best groupware client for open source, praised time and again by every reviewer, but the time and cost of developing it was too high. Mono allows new generations of programmers to write their next big application with less money, less time and the ability to innovate faster.

Today the .NET/ECMA virtual machine is one of the most advanced commercial Virtual Machine available, and Mono bring the benefits of this virtual machine to Linux developers. It increases programmer productivity and makes Linux a top contender in the marketplace.

### Mono brings more software to Linux

Currently software houses have to choose carefully which platforms they will support because supporting new platforms often means that they have to rewrite large portions of their code for each operating system, so they tend to support only the major platform: Windows. Mono is bringing more and more software to Linux transparently.

### Mono reuses existing knowledge, work

Developers who write code for Windows can immediately be productive on Linux. They can reduce training costs and easily add Linux to the menu of systems they support, and continue to use familiar tools and processes to produce software.

Developers will be able to use the same programming languages (C\#, Visual Basic .NET, Java, Python) and Application Programing Interfaces (such as ADO.NET, XML, ASP.NET, System.Windows.Forms) they work with on Windows. They can re-use existing .NET class libraries whether created by third parties or their own, without even having to re-compile. Moreover, ASP.NET web services and applications as well as rich client software built with System.Windows.Forms will run un-modified on Linux and other platforms supported by Mono.

### Mono provides cross-platform development

Mono supports a wide range of platforms: Linux, Sun Solaris, Microsoft Windows and Apple Mac OS X. Programs written in Mono will automatically work across all of the supported operating systems and architectures—without recompilation. Mono is a tool that can help unify these divergent worlds.

### Mono, open source development platform

Today, Mono is the seventh largest open source project, with 200 developers with access to the CVS, and about a third of them active on any given week.

Unlike many of today's mainstream development platform such as Microsoft .NET, Sun's Java or Apple's Cocoa, all closed source products, Mono is open source with its runtime, compilers and libraries available under an open source license.

Relying on a corporate sponsored open source development platform has many advantages amongst which:

-   Large community of contributors to the platform
-   -   

Overview
--------

### Target Audience

-   IT developers and managers in enterprises considering building or migrating applications to Linux as they adopt it for desktops or servers.
-   ISV product managers, CTOs and engineering leads considering supporting Linux for their software (Horizontal and Vertical) as their customers start requesting Linux versions.
-   Open Source software developers that target the Linux Desktop

### Introduction to Mono

Mono is a comprehensive and unified open source development platform based on the Microsoft .NET framework that allows IT and ISV developers to build Linux and cross-platform applications (MacOS X, S390, Sun Solaris) with unprecedented productivity.

Sponsored by Novell, the Mono project has an active and enthusiastic contributing community and ispositioned to become the leading choice for development of Linux applications. . Mono includes both developer tools and the infrastructure needed to run .NET client and server applications.

Mono includes a complete developer toolchain, a .NET compatible runtime and two stacks of APIs: a Mono stack that takes the most advantage of your Linux server and desktop and a set of APIs compatible with the Microsoft .NET Framework 1.1 providing support for ASP.NET, ADO.NET and many other components.

#### Features and Benefits

Incorporating key .NET compliant components: a C\# compiler, class libraries and a portable execution system the Mono Project provides:

-   Advanced development environment for writing Linux applications with unprecedented productivity.
-   Comprehensive APIs for delivering rich client, web services and server-side applications.
-   Cross-platform deployment capabilities, supporting Linux, Sun Solaris, Apple MacOS X, Microsoft Windows NT/XP and various other UNIX systems on a variety of architectures.
-   Highly productive developer tools that facilitate the creation of product APIs and SDKs that are language independent across multiple operating systems.

### The Mono rationale

→ needs to be beefed up

#### Opportunities

Migrating to Linux servers and desktop is an enticing proposition whether prompted by license or maintenance cost, stability and performance, consolidation and administration ROI.

Novell's Linux offering includes a strong OS core, desktop and office productivity applications as well as server-based services. Developing applications for the Linux desktop remains a challenging proposition and migrating them is a complex task.

The languages and tools that exist today were created for an extremely technical audience of Linux hackers. They are not particularly easy to use, nor do they meet the requirements of the general software development market in terms of productivity, simplicity and suitability to solve business problems.

While quite powerful, today's development languages and development environments for Linux have a very steep learning curve and don't usually allow for deployement of the same code base on different hardware platforms.

For those reasons, no general standard for Linux development or cross-platform tool has emerged that mainstream IT and ISV developers can realistically use.

#### Solution

Mono is a commercial-grade development platform for Linux desktop and servers which delivers a complete set of tools and APIs.

Being an open source solution based on published standards and proven programming languages and libraries, Mono allows enterprises to leverage existing corporate skill sets, technical documentations, tool sets and third party components

Beyond Linux, Mono's cross platform capabilities for deployment of created applications on Microsoft Windows, Apple MacOS X and other flavors of UNIX is key to IT organizations and ISVs that have to support many client and server platforms.

### The Mono community and open source projects

Since its creation in 2001 by Miguel de Icaza (founder of the Gnome desktop project), the Mono open source project has grown to be one of the largest open source community endeavor.

Strong of more than two hundrer regular contributors, Mono is very accessible to new developers. Because of the breadth of the project and the large numbers of sub-projects under its umbrella (Gtk\#, MonoDevelop, VB.NET & JScript runtimes and compilers, Cocoa\# and many, many more), it is easy contributors to find an area that fits their expertise whether seasonned open source developers or relatevely new enthousiasts

Developer Personalities
-----------------------

Mono's original raison d'être was to help Linux developpers build desktop applications by delivering a complete and modern open source development platform. Because of the technology choices made early on, it also serves as a vessel for cross platform development, an enticing offer for Windows developers, IT and ISV alike. Let's explore how different profiles of developers can use Mono and why they'd use it. A real life developer will likely be a mix of those different personalities. For example, a .NET developer that builds a software package for Windows and is looking at ways to expand it market to Linux will likely be a Microsoft .NET developer, an ISV developer and a Linux desktop application developer.

### Microsoft .NET developer

Now that Microsoft has moved most of its developer technologies to .NET, a typical Windows application developer is likely to be using .NET in some fashion for any Windows development.

While .NET is in concept platform agnostic, before Mono, it remained a Microsoft Windows only platform. With Mono, Microsoft .NET developers can use the same technologies they use on Windows to develop or migrate their applications to Linux and other platforms supported by Mono.

As such they can re-use:

-   Programming Language expertise (C\#, VB.NET, Java, JScript, ...)
-   Working knowledge of the many .NET APIs (System.XML, ASP.NET, ADO.NET, System.Windows.Forms, ...)
-   their own .NET class libraries
-   Third party controls
-   Command Line tools (Mono's toolchain adopts the same syntax as their Microsoft equivalent)
-   Visual Studio

Since the same .NET skillset and knowledge can be used with Mono, companies can leverage:

-   Existing .NET books
-   .NET programming classes
-   Expert .NET developers

for Mono applicaition development.

#### ASP.NET Web Application and Web Services Applications

The .NET framework and its open source implementation, Mono, both include a set of web development technologies called ASP.NET. Programmers can use this set of technologies to build web applications and XML web services. ASP.NET is often used in conjunction with ADO.NET, .NET data access layer to build IT applications.

Very early on, it became apparent that a lot of Mono potential users wanted to use the framework to deploy ASP.NET applications to Linux. Mono's implementation of the ADO.NET and ASP.NET framework is very complete and can be used today to migrate and deploy existing applications to running behind Apache web server on Linux or other Unixes. The migration is essentially effortless in most cases.

Mono offers support for many commercial and open source databases so no database migration is necessary.

Deploying ASP.NET applications to Linux (or other Unixes) is a very attractive proposition where server license and maitenance costs are a concern. It also allows organizations which mainly maitain J2EE applications on Linux or Solaris for example, to consolidate their server operating systems and deploy ASP.NET applications to the same environment.

#### Desktop Applications with System.Windows.Forms

While many applications we use on a daily basis are web applications, there are still a lot of rich client applications being developped either as packaged commercial software (think Adobe Acrobat, Quicken Turbo Tax, Microsoft Word), business applications built by your IT organization or all the great little applications you might use on a daily basis (RSS reader, note taking application, Mp3 or Movie players and many others).

On Windows, most .NET developers use the Windows.Forms API to build those applications. System.Windows.Forms (or SWF) is the name given to the GUI portion of the Microsoft .NET development framework, providing access to the native Windows widgets by wrapping the existing Win32 API.

Since early 2004, the Mono project has been working on completing its System.Windows.Forms implementation. Scheduled for delivery as part of Mono 1.2 in Q3 2005, it will allow desktop applications built with System.Windows.Forms to be deployed unmodified on Linux but also on Mac OS X, BSD and Solaris.

### IT Developer

### ISV developer

Developing software is all about productivity. As the Linux desktop get adopted more and more, portability is becoming important as well. Independent software vendors are starting to see a real monetary benefit from developing code that runs on Windows, Mac OS X and Linux. Mono makes this endeavor possible and the approach, effective.

### Linux Desktop applications developer

Linux currently lacks a comprehensive development platform for building Desktop applications. Although GUI toolkits like Gtk and Qt fill the gap in some areas, they are necessary but not sufficient. Developers today need a complete set of class libraries to build and interact with Web Services, communicate with databases and integrate third party components.

### Mac OS X developer

### Unix developer

### Web Applications developer

### Embeded system application developer

Mono Technical Overview
-----------------------

### Features List

<table>
<col width="50%" />
<col width="50%" />
<tbody>
<tr class="odd">
<td align="left"><p><strong>Feature</strong></p></td>
<td align="left"><p><strong>Description</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>ECMA CLI-based virtual execution system</p></td>
<td align="left"><p>Provides an execution environment compatible with Microsoft .NET 1.1, a comprehensive class library and support for many programming language</p>
<p>An advanced runtime engine that supports both Just-in-Time and Ahead-of-Time compilation.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Java VM Support</p></td>
<td align="left"><p>Allows Java and .NET code to run side-by-side</p></td>
</tr>
<tr class="even">
<td align="left"><p>Cross-Platform Support</p></td>
<td align="left"><p>Optimizing compiler for x86, AMD64, PowerPC, SPARC and S390 based architectures (Just-in-Time (JIT) and Ahead-of-Time (<a href="{{ site.github.url }}/AOT" title="AOT">AOT</a>) compilation modes supported). Provides an highly optimized runtime environment to run applications on many different platforms without recompilation. Support for Linux, MacOS X, Windows and Solaris (HP-UX supported with the interpreter).</p></td>
</tr>
<tr class="odd">
<td align="left"><p>C# 1.0 Support</p></td>
<td align="left"><p>Complete implementation of a compiler for the ECMA C# language provides an accessible and powerful object oriented language that boost developer productivity beyond what can be achieved with languages such as C++ and Java. Includes C# 2.0 extensions such as generics to achieve even greater developer productivity.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Microsoft .NET compatible APIs</p></td>
<td align="left"><p>Provides implementations of .NET class libraries such as ADO.NET and ASP.NET for building Web applications and web services and bind to commercial and open source databases (including Oracle, Microsoft SQL Server, MySQL, Postgress and others).</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Mono APIs</p></td>
<td align="left"><p>Provide class libraries to tightly integrate applications with the Linux desktop such as bindings for GTK (to use the Gnome graphical toolkit with Mono), Mozilla, Novell iFolder, GnomeDB.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Open IDE support</p></td>
<td align="left"><p>Because developers can't be forced out of their chosen development environment, Mono integrates with existing Integrated Development Environments (IDE) such as Eclipse and Emacs. Mono also includes an IDE with MonoDevelop on Linux and MacOS X. Developers can also use Microsoft Visual Studio .NET and deploy to Linux with Mono.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Development Toolchain</p></td>
<td align="left">Complete set of development tools, including compilers, assembler and
<p>disassembler, native code invocation class generators, class library introspection utilities, API documentation browser, with Wiki-like capabilities.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Embedding Support</p></td>
<td align="left"><p>Extend existing applications (C, C++, Perl) with C# or any other .NET language using our embedding API.</p></td>
</tr>
</tbody>
</table>

### Runtime environment

#### Virtual Machine

#### Supported Platforms

##### Linux

##### Mac OS X

##### Windows

##### Unixes

#### Language Support

##### C\#

##### Java

##### VB.NET

##### Ironpython and Boo

##### Miscelaneous languages

#### Embedding the runtime

### Developer Productivity

### System Classes

### Web Application and Web Services

#### ASP.NET

Mono has a fully functional implementation of ASP.NET. This includes full support for ASP.NET Web Forms and Web Services which essentially means that any ASP.NET application developed using .NET Framework will work with Mono.

Some code might have to be modified as many Windows developers prefer to use hard coded file path separators and disregard case sensitivity instead of relying on methods built into .NET to solve cross platform issues. Also, when applications found invoking native code (p/invoking) might have to find alternative ways to implement a few things when the native code is not found on other platforms.

Mono's ASP.NET and ADO.NET implementation is excellent and many commercial applications now support Mono as a deployment solution on Linux and other platforms.

#### XSP, Apache and mod\_mono

### Desktop Applications development

#### System.Windows.Forms

#### Gtk\#

Gtk\#, a GUI Toolkit, is a set of .NET bindings for the gtk+ toolkit and assorted GNOME libraries. This library allows you to build fully native graphical Gnome application using Mono. GTK\# is an event-driven system like any other modern windowing library. Every widget in an application has handler methods that get called when particular events happen.

Applications built using Gtk\# will run on many platforms including Linux, Windows and MacOS X. Gtk is the native toolkit for the Linux desktop running GNOME, so applications will look and function best on here. The Mono packages for Windows include Gtk, Gtk\# and the native theme to make your applications look like native Windows applications. At this point, running Gtk\# applications on MacOS requires the user to run the X11 server.

You can use Glade along with the Glade\# bindings to easily design GUI applications. A new GUI designer called Stetic is being built which will be integrated with the MonoDevelop IDE.

In addition to support the standard Gtk/Gnome stack of development tools, the gtk-dotnet.dll assembly provides a bridge to consume functionality available on the .NET stack, at this point this includes the functionality to use System.Drawing to draw on a widget.

#### Cocoa\#

#### Others

### Database Connectivity

### Interactions with native libraries

### Migration of existing .NET applications

### Compatible libraries and components

### Mono packaging

Mono Licensing
--------------

Mono is available as open source software primarily, its licensing scheme is planned to allow proprietary developers to write applications with Mono.

### Open Source license

The Mono project use three open source licenses:

-   The C\# Compiler and tools are released under the terms of the [GNU General Public License](http://www.opensource.org/licenses/gpl-license.html) (GPL).

-   The runtime libraries are under the [GNU Library GPL 2.0](http://www.gnu.org/copyleft/library.html#TOC1) (LGPL 2.0).

-   The class libraries are released under the terms of the [MIT X11](http://www.opensource.org/licenses/mit-license.html) license.

The licensing scheme allows for great flexibility. A commercial application vendor can deploy and bundle its application on Mono without the need for a commercial license unless it is their intent to redistribute a modified version of the Mono runtime without feeding back the changes to the Mono project. An IT organization can deploy applications without the need for a commercial license either.

Software vendors can freely use, modfify, redistribute the class libraries providing they include its copyright notice and permission notice in all copies or substantial portions of the Software.

The LGPL 2.0 and MIT X11 components license has no viral clause and their use does not affect the licensing of your own commercial software even if deployed with Mono. Thus, commercial software does not become open source by being deployed, distributed or bunding Mono.

However, the C\# compiler and tools are licensed under the GPL license which requires derivative works of GPL-licensed programs to also be licensed under the GPL.

### Commercial license

Both the Mono runtime and the Mono C\# Compiler are also available under a proprietary license for those who can not use the LGPL and the GPL in their code.

Mono Applications
-----------------

→ include screenshots

### Open Source

### Commercial

Simplified Mono Roadmap
-----------------------

### Mono 1.0

Released, June 2004

Implements .NET 1.1 API (except for VB.NET and SWF support, planned for Mono 1.2) and Mono specific API stack (as described here).

### Mono 1.2

Q1 2006

-   C\# 2.0 implementation
-   Preview of Visual Basic compiler and .NET 2.0 enhancements (including ASP.NET 2.0, XML 2.0 and ADO.NET 2.0))
-   Improved IO-Layer and Internationalization framework.
-   Gtk\# improvement and GUI designer.
-   Mono Debugger.
-   System.Windows.Forms support.
-   JIT performance work.
-   Code Access Security Framework.
-   Continued bug fixing of major and critical bugs.

### Mono 2.0

Q3 2006

This release will focus on .NET 2.0 API implementation including ASP.NET 2.0, XML 2.0, Web Services 2.0.

References
----------

Conclusion
----------

