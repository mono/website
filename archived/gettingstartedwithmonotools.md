---
title: "GettingStartedWithMonoTools"
lastmodified: '2012-05-07'
redirect_from:
  - /GettingStartedWithMonoTools/
  - /GettingStartedWithMonoVS/
---

GettingStartedWithMonoTools
===========================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#quick-links">1 Quick Links</a></li>
<li><a href="#installing-mono-tools-for-visual-studio">2 Installing Mono Tools for Visual Studio</a>
<ul>
<li><a href="#download-mono-tools">2.1 Download Mono Tools</a></li>
<li><a href="#download-mono-for-windows-to-rundebug-locally">2.2 Download Mono for Windows to Run/Debug Locally</a></li>
<li><a href="#download-servers-for-linux-and-mac-to-rundebug-remotely">2.3 Download Servers for Linux and Mac to Run/Debug Remotely</a></li>
<li><a href="#sources">2.4 Sources</a></li>
<li><a href="#installing-the-windows-software">2.5 Installing the Windows Software</a></li>
<li><a href="#installing-the-linux-server-component-on-opensuse-or-sle">2.6 Installing the Linux Server Component on openSUSE or SLE</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Quick Links
===========

-   [Mono Tools for Visual Studio download page](http://mono-tools.com/download/)
-   The most recent [[1]](/download) Mono for Windows and Mono for OS X (required to debug Mono on Mac OS X)
    -   Requires the most recent [Mono for Mac OS X](http://ftp.novell.com/pub/mono/monotools/latest/MonoFramework-x86.dmg)
-   Linux
    -   Use the openSUSE 1click from your existing Linux system:

          [Monovs-1click.png](http://go-mono.com/monotools-download/monotools.ymp)

-   Other platforms will need to build from the [Mono Tools 2.0 Server sources](http://ftp.novell.com/pub/mono/monotools/latest/monotools-server-2.0.tar.bz2)

Installing Mono Tools for Visual Studio
=======================================

Requirements:

-   Windows XP, Vista, or 7, 32 or 64 bits
-   Visual Studio
    -   2008 SP1 Standard or Professional, or
    -   2010 Professional, Premium, or Ultimate

### Download Mono Tools

Download the Visual Studio 2008 or Visual Studio 2010 installer from the [Mono Tools download page](http://mono-tools.com/download/)

          [http://www.go-mono.com/monotools/Images/mp-download-blue.png](http://www.go-mono.com/monotools/download/)

### Download Mono for Windows to Run/Debug Locally

-   [Mono 2.6.7 for Windows](http://go-mono.com/monotools-download/latest/mono-windows.exe)

### Download Servers for Linux and Mac to Run/Debug Remotely

**Linux:**

-   Use the openSUSE 1click from your existing Linux system:

          [Monovs-1click.png](http://go-mono.com/monotools-download/monotools.ymp)

**Note:** After installing on Linux, launch the "MonoTool GUI Server" from the application menu to start the server.

**Mac:**

-   [MonoTools Server for Mac OS X](http://go-mono.com/monotools-download/latest/monotools-server.dmg) (required to debug Mono on Mac OS X)
    -   Requires [Mono 2.6.6 for Mac OS X](http://go-mono.com/monotools-download/latest/MonoFramework-x86.dmg)

### Sources

To debug applications on other systems running Mono 2.6.7 (or later), you may need to build your own copy of the MonoTools Server from the [Mono Tools 2.0 Server sources](http://go-mono.com/monotools-download/latest/monotools-server-2.0.tar.bz2).

Installing the Windows Software
-------------------------------

-   Make sure all copies of Visual Studio are closed!
-   Double click the Windows installer (.msi or .vsix).
-   Follow the installer instructions.

Installing the Linux Server Component on openSUSE or SLE
--------------------------------------------------------

-   Use the openSUSE 1click from your Linux system:

          [Monovs-1click.png](http://go-mono.com/monotools/monovs.ymp)

**Everything should now be ready to go! Guides to using each feature are available from the [Mono Tools homepage](http://mono-tools.com/).**
