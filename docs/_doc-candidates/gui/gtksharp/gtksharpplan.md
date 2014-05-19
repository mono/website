---
layout: obsolete
title: "GtkSharpPlan"
permalink: /old_site/GtkSharpPlan/
redirect_from:
  - /GtkSharpPlan/
---

GtkSharpPlan
============

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#stable-releases">1 Stable Releases</a></li>
<li><a href="#plans-for-gtk-2x">2 Plans for Gtk# 2.x</a>
<ul>
<li><a href="#242628210-bindings">2.1 2.4/2.6/2.8/2.10 Bindings</a></li>
<li><a href="#212-bindings">2.2 2.12 bindings</a></li>
</ul></li>
<li><a href="#release-plan">3 Release plan</a></li>
<li><a href="#future-plans">4 Future Plans</a>
<ul>
<li><a href="#documentation">4.1 Documentation</a></li>
<li><a href="#gtk-for-64-bit-windows">4.2 Gtk# for 64-bit Windows</a></li>
<li><a href="#databinding">4.3 Databinding</a></li>
<li><a href="#indexer-autogeneration">4.4 Indexer Autogeneration</a></li>
<li><a href="#gui-designer-support-improvements">4.5 GUI Designer Support Improvements</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Stable Releases
---------------

Gtk\# 2.4.3, 2.6.3, 2.8.5, and 2.10.4 and 2.12.9 have been released.

Plans for Gtk\# 2.x
-------------------

### 2.4/2.6/2.8/2.10 Bindings

We are now in stable bugfixing mode for the 2.4, 2.6, 2.8 and 2.10 bindings. There are no current plans to add new features for these releases.

### 2.12 bindings

Gtk\# 2.12 bindings are in stable release. Gnome\# 2.20 and the new GnomeDesktop\# unstable library bindings package have been released as well. Source tarballs are available from [GNOME FTP](http://ftp.gnome.org/pub/gnome/sources/gtk-sharp/2.12). See [GtkSharpNewInVersion2x]({{site.github.url}}/old_site/GtkSharpNewInVersion2x "GtkSharpNewInVersion2x") for a list of enhancements and new features that were delivered in 2.12, along with newly bound API members from Gtk+ 2.12 and GNOME 2.20.

Release plan
------------

As the Gtk+ 2.14, 2.16 and 2.18 releases did not add any significant API except of GIO, we decided to focus on creating bindings for Gtk+ 3. Currently, trunk still targets Gtk+ 2.14, but we will switch to version 3 as soon as it is usable.

Gtk\# 3.0 will be built against the .net 2.0 profile, but it will be possible to install 2.12 and 3.0 in parallel for compatibility.

If Gtk 3 were to languish unreleased, we might release a binding for Gtk+ 2.18 first.

GIO bindings are availiable in the gio-sharp module from Mono's [AnonSVN]({{site.github.url}}/old_site/SourceCodeRepository) repository. Alternativly, you can build Gtk\# from trunk.

Future Plans
------------

The following list is a prioritized view of the planned feature additions:

### Documentation

We have already invested substantial effort into completing the API documentation and will continue to improve the state of the API documentation. Our goal is to introduce no new undocumented APIs going forward, and to improve the existing documentation coverage, filling in stubbed API documentation.

### Gtk\# for 64-bit Windows

We want to ship a 64-bit version of the Gtk\# installer for .net.

### Databinding

We want to build on some existing efforts to provide an integrated databinding capability similar to the .Net databinding capability in winforms.

### Indexer Autogeneration

We want to provide autogeneration of indexers and enumerators for types which expose foreach methods. This feature is in the feasibility-study category.

### GUI Designer Support Improvements

We want to provide an attribute system to make it easier for Stetic to interface with not only the Gtk\# widgets, but third party super-widgets.

