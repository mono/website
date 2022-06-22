---
title: "Scratchbox"
lastmodified: '2008-11-05'
redirect_from:
  - /Scratchbox/
---

Scratchbox
==========

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#introduction">1 Introduction</a></li>
<li><a href="#creating-host-target">2 Creating Host Target</a></li>
<li><a href="#installing-developer-kit">3 Installing Developer Kit</a></li>
</ul></td>
</tr>
</tbody>
</table>

Introduction
------------

[Scratchbox](http://www.scratchbox.org/) is a cross-compilation toolkit designed to make embedded Linux application development easier. It also provides a full set of tools to integrate and cross-compile an entire Linux distribution. To find out what it can do, take a look at some of the documentation.

Scratchbox is used by Maemo development platform (Nokia Internet Tablets). But it is not restricted to that use.

Scratchbox uses [QEMU](http://fabrice.bellard.free.fr/qemu/) for ARM emulation, the problem is that some ARM syscalls (242, 264, 299) are not yet implemented in QEMU. These missing syscalls can cause problems in MCS, making it impossible to compile assemblies for ARM.

[Scratchbox devkits](http://www.scratchbox.org/documentation/user/scratchbox-1.0/html/devkit.html) provide a set of tools that can be executed on the host instead of target device and thus it reduces time that is used to build packages.

Before building mono-devkit you must first create a HOST target in your scratchbox environment.

**Note:** to execute these instructions you must first have Scratchbox and Maemo SDKs installed. The instructions can be found [here](http://repository.maemo.org/stable/4.1.1/INSTALL.txt).

Creating Host Target
--------------------

First you must get and install the host-gcc tool chain running these commands outside of scratchbox:

     wget http://scratchbox.org/download/files/sbox-releases/apophis/tarball/scratchbox-toolchain-host-gcc-1.0.9-i386.tar.gz
     sudo tar xzf scratchbox-toolchain-host-gcc-1.0.9-i386.tar.gz -C /
     sudo mkdir /scratchbox/devkits/mono
     sudo chmod ugo+w /scratchbox/devkits/mono

Then login into scratchbox:

     /scratchbox/login

And execute these commands:

     [sbox-DIABLO_X86: ~] > sb-conf setup DIABLO_HOST -c host-gcc -d perl:debian-etch:maemo3-tools -t none
     [sbox-DIABLO_X86: ~] > sb-conf select DIABLO_HOST
     [sbox-DIABLO_HOST: ~] > wget -c http://repository.maemo.org/stable/4.1.1/i386/maemo-sdk-rootstrap_4.1.1_i386.tgz
     [sbox-DIABLO_HOST: ~] > sb-conf rs maemo-sdk-rootstrap_4.1.1_i386.tgz
     [sbox-DIABLO_HOST: ~] > sb-conf install --etc --devkits
     [sbox-DIABLO_HOST: ~] > apt-get update
     [sbox-DIABLO_HOST: ~] > fakeroot apt-get install maemo-sdk-runtime
     [sbox-DIABLO_HOST: ~] > fakeroot apt-get install maemo-sdk-dev

Now you should be able to build the developer kit.

Installing Developer Kit
------------------------

Login into scratchbox if you haven't done it yet:

     /scratchbox/login

Select HOST target:

     [sbox-DIABLO_X86: ~] > sb-conf select DIABLO_HOST

Then use garmono to build and install devkit:

     [sbox-DIABLO_HOST: ~] > svn co svn://anonsvn.mono-project.com/source/trunk/release/garmono
     [sbox-DIABLO_HOST: ~] > cd garmono
     [sbox-DIABLO_HOST: ~] > make clean
     [sbox-DIABLO_HOST: ~] > make maemo/devkit

To enable devkit for your ARMEL and X86 targets just type:

     [sbox-DIABLO_HOST: ~] > sb-conf setup DIABLO_ARMEL -f -d perl:debian-etch:maemo3-tools:cputransp:mono
     [sbox-DIABLO_HOST: ~] > sb-conf setup DIABLO_X86 -f -d perl:debian-etch:maemo3-tools:mono

Now you will be able to build Mono packages inside scratchbox!
