---
layout: obsolete
title: "GtkGLArea"
lastmodified: '2009-07-29'
permalink: /old_site/GtkGLArea/
redirect_from:
  - /GtkGLArea/
---

GtkGLArea
=========

[![]({{site.github.url}}/old_site/images/7/72/Gtkgl.png)]({{site.github.url}}/old_site/images/7/72/Gtkgl.png)

[![](/skins/common/images/magnify-clip.png)]({{site.github.url}}/old_site/images/7/72/Gtkgl.png "Enlarge")

A view of a 3D model using GtkGLArea

**GtkGLArea** is an OpenGL context provider for GTK+. It can be used in several ways:

-   using the **`GtkGLArea`** widget, a simple OpenGL rendering canvas similar in use to **`GtkDrawingArea`**.
-   using a **`GdkGLContext`** to add an OpenGL context to almost any existing drawable widget.
-   using a **`GdkGLPixmap`** for off-screen rendering to pixmap objects.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#development">1 Development</a></li>
<li><a href="#roadmap">2 Roadmap</a></li>
<li><a href="#projects-using-this-package">3 Projects using this package</a></li>
<li><a href="#download">4 Download</a></li>
</ul></td>
</tr>
</tbody>
</table>

Development
-----------

**GtkGLArea** was originally developed in 1999 by J. Löf. Xavier Ordoquy became maintainer of the package until 2003. In 2006, C.J. Adams-Collier took over the role, joined by Sam Hocevar in 2007.

Development takes place in the GNOME Git repository:

-   Web interface: [http://git.gnome.org/cgit/gtkglarea/](http://git.gnome.org/cgit/gtkglarea/)
-   Git URL: `git://git.gnome.org/gtkglarea`

Roadmap
-------

Version 2.1 plans to provide OS X support.

The use of [Cairo](http://cairographics.org/introduction) and [Glitz](http://www.freedesktop.org/Software/glitz) drawing surface is being considered as an OS-agnostic alternative to the GLX, WGL, AGL mess that has been used until now.

Projects using this package
---------------------------

-   [Jenkara]({{site.github.url}}/old_site/Jenkara "Jenkara")
-   [GtkGLAreaSharp]({{site.github.url}}/old_site/GtkGLAreaSharp "GtkGLAreaSharp")

Download
--------

[http://ftp.gnome.org/pub/GNOME/sources/gtkglarea/2.0/](http://ftp.gnome.org/pub/GNOME/sources/gtkglarea/2.0/)

