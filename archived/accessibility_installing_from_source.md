---
title: "Accessibility: Installing From Source"
lastmodified: '2011-02-14'
redirect_from:
  - /Accessibility:_Installing_From_Source/
---

Accessibility: Installing From Source
=====================================

The latest version of Mono Accessibility is 2.1, released on August 24, 2010. [Get more info about this release.]({{ site.github.url }}/Accessibility:_Release_Notes_2.1 "Accessibility: Release Notes 2.1")

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#installing-mono-accessibility-10-from-source">1 Installing Mono Accessibility 1.0 From Source</a>
<ul>
<li><a href="#prerequisites">1.1 Prerequisites</a></li>
<li><a href="#getting-the-source">1.2 Getting the Source</a>
<ul>
<li><a href="#download-release-tarballs">1.2.1 Download release tarballs</a></li>
</ul></li>
<li><a href="#building-and-installing">1.3 Building and Installing</a></li>
<li><a href="#what-now">1.4 What Now?</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Installing Mono Accessibility 1.0 From Source
=============================================

Prerequisites
-------------

NOTE: Latest code in GIT head may have different requirements (such as unreleased Mono and gtk-sharp2).

-   pkg-config
-   Mono \>= 2.4
-   glib-sharp2 \>= 2.12.8
-   gtk-sharp2 \>= 2.12.8
-   libgobject
-   libgmodule
-   libglib
-   atk
-   nunit \>= 2.4.7 (if building tests)

Since the Mono UIA packages require a very recent Mono and gtk-sharp, you may have trouble finding packages for your distribution. If that is the case, you may want to consider installing Mono and gtk-sharp from source in a [parallel Mono environment]({{ site.github.url }}/Parallel_Mono_Environments "Parallel Mono Environments").

Getting the Source
------------------

git clone [git://github.com/mono/uia2atk](git://github.com/mono/uia2atk)

### Download release tarballs

Please download [mono-uia](ftp://ftp.novell.com/pub/mono/sources/mono-uia), [uiautomationwinforms](ftp://ftp.novell.com/pub/mono/sources/uiautomationwinforms), and [uiaatkbridge](ftp://ftp.novell.com/pub/mono/sources/uiaatkbridge) tarballs from [ftp://ftp.novell.com/pub/mono/sources/](ftp://ftp.novell.com/pub/mono/sources/) .

Building and Installing
-----------------------

If you have a [parallel Mono environment]({{ site.github.url }}/Parallel_Mono_Environments "Parallel Mono Environments"), make sure to specify the correct prefix during the autogen.sh/configure stage.

If you downloaded a release tarball instead of getting the code from Git, use \`configure\` instead of \`autogen.sh\`.

    cd UIAutomation
    ./autogen.sh --prefix=/usr
    make
    sudo make install

    cd ../UIAutomationWinforms
    ./autogen.sh --prefix=/usr
    make
    sudo make install

    cd ../UiaAtkBridge
    ./autogen.sh --prefix=/usr
    make
    sudo make install

What Now?
---------

Make sure you have Accessibility turned on in your GNOME preferences, and everything should Just Work.

If you're interested in contributing to the project, see our [Getting Started Guide]({{ site.github.url }}/Accessibility:_Getting_Started_With_Development "Accessibility: Getting Started With Development").

