---
layout: obsolete
title: "Gui Toolkits"
lastmodified: '2012-12-29'
permalink: /old_site/Gui_Toolkits/
redirect_from:
  - /Gui_Toolkits/
---

Gui Toolkits
============

**Picking the Right Toolkit**

One of the hardest and most important decision to make when starting a new desktop application is which GUI "toolkit" to choose. The toolkit is the set of API's that produce the graphical user interface your users will interact with.

There are a number of factors to consider when choosing the toolkit. Different toolkits support different platforms (Linux, Windows, OSX) and have different features such as accessibility, layout engines, and looks.

The two main toolkits offered by Mono are GTK\# and Winforms, however there are several other toolkits offered by the community which may suit your needs.

Both GTK\# and Winforms, while being cross-platform, have clear roots in their original platforms. Gtk+ (the root of GTK\#) began life on the Linux platform, and has since been ported to Windows and OSX. Likewise, Winforms started on Windows, and the Mono project has ported it to run on Linux and OSX. If the majority of your users will be on one platform, likely the best choice will be the toolkit native to that platform. Although steps can be taken to make your application blend on all platforms, the native toolkit will probably do the best on each platform, and will feel familiar to the majority of your users. If you do not have a platform preference, your toolkit choice will have to rely on other factors.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#toolkits">1 Toolkits</a>
<ul>
<li><a href="#gtk">1.1 Gtk#</a></li>
<li><a href="#monomac">1.2 MonoMac</a></li>
<li><a href="#windowsforms">1.3 Windows.Forms</a></li>
<li><a href="#qyoto">1.4 Qyoto</a></li>
<li><a href="#qt4dotnet">1.5 Qt4Dotnet</a></li>
<li><a href="#wxnet">1.6 wxNet</a></li>
<li><a href="#dead-efforts">1.7 Dead efforts</a></li>
</ul></li>
<li><a href="#alternative-implementation-approaches">2 Alternative Implementation Approaches</a></li>
</ul></td>
</tr>
</tbody>
</table>

Toolkits
========

