---
layout: obsolete
title: "GtkSharpDetails"
permalink: /old_site/GtkSharpDetails/
redirect_from:
  - /GtkSharpDetails/
---

GtkSharpDetails
===============

Gtk\# 2.0 has been released.

For a list of the new features see [Whats new on Gtk\# 2]({{site.github.url}}/old_site/GtkSharpNewInVersion2x "GtkSharpNewInVersion2x") page, for a list of upcoming features see [GtkSharpPlan]({{site.github.url}}/old_site/GtkSharpPlan "GtkSharpPlan").

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#introduction">1 Introduction</a></li>
<li><a href="#availability">2 Availability</a></li>
<li><a href="#tutorials">3 Tutorials</a>
<ul>
<li><a href="#beginning-to-use-gtk">3.1 Beginning to use Gtk#</a></li>
<li><a href="#gtk-gui-details-and-techniques">3.2 Gtk# GUI details and techniques</a></li>
<li><a href="#advanced-gtk">3.3 Advanced Gtk#</a></li>
<li><a href="#extending-your-gui">3.4 Extending your GUI</a></li>
</ul></li>
<li><a href="#other-gtk-tutorials">4 Other Gtk# Tutorials</a></li>
<li><a href="#user-testimonials">5 User Testimonials</a></li>
<li><a href="#additional-widgets">6 Additional Widgets</a>
<ul>
<li><a href="#gnome-keyring-sharp">6.1 Gnome-KeyRing-Sharp</a></li>
<li><a href="#gsf-sharp">6.2 GSF Sharp</a></li>
<li><a href="#gtkglarea-sharp">6.3 GtkGlArea Sharp</a></li>
<li><a href="#webkit-sharp">6.4 WebKit Sharp</a></li>
<li><a href="#gtkmozembed-sharp">6.5 GtkMozEmbed Sharp</a></li>
<li><a href="#gtksourceview-sharp">6.6 GtkSourceView Sharp</a></li>
<li><a href="#hal-sharp">6.7 Hal Sharp</a></li>
<li><a href="#dbus-sharp">6.8 DBus Sharp</a></li>
<li><a href="#ipod-sharp">6.9 ipod sharp</a></li>
<li><a href="#maemo-sharp">6.10 Maemo Sharp</a></li>
<li><a href="#jscall-sharp">6.11 JScall Sharp</a></li>
<li><a href="#nplot-gtk">6.12 NPlot Gtk</a></li>
<li><a href="#taglib-sharp">6.13 Taglib Sharp</a></li>
<li><a href="#daap-sharp">6.14 Daap Sharp</a></li>
<li><a href="#monozeroconf">6.15 Mono.ZeroConf</a></li>
</ul></li>
<li><a href="#gtks-components">7 Gtk#'s Components</a></li>
<li><a href="#versions--status">8 Versions &amp; Status</a></li>
<li><a href="#migrating-from-1x-to-2x">9 Migrating from 1.x to 2.x</a></li>
<li><a href="#future-directions">10 Future Directions</a></li>
<li><a href="#additional-resources">11 Additional Resources</a></li>
</ul></td>
</tr>
</tbody>
</table>

Introduction
------------

[![]({{site.github.url}}/old_site/images/5/57/IFolder_Linux.png)]({{site.github.url}}/old_site/images/5/57/IFolder_Linux.png)

[![](/skins/common/images/magnify-clip.png)]({{site.github.url}}/old_site/images/5/57/IFolder_Linux.png "Enlarge")

iFolder, a [GTK\#]({{site.github.url}}/old_site/GtkSharp "GtkSharp") application

Gtk\#, a [GUI Toolkit]({{site.github.url}}/old_site/Gui_Toolkits "Gui Toolkits"), is a set of .NET bindings for the [gtk+](http://www.gtk.org/) toolkit and assorted [GNOME](http://www.gnome.org/) libraries. This library allows you to build fully native graphical Gnome application using Mono. GTK\# is an event-driven system like any other modern windowing library. Every widget in an application has handler methods that get called when particular events happen.

Applications built using Gtk\# will run on many platforms including Linux, Windows and MacOS X. Gtk is the native toolkit for the Linux desktop running GNOME, so applications will look and function best on here. The Mono packages for Windows include Gtk, Gtk\# and the native theme to make your applications look like native Windows applications. At this point, running Gtk\# applications on MacOS requires the user to run the X11 server.

You can use [Glade](http://glade.gnome.org/) along with the Glade\# bindings to easily design GUI applications. A new GUI designer called [Stetic]({{site.github.url}}/old_site/Stetic "Stetic") is being built which will be integrated with the MonoDevelop IDE.

In addition to support the standard Gtk/Gnome stack of development tools, the gtk-dotnet.dll assembly provides a bridge to consume functionality available on the .NET stack, at this point this includes the functionality to use System.Drawing to draw on a widget.

See the sample in gtk-sharp/samples/DrawingSample.cs for details.

Availability
------------

Gtk\# is available for both Unix and Windows.

-   For Unix, go [Downloads]({{site.github.url}}/old_site/Downloads "Downloads").
-   For Windows go [here](http://forge.novell.com/modules/xfmod/project/?gtks-inst4win).

Tutorials
---------

### Beginning to use Gtk\#

-   [Beginners Guide to Gtk\#]({{site.github.url}}/old_site/GtkSharpBeginnersGuide "GtkSharpBeginnersGuide")
    -   An overview of Gtk\# and step-by-step description of a simple application.
-   [Gtk\# "Hello World" in C\# and VB.NET]({{site.github.url}}/old_site/GtkSharp:_Hello_World "GtkSharp: Hello World")
    -   A short 'Hello World' style introduction to Gtk\#
-   [Gtk\# in MonoDevelop](http://www.monodevelop.com/Stetic_GUI_Designer)
    -   Creating a Gtk\# application with [Monodevelop's](http://www.monodevelop.com/Main_Page) GUI designer, Stetic.

### Gtk\# GUI details and techniques

-   [Overview of the widgets used in Gtk\#]({{site.github.url}}/old_site/GtkSharp:_Widget_Overview "GtkSharp: Widget Overview")
-   [Widget Layout and Packing]({{site.github.url}}/old_site/GtkSharp:_Widget_Layout_and_Packing "GtkSharp: Widget Layout and Packing")
-   [Creating Responsive GUI applications with Gtk\#]({{site.github.url}}/old_site/Responsive_Applications "Responsive Applications")
-   [Creating Notification Icons]({{site.github.url}}/old_site/GtkSharpNotificationIcon "GtkSharpNotificationIcon")
-   [Gtk\# used as a Web Service Interface]({{site.github.url}}/old_site/Webservices_and_GtkSharp "Webservices and GtkSharp")
-   [Gtk\# example used to access GConf settings]({{site.github.url}}/old_site/GConfTutorial "GConfTutorial")

### Advanced Gtk\#

-   [Generating bindings to GLib/gobject libraries]({{site.github.url}}/old_site/GAPI "GAPI")
-   [Quick guide to using Pango\#]({{site.github.url}}/old_site/Pango:Beginners "Pango:Beginners")
-   [Gtk\# TreeView Tutorial]({{site.github.url}}/old_site/GtkSharp_TreeView_Tutorial "GtkSharp TreeView Tutorial")
    -   [Gtk\# NodeView: A Convenience API to TreeView]({{site.github.url}}/old_site/GtkSharpNodeViewTutorial "GtkSharpNodeViewTutorial")
    -   [Example Programs from the Gtk\# NodeView Tutorial]({{site.github.url}}/old_site/GtkSharpNodeViewTutorialExamples "GtkSharpNodeViewTutorialExamples")
-   [Implementing GInterfaces in Gtk\#]({{site.github.url}}/old_site/ImplementingGInterfaces "ImplementingGInterfaces")

### Extending your GUI

**Internationalization**

-   [Using Mono.Unix]({{site.github.url}}/old_site/Internationalization)

**Accessibility**

-   Cross platform

Other Gtk\# Tutorials
---------------------

-   Video demonstrating how to create a "Hello World" application using Gtk\# and glade

[http://nat.org/demos/gtksharp.html](http://nat.org/demos/gtksharp.html)

-   Creating your first "hello world" Gtk\# application using MonoDevelop

[http://www.monodevelop.com/tutorials/helloworld.aspx](http://www.monodevelop.com/tutorials/helloworld.aspx)

-   An old collection of documentation for Gtk\#, it would be great if someone could go through this and insert it all into the wiki

[http://www.gotmono.com/docs/gnome/bindings/gtk-sharp/gtk-sharp.html](http://www.gotmono.com/docs/gnome/bindings/gtk-sharp/gtk-sharp.html)

-   How to build a Gtk\# application in Windows using glade and Visual Studio.Net 2003

[http://www.mfconsulting.com/tutorial/newgladeapp/](http://www.mfconsulting.com/tutorial/newgladeapp/)

User Testimonials
-----------------

User testimonials indicate that Gtk\# provides developers with great productivity for building graphical applications especially when compared to GTK+ or Java Swing : *"Gtk\# and Mono have proven to be an outstanding combination for delivering rich client applications to the Linux desktop...Gtk\# and Mono's tight integration with the GNOME/Ximian desktop enables us to deliver desktop plugins written entirely in managed code. Today, this level of integration is not possible on Windows with .NET and Windows Forms."* says Brady Anderson from the [iFolder](http://www.ifolder.com) project.

Additional Widgets
------------------

The following is a list of additional widgets (known as "controls" in Windows) that people have written to extend Gtk\#:

-   [NPlot 0.9.8.5 for Gtk\#](http://primates.ximian.com/~miguel/tmp/NPlot-Gtk-0.9.8.5.tar.gz) - A Free Graph / Chart Library for .NET (Original version: [here](http://netcontrols.org/nplot/)).
-   [DiaCanvas\#](http://diacanvas.sourceforge.net/csharp.php) - Create and display diagrams and flowcharts
-   [GtkGL\#](http://www.olympum.com/~bruno/gtkgl-sharp.html) - OpenGL and Gtk\# integration. Not maintained.
-   [GtkGLAreaSharp]({{site.github.url}}/old_site/GtkGLAreaSharp "GtkGLAreaSharp") - OpenGL widget, based on the [GtkGLArea]({{site.github.url}}/old_site/GtkGLArea "GtkGLArea") widget. Currently maintained by [User:CJCollier]({{site.github.url}}/old_site/User:CJCollier "User:CJCollier")

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

If you know of anything else that should be added to this page, let someone in \#mono know.

Gtk\#'s Components
------------------

**Gtk\# Components**
Gtk\# is composed of three modules: gtk-sharp, gnome-sharp, and gnome-desktop-sharp.

**Module:**

***gtk-sharp***

[glib-sharp]({{site.github.url}}/monodoc/N:Glib)

Portions of the glib 2.x libraries which provide a low-level non-GUI core library for gtk+.

[pango-sharp]({{site.github.url}}/monodoc/N:Pango)

The [Pango](http://www.pango.org) international text layout and rendering library.

[atk-sharp]({{site.github.url}}/monodoc/N:Atk)

The atk Accessibility framework.

[gdk-sharp]({{site.github.url}}/monodoc/N:Gdk)

Drawing Kit using by gtk+.

[gtk-sharp]({{site.github.url}}/monodoc/N:Gtk)

The Gtk 2.x toolkit, a cross-platform toolkit for creating graphical user interfaces

[glade-sharp]({{site.github.url}}/monodoc/N:Glade)

Supports dynamic loading of [Glade](http://glade.gnome.org) interface builder files.

[gtk-dotnet]({{site.github.url}}/monodoc/N:Gtk.DotNet)

Integration of the Gtk\# namespace with System.Drawing.

**Module:**

***gnome-sharp***

[art-sharp]({{site.github.url}}/monodoc/N:Art)

A vector and rendering library.

[gnome-sharp]({{site.github.url}}/monodoc/N:Gnome)**\***

[GNOME](http://www.gnome.org) program initialization, printing, panel access, and assorted widgets.

[gnomevfs-sharp]({{site.github.url}}/monodoc/N:GnomeVfs)**\***

File, MIME type, icon, and various GNOME file system interaction functionality.

[gconf-sharp]({{site.github.url}}/monodoc/N:GConf)**\***

Configuration storage system on Gnome

**Module:**

***gnome-desktop-sharp***

[gtkhtml-sharp]({{site.github.url}}/monodoc/T:Gtk.HTML)**\***

A lightweight HTML widget.

gtksourceview2-sharp**\***

A source code editing and viewing widget library.

nautilusburn-sharp**\***

GNOME CD/DVD burning library.

[rsvg-sharp]({{site.github.url}}/monodoc/N:Rsvg)

SVG rendering library.

[vte-sharp]({{site.github.url}}/monodoc/N:Vte)**\***

The VTE terminal emulator.

wnck-sharp**\***

Window navigator construction kit library.

**\*** *Not not available on the Windows GTK\# package*

Versions & Status
-----------------

You might want to [subscribe](http://lists.ximian.com/mailman/listinfo/gtk-sharp-list)to gtk-sharp-list@ximian.com for status updates and general discussion.

The [Gtk\# project](http://gtk-sharp.sourceforge.net) is closely associated with the Mono project.  Development is proceeding in the [Mono SVN]({{site.github.url}}/old_site/SourceCodeRepository) repository.  The SVN Repository can be browsed [on the web.](http://anonsvn.mono-project.com/)

-   **Gtk\# 2.4** This is the current versions of Gtk\# and they bind Gtk+ 2.4 and the GNOME 2.10 platform.

-   **Gtk\# 1.0.x**: this is the old version of Gtk\# and it binds the GNOME 2.2 platform.
    -   SVN branch name: [source/branches/gtk-sharp-1-0-branch/gtk-sharp](http://anonsvn.mono-project.com/viewvc/branches/gtk-sharp-1-0-branch/gtk-sharp/)

For more details about the versions and future plans see: [GtkSharpPlan]({{site.github.url}}/old_site/GtkSharpPlan "GtkSharpPlan").

Development is occuring on svn trunk at: [source/trunk/gtk-sharp](http://anonsvn.mono-project.com/viewvc/trunk/gtk-sharp/)

Migrating from 1.x to 2.x
-------------------------

See our page on [upgrading your Gtk\# application]({{site.github.url}}/old_site/GtkSharpUpgrade "GtkSharpUpgrade")

Future Directions
-----------------

We are keeping track of various ideas for Gtk\# on the [GtkSharpIdeas]({{site.github.url}}/old_site/GtkSharpIdeas "GtkSharpIdeas") page

A place to track how [Gtk+ can be improved on Windows]({{site.github.url}}/old_site/ImprovingGtkWin32 "ImprovingGtkWin32").

Additional Resources
--------------------

For specific examples on GTK widgets, and other Gtk related topics, click on the GtkSharp category at the bottom of this page.

