---
title: Compiling Mono on Linux
---

Pick an installation directory where you want your new copy of Mono to be installed. Lets call that location PREFIX. Your Mono installation and its dependencies will be installed there. For example, I like to use the directory /mono, so I would replace PREFIX with /mono in the following discussion.

If you have more than one Mono installation (for example to keep multiple versions around), you will want to read the document on [Parallel Mono Environments](/docs/compiling-mono/parallel-mono-environments/) on how to keep your various Mono installations separate.

**It is strongly advised not to install Mono from source in /usr as it might conflict with Mono as installed by the Mono package.**

Building Mono
=============

Building Mono is a very simple process as Mono has very few external dependencies.

On some distribution you will need to install some development tools which are not installed by default.

Debian based distributions
--------------------------

On Debian based distribution you should guarantee that some packages are installed in order for the compilation process to succeed.
This can be done easily by using *apt-get*:

```bash
  $ sudo apt-get install git autoconf libtool automake build-essential mono-devel gettext
```

Building Mono from a Release Package
------------------------------------

Mono releases are distributed as .tar.gz packages from the Mono web site. Once you have your dependencies installed all you need to do is run the following command where VERSION is the package version number and PREFIX is your installation prefix:

``` bash
  $ tar xvf mono-VERSION.tar.gz
  $ cd mono-VERSION
  $ ./configure --prefix=PREFIX
  $ make
  $ make install
```

By the end of this process, you will have Mono installed on your PREFIX directory.

Building Mono From a Git Source Code Checkout
---------------------------------------------

To build Mono from a Git Source Code checkout, you will want to have the official Mono installed on the system, as the build requires a working C\# compiler to run. Once you do this, run the following commands, remember to replace PREFIX with your installation prefix that you selected:

``` bash
PATH=$PREFIX/bin:$PATH
git clone https://github.com/mono/mono.git
cd mono
./autogen.sh --prefix=$PREFIX
make
make install
```

Note that you have to have git installed your distribution.

One Stop Shop Build Script (Debian)
-----------------------------------

If you are on a Debian system (Debian/Ubuntu) and you just want to install Mono without thinking too much, just cut and paste the following script, and enter your root password when requested:

``` bash
#!/bin/bash

PREFIX=$@

if [ -z $PREFIX ]; then
  PREFIX="/opt/mono/"
fi

# Ensure you have write permissions to /opt/mono/
sudo mkdir $PREFIX
sudo chown -R `whoami` $PREFIX

# Ensure that all required packages are installed.
sudo apt-get install git autoconf libtool automake build-essential mono-devel gettext

PATH=$PREFIX/bin:$PATH
git clone https://github.com/mono/mono.git
cd mono
./autogen.sh --prefix=$PREFIX
make
make install
```

This will by default install mono in /opt/mono/, but you can specify in the first argument of the script the directory of installation. ~/.mono/ might be a nice target as well.

After installing it successfully, read the notes on [Parallel Mono environments](/docs/compiling-mono/parallel-mono-environments/) on how to use the installed mono instance.
