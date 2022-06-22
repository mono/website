---
title: How to make a smaller Mono install
redirect_from:
  - /Small_footprint/
  - /Small/
---

The most basic mono install currently takes about 3.7 MB of disk space, this includes about 1.7 MB for the JIT and 2 MB for mscorlib.dll.

The runtime memory requirements depend on how complex the target application is. A simple application will be happy with 2 MB of writable memory for the mono process itself and 5 MB of readonly shared memory for the mmapped libraries and assemblies. At this time we suggest that the minimum system memory is 32 MB, though of course mono can be run in less memory, the total depends on the applications that run on the system.

There are several things that can be done to reduce the footprint of the mono runtime. Here are a few hints and ideas:

-   Removing unneeded features
-   Removing unneeded data
-   Compilation hints
-   Reducing code in assemblies

Removing unneeded features
--------------------------

The runtime can be configured to disable certain features. A few of this are needed only to help debugging mono, or only on some systems. The flag to use is --enable-minimal=list where list is a comma-separated list of features such as: aot, profiler, decimal, pinvoke, debug, reflection_emit, large_code, logging, com, ssa, generics. So do something like this in the mono source directory:

     ./configure --enable-minimal=aot,profiler

to remove support for AOT and profiling in the build.

The additional option --enable-small-config will further reduce the runtime memory requirements and limit some capabilities, like the maximum number of threads and the maximum code size in methods etc.

Note that some of the flags are currently not actually implemented, but it is very easy to contribute in this area: choose an unimplemented flag, patch the runtime with the proper #ifdefs, test the build with and without the feature and sumbit us a patch.

The Boehm GC can be built to suite small heaps better (usually if you want a small mono, you also have constraints on the runtime RAM usage). Change libgc/configure.in to unconditionally define SMALL_CONFIG adding the following line:

     AC_DEFINE(SMALL_CONFIG)

Removing unneeded data
----------------------

The runtime does include data to support locale handling and collation. To reduce the number of supported locales, go into the tools/locale-builder and type

     make minimal MINIMAL_LOCALES=en_US
     make install-culture-table

and then run make in the toplevel dir to build a mono runtime with support for just the en_US locale.

Several KBs can be saved by removed unneeded collation data (FIXME: add details here).

Compilation hints
-----------------

Make sure you compile with optimizations for size, this is done by typing:

     make CFLAGS=-Os

in the toplevel mono dir after configuring. This can save hundred of kilobytes. Remember to strip the installed binary, too:

     strip $prefix/bin/mono

to remove debugging and unused symbol information.

Reducing code in assemblies
---------------------------

To reduce the size of the managed assemblies, use the linker tool in the cecil git module.
