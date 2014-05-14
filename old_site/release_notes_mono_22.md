---
layout: obsolete
title: "Release Notes Mono 2.2"
permalink: /old_site/Release_Notes_Mono_2.2/
redirect_from:
  - /Release_Notes_Mono_2.2/
---

Release Notes Mono 2.2
======================

Mono 2.0 is a portable and open source implementation of the .NET framework for Unix, Windows, MacOS and other operating systems.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#major-highlights">1 Major Highlights</a></li>
<li><a href="#changes-since-mono-20">2 Changes since Mono 2.0</a>
<ul>
<li><a href="#runtime">2.1 Runtime</a>
<ul>
<li><a href="#performance">2.1.1 Performance</a></li>
<li><a href="#ahead-of-time-compilation">2.1.2 Ahead of Time Compilation</a></li>
<li><a href="#monitoring">2.1.3 Monitoring</a></li>
<li><a href="#attach-functionality">2.1.4 Attach Functionality</a></li>
<li><a href="#simd-support-in-mono">2.1.5 SIMD support in Mono</a></li>
</ul></li>
<li><a href="#c-language">2.2 C# Language</a>
<ul>
<li><a href="#compiler-service">2.2.1 Compiler Service</a></li>
<li><a href="#interactive-shell">2.2.2 Interactive Shell</a></li>
<li><a href="#optimizations">2.2.3 Optimizations</a></li>
<li><a href="#other-changes">2.2.4 Other Changes</a></li>
</ul></li>
<li><a href="#regular-expressions">2.3 Regular Expressions</a></li>
<li><a href="#aspnet">2.4 ASP.NET</a></li>
<li><a href="#winforms">2.5 Winforms</a></li>
<li><a href="#tools">2.6 Tools</a>
<ul>
<li><a href="#gendarme">2.6.1 Gendarme</a></li>
</ul></li>
<li><a href="#smaller-changes">2.7 Smaller Changes</a>
<ul>
<li><a href="#mono-on-windows">2.7.1 Mono on Windows</a></li>
<li><a href="#build">2.7.2 Build</a></li>
<li><a href="#console-implementation">2.7.3 Console Implementation</a></li>
</ul></li>
<li><a href="#source-code-snippets">2.8 Source Code Snippets</a>
<ul>
<li><a href="#monooptions">2.8.1 Mono.Options</a></li>
<li><a href="#monoterminaleditor">2.8.2 Mono.Terminal.Editor</a></li>
<li><a href="#monodataconvert">2.8.3 Mono.DataConvert</a></li>
</ul></li>
<li><a href="#documentation">2.9 Documentation</a></li>
</ul></li>
<li><a href="#installing-mono-22">3 Installing Mono 2.2</a></li>
</ul></td>
</tr>
</tbody>
</table>

Major Highlights
================

Changes since Mono 2.0
======================

This documents the changes since [Mono 2.0]({{site.github.url}}/old_site/Release_Notes_Mono_2.0 "Release Notes Mono 2.0")

Runtime
-------

### Performance

The code generation engine has been replaced from tree-based representation that we used for 1.0.x, 1.2.x, 1.9 and 2.0 releases to a representation that is better suited for advanced optimizations, the [Linear IL]({{site.github.url}}/old_site/Linear_IR) engine.

The new engine already outperforms the old engine in many computationally intensive tasks.

Generic sharing is now turned on in all cases. You can control the sharing setup using the MONO\_GENERIC\_SHARING environment variable.

Generic sharing is now supported on ARM.

### Ahead of Time Compilation

Support for [Full Ahead of Time Compilation]({{site.github.url}}/old_site/AOT "AOT"), generic sharing, and static linking is now available.

### Monitoring

Support for monitoring the runtime internals is now available through a new PerformanceCounters implementation.

