---
title: "Compiling GtkSharp"
lastmodified: '2009-07-30'
redirect_from:
  - /Compiling_GtkSharp/
---

Compiling GtkSharp
==================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#introduction">1 Introduction</a></li>
<li><a href="#dependencies">2 Dependencies</a></li>
<li><a href="#build-process">3 Build process</a></li>
<li><a href="#troubleshooting">4 Troubleshooting</a></li>
<li><a href="#links--resources">5 Links &amp; Resources</a></li>
</ul></td>
</tr>
</tbody>
</table>

Introduction
------------

This article describes how to build Gtk# \>= 2.12.9 on Windows.

We recommend to use Gtk# trunk from our [AnonSVN](/SourceCodeRepository) repository which currently targets Gtk+ 2.14 as it builds much faster.

Dependencies
------------

Building GTK# 2 uses a similar process as [Compiling_Mono_on_Windows](/Compiling_Mono_on_Windows "Compiling Mono on Windows"). First, we'll need some more dependencies:

-   Microsoft's .NET Framework and SDK. If you're building Gtk# 2.12, you need version 1.1 whilst trunk builds against .net 2 or any later version. Do **not** try to build Gtk# 2.12 against .net 2.

The MS .NET SDK is needed because the gtk-sharp2 build currently uses the disassembler(ildasm) and gacutil from the MS SDK for a portion of the build.

Now the Gtk dependencies:

-   Download the latest Gtk+ bundle from [http://www.gtk.org/download-windows.html](http://www.gtk.org/download-windows.html)

If you want to build Glade#(optional):

-   iconv and libxml2 from [http://xmlsoft.org/sources/win32/](http://xmlsoft.org/sources/win32/)
-   libglade-bin and libglade-dev from the gladewin32 project: [http://sourceforge.net/project/showfiles.php?group_id=98754](http://sourceforge.net/project/showfiles.php?group_id=98754)

Extract these zip files to the same location by using Microsoft's xcopy or the very useful copy function in 7-zip which can also handle directory structures.

Add the ZIP_FILES\\bin directory to your path(Windows XP: control panel-\>System-\>Advanced-\>Environment variables-\>Path) and run gtk-demo.exe in the same directory to test your Gtk+ installation.

As we have to use the win32 pkg-config from the Gtk+ bundle(because has supports for dynamic disks such as C:/devel/target/... needed by the Gtk+ pkg-config files), create a symlink from your ZIP_FILES/share/aclocal/pkg.m4 file to /usr/share/aclocal/pkg.m4:

``` bash
ln -s /cygdrive/c/ZIP_FILES/share/aclocal/pkg.m4 /usr/share/aclocal/pkg.m4
```

If the target already exists, uninstall the cygwin pkg-config package.

Now you should create some symlinks to shorten the cygwin paths and to avoid spaces. For example:

``` bash
ln -s "/cygrive/c/Windows/Microsoft.NET/Framework/v2.0" /dotnet
ln -s "/cygdrive/c/Program Files/Microsoft.NET/SDK/v2.0/Bin" /sdk
ln -s "/cygrive/c/ZIP_FILES/bin" /gtk
```

Build process
-------------

Make sure that Mono is not in the path, and put the MS tools in the path. Here's an example of how to do this from the cygwin bash shell:

``` bash
export PATH="/dotnet:/sdk:/gtk/bin:/bin"
```

Now we can start building. Unpack the gtk-sharp2 source and enter it's directory. Here are the commands to build:

``` bash
export CC="gcc -mno-cygwin"             # Make sure we're not dependent on cygwin
./configure --prefix=/tmp/install       # Choose any prefix you like, call bootstrap-2.xx instead when building SVN
 
make
make install
```

Add the INSTALL_PREFIX\\lib directory to your Windows(not Cygwin!) Path as well. The .NET dll's will be placed in the MS GAC. Enjoy!

Troubleshooting
---------------

-   The most likely reason for the build to fail is that you are using Cygwin't pkg-config package instead of the one that is shipped with the Gtk+ bundle. Make sure that you uninstalled Cygwin's pkg-config and put "/gtk/bin" in your PATH.

-   Building Gtk# 2.12 with .net \>= 2.0 is known not to work.

-   If you still can't get it to work, write a mail to the Gtk# mailing list (see [Mailing_Lists](/Mailing_Lists "Mailing Lists")).

Links & Resources
-----------------

-   Gtk# installer for .net from [Downloads](/Downloads "Downloads")

-   Up to date glib ([http://anonsvn.mono-project.com/viewcvs/\*checkout\*/trunk/release/packaging/defs/mono](http://anonsvn.mono-project.com/viewcvs/*checkout*/trunk/release/packaging/defs/mono)) and gtk ([http://anonsvn.mono-project.com/viewcvs/\*checkout\*/trunk/release/packaging/defs/gtk-sharp](http://anonsvn.mono-project.com/viewcvs/*checkout*/trunk/release/packaging/defs/gtk-sharp)) dependencies that are being used for the Mono Windows Combined Installer.


