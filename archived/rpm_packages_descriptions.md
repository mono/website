---
title: "RPM Packages Descriptions"
lastmodified: '2007-03-12'
redirect_from:
  - /RPM_Packages_Descriptions/
---

RPM Packages Descriptions
=========================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#mono-11">1 Mono 1.1</a></li>
<li><a href="#xspmod_mono">2 XSP/mod_mono</a></li>
<li><a href="#gtk-1x">3 Gtk# 1.x</a></li>
<li><a href="#development-tools">4 Development Tools</a></li>
<li><a href="#gtk-2x">5 Gtk# 2.x</a></li>
</ul></td>
</tr>
</tbody>
</table>

Mono 1.1
--------

-   mono-complete -- All Mono runtime packages (virtual)

This is a virtual package which depends on all the packages that constitute the Mono runtime, core libraries and command-line tools.

-   mono-core -- The Mono CIL runtime, suitable for running .NET code

This package contains the core of the Mono runtime including its Virtual Machine, Just-in-time compiler, C# compiler, security tools and libraries (corlib, XML, System.Security, System.Drawing, ZipLib, I18N, Cairo and Mono.\*)

-   mono-devel -- Development tools and headers for Mono

This package includes all Mono library headers and completes the Mono developer toolchain (with the mono profiler, assembler and other various tools)

-   mono-extras -- Provides the infrastructure for running and building daemons and services with Mono as well as various stub assemblies

This package provides the libary and application to run services and daemons with Mono. It also includes stubs for the following .NET 1.1 and 2.0 assemblies:

       * Microsoft.Vsa
       * System.Configuration.Install
       * System.Management.dll
       * System.Messaging.dll

-   mono-data -- Database connectivity for Mono

This package provides a Mono assembly to facilitate data access and manipulation with databases, LDAP compatible directory servers and/or XML data exchange. Beyond the ADO.NET, Novell.LDAP and System.DirectoryServices assemblies, it also includes a command line sql application as well as the Microsoft SQL Server and ODBC data providers.

-   bytefx-data-mysql -- MySQL database connectivity for Mono

This package contains the ADO.NET Data provider for MySQL. This is no longer maintained. MySQL AB now provides MySQL Connector/Net which is fully managed and actively maintained.

-   ibm-data-db2 -- IBM DB2 database connectivity for Mono

This package contains the ADO.NET Data provider for the IBM DB2 Universal database.

-   mono-data-oracle -- Oracle database connectivity for Mono

This package contains the ADO.NET Data provider for the Oracle database.

-   mono-data-postgresql -- Postgresql database connectivity for Mono

This package contains the ADO.NET Data provider for the Postgresql database.

-   mono-data-sqlite -- sqlite database connectivity for Mono

This package contains the ADO.NET Data provider for the sqlite database.

-   mono-data-sybase -- Sybase database connectivity for Mono

This package contains the ADO.NET Data provider for the Sybase database.

-   mono-basic -- Visual Basic .NET support for Mono

This package contains the Visual Basic .NET compiler and language runtime. This allows you to compile and run VB.NET application and assemblies.

-   mono-jscript -- JScript .NET support for Mono

This package contains the JScript .NET compiler and language runtime. This allows you to compile and run JScript.NET application and assemblies.

-   mono-ikvm -- Support libraries for IKVM

This package contains libraries that provides support for IKVM, a Java runtime that uses Mono. The "ikvm" package needs to be installed as well to use IKVM.

-   mono-locale-extras -- Extra Locale information

This package contains assemblies to support I18N applications for non-latin alphabets.

-   mono-web -- ASP.NET, Remoting, and Web Services for Mono

This package provides the ASP.NET libraries and runtime for development of web application, web services and remoting support.

-   mono-winforms -- Windows Forms implementation for Mono

This package provides a fully managed implementation of System.Windows.Forms, the default graphical toolkit for .NET applications.

-   libgdiplus -- GDI+ drawing api implementation for Mono's System.Drawing.

This provides an implementation of the GDI+ API, used for representing graphical objects and transmitting them to output devices such as monitors and printers including advanced features such as alpha blending, gradient shading, complex path management and intrinsic support for modern graphics-file formats.

XSP/mod_mono
-------------

-   xsp -- The XSP server is a small web server that hosts ASP.NET.

This package contains XSP, a standalone web server written in C# that can be used to run ASP.NET applications as well as a set of pages, controls and web services that you can use to experience ASP.NET.

