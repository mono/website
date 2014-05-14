---
layout: obsolete
title: "GtkSharpUpgrade"
permalink: /old_site/GtkSharpUpgrade/
redirect_from:
  - /GtkSharpUpgrade/
---

GtkSharpUpgrade
===============

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#upgrading-to-the-latest-gtk-version">1 Upgrading to the Latest Gtk# Version</a>
<ul>
<li><a href="#upgrading-from-10-to-24">1.1 Upgrading from 1.0 to 2.4</a>
<ul>
<li><a href="#how-do-i-update-my-10-application-to-compile-against-2x">1.1.1 How do I update my 1.0 application to compile against 2.x?</a></li>
<li><a href="#how-do-i-use-the-newest-gapi-parsergenerator">1.1.2 How do I use the newest GAPI parser/generator?</a></li>
<li><a href="#what-happened-to-gda-and-gnomedb">1.1.3 What happened to Gda# and GnomeDb#?</a></li>
</ul></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Upgrading to the Latest Gtk\# Version
=====================================

This page is a repository of answers to typical upgrading related questions between major Gtk\# releases.

Upgrading from 1.0 to 2.4
-------------------------

### How do I update my 1.0 application to compile against 2.x?

Most applications use pkg-config to detect Gtk\# and obtain the reference arguments for their compilations. If you are using the PKG\_CONFIG\_CHECK macro during configure or the -pkg: switch on mcs, you will need to make them look for gtk-sharp-2.0.pc instead of gtk-sharp.pc (e.g. -pkg:gtk-sharp-2.0).

### How do I use the newest GAPI parser/generator?

The 2.x versions of the parser/generator are named gapi2-parser and gapi2-codegen. They are parallel installable with the 1.0 versions, so they had to be renamed. You should strongly consider upgrading, as many parser/generator enhancements have been added which could not realistically be backported to the stable 1.0 releases. Using GAPI 2.x will also effectively add a glib-sharp 2.x dependency though, so you can not use GAPI 2.x with the Gtk\# 1.0 assemblies. You will have to upgrade both.

### What happened to Gda\# and GnomeDb\#?

We aren't aware of anyone who was actually using them, and it is not clear that they were even usable based on some fundamental broken-ness like Gda.Value. We have provided a patch to the gnomedb project to integrate the bindings directly into gda/gnomedb where they will hopefully receive much more attention than we were able to give them in Gtk\# .

