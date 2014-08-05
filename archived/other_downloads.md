---
title: "Other Downloads"
lastmodified: '2009-09-30'
redirect_from:
  - /Other_Downloads/
---

Other Downloads
===============

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#binaries-for-other-platforms-unsupported">1 Binaries for other platforms (unsupported)</a>
<ul>
<li><a href="#solaris">1.1 Solaris</a></li>
<li><a href="#nokia--maemo">1.2 Nokia / Maemo</a></li>
<li><a href="#snapshots">1.3 Snapshots</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Binaries for other platforms (unsupported)
==========================================

Solaris
-------

Blastwave.org Blastwave is a collection of binary packages of free software that can be automatically installed to a Solaris computer (sparc or x86) over the network. It will even install missing dependencies.

-   Mono on Solaris SPARC and x86. Use pkg-get to install it. You may need to read the HOW-TO to setup pkg-get.

Nokia / Maemo
-------------

-   Mono on Maemo for the Nokia 770 and 800. For help with the installation, see [Mono for Nokia]({{ site.github.url }}/Maemo)
    -   [Mono 1.2.5 Runtime Single Click Install](http://go-mono.com/maemo/pool/bora/mono/mono.install)
    -   [Mono 1.2.3.1 Scratchbox developer kit](http://go-mono.com/maemo/scratchbox-devkit-mono-1.2.3.1-2-i386.tar.gz)

Snapshots
---------

[Daily test tarballs](http://www.go-mono.com/daily/) of the SVN repository are made almost daily. These are not guaranteed to build, but have undergone a minimum sanity check in that the snapshot of the SVN repository from which they were generated was buildable on the test machine. The time when they become available is not predictable, and there are sometimes gaps of several days.

The [AnonSVN]({{ site.github.url }}/AnonSVN) mirrors are updated in real time.

[Snapshot RPMs](http://mono.ximian.com/monobuild/snapshot/download-trunk/) built from trunk get updated every hour. These contain most of the packages we ship but very well may be broken.

[Daniel Nauck](mailto:dna@mono-project.de) maintains a Ubuntu VMware image with the latest Mono from svn head. You can find it at [mono-project.de](http://www.mono-project.de/mono-image/).
User/password = mono/mono

The vm is setup for German, but the English language packages are installed as well. To change the vm to English:

-   On GDM Login Screen, click on the left bottom icon "Einstellungen".
-   Chose the menu entry "Sprache wählen...".
-   Select in the dropdown list English and click on the button "Sprache ändern"
-   Click "Ja"
-   Everything should be in English.

Then change the keyboard to English.

-   Click System -\> Preferences -\> Keyboard
-   Select the Layout Tab
-   Click + Add
-   Select your language (U.S.English) from the layout drop down
-   Click on the Default radio button to make English the default layout.
-   Click Close


