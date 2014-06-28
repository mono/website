---
layout: obsolete
title: "Roadmap History"
lastmodified: '2012-11-02'
permalink: /old_site/Roadmap_History/
redirect_from:
  - /Roadmap_History/
---

Roadmap History
===============

This page contains the history of the [Roadmap]({{ site.github.url }}/old_site/Mono_Project_Roadmap) page. It is left here for historical purposes. For our current roadmap, please see [Roadmap]({{ site.github.url }}/old_site/Mono_Project_Roadmap).

Notice that before Mono 2.0, every public release version that was available was a stable release (1.9, 1.9.1, 1.2.6, 1.2.6.1 and so on).

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#release-archive">1 Release Archive</a>
<ul>
<li><a href="#mono-28">1.1 Mono 2.8</a></li>
<li><a href="#mono-26">1.2 Mono 2.6</a></li>
<li><a href="#mono-24">1.3 Mono 2.4</a>
<ul>
<li><a href="#mono-20">1.3.1 Mono 2.0</a></li>
<li><a href="#mono-19">1.3.2 Mono 1.9</a></li>
<li><a href="#mono-12">1.3.3 Mono 1.2</a></li>
</ul></li>
<li><a href="#previous-goals">1.4 Previous Goals</a>
<ul>
<li><a href="#mono-10-goals">1.4.1 Mono 1.0 goals</a></li>
</ul></li>
<li><a href="#roadmap-background">1.5 Roadmap Background</a>
<ul>
<li><a href="#background">1.5.1 Background</a></li>
<li><a href="#mono-release-strategy">1.5.2 Mono release strategy</a></li>
<li><a href="#microsofts-net-20">1.5.3 Microsoft's .NET 2.0</a></li>
</ul></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Release Archive
===============

Mono 2.8
--------

<table>
<col width="50%" />
<col width="50%" />
<tbody>
<tr class="odd">
<td align="left"><strong> Mono 2.8</strong></td>
<td align="left"><strong>Released: October 6th, 2010</strong></td>
</tr>
<tr class="even">
<td align="left"><ul>
<li>Remove support for .NET 1.1 Framework</li>
<li>Remove deprecated libraries from previous iterations</li>
<li>Default to 4.0 Profile</li>
<li>Moonlight 3 Preview</li>
<li>MonoDevelop 2.4: <a href="http://monodevelop.com/Download/MonoDevelop_2.4_Released">released on June 16th, 2010</a></li>
<li><a href="{{ site.github.url }}/old_site/Generational_GC" title="Generational GC">Generation Garbage Collector</a> goes into Beta.</li>
<li>C# Compiler
<ul>
<li>Full C# 4.0 support</li>
<li>Refactored to run on Microsoft's System.Reflection.Emit
<ul>
<li>Allows the compiler to be embedded in Silverlight</li>
<li>Enables the use of Mono.CSharp.dll to be used on Windows</li>
<li>Run our <a href="/index.php?title=CSharpRepl&amp;action=edit&amp;redlink=1" title="CSharpRepl (page does not exist)">CSharpRepl</a> on .NET's runtime.</li>
</ul></li>
</ul></li>
<li>LINQ to SQL Beta</li>
<li>Mono Embedding API
<ul>
<li>Mono public ABI no longer depends on GLIB.</li>
<li>Various API entry point cleaned up.</li>
</ul></li>
<li>Internals:
<ul>
<li>Mono drops eglib dependency, but it is still optional</li>
</ul></li>
<li>Extended LLVM support
<ul>
<li>LLVM backend to the JIT is now able to compile 99% of our code.</li>
</ul></li>
<li>WCF Upgrade
<ul>
<li>More WCF components supported</li>
</ul></li>
<li>Microsoft Open Source Libraries integrated into Mono:
<ul>
<li><a href="http://www.asp.net/(S(d35rmemuuono1wvm1gsp2n45))/mvc">ASP.NET MVC 2</a></li>
<li><a href="http://mef.codeplex.com/">Managed Extensibility Framework</a></li>
<li><a href="http://dlr.codeplex.com/">Dynamic Language Runtime</a></li>
</ul></li>
<li>Parallel Frameworks:
<ul>
<li>New runtime ThreadPool implementation, increases scalability and performance of Mono on multi-core systems</li>
<li>New managed implementation of Parallel FX</li>
</ul></li>
<li>ASP.NET 4.0 API supported</li>
</ul></td>
<td align="left"><p><a href="{{ site.github.url }}/old_site/Release_Notes_Mono_2.8" title="Release Notes Mono 2.8">Mono 2.8 Release Notes</a></p>
<ul>
<li><strong>Oct 6th, 2010:</strong> First 2.8 release</li>
</ul></td>
</tr>
</tbody>
</table>

