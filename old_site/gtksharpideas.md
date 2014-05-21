---
layout: obsolete
title: "GtkSharpIdeas"
lastmodified: '2010-09-11'
permalink: /old_site/GtkSharpIdeas/
redirect_from:
  - /GtkSharpIdeas/
---

GtkSharpIdeas
=============

Here we are tracking ideas that we would like to integrate into the [Gtk\#]({{site.github.url}}/old_site/GtkSharp "GtkSharp") API.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#data-binding">1 Data Binding</a></li>
<li><a href="#opengl-integration">2 OpenGL integration</a></li>
<li><a href="#rendering">3 Rendering</a>
<ul>
<li><a href="#cairo-integration">3.1 Cairo integration</a></li>
</ul></li>
<li><a href="#treeview">4 TreeView</a></li>
<li><a href="#tutorials">5 Tutorials</a></li>
<li><a href="#documentation">6 Documentation</a></li>
<li><a href="#widgets">7 Widgets</a></li>
<li><a href="#other-libraries">8 Other Libraries</a></li>
<li><a href="#platforms">9 Platforms</a></li>
</ul></td>
</tr>
</tbody>
</table>

Data Binding
============

We want to support Data Binding, but we need someone with experience on Data Binding to spec out the requirements and expected behavior of forms that use it.

OpenGL integration
==================

The [Tao Framework]({{site.github.url}}/Tao) provides complete bindings to OpenGL, the issue is how to create window regions in Gtk\# that can host OpenGL areas.

There is a Gtk\# widget that integrates OpenGL [here](http://www.olympum.com/~bruno/gtkgl-sharp.html)

Rendering
=========

Cairo integration
-----------------

Integration from Cairo should be revisited as Cairo evolves. There are two problems in adopting Cairo today as part of the core rendering engine of Gtk\#:

-   Mono.Cairo depends on Cairo which is still a moving target and the API frequently changes.
-   Cairo must support Win32 if we want to make this part of the of the cross-platform functionality.

The Gtk group has adopted Cairo as their rendering engine for future versions of Gtk, so it might make sense to just wait for them.

TreeView
========

The TreeView is considered fairly complex, integration with DataSet/DataTable would help here, maybe provide a default widget that would just do this integration?

Tutorials
=========

People are interested in more in-depth tutorials, the question is what subjects.

A few subjects suggested:

-   How to set the values on a ComboBox to a ListStore?
-   App Framework:
    -   Menus
    -   Accelerators
    -   Toolbars
    -   Session management? (Better not ;-)

-   [Developing Responsive Applications]({{site.github.url}}/old_site/Responsive_Applications "Responsive Applications") (Work-in-Progress).

-   Deployment: confusion about which installer to use (there are three available).

-   More example programs, or make the current ones more visible.

Documentation
=============

Gtk\# documentation not complete. Samples wanted.

Widgets
=======

Interest in having widgets to do:

-   Grids (spreadsheet-like, for data entry)
-   NPlot/Gtk working on Windows (currently hardcodes the gdk\_x11 stuff, copy the stuff over from GtkDotNet.dll)
-   DataGrids (same, but bound to System.Data in some form)
-   GnomeCanvas on the Windows port.
-   Simple API for trees: instead of a model/view split, have the model/view be self contained:

<!-- -->

     p = new Node ("Hello");
     p.Append (new Node ("child1"));
     p.Append (new Node ("child2"));

Other Libraries
===============

-   Support Audio in some form (SDL?)

Platforms
=========

Discussion on [Improving Gtk+ on Windows]({{site.github.url}}/old_site/ImprovingGtkWin32 "ImprovingGtkWin32")

