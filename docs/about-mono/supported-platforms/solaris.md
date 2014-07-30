---
title: Solaris
redirect_from:
  - /Mono:Solaris/
---

Mono supports Solaris on [SPARC]({{ site.github.url }}/docs/about-mono/supported-platforms/sparc/), [x86]({{ site.github.url }}/docs/about-mono/supported-platforms/x86/) and [x86-64]({{ site.github.url }}/docs/about-mono/supported-platforms/amd64/) architectures.

Packages for Mono on Solaris/SPARC are available from our [Download]({{ site.github.url }}/download/) page.

Mono is also available as part of [Nexenta](http://www.nexenta.com), the Debian-based [OpenSolaris](http://www.opensolaris.org) distribution.

Solaris: Special Considerations
-------------------------------

Solaris has a buggy tar implementation, so make sure you extract the mono sources using GNU tar. Otherwise you might get a 'your mono distribution is incomplete' error.

Make sure you use GNU make, not sun's make. Otherwise you will get an error message like:

` make: Fatal error in reader: Makefile, line 2: Unexpected end of line seen`

On solaris, some tools like 'ar' are not in the default PATH, but in /usr/sfw/bin. The symptom is a build failure like this:

` false cru .libs/libmonogc.a .libs/allchblk.o .libs/alloc.o .libs/blacklst.o .libs/checksums.o .libs/dbg_mlc.o .libs/dyn_load.o .libs/finalize.o .libs/gc_dlopen.o .libs/gcj_mlc.o .libs/headers.o .libs/malloc.o .libs/mallocx.o .libs/mark.o .libs/mark_rts.o .libs/misc.o .libs/new_hblk.o .libs/obj_map.o .libs/os_dep.o .libs/pcr_interface.o .libs/ptr_chck.o .libs/real_malloc.o .libs/reclaim.o .libs/solaris_pthreads.o .libs/solaris_threads.o .libs/specific.o .libs/stubborn.o .libs/typd_mlc.o .libs/backgraph.o .libs/win32_threads.o .libs/pthread_support.o .libs/pthread_stop_world.o .libs/darwin_stop_world.o .libs/mach_dep.o make[3]: *** [libmonogc.la] Error 1`

Solaris has a tool named 'mcs' which is not our mcs compiler. The symptom is a message like this:

` gmake[5]: Entering directory '/home/pablo/mono/trunk/mcs' usage: mcs [-cdpVz] [-a string] [-n name] file ... gmake[6]: *** [build/deps/basic-profile-check.exe] Error 1`

Some glib packages on solaris have been compiled with sun's C compiler, so they are including the '-mt' argument in gthread-2.0.pc. This causes the build to fail with gcc:

``  /bin/bash ../../libtool --quiet --tag=CC   --mode=compile gcc -DHAVE_CONFIG_H -I. -I../.. -I../.. -I../../mono -I../../libgc/include -mt -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -DGC_SOLARIS_THREADS -DGC_SOLARIS_PTHREADS -D_REENTRANT -D_POSIX_PTHREAD_SEMANTICS -DUSE_MMAP -DUSE_MUNMAP -DPLATFORM_SOLARIS -D_FILE_OFFSET_BITS=64 -D_XOPEN_SOURCE=500 -D__EXTENSIONS__ -D_XOPEN_SOURCE_EXTENDED=1  -g -O2 -fno-strict-aliasing -g -Wall -Wunused -Wmissing-prototypes -Wmissing-declarations -Wstrict-prototypes  -Wmissing-prototypes -Wnested-externs -Wpointer-arith -Wno-cast-qual -Wcast-align -Wwrite-strings -Wno-char-subscripts -MT mono-hash.lo -MD -MP -MF .deps/mono-hash.Tpo -c -o mono-hash.lo mono-hash.c cc1: error: invalid option `t' ``

To build Mono on Solaris/x86-64, you should install the latest Boehm GC from the Boehm web site and then you can build Mono like this:

``` bash
$ export PKG_CONFIG_PATH=/usr/lib/amd64/pkgconfig
$ export CC='gcc -m64'
$ export AS='as -64'
$ ./configure --with-gc=system [...]
```

Similarly, depending on the build tools used some other variables (MAKE=gmake RANLIB=granlib AR=gar STRIP=gstrip) are necessary too but those are not specific to the amd64 target.

Andreas posted some generic compilation instructions for Solaris 10/x86 [here](http://lists.ximian.com/pipermail/mono-list/2007-January/034101.html)

Known bugs
----------

-   Solaris 9 and earlier do not have the 'trunc' math library function, which causes some checked conversions to succeed on solaris, when they should fail, like this one:

<!-- -->

     checked {
        double d = -1;
        ulong ul = (ulong)d;
      }
     

This causes the mini/exceptions.exe regression test to fail on sol 8-9.