Mono 2.6
--------

<table>
<col width="50%" />
<col width="50%" />
<tbody>
<tr class="odd">
<td align="left"><strong> Mono 2.6 (LTS)</strong></td>
<td align="left"><strong>Released: December 14th, 2009</strong></td>
</tr>
<tr class="even">
<td align="left"><ul>
<li>Support for Silverlight 2.0 subset of WCF</li>
<li>LLVM support</li>
<li>Co-routine framework Mono.Tasklets</li>
<li>Preview of LINQ to SQL using DbLinq</li>
<li>New Soft Debugger, integrated with MonoDevelop</li>
<li>Joint release with MonoDevelop 2.2</li>
<li>System.IO.Packaging</li>
<li>csharp shell now supports auto-completion</li>
<li>xbuild can now build most msbuild projects</li>
<li>Support for CoreCLR security:
<ul>
<li>Mono debuts a full metadata and IL verifier</li>
</ul></li>
<li>Moonlight 2.0 released</li>
<li>Core <a href="{{ site.github.url }}/old_site/WCF_Development">WCF</a> support.</li>
</ul>
<p>The 2.6 series replaced 2.4 as our Long Term Supported version in the <a href="http://www.novell.com/products/mono/">SUSE Linux Enterprise Mono Extension</a> product.</p></td>
<td align="left"><p><a href="{{ site.github.url }}/old_site/Release_Notes_Mono_2.6" title="Release Notes Mono 2.6">Mono 2.6 Release Notes</a></p>
<p><a href="{{ site.github.url }}/old_site/Release_Notes_Mono_2.6.7" title="Release Notes Mono 2.6.7">Mono 2.6-2.6.7 release notes</a></p>
<ul>
<li><strong>Dec 14th, 2009:</strong> First 2.6 release</li>
<li><strong>Jul 20th, 2010:</strong> 2.6.7 released.</li>
</ul></td>
</tr>
</tbody>
</table>

Mono 2.4
--------

<table>
<col width="50%" />
<col width="50%" />
<tbody>
<tr class="odd">
<td align="left"><strong> Mono 2.4.3 (LTS)</strong></td>
<td align="left"><strong>Released: Dec 8th, 2009</strong></td>
</tr>
<tr class="even">
<td align="left"><ul>
<li>Bug Fixes</li>
<li>Upgraded xbuild, our msbuild implementation</li>
<li>Fine tuned memory usage</li>
</ul></td>
<td align="left"><p><a href="{{ site.github.url }}/old_site/Release_Notes_Mono_2.4.3" title="Release Notes Mono 2.4.3">Mono 2.4.3 Release Notes</a></p>
<ul>
<li><strong>Nov 17th:</strong> Branched from the 2.4.x branch.<br /></li>
<li><strong>Dec 8th:</strong> Final release</li>
</ul></td>
</tr>
</tbody>
</table>

