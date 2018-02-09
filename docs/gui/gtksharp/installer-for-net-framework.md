---
title: Gtk-Sharp Installer for .NET Framework
redirect_from:
  - /Gtk-Sharp_Installer_for_.NET_Framework/
---

Introduction
============

The Gtk# installer for the .NET Framework gives .NET developers all of the pieces they need to build and run Gtk#-based applications, the same set of libraries that are used to build Unix applications on Mono.

Applications developed with Gtk# on .NET do not require Mono to run.

If the application is a 100% .NET, without using P/Invoke to call into Win32 functions or using some Windows-specific assemblies, the code will run out of the box on Unix and Linux systems with Mono.

The Gtk# installer for .NET can be downloaded from the [Downloads](/download/stable#download-win) page.

Gtk# Runtime/Redistributable Installer
---------------------------------------

The Gtk# Runtime Installer includes the components necessary to run applications on the .NET Framework that were created with Gtk#.

It contains the Gtk+ runtime and the Gtk# assemblies which get registered into Global Assembly Cache.

For example, companies like [Medsphere](http://www.medsphere.com) use the Gtk# Runtime Installer for the version of their main product that runs in Microsoft Windows. They use Mono on Linux with Gtk# and they use .NET on Windows with this installer for Gtk#.

Notes and Observations
======================

One major difference between the Gtk# installer for .NET and the Mono Combined Installer for Windows is that the Gtk# installers perform libary installations into the Microsoft .NET Global Assembly Cache (GAC). Mono has its own GAC that is independent of the Microsoft .NET GAC.

Obtaining the Installers
========================

The installer for Gtk# is available on the Windows platform section of the [Downloads](/download/stable#download-win) page.

