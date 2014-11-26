---
title: "Tao autotools:Installation"
lastmodified: '2006-01-26'
redirect_from:
  - /Tao_autotools:Installation/
---

Tao autotools:Installation
==========================

// Download tao

    wget http://colliertech.com/downloads/tao/tao-current.tbg

// Unpack Tao

    gpg -d tao-current.tbg | tar xvj

// Create a convenience link (symbolic):

    ln -s tao-*/ tao-current

// change working directory to the unpacked directory

    cd tao-current

// The --prefix argument to configure tells the build tools where to<br/>
 // install binaries, libraries and scripts. The default is /usr/local.<br/>
 // Mono's default is often /usr/lib/mono. You might want to specify this<br/>
 argument to the // configure script as I have done below. It is recommended that you use a // directory under your \$HOME, since it interferes less with your operating // system's directory structure.\</pre\>

// First, make the directory:

    mkdir -p $HOME/opt

// Now configure the package with a prefix in your home directory:

    ./configure --prefix=$HOME/opt

// You are now ready to build the source. It takes a while. Get a cup of

// coffee or something while it's running. Ignore the XML warnings

    make

// You can now install the package to \$HOME/opt:

    make install

