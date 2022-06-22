---
title: macOS
redirect_from:
  - /Mono%3AOSX/
  - /Mono_on_MacOS_X/
  - /docs/about-mono/supported-platforms/osx/
---

Introduction to Mono on macOS
-----------------------------

Mono supports macOS version 10.9 (Mavericks) and later.

You can use Mono on macOS to build server, console and GUI applications. Read below for the options available for GUI application development.

If you are interested in creating native GUI applications, use the [MonoMac](/docs/tools+libraries/libraries/monomac/) bindings and our MonoDevelop add-in. Read the description on [MonoMac](/docs/tools+libraries/libraries/monomac/) for more information on how to get started.

Installing Mono on macOS
------------------------

You can use Mono either as a runtime to run existing application, or as an SDK to develop new applications with Mono.

Visit the [download page](/download/stable/) to find the latest macOS package. Run it and follow the instructions there, you can either get a basic runtime, or a complete runtime plus a software development kit.

If you plan on developing applications with Mono, we suggest that you also [install the MonoDevelop IDE](http://monodevelop.com/download) after you install Mono.

The Mono package includes:

-   The Mono Runtime
-   GUI Toolkits: Windows.Forms and Gtk# for macOS.
    -   Note: the [MonoMac](/docs/tools+libraries/libraries/monomac/) GUI toolkit for native macOS GUI development is currently a separate download.
-   SDK: C#, Visual Basic compilers, assemblers and tools
-   XSP ASP.NET server
-   Manual pages.

This package installs as a framework into `/Library/Frameworks/Mono.framework` (the same way the Java packages are installed). The executable binaries can be found in `/Library/Frameworks/Mono.framework/Versions/Current/bin`. If you'd like to access the mono *manpages* you'll have to add `/Library/Frameworks/Mono.framework/Versions/Current/man` to your *manpath*. The macOS Mono package does not include [Gtk#](/GtkSharp), XSP or mod_mono. These will have to be compiled from source.

Our packages currently require macOS version 10.9 or later, for older versions, you will need to build from source code.

Using Mono on macOS
-------------------

At this point, you must use Mono from the command line, the usual set of commands that are available on other ports of Mono are available.

To build applications you can use ["mcs"](/docs/about-mono/languages/csharp/), to run then you can use [mono](/docs/advanced/runtime/).

From a Terminal shell, you can try it out:

``` bash
$ vi hello.cs
$ csc hello.cs
$ mono hello.exe
Hello, World
$
```

Most users would be using the [MonoDevelop IDE](http://monodevelop.com) to create their projects.

You will have a choice of [GUI toolkits](/docs/gui/gui-toolkits/) for building your application, from pure cross platform, to Mac-specific using [MonoMac](/docs/tools+libraries/libraries/monomac/).

32 and 64 bit support
---------------------

The Mono packages published on this web site provide both a 32-bit and a 64-bit Mono VM.

Starting from Mono 5.2 the `mono` command defaults to 64-bit, you can use the `--arch=32/64` switch to control the bitness.

The 64 bit support has a few limitations today:

-   Our Windows.Forms implementation uses Carbon, and as such, it would not work with a 64-bit Mono.

Building Client Applications
----------------------------

There are a few choices to build client applications on macOS, you should pick the technology that better fits your goals, your choices are:

||
|Toolkit|Runs on Linux|Runs on Windows|Runs on Mac|Binding Style|License|Status|
|[MonoMac](/docs/tools+libraries/libraries/monomac/)|no|no|yes|Strongly typed C# binding to Cocoa APIs|MIT X11|Actively developed, builds on the design lessons from [MonoTouch](http://monotouch.net) but still incomplete. This will be the new default binding for Mono on macOS. Separate download.|
|Gtk#|yes|yes|yes|Strongly typed C# binding to the cross platform Gtk+ API. Applications look foreign on macOS.|LGPL v2|Actively developed, cross platform. Bundled with Mono.|
|Windows.Forms|yes|yes|yes|Cross platform implementation of Microsoft's Windows.Forms. Applications look foreign on macOS.|MIT X11|The Windows.Forms API was frozen in time by Microsoft. Bundled with Mono.|
|[MonObjc](http://www.monobjc.net)|no|no|yes|Binding to the native Cocoa APIs, but requires manual use of Objective-C selectors to work with, relatively thin wrapper around the underlying APIs.|LGPL v3|Actively developed. Separate download.|
|CocoaSharp|no|no|yes|Binding to the native Cocoa APIs, but requires manual use of Objective-C selectors to work with, relatively thin wrapper around the underlying APIs.|MIT X11|No longer developed, no longer maintained, deprecated. Bundled with Mono.|

Running Mono applications on macOS
----------------------------------

Running applications on macOS is very similar to linux systems, from the terminal:

    mono myprogram.exe

For GTK# applications, it's easiest to run them the same way but using *xterm* from X11.app

    A macOS specific Mono launcher was in development but its status is unclear today

Windows.Forms
-------------

Mono's implementation of the System.Windows.Forms API is built on top of Carbon and can only run with Mono on 32 bit systems. The look and feel of System.Windows.Forms applications mimics the Windows style and does not currently render like a native macOS application.

Third Party Libraries
---------------------

[ObjC#](/archived/objcsharp) is a transparent two way bridge that allows the CLR to access the rich underlying ObjectiveC frameworks as well as providing direct access to the CLR frameworks from the ObjectiveC language.

Uninstalling Mono on macOS
---------------------------

Run this script in a terminal:

```bash
sudo rm -rf /Library/Frameworks/Mono.framework
sudo pkgutil --forget com.xamarin.mono-MDK.pkg
sudo rm /etc/paths.d/mono-commands
```
