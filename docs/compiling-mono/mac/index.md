---
title: Compiling Mono on macOS
redirect_from:
  - /Compiling_Mono_on_macOS/
---

Pick an installation directory where you want your new copy of Mono to be installed. Lets call that location PREFIX. Your Mono installation and its dependencies will be installed there. For example, I like to use the directory /opt/mono, so I would replace PREFIX with /opt/mono in the following discussion.

If you have more than one Mono installation (for example to keep multiple versions around), you will want to read the document on [Parallel Mono Environments](/docs/compiling-mono/parallel-mono-environments/) on how to keep your various Mono installations separate.

**It is strongly advised not to install Mono from source in /usr as it might conflict with Mono as installed by the Mono package.**

## Building Mono

Building Mono is a very simple process as Mono has very few external dependencies.

On Mavericks and later versions you will need to install some tools that are no longer part of the developer SDK, but luckily this is a very simple process.

### Building Mono Dependencies

Mono uses GNU autoconf, automake and libtool. You need to install those in your path, e.g. through [Homebrew](https://brew.sh)

``` bash
brew install autoconf automake libtool pkg-config cmake python3
```

------------------------------------------------------------------------

Mono releases are distributed as .tar.xz packages from the Mono web site. Once you have your dependencies installed all you need to do is run the following command where VERSION is the package version number and PREFIX is your installation prefix:

``` bash
PREFIX=/usr/local
VERSION=4.2.1
tar xvf mono-$VERSION.tar.xz
cd mono-$VERSION
./configure --prefix=$PREFIX --disable-nls --build=i386-apple-darwin11.2.0
make
make install
```

If you wish to compile Mono in 64 bit mode instead use this to configure the build:

``` bash
./configure --prefix=$PREFIX --disable-nls
```

By the end of this process, you will have Mono installed on your PREFIX directory.

### Building Mono From a Git Source Code Checkout

To build Mono from a Git Source Code checkout, you will want to have the official Mono installed on the system, as the build requires a working C# compiler to run. Once you do this, run the following commands, remember to replace PREFIX with your installation prefix that you selected:

``` bash
PATH=$PREFIX/bin:$PATH
git clone https://github.com/mono/mono.git
cd mono
./autogen.sh --prefix=$PREFIX --disable-nls
make
make install
```

To build Mono in 32 bit mode instead use this to configure the build:

``` bash
CFLAGS="-m32 -arch i386" LDFLAGS="-m32 -arch i386" ./autogen.sh --host=i386-apple-darwin13.0.0 --build=i386-apple-darwin13.0.0 --prefix=$PREFIX --disable-nls
```

### One Stop Shop Build Script

If you just want to install Mono without thinking too much, just copy and paste the following script, and enter your root password when requested:

``` bash
PREFIX=/usr/local

# Ensure you have write permissions to /usr/local
mkdir $PREFIX
sudo chown -R `whoami` $PREFIX

PATH=$PREFIX/bin:$PATH

# Download and build dependencies
mkdir ~/Build
cd ~/Build
curl -O https://ftp.gnu.org/gnu/m4/m4-1.4.17.tar.gz
curl -O https://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz
curl -O https://ftp.gnu.org/gnu/automake/automake-1.14.tar.gz
curl -O https://ftp.gnu.org/gnu/libtool/libtool-2.4.2.tar.gz

for i in *.tar.gz; do tar xzvf $i; done
for i in */configure; do (cd `dirname $i`; ./configure --prefix=$PREFIX && make && make install); done

git clone https://github.com/mono/mono.git
cd mono
./autogen.sh --prefix=$PREFIX --disable-nls
make
make install
```

## Troubleshooting

If you receive an error like:

``` bash
ld: warning: in /usr/local/lib/libiconv.dylib, file was built for unsupported file format which is not the architecture being linked (i386)
```

This means that configure was able to resolve some optional dependencies in your environment (gettext or glib primarily) that have been compiled for 64-bit when you are building a 32-bit mono or vice-versa. To resolve this either rebuild the dependency to be a universal binary or build a mono that matches your dependencies.