A new GUI tool \`mperfmon' is available to allow developers and administrators to monitor the system performance.

### Attach Functionality

It is now possible to load code externally into a Mono process to debug or augment code live.

A new assembly: Mono.Management wraps this functionality.

### SIMD support in Mono

Support for SIMD instructions has been added to the Mono JIT. See [this page](http://tirania.org/blog/archive/2008/Nov-03.html) for more information about the SIMD support.

The [Documentation for this library](http://go-mono.com/docs/monodoc.ashx?tlink=0@N%3aMono.Simd) includes the API-level description of the new data types introduced in this new release.

The performance benefits of using these SIMD-aware vector types is anywhere between 1.5x to 10x depending on the use cases.

C\# Language
------------

### Compiler Service

A new Mono.CSharp.Evaluator class and library is available to allow developers to embed the C\# compiler into their own applications. This provides C\# in a Compiler-Service modality that developers can use to extend their applications.

This can be used to load scripts written in C\# dynamically, but executing at the same speed as C\# compiled pages or to add dynamic features to your application or even adding a console to debug your application on a live deployment.

### Interactive Shell

A new interactive shell for C\# is available, the command is called "csharp", more details are available on the csharp manual page and on the [CsharpRepl]({{site.github.url}}/old_site/CsharpRepl "CsharpRepl") page.

The C\# shell currently requires Mono for any C\# 2.0 and 3.0 support. Version 1.0 will also run on the .NET Framework.

The shell has support for attaching to existing processes, so it is possible to use the csharp shell to debug live applications.

A GUI version of the shell, `gsharp` is also included in the mono-tools package.

### Optimizations

Our compiler will now replace any references to the empty string with a reference to the String.Empty field (more efficient).

### Other Changes

The C\# compiler now defaults to warning level 4 (the previous default was level 3).

Compiler parsing errors detection and parser error recovery has been improved which should lead to much cleaner syntax error reporting.

Regular Expressions
-------------------

The regex interpreter used by the System.Text.RegularExpressions package has been rewritten to be more efficient.

Additionally, a regex-to-CIL compiler has been implemented which provides dramatically better performance at the cost of increased setup time, this compiler is activated when RegexOptions.Compiled is passed to the Regex class constructors. The old interpreter is still available, and can be used by defining the MONO\_OLD\_RX env variable.

In previous versions, Mono always interpreted regular expressions.

ASP.NET
-------

New Routing handler in ASP.NET 3.5 SP1 has been implemented. This includes ASP.NET Abstractions layer and will be used for ASP.NET MVC.

Winforms
--------

Nearly 200 reported bugs have been fixed since the 2.0 release.

Calling Application.EnableVisualStyles () will now use native rendering on Windows.

Tools
-----

### Gendarme

Our [static code analyzer]({{site.github.url}}/old_site/Gendarme "Gendarme") has been updated with new filtering options (severity, confidence, number of defects), 32 new rules (total 183) and many enhancements and fixes to existing rules. Full release notes are available on [here](http://anonsvn.mono-project.com/source/trunk/mono-tools/gendarme/NEWS).

Smaller Changes
---------------

### Mono on Windows

The Mono Windows installer has been updated to include GTK\# 2.12.7.

### Build

It is now possible to cross-compile Mono for Windows using Linux and MinGW. Details are available on the [Compiling Mono]({{site.github.url}}/old_site/Compiling_Mono#cross-compiling-on-linux-using-mingw "Compiling Mono") page.

### Console Implementation

Various upgrades to the Console implementation, it will now respond appropriately to changes on terminal sizes.

Source Code Snippets
--------------------

Some libraries are too small to qualify for an assembly and are more conveniently used in source code form. With Mono 2.2 we debut code snippets, these are used by copying the code into your application. For example, to use Mono.Options parsing library, you would do:

``` bash
cp `pkg-config --variable=Sources mono-options` .
```

Mono.Options and Mono.DataConvert are now available in this form.

### Mono.Options

Jonathan Pryor's Mono.Options library is now included as a Source Code Snippet that you can integrate into your application.

### Mono.Terminal.Editor

This is a command line editor that replaces Console.ReadLine() for interactive applications. It provides editing in the command line and support for history

### Mono.DataConvert

The [Mono DataConvert]({{site.github.url}}/old_site/Mono_DataConvert "Mono DataConvert") library provides encoding and decoding of bytes, words, strings and other data types to and from various CPU endianness.

Documentation
-------------

The monodoc module is no longer distributed, instead the documentation has been merged directly into Mono (Jonathan)

Installing Mono 2.2
===================

**Binary Packages and Source Code Downloads:**

    Source code and pre-compiled packages for Linux, Solaris, 
    MacOS X and Windows is available from our web site from 
    the Downloads section.

**Quick source code installation:**

    If we have no packages for your platform, installing from 
    source code is very simple.   

Compile libgdiplus to support System.Drawing:

``` bash
    $ tar xzf libgdiplus-2.2.tar.gz
    $ cd libgdiplus-2.2
    $ ./configure
    $ make
    $ make install
```

Then compile Mono itself:

``` bash
    $ tar xzf mono-2.2.tar.gz
    $ cd mono-2.2
    $ ./configure
    $ make
    $ make install
```

