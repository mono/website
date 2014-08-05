---
title: "Accessibility: Release Notes 2.1"
lastmodified: '2010-08-24'
redirect_from:
  - /Accessibility:_Release_Notes_2.1/
---

Accessibility: Release Notes 2.1
================================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#mono-accessibility-21-release-notes">1 Mono Accessibility 2.1 Release Notes</a>
<ul>
<li><a href="#notes">1.1 Notes</a></li>
<li><a href="#errata">1.2 Errata</a></li>
<li><a href="#downloading">1.3 Downloading</a></li>
<li><a href="#installing">1.4 Installing</a></li>
<li><a href="#contributors">1.5 Contributors</a></li>
<li><a href="#reporting-bugs">1.6 Reporting Bugs</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Mono Accessibility 2.1 Release Notes
====================================

The Mono Accessibility project enables Winforms and Silverlight applications to be fully accessible on Linux, and allows Assistive Technologies (ATs) like screen readers and test automation tools that depend on UI Automation APIs to work on Linux.

This is our first release of the 2.0 series, and includes:

-   Improved compatibility with AT-SPI2, including fixes and performance.
-   More compatibility with Silverlight Accessibility for UIA Clients.
-   Caching improvements in UIA Client API.
-   Support for custom providers and client-side providers.

Codename: Zoidberg

*Release Date: Aug 24, 2010*

Notes
-----

There were 127 bugs fixed since 2.0 release, please check out our [bug tracker](https://bugzilla.novell.com/buglist.cgi?query_format=advanced&classification=Mono&product=UI+Automation) for the [full list](https://bugzilla.novell.com/buglist.cgi?query_format=advanced&classification=Mono&product=UI+Automation&bug_status=RESOLVED&bug_status=VERIFIED&bug_status=CLOSED&chfieldfrom=2010-02-26&chfieldto=2010-08-23).

AT-SPI2 packages are relocated, this means you have to explicitly enable AT-SPI2 using gconf-editor toggling the key "/desktop/gnome/interface/at-spi-dbus" to use AT-SPI2, by default AT-SPI is used. Notice however if you have plans to use UIA Client API you require to use AT-SPI2.

Errata
------

For the most up-to-date errata, please look at the [Mono Accessibility bug tracker](https://bugzilla.novell.com/buglist.cgi?query_format=advanced&classification=Mono&product=UI+Automation) for [issues filed against Release 2.1](https://bugzilla.novell.com/buglist.cgi?query_format=advanced&classification=Mono&product=UI+Automation&version=Release+2.1&bug_status=NEW&bug_status=ASSIGNED&bug_status=NEEDINFO&bug_status=REOPENED).

Windows Forms applications using ToolBarButton will segfault if accessibility is enabled and mono 2.4.3 is used, this bug only affects Mono 2.4.3.

Downloading
-----------

Mono Accessibility is available for a variety of Linux distributions, including:

-   openSUSE 11.2 - [1-Click Install](http://download.opensuse.org/repositories/Mono:/UIA/openSUSE_11.2/mono-uia.ymp)
-   Ubuntu Karmic Koala - [Package Archive on Launchpad](https://edge.launchpad.net/~mono-a11y/+archive/releases)
-   Fedora 12 - [Repository on openSUSE Build Service](http://download.opensuse.org/repositories/Mono:/UIA/Fedora_12/)

If packages aren't available for your distribution, you'll probably have to install Mono Accessibility from source. Step-by-step instructions are [available]({{ site.github.url }}/Accessibility:_Installing_2.1_From_Source "Accessibility: Installing 2.1 From Source").

If you just want to grab a source tarball, check out the [sources](http://mono-a11y.org/releases/2.1/sources/) section of our downloads site.

Installing
----------

Installing UIA and ATK support for System.Windows.Forms is as simple as adding our repositories to your package management system, updating and installing.

However, adding accessibility support for the Moonlight browser plugin requires a different set of steps:

-   Install the updated `xulrunner` package from the above repositories. *(Required until patch on [bug \#480317](https://bugzilla.mozilla.org/show_bug.cgi?id=480317)) gets approved*
-   Install Novell Moonlight with Accessibility Support for [32 bit](http://www.mono-a11y.org/archive/moonlight-plugins/2.3.99.0accessibility/novell-moonlight-2.3.99.0accessibility-i586.xpi) or [64 bit](http://www.mono-a11y.org/archive/moonlight-plugins/2.3.99.0accessibility/novell-moonlight-2.3.99.0accessibility-x86_64.xpi).
-   Install [Novell Moonlight Accessibility Extensions](http://www.mono-a11y.org/archive/moonlight-a11y-plugins/2.1/novell-moonlight-a11y-2.1-noarch.xpi)
-   Restart Firefox
-   Have fun!

Contributors
------------

The following people have contributed to making this release happen:

> Andrés G. Aragoneses, Brad Taylor, Brian Merrell, Calen Chen, Calvin Gaisford, Feng Xia Mu (Felicia), Mario Carrion, Michael Gorse, Nan Gao (Neville), Olivier Dufour, Ray Wang, Rui Guo (Matt), Sandy Armstrong, Stephen Shaw

We are also indebted to the following awesome upstream projects:

> GNOME Accessibility, Mono, Moonlight, Firefox, DBusSharp from NDesk, openSUSE

Reporting Bugs
--------------

If you find any issues with this release, please don't hesitate to [file bugs](https://bugzilla.novell.com/enter_bug.cgi?product=UI%20Automation).

If you want to contribute or need specific assistance, please join our [mailing list](http://forge.novell.com/mailman/listinfo/mono-a11y), or drop in [\#mono-a11y](irc://irc.gimp.org/mono-a11y) on irc.gimp.org.

