---
layout: obsolete
title: "Mono:ARM"
permalink: /old_site/Mono:ARM/
redirect_from:
  - /Mono:ARM/
---

Mono:ARM
========

Fully bootstrapping on little endian Linux system. Should also work on big endian systems.

Mono today runs on the [iPhone]({{site.github.url}}/old_site/Mono:Iphone "Mono:Iphone"), Android, it is known to run on ARM desktop machines, the Nokia 770, Nokia 800 (OS version 2005 and 2006) and the Linksys NSLU2.

It also supports the new ARM ABI (gnueabi also known as armel).

It can run all of our software up to Gtk\# and the startup time is outstanding on the Nokia 770.

Work to bind the Hildon widget set is happening [here](http://maemo.ndesk.org/)

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#packages-maemo">1 Packages: Maemo</a></li>
<li><a href="#building-mono">2 Building Mono</a>
<ul>
<li><a href="#with-scratchbox">2.1 With ScratchBox</a></li>
<li><a href="#compiling-on-the-device">2.2 Compiling on the device</a></li>
</ul></li>
<li><a href="#screenshots-and-movies">3 Screenshots and Movies</a></li>
<li><a href="#techincal-details">4 Techincal Details</a></li>
</ul></td>
</tr>
</tbody>
</table>

Packages: Maemo
===============

See the [Maemo]({{site.github.url}}/old_site/Maemo "Maemo") page for packages for the Maemo platform.

Building Mono
=============

The mono build includes two major parts: the C-based code and the C\# code. The C\# code is compiled using mcs which is itself written in C\# so both the compiler and some of the base libraries are built multiple times.

Building Mono natively on an ARM box can be a slow process due to the size of the Mono code base, the multiple-stage process and the usually slow processors and configurations of such boxes.

We recommend that you cross-compile using Scratchbox on Linux for the unmanaged code, and you use your native host to build the managed code.

With ScratchBox
---------------

We recommend that you use [ScratchBox](http://www.scratchbox.org/) to do the build. Mono is made up of two chunks of code:

-   **native code** for the virtual execution system, garbage collector and other unmanaged bits, and
-   **managed code** this includes the C\# compiler, assembler, class libraries and so on.

-   [Setup ScratchBox](http://maemo.org/platform/docs/tutorials/Maemo_tutorial.html#Installation) an easy to use installer is [here](http://repository.maemo.org/stable/scirocco/)

You should do a two-step build: one build does the unmanaged code that targets the ARM processor, while the other build takes care of all of the managed code. To do this, you will be unpacking two trees of Mono, one on the host (usually a x86 Linux box, but any other fast box will do):

``` bash
$ mkdir host-mono
$ cd host-mono
$ tar xzf ../mono-1.xx.tar.gz
```

and the other inside the scratchbox sandbox (here ARMEL is the name given inside scratchbox to the target):

``` bash
[sbox-ARMEL: ~] > mkdir cross
[sbox-ARMEL: ~] > cd cross
[sbox-ARMEL: ~] > tar xzf ../mono-1.xx.tar.gz
```

First build is done in the the host:

``` bash
$ cd mono-1.xx
$ ./configure
$ make
$ make install DESTDIR=`pwd`/tmptree
```

Note that if you plan to use a particular installation prefix in the embedded box, you should use the same --prefix option to configure in both builds.

Now build and configure the ARM code, inside the scratchbox sandbox (note the use of the )--disable-mcs-build option to avoid building the C\# code inside the mcs/ directory):

``` bash
[sbox-ARMEL: ~] > cd arm-mono-1.xx
[sbox-ARMEL: ~] > ./configure --disable-mcs-build
[sbox-ARMEL: ~] > make 
[sbox-ARMEL: ~] > make install DESTDIR=`pwd`/tmptree
```

At this point you'll have two directories, one containing the managed code and the other containing the runtime binaries, config files and scripts. You can just merge the two or copy them both to the device. With the above steps the tmptree directory will contain a usr/loca/ dir that you'll copy to the same dir on the target. Remember to strip the binaries and remove unused assemblies to reduce disk-space requirements.

Compiling on the device
-----------------------

Compilation on the device can be very slow, so using distcc is recommended, i.e. install the cross compiler on a desktop caliber machine, install distcc on the device, configure it to use the desktop machine, then configure mono using: ./configure CC="distcc arm-linux-gnueabi-gcc" or such.

Screenshots and Movies
======================

[Gtk\# app movie on Nokia](http://www.go-mono.com/nokia/nokia-gtksharp.mov)

[Hello World!](http://www.go-mono.com/nokia/nokia-770-mono-small.jpeg)

Techincal Details
=================

Mono's port to the ARM uses the FPA mode for generating floating point instructions. Starting from mono 1.2.1 we also support the new soft-float Linux ABI as used, for example, on the nokia 770 OS 2006 (also known as armel ABI or gnueabi).

Mono must be compiled with the ARM instruction set, not with the Thumb support. P/Invoked libraries can use the Thumb instruction set, though, since the JIT has been changed to support interworking with thumb code.

