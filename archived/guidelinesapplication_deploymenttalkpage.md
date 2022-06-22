---
title: "Guidelines:Application Deployment:Talkpage"
lastmodified: '2007-04-11'
redirect_from:
  - /Guidelines%3AApplication_Deployment%3ATalkpage/
---

Guidelines:Application Deployment:Talkpage
==========================================

Cheers to the authors of [this fantastic guidebook](/Guidelines:Application_Deployment) for writing Mono applications!

Being very new to formal Linux development (using autoconf and the rest), I wanted to start with **monoskel** for my project. With the newbie disclaimer, I'd like to share the problems I had in using it below, and I welcome any feedback. I'm running the latest Gentoo, and I have a working mono installation 1.1.8.3.

-   The [[tarball](http://www.go-mono.com/archive/monoskel-0.1.tar.gz%7Clinked)] appears to be bad.

<!-- -->

    The link was incorrect, it has been fixed (also above)

    Your other problems (installation) are due to a problem while running Automake on your system.

-   Checking out sources and running the prescribed command gets me an error.

<!-- -->

    $ svn co svn://anonsvn.mono-project.com/source/trunk/monoskel .
    $ ./autogen.sh --prefix=/usr/local --enable-maintainer-mode
    configure.in: no proper invocation of AM_INIT_AUTOMAKE was found.
    configure.in: You should verify that configure.in invokes AM_INIT_AUTOMAKE,
    configure.in: that aclocal.m4 is present in the top-level directory,
    configure.in: and that aclocal.m4 was recently regenerated (using aclocal).
    configure.in: installing `./install-sh'
    configure.in: installing `./missing'
    configure.in:2: installing `./config.guess'
    configure.in:2: installing `./config.sub'
    Makefile.am: installing `./INSTALL'
    Makefile.am: installing `./COPYING'
    /usr/share/aclocal/pth.m4:43: warning: underquoted definition of _AC_PTH_ERROR
      run info '(automake)Extending aclocal'
      or see http://sources.redhat.com/automake/automake.html#Extending-aclocal
    /usr/share/aclocal/pth.m4:55: warning: underquoted definition of _AC_PTH_VERBOSE
    /usr/share/aclocal/pth.m4:61: warning: underquoted definition of AC_CHECK_PTH
    /usr/share/aclocal/libmikmod.m4:11: warning: underquoted definition of AM_PATH_LIBMIKMOD
    /usr/share/aclocal/libmcrypt.m4:17: warning: underquoted definition of AM_PATH_LIBMCRYPT
    /usr/share/aclocal/imlib.m4:9: warning: underquoted definition of AM_PATH_IMLIB
    /usr/share/aclocal/imlib.m4:167: warning: underquoted definition of AM_PATH_GDK_IMLIB
    /usr/share/aclocal/gtk.m4:7: warning: underquoted definition of AM_PATH_GTK
    /usr/share/aclocal/glib.m4:8: warning: underquoted definition of AM_PATH_GLIB
    /usr/share/aclocal/audiofile.m4:12: warning: underquoted definition of AM_PATH_AUDIOFILE
    /usr/share/aclocal/ao.m4:9: warning: underquoted definition of XIPH_PATH_AO
    checking build system type... i686-pc-linux-gnu
    checking host system type... i686-pc-linux-gnu
    checking target system type... i686-pc-linux-gnu
    checking for a BSD-compatible install... /usr/bin/install -c
    checking whether build environment is sane... yes
    checking for gawk... gawk
    checking whether make sets $(MAKE)... yes
    checking whether to enable maintainer-specific portions of Makefiles... yes
    checking for a BSD-compatible install... /usr/bin/install -c
    checking for pkg-config... /usr/bin/pkg-config
    checking for csc... no
    checking for mcs... /usr/bin/mcs
    checking for mono... /usr/bin/mono
    checking pkg-config is at least version 0.9.0... yes
    checking for GTKSHARP_CFLAGS...
    checking for GTKSHARP_LIBS... -r:/usr/lib/mono/gtk-sharp/glib-sharp.dll -r:/usr/lib/mono/gtk-sharp/pango-sharp.dll -r:/usr/lib/mono/gtk-sharp/atk-sharp.dll -r:/usr/lib/mono/gtk-sharp/gdk-sharp.dll -r:/usr/lib/mono/gtk-sharp/gtk-sharp.dll
    configure: creating ./config.status
    config.status: creating Makefile
    config.status: error: cannot find input file: Makefile.in

-   Running the same command again seems to reach a successful completion.

<!-- -->

    $ ./autogen.sh --prefix=/usr/local --enable-maintainer-mode
    /usr/share/aclocal/pth.m4:43: warning: underquoted definition of _AC_PTH_ERROR
      run info '(automake)Extending aclocal'
      or see http://sources.redhat.com/automake/automake.html#Extending-aclocal
    /usr/share/aclocal/pth.m4:55: warning: underquoted definition of _AC_PTH_VERBOSE
    /usr/share/aclocal/pth.m4:61: warning: underquoted definition of AC_CHECK_PTH
    /usr/share/aclocal/libmikmod.m4:11: warning: underquoted definition of AM_PATH_LIBMIKMOD
    /usr/share/aclocal/libmcrypt.m4:17: warning: underquoted definition of AM_PATH_LIBMCRYPT
    /usr/share/aclocal/imlib.m4:9: warning: underquoted definition of AM_PATH_IMLIB
    /usr/share/aclocal/imlib.m4:167: warning: underquoted definition of AM_PATH_GDK_IMLIB
    /usr/share/aclocal/gtk.m4:7: warning: underquoted definition of AM_PATH_GTK
    /usr/share/aclocal/glib.m4:8: warning: underquoted definition of AM_PATH_GLIB
    /usr/share/aclocal/audiofile.m4:12: warning: underquoted definition of AM_PATH_AUDIOFILE
    /usr/share/aclocal/ao.m4:9: warning: underquoted definition of XIPH_PATH_AO
    checking build system type... i686-pc-linux-gnu
    checking host system type... i686-pc-linux-gnu
    checking target system type... i686-pc-linux-gnu
    checking for a BSD-compatible install... /usr/bin/install -c
    checking whether build environment is sane... yes
    checking for gawk... gawk
    checking whether make sets $(MAKE)... yes
    checking whether to enable maintainer-specific portions of Makefiles... yes
    checking for a BSD-compatible install... /usr/bin/install -c
    checking for pkg-config... /usr/bin/pkg-config
    checking for csc... no
    checking for mcs... /usr/bin/mcs
    checking for mono... /usr/bin/mono
    checking pkg-config is at least version 0.9.0... yes
    checking for GTKSHARP_CFLAGS...
    checking for GTKSHARP_LIBS... -r:/usr/lib/mono/gtk-sharp/glib-sharp.dll -r:/usr/lib/mono/gtk-sharp/pango-sharp.dll -r:/usr/lib/mono/gtk-sharp/atk-sharp.dll -r:/usr/lib/mono/gtk-sharp/gdk-sharp.dll -r:/usr/lib/mono/gtk-sharp/gtk-sharp.dll
    configure: creating ./config.status
    config.status: creating Makefile
    config.status: creating man/Makefile
    config.status: creating src/Makefile
    config.status: creating src/AssemblyInfo.cs
    config.status: creating resources/Makefile

-   At this point, **make** works, but **make install** fails:

<!-- -->

    $ make
    Making all in man
    make[1]: Entering directory `/home/ala55/src/monoskel/man'
    make[1]: Nothing to be done for `all'.
    make[1]: Leaving directory `/home/ala55/src/monoskel/man'
    Making all in resources
    make[1]: Entering directory `/home/ala55/src/monoskel/resources'
    make[1]: Nothing to be done for `all'.
    make[1]: Leaving directory `/home/ala55/src/monoskel/resources'
    Making all in src
    make[1]: Entering directory `/home/ala55/src/monoskel/src'
    /usr/bin/mcs -r:/usr/lib/mono/gtk-sharp/glib-sharp.dll -r:/usr/lib/mono/gtk-sharp/pango-sharp.dll -r:/usr/lib/mono/gtk-sharp/atk-sharp.dll -r:/usr/lib/mono/gtk-sharp/gdk-sharp.dll -r:/usr/lib/mono/gtk-sharp/gtk-sharp.dll     -resource:./../resources/dummy.txt,dummy.txt -out:monoskel.exe main.cs
    make[1]: Leaving directory `/home/ala55/src/monoskel/src'
    make[1]: Entering directory `/home/ala55/src/monoskel'
    sed -e "s|\@prefix\@|/usr/local|g" -e "s|\@pkglibdir\@|/usr/local/lib/monoskel|g" -e "s|\@bindir\@|/usr/local/bin|g" -e "s|\@MONO\@|/usr/bin/mono|g"  ./script.in > monoskel.tmp
    mv monoskel.tmp monoskel
    make[1]: Leaving directory `/home/ala55/src/monoskel'

    $ sudo make install
    Making install in man
    make[1]: Entering directory `/home/ala55/src/monoskel/man'
    make[2]: Entering directory `/home/ala55/src/monoskel/man'
    make[2]: Nothing to be done for `install-exec-am'.
    test -z "/usr/local/man/man1" || mkdir -p -- "/usr/local/man/man1"
     /usr/bin/install -c -m 644 './monoskel.1' '/usr/local/man/man1/monoskel.1'
    make[2]: Leaving directory `/home/ala55/src/monoskel/man'
    make[1]: Leaving directory `/home/ala55/src/monoskel/man'
    Making install in resources
    make[1]: Entering directory `/home/ala55/src/monoskel/resources'
    make[2]: Entering directory `/home/ala55/src/monoskel/resources'
    make[2]: Nothing to be done for `install-exec-am'.
    make[2]: Nothing to be done for `install-data-am'.
    make[2]: Leaving directory `/home/ala55/src/monoskel/resources'
    make[1]: Leaving directory `/home/ala55/src/monoskel/resources'
    Making install in src
    make[1]: Entering directory `/home/ala55/src/monoskel/src'
    make[2]: Entering directory `/home/ala55/src/monoskel/src'
    make[2]: Nothing to be done for `install-exec-am'.
    test -z "/usr/local/lib/monoskel" || mkdir -p -- "/usr/local/lib/monoskel"
     /usr/bin/install -c 'monoskel.exe' '/usr/local/lib/monoskel/monoskel.exe'
    make  install-data-hook
    make[3]: Entering directory `/home/ala55/src/monoskel/src'
    for ASM in "`/usr/bin/pkg-config --variable=Libraries "superstring-sharp"`"; do \
            /usr/bin/install -c -c -m 0755 $ASM /usr/local/lib/monoskel; \
    done;
    /usr/bin/install: too few arguments
    Try `/usr/bin/install --help' for more information.
    make[3]: *** [install-data-hook] Error 1
    make[3]: Leaving directory `/home/ala55/src/monoskel/src'
    make[2]: *** [install-data-am] Error 2
    make[2]: Leaving directory `/home/ala55/src/monoskel/src'
    make[1]: *** [install-am] Error 2
    make[1]: Leaving directory `/home/ala55/src/monoskel/src'
    make: *** [install-recursive] Error 1
