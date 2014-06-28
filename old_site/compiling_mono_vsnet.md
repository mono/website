---
layout: obsolete
title: "Compiling Mono VSNET"
lastmodified: '2010-08-27'
permalink: /old_site/Compiling_Mono_VSNET/
redirect_from:
  - /Compiling_Mono_VSNET/
---

Compiling Mono VSNET
====================

[SVN]({{ site.github.url }}/old_site/SourceCodeRepository) now includes a Visual Studio .NET 2005 solution **mono.sln** in the [mono/msvc directory](http://anonsvn.mono-project.com/viewvc/trunk/mono/msvc/), and some projects files to build most of the unmanaged parts in Mono.

There is an ongoing effort to build the class libraries with Visual Studio as well, see the section "Work in Progress" below for more information.

The **mono.sln** solution file contains the VC projects files for:

-   Embedded Samples
    -   test-invoke.vcproj
    -   test-metadata.vcproj
    -   teste.vcproj
-   Libraries
    -   libgc.vcproj
    -   libmono.vcproj
    -   eglib.vcproj
-   Tools
    -   genmdesc.vcproj
    -   monoburg.vcproj
    -   monodiet.vcproj
    -   monodis.vcproj
    -   monograph.vcproj
    -   pedump.vcproj
-   mono.vcproj

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#requirements">1 Requirements</a></li>
<li><a href="#optional">2 Optional</a></li>
<li><a href="#required-local-changes">3 Required Local Changes</a></li>
<li><a href="#building">4 Building</a></li>
<li><a href="#known-issues">5 Known Issues</a></li>
<li><a href="#work-in-progress">6 Work in Progress</a>
<ul>
<li><a href="#how-this-works">6.1 How this works</a></li>
</ul></li>
<li><a href="#more-informations">7 More informations</a></li>
</ul></td>
</tr>
</tbody>
</table>

Requirements
============

1. Visual Studio .NET 2005. Previous Visual Studio versions may work or requires, hopefully minimal, changes.

Optional
========

1. A [working]({{ site.github.url }}/old_site/Compiling_Mono#windows-compilation-compiling-mono "Compiling Mono") (i.e. where you could successfully build mono) [cygwin](http://www.cygwin.com/) setup! This is required to:

-   build the class libraries; and
-   test for regressions.

Required Local Changes
======================

All required libraries for building mono in Visual Studio are referenced via the MONO\_DEPENDENCIES\_PREFIX environment variable. Set this variable to a previous installed mono (C:\\Mono-1.2.5.2 for example), or to a cygwin environment setup for building mono (D:\\cygwin\\opt for example).

Each executed assembly (i.e. the EXE) must be able to find a working mscorlib.dll (and all the other required assemblies). This can be done in different ways. My preference is to use the project **properties pages** in the **Configuration Properties\\Debugging\\Environment** options and set **MONO\_PATH** to the class libraries directory build by cygwin (local) or on Linux (remote). E.g.

-   **MONO\_PATH=z:\\svn\\mcs\\class\\lib\\default\\** allows me to use the class libs build under Linux; while
-   **MONO\_PATH=C:\\cygwin\\opt\\mono\\lib\\mono\\1.0** use the one built from cygwin (after a make install)

Building
========

Once everything is installed (and edited) you can right-click on the **mono** solution (in the **Solution Explorer**), select **Clean Solution** (for the first time) then **Build Solution**.

From the shell it is possible to build by using this command:

``` bash
 c> vcbuild mono.sln "Debug_eglib|win32"
```

Known Issues
============

1. Most, BUT NOT ALL, the regressions tests pass under this build. The failures seems limited to some mathematical differences and to code relying on the stack walking functions. The hacks to replace the GCC functions (**\_\_builtin\_frame\_address** and **\_\_builtin\_return\_address**) are incomplete;

2. The solution doesn't provide complete (i.e. from scratch) build. It requires a working cygwin environment to create some files (e.g. via genmdesc, monoburg). This isn't so bad as without cygwin you wouldn't be able to test Mono properly;

3. Only the Debug target is configured properly (that would be easy to fix, but would require turning off some optimizations like **omitting stack frames**). Anyway there are other issues [1] to fix before switching to Release and IMHO the **biggest** advantage to VS.NET is it's debugger/debugging tools;

4. The C compiler emits \_lots\_ of warning during compilation. Some warnings have been turned off for some projects (there was so much that it slowed down compilation). You can bring them back (or hide more of them) using the project **properties pages** windows, **Configuration Properties\\C/C++\\Advanced\\Disable Specific Warnings**;

5. Visual Studio 2005 should have all the latest header files required, but if not (or if you're using an older version of VS) then install MS Platform SDK (Windows Server 2003 is the latest) to ensure you have the latest Windows header files. You can download it from: [http://www.microsoft.com/msdownload/platformsdk/sdkupdate/psdk-full.htm](http://www.microsoft.com/msdownload/platformsdk/sdkupdate/psdk-full.htm)

6. Not everyone has VS.NET so it is possible you may have to add some (new) files to the build from time to time. Please report such issues on the mailing list.

7. Probably a lot more I didn't discover... or has changed since.

Work in Progress
================

To build the class libraries you need:

-   To run from a command shell in mono\\msvc the setup-solution.bat program
-   To build the mono.sln solution in mono\\msvc
-   To copy into mcs\\class\\lib\\basic the basic mcs.exe, mscorlib.dll, System.dll and System.Xml.dll from a Linux system from the 1.0 directory

VERY IMPORTANT: you need the latest version of \`mcs' to be built, or you will get some errors while building corlib-basic.csproj in class/corlib.

How this works
--------------

We will be using the makefile process to generate csproj files for each component that must be built in Visual Studio. The foundation for this lives in mono/msvc/scripts.

The entire setup is contained in mono/msvc, to set it up do:

``` bash
 c:\mono\msvc> setup-solution.bat
```

This will generate the project files, once you build the mono runtime from the mono.sln, you should be able to load the project files for the assemblies in order.

Currently the rules have only been tested for the class libraries, but it will be expanded in the future to also support the rest of the tools.

The process will:

-   Generate a .csproj file per-assembly/profile
    -   This means: mscorlib-bootstrap, mscorlib-net\_1\_1, mscorlib-net\_2\_0, mscolib\_net\_2\_1
-   Drive the compilation by changing the CscToolPath directory in each of those project files to point to a custom directory that contains a wrapper that calls Mono and MCS with the appropriate flags.

A batch file in the mono/msvc/setup-solution.bat will prepare the tree before the solutions are ready to be used.

The solutions are built from the actual commands and flags that are used by the Unix makefiles. This is a two step process.

The first step is collecting all the flags from the Makefiles, and this is done by running the following command in mono:

``` bash
 $ cd mono
 $ make update-csproj
```

This performs a full directory scan for all the assemblies that we are building and produces the file mono/msvc/scripts/order.xml that contains the information necessary to generate the solutions.

Once the order.xml file is produed, the genproj.exe command can be run to populate all of the .csproj files from the order.xml file and the .sources in each directory in the build system.

More informations
=================

Please email **\<mono-devel-list@lists.ximian.com\>** if you have any problem and/or if there's something wrong or missing in the instructions.

An offline version of this document is available in the file [README.vsnet](http://github.com/mono/mono/blob/master/README.vsnet).

