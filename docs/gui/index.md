---
title: GUI Toolkits
redirect_from:
  - /Gui_Toolkits/
  - /docs/gui/gui-toolkits/
---

This page contains a list with a couple of known toolkits for Graphical User Interfaces that you can use in your Mono software.

If you need help to know which one is the best for your project, please have a look at [Choosing a GUI Toolkit](/docs/gui/choosing-a-gui-toolkit/).

[Gtk#](/docs/gui/gtksharp/)
---------------------------

[![Banshee1.png](/archived/images/5/5e/Banshee1.png)](/archived/images/5/5e/Banshee1.png)

[Banshee](http://banshee-project.org/Main_Page), a GTK# app

[![Fspot1.png](/archived/images/9/92/Fspot1.png)](/archived/images/9/92/Fspot1.png)

[F-Spot](http://f-spot.org/Main_Page), a GTK# app

Homepage: [GtkSharp](/docs/gui/gtksharp/)

GTK# is a .NET binding for the Gtk+ toolkit. The toolkit is written in C for speed and compatibility, while the GTK# binding provides an easy to use, object oriented API for managed use. It is in active development by the Mono project, and there are various real-world applications available that use it ([Banshee](http://banshee-project.org/Main_Page), [F-Spot](http://f-spot.org/Main_Page), [Beagle](http://beagle-project.org/Main_Page), [MonoDevelop](http://www.monodevelop.com/Main_Page)).

In general, GTK# applications are written using [MonoDevelop](http://www.monodevelop.com/Main_Page), which provides a visual designer for creating GTK# GUIs.

Platforms: Unix, Windows, OSX

Pros:

-   Good support for accessibility through its Gtk+ heritage.
-   Layout engine ideal for handling internationalized environments, and adapts to font-size without breaking applications.
-   Applications integrate with the Gnome Desktop.
-   API is familiar to Gtk+ developers.
-   Large Gtk+ community.
-   A Win32 port is available, with native look on Windows XP.
-   The API is fairly stable at this point, and syntactic sugar is being added to improve it.
-   Unicode support is exceptional.

Cons:

-   Gtk+ apps run like foreign applications on MacOS X.
-   Incomplete documentation.

[MonoMac](/docs/tools+libraries/libraries/monomac/)
---------------------------------------------------

Homepage: [MonoMac](/docs/tools+libraries/libraries/monomac/)

MonoMac is aimed at .Net/Mono developers that want to allow their users to have a native Mac OS X application experience. MonoMac allows developers to access the whole range of MacOS X APIs from C#, it is not limited to the AppKit GUI APIs.

The MonoMac APIs replaced the old CocoaSharp binding, which is now deprecated.

Platforms: OSX

Pros:

-   Native look and feel on MacOS X.
-   Substrate is well documented.

Cons:

-   Not portable outside of MacOS X.

[Windows.Forms](/docs/gui/winforms/)
------------------------------------

[![Nunit1.png](/archived/images/7/71/Nunit1.png)](/archived/images/7/71/Nunit1.png)

[NUnit](http://www.nunit.org/), a Winforms app

[![Screenshot-SharpChess.png](/archived/images/3/32/Screenshot-SharpChess.png)](/archived/images/3/32/Screenshot-SharpChess.png)

[SharpChess](http://sharpchess.com/), a Winforms app

Homepage: [Winforms](/docs/gui/winforms/)

Windows.Forms is a binding developed by Microsoft to the Win32 toolkit. As a popular toolkit used by millions of Windows developers (especially for internal enterprise applications), the Mono project decided to produce a compatible implementation (Winforms) to allow these developers to easily port their applications to run on Linux and other Mono platforms.

Whereas the .Net implementation is a binding to the Win32 toolkit, the Mono implementation is written in C# to allow it to work on multiple platforms. Most of the Windows.Forms API will work on Mono, however some applications (and especially third party controls) occasionally bypass the API and P/Invoke straight to the Win32 API. These calls will likely have to changed to work on Mono.

In general, Winforms applications are written using Microsoft's Visual Studio or [SharpDevelop](http://www.icsharpcode.net/opensource/sd/), which both provide a visual designer for creating Winforms GUIs.

Platforms: Windows, Unix, OSX

Pros:

-   Extensive documentation exists for it (books, tutorials, online documents).
-   Large community of active developers.
-   Easiest route to port an existing Windows.Forms application.

Cons:

-   Internationalization can be tricky with fixed layouts.
-   Looks alien on non-Windows platforms.
-   Code that calls the Win32 API is not portable.

Work in Progress
===================

Listed below are some Toolkits that are in several stages of active development but didn't have a stable release yet.

Xwt
---

Homepage: https://github.com/mono/xwt

Xwt is a cross-platform toolkit that works by exposing one unified API across all environments. The API is mapped to native controls on each platform.

It can be used as a standalone framework or it can be embedded into existing applications. Monodevelop uses this toolkit for simple interfaces that need to feel native across all the platforms, without the need to write platform specific code.

Pros:
-   Extremely simple API.
-	Native look and feel on each platform.
-	Can be embedded in existing applications.

Cons:
-	Poor documentation.

QtSharp
-------

Homepage: https://github.com/ddobrev/QtSharp

QtSharp started as a sucessor of the Qyoto project. It aims to create libraries that wrap [Qt](https://qt-project.org/) thus enabling its usage through C#. It relies on [CppSharp](https://github.com/mono/CppSharp) and generates the wrappers based on a pre-installed Qt set-up.

Still in early development.

Dead efforts
============

There are a couple of [Dead Toolkits](/docs/tools+libraries/dead-toolkits/ "Dead Toolkits") that have been developed in the past.