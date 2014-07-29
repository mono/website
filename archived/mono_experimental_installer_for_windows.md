---
layout: obsolete
title: "Mono Experimental Installer For Windows"
lastmodified: '2006-04-24'
permalink: /archived/Mono_Experimental_Installer_For_Windows/
redirect_from:
  - /Mono_Experimental_Installer_For_Windows/
---

Mono Experimental Installer For Windows
=======================================

Ever since Novell took over the process of creating and shipping the Mono Combined Installer for Windows, the original [Mono Windows Integration project](http://forge.novell.com/modules/xfmod/project/?monowin32) refocused its production of the installer to a more research and development oriented version. The intention has not been to compete with what Novell already delivers on a regular basis, but rather investigate how can new technologies be brought to Windows. Above all, the quest for "FULL" parity with the way mono works on other platforms like Linux and Mac OS X.

To avoid conflicts, the original Mono Combined Installer at Novell Forge was renamed to the Mono Experimental Combined Installer for Windows. Its installer file name and the destination directory it uses during setup are named very differently from Novell's one to allow parallel installation without conflict.

This effort has already produced an installer that has Gnome Platform and Gnome Desktop components and a Gtk\# complement that can take advantage of it -- like Gnome\# which in turns gives access to gnomeprint, gnomecanvas as well as gtkhtml libraries in Windows. This permits that collections like mono-tools can build and run for the first time in Windows, giving way to MonoDoc and its documentation browser to work. The ultimate goal would be to have MonoDevelop running on Windows.

