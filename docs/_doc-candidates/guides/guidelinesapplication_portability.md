---
layout: obsolete
title: "Guidelines:Application Portability"
permalink: /old_site/Guidelines:Application_Portability/
redirect_from:
  - /Guidelines:Application_Portability/
  - /Guide:Writing_Cross_Platform_applications/
---

Guidelines:Application Portability
==================================

 This document describes some practices that are useful when building software that is portable across Windows and Unix systems using .NET and Mono.

In addition to this page, these are some resources that are useful when porting software to run on Mono:

-   [Mono's ASP.NET]({{site.github.url}}/old_site/ASP.NET "ASP.NET")
-   [Mono's Windows.Forms implementation]({{site.github.url}}/old_site/WinForms "WinForms")

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#porting-strategy">1 Porting Strategy</a>
<ul>
<li><a href="#developing-on-windows-running-on-unix">1.1 Developing on Windows, running on Unix</a></li>
<li><a href="#developing-natively-on-linux">1.2 Developing Natively on Linux</a></li>
</ul></li>
<li><a href="#general-guidelines">2 General Guidelines</a>
<ul>
<li><a href="#case-sensitivity">2.1 Case sensitivity</a></li>
<li><a href="#path-separators">2.2 Path Separators</a></li>
<li><a href="#absolute-path-names">2.3 Absolute path names</a></li>
<li><a href="#platform-invocation-pinvoke">2.4 Platform Invocation (P/Invoke)</a></li>
<li><a href="#registry-usage">2.5 Registry Usage</a></li>
<li><a href="#endianess">2.6 Endianess</a></li>
</ul></li>
<li><a href="#aspnet-guidelines">3 ASP.NET Guidelines</a></li>
<li><a href="#windowsforms-guidelines">4 Windows.Forms Guidelines</a></li>
<li><a href="#database-migration">5 Database Migration</a></li>
<li><a href="#missing-functionality">6 Missing Functionality</a>
<ul>
<li><a href="#no-enterpriseservices">6.1 No Enterprise.Services</a></li>
<li><a href="#no-cross-process-transactions">6.2 No cross-process transactions</a></li>
<li><a href="#no-com">6.3 No COM</a></li>
</ul></li>
<li><a href="#user-interface">7 User Interface</a>
<ul>
<li><a href="#using-windowsforms-as-a-cross-platform-api">7.1 Using Windows.Forms as a cross-platform API</a></li>
<li><a href="#using-a-native-ui-for-each-platform">7.2 Using a native UI for each platform</a></li>
</ul></li>
<li><a href="#porting-tools">8 Porting Tools</a>
<ul>
<li><a href="#monodevelop">8.1 MonoDevelop</a></li>
<li><a href="#installvsts">8.2 installvsts</a></li>
<li><a href="#prj2make">8.3 Prj2make</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Porting Strategy
================

Today Mono contains the core development libraries, the development and deployment tools. Most of these are command-line tools and compiler, there is no complete replacement for Visual Studio to do Windows.Forms and ASP.NET applications natively on Linux.

There are a number of strategies that you can adopt depending on how comfortable you are with using Linux.

Developing on Windows, running on Unix
--------------------------------------

You can continue to use Visual Studio to develop your applications on Windows, the binaries produced by Visual Studio are binary compatible with Mono, so you only need to get these files to your Linux/Unix server.

You can do this by either manually copying the files (a directory, using XCopy deployment is probably the easiest), but ideally you would want to have a network share between Unix and Windows:

-   You could mount from Linux, a Windows share.
-   You could mount from Windows, a Linux share.

**Important** Visual Studio can produce "incremental" executables, these are executables that do not have some of their tables compressed, and they are used by Visual Studio during development.

These assemblies do not work with Mono, as Mono does not support them, you must turn off "incremental" builds.

The incremental option can be set from the Project's Configuration/Advanced properties.

Developing Natively on Linux
----------------------------

There are a couple of IDEs that can be used on Linux, with various degrees of functionality:

-   [X-Develop](http://www.omnicore.com/xdevelop.htm) from Omnicore is a commercial product that provides auto-complete, a cross-platform GUI designer and works on Windows, Linux and OS/X.
-   [MonoDevelop](http:///www.monodevelop.com) is an IDE produced by the Mono community that has support for developing graphical applications with Gtk\# but currently lacks support for Windows.Forms or ASP.NET

If you feel comfortable using command line tools, and any of the other Unix editors, that would work as well.

General Guidelines
==================

Starting with Mono 1.1.18, a new [IO Remapping]({{site.github.url}}/old_site/IOMap "IOMap") functionality is provided that copes with case sensitivity in the file system and with directory separators in filenames.

Using the [IOMap]({{site.github.url}}/old_site/IOMap "IOMap") functionality is a quick way of porting your applications, but the practices are still useful as they will help your application not depend on this remapping (as the remapping has a slight performance penalty).

See the [IOMap]({{site.github.url}}/old_site/IOMap "IOMap") page for more information on how to use it.

Case sensitivity
----------------

The Linux and Unix file systems is case sensitive

On Linux and Unix the files "readme" and "README" are two different files, that is, Linux has a case-sensitive file system.

This is an important distinction for many applications because you might have created a "Login.aspx" page, but you reference the page as "login.aspx" or "LOGIN.ASPX" from your source code. You must make sure that all references use the same file name casing.

Alternatively, starting with Mono 1.1.18, you can set the MONO\_IOMAP environment variable to "case" or "all" to eliminate these problems. See [IOMap]({{site.github.url}}/old_site/IOMap "IOMap") for details.

Path Separators
---------------

On Windows, the directory path separator is "\\" while on Linux it is "/", it is possible to create files that contain a "\\" in their names on Linux.

For quickly porting applications, starting with Mono 1.1.18, you can set the MONO\_IOMAP environment variable to "all" and it will take care of it. See [IOMap]({{site.github.url}}/old_site/IOMap "IOMap") for more details.

To write portable software, you must make sure that you use the [http:/monodoc/P:System.IO.Path.DirectorySeparatorChar System.IO.Path.DirectorySeparatorChar] character when you must concatenate paths, or even better, use the [http:/monodoc/M:System.IO.Path.Combine(string,string) System.IO.Path.Combine] method to combine pathnames.

In addition, code that manually scans for path separators must be changed, for example:

``` csharp
int index = exePath.LastIndexOf("\\");
exeDir = exePath.Substring(0, index);
exeFile = exePath.Substring(index+1);
```

Can be changed to the more portable:

``` csharp
exeDir = Path.GetDirectoryName (exePath);
exeFile = Path.GetFileName (exePath);
```

The PATH and other environment variables have directories separated by a semicolon ";" on Windows and a colon ":" on Linux. You would use System.IO.Path.PathSeparator to separate these paths in environment variables.

``` csharp
Console.WriteLine("Subdirectories found in the PATH environment variable:");
string path_env = Environment.GetEnvironmentVariable ("PATH");
string[] path_dirs = path_env.Split (Path.PathSeparator);
foreach (string pathdir in path_dirs)
    Console.WriteLine(pathdir);
```

 Some guidelines for this:

1.  In general, I'd try to encapsulate \_all\_ operations that operate on file paths. Case sensitivity, the PathSeparator, the DirectorySeparatorChar, etc. are all at issue. More subtle things include what's an absolute path: /bin is absolute on Linux but needs a drive to make it absolute on Windows.
2.  For classes that manipulate paths, it's useful to use dependency injection for the platform rather than have them detect it. That way, you can test for each platform under a single platform.
3.  For some tests, you can use paths like /a/b/c that work on both platforms, but watch out: methods like Path.GetAbsolutePath() will do different things on each platform.

Absolute path names
-------------------

Do not use absolute path names in your application, as absolute path names will not work across Windows and Linux.

If you need to locate some services, you should use the proper .NET APIs, for example, to discover your application configuration file can be done with:

``` csharp
AppDomain.CurrentDomain.SetupInformation.ConfigurationFile
```

Platform Invocation (P/Invoke)
------------------------------

Most code containing P/Invoke calls into native Windows Libraries (as opposed to P/Invokes done to your own C libraries) will need to be adapted to the equivalent call in Linux, or the code will have to be refactored to use a different call.

Registry Usage
--------------

The registry classes are provided on Linux, but these are only useful as long as they reference configuration options that your application uses.

The registry classes will not provide any useful information about any operating system configuration or settings.

Key and value names are converted to lower case by Mono. Normal access is case insensitive, but if your application retrieves the names from the registry and compares them to a fixed value, you must use a case-insensitive comparison. This applies most frequently to test code, but can arise in other situations as well.

Endianess
---------

To make your code run in as many platforms as possible, you might want to keep your code Endian-independent. This means that you should not assume the order of bytes.

See the [endianess](http://en.wikipedia.org/wiki/Endianess) entry in the Wikipedia for more details.

ASP.NET Guidelines
==================

You might want to familiarize yourself with some of the Frequently Asked Questions about ASP.NET on Mono, they are on this page: [FAQ: ASP.NET]({{site.github.url}}/old_site/FAQ:_ASP.NET "FAQ: ASP.NET")

Windows.Forms Guidelines
========================

You might want to familiarize yourself with some of the Frequently Asked Questions about running Windows.Forms applications on Mono. The list is on this page: [FAQ: Winforms]({{site.github.url}}/old_site/FAQ:_Winforms "FAQ: Winforms").

Database Migration
==================

You can continue using your SQL Server database with Mono, you do not have to migrate this. But if you want to replace SQL server with another database, Mono provides an extensive set of database connetors for MySQL, PostgreSQL, Sybase, Oracle, IBM DB2, Firebird, ODBC, and also the embedded SQLite database.

Your existing code and connection strings will continue to work. The only change necessary might be to change the hostname for the database.

Missing Functionality
=====================

Mono lacks a number of features available on the .NET, here are some of the main missing features.

No Enterprise.Services
----------------------

If your application requires EnterpriseServices, your software will not likely run on Mono as we have not implemented it.

No cross-process transactions
-----------------------------

Mono currently supports only local-process transactions.

No COM
------

COM does not exist on Unix as part of the operating system and Mono does not currently provide support for it.

If your application requires COM, you need to wrap the various methods that you want to call using [P/Invoke]({{site.github.url}}/old_site/Interop_with_Native_Libraries "Interop with Native Libraries").

There is currently a work in progress project to support it, see [COM Interop]({{site.github.url}}/old_site/COM_Interop "COM Interop") for more details.

User Interface
==============

In this section we should cover the differences between Windows.Forms and Gtk\# and show the differences and how to structure an application to have multiple UIs depending on the platform.

Using Windows.Forms as a cross-platform API
-------------------------------------------

Using a native UI for each platform
-----------------------------------

One UI per OS, split core from UI, mention gtk\#, cocoa\#.

Porting Tools
=============

MonoDevelop
-----------

MonoDevelop version 0.14 is able to load Visual Studio 2005 solutions and can compile the projects or it can generate Unix makefiles to go with it.

Just import the Visual Studio 2005 .sln file in MonoDevelop and compile as usual. To generate makefiles, right click on the solution and select the "Generate Autotools Framework".

installvsts
-----------

You can use the **installvst** program to install the various starter kits that are distributed from the [http://asp.net](http://asp.net) site.

Prj2make
--------

If you choose to move your development to Linux, the prj2make tool will be useful.

Mono ships with a tool called prj2make that transforms Visual Studio 2003 solutions into a series of Makefiles. The program is able to transform about 50% of the existing solutions into Makefiles, and can be useful in doing a first pass conversion from your project into a set of Unix-makefiles, but it is not rock-solid.

One problem that prj2make has, is that it is unable to cope with filename differences, so it is possible that your project references a file "Core.cs" while the file on disk was called "core.cs", if the compilation fails, you will have to fix those names.

