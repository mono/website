---
layout: obsolete
title: "IncompletePackage"
permalink: /old_site/IncompletePackage/
redirect_from:
  - /IncompletePackage/
---

IncompletePackage
=================

If you get an error about an incomplete package while configuring Mono from the command line, this means that your distribution of Mono is incomplete.

This is typically caused by using old versions of tar (in particular, this happens in Solaris). You can bypass this check by using the **--disable-solaris-tar-check** command line argument when running 'autogen.sh'.

You must use a new tar program to decompress the Mono source code, as Mono contains very long directories and filenames that are not properly unpacked by older versions of tar.

You can use [GNU Tar](http://www.gnu.org/software/tar/) for this.

If you are getting this error **building from source**, please see: [Compiling Mono]({{site.github.url}}/old_site/Compiling_Mono "Compiling Mono")

