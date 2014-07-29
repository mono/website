---
layout: docpage
navgroup: docs
title: Libraries
redirect_from:
  - /Libraries/
---

GUI Development
===============

[Gtk\#]({{ site.github.url }}/docs/gui/gtksharp/)
---------------------------------------------------------

[![]({{ site.github.url }}/old_site/images/5/57/IFolder_Linux.png)]({{ site.github.url }}/old_site/images/5/57/IFolder_Linux.png)

[GTK\#]({{ site.github.url }}/docs/gui/gtksharp/) action with iFolder

Hompepage: [http://gtk-sharp.sf.net](http://gtk-sharp.sf.net)

Wiki: [GtkSharp]({{ site.github.url }}/docs/gui/gtksharp/)

This toolkit is a .NET binding for the Gtk+ toolkit. It is in active development, and there are various applications in the Mono world that use it (Monodoc, Monocov, Mono's Debugger and various smaller applications, a more complete list is available on the Gtk\# Wiki. Platforms: Unix, Windows, GPE, MacOS X (using the X server).

Pros:

-   Good support for accessibility through its Gtk+'s heritage.
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

### Complementary Libraries

The following are some libraries that might be useful while developing Gtk\# based applications or Gnome applications:

#### Gnome-KeyRing-Sharp

This library provides access to the Gnome Keyring for managed applications.

Availability: [GitHub](http://www.github.com/mono/gnome-keyring-sharp), [Web](http://www.go-mono.com/archive/gnome-keyring-sharp/)

#### GSF Sharp

This library provides access to reading and writing structured files (OLE files), this depends on the libgsf library from the GNOME project:

Availability: [Web](http://anonsvn.mono-project.com/viewvc/trunk/gsf-sharp/) [snapshot](http://anonsvn.mono-project.com/viewvc/trunk/gsf-sharp.tar.gz?view=tar)

#### GtkGlArea Sharp

A binding for GtkGlArea, a widget that can host an OpenGL context in your Gtk\# application.

Availability: [Web](http://anonsvn.mono-project.com/viewvc/trunk/gtkglarea-sharp/) [snapshot](http://anonsvn.mono-project.com/viewvc/trunk/gtkglarea-sharp.tar.gz?view=tar)

#### WebKit Sharp

webkit-sharp provides access to [WebKit](http://live.gnome.org/WebKitGtk), a fast, high-quality web browser engine suited for embedding in GTK+ applications. It features bleeding-edge HTML5, AJAX, SVG and JavaScript capabilities with seamless UI integration.

Availability: [Web](http://anonsvn.mono-project.com/viewvc/trunk/webkit-sharp/) [snapshot](http://anonsvn.mono-project.com/viewvc/trunk/webkit-sharp.tar.gz?view=tar)

#### GtkMozEmbed Sharp

This library provides access to the Mozilla rendering engine with Gtk+ using the GtkMozEmbed widget:

Availability: [Web](http://anonsvn.mono-project.com/viewvc/trunk/gtkmozembed-sharp/) [snapshot](http://anonsvn.mono-project.com/viewvc/trunk/gtkmozembed-sharp.tar.gz?view=tar)

#### GtkSourceView Sharp

Bindings to the GtkSourceView widget, this widget is typically used for writing programmer editors.

Availability: [Web](http://anonsvn.mono-project.com/viewvc/trunk/gtksourceview-sharp/) [snapshot](http://anonsvn.mono-project.com/viewvc/trunk/gtksourceview-sharp.tar.gz?view=tar)

#### Hal Sharp

This library provides access to the Hardware Abstraction Layer (HAL) from FreeDesktop.

This is used when you need to interact with the hardware. For example Banshee uses this to detect new media (reading and burning).

Availability: [Web](http://anonsvn.mono-project.com/viewvc/trunk/hal-sharp/) [snapshot](http://anonsvn.mono-project.com/viewvc/trunk/hal-sharp.tar.gz?view=tar).

#### DBus Sharp

DBus Sharp is an implementation of the DBus protocol for managed languages. DBus allows applications on the Unix desktop to communicate with each others and is part of the FreeDesktop effort.

Availability: [Web](http://www.ndesk.org/DBusSharp) [downloads](http://www.ndesk.org/archive/dbus-sharp/)

#### ipod sharp

ipod-sharp is a library that allows manipulation of the iTunesDB used in Apple iPod devices. Currently it supports adding/removing songs and manipulating playlists.

Availability: [Web](http://anonsvn.mono-project.com/viewvc/trunk/ipod-sharp/) [snapshot](http://anonsvn.mono-project.com/viewvc/trunk/ipod-sharp.tar.gz?view=tar).

#### Maemo Sharp

Maemo\# is a Gtk\# bindings for Maemo libraries.

Availability: [Web](http://anonsvn.mono-project.com/viewvc/trunk/maemo-sharp/) [snapshot](http://anonsvn.mono-project.com/viewvc/trunk/maemo-sharp.tar.gz?view=tar)

#### JScall Sharp

JSCall is a simple JavaScript bridge for Gecko\#. It's an interim solution until someone writes a proper XPCOM bridge for Mono, and uses unmanaged code and P/Invoke to invoke Gecko's XPCOM components from managed code. It should work with any .NET language, but I've referred to C\# for simplicity. I don't expect many people to use this, so the documentation is little more than minimal; lease contact me \<m.j.hutchinson@gmail.com\> if you need help working out how it works.

Availability: [Web](http://anonsvn.mono-project.com/viewvc/trunk/jscall-sharp/) [snapshot](http://anonsvn.mono-project.com/viewvc/trunk/jscall-sharp.tar.gz?view=tar)

#### NPlot Gtk

The first version of NPlot-Gtk was made by Miguel de Icaza, and was a wrapper of NPlot 0.9.8.5.

Now the wrapper of version 0.9.9.2 has just an NPlot upgrade and a few hacks over the work of Miguel (Carlos)

This version of NPlot has been extended to support Gtk\# on Linux.

The version is based on NPlot 0.9.9.2 Availability: [Web](http://anonsvn.mono-project.com/viewvc/trunk/nplot-gtk/) [snapshot](http://anonsvn.mono-project.com/viewvc/trunk/nplot-gtk.tar.gz?view=tar).

#### Taglib Sharp

[TagLibSharp](http://developer.novell.com/wiki/index.php/TagLib_Sharp) is a free and Open Source library for the .NET 2.0 and Mono frameworks which will let you do what you want to do.

It supports a large variety of movie and music formats which abstract away the work, handling all the different cases, so all you have to do is access file.Tag.Title, file.Tag.Lyrics, or my personal favorite file.Tag.Pictures.

A library for reading and writing metadata from audio files.

Availability: [Web](http://developer.novell.com/wiki/index.php/TagLib_Sharp) [snapshot](http://anonsvn.mono-project.com/viewvc/trunk/taglib-sharp.tar.gz?view=tar).

#### Daap Sharp

daap-sharp is a DAAP (Digial Audio Access Protocol) implementation. It is used by Apple's iTunes software to share music.

Availability: [Web](http://anonsvn.mono-project.com/viewvc/trunk/daap-sharp/) [snapshot](http://anonsvn.mono-project.com/viewvc/trunk/daap-sharp.tar.gz?view=tar).

#### Mono.ZeroConf

Supports the ZeroConf/Bonjour protocol using mdnsdresponder or Avahi.

Availability: [Web](http://anonsvn.mono-project.com/viewvc/trunk/Mono.Zeroconf/) [snapshot](http://anonsvn.mono-project.com/viewvc/trunk/Mono.Zeroconf.tar.gz?view=tar).

[Windows.Forms]({{ site.github.url }}/docs/gui/winforms/)
-----------------------------------------------------------------

[![]({{ site.github.url }}/old_site/images/e/ec/Colordialog.png)]({{ site.github.url }}/old_site/images/e/ec/Colordialog.png)

[MWF]({{ site.github.url }}/docs/gui/winforms/)'s color dialog box

Wiki: [WinForms]({{ site.github.url }}/docs/gui/winforms/)

This is part of the standard Mono distribution.

This is a work-in-progress effort to implement the Microsoft System.Windows.Forms API. The API is not complete enough for many tasks, so developers (in particular third-party developers that provide custom controls) resort to use the underlying Win32 subsystem on Windows to provide features which are not exposed by Windows.Forms.

In some cases it is necessary to provide support for the Wndproc method and the various messages associated with it, and support extra functionality available in Win32 through P/Invoke, as well as exposing and sharing various kinds of handles (fonts, drawing contexts, drawing surfaces, windows).

Up until recently, this was achived using a Windows emulation layer using Wine. This method was horrible to maintain as well as having many other issues. The new implimentation included in Mono is what we referer to as the new Managed.Windows.Forms. This is a fully managed version of the System.Windows.Forms toolkit provided under the Microsoft's .NET framework. This means that everything is handled in a managed layer, from drawing the buttons and controls, to interfacing with font libraries on the system. This means it should be nearly as portable as mono itself.

There are two levels of conformance in this API: The full Windows.Forms from the .NET Framework 1.0 and 1.1, and the subset exposed by the Compact Framework.

Pros:

-   Extensive documentation exists for it (books, tutorials, online documents).

Cons:

-   Bad layout mechanisms: font size changes, and internationalization require manual relayout most of the time.
-   All the Windows.Forms efforts are under heavy development.

MonObjc
-------

Homepage: [http://www.monobjc.net](http://www.monobjc.net)

Native MacOS X toolkit.

Pros:

-   Native look and feel on MacOS X
-   Extensive API and core documentation
-   Samples
-   Active, vibrant community.

Cons:

-   Not portable outside of MacOS X

Cocoa\#
-------

Native MacOSX toolkit.

Pros:

-   Native look and feel on MacOS X
-   Substrate is well documented, this API lacks documentations.

Cons:

-   Not portable outside of MacOS X

Clutter
-------

C\# bindings for the [Clutter](http://clutter-project.org/) toolkit, a library for creating lfast, visually rich graphical user interfaces now has Mono bindings. They are available [here](http://git.clutter-project.org/bindings/clutter-sharp/).

Vanilla DotNet
--------------

[Vanilla.NET](http://code.google.com/p/vanilla-dotnet/) is a cross-platform graphical user interface toolkit, application framework and desktop environment based on Cairo and the .NET framework. It is written primarily in Boo, however code contributions will be accepted in other languages (e.g. C\#). Vanilla.NET is still in development and not yet ready for production use.

wxNet
-----

[![]({{ site.github.url }}/old_site/images/c/cf/Linux-05.png)]({{ site.github.url }}/old_site/images/c/cf/Linux-05.png)

wx\# Sample

Homepage: [[|http://wxnet.sourceforge.net/](http://wxnet.sourceforge.net/)]

wxNet is a .NET binding for the wxWindows cross-platform toolkit.

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

* * * * *

ASP.NET Components
==================

JayRock
-------

[JayRock](http://jayrock.berlios.de/) is a modest and an open source (LGPL) implementation of JSON and JSON-RPC for the Microsoft .NET Framework, including ASP.NET. What can you do with Jayrock? In a few words, Jayrock allows clients, typically JavaScript in web pages, to be able to call into server-side methods using JSON as the wire format and JSON-RPC as the procedure invocation protocol. The methods can be called synchronously or asynchronously.

Gaia Ajax Widgets
-----------------

[Gaia Ajax Widgets](http://ajaxwidgets.com/more/about_gaia_ajax_framework/mono_support.aa) was built to mimic 100% the logic of conventional ASP.NET and basically this means that if you know ASP.NET you know how to use Gaia Ajax Widgets! Gaia Ajax Web Widgets does not have ANY cryptic properties or code model you need to learn before you can use Gaia effectively, almost none of our controls uses any other properties than the ones that comes with native ASP.NET so if you know your way around ASP.NET you know your way around Gaia! This can be seen from the fact that you don't need to use WebServices to e.g. populate our AutoCompleter and from the event that retrieves the AutoComplete data you can do whatever you like, including for instance making a DropDownList visible or showing a modal window.

Gaia AjaxWidgets provides Mono support.

ExtJS Extender Controls
-----------------------

A .NET Binding for the [ExtJS Library](http://www.extjs.com/) that provides a number of data-bound control: tabs, Grid Views and Tree Panels.

This requires Mono 1.2.6 or newer (for ASP.NET AJAX support).

NeatUpload
----------

[NeatUpload](http://www.brettle.com/neatupload) from Brettle Development is an ASP.NET component for displaying upload progress and streaming uploads to storage.

VisualWebGui
------------

[VisualWebGui](http://www.visualwebgui.com/) is a web application development framework.

NeatHtml
--------

[NeatHtml](http://www.brettle.com/neathtml) from Brettle Development helps prevent cross-site scripting attacks, a.k.a. XSS attacks, by validating untrusted HTML against an XML schema that does not include elements, attributes, and values that can be used for cross-site scripting attacks.

PostgreSQL Provider Suite
-------------------------

[[1]](http://dev.nauck-it.de/projects/show/aspsqlprovider) from NauckIT is a PostgreSQL implementation of the ASP.NET 2.0 Membership, Role, Profile and Session State providers.

* * * * *

Web Frameworks
==============

Emerge Toolkit
--------------

[Emerge Toolkit](http://www.emergetk.com/emergetk), The emerge toolkit is a web application development framework. The server is written in C\#, and runs on .NET and Mono.

From their site:

Our goal is to reduce the clutter when developing AJAX-style web applications. The experience of writing an emergetk application feels like writing a desktop application, with state preservation, widgets, events and handlers, and so forth. It accomplishes what ASP.NET does, but without using any viewstate.

We support - without enforcing - MVC style development. Since this is a well understood pattern, we will address each of the three components below.

MonoRail
--------

[MonoRail](http://www.castleproject.org/index.php/MonoRail) (former Castle on Rails) is a MVC web framework inspired by Action Pack.

MonoRail differs from the standard WebForms way of development as it enforces separation of concerns; controllers just handle application flow, models represent the data, and the view is just concerned about presentation logic. Consequently, you write less code and end up with a more maintainable application.

Deveel Ajax
-----------

[Deveel Ajax](http://deveel-ajax.svn.sourceforge.net): Another great library from Antonello Provenzano, the aim of this project was to increase development speed of .NET/Mono web applications by replicating, through a JavaScript proxies, the OO structure of imported types, based on prototype ([http://www.prototypejs.org](http://www.prototypejs.org)) AJAX framework. Read an [introduction to Deveel AJAX]({{ site.github.url }}/old_site/Introduction_to_Deveel_AJAX "Introduction to Deveel AJAX") on [Mono Project]({{ site.github.url }}).

Magic Ajax
----------

[Magic Ajax](http://www.magicajax.net/), MagicAjax.NET is a free open-source framework, designed to make it easier and more intuitive for developers to integrate AJAX technology into their web pages, without replacing the ASP.NET controls and/or writing tons of javascript code. MagicAjax initially appeared as a [codeproject article](http://www.codeproject.com/ajax/magicajax.asp). Now it is hosted on Sourceforge and you can find the latest release at the [downloads section](http://www.magicajax.net/Default.aspx/tabid/29). [Ajax.Net](http://ajax.schwarz-interactive.de/csharpsample/default.aspx) Another Ajax framework.

* * * * *

Apple Push Notification and Feedback Services Client C\# Library
----------------------------------------------------------------

[Apple Push, Notification Services](http://code.google.com/p/apns-sharp/) is a free, open source, independent and mono compatible C\#/.NET Library for interacting with Apple's Push Notification & Feedback Services for the iPhone/iPod.

Features:

-   Push Notifications Client
-   Feedback Service Client
-   iTunes Receipt Verification Client

Reporting
=========

fyiReporting
------------

[![]({{ site.github.url }}/old_site/images/c/ca/Fyireporting.jpg)]({{ site.github.url }}/old_site/images/c/ca/Fyireporting.jpg)

Designer screenshot

[fyiReporting](http://www.fyireporting.com/) includes a report designer, and support for the [RDL Specification](http://www.microsoft.com/sql/reporting/techinfo/rdlspec.mspx).

The software includes reusable components and Windows.Forms controls. It is available under the Apache License Version 2.

[Product Features](http://www.fyireporting.com/products.html).

ReportMan
---------

ReportMan for Mono and .NET: is available [here](http://reportman.sourceforge.net/doc/dotnetport.html), you can download it [here](http://sourceforge.net/projects/reportman)

ReportMan is open source software.

FlexCelNet
----------

[![]({{ site.github.url }}/old_site/images/b/bb/FlexCelPreview.gif)]({{ site.github.url }}/old_site/images/b/bb/FlexCelPreview.gif)

An Excel report rendered

[FlexCelNet](http://www.tmssoftware.com/flexcelnet.htm) is a suite for native Excel & PDF file and Excel & PDF report generation for Visual Studio .NET 2003, 2005.

[Product WhitePaper](http://www.tmssoftware.com/flexcel/FlexcelWhitepaper.pdf)

FlexNet is commercial software.

* * * * *

3D and Games Frameworks
=======================

Tao
---

The [TaoFramework]({{ site.github.url }}/Tao) is a collection of bindings to facilitate cross-platform media application development utilizing the .NET and Mono platforms. It provides bindings to numerous media libraries:

-   OpenGL
-   OpenAL
-   GLU and FreeGlut
-   SDL
-   PhysFs
-   FreeGlut

OpenTK
------

The [Open Toolkit](http://www.opentk.com/) is a game development library for .Net/Mono with an elegant, yet powerful, API. It features

-   CLS compliant managed OpenGL and OpenAL bindings, with automatic extension loading.
-   Cross-platform OpenGL Control for Windows.Forms.
-   Integrated math toolkit (vectors, matrices, quaternions), directly usable by OpenGL and OpenAL.
-   TrueType/FreeType font support.
-   Compile once, run everywhere, with no additional setup.

OgreDotNet
----------

[OgreDotNet](http://www.ogre3d.org/wiki/index.php/OgreDotNet) is a set of Binding and CIL Wrapper dlls for [Ogre3D](http://www.ogre3d.org) and related projects, targeting the .NET Framework or mono. Which means you can use all of OGRE's functionality with any of the .NET languages

Ogre is popular open-source graphics rendering engine, and has been used in a large number of production projects, in such diverse areas as games, simulators, educational software, interactive art, scientific visualisation, and others.

Irrlicht NETCP
--------------

[Irrlicht NetCP](http://irrlichtnetcp.sourceforge.net/wiki/) is a .NET and Mono binding to Irrlicht, a 3D graphics engine that can be used to create complex animations.

Axiom 3D
--------

[Axiom 3D Engine](http://axiomengine.sourceforge.net/wiki/index.php/Main_Page) is an open-source, cross-platform 3D graphics rendering engine for .NET and Mono. The engine is a high-performance C\# port of the powerful OGRE engine. Its flexible component-oriented architecture allows easy extension and provides full support for both DirectX and OpenGL. The engine is also cross platform supporting both Windows and Linux operating systems.

[GtkGLAreaSharp]({{ site.github.url }}/old_site/GtkGLAreaSharp "GtkGLAreaSharp")
------------------------------------------------------------------------------

Still in its infancy, this library provides an OpenGL interface to the GTK\# UI platform

Spreadsheets
============

GemBoxSoftware
--------------

[GemBox.Spreadsheet](http://www.gemboxsoftware.com/) is a .NET component which provides easy and high performance way to write, read or convert native Microsoft Excel files (XLS files in BIFF format, CSV files in text format or XLSX files in Open XML format) without the need for Microsoft Excel on either the developer or client machines. GemBox.Spreadsheet Free comes free of charge while GemBox.Spreadsheet Professional is a commercial version (licensed per developer).

* * * * *

Charting
========

NPlot
-----

[![Nplot-gtk.gif]({{ site.github.url }}/old_site/images/9/9f/Nplot-gtk.gif)]({{ site.github.url }}/old_site/images/9/9f/Nplot-gtk.gif)

[NPlot](http://netcontrols.org/nplot/wiki/) is a free charting library for .NET and supports various kinds of graphic modes.

It boasts an elegant and flexible API. NPlot includes controls for Windows.Forms, ASP.NET and a class for creating Bitmaps. A GTK\# control is also available.

ZedGraph
--------

[![Combo400.png]({{ site.github.url }}/old_site/images/0/0f/Combo400.png)]({{ site.github.url }}/old_site/images/0/0f/Combo400.png)

[ZedGraph](http://zedgraph.org) ZedGraph is a set of classes, written in C\#, for creating 2D line and bar graphs of arbitrary datasets. The classes provide a high degree of flexibility -- almost every aspect of the graph can be user-modified. At the same time, usage of the classes is kept simple by providing default values for all of the graph attributes. The classes include code for choosing appropriate scale ranges and step sizes based on the range of data values being plotted.

ZedGraph also includes a UserControl interface, allowing drag and drop editing within the Visual Studio forms editor, plus access from other languages such as C++ and VB. ZedGraph is licensed under the LGPL.

* * * * *

Parallel Computing
==================

MPAPI
-----

[Message Passing API (MPAPI)](http://www.codeplex.com/MPAPI) is a framework that enables programmers to easily write parallel as well as distributed software systems without having to use standard thread synchronization techniques like locks, monitors, semaphors, mutexes and volatile memory.

It is written in C\# and runs on Microsoft .NET 2.0 or newer, as well as Mono.NET 1.2.6.

-   Easy parallel programming through the use of message passing concurrency instead of the traditional shared state concurrency.
-   A few simple primitives to handle communication between - and control with - different threads.
-   Cluster computing made simple through the same primitives regardless of whether a thread runs locally or on a different machine. The framework simplifies the connection of computing nodes.
-   Cross-platform - the framework has been tested in a mixed environment with machines running Microsoft .NET 2.0, 3.0 and Mono.NET 1.2.6. The RemotingLite framework was written specifically to fascilitate the MPAPI frameworks need for service calls across networks, and was also specifically designed and written to run on Mono.NET.

A [paper describing MPAPI](http://sector0.dk/public_files/Introduction%20to%20Message%20Passing%20and%20the%20MPAPI%20Framework.pdf) goes into more details about it.

MPI.NET
-------

[MPI.NET](http://www.osl.iu.edu/research/mpi.net/software/) is a .NET library that enables the creation of high-performance parallel applications that can be deployed on multi-threaded workstations and Windows clusters. MPI.NET provides access to the [Message Passing Interface (MPI)](http://www-unix.mcs.anl.gov/mpi/) in C\# and all of the other .NET languages. MPI is a standard for message-passing programs that is widely implemented and used for high-performance parallel programs that execute on clusters and supercomputers.

CLI Parallel
------------

[cli-parallel](http://sourceforge.net/projects/cli-parallel) is an implementation of the ECMA System.Threading.Parallel specification.

RPC systems
===========

IIOP.NET
--------

[IIOP.NET](http://iiop-net.sourceforge.net/) is allows a seamless interoperation between .NET, CORBA and J2EE distributed objects. This is done by incorporating CORBA/IIOP support into .NET, leveraging the remoting framework.

Features:

-   Tight coupling between distributed objects in .NET, CORBA and J2EE; components on each platform can act in either client or server role.
-   Tranparency: existing servers can be used unmodified, without wrapping code or adapters.
-   Extensive coverage of CORBA/.NET type mappings.
-   Native integration in the .NET framework; IIOP.NET is directly based on the standard remoting infrastructure.

XML-RPC.NET
-----------

[XML-RPC.NET](http://www.xml-rpc.net/) is a library for implementing XML-RPC Services and clients in the .NET environment, supporting versions 1.0, 1.1, and 2.0 of the .NET runtime.

Features include:

-   Interface based definition of XML-RPC servers and clients
-   Code generation of type-safe client proxies
-   Support for .NET Remoting on both client and server
-   ASP.NET Web Services which support both XML-RPC and SOAP
-   Client support for asynchronous calls
-   Client support for various XML encodings and XML indentation styles (some other XML-RPC server implementations incorrectly only accept certain indentation styles)
-   Built-in support for XML-RPC Introspection API on server
-   Dynamic generation of documentation page at URL of XML-RPC end-point
-   Support for mapping XML-RPC method and struct member names to .NET-compatible names
-   Support for Unicode XML-RPC strings in both client and server
-   Support for optional struct members when mapping between .NET and XML-RPC types

The XML-RPC.NET library is CLS-compliant and so can be called from any CLS-compliant language, the main examples being C\# and VB.NET.

NauckIT.Remoting
----------------

[[2]](http://dev.nauck-it.de/projects/show/utilities) NauckIT.Remoting is a small helper library to setup .NET remoting and publish or consume remote objects.

* * * * *

System Programming
==================

Mono.Addins
-----------

[Mono.Addins]({{ site.github.url }}/old_site/Introduction_to_Mono.Addins "Introduction to Mono.Addins") is a generic framework for creating extensible applications, and for creating libraries which extend those applications.

This framework is derived from the add-in engine used by MonoDevelop, although it has been completely rewritten and improved in many ways to make it more generic and easier to use. The MonoDevelop add-in engine was an improvement over the SharpDevelop engine, which took many ideas from the Eclipse add-in engine.

Mono.Addins has been designed to be useful for a wide range of applications: from simple applications with small extensibility needs, to complex applications (such as MonoDevelop itself) which need support for large add-in structures.

Google's Diff-Match-Patch
-------------------------

The [Google Diff Match and Patch](http://code.google.com/p/google-diff-match-patch/) libraries offer robust algorithms to perform the operations required for synchronizing plain text.

-   Diff:
    -   Compare two blocks of plain text and efficiently return a list of differences.
-   Match:
    -   Given a search string, find its best fuzzy match in a block of plain text. Weighted for both accuracy and location.
-   Patch:
    -   Apply a list of patches onto plain text. Use best-effort to apply patch even when the underlying text doesn't match.

This library supports Mono and C\# and is also available in Java, JavaScript, C++ and Python. Regardless of language, each library features the same API and the same functionality. All versions also have comprehensive test harnesses.

Empinia
-------

[Empinia](http://www.empinia.org/) is an open source framework for developing .NET-based GUI applications. Its focus is on good software architecture and easy extensibility. Empinia has a plugin infrastructure that allows to extend as well as being extensible. The management of plugins is done completely by Empinia: detecting, providing and loading plugins. Plugins are wired together at extension points. Those points are described in XML files, so using them is fairly easy.

Cecil
-----

Cecil is a library under development to generate and inspect programs and libraries in the ECMA CIL format.

Read the [Cecil]({{ site.github.url }}/docs/tools+libraries/libraries/Mono.Cecil/) on this site for more information.

Mono.Reflection
---------------

[Mono.Reflection](http://github.com/jbevain/mono.reflection/) is a helper library to complement the System.Reflection and System.Reflection.Emit with useful extension methods and helpers, including a IL disassembler.

Bittorrent Libraries
--------------------

You can use [BitSharp]({{ site.github.url }}/old_site/MonoTorrent), the Bittorrent libraries created my Alan McGovern, available from our [SVN]({{ site.github.url }}/community/contributing/source-code-repository/) repository in the module "bitsharp".

Data Conversion
---------------

Mono provides [Mono DataConvert]({{ site.github.url }}/old_site/Mono_DataConvert "Mono DataConvert") as a replacement for [System.BitConverter](http://docs.go-mono.com/index.aspx?link=T:System.BitConverter) that is more versatile and does not have the design flaws in BitConverter

Curses
------

You can use Curses to build portable console-based applications.

[Curses\#](http://home.nedlinux.nl/~florian/downloads/) uses PDCurses on Windows and NCurses on Linux. It's almost crossplatform on an binary level.

[MonoCurses]({{ site.github.url }}/old_site/MonoCurses "MonoCurses") is an MIT-X11 licensed binding of curses, and it includes the minimalistic `gui.cs` GUI toolkit for creating console-based applications.

DBus
----

[DBusSharp](http://www.ndesk.org/DBusSharp) is an implementation for the DBus system bus API for managed applications.

D-Bus is an inter-process communication framework that lets applications interface with the system event bus as well as allowing them to talk to one another in a peer-to-peer configuration.

PEWRAPI
-------

[PEWRAPI](http://www.plas.fit.qut.edu.au/perwapi/Default.aspx) is a library for reading and producing CIL images, very much in the same spirit as our [Cecil]({{ site.github.url }}/docs/tools+libraries/libraries/Mono.Cecil/) library.

Indy.Sockets
------------

[Indy.Sockets](http://www.indyproject.org/Sockets/index.iwp) is an open source socket library that supports clients, servers, TCP, UDP, raw sockets, as well as over 100 higher level protocols such as SMTP, POP3, NNTP, HTTP, and many more. Indy.Sockets is available for C\#, C++, Delphi, Visual Basic.NET, any .NET language. This means that you can use it on Mono too!

Regular Expressions
-------------------

Mono comes with a pretty complete regular expression library, but ports of other engines are available as well:

[Deveel's Regex](http://sourceforge.net/projects/deveel-regex) is a library inspired by GNU Regex that has two major features:

-   Speeding up the performances for the compilation and iteration through multiple matches
-   Multiple syntaxes supported, from POSIX to Perl4, Perl5 and others.

Mono.Fuse
---------

[Mono.Fuse](http://www.jprl.com/Projects/mono-fuse.html) is a wrapper library over [FUSE](http://fuse.sourceforge.net/) which permits Inter-Process Communication through the filesystem. In short, you can write programs that can be mounted as if they were a filesystem, and interacted with from other programs using normal filesystem semantics.

NDesk.Options
-------------

[NDesk.Options](http://www.ndesk.org/Options) is a command line parsing library developed by Jonathan Pryor designed to be used with C\# 2 and C\# 3.

DotNetCli
---------

[DotNetCli](http://sourceforge.net/projects/dotnetcli/) is a a port of the Apache Commons Command Line Interface (CLI) library for parsing command line options and their arguments.

NauckIT.MicroKernel
-------------------

[[3]](http://dev.nauck-it.de/projects/show/microkernel) NauckIT.MicroKernel is a lightweight Inversion-of-Control C\# library for .NET 2.0 and Mono.

* * * * *

Database Abstraction
====================

NetDataObjects
--------------

[Net Data Objects](http://www.netdataobjects.de) is a development tool for Mono and .NET, which maps object oriented code to relational databases. This concept is called O/R Mapping (Object Relational Mapping).

NDO is able to automatically enhance the code, written and compiled with .NET and Mono The enhancement works completely transparent for the developer.

-   Developers save a lot of error prone code for data access.
-   Persistent classes in NDO work together with the NDO framework without writing any special code in the classes.
-   Object data is stored and retrieved automatically into and out of the database.
-   NDO generates new and can integrate existing databases.
-   The NDO Query Language is much easier to use than SQL and provides nearly the same abilities.
-   NDO Queries are checked by the C\#- or Visual Basic compiler, while spelling mistakes in SQL queries might cause program interrupts.
-   Developers benefit from the object oriented analysis, design, and coding methodologies.
-   Thus your systems show a better maintainability and extensibility.
-   With NDO switching to another database is easy. Develop an application with SQL Server\* today and use it with Oracle\* tomorrow.

You can read about how they ported NDO to work on Mono on their ["NDO runs under Mono"](http://www.netdataobjects.com/Portal/NDORunsUnderMono/tabid/94/Default.aspx) article.

CouchDB access
--------------

The [Divan](http://github.com/gokr/Divan/tree/master) library can be used to access CouchDB servers.

DB4O
----

[DB4O]({{ site.github.url }}/old_site/DB4O "DB4O") is a non-intrusive persistence system that stores any complex object with one single line of code. The class schema of your application classes is analysed and adjusted in real time when objects are stored. Object-oriented querying functionality is provided through Native Queries (NQ), the ability to query the database using .NET syntax and semantics (similar in concept to LINQ/DLINQ), Query by Example (QbE) and other APIs. High performance is achieved with indexed fields and by reducing database-file-internal redirections to the absolute minimum. db4o features ACID transactions, fast embedded single-user mode and multi-transactional Client/Server access, locally and through TCP, object-oriented replication, and the ObjectManager to browse database files.

For more information see the Mono's [DB4O]({{ site.github.url }}/old_site/DB4O "DB4O") page.

EntitySpaces
------------

[EntitySpaces](http://www.entityspaces.net/) is a persistence layer and business object system for the Microsoft .NET 2.0 and Mono.

It supports numerous backends for storage (MySQL, PostgreSQL, Microsoft SQL Server, SQL CE, Microsoft Access, Oracle, VistaDB).

VistaDB
-------

[VistaDB](http://www.vistadb.net/) is a fully managed and embeddable database for Mono and .NET. It is similar in spirit to Sqlite, but this is a commercial product and is entirely implemented in managed code.

Berkeley DB bindings
--------------------

Joshua Tauberer has authored a binding for Berkeley DB, its available [here](http://razor.occams.info/code/repo/?/semweb/src/BDB.cs)

* * * * *

Configuration and Logging
=========================

Nini
----

[Nini](http://nini.sourceforge.net/) is a .NET configuration library which provides with a tool that makes it easy to write highly configurable applications in a short amount of time.

Log4net
-------

Apache sponsored logging framework.

* * * * *

Domain Specific
===============

OpenDICOM.NET
-------------

The [openDICOM.NET](http://opendicom.sourceforge.net) project implements a new approach towards DICOM (Digital Imaging and Communications in Medicine) libraries. DICOM is a worldwide standard in Medical IT and is provided by the National Electrical Manufacturers Assocation (NEMA). This standard specifies the way medical images and meta data like study or patient related data is stored and communicated over different binary medias. Thus, DICOM is a binary protocol and format.

ExpertCoder
-----------

[ExpertCoder](http://expertcoder.sourceforge.net) is a toolkit for the .NET platform that supports the creation of code generators based on expert systems. It's not a generator of code generators, but rather a set of libraries useful to write generators.

nUML
----

[nUML](http://numl.sourceforge.net) is a library for manipulating [UML 2.0](http://www.uml.org/) models.

WbemSharp
---------

[wbemtools](http://code.google.com/p/wbemtools/) is a managed library to work with Web-Based Enterprise Management (WBEM).

PCSC-Sharp
----------

[pcsc-sharp](http://code.google.com/p/pcsc-sharp/): This is a set of libraries for accessing smartcards on Windows and Linux

* * * * *

C\# Bindings for Popular APIs
=============================

GimpSharp
---------

[GimpSharp](http://gimp-sharp.sourceforge.net/index.html) is an API wrapper around GIMP, written in C\#. However, it's not just a wrapper. It also adds a thin layer which adds C\# specific features, like iterating through a collection. An example of this is an iteration through the guides of an image.

GIMP\# also offers a base plug-in class which does the difficult stuff for you. Implementing a new plug-in is just a matter of overriding a few virtual methods. See the samples directory for examples of how to do this.

Subversion Sharp
----------------

SubversionSharp is a C\# wrapper that fully covers the client API of Subversion SCM. Easy access to the Subversion API is provided without any compromise on fonctionality. This library is the starting point to easily integrate Subversion repositories in any .NET managed software. These C\# bindings for Subversion has been written for portability and performances. This library is now available for both Mono/Linux and .NET/Windows environments.

[SubversionSharp HomePage](http://www.softec.st/en/OpenSource/ClrProjects/SubversionSharp/SubversionSharp.html)

Team Foundation for Mono
------------------------

[Team Foundation for Mono](http://code.google.com/p/tf4mono/) An implementation of the Team Foundation libraries and related client programs for the .Net platform. Team Foundation is a 'collection of collaborative technologies that support a team effort to deliver a product' from Microsoft that includes bug tracking, source control, and other capabilities.

This project focuses currently on the SCM related libraries and tools. It includes a fairly functional version of the TF client used to access the SCM capabilities of Team Foundation servers. In some respects, its usability exceeds that of the standard TF tool. It also includes some subcommands from the TF Power Tool, and leverages the Gnome Keyring when available.

For registered developers, CodePlex is a publicly accessible example of a Team Foundation server used to host open source projects.

Exiv2Sharp
----------

This poject, created by Stephane Delcroix during Novell's HackWeek III, is a managed binding of the popular exiv2 ([http://exiv2.org](http://exiv2.org)) metadata editor.

The code is available from Mono's [SVN]({{ site.github.url }}/community/contributing/source-code-repository/) repository and can be browsed [here](http://anonsvn.mono-project.com/viewvc/trunk/exiv2-sharp/).

* * * * *

Math
====

dnAnalytics
-----------

[dnAnalytics](http://dnanalytics.codeplex.com/) Numerical Library is a numerical library for the .NET Framework. The library is written in C\# and is available as a fully managed library, but also provides an interface to native BLAS and LAPACK libraries. The library is compatible with Mono and has been tested on Windows, and various Linux distributions. The current release includes matrix, vector and complex number classes, and support for basic linear algebra routines (such as LU, Cholesky, QR, Levinson, and SVD). We will be adding optimization, calculus, random number, statistical, option pricing, genetic programming, and neural network components in the future. The library is licensed under a BSD license.

Current features:

-   Fully managed mode.
-   Optional support for the native numerical libraries:
    -   Intel® Math Kernel Library (MKL)
    -   AMD Core Math Library (ACML)
    -   ATLAS and CLAPACK
-   Support for sparse matrices and vectors.
-   Dense and sparse solvers.
-   QR, LU, SVD, Cholesky, Levinson, and Symmetric Levinson decomposition classes.
-   Matrix IO classes that read and write matrices form/to Matrix Market and delimited files.
-   Complex and "special" math routines.
-   Overload mathematical operators to simplify complex expressions.
-   Runs under Microsoft® Windows and Linux.
-   Works with Mono.

* * * * *

Science
=======

MonoGIS
-------

[MonoGIS](http://www.monogis.org/) is a set of Geographic Information System (GIS) libraries.

* * * * *

Messaging
=========

MIME Email
----------

[SharpMimeTools](http://anmar.eu.org/projects/sharpmimetools/) is a parser for MIME messages.

agsXMPP SDK
-----------

[agsXMPP SDK](http://www.ag-software.de/index.php?page=agsxmpp-sdk) is a SDK for the eXtensible Messaging and Presence Protocol (XMPP) protocol written in managed C\# dedicated to .NET and Mono technologies. The SDK is released as open source under a dual licence.

This is a very complete XMPP stack for application developers.

Coversant's SoapBox Product Line
--------------------------------

Protocol: Jabber/XMPP

[Coversant](http://www.coversant.net/Products/SoapBoxPlatform/tabid/76/Default.aspx) has a series of products for doing messaging with Jabber and XMPP.

DotMSN
------

Protocol: MSN Network

[DotMSN](http://www.xihsolutions.net/dotmsn/) is an open-source stand-alone class library to provide connectivity with the MSN Messenger service. The library is built in C\# and can therefore be used by all languages the .NET environment supports. Because of a clean natural Object-Oriented approach the library is easy to use and implement. DotMSN is designed to be a flexible, robust and lightweight enhancement to any application. Applications of DotMSN vary from creating messaging robots to creating custom clients.

SmartIrc4net
------------

Protocol: IRC

[SmartIrc4net](http://smartirc4net.meebey.net/) is an multi-layered IRC library written in C\#.

* * * * *

Public Services
===============

GoogleSharp and PicassaSharp
----------------------------

These modules created by Gonzalo Paniagua live in Mono's SVN repository and are used to provide applications with authentication facilities to a Google account (GoogleSharp) and access to the Picassa features for exporting, listing and accessing albums.

The code is available from Mono's [SVN]({{ site.github.url }}/community/contributing/source-code-repository/) repository and can be browsed [here](http://anonsvn.mono-project.com/viewvc/trunk/google-sharp/src/).

FacebookSharp
-------------

This library lets you access the Facebook Platform services from within a Mono/.NET application or an ASP.NET web application.

The code is available from Mono's [SVN]({{ site.github.url }}/community/contributing/source-code-repository/) repository and can be browsed [here](http://anonsvn.mono-project.com/viewvc/trunk/facebook-sharp/).

SmugMugSharp
------------

A library created by Thomas Van Machelen provides an API for managing pictures collections at the [SmugMug](http://www.smugmug.com/) photo-sharing site.

The code is available from Mono's [SVN]({{ site.github.url }}/community/contributing/source-code-repository/) repository and can be browsed and downloaded [here](http://anonsvn.mono-project.com/viewvc/trunk/smugmug-sharp/)

FlickrNet
---------

[FlickrNet](http://www.codeplex.com/Wiki/View.aspx?ProjectName=FlickrNet) is a library for accessing the [Flickr](http://www.flickr.com) photo-sharing site.

The code is available from [the CodePlex](http://www.codeplex.com/FlickrNet/SourceControl/ListDownloadableCommits.aspx).

UpcomingSharp
-------------

[UpcomingSharp](http://anonsvn.mono-project.com/viewvc/trunk/upcoming-sharp/) is a .NET library that lets you log in to upcoming.org and perform several actions like getting your watchlist, adding and editing events, querying venue information,...

* * * * *

Document Handling
=================

PDFJet
------

[PDFJet](http://pdfjet.com/) is a library for dynamic generation of PDF documents for .NET. There are both commercial and open source versions of it, the open source edition can be downloaded from [OpenSource Edition](http://pdfjet.com/os/edition.html).

OpenDocument4All
----------------

[OpenDocument4All](http://www.opendocument4all.com/) offers libraries and components to develop Mono-based applications to interop with the OpenDocument standard.

FileHelpers
-----------

[FileHelpers](http://www.filehelpers.com/) The FileHelpers are a free and easy to use .NET library to import/export data from fixed length or delimited records in files, strings or streams.

The Library also has support for import/export data from differents storages like Excel, Access, SqlServer, etc.

