---
layout: docpage
navgroup: docs
title: OSX
---

Introduction to Mono on MacOS X
-------------------------------

Mono has supported MacOS X since version 10.3 (Panther) and supports both Intel and PowerPC based versions with both 32 bits and 64 bits configuration supported.

You can use Mono on OSX to build server, console and GUI applications. Read below for the options available for GUI application development.

If you are interested in creating native GUI applications, use the [MonoMac]({{ site.github.url }}/docs/tools+libraries/libraries/monomac/) bindings and our MonoDevelop add-in. Read the description on [MonoMac]({{ site.github.url }}/docs/tools+libraries/libraries/monomac/) for more information on how to get started.

Installing Mono on MacOS X
--------------------------

You can use Mono either as a runtime to run existing application, or as an SDK to develop new applications with Mono.

Visit the [download page]({{ site.github.url }}/download/) to find the latest MacOS X package. Run it and follow the instructions there, you can either get a basic runtime, or a complete runtime plus a software development kit.

If you plan on developing applications with Mono, we suggest that you also [install the MonoDevelop IDE](http://monodevelop.com/download) after you install Mono.

The Mono package includes:

-   The Mono Runtime
-   GUI Toolkits: Windows.Forms and Gtk\# for OSX.
    -   Note: the [MonoMac]({{ site.github.url }}/docs/tools+libraries/libraries/monomac/) GUI toolkit for native OSX GUI development is currently a separate download.
-   SDK: C\#, Visual Basic compilers, assemblers and tools
-   XSP ASP.NET server
-   Manual pages.

This package installs as a framework to /Library/Framework (the same way the Java packages are installed). Symlinks are created for the executables in /usr/bin. If you'd like to access the mono *manpages* you'll have to add /Library/Frameworks/Mono.framework/Versions/Current/man to your *manpath*. The MacOS X Mono package does not include [Gtk\#]({{ site.github.url }}/GtkSharp), XSP or mod\_mono. These will have to be compiled from source.

Our packages currently require Mono OSX 10.4 or better, for older versions, you will need to build from source code.

Using Mono on MacOS X
---------------------

At this point, you must use Mono from the command line, the usual set of commands that are available on other ports of Mono are available.

To build applications you can use ["gmcs"]({{ site.github.url }}/docs/about-mono/languages/csharp/), to run then you can use [mono]({{ site.github.url }}/docs/advanced/runtime/).

From a Terminal shell, you can try it out:

``` bash
$ vi hello.cs 
$ gcs hello.cs
$ mono hello.exe
Hello, World
$
```

Most users would be using the [MonoDevelop IDE](http://monodevelop.com) to create their projects.

You will have a choice of [GUI toolkits]({{ site.github.url }}/docs/gui/gui-toolkits/) for building your application, from pure cross platform, to Mac-specific using [MonoMac]({{ site.github.url }}/docs/tools+libraries/libraries/monomac/).

32 and 64 bit support
---------------------

The Mono packages published on this web site provide a 32-bit Mono VM.

Support for 64-bit VMs as of Mono 2.10 is only available if you build Mono from source code and install your own copy of the VM. In the future we will ship both mono and mono64 binaries for our users.

The 64 bit support has a few limitations today which is why we have not entirely switched to it:

-   Our Windows.Forms implementation uses Carbon, and as such, it would not work with a 64-bit Mono.
-   MonoDevelop uses Carbon for its menu integration so it would not run on a 64-bit VM.
-   MonoMac bindings have not been ported to 64 bits.

Supporting 64-bit Mono across the board would also require us to ship a 64-bit Gtk+ stack and that would increase the download size for most users.

Building Client Applications
----------------------------

There are a few choices to build client applications on OSX, you should pick the technology that better fits your goals, your choices are:

||
|Toolkit|Runs on Linux|Runs on Windows|Runs on Mac|Binding Style|License|Status|
|[MonoMac]({{ site.github.url }}/docs/tools+libraries/libraries/monomac/)|no|no|yes|Strongly typed C\# binding to Cocoa APIs|MIT X11|Actively developed, builds on the design lessons from [MonoTouch](http://monotouch.net) but still incomplete. This will be the new default binding for Mono on OSX. Separate download.|
|Gtk\#|yes|yes|yes|Strongly typed C\# binding to the cross platform Gtk+ API. Applications look foreign on OSX.|LGPL v2|Actively developed, cross platform. Bundled with Mono.|
|Windows.Forms|yes|yes|yes|Cross platform implementation of Microsoft's Windows.Forms. Applications look foreign on OSX.|MIT X11|The Windows.Forms API was frozen in time by Microsoft. Bundled with Mono.|
|[MonObjc](http://www.monobjc.net)|no|no|yes|Binding to the native Cocoa APIs, but requires manual use of Objective-C selectors to work with, relatively thin wrapper around the underlying APIs.|LGPL v3|Actively developed. Separate download.|
|CocoaSharp|no|no|yes|Binding to the native Cocoa APIs, but requires manual use of Objective-C selectors to work with, relatively thin wrapper around the underlying APIs.|MIT X11|No longer developed, no longer maintained, deprecated. Bundled with Mono.|

Running Mono applications on MacOS X
------------------------------------

Running applications on MacOS X is very similar to linux systems, from the terminal:

    mono myprogram.exe

For GTK\# applications, it's easiest to run them the same way but using *xterm* from X11.app

    A MacOS X specific Mono launcher was in development but its status is unclear today

Windows.Forms
-------------

Mono's implementation of the System.Windows.Forms API is built on top of Carbon and can only run with Mono on 32 bit systems. The look and feel of System.Windows.Forms applications mimics the Windows style and does not currently render like a native OSX application.

Third Party Libraries
---------------------

[ObjC\#]({{ site.github.url }}/old_site/ObjCSharp "ObjCSharp") is a transparent two way bridge that allows the CLR to access the rich underlying ObjectiveC frameworks as well as providing direct access to the CLR frameworks from the ObjectiveC language.

Uninstalling Mono on Mac OS X
-----------------------------

Run this script in a terminal:

    #!/bin/sh -x

    #This script removes Mono from an OS X System.  It must be run as root

    rm -r /Library/Frameworks/Mono.framework

    rm -r /Library/Receipts/MonoFramework-*

    for dir in /usr/bin /usr/share/man/man1 /usr/share/man/man3 /usr/share/man/man5; do
       (cd ${dir};
        for i in `ls -al | grep /Library/Frameworks/Mono.framework/ | awk '{print $9}'`; do
          rm ${i}
        done);
    done

