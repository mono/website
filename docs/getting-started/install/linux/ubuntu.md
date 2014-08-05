---
title: Mono for Ubuntu
redirect_from:
  - /DistroPackages/Ubuntu/
---

Official Packages
-----------------

The following official versions are available in the standard Ubuntu repositories:

||
|Ubuntu Lucid (10.04 LTS):|2.4 branch snapshot|
|Ubuntu Precise (12.04 LTS):|2.10.8.1|
|Ubuntu Saucy (13.10):|2.10.8.1|
|Ubuntu Trusty (14.04 LTS):|3.2.8|
|Ubuntu Utopic (14.10):|3.2.8|

Dependencies are automatically tracked for applications in the archive such as Tomboy, Gbrainy and F-Spot. Ubuntu comes with these three applications by default, and therefore **comes with Mono installed by default** on releases prior to 12.04. On 12.04 or later, install **mono-complete** for a full install of the whole of Mono.

To compile your own software, install **mono-devel**.

Backport Packages
-----------------

Mono is considered a "core framework" in Ubuntu, meaning it has many applications depending upon it (roughly 40 applications). Due to this, the chance of one of those applications breaking due to unexpected changes in their underlying framework is considered too high to risk an update.

As a result, Mono cannot officially be backported in Ubuntu.

Unofficial Packages
-------------------

### Ubuntu Lucid (10.04 LTS)

Users of Ubuntu 10.04 LTS (Lucid Lynx) can install **2.10.8.1** by using Synaptic from the [badgerports](http://badgerports.org) repository. badgerports is an unofficial community project from one of the Debian/Ubuntu Mono developers to ship latest Ubuntu packages for Ubuntu LTS users. Please visit the URL below for full information on enabling these packages:

-   [http://badgerports.org/](http://badgerports.org/)

### Ubuntu Precise (12.04 LTS)

Users of Ubuntu 12.04 LTS (Precise Pangolin) can install **3.2.8** by using Synaptic from the [badgerports](http://badgerports.org) repository. badgerports is an unofficial community project from one of the Debian/Ubuntu Mono developers to ship latest Ubuntu packages for Ubuntu LTS users. Please visit the URL below for full information on enabling these packages:

-   [http://badgerports.org/](http://badgerports.org/)

Further Links
-------------

-   Mono in Ubuntu is maintained by members of the Debian Mono team - you should consider using their resources as shown below
-   The Debian Mono team can be contacted via IRC: [[1]](irc://irc.oftc.net/#debian-cli) - for a web-based IRC client, try [Mibbit](http://www.mibbit.com/networks/oftc/debian-cli.html)
-   The Debian Mono team can be contacted via their mailing list, [pkg-mono-devel@lists.alioth.debian.org](http://lists.alioth.debian.org/mailman/listinfo/pkg-mono-devel) - general questions relating to Mono on Debian should go to the end-user mailing list [debian-cli@lists.debian.org](http://lists.debian.org/debian-cli/)
-   The Debian Mono team has a website on [Alioth](http://pkg-mono.alioth.debian.org/)

