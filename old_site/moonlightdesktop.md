---
layout: obsolete
title: "MoonlightDesktop"
lastmodified: '2010-10-19'
permalink: /old_site/MoonlightDesktop/
redirect_from:
  - /MoonlightDesktop/
---

MoonlightDesktop
================

As of today, [Moonlight]({{ site.github.url }}/old_site/Moonlight "Moonlight")'s engine is used in two scenarios:

-   As part of the Moonlight Web Plugin, to render online Silverlight content.
-   As a standalone library to create desktop applications that can use the Silverlight API.

Using the former is discussed extensively on any site that discussed Silverlight development and represents the core of our work.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#api-differences">1 API differences</a></li>
<li><a href="#using-moonlight-on-the-desktop">2 Using Moonlight on the Desktop</a></li>
<li><a href="#setting-moonlight-on-the-desktop">3 Setting Moonlight on the Desktop</a>
<ul>
<li><a href="#verifying-your-installation">3.1 Verifying Your Installation</a></li>
</ul></li>
<li><a href="#building-moonlight-for-the-desktop">4 Building Moonlight for the Desktop</a>
<ul>
<li><a href="#building-moonlight">4.1 Building Moonlight</a></li>
<li><a href="#using-moonlight-on-the-desktop---alternate-prefix">4.2 Using Moonlight on the Desktop - Alternate Prefix</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

API differences
===============

While Moonlight on the web exposes the same functionality that Silverlight and uses the same assembly versions, APIs and signatures, the desktop edition is not bound by those requirements.

When you develop applications with Moonlight/Desktop you get access to all of the standard .NET 3.5 APIs that are available in Mono. Think of Moonlight/Desktop as extending your standard .NET developer APIs with the following assemblies:

-   System.Windows.dll
-   System.Windows.Browser.dll
-   System.Windows.Controls.dll
-   System.Windows.Controls.Data.dll

and our Gtk integration library:

-   Moonlight.Gtk.dll

 Today Moonlight on the desktop is currently limited to the Gtk+ toolkit as that is the only bridge that we have built, but we expect to create bridges for other toolkits and platforms in the future.

Using Moonlight on the Desktop
==============================

[![]({{ site.github.url }}/old_site/images/7/77/Screenshot597.png)]({{ site.github.url }}/old_site/images/7/77/Screenshot597.png)

Sample Solution Layout

To create desktop applications, create a Gtk\# project, and add to your project the following assemblies:

-   System.Windows.dll
-   Moonlight.Gtk.dll

The first assembly contains the Silverlight API, the second contains the glue that hosts your Silverlight content inside a Gtk\# application.

The solution should look like the image on the sidebar.

Then, you need to import the namespaces into your application, like this:

``` csharp
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using Moonlight.Gtk;
```

Then you need to initialized Moonlight, do this by calling MoonlightRuntime.Init(), just after Gtk.Application.Init():

You then need to create a Gtk.Widget that will host your Silverlight control. This is done with the MoonlightHost class, use it like this:

``` csharp
    var host =  new MoonlightHost ();
```

You can add that to any Gtk.Container, in this case, we will add it to the window:

``` csharp
    window.Add (host);
    window.ShowAll ();
```

You will want to create your Silverlight components, for example this creates a canvas:

``` csharp
Canvas container = new Canvas (){
    Width = width,
    Height = height,
    Background = new SolidColorBrush (Color.FromArgb (255, 0x4c, 0x4c, 0x4c))
};
```

You then must add the canvas into your host, do this with:

``` csharp
 h.Application.RootVisual = container;
```

The full sample should look like this:

``` csharp
using System;
using System.Windows;
using System.Windows.Media;
using System.Windows.Controls;
using Moonlight.Gtk;
 
namespace SilverDesktop
{
    class MainClass
    {
        public static void Main (string[] args)
        {
            Gtk.Application.Init ();
            MoonlightRuntime.Init ();
 
            MainWindow win = new MainWindow ();
 
            var host = new MoonlightHost ();
            var canvas = new Canvas () {
                Width = 300, Height = 300,
                Background = new SolidColorBrush (Colors.DarkGray)
            };
            host.Application.RootVisual = canvas;
 
            win.Add (host);
            win.ShowAll ();
 
            Gtk.Application.Run ();
        }
    }
}
```

Setting Moonlight on the Desktop
================================

Ideally, your distribution will have the proper packages for Moonlight on the desktop. If it is not available, you will need to build Mono and Moonlight from source code. The following sections explain how to get this ready.

Verifying Your Installation
---------------------------

You first need to make sure that you have the Moonlight for the desktop libraries installed on your system.

If you are using MonoDevelop To do this, use the following command:

``` bash
$ pkg-config --modversion silverdesktop
1.9.0.99
```

If the result is something like:

``` bash
Package foo was not found in the pkg-config search path.
Perhaps you should add the directory containing `silverdesktop.pc'
to the PKG_CONFIG_PATH environment variable
No package 'silverdesktop' found
```

It means that you do not have Moonlight/desktop installed.

Building Moonlight for the Desktop
==================================

Building Moonlight
------------------

Please carefully read the [README](http://github.com/mono/moon/raw/master/README) file on github for the latest Moonlight build instructions.

Make sure that you pass the flag: --enable-desktop-support to configure, to ensure that the Moonlight Desktop assemblies are compiled.

For private installation use:

``` bash
$ cd ../moon
$ ./autogen.sh --prefix=$HOME/build --enable-desktop-support
$ make && make install
```

For a system installation use:

``` bash
$ cd ../moon
$ ./autogen.sh --enable-desktop-support
$ make 
$ su
Password: <enter-your-root-password>
# make install
```

The output after configuration should look like this:

``` bash
Moonlight configuration
=======================
[...]
  Silverlight Support:
    Silverlight 1.0: yes
    Silverlight 2.0: yes
          Browser plugin assemblies: yes 
            Path to mcs tree: ./../mcs
            Path to mono-basic tree: ./../mono-basic
          Desktop application assemblies: yes
```

Using Moonlight on the Desktop - Alternate Prefix
-------------------------------------------------

If you chose to install Moonlight in the private prefix instead of the system, you need to set a few environment variables that are required by MonoDevelop to find Moonlight and for the system to find the libraries.

Use these settings in your shell:

``` bash
export MONO_GAC_PREFIX=/usr:$HOME/build
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$HOME/build/lib/pkgconfig 
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/build/lib
```

At that point you can run MonoDevelop and your application, they will automatically pick up your new assemblies.

