---
title: "SolarisInstructions"
lastmodified: '2006-05-17'
redirect_from:
  - /SolarisInstructions/
---

SolarisInstructions
===================

Uncompress and install the package as usual (substitute \<mono\_package\_download\> with the filename):

    gunzip <mono_package_download>
    pkgadd -d <mono_package_download>

Example:

    gunzip mono-1.1.13.2_1.sunos8.novell.sparc.pkg.gz
    pkgadd -d mono-1.1.13.2_1.sunos8.novell.sparc.pkg

This will install Mono to /opt/mono

You'll need to run an environment script whenever you want to run Mono:

    . /opt/mono/setup.sh

Or, if you're using a csh type shell:

    source /opt/mono/setup.csh

You can also copy the contents of setup.sh or setup.csh to the correct login profile scripts.

If you find any issues with the Solaris packaging, please email the mono mailing lists.

CC wberrier //at// novell //dot// com as he will be maintaining the package.

Mini FAQ
--------

**Why is the package so big?**

The package contains Mono, libgdiplus, monodoc, xsp, boo, and ikvm, as well as all of their dependencies. This is nearly double the size of a package containing just Mono, but doing so makes it easy to install.

**Can I use this package on Solaris 10 Sparc?**

Most likely, yes, but this has not been tested much. Expect to see a Solaris 10 package in the future.

**Can I use this package on Solaris 10 x86?**

No, but expect to see a Solaris 10 x86 package in the future.

**Why does my program crash saying it can't get access to a random source?**

You need to have patch \#112438 installed on Solaris 8. This enables the /dev/random and /dev/urandom devices.

