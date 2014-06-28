---
layout: obsolete
title: "Compiling Mono From SVN"
lastmodified: '2010-11-11'
permalink: /old_site/Compiling_Mono_From_SVN/
redirect_from:
  - /Compiling_Mono_From_SVN/
---

Compiling Mono From SVN
=======================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#compiling-from-svn-is-obsolete">1 Compiling from SVN is obsolete</a>
<ul>
<li><a href="#checking-out-for-the-first-time">1.1 Checking out for the first time</a></li>
<li><a href="#updating-an-existing-checkout">1.2 Updating an existing checkout</a></li>
<li><a href="#building-the-source">1.3 Building the source</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Compiling from SVN is obsolete
==============================

Since the current mono version is beeing developed on github, the instructions here are obsolete. Check the [compiling Mono from Git]({{ site.github.url }}/old_site/Compiling_Mono_From_Git "Compiling Mono From Git") page instead.

For full details about checking out your source code, see: [SVN Write Access]({{ site.github.url }}/old_site/SourceCodeRepository) and the [Anonymous SVN access]({{ site.github.url }}/old_site/SourceCodeRepository) pages).

### Checking out for the first time

If you are checking out Mono from SVN for the first time, you can use anonymous access:

      $ svn co http://anonsvn.mono-project.com/source/trunk/mono
      $ svn co http://anonsvn.mono-project.com/source/trunk/mcs
      $ svn co http://anonsvn.mono-project.com/source/trunk/libgdiplus

If you have an account on the main Subversion repository, use the following command:

     $ svn co svn+ssh://USER@mono-cvs.ximian.com/source/trunk/mcs
     $ svn co svn+ssh://USER@mono-cvs.ximian.com/source/trunk/mono
     $ svn co svn+ssh://USER@mono-cvs.ximian.com/source/trunk/libgdiplus

### Updating an existing checkout

     $ (cd mono; svn update) 
     $ (cd mcs; svn update) 
     $ (cd libgdiplus; svn update)

### Building the source

Then, go into the mono directory, and configure:

``` bash
  $ cd mono
  $ ./autogen.sh --prefix=/usr/local
  $ make
  $ make install
```

By running autogen.sh from the mono tree, it will automatically go into the mcs/ tree and build the binaries there, so you don't have to run it in both mono and mcs trees.

This assumes that you have a working mono installation, and that there's a C\# compiler named 'mcs', and a corresponding IL runtime called 'mono'.

In order to use mcs and mono binaries during the build process which do not reside in your PATH, you can set two make variables, EXTERNAL\_MCS and EXTERNAL\_RUNTIME:

``` bash
make EXTERNAL_MCS=/foo/bar/mcs EXTERNAL_RUNTIME=/somewhere/else/mono
```

If you do not currently have mono installed, build and install mono from a recently released tarball.

The file [mono/README](http://anonsvn.mono-project.com/viewvc/trunk/mono/README) contains more information about ways to compile Mono from the repository, consult it if you need more details.

Also to get the latest changes in System.Drawing.dll and System.Windows.Forms.dll you also need configure, build and install libgdiplus.

      $ cd libgdiplus
      $ ./autogen.sh --prefix=/usr/local
      $ make
      $ make install

If you use a different prefix then you may need to adjust your LD\_LIBRARY\_PATH environment variable to ensure libgdiplus.so can be loaded.

      export LD_LIBRARY_PATH=/your/own/prefix:$LD_LIBRARY_PATH

