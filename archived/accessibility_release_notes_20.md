---
title: "Accessibility: Release Notes 2.0"
lastmodified: '2010-02-26'
permalink: /archived/Accessibility:_Release_Notes_2.0/
redirect_from:
  - /Accessibility:_Release_Notes_2.0/
---

Accessibility: Release Notes 2.0
================================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#mono-accessibility-20-release-notes">1 Mono Accessibility 2.0 Release Notes</a>
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

Mono Accessibility 2.0 Release Notes
====================================

The Mono Accessibility project enables Winforms and Silverlight applications to be fully accessible on Linux, and allows Assistive Technologies (ATs) like screen readers and test automation tools that depend on UI Automation APIs to work on Linux.

This is our second stable release, and includes:

-   UIA Provider and ATK support for [System.Windows.Forms](/index.php?title=System.Windows.Forms&action=edit&redlink=1 "System.Windows.Forms (page does not exist)") controls
-   UIA Provider and ATK support for Silverlight Controls
-   A complete implementation of the UIA Client API, allowing access to Winforms, Silverlight, and native GTK+ applications on Linux

Our next phase, the 2.1 release, will add more compatible Silverlight Accessibility for UIA Clients, and address issues with custom providers and client-side providers.

Codename: Hypnotoad

*Release Date: Feb 26, 2010*

Notes
-----

Many new features have been added and over 505 bugs have been addressed since the 1.0.0 release. Please check out our [bug tracker](https://bugzilla.novell.com/buglist.cgi?query_format=advanced&classification=Mono&product=UI+Automation) for the [full list](https://bugzilla.novell.com/buglist.cgi?query_format=advanced&classification=Mono&product=UI+Automation&bug_status=RESOLVED&bug_status=VERIFIED&bug_status=CLOSED&chfieldfrom=2009-03-13&chfieldto=2010-02-26).

Errata
------

For the most up-to-date errata, please look at the [Mono Accessibility bug tracker](https://bugzilla.novell.com/buglist.cgi?query_format=advanced&classification=Mono&product=UI+Automation) for [issues filed against Release 2.0](https://bugzilla.novell.com/buglist.cgi?query_format=advanced&classification=Mono&product=UI+Automation&version=Release+2.0&bug_status=NEW&bug_status=ASSIGNED&bug_status=NEEDINFO&bug_status=REOPENED).

Accessing GTK+ applications with the UIA Client API requires the most recent development version of the new dbus-based at-spi2, which is known to cause system instability. In Fedora, at-spi2 repeatedly causes [GDM to segfault](https://bugs.freedesktop.org/show_bug.cgi?id=26775). If you do not need this feature, do not install the latest at-spi2 and atk, or our packages which depend on them, which are at-spi-sharp and AtspiUiaSource. We are working hard to identify these issues and hope to aid the GNOME Accessibility Team in stabilizing at-spi2 in the near future.

Winforms apps can deadlock with Orca running. This should be fixed in the next release. In the meantime, there is a patch attached to [bug \#515507](http://bugzilla.novell.com/show_bug.cgi?id=515507) which should address this.

Downloading
-----------

Mono Accessibility is available for a variety of Linux distributions, including:

-   openSUSE 11.2 - [1-Click Install](http://download.opensuse.org/repositories/Mono:/UIA/openSUSE_11.2/mono-uia.ymp)
-   Ubuntu Karmic Koala - [Package Archive on Launchpad](https://edge.launchpad.net/~mono-a11y/+archive/ppa)
-   Fedora 12 - [Repository on openSUSE Build Service](http://download.opensuse.org/repositories/Mono:/UIA:/Fedora/Fedora_12/)

If packages aren't available for your distribution, you'll probably have to install Mono Accessibility from source. Step-by-step instructions are [available]({{ site.github.url }}/Accessibility:_Installing_2.0_From_Source "Accessibility: Installing 2.0 From Source").

If you just want to grab a source tarball, check out the [sources](http://mono-a11y.org/releases/2.0/sources/) section of our downloads site.

Installing
----------

Installing UIA and ATK support for System.Windows.Forms is as simple as adding our repositories to your package management system, updating and installing.

However, adding accessibility support for the Moonlight browser plugin requires a different set of steps:

-   Install the updated `xulrunner` package from the above repositories. *(This is required until Firefox 3.7 because of [bug \#480317](https://bugzilla.mozilla.org/show_bug.cgi?id=480317))*
-   Install Novell Moonlight with Accessibility Support for [32 bit](http://mono-a11y.org/releases/2.0/i586/novell-moonlight.xpi) or [64 bit](http://mono-a11y.org/releases/2.0/x86_64/novell-moonlight.xpi).
-   Install [Novell Moonlight Accessibility Extensions](http://mono-a11y.org/releases/2.0/noarch/novell-moonlight-a11y.xpi)
-   Restart Firefox
-   Enjoy!

Contributors
------------

The following people have contributed to making this release happen:

> Andrés G. Aragoneses, Brad Taylor, Brian Merrell, Calen Chen, Calvin Gaisford, Feng Xia Mu (Felicia), Mario Carrion, Michael Gorse, Nan Gao (Neville), Ray Wang, Rui Guo (Matt), Sandy Armstrong, Stephen Shaw

We are also indebted to the following awesome upstream projects:

> GNOME Accessibility, Mono, Moonlight, Firefox, DBusSharp from NDesk, openSUSE

Reporting Bugs
--------------

If you find any issues with this release, please don't hesitate to [file bugs](https://bugzilla.novell.com/enter_bug.cgi?product=UI%20Automation).

If you want to contribute or need specific assistance, please join our [mailing list](http://forge.novell.com/mailman/listinfo/mono-a11y), or drop in [\#mono-a11y](irc://irc.gimp.org/mono-a11y) on irc.gimp.org.

