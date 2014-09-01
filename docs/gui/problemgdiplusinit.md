---
title: "Problem: GDIPlusInit"
redirect_from:
  - /Problem:GDIPlusInit/
---

You are getting this error because the libgdiplus shared library can not be found on your system, this happens if you are building Mono yourself, or your operating system or packages are not properly configured.

You must ensure that you have also built the libgdiplus on your system, if you have, you must make sure that libgdiplus can be found by Mono.

Fixing this issue is an operating-system specific problem.

Linux
=====

Make sure that the file libgdiplus.so exists and that the directory containing it is listed in either the /etc/ld.so.conf file or in the LD_LIBRARY_PATH environment variable:

``` bash
$ echo $LD_LIBRARY_PATH
:/opt/mozilla/lib:/mono/lib:/usr/lib/mozilla-1.4b:/usr/local/lib
```

If the directory is not listed, you can add it like this:

``` bash
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/my/new/directory
export LD_LIBRARY_PATH
```

If this still fails, it might be possible that one of the libraries that libgdiplus depends on does not exist, you can try to determine this using:

``` bash
$ ldd /path/to/libgdiplus.so
        linux-gate.so.1 =>  (0xffffe000)
        libexpat.so.1 => /usr/lib/libexpat.so.1 (0xb7e3c000)
        libXau.so.6 => /usr/X11R6/lib/libXau.so.6 (0xb7e39000)
        libXdmcp.so.6 => /usr/X11R6/lib/libXdmcp.so.6 (0xb7e34000)
        libglib-2.0.so.0 => /opt/gnome/lib/libglib-2.0.so.0 (0xb7dae000)
        libfontconfig.so.1 => /usr/lib/libfontconfig.so.1 (0xb7d74000)
        libfreetype.so.6 => /usr/lib/libfreetype.so.6 (0xb7d07000)
        libXrender.so.1 => /usr/X11R6/lib/libXrender.so.1 (0xb7cff000)
        libX11.so.6 => /usr/X11R6/lib/libX11.so.6 (0xb7c08000)
        libXext.so.6 => /usr/X11R6/lib/libXext.so.6 (0xb7bfa000)
        libtiff.so.3 => /usr/lib/libtiff.so.3 (0xb7ba6000)
        libjpeg.so.62 => /usr/lib/libjpeg.so.62 (0xb7b86000)
        libgif.so.4 => /usr/lib/libgif.so.4 (0xb7b7e000)
        libpng12.so.0 => /usr/lib/libpng12.so.0 (0xb7b3f000)
        libz.so.1 => /usr/lib/libz.so.1 (0xb7b2d000)
        libexif.so.12 => /usr/lib/libexif.so.12 (0xb7b0a000)
        libm.so.6 => /lib/libm.so.6 (0xb7ae5000)
        libpthread.so.0 => /lib/libpthread.so.0 (0xb7ad0000)
        libc.so.6 => /lib/libc.so.6 (0xb79b0000)
        libdl.so.2 => /lib/libdl.so.2 (0xb79ac000)
        libSM.so.6 => /usr/X11R6/lib/libSM.so.6 (0xb79a3000)
        libICE.so.6 => /usr/X11R6/lib/libICE.so.6 (0xb798b000)
        /lib/ld-linux.so.2 (0x80000000)
```

If one of those shows that it can not be resolved, you have found your problem.

``` bash
LD_DEBUG=libs mono program.exe
```

Or you can try:

``` bash
MONO_LOG_LEVEL="debug" MONO_LOG_MASK="dll" mono glue.exe
```

MacOS X
=======

Make sure that the file libgdiplus.dylib exists and that the directory containing it is listed in the DYLD_LIBRARY_PATH environment variable.

You might want to try the otool command to find if there are any missing dependencies (otool is available in the devl package)

``` bash
otool -L /full/path/to/libgdiplus.dylib
```

Windows
=======

We have never heard about a problem on Windows with libgdiplus.

