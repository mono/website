---
title: "GtkGlAreaSharp:Installation"
lastmodified: '2008-09-03'
redirect_from:
  - /GtkGlAreaSharp%3AInstallation/
---

GtkGlAreaSharp:Installation
===========================

// Download tao

    wget http://colliertech.com/downloads/tao/tao-current.tbz

// Download gtkglarea-sharp

    wget http://colliertech.com/downloads/gtkglarea-sharp/gtkglarea-sharp-current.tbz

// Download gtkglarea

    wget https://ftp.gnome.org/mirror/gnome.org/sources/gtkglarea/1.99/gtkglarea-1.99.0.tar.bz2

// Check out gtkglarea-sharp from svn

    svn co svn://anonsvn.mono-project.com/source/trunk/gtkglarea-sharp

// You should see something like this:

    $ ls -l
    total 892
    -rw-r--r--  1 cjcollier cjcollier 210089 2006-01-24 09:41 gtkglarea-1.99.0.tar.bz2
    drwxr-xr-x  9 cjcollier cjcollier   4096 2006-01-24 09:42 gtkglarea-sharp
    -rw-r--r--  1 cjcollier cjcollier 126456 2006-01-20 17:17 gtkglarea-sharp-current.tbz
    -rw-r--r--  1 cjcollier cjcollier 554694 2006-01-20 17:25 tao-current.tbz

// Unpack Tao

    tar xvjf tao-current.tbz

// Create a convenience link (symbolic):

    ln -s tao-*/ tao-current

// change working directory to the unpacked directory

    cd tao-current

// The --prefix argument to configure tells the build tools where to install binaries, libraries and scripts. The default is /usr/local. Mono's default is often /usr/lib/mono. You might want to specify this argument to the configure script as I have done below. It is recommended that you use a directory under your \$HOME, since it interferes less with your operating system's directory structure.

// First, make the directory:

    mkdir -p $HOME/opt

// Now configure the package with a prefix in your home directory:

    ./configure --prefix=$HOME/opt

// You are now ready to build the source. It takes a while. Get a cup of coffee or something while it's running. Ignore the XML warnings

    make

// You can now install the package to \$HOME/opt:

    make install

// You can now find the Tao libraries under \$HOME/opt/lib/mono/tao

// Now lets install gtkglarea

    cd ..
    tar xvjf gtkglarea-1.99.0.tar.bz2

    cd gtkglarea-1.99.0

// Once again configure with the correct prefix, make and checkinstall.

    ./configure --prefix=$HOME/opt
    make
    checkinstall

// Now onto Gtkglarea-sharp

    cd ../gtkglarea-sharp
    ./autogen.sh --prefix=$HOME/opt
    make

// I can't get checkinstall to run. // dpkg: error processing gtkglarea-sharp_0.0.2-1_i386.deb (--install): // trying to overwrite \`/root/.wapi/shared_data-camel-6-0', which is also in package tao-0.0.3

    make install

// Test using sample apps. You can run the examples by issuing the "make run" command from the example's directory

    cd examples/trackball
    make run

    cd ../rotate-buttons
    make run

    cd ../pick-object
    make run

    cd ../NeHe/Lessons/01
    make run

    cd ../02
    make run

    cd ../03
    make run

    cd ../04
    make run

    cd ../05
    make run
