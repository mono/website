---
title: "Compiling Mono From Git"
lastmodified: '2012-04-05'
permalink: /archived/Compiling_Mono_From_Git/
redirect_from:
  - /Compiling_Mono_From_Git/
  - /Compiling_Mono_From_git/
---

Compiling Mono From Git
=======================

For full details about checking out your source code, see the [Mono page on GitHub](http://github.com/mono) page.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#checking-out-for-the-first-time">1 Checking out for the first time</a></li>
<li><a href="#switching-to-a-branch">2 Switching to a branch</a></li>
<li><a href="#updating-an-existing-checkout">3 Updating an existing checkout</a></li>
<li><a href="#building-the-source">4 Building the source</a></li>
<li><a href="#maintaining-submodules-in-mono">5 Maintaining submodules in Mono</a></li>
</ul></td>
</tr>
</tbody>
</table>

### Checking out for the first time

If you are checking out Mono from Git for the first time, you can use anonymous access:

      $ git clone git://github.com/mono/mono.git

If you are interested in contributing back submitting changes, create an account on github, add a public key (the content of your \~/.ssh/id\_rsa.pub with any title) and fork the relevant project, and clone it:

     $ git clone git@github.com:username/mono.git

After committing and pushing your changes, you can send a pull request from github so we can consider your changes.

### Switching to a branch

If you want to work with a branch instead of HEAD (master), you still need to clone the repository in the same way as explained in the previous section, but after that you would switch to it this way:

      $ (cd mono; git checkout mono-2-6) 

Beware! If you wanted to work from a branch in your fork of the mono repository, you should do (as explained on the [GitFAQ]({{ site.github.url }}/GitFAQ "GitFAQ")):

      $ (cd mono; git checkout -t origin/mono-2-6) 

### Updating an existing checkout

     $ (cd mono; git pull --rebase)

### Building the source

Then, go into the mono directory, and configure:

``` bash
  $ cd mono
  $ ./autogen.sh --prefix=/usr/local
  $ make
  $ make install
```

In order to use mcs and mono binaries during the build process which do not reside in your PATH, you can set two make variables, EXTERNAL\_MCS and EXTERNAL\_RUNTIME:

``` bash
make EXTERNAL_MCS=/foo/bar/gmcs.exe EXTERNAL_RUNTIME=/somewhere/else/mono
```

If you do not currently have mono installed, build and install mono from a recently released tarball or run:

``` bash
# ./autogen.sh must be run prior to this
make get-monolite-latest
make EXTERNAL_MCS="${PWD}/mcs/class/lib/monolite/gmcs.exe"
```

The file [README](http://github.com/mono/mono/blob/master/README) contains more information about ways to compile Mono from the repository, consult it if you need more details.

Also to get the latest changes in System.Drawing.dll and System.Windows.Forms.dll you also need configure, build and install libgdiplus.

      $ cd libgdiplus
      $ ./autogen.sh --prefix=/usr/local
      $ make
      $ make install

If you use a different prefix then you may need to adjust your LD\_LIBRARY\_PATH environment variable to ensure libgdiplus.so can be loaded.

      export LD_LIBRARY_PATH=/your/own/prefix:$LD_LIBRARY_PATH

### Maintaining submodules in Mono

Please see [Git Submodule Maintenance]({{ site.github.url }}/Git_Submodule_Maintenance "Git Submodule Maintenance")

