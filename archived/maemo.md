---
title: "Maemo"
lastmodified: '2008-11-23'
redirect_from:
  - /Maemo/
---

Maemo
=====

Information on installing Mono, mono libraries and applications into your Nokia Internet Tablet devices based on the [Maemo](http://www.maemo.org/) platform.

Before installing Mono on your Nokia Internet Tablet device we strongly recommend that you flash the latest Nokia image by following these [instructions](http://maemo.org/maemowiki/HOWTO_FlashLatestNokiaImageWithLinux).

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#single-install-click">1 Single Install Click</a></li>
<li><a href="#packages">2 Packages</a></li>
<li><a href="#screenshots-and-movies">3 Screenshots and Movies</a></li>
<li><a href="#advanced-topics">4 Advanced Topics</a>
<ul>
<li><a href="#repositories">4.1 Repositories</a></li>
<li><a href="#building-mono-with-scratchbox">4.2 Building Mono with Scratchbox</a></li>
<li><a href="#todo">4.3 Todo</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Single Install Click
====================

The best and easiest way to set up Mono repository under your Nokia Internet Tablet device is to click this [link](http://go-mono.com/maemo/install/mono.install) in your device browser. This "Single Click Install" will add Mono apt repository.

After setting up the repository you will be able to install any additional Mono libraries by using the "Application Manager" on your device.

You could be also interested on using this links to install [Tomboy](http://go-mono.com/maemo/install/tomboy.install) and [PEditGtkSharp](http://go-mono.com/maemo/install/peditgtksharp.install).

Packages
========

The Mono scratchbox devkit includes a full Mono installation, gtk-sharp 2.4.3 and maemo-sharp 0.21.

The Mono apt repository for Nokia includes the mono runtime, gtk-sharp, maemo-sharp and Paco's peditgtksharp sample application. Look [here](http://go-mono.com/maemo/packages.list) for a full list of packages available in the repository. If you need any Mono assembly that is not available in the repository please contact us on the Mono mailing lists.

If you are interested in building Mono Scratchbox devkit from sources, please check our [Scratchbox](/Scratchbox) page.

Screenshots and Movies
======================

[Gtk# app movie on Nokia](http://www.go-mono.com/nokia/nokia-gtksharp.mov)

[Hello World!](http://www.go-mono.com/nokia/nokia-770-mono-small.jpeg)

[PEditGtkSharp running on N800](/archived/images/1/15/PEditGtkSharpN800.gif)

[A single binary running on maemo and other platforms](http://www.mdk.org.pl/2007/1/28/clone-wars)

Advanced Topics
===============

Repositories
------------

"Single Click Install" can easily set up the Mono repository for your Nokia device, but if you prefer to install it by hand or set up the repositories in the Scratchbox environment you can add this line to your /etc/apt/sources.list:

Maemo 2 for 770:

``` bash
deb http://go-mono.com/maemo mistral user
```

Maemo 4 for N800 & N810:

``` bash
deb http://go-mono.com/maemo diablo user
```

 You can also use "Application Manager-\>Tools-\>Application Catalog" to set it up.

Building Mono with Scratchbox
-----------------------------

We recommend that you use [Scratchbox](http://www.scratchbox.org/) to develop and test Mono applications for Maemo. You can find instructions about how to set up ScratchBox [here](http://repository.maemo.org/stable/4.1.1/INSTALL.txt).

After setting up Scratchbox you can easily install [mono-devkit](http://go-mono.com/maemo/scratchbox-devkit-mono-2.0.1-1-i386.tar.gz) by running these commands outside scratchbox:

``` bash
wget http://go-mono.com/maemo/scratchbox-devkit-mono-2.0.1-1-i386.tar.gz
tar xzf scratchbox-devkit-mono-2.0.1-1-i386.tar.gz -C /
```

If you want to enable devkit for your ARMEL and/or X86 targets just type:

     [sbox-DIABLO_HOST: ~] > sb-conf setup DIABLO_ARMEL -f -d perl:debian-etch:maemo3-tools:cputransp:mono
     [sbox-DIABLO_HOST: ~] > sb-conf setup DIABLO_X86 -f -d perl:debian-etch:maemo3-tools:mono

Now that the devkit is installed, a target that uses it must be created (or an existing target must be reconfigured). You can follow the instructions in [Section 2.4 of Scratchbox's Install guide](http://www.scratchbox.org/documentation/user/scratchbox-1.0/html/installdoc.html#cctarget) but select 'mono' in the devkit selection menu.

You could be also interested in create devkit from sources, the instructions can be found [here](/Scratchbox).

Todo
----

You can develop powerful applications for Nokia using Mono right now, but some tasks should be done to improve the Mono Maemo/Nokia experience. If you want to contribute one of the following tasks please contact us:

-   Improving Mono startup performance on the device.
-   Finishing and testing maemo-sharp bindings. At the moment only a few classes are unfinished. Some documentation and samples would be nice too.
-   Porting some Mono applications to Maemo. Basically what you would need to do is to change small classes to use the hildon libraries (included in maemo-sharp). This work was done in Paco's PEditGtkSharp by changing fewer than 20 lines of code. Documentation about this process is coming soon.
-   Documentation and porting guide.
-   MonoDevelop plugin to ease development. A good way would be to integrate Scratchbox and Maemo in the same way as the [Laika Eclipse plugin](http://www.cs.tut.fi/~laika/). This [link](http://www.scratchbox.org/download/files/sbox-releases/1.0/doc/ideintegration.html) also provides information about IDE integration, more information can be also founded [here](http://www.scratchbox.org/documentation/general/tutorials/idetools.html).


