---
title: Parallel Mono Environments
redirect_from:
  - /Parallel_Mono_Environments/
  - /Parallel_Environments/
  - /Unstable_Mono_Environment/
---

*This document details how to run multiple Mono environments on a single system where neither environment conflicts with another.*

This assumes that you are familiar with the [compilation process for Mono](/docs/compiling-mono/).

What's the Point?
-----------------

It may be desirable to have two or more completely separate and independent Mono stacks running at the same time, for development purposes or even for running unstable applications without compromising existing installed stable versions.

For example, under SUSE 10 Mono, Banshee, F-Spot, and Tomboy (to name a few) are all installed by default, are considered "stable," and are linked against "stable" Mono libraries, such as gtk-sharp-2.x.

It is possible to run the latest versions of these applications (for example, from Mono Git) with the latest version of Mono by installing all components into a separate prefix with different environment variables.

Getting Sources
---------------

This document assumes that a distribution-installed Mono environment already exists, and is installed in a prefix other than /opt/mono.

The "parallel" environment this document details is installed from either source tarballs or from Mono Git repository.

### Source Tarballs

First, download the [Released Source Mono Tarballs](http://go-mono.com/sources-stable/). This document is concerned only with *mono*, *libgdiplus*, *gtk-sharp-1.x*, *gtk-sharp-2.x*, and *mono-tools*.

### Source from Version Control (Mono Git)

Modules in Mono Git correspond to the source tarballs above. Respective modules are: *mono, libgdiplus,* and *gtk-sharp*. If you are using Git rather than released tarballs, you must run the ./autogen.sh script to generate the autotools build system before you will be able to run ./configure commands.

Setting up a Build Environment
------------------------------

To prevent introducing elements from the existing Mono environment, a new environment must be set up. This section assumes GNOME is installed in */opt/gnome*.

Create a bash script named something like *\~/mono-dev-env*. Its contents should be similar to the following:

``` bash
#!/bin/bash
MONO_PREFIX=/opt/mono
GNOME_PREFIX=/opt/gnome
export DYLD_FALLBACK_LIBRARY_PATH=$MONO_PREFIX/lib:$DYLD_LIBRARY_FALLBACK_PATH
export LD_LIBRARY_PATH=$MONO_PREFIX/lib:$LD_LIBRARY_PATH
export C_INCLUDE_PATH=$MONO_PREFIX/include:$GNOME_PREFIX/include
export ACLOCAL_PATH=$MONO_PREFIX/share/aclocal
export PKG_CONFIG_PATH=$MONO_PREFIX/lib/pkgconfig:$GNOME_PREFIX/lib/pkgconfig
export PATH=$MONO_PREFIX/bin:$PATH
PS1="[mono] \w @ "
```

Along with setting appropriate environment variables to only use sources from /opt/mono and /opt/gnome, it also sets the Bash prompt to something other than the default, so it is easy to detect when Bash is in this alternate environment.

Finally, to enter this environment at any time, run the following from a Bash prompt:

``` bash
source ~/mono-dev-env
```

Once in the environment, sources can be built and installed.

Building Sources
----------------

*This section details only building from released source tarballs. Building from cloned Mono Git sources is similar. These instructions are based on the Mono 1.1.9.1 release. Subsequent releases should have similar build procedures, but tarball file names will change.*

### libgdiplus

Ensure you have all development packages installed for TIFF, PNG, GIF, and JPEG libraries before configuring.

``` bash
tar zxf libgdiplus-1.1.9.1.tar.gz
cd libgdiplus-1.1.9.1
./configure --prefix=/opt/mono
make
sudo make install
```

### mono

*Under SUSE 10, compilation may fail. See the fix [related to the VER\_1](http://lists.ximian.com/pipermail/mono-list/2005-October/028833.html) ld build error.*

``` bash
tar zxf mono-1.1.9.1.tar.gz
cd mono-1.1.9.1
./configure --prefix=/opt/mono
make
sudo make install
```

### gtk-sharp

``` bash
tar zxf gtk-sharp-1.0.10.tar.gz
cd gtk-sharp-1.0.10
./configure --prefix=/opt/mono
make
sudo make install
```

*Note: make may fail the first time here, for some unknown reason, running make a second time works.*

### gtk-sharp-2

``` bash
tar zxf gtk-sharp-2.3.91.tar.gz
cd gtk-sharp-2.3.91
./configure --prefix=/opt/mono
make
sudo make install
```

*Note: make may fail the first time here, for some unknown reason, running make a second time works.*

### mono-tools

``` bash
tar zxvf mono-tools-1.1.9.tar.gz
cd mono-tools-1.1.9
./configure --prefix=/opt/mono
make
sudo make install
```

Conclusion
----------

A fully independent Mono environment should now be available in /opt/mono.

### Tip: Your first build

Your first build will take place from the "mono" directory, that will do an initial build. Make sure that you "make install" after you are done, and you make sure that the new "mono" is in your path.

You can do this by running "mono --version", and it should hopefully be a different version than what you have installed, or you can use the command "which mono", and it should point to the mono version in the prefix you have chosen.

### Tip: Rebuilding Class Library Parts

It is not necessary to rebuild the entire Mono every time you make a change in a class library. For example, if you just updated something in mcs/class/System.Web, do this:

``` bash
cd mcs/class/System.Web
make && make install
```

That will build and install only that directory.

In addition, if you are developing code for the 4.0 API, you must instruct make to build and install 4.0 components, so that looks like this:

``` bash
cd mcs/class/System.Web
make PROFILE=net_4_0 && make install PROFILE=net_4_0
```

### Tip: CONFIG\_SITE

Try adding this to the script:

export CONFIG\_SITE="\$HOME/.config/automake/config.site"

and in that file writing:

test "\$prefix" = NONE && prefix=/opt/mono

This will let you avoid typing --prefix all the time

### Tip: MONO\_GAC\_PREFIX

MONO\_GAC\_PREFIX is a colon-separated list of prefixes that should be searched for GAC directories. It is particularly useful for using your OS-provided GAC within your parallel environment.

For example, if I have Gtk\# 1.0.x installed as part of my primary environment under /usr/lib/mono/gac/gtk-sharp and you want to build Gtk\# 1.0 applications using your parallel environment under /opt/mono. There are two ways to do this:

1.  Build Gtk\# 1.0.x yourself and install it with the prefix \$MONO\_PREFIX.
2.  export MONO\_GAC\_PREFIX=/usr. This will allow your parallel environment to find the Gtk\# 1.0 libraries provided by your distribution.

### BEWARE: pkgconfig fallback behaviour

If you intend to leave your MONO\_GAC\_PREFIX empty to use a local GAC, beware about the fallback behaviour of pkgconfig when it doesn't find things in your local env: it will search in /usr/ and /usr/local/ in a hardcoded way.

This may lead you to think that the configure scripts of your programs are buggy or lack some detection of libs because the build phase would be successful but you'll encounter errors at runtime.

Common Problems
---------------

Sometimes, the wrapper shell scripts for system installed programs to not write out the full path to mono. For example, while in this new environment, you might execute /usr/bin/monodevelop. Sometimes, this results in the **new** mono being used. If this is the case, you should report a bug to the developer. Likewise, even if you specify a path like /opt/mono/bin/monodevelop, the old mono may be used.

