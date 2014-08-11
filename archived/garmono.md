---
title: "Garmono"
lastmodified: '2008-03-22'
redirect_from:
  - /Garmono/
---

Garmono
=======

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#introduction">1 Introduction</a></li>
<li><a href="#cygwin">2 Cygwin</a>
<ul>
<li><a href="#status">2.1 Status</a></li>
<li><a href="#building">2.2 Building</a></li>
</ul></li>
<li><a href="#linux">3 Linux</a>
<ul>
<li><a href="#status_2">3.1 Status</a></li>
<li><a href="#building_2">3.2 Building</a></li>
</ul></li>
<li><a href="#maemo">4 Maemo</a>
<ul>
<li><a href="#status_3">4.1 Status</a></li>
<li><a href="#building_3">4.2 Building</a></li>
<li><a href="#generating-packages-deb">4.3 Generating packages (.deb)</a></li>
<li><a href="#to-do">4.4 To Do</a></li>
</ul></li>
<li><a href="#future-work">5 Future Work</a></li>
</ul></td>
</tr>
</tbody>
</table>

Introduction
============

GARMONO is a build utility that allows users to build Mono from sources.

Based on the GAR ports system developed by Nick Moffitt. It downloads, builds and installs Mono from the latest tarball sources. It also includes extra functionality (tasks), for example, build packages and build dependencies.

GARMONO was first created to help build Mono on Cygwin, later it was extended to build Mono on Maemo.

Cygwin
======

Status
------

(**TODO:** Fill in this section)

Building
--------

(**TODO:** Fill in this section)

      $ make cygwin/build

Linux
=====

Status
------

GARMONO is currently broken on this platform

Building
--------

(**TODO:** Fill in this section)

      $ make linux/build
      $ make linux/build-full
      $ make linux/build-web

Maemo
=====

Status
------

The current svn rev of GARMONO targets Mono 1.9 for Maemo Chinook (or Nokia OS2008). This runs on both N800 and N810 devices. GARMONO currently builds deb packages for mono and gtk-sharp2. (**TODO:** provide a list of deb files)

Building
--------

Before create packages you must first install [Mono Scratchbox Devkit](/Scratchbox "Scratchbox") or you ARM packages generation could fail. Assuming you have Scratchbox setup and the devkit installed follow the steps provided below:

Generating packages (.deb)
--------------------------

Inside Scratchbox, using X86 download and make garmono:

      [sbox-CHINOOK_X86: ~] > sb-conf select CHINOOK_X86
      [sbox-CHINOOK_X86: ~] > svn co svn://anonsvn.mono-project.com/source/trunk/release/garmono
      [sbox-CHINOOK_X86: ~] > cd garmono
      [sbox-CHINOOK_X86: ~] > make clean
      [sbox-CHINOOK_X86: ~] > make maemo/debs

Now switch to the ARMEL architecture and make clean, make again:

      [sbox-CHINOOK_X86: ~] > sb-conf select CHINOOK_ARMEL
      [sbox-CHINOOK_ARMEL: ~] > cd garmono
      [sbox-CHINOOK_ARMEL: ~] > make clean
      [sbox-CHINOOK_ARMEL: ~] > make maemo/debs

Once completed the .deb files will be located under the \~/garmono/cache/mono directory.

Note: For most packages, GARMONO follows pkg-mono, using the same names and conventions of Mono for Debian and Ubuntu. In fact, the scripts are based on [pkg-mono](http://pkg-mono.alioth.debian.org/). However, some packages have been combined or modified so it is not fully compatible with pkg-mono. (**TODO:** add comparison)

Tip: GARMONO will automatically download, decompress and build everything needed to generate packages. However, if for some reason you are needing to test something that requires running GARMONO many times, you can download the src package into garmono/cache. GARMONO checks this directory prior to downloading and will not download files found in this directory.

To Do
-----

1. Update maemo-sharp bindings.

Maemo apps built against OS2007 will not run out of the box on OS2008. This link outlines the differences between the SDKs: [http://maemo.org/development/sdks/api\_changes\_between\_maemo\_3\_2\_and\_maemo\_4\_0.html](http://maemo.org/development/sdks/api_changes_between_maemo_3_2_and_maemo_4_0.html) This is important because it means the mono wrappers will need to be reworked.

See: [GAPI](/GAPI "GAPI") for how to generate C\# wrappers.

Future Work
===========

It is planned that GARMONO will also produce .debs for Ubuntu and Debian. This will allow users of those distros to be able to run the latest versions of Mono. Stay tuned...