This release was part of our long-term maintenance release for [SUSE Linux Enterprise's Mono Extension](http://www.novell.com/products/mono/).

### Mono 2.0

<table>
<col width="50%" />
<col width="50%" />
<tbody>
<tr class="odd">
<td align="left"><strong> Mono 2.0</strong></td>
<td align="left"><strong>Released: Oct 6th, 2008</strong></td>
</tr>
<tr class="even">
<td align="left"><p>Major new features in Mono 2.0 since Mono 1.2:</p>
<ul>
<li>API status:
<ul>
<li>ASP.NET 2.0
<ul>
<li>Missing: WebParts, Mobile control rendering.</li>
</ul></li>
<li>ADO.NET 2.0</li>
<li>Windows.Forms 2.0</li>
</ul></li>
<li>C# 3.0
<ul>
<li>LINQ</li>
<li>LINQ to XML</li>
</ul></li>
<li>Visual Basic.NET compiler (with Generics).</li>
<li>JIT
<ul>
<li>Generic code sharing</li>
<li>IL Verifier</li>
</ul></li>
<li>Tools for Windows Developers
<ul>
<li><a href="{{ site.github.url }}/old_site/MoMA">Moma</a></li>
<li><a href="{{ site.github.url }}/old_site/Gendarme" title="Gendarme">Gendarme</a></li>
</ul></li>
<li>Mono Debugger, command line interface.</li>
</ul></td>
<td align="left"><p><a href="{{ site.github.url }}/old_site/Release_Notes_Mono_2.0" title="Release Notes Mono 2.0">Mono 2.0 Release Notes</a></p></td>
</tr>
</tbody>
</table>

### Mono 1.9

Since the release in November 9th of 2006 of Mono 1.2, we have made seven incremental updates to Mono ([1.9](http://www.go-mono.com/archive/1.9)), The highlights since then include:

-   VB.NET compiler and runtime were released.
-   Windows.Forms 2.0 feature-complete.
-   2.0 support completed for Web Services (Generics).
-   ASP.NET WebForms are complete (except for WebParts).
    -   Support for ASP.NET AJAX.
-   Release of [Mono Migration Assistant]({{ site.github.url }}/old_site/MoMA).
-   C\# 3.0 support and System.Core assembly
-   LINQ to Objects
-   LINQ to XML.
-   System.Media implemented.
-   HTTPS support in HttpListener.
-   2.0 Socket API.
-   Improved fidelity and performance of System.Drawing, added support for Metafiles.
-   Mono's MSBuild is able to build projects.
-   SafeHandles and HandleRef support.
-   MIPS, Alpha ports and Solaris/amd64 ports.
-   Mono can now run without shared memory segments.
-   New Mono.DataConvert library
-   ADO.NET 2.0 updates, and support for output parameters on stored procedures.
-   installvst tool for installing ASP.NET starter kits.
-   New Sqlite bindings.
-   COM/XpCOM support.
-   [Packages available](http://download.opensuse.org/repositories/Mono:/Community/) for many popular applications.

Release notes with all the details:

-   [Mono 1.2.1](http://www.go-mono.com/archive/1.2.1)
-   [Mono 1.2.2](http://www.go-mono.com/archive/1.2.2)
-   [Mono 1.2.3](http://www.go-mono.com/archive/1.2.3)
-   [Mono 1.2.4](http://www.go-mono.com/archive/1.2.4)
-   [Mono 1.2.5](http://www.go-mono.com/archive/1.2.5)
-   [Mono 1.2.6](http://www.go-mono.com/archive/1.2.6)
-   [Mono 1.9](http://www.go-mono.com/archive/1.9)

### Mono 1.2

Mono 1.2 is a release that supports the .NET 1.1 APIs for all the areas supported in Mono (core, XML, ADO.NET, ASP.NET, Windows.Forms, compilers, tools). For details, see the [Mono 1.2 Release Notes](http://go-mono.com/archive/1.2/)

Mono 1.2 is an incremental upgrade to Mono 1.0, and contains the following new features:

-   Generic types support: C\# compiler, execution system and core class libraries (C\# 2.0)

-   System.Windows.Forms 1.1 support ([Track Progress]({{ site.github.url }}/old_site/WinForms "WinForms"))

-   [Mono Debugger]({{ site.github.url }}/old_site/Debugger "Debugger") (new alpha available soon - see release notes)

-   [gtk\# 2.0]({{ site.github.url }}/old_site/GtkSharp "GtkSharp") (includes support for gtk 2.12)

-   New platforms: [ARM]({{ site.github.url }}/old_site/Mono:ARM "Mono:ARM"), [Itanium]({{ site.github.url }}/old_site/Mono:IA64 "Mono:IA64"), [s390]({{ site.github.url }}/old_site/Mono:S390 "Mono:S390"), [s390x]({{ site.github.url }}/old_site/Mono:S390 "Mono:S390").

-   Numerous scalability and performance enhancements

Mono 1.2 also include assemblies from .NET 2.0 and these are available as technology previews:

-   XML 2.0 ([Track Progress]({{ site.github.url }}/old_site/XML#forthcoming-mono-12-features "XML"))

-   ASP.NET 2.0 ([Track Progress]({{ site.github.url }}/old_site/ASP.NET#aspnet-20 "ASP.NET"))

-   ADO.NET 2.0

-   Most of mscorlib and System.dll

-   Console and Serial ports support

**Released on:** November 9, 2006.

There are various milestone branches in this release, see our [Branches]({{ site.github.url }}/old_site/Branches "Branches") page for more details.

Previous Goals
--------------

### Mono 1.0 goals

The Mono 1.0 release would include the following components:

-   C\# compiler.

-   VM, with JIT and pre-compiler.

-   IL assembler, disassembler.

-   Development and security tools.

-   Core libraries: mscorlib, System, System.XML.

-   System.Data and Mono database providers.

-   System.Web: Web applications platform and Apache integration module.

-   System.Web.Services: client and server support.

-   System.Drawing.

-   System.DirectoryServices

-   JIT support: x86, SPARC and PPC architectures (interpreter available for other architectures).

-   ECMA profiles: special build options to build Mono as an implementation of the various ECMA profiles will be available.

-   Java integration through IKVM.

-   Embedding interface for the runtime.

Packaging:

-   mono: will contain the above features implementing the .NET 1.1 API.

-   mono-1.0-compat: Will include a build of the libraries with the .NET 1.0 API, this is a compatibility build for people running .NET 1.0 applications.

-   mono-unstable: Will contain a snapshot of the other technologies under development for developer's convenience, but will be unsupported at this time. These include the Generics edition of the C\# compiler.

-   mono-ecma: A build that only includes the ECMA components.

Released on June 30th, 2004.

Bug fix releases would be done on a monthly basis.

For a detailed list, see the [Mono 1.0 feature list.](http://www.go-mono.com/archive/1.0)

Roadmap Background
------------------

This document describes the high-level roadmap for [Mono](http://www.go-mono.com).

The Mono project started in 2001 as an effort to implement the .NET Framework to Unix. To bring both the new programming model based on the Common Language Infrastructure and C\# as well as helping people migrate their existing knowledge and applications to Unix. Mono today supports a wide variety of operating systems, CPUs and a large chunk of the functionality available in the .NET Framework.

This document outlines the roadmap for the Mono project from my perspective: what we can effectively deliver on the dates outlined. Since Mono is a large open source project, things might change and new features can be incorporated into the plan if external sources devote enough attention to those problems.

### Background

So far Microsoft has published five versions of the .NET Framework: 1.0, 1.1, 2.0, 3.0 and 3.5.

1.1 was an incremental update over 1.0.

2.0 was a considerable expansion on the features of it.

In addition, an "add-on" to the core of .NET has been released, called ".NET 3.0", but it does not touch the core. It is a set of new APIs and extensions that run on top of a .NET 2.0 installation.

.NET 3.5 is the actual heir to .NET 2.0, and it contains updates to the core libraries (small bits) and new assemblies (like System.Core).

The Mono project has been tracking some of the improvements available in those releases, some of the highlights of our work so far are:

-   Core: mscorlib, System and System.XML assemblies. These support both the 1.x and 2.0 profiles. Work is underway to complete the [2.0 profile]({{ site.github.url }}/old_site/Completing2.0Profile "Completing2.0Profile").

-   [ADO.NET]({{ site.github.url }}/old_site/ADO.NET "ADO.NET"): System.Data and various other database providers, they are 1.x complete, and most of 2.x is complete

-   [ASP.NET]({{ site.github.url }}/old_site/ASP.NET "ASP.NET") 1.x and 2.x: WebForms and Web Services are supported. Only WebParts are missing from our 2.x support.

-   System.Security support 1.1 features and has partial support for 2.0 (like XML encryption) but the S.S.C.Pkcs namespace is still imcomplete.

-   DirectoryServices implemented on top of Novell.LDAP

-   [Windows.Forms]({{ site.github.url }}/old_site/WinForms "WinForms") 1.1 with almost complete 2.0 support.

-   [System.Drawing]({{ site.github.url }}/old_site/Drawing "Drawing") supports both 1.x and 2.0 profiles.

-   Compilers: C\# 1 and 2 as well as bits of 3, VB.NET 8 and various command line tools that are part of the SDK.

-   [Transaction](/index.php?title=Transaction&action=edit&redlink=1 "Transaction (page does not exist)") support, we have some partial support but currently no plans exist beyond the current implementation (see the [notes]({{ site.github.url }}/old_site/Transactions "Transactions") on its implementation and limitations).

-   Open Source, Unix and Gnome specific libraries, see our [Plans]({{ site.github.url }}/old_site/Plans "Plans") page for more details.

There are certain features that we are not planning on supporting and are available either as stubs (to allow other code to compile or to satisfy dependencies) or are not even present in Mono, these include:

-   EnterpriseServices
-   [Web Services Enhancements (WSE)]({{ site.github.url }}/old_site/WSE "WSE")
-   System.Management: too Windows specific
-   [System.Messaging]({{ site.github.url }}/old_site/System.Messaging).

Support for designers in Windows.Forms and ASP.NET for the majority of Mono provided controls does not exist. This is due to the lack of tools for designing Windows.Forms and ASP.NET components in Mono today. When designer surfaces are completed (there are work in progress for both of them) work on this areas will resume.

Designer support is only needed at development-time, this is not something that is required to run the applications on Unix. Many applications that are reported through the [Mono Migration Analysis]({{ site.github.url }}/old_site/MoMA) tool reports these problems and can be safely ignored.

Some components exist that were once developed but are no longer actively developed, these include:

-   [Transactions]({{ site.github.url }}/old_site/Transactions "Transactions")
-   [JScript]({{ site.github.url }}/old_site/JScript "JScript")

See the following sections for more details on plans for 2.0, 3.0 and 3.5 APIs.

### Mono release strategy

The levels of maturity of Mono fluctuate depending on the development effort we have put into it, and the use we have given to them. For example, the virtual machine and the C\# compiler very mature, while less commonly used functionality in Mono like Windows.Forms or VB.NET are still under heavy development.

Our strategy is to release the mature components as Mono 1.0, and have upcoming versions of Mono add extra functionality.

### Microsoft's .NET 2.0

To understand post 1.0 editions of Mono, it is important to put it into perspective .NET 2.0 which was released in November 2005.

The new features in .NET 2.0 include:

-   **Generic types** These introduce changes to the compiler, runtime and class libraries.

-   **C\# 2.0** Many new additions to the language.

-   **ASP.NET 2** Many tools to simplify web application development: Master pages, new controls for common operations, personalization and themes.

-   **Remoting** New security channels and version-resistant remoting (good news in the interop department).

-   **XML** Relatively small changes and improvements which Mono has currently. Mono in addition will ship an XQuery processor.

-   **Networking** FTP client, Ssl streams.

-   **Console and Serial ports:**\</br\> Console terminal input/output is available as well as serial port handling.

-   **Windows.Forms** Layout containers finally appeared on Windows.Forms as well as various new controls.


