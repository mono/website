---
title: Compiling Mono From Tarball
redirect_from:
  - /Compiling_Mono_From_Tarball/
---

If you are building versions of Mono prior to 2.8, you will need to obtain the Mono dependencies first: [glib 2.x](http://www.gtk.org) and [pkg-config](http://www.freedesktop.org/software/pkgconfig). With Mono 2.8 it is no longer necessary to have either one of those.

**Building From Packages**

This applies to the officially [released packages](https://download.mono-project.com/sources/mono/).

Unpack the Mono runtime distribution:

    tar -xJvf mono-X.XX.tar.xz; cd mono-X.XX

Then configure, compile and install:

    ./configure --prefix=/usr/local; make; make install

This will give you a runtime, C# compiler and runtime libraries, where /usr/local is the prefix where Mono will be installed. You can change this to suit your needs.

If you are not using GNU/Linux system (such as Solaris or BSD variants), make sure to use GNU make.

