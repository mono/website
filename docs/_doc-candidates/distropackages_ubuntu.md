---
layout: obsolete
title: "DistroPackages/Ubuntu"
permalink: /old_site/DistroPackages/Ubuntu/
redirect_from:
  - /DistroPackages/Ubuntu/
---

DistroPackages/Ubuntu
=====================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#mono-for-ubuntu">1 Mono for Ubuntu</a>
<ul>
<li><a href="#official-packages">1.1 Official Packages</a></li>
<li><a href="#backport-packages">1.2 Backport Packages</a></li>
<li><a href="#unofficial-packages">1.3 Unofficial Packages</a>
<ul>
<li><a href="#ubuntu-hardy-804-lts">1.3.1 Ubuntu Hardy (8.04 LTS)</a></li>
<li><a href="#ubuntu-lucid-1004-lts">1.3.2 Ubuntu Lucid (10.04 LTS)</a></li>
</ul></li>
<li><a href="#further-links">1.4 Further Links</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Mono for Ubuntu
===============

Official Packages
-----------------

The following official versions are available in the standard Ubuntu repositories:

||
|Ubuntu Hardy (8.04 LTS):|1.2.6|
|Ubuntu Lucid (10.04 LTS):|2.4 branch snapshot|
|Ubuntu Natty (11.04):|2.6.7|
|Ubuntu Oneiric (11.10):|2.10.5|
|Ubuntu Precise (12.04 LTS):|2.10.8.1|
|Ubuntu Quantal (12.10):|2.10.8.1|

Dependencies are automatically tracked for applications in the archive such as Tomboy, Gbrainy and F-Spot. Ubuntu comes with these three applications by default, and therefore **comes with Mono installed by default** on releases prior to 12.04. On 12.04 or later, install **mono-complete** for a full install of the whole of Mono.

To compile your own software, install **mono-devel** on Lucid (10.04 LTS) or newer.

To compile your own software, install **mono-2.0-devel** on Hardy (8.04 LTS).

Backport Packages
-----------------

Mono is considered a "core framework" in Ubuntu, meaning it has many applications depending upon it (roughly 40 applications). Due to this, the chance of one of those applications breaking due to unexpected changes in their underlying framework is considered too high to risk an update.

As a result, Mono cannot officially be backported in Ubuntu.

Unofficial Packages
-------------------

### Ubuntu Hardy (8.04 LTS)

Users of Ubuntu 8.04 LTS (Hardy Heron) can install **2.4 branch snapshot** by using Synaptic from the [badgerports](http://badgerports.org) repository. badgerports is an unofficial community project from one of the Debian/Ubuntu Mono developers to ship latest Ubuntu packages for Ubuntu LTS users. Please visit the URL below for full information on enabling these packages:

-   [http://badgerports.org/hardy.html](http://badgerports.org/hardy.html)

### Ubuntu Lucid (10.04 LTS)

Users of Ubuntu 10.04 LTS (Lucid Lynx) can install **2.10.8.1** by using Synaptic from the [badgerports](http://badgerports.org) repository. badgerports is an unofficial community project from one of the Debian/Ubuntu Mono developers to ship latest Ubuntu packages for Ubuntu LTS users. Please visit the URL below for full information on enabling these packages:

-   [http://badgerports.org/](http://badgerports.org/)

Further Links
-------------

-   Mono in Ubuntu is maintained by members of the Debian Mono team - you should consider using their resources as shown below
-   The Debian Mono team can be contacted via IRC: [[1]](irc://irc.oftc.net/#debian-cli) - for a web-based IRC client, try [Mibbit](http://www.mibbit.com/networks/oftc/debian-cli.html)
-   The Debian Mono team can be contacted via their mailing list, [pkg-mono-devel@lists.alioth.debian.org](http://lists.alioth.debian.org/mailman/listinfo/pkg-mono-devel) - general questions relating to Mono on Debian should go to the end-user mailing list [debian-cli@lists.debian.org](http://lists.debian.org/debian-cli/)
-   The Debian Mono team has a website on [Alioth](http://pkg-mono.alioth.debian.org/)


