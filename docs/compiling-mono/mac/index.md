---
title: Compiling Mono on Mac OS X
redirect_from:
  - /Compiling_Mono_on_OSX/
---

Pick an installation directory where you want your new copy of Mono to be installed. Lets call that location PREFIX. Your Mono installation and its dependencies will be installed there. For example, I like to use the directory /mono, so I would replace PREFIX with /mono in the following discussion.

If you have more than one Mono installation (for example to keep multiple versions around), you will want to read the document on [Parallel Mono Environments](/docs/compiling-mono/parallel-mono-environments/) on how to keep your various Mono installations separate.

**It is strongly advised not to install Mono from source in /usr as it might conflict with Mono as installed by the Mono package.**

Building Mono
=============

Building Mono is a very simple process as Mono has very few external dependencies.

On Mavericks and Mountain Lion you will need to install some tools that are no longer part of the developer SDK, but luckily this is a very simple process.

Building Mono Dependencies
--------------------------

Mono use GNU autoconf, automake and libtool. You need to install those in your path, we suggest that you install these on the same directory that you will install Mono on. You can cut and paste the following script to get these dependencies built:

``` bash
PREFIX=/usr/local

# Ensure you have write permissions to /usr/local
mkdir $PREFIX
sudo chown -R `whoami` $PREFIX

# Downlaod and build dependencies
mkdir ~/Build
cd ~/Build
curl -O ftp://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz
curl -O ftp://ftp.gnu.org/gnu/automake/automake-1.14.tar.gz
curl -O ftp://ftp.gnu.org/gnu/libtool/libtool-2.4.2.tar.gz

for i in *.tar.gz; do tar xzvf $i; done
for i in */configure; do (cd `dirname $i`; ./configure --prefix=$PREFIX && make && make install); done
```

Building Mono from a Release Package
------------------------------------

Mono releases are distributed as .tar.gz packages from the Mono web site. Once you have your dependencies installed all you need to do is run the following command where VERSION is the package version number and PREFIX is your installation prefix:

``` bash
  $ tar xvf mono-VERSION.tar.gz
  $ cd mono-VERSION
  $ ./configure --prefix=PREFIX --enable-nls=no --build=i386-apple-darwin11.2.0
  $ make
  $ make install
```

If you wish to compile Mono in 64 bit mode instead use this:

``` bash
  $ tar xvf mono-XXX.tar.gz
  $ cd mono-XXX
  $ ./configure --prefix=PREFIX --enable-nls=no
  $ make
  $ make install
```

By the end of this process, you will have Mono installed on your PREFIX directory.

Building Mono From a Git Source Code Checkout
---------------------------------------------

To build Mono from a Git Source Code checkout, you will want to have the official Mono installed on the system, as the build requires a working C# compiler to run. Once you do this, run the following commands, remember to replace PREFIX with your installation prefix that you selected:

``` bash
PATH=$PREFIX/bin:$PATH
git clone https://github.com/mono/mono.git
cd mono
CC='cc -m32' ./autogen.sh --prefix=$PREFIX --disable-nls --build=i386-apple-darwin11.2.0
make
make install
```

To build Mono in 64 bit mode instead use:

``` bash
PATH=$PREFIX/bin:$PATH
git clone https://github.com/mono/mono.git
cd mono
./autogen.sh --prefix=$PREFIX --disable-nls
make
make install
```

One Stop Shop Build Script (32-bit)
-----------------------------------

If you are on Mavericks and you just want to install Mono without thinking too much, just cut and paste the following script, and enter your root password when requested:

``` bash
PREFIX=/usr/local

# Ensure you have write permissions to /usr/local
mkdir $PREFIX
sudo chown -R `whoami` $PREFIX

PATH=$PREFIX/bin:$PATH

# Downlaod and build dependencies
mkdir ~/Build
cd ~/Build
curl -O ftp://ftp.gnu.org/gnu/m4/m4-1.4.17.tar.gz
curl -O ftp://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz
curl -O ftp://ftp.gnu.org/gnu/automake/automake-1.14.tar.gz
curl -O ftp://ftp.gnu.org/gnu/libtool/libtool-2.4.2.tar.gz

for i in *.tar.gz; do tar xzvf $i; done
for i in */configure; do (cd `dirname $i`; ./configure --prefix=$PREFIX && make && make install); done

git clone https://github.com/mono/mono.git
cd mono
CC='cc -m32' ./autogen.sh --prefix=$PREFIX --disable-nls --build=i386-apple-darwin11.2.0
make
make install
```

Troubleshooting
===============

If you receive an error like:

``` bash
ld: warning: in /usr/local/lib/libiconv.dylib, file was built for unsupported file format which is not the architecture being linked (i386)
```

This means that configure was able to resolve some optional dependencies in your environment (gettext or glib primarily) that have been compiled for 64-bit when you are building a 32-bit mono or vice-versa. To resolve this either rebuild the dependency to be a universal binary or build a mono that matches your dependencies.
