---
layout: obsolete
title: "Using Mono on Windows"
lastmodified: '2012-02-14'
permalink: /old_site/Using_Mono_on_Windows/
redirect_from:
  - /Using_Mono_on_Windows/
  - /Mono:Windows/
---

Using Mono on Windows
=====================

 Mono runs on Windows, this page describes the various features available for users who want to use Mono on Windows as well as using Mono-based technologies on Windows without Mono (like Gtk\#).

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#installing-mono-on-windows">1 Installing Mono on Windows</a>
<ul>
<li><a href="#mono-experimental-installer-for-windows">1.1 Mono Experimental Installer for Windows</a></li>
</ul></li>
<li><a href="#using-mono-on-windows">2 Using Mono on Windows</a>
<ul>
<li><a href="#gtk">2.1 Gtk#</a></li>
<li><a href="#aspnet-with-mono-xsp--xsp2">2.2 ASP.NET with Mono: xsp &amp; xsp2</a></li>
</ul></li>
<li><a href="#building-mono-on-windows">3 Building Mono on Windows</a></li>
<li><a href="#contents-of-the-mono-packages-for-windows">4 Contents of the Mono Packages for Windows</a></li>
</ul></td>
</tr>
</tbody>
</table>

Installing Mono on Windows
==========================

1.  Download the latest Windows installer from the [Downloads]({{ site.github.url }}/old_site/Downloads "Downloads")
2.  Run the downloaded executable as administrator. During the installation, you will be asked to accept the terms of the license, presented with an information page, and then asked to answer a few standard questions, including:
    1.  What directory to install Mono to
    2.  What optional components to install
    3.  What Start Menu Folder to install to
    4.  What port will XSP (Mono's web server) use

The default installation will create a new "Mono for Windows" program group under the Start menu with links to all of the common tools you will need to get started with Mono

Mono Experimental Installer for Windows
---------------------------------------

In addition to the standard installer of Mono on Windows, there is an experimental installer that contains the latest experiments in integrating Mono into Windows.

See [Mono Experimental Installer for Windows]({{ site.github.url }}/Mono_Experimental_Installer_For_Windows) for more details.

Using Mono on Windows
=====================

The combined installer creates a "Mono Command Prompt" shortcut under the main Mono program group which starts a command shell with mono-relevant path information already configured. [![WinMonoCmdStart.png]({{ site.github.url }}/old_site/images/9/92/WinMonoCmdStart.png)]({{ site.github.url }}/old_site/images/9/92/WinMonoCmdStart.png)

To test the mcs compiler and the mono runtime, launch this command prompt, from there create a simple C\# file:

``` bash
C:\> echo class X { static void Main () { System.Console.Write("OK");} } > x.cs
```

Now you can compile the resulting "x.cs" file into an executable, with the Mono C\# compiler:

``` bash
C:\> mcs x.cs
```

The resulting executable (x.exe) will work with both Mono and the Microsoft runtime, to try it with Mono do:

``` bash
C:\> mono x.exe
OK
C:\>
```

To try it with Windows do:

``` bash
C:\> x.exe
OK
C:\>
```

If you get this far, you have a working Mono installation.

Gtk\#
-----

[[GtkSharp|Gtk\#] is included as part of the Mono installation, this will allow you to create Gtk\# applications on Windows with the Mono runtime which you can later deploy into Linux. See the [Gtk\#]({{ site.github.url }}/old_site/GtkSharp "GtkSharp") page for more details about the toolkit, or go directly to the [Monkeyguide]({{ site.github.url }}/old_site/Monkeyguide "Monkeyguide") to check the [Gtk\# beginner's guide]({{ site.github.url }}/old_site/GtkSharpBeginnersGuide "GtkSharpBeginnersGuide").

The combined installer creates an "Applications" folder under the main Mono program group with two sample Gtk\# applications which can be run to test your Gtk\# installation.

[![WinMonoGtkStart.png]({{ site.github.url }}/old_site/images/8/81/WinMonoGtkStart.png)]({{ site.github.url }}/old_site/images/8/81/WinMonoGtkStart.png)

These are:

-   Prj2Make\# GTK - This is a graphical interface to the prj2make library which can be used to generate Makefiles from Visual Studio.NET C\# projects and solutions. You can find out more about this application in the article [Working with Mono and Visual Studio]({{ site.github.url }}/old_site/Working_with_Mono_and_Visual_Studio "Working with Mono and Visual Studio").
-   Sql\# GTK - A Graphical "Query Analyzer" style tool which supports several different databases.

Alternatively, if you only want to use Gtk\# on Windows, without Mono, you can use the [Gtk\# installer for the .NET Framework]({{ site.github.url }}/old_site/Gtk-Sharp_Installer_for_.NET_Framework "Gtk-Sharp Installer for .NET Framework").

ASP.NET with Mono: xsp & xsp2
-----------------------------

The combined installer also creates an "XSP" folder under the main Mono program group with links to run XSP and XSP2, the Mono ASP.NET and ASP.NET 2.0 Web Servers.

[![WinMonoXspStart.png]({{ site.github.url }}/old_site/images/5/54/WinMonoXspStart.png)]({{ site.github.url }}/old_site/images/5/54/WinMonoXspStart.png)

To test XSP, simply start the Web Server with:

-   The "XSP Test Web Server" or "XSP 2.0 Test Web Server" shortcut, and browse to the server using
-   The corresponding "XSP Index Page" or "XSP 2.0 Index Page" shortcut.

(For more information about taking advantage of the XSP Web Server, check out [Working with Mono and Visual Studio]({{ site.github.url }}/old_site/Working_with_Mono_and_Visual_Studio "Working with Mono and Visual Studio").

Building Mono on Windows
========================

You can compile Mono with the cygwin toolchain or with Visual Studio:

-   Using the [Compiling Mono with the cygwin toolchain]({{ site.github.url }}/old_site/Compiling_Mono#windows-compilation "Compiling Mono")

-   Using [Visual Studio .NET 2005]({{ site.github.url }}/old_site/Compiling_Mono_VSNET "Compiling Mono VSNET")

Contents of the Mono Packages for Windows
=========================================

The Mono packages for Windows, include the following Mono packages:

-   Gtk\# 1.0
-   Gtk\# 2.0
-   sql\#
-   prj2make
-   XSP
-   mono
-   mcs

as well as the following dependencies:

-   GTK+ 2.4.14
-   Glib 2.4
-   Gda 2.4
-   Pango 2.4
-   glade 2 and libglade
-   libArt
-   libjpeg
-   libtiff
-   libpng
-   pkg-config


