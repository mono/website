---
title: Mono for Debian
redirect_from:
  - /DistroPackages/Debian/
---

Official Packages
-----------------

The following official versions are available in the standard Debian repositories:

||
|Debian 6.0 (Squeeze):|[2.6.7](http://packages.debian.org/squeeze/mono-runtime)|
|Debian 7.0 (Wheezy):|[2.10.8.1](http://packages.debian.org/squeeze/mono-runtime)|
|Debian Jessie (testing):|[2.10.8.1](http://packages.debian.org/testing/mono-runtime)|
|Debian Sid (unstable):|[3.0.6](http://packages.debian.org/unstable/mono-runtime)|
|Debian Experimental:|[3.2.8](http://packages.debian.org/experimental/mono-runtime)|

Dependencies are automatically tracked for applications in the archive such as Tomboy and F-Spot.

To compile your own software, install **mono-devel** on Squeeze (6.0), Wheezy (testing), Sid (unstable), or Experimental.

For a complete Mono, install **mono-complete** on Squeeze (6.0), Wheezy (testing), Sid (unstable), or Experimental.

If you run Debian/Testing or Debian/Unstable then you can install Mono from Debian/Experimental. First you need to add the experimental repository to your /etc/apt/sources.list by running:

       echo "deb http://ftp.debian.org/debian experimental main" >> /etc/apt/sources.list
       apt-get update

After that you can upgrade to Mono from Experimental by running:

       apt-get install mono-complete -t experimental

Backport Packages
-----------------

Unofficial Packages (Mono 3.0)
------------------------------

Users of Debian Unstable (Sid) and Testing (Wheezy) can use this APT repository to install Mono and related packages that are not yet uploaded or accepted in Debian.

The following unofficial versions are available in [Mirco Bauer's](https://www.meebey.net/) ([meebey@debian.org](http://qa.debian.org/developer.php?login=meebey@debian.org)) APT repository:

||
|Debian Wheezy (testing):|[3.0.6](http://debian.meebey.net/experimental/mono)|
|Debian Sid (unstable):|[3.0.6](http://debian.meebey.net/experimental/mono)|

Add this line to your /etc/apt/sources.list file:

    deb http://debian.meebey.net/experimental/mono /

Now update the APT database and install mono-complete from that repository:

    apt-get update
    apt-get install mono-complete

Further Links
-------------

-   The Debian Mono Group can be contacted via IRC: [[1]](irc://irc.oftc.net/#debian-cli)
-   The Debian Mono Group can be contacted via their mailing list, [pkg-mono-devel@lists.alioth.debian.org](http://lists.alioth.debian.org/mailman/listinfo/pkg-mono-devel) - general questions relating to Mono on Debian should go to the end-user mailing list [debian-cli@lists.debian.org](http://lists.debian.org/debian-cli/)
-   The Debian Mono Group has a website on [Alioth](http://pkg-mono.alioth.debian.org/)


