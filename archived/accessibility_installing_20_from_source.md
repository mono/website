---
title: "Accessibility: Installing 2.0 From Source"
lastmodified: '2010-02-26'
redirect_from:
  - /Accessibility:_Installing_2.0_From_Source/
---

Accessibility: Installing 2.0 From Source
=========================================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#installing-mono-accessibility-20-from-source">1 Installing Mono Accessibility 2.0 From Source</a>
<ul>
<li><a href="#prerequisites">1.1 Prerequisites</a></li>
<li><a href="#getting-the-source">1.2 Getting the Source</a></li>
<li><a href="#building-and-installing">1.3 Building and Installing</a>
<ul>
<li><a href="#mono-uia-20tarbz2">1.3.1 mono-uia-2.0.tar.bz2</a></li>
<li><a href="#uiautomationwinforms-20tarbz2">1.3.2 uiautomationwinforms-2.0.tar.bz2</a></li>
<li><a href="#uiaatkbridge-20tarbz2">1.3.3 uiaatkbridge-2.0.tar.bz2</a></li>
<li><a href="#uiadbus-20tarbz2">1.3.4 uiadbus-2.0.tar.bz2</a></li>
<li><a href="#at-spi-sharp-10tarbz2">1.3.5 at-spi-sharp-1.0.tar.bz2</a></li>
<li><a href="#atspiuiasource-20tarbz2">1.3.6 atspiuiasource-2.0.tar.bz2</a></li>
</ul></li>
<li><a href="#what-now">1.4 What Now?</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Installing Mono Accessibility 2.0 From Source
=============================================

Prerequisites
-------------

-   pkg-config
-   Mono \>= 2.4
-   glib-sharp2 \>= 2.12.8
-   gtk-sharp2 \>= 2.12.8
-   libgobject
-   libgmodule
-   libglib
-   atk
-   nunit \>= 2.4.7 (if building tests)
-   at-spi2 \>= 0.1.7
    -   [http://download.gnome.org/sources/at-spi2-core/0.1/](http://download.gnome.org/sources/at-spi2-core/0.1/)
    -   [http://download.gnome.org/sources/at-spi2-atk/0.1/](http://download.gnome.org/sources/at-spi2-atk/0.1/)

Getting the Source
------------------

Please download 2.0 release tarballs:

-   [at-spi-sharp-1.0.tar.bz2](http://mono-a11y.org/releases/2.0/sources/at-spi-sharp-1.0.tar.bz2)
-   [atspiuiasource-2.0.tar.bz2](http://mono-a11y.org/releases/2.0/sources/atspiuiasource-2.0.tar.bz2)
-   [mono-uia-2.0.tar.bz2](http://mono-a11y.org/releases/2.0/sources/mono-uia-2.0.tar.bz2)
-   [uiaatkbridge-2.0.tar.bz2](http://mono-a11y.org/releases/2.0/sources/uiaatkbridge-2.0.tar.bz2)
-   [uiadbus-2.0.tar.bz2](http://mono-a11y.org/releases/2.0/sources/uiadbus-2.0.tar.bz2)
-   [uiautomationwinforms-2.0.tar.bz2](http://mono-a11y.org/releases/2.0/sources/uiautomationwinforms-2.0.tar.bz2)

from [http://mono-a11y.org/releases/2.0/sources/](http://mono-a11y.org/releases/2.0/sources/)

Building and Installing
-----------------------

If you have a [parallel Mono environment](/Parallel_Mono_Environments "Parallel Mono Environments"), make sure to specify the correct prefix during the *configure* stage.

### mono-uia-2.0.tar.bz2

     tar xfj mono-uia-2.0.tar.bz2
     cd mono-uia-2.0/
     ./configure --prefix=/usr
     make
     sudo make install

### uiautomationwinforms-2.0.tar.bz2

     tar xfj uiautomationwinforms-2.0.tar.bz2
     cd uiautomationwinforms-2.0/
     ./configure --prefix=/usr
     make
     sudo make install

### uiaatkbridge-2.0.tar.bz2

     tar xfj uiaatkbridge-2.0.tar.bz2
     cd uiaatkbridge-2.0/
     ./configure --prefix=/usr --disable-tests
     make
     sudo make install

### uiadbus-2.0.tar.bz2

     tar xfj uiadbus-2.0.tar.bz2
     cd uiadbus-2.0/
     ./configure --prefix=/usr
     make
     sudo make install

### at-spi-sharp-1.0.tar.bz2

     tar xfj at-spi-sharp-1.0.tar.bz2
     cd at-spi-sharp-1.0/
     ./configure --prefix=/usr --disable-tests
     make
     sudo make install

### atspiuiasource-2.0.tar.bz2

     tar xfj atspiuiasource-2.0.tar.bz2
     cd atspiuiasource-2.0/
     ./configure --prefix=/usr
     make
     sudo make install

What Now?
---------

Make sure you have Accessibility turned on in your GNOME preferences, and everything should Just Work.