-   mod_mono -- A module to deploy an ASP.NET application on Apache with Mono!

This package provides mod_mono, a package that allows Apache ([http://httpd.apache.org](http://httpd.apache.org)) to serve ASP.NET pages by proxying the requests to a slightly modified version of our XSP server, called mod-mono-server, that is installed along with XSP

Gtk# 1.x
---------

-   gtk-sharp -- set of .NET bindings for the gtk+ ([http://www.gtk.org/](http://www.gtk.org/)) toolkit and assorted GNOME ([http://www.gnome.org/](http://www.gnome.org/)) libraries

This package provides a library that allows you to build fully native graphical Gnome application using Mono. GTK# is an event-driven system, based on Gtk+, the Gnome graphical toolkit and cross-platform. Gtk# includes bindings for Gtk, Atk, Pango, Gdk, libgnome, libgnomeuiand and libgnomecanvas. Gtk-sharp 1.x binds Gtk+ 2.0 and associated libraries

-   gtk-sharp-gapi -- Glib and GObject C source parser and C generator for the creation and maintenance of managed bindings for Mono and .NET

This package provides developer tools for the creation and maintainance of managed bindings to native libraries which utilize glib ([http://developer.gnome.org/doc/API/glib/](http://developer.gnome.org/doc/API/glib/)) and GObject ([http://developer.gnome.org/doc/API/2.0/gobject/](http://developer.gnome.org/doc/API/2.0/gobject/)). Some examples of libraries currently bound using the GAPI tools and found in Gtk# include Gtk, Atk, Pango, Gdk, libgnome, libgnomeuiand and libgnomecanvas.

Development Tools
-----------------

-   monodoc -- Monodoc is a graphical documentation browser for Mono

This package includes Monodoc, a Gtk# based graphical documentation browser for Mono and associated libraries.

-   gecko-sharp-2.0 -- Mono bindings for the Gecko engine

This package provides Mono bindings for the Gecko engine, through an easy-to-use widget that will allow you to embed a Mozilla browser window into your Gtk# application.

-   gtksourceview-sharp-2.0 -- a Mono bindings for GtkSourceView

This package provides Mono bindings for GtkSourceview, a child of the Gtk+ text widget implementing syntax highlighting and other features typical of a source editor

-   monodevelop -- A full-featured IDE for Mono and Gtk#

This package provides MonoDevelop, a full-featured IDE for Mono with syntax coloring, code completion, debugging, project management and support for C#, VB.NET, Java, Boo, Nermerle and ILasm.

-   boo -- A CLI scripting language for Mono

This package provides the Boo compiler and runtime for Mono. Boo is a new object oriented statically typed programming language for the Common Language Infrastructure with a python inspired syntax and a special focus on language and compiler extensibility.

-   ikvm -- IKVM.NET is a JVM for Mono and the Microsoft .NET framework.

This package provides IKVM.NET, an open source Java compatibility module for Mono which includes the following components:

       * A Java Virtual Machine implemented in .NET
       * A java compilers implemented in .NET
       * A .NET implementation of the Java class libraries
       * Tools that enable Java and .NET interoperability

Gtk# 2.x
---------

-   gtk-sharp2 -- .Net language bindings for Gtk+ and GNOME

This package provides a library that allows you to build fully native graphical Gnome application using Mono. GTK# is an event-driven system, based on Gtk+, the Gnome graphical toolkit and cross-platform. Gtk# includes bindings for Gtk, Atk, Pango, Gdk, libgnome, libgnomeuiand and libgnomecanvas. Gtk-sharp 2.x binds Gtk+ 2.4 and associated libraries

-   gtk-sharp2-gapi -- Glib and GObject C source parser and C generator for the creation and maintenance of managed bindings for Mono and .NET

This package provides developer tools for the creation and maintainance of managed bindings to native libraries which utilize glib ([http://developer.gnome.org/doc/API/glib/](http://developer.gnome.org/doc/API/glib/)) and GObject ([http://developer.gnome.org/doc/API/2.0/gobject/](http://developer.gnome.org/doc/API/2.0/gobject/)). Some examples of libraries currently bound using the GAPI tools and found in Gtk# include Gtk, Atk, Pango, Gdk, libgnome, libgnomeuiand and libgnomecanvas. Gtk-sharp2-gapi is used to bind Gtk+ 2.4 and associated libraries.

