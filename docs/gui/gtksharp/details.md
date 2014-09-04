---
title: GtkSharpDetails
redirect_from:
  - /GtkSharpDetails/
---

Gtk# 2.0 has been released.

For a list of the new features see [Whats new on Gtk# 2](/docs/gui/gtksharp/new-in-version-2x/) page, for a list of upcoming features see [GtkSharpPlan](/docs/gui/gtksharp/plan/).

Introduction
------------

[![](/archived/images/5/57/IFolder_Linux.png)](/archived/images/5/57/IFolder_Linux.png)

iFolder, a [GTK#](/docs/gui/gtksharp/) application

Gtk#, a [GUI Toolkit](/docs/gui/gui-toolkits/), is a set of .NET bindings for the [gtk+](http://www.gtk.org/) toolkit and assorted [GNOME](http://www.gnome.org/) libraries. This library allows you to build fully native graphical Gnome application using Mono. GTK# is an event-driven system like any other modern windowing library. Every widget in an application has handler methods that get called when particular events happen.

Applications built using Gtk# will run on many platforms including Linux, Windows and MacOS X. Gtk is the native toolkit for the Linux desktop running GNOME, so applications will look and function best on here. The Mono packages for Windows include Gtk, Gtk# and the native theme to make your applications look like native Windows applications. At this point, running Gtk# applications on MacOS requires the user to run the X11 server.

You can use [Glade](http://glade.gnome.org/) along with the Glade# bindings to easily design GUI applications. A new GUI designer called [Stetic](/archived/stetic "Stetic") is being built which will be integrated with the MonoDevelop IDE.

In addition to support the standard Gtk/Gnome stack of development tools, the gtk-dotnet.dll assembly provides a bridge to consume functionality available on the .NET stack, at this point this includes the functionality to use System.Drawing to draw on a widget.

See the sample in gtk-sharp/samples/DrawingSample.cs for details.

Availability
------------

Gtk# is available for both Unix and Windows.

-   For Unix, go [Downloads](/download/).
-   For Windows go [here](http://forge.novell.com/modules/xfmod/project/?gtks-inst4win).

Tutorials
---------

### Beginning to use Gtk\#

-   [Beginners Guide to Gtk#](/docs/gui/gtksharp/beginners-guide/)
    -   An overview of Gtk# and step-by-step description of a simple application.
-   [Gtk# "Hello World" in C# and VB.NET](/docs/gui/gtksharp/hello-world/)
    -   A short 'Hello World' style introduction to Gtk#
-   [Gtk# in MonoDevelop](http://www.monodevelop.com/Stetic_GUI_Designer)
    -   Creating a Gtk# application with [Monodevelop's](http://www.monodevelop.com/Main_Page) GUI designer, Stetic.

### Gtk# GUI details and techniques

-   [Overview of the widgets used in Gtk#](/docs/gui/gtksharp/widgets/widget-overview/)
-   [Widget Layout and Packing](/docs/gui/gtksharp/widgets/widget-layout-and-packing/)
-   [Creating Responsive GUI applications with Gtk#](/docs/gui/gtksharp/responsive-applications/)
-   [Creating Notification Icons](/docs/gui/gtksharp/widgets/notification-icon/)
-   [Gtk# used as a Web Service Interface](/archived/webservices_and_gtksharp "Webservices and GtkSharp")
-   [Gtk# example used to access GConf settings](/archived/gconftutorial "GConfTutorial")

### Advanced Gtk\#

-   [Generating bindings to GLib/gobject libraries](/docs/gui/gtksharp/gapi/)
-   [Quick guide to using Pango#](/archived/pangobeginners "Pango:Beginners")
-   [Gtk# TreeView Tutorial](/docs/gui/gtksharp/widgets/treeview-tutorial/)
    -   [Gtk# NodeView: A Convenience API to TreeView](/docs/gui/gtksharp/widgets/nodeview-tutorial/)
    -   [Example Programs from the Gtk# NodeView Tutorial](/docs/gui/gtksharp/widgets/nodeview-tutorial-examples/)
-   [Implementing GInterfaces in Gtk#](/docs/gui/gtksharp/implementing-ginterfaces/)

### Extending your GUI

**Internationalization**

-   [Using Mono.Unix](/archived/internationalization)

**Accessibility**

-   Cross platform

Other Gtk# Tutorials
---------------------

-   Video demonstrating how to create a "Hello World" application using Gtk# and glade

[http://nat.org/demos/gtksharp.html](http://nat.org/demos/gtksharp.html)

-   Creating your first "hello world" Gtk# application using MonoDevelop

[http://www.monodevelop.com/tutorials/helloworld.aspx](http://www.monodevelop.com/tutorials/helloworld.aspx)

-   An old collection of documentation for Gtk#, it would be great if someone could go through this and insert it all into the wiki

[http://www.gotmono.com/docs/gnome/bindings/gtk-sharp/gtk-sharp.html](http://www.gotmono.com/docs/gnome/bindings/gtk-sharp/gtk-sharp.html)

-   How to build a Gtk# application in Windows using glade and Visual Studio.Net 2003

[http://www.mfconsulting.com/tutorial/newgladeapp/](http://www.mfconsulting.com/tutorial/newgladeapp/)

User Testimonials
-----------------

User testimonials indicate that Gtk# provides developers with great productivity for building graphical applications especially when compared to GTK+ or Java Swing : *"Gtk# and Mono have proven to be an outstanding combination for delivering rich client applications to the Linux desktop...Gtk# and Mono's tight integration with the GNOME/Ximian desktop enables us to deliver desktop plugins written entirely in managed code. Today, this level of integration is not possible on Windows with .NET and Windows Forms."* says Brady Anderson from the [iFolder](http://www.ifolder.com) project.

Additional Widgets
------------------

The following is a list of additional widgets (known as "controls" in Windows) that people have written to extend Gtk#:

-   [NPlot 0.9.8.5 for Gtk#](http://primates.ximian.com/~miguel/tmp/NPlot-Gtk-0.9.8.5.tar.gz) - A Free Graph / Chart Library for .NET (Original version: [here](http://netcontrols.org/nplot/)).
-   [DiaCanvas#](http://diacanvas.sourceforge.net/csharp.php) - Create and display diagrams and flowcharts
-   [GtkGL#](http://www.olympum.com/~bruno/gtkgl-sharp.html) - OpenGL and Gtk# integration. Not maintained.
-   [GtkGLAreaSharp](/archived/gtkglareasharp "GtkGLAreaSharp") - OpenGL widget, based on the [GtkGLArea](/archived/gtkglarea "GtkGLArea") widget. Currently maintained by CJCollier.

#### Gnome-KeyRing-Sharp

This library provides access to the Gnome Keyring for managed applications.

Availability: [GitHub](http://www.github.com/mono/gnome-keyring-sharp), [Web](http://www.go-mono.com/archive/gnome-keyring-sharp/)

#### GSF Sharp

This library provides access to reading and writing structured files (OLE files), this depends on the libgsf library from the GNOME project:

Availability: [Web](https://github.com/mono/gsf-sharp/) [snapshot](https://github.com/mono/gsf-sharp/archive/master.zip)

#### GtkGlArea Sharp

A binding for GtkGlArea, a widget that can host an OpenGL context in your Gtk# application.

Availability: [Web](https://github.com/mono/gtkglarea-sharp/) [snapshot](https://github.com/mono/gtkglarea-sharp/archive/master.zip)

#### WebKit Sharp

webkit-sharp provides access to [WebKit](http://live.gnome.org/WebKitGtk), a fast, high-quality web browser engine suited for embedding in GTK+ applications. It features bleeding-edge HTML5, AJAX, SVG and JavaScript capabilities with seamless UI integration.

Availability: [Web](https://github.com/mono/webkit-sharp/) [snapshot](https://github.com/mono/webkit-sharp/archive/master.zip)

#### GtkMozEmbed Sharp

This library provides access to the Mozilla rendering engine with Gtk+ using the GtkMozEmbed widget:

Availability: [Web](https://github.com/mono/gtkmozembed-sharp/) [snapshot](https://github.com/mono/gtkmozembed-sharp/archive/master.zip)

#### GtkSourceView Sharp

Bindings to the GtkSourceView widget, this widget is typically used for writing programmer editors.

Availability: [Web](https://github.com/mono/gtksourceview-sharp/) [snapshot](https://github.com/mono/gtksourceview-sharp/archive/master.zip)

#### Hal Sharp

This library provides access to the Hardware Abstraction Layer (HAL) from FreeDesktop.

This is used when you need to interact with the hardware. For example Banshee uses this to detect new media (reading and burning).

Availability: [Web](https://github.com/mono/hal-sharp/) [snapshot](https://github.com/mono/hal-sharp/archive/master.zip).

#### DBus Sharp

DBus Sharp is an implementation of the DBus protocol for managed languages. DBus allows applications on the Unix desktop to communicate with each others and is part of the FreeDesktop effort.

Availability: [Web](http://www.ndesk.org/DBusSharp) [downloads](http://www.ndesk.org/archive/dbus-sharp/)

#### ipod sharp

ipod-sharp is a library that allows manipulation of the iTunesDB used in Apple iPod devices. Currently it supports adding/removing songs and manipulating playlists.

Availability: [Web](https://github.com/mono/ipod-sharp/) [snapshot](https://github.com/mono/ipod-sharp/archive/master.zip).

#### Maemo Sharp

Maemo# is a Gtk# bindings for Maemo libraries.

Availability: [Web](https://github.com/mono/maemo-sharp/) [snapshot](https://github.com/mono/maemo-sharp/archive/master.zip)

#### JScall Sharp

JSCall is a simple JavaScript bridge for Gecko#. It's an interim solution until someone writes a proper XPCOM bridge for Mono, and uses unmanaged code and P/Invoke to invoke Gecko's XPCOM components from managed code. It should work with any .NET language, but I've referred to C# for simplicity. I don't expect many people to use this, so the documentation is little more than minimal; lease contact me \<m.j.hutchinson@gmail.com\> if you need help working out how it works.

Availability: [Web](https://github.com/mono/jscall-sharp/) [snapshot](https://github.com/mono/jscall-sharp/archive/master.zip)

#### NPlot Gtk

The first version of NPlot-Gtk was made by Miguel de Icaza, and was a wrapper of NPlot 0.9.8.5.

Now the wrapper of version 0.9.9.2 has just an NPlot upgrade and a few hacks over the work of Miguel (Carlos)

This version of NPlot has been extended to support Gtk# on Linux.

The version is based on NPlot 0.9.9.2 Availability: [Web](https://github.com/mono/nplot-gtk/) [snapshot](https://github.com/mono/nplot-gtk/archive/master.zip).

#### Taglib Sharp

[TagLibSharp](http://developer.novell.com/wiki/index.php/TagLib_Sharp) is a free and Open Source library for the .NET 2.0 and Mono frameworks which will let you do what you want to do.

It supports a large variety of movie and music formats which abstract away the work, handling all the different cases, so all you have to do is access file.Tag.Title, file.Tag.Lyrics, or my personal favorite file.Tag.Pictures.

A library for reading and writing metadata from audio files.

Availability: [Web](http://developer.novell.com/wiki/index.php/TagLib_Sharp) [snapshot](https://github.com/mono/taglib-sharp/archive/master.zip).

#### Daap Sharp

daap-sharp is a DAAP (Digial Audio Access Protocol) implementation. It is used by Apple's iTunes software to share music.

Availability: [Web](https://github.com/mono/daap-sharp/) [snapshot](https://github.com/mono/daap-sharp/archive/master.zip).

#### Mono.ZeroConf

Supports the ZeroConf/Bonjour protocol using mdnsdresponder or Avahi.

Availability: [Web](https://github.com/mono/Mono.Zeroconf/) [snapshot](https://github.com/mono/Mono.Zeroconf/archive/master.zip).

If you know of anything else that should be added to this page, let someone in #mono know.

Gtk#'s Components
------------------

**Gtk# Components**
Gtk# is composed of three modules: gtk-sharp, gnome-sharp, and gnome-desktop-sharp.

**Module:**

***gtk-sharp***

[glib-sharp](http://docs.go-mono.com/index.aspx?link=N:GLib)

Portions of the glib 2.x libraries which provide a low-level non-GUI core library for gtk+.

[pango-sharp](http://docs.go-mono.com/index.aspx?link=N:Pango)

The [Pango](http://www.pango.org) international text layout and rendering library.

[atk-sharp](http://docs.go-mono.com/index.aspx?link=N:Atk)

The atk Accessibility framework.

[gdk-sharp](http://docs.go-mono.com/index.aspx?link=N:Gdk)

Drawing Kit using by gtk+.

[gtk-sharp](http://docs.go-mono.com/index.aspx?link=N:Gtk)

The Gtk 2.x toolkit, a cross-platform toolkit for creating graphical user interfaces

[glade-sharp](http://docs.go-mono.com/index.aspx?link=N:Glade)

Supports dynamic loading of [Glade](http://glade.gnome.org) interface builder files.

[gtk-dotnet](http://docs.go-mono.com/index.aspx?link=N:Gtk.DotNet)

Integration of the Gtk# namespace with System.Drawing.

**Module:**

***gnome-sharp***

[art-sharp](http://docs.go-mono.com/index.aspx?link=N:Art)

A vector and rendering library.

[gnome-sharp](http://docs.go-mono.com/index.aspx?link=N:Gnome)**\***

[GNOME](http://www.gnome.org) program initialization, printing, panel access, and assorted widgets.

[gnomevfs-sharp](http://docs.go-mono.com/index.aspx?link=N:GnomeVfs)**\***

File, MIME type, icon, and various GNOME file system interaction functionality.

[gconf-sharp](http://docs.go-mono.com/index.aspx?link=N:GConf)**\***

Configuration storage system on Gnome

**Module:**

***gnome-desktop-sharp***

[gtkhtml-sharp](http://docs.go-mono.com/index.aspx?link=T:Gtk.HTML)**\***

A lightweight HTML widget.

gtksourceview2-sharp**\***

A source code editing and viewing widget library.

nautilusburn-sharp**\***

GNOME CD/DVD burning library.

[rsvg-sharp](http://docs.go-mono.com/index.aspx?link=N:Rsvg)

SVG rendering library.

[vte-sharp](http://docs.go-mono.com/index.aspx?link=N:Vte)**\***

The VTE terminal emulator.

wnck-sharp**\***

Window navigator construction kit library.

**\*** *Not not available on the Windows GTK# package*

Versions & Status
-----------------

You might want to [subscribe](http://lists.ximian.com/mailman/listinfo/gtk-sharp-list)to gtk-sharp-list@ximian.com for status updates and general discussion.

The [Gtk# project](http://gtk-sharp.sourceforge.net) is closely associated with the Mono project.  Development is proceeding in the [Mono git](/community/contributing/source-code-repository/) repository.  The git repository can be browsed [on the web.](https://github.com/mono)

-   **Gtk# 2.4** This is the current versions of Gtk# and they bind Gtk+ 2.4 and the GNOME 2.10 platform.

-   **Gtk# 1.0.x**: this is the old version of Gtk# and it binds the GNOME 2.2 platform.
    -   git branch name: [gtk-sharp-1-0-branch](https://github.com/mono/gtk-sharp/tree/gtk-sharp-1-0-branch)

For more details about the versions and future plans see: [GtkSharpPlan](/docs/gui/gtksharp/plan/).

Development is occuring on git master at: [gtk-sharp](https://github.com/mono/gtk-sharp/)

Migrating from 1.x to 2.x
-------------------------

See our page on [upgrading your Gtk# application](/docs/gui/gtksharp/upgrade/)

Future Directions
-----------------

We are keeping track of various ideas for Gtk# on the [GtkSharpIdeas](/docs/gui/gtksharp/ideas/) page

Additional Resources
--------------------

For specific examples on GTK widgets, and other Gtk related topics, click on the GtkSharp category at the bottom of this page.