[Gtk\#]({{ site.github.url }}/old_site/GtkSharp "GtkSharp")
---------------------------------------------------------

[![]({{ site.github.url }}/old_site/images/5/5e/Banshee1.png)]({{ site.github.url }}/old_site/images/5/5e/Banshee1.png)

[![](/skins/common/images/magnify-clip.png)]({{ site.github.url }}/old_site/images/5/5e/Banshee1.png "Enlarge")

[Banshee](http://banshee-project.org/Main_Page), a GTK\# app

[![]({{ site.github.url }}/old_site/images/9/92/Fspot1.png)]({{ site.github.url }}/old_site/images/9/92/Fspot1.png)

[![](/skins/common/images/magnify-clip.png)]({{ site.github.url }}/old_site/images/9/92/Fspot1.png "Enlarge")

[F-Spot](http://f-spot.org/Main_Page), a GTK\# app

Homepage: [GtkSharp]({{ site.github.url }}/old_site/GtkSharp "GtkSharp")

GTK\# is a .NET binding for the Gtk+ toolkit. The toolkit is written in C for speed and compatibility, while the GTK\# binding provides an easy to use, object oriented API for managed use. It is in active development by the Mono project, and there are various real-world applications available that use it ([Banshee](http://banshee-project.org/Main_Page), [F-Spot](http://f-spot.org/Main_Page), [Beagle](http://beagle-project.org/Main_Page), [MonoDevelop](http://www.monodevelop.com/Main_Page)).

In general, GTK\# applications are written using [MonoDevelop](http://www.monodevelop.com/Main_Page), which provides a visual designer for creating GTK\# GUIs.

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

[MonoMac]({{ site.github.url }}/old_site/MonoMac "MonoMac")
---------------------------------------------------------

Homepage: [MonoMac]({{ site.github.url }}/old_site/MonoMac "MonoMac")

MonoMac is aimed at .Net/Mono developers that want to allow their users to have a native Mac OS X application experience. MonoMac allows developers to access the whole range of MacOS X APIs from C\#, it is not limited to the AppKit GUI APIs.

The MonoMac APIs replaced the old [CocoaSharp]({{ site.github.url }}/old_site/MonoMac) binding, which is now deprecated.

Platforms: OSX

Pros:

-   Native look and feel on MacOS X.
-   Substrate is well documented.

Cons:

-   Not portable outside of MacOS X.

[Windows.Forms]({{ site.github.url }}/old_site/WinForms "WinForms")
-----------------------------------------------------------------

[![]({{ site.github.url }}/old_site/images/7/71/Nunit1.png)]({{ site.github.url }}/old_site/images/7/71/Nunit1.png)

[![](/skins/common/images/magnify-clip.png)]({{ site.github.url }}/old_site/images/7/71/Nunit1.png "Enlarge")

[NUnit](http://www.nunit.org/), a Winforms app

[![]({{ site.github.url }}/old_site/images/3/32/Screenshot-SharpChess.png)]({{ site.github.url }}/old_site/images/3/32/Screenshot-SharpChess.png)

[![](/skins/common/images/magnify-clip.png)]({{ site.github.url }}/old_site/images/3/32/Screenshot-SharpChess.png "Enlarge")

[SharpChess](http://sharpchess.com/), a Winforms app

Homepage: [Winforms]({{ site.github.url }}/old_site/WinForms "WinForms")

Windows.Forms is a binding developed by Microsoft to the Win32 toolkit. As a popular toolkit used by millions of Windows developers (especially for internal enterprise applications), the Mono project decided to produce a compatible implementation (Winforms) to allow these developers to easily port their applications to run on Linux and other Mono platforms.

Whereas the .Net implementation is a binding to the Win32 toolkit, the Mono implementation is written in C\# to allow it to work on multiple platforms. Most of the Windows.Forms API will work on Mono, however some applications (and especially third party controls) occasionally bypass the API and P/Invoke straight to the Win32 API. These calls will likely have to changed to work on Mono.

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

Qyoto
-----

Homepage: [Qyoto](http://techbase.kde.org/Development/Languages/Qyoto)

The Qyoto/Kimono languages bindings allow C\# and any other .NET language to be used to write Qt/KDE programs. The bindings are autogenerated directly from the Qt/KDE headers, greatly reducing the maintenance effort. KDE doxygen comments are automatically converted to the xml based C\# style of comment format. Substrate is well documented and supported. Qyoto 4.0 got nice [Documentation](http://api.kde.org/qyoto-api/) too.

Platforms: Unix, Windows, OSX

On Debian/Ubuntu, it can be installed by installing the 'qyoto-dev' package.

Qt4Dotnet
---------

Homepage: [Qt4Dotnet](http://code.google.com/p/qt4dotnet/)

This is a port of the QtJambi java bindings to .net using IKVM.

wxNet
-----

[![]({{ site.github.url }}/old_site/images/c/cf/Linux-05.png)]({{ site.github.url }}/old_site/images/c/cf/Linux-05.png)

[![](/skins/common/images/magnify-clip.png)]({{ site.github.url }}/old_site/images/c/cf/Linux-05.png "Enlarge")

wx\# Sample

Homepage: [http://wxnet.sourceforge.net/](http://wxnet.sourceforge.net/)

wxNet is a .NET binding for the wxWindows cross-platform toolkit.

Platforms: Windows, Linux, OSX

Pros:

-   Native look and feel on each platform.
-   Substrate (wxWindows) is well documented, .NET binding lacks documentation.

Cons:

-   Binding to non-supported extra widgets is hard.
-   Custom-authored widgets look and feel is not preserved across platforms.
-   Common denominator subset API problem.

Dead efforts
------------

There are a couple of [Dead Toolkits]({{ site.github.url }}/old_site/Dead_Toolkits "Dead Toolkits") that have been developed in the past.

Alternative Implementation Approaches
=====================================

If your application is designed to be a long-running application and you have the extra resources to spare you might want to consider creating multiple operating system specific user interfaces, one for each major platform.

The idea is that you must split your application in parts:

-   Core: this contains the hearth of your application, your logic, your business process.
-   Front-end: this contains the UI front-ends for each platform.

You could even take this one step further and in addition to have a front-end per platform, you could even make a Web frontend if the Core is suitable for it.

The downside is that you have to write the code more than once, but the upside is that your application will look native on each platform.

Although some toolkits support themes, theme engines and try to mimic the host operating system, making an application truly operating system specific goes beyond the basic look.

There are a number of examples:

-   The order of buttons in dialog boxes tends to be different between Windows and MacOS/Gnome.
-   Dialog Box Layout: this tends to change across operating systems.
-   Configuration options: these tend to be radically different across different operating systems.

As an example, consider the UI for [Tangerine](http://snorp.net/log/tangerine) an application used to stream music over DAAP. Tangerine has a core engine and three user interfaces, one for each major operating system:

On Windows:

[![Tangerine-prefs-win32-new.png]({{ site.github.url }}/old_site/images/1/17/Tangerine-prefs-win32-new.png)]({{ site.github.url }}/old_site/images/1/17/Tangerine-prefs-win32-new.png)

On Linux with Gnome:

[![Tangerine-properties.png]({{ site.github.url }}/old_site/images/e/e3/Tangerine-properties.png)]({{ site.github.url }}/old_site/images/e/e3/Tangerine-properties.png)

On MacOS X:

[![Tangerine-preferences-mac.png]({{ site.github.url }}/old_site/images/a/a6/Tangerine-preferences-mac.png)]({{ site.github.url }}/old_site/images/a/a6/Tangerine-preferences-mac.png)

