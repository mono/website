---
title: "Release Notes MonoTools 2.0 Beta 1"
lastmodified: '2010-06-28'
redirect_from:
  - /Release_Notes_MonoTools_2.0_Beta_1/
---

Release Notes MonoTools 2.0 Beta 1
==================================

Mono Tools for Visual Studio 2.0 Beta 1

We are proud to announce Mono Tools for Visual Studio 2.0 Beta 1 (MonoTools)! For 2.0, we rewrote many of the techniques that turned out to be pain points for our users. Additionally, we are adding support for debugging more platforms like Mac and Windows. (Don't worry early adopters, the upgrade to 2.0 is free!)

What's New in 2.0
=================

Soft Debugger
-------------

One of the biggest changes for MonoTools 2.0 (at least under the hood) is that we've switched to Mono's new Soft Debugger.

The soft debugger was originally released for MonoTouch, allowing developers to remotely debug applications running on Mono on the iPhone. Unlike our traditional "hard debugger" (mdb), which operates outside of the Mono runtime to start and pause an application and poke at memory contents, the soft debugger is built into the Mono runtime and cooperates with the runtime to provide the necessary functionality to the debugger.

[More Information about the Soft Debugger](/Soft_Debugger)

#### Platform Support Overview

The biggest benefit of supporting the soft debugger in MonoTools is that users can now use Visual Studio to debug Mono running Linux, Windows, and Mac OS X.

Debugging Mono on Windows is an especially important improvement because it can simplify the porting process. When porting an application to Mono, we've always recommended people port first to Mono on Windows to find any differences between Mono and .NET, and then port to Mono on Linux to find any differences between Windows and Linux; however, the lack of local debugging support on Windows in MonoTools 1.x made it difficult to take this approach.

#### Better Debugging Experience

The debugger in MonoTools 2.0 also adds several features that were notably absent, including support for adding or removing breakpoints while running, and support for setting a breakpoints in partial constructors (most commonly effecting the Windows.Forms designer in Visual Studio).

Profile-Based Deployment
------------------------

MonoTools 2.0 introduces MonoTools Server Profiles. Profiles allow you to save your frequently used servers (and local Mono instances) so you can easily switch between them. Think of them like "bookmarks" for your servers, saving you the effort of keying server names/ip addresses, or waiting on Mono Tools to find nearby servers.

[Profiles.png](/archived/images/4/4e/Profiles.png)

However, profiles can store more than just the server address. Each profile can have completely independent settings, allowing you to set up things like IOMAP, so you can quickly switch between profiles with case-sensitivity enabled or disabled.

[Advanced.png](/archived/images/f/f9/Advanced.png)

You may also note a few new settings are available. We got several feature requests for allowing applications to be run with arbitrary environment variables or arguments passed to Mono, which can now be assigned per-profile.

Deployment Speed
----------------

Another great new improvement in MonoTools 2.0 is deployment speed. In 1.1, we introduced an improvement that saved the step of recopying files to the server if they were unchanged since the last run. This helped considerably, but copying files could still be unacceptably slow at times.

For 2.0, this has been totally rewritten from scratch. We now copy files over HTTP instead of remoting. Now we not only copy files that have changed since the last run, we also compress all files into one zip file that we transfer to the server.

For our usual test case of BlogEngine.NET, it could take up to 30 seconds to copy for a first run in MonoTools 1.0/1.1. In 2.0, it takes about 1-2 seconds to compress the code, send it, and decompress it. Subsequent, unchanged runs are nearly instantaneous, making the "debug, fix, test" cycle much faster.

Platform Support
----------------

MonoTools 2.0 supports running and debugging on many more platforms than 1.0/1.1.

1.0/1.1 supported:

-   Windows - Run
-   Linux - Run, Debug

2.0 now supports:

-   Windows - Run, Debug
-   Linux - Run, Debug
-   Mac - Run, Debug

This should make it easier to target every desktop platform.

Links
-----

The beta is public, so download it now and let us know how it goes!

**This beta will expire on July 15th, 2010.**

### Download MonoTools

-   [MonoTools 2.0 Beta 1 for Visual Studio 2008](http://go-mono.com/monotools-download/latest/monotools.msi)
-   [MonoTools 2.0 Beta 1 for Visual Studio 2010](http://go-mono.com/monotools-download/latest/monotools.vsix)

**Note:** Express editions of Visual Studio cannot run plugins, so they will not work.

### Download Mono for Windows to Run/Debug Locally

-   [Mono 2.6.5 for Windows](http://go-mono.com/monotools-download/latest/mono-windows.exe)

### Download Servers for Linux and Mac to Run/Debug Remotely

**Linux:**

-   [Preconfigured MonoTools Server openSUSE VMware image](http://go-mono.com/monotools-download/latest/MonoTools-vmx.zip) (500MB)

- or -

-   [Preconfigured MonoTools Server openSUSE VirtualPC image](http://go-mono.com/monotools-download/latest/MonoTools-vpc.zip) (500MB)

- or -

-   Use the openSUSE 1click from your existing Linux system:

[Monovs-1click.png](http://go-mono.com/monotools-download/latest/monotools.ymp)

**Note:** After installing on Linux, launch the "MonoTool GUI Server" from the application menu to start the server.

**Mac:**

-   [MonoTools Server for Mac OS X](http://go-mono.com/monotools-download/latest/monotools-server.dmg) (required to debug Mono on Mac OS X)
    -   Requires [Mono 2.6.5 for Mac OS X](http://go-mono.com/monotools-download/latest/MonoFramework-x86.dmg)

### Sources

-   [monotools-server-2.0.tar.bz2](http://go-mono.com/monotools-download/latest/monotools-server-2.0.tar.bz2)

### Other useful resources

-   [Submit a Bug](/Bugs#Mono_Tools)
-   [Discuss in Forums](http://forums.mono-tools.com/)


