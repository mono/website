---
title: Cross-compiling Mono for Windows
redirect_from:
  - /Cross-compiling_Mono_for_Windows/
  - /Compiling_Mono_for_Windows/
---

Starting with Mono from svn revision 109671 (or version 2.2+) it is now possible to compile Mono for Windows on your Linux machine. To do it you will need to provide a [MinGW](http://mingw.org/) environment for your Linux distribution and several compile and runtime dependencies for Mono. Distribution-specific instructions follow below. Once you have your MinGW environment set up, go to your Mono source directory and type (make sure that your directory has NO files from previous compilations):

    ./build-mingw32.sh

To get an overview of options available for the above script, type

    ./build-mingw32.sh -h

The above command assumes that your cross-compilation environment is installed in the `/opt/cross/i386-mingw32msvc` directory and that the MinGW target is `i386-mingw32msvc`.

If your environment is in another directory, you can specify it by passing the full path using the `-d PATH` argument to the above script. If your MinGW uses a different target, please pass it to the script in the `-m MINGWTARGET` argument. Running the script with the `-h` argument will give short usage information. The above arguments work with Mono 2.8 or newer.

Mono 2.10 (as of Feb 8 2011, [git commit 9d4e229](https://github.com/mono/mono/commit/9d4e229c2e5a378f3186ef6ee10a320f5d71a85d)) or 2.11 (master on Feb 8 2011, [git commit a8362f1](https://github.com/mono/mono/commit/a8362f1a1469ae47ff9b21116f8272f145c115f1)) added two more command line options. First of them, `-e DIR`, lets you put the packages needed for cross-compiling in a location different to the one `mingw32` is installed in. The second new option is `-p PREFIX` which lets you specify the directory in which Mono will be installed on Windows. The build script will create a subdirectory at that location specific to the current build.

If you have an older version of Mono, you should pass the cross-compile environment path as the first argument to the script and the MINGW target as the second argument.

Building will take some time since the mono runtime needs to be built twice (once for the target Windows platform, the second time to build the compilers and class libraries). Once the process is done, you will find a zip file in the same directory where the build script lives with the name following the pattern:

    mono-win32-X.Y-BRANCH-REVISION

where:

    * X.Y - major.minor Mono version
    * BRANCH - Mono branch or tarball if svn branch could not have been detected
    * REVISION - Mono svn revision or rUNKNOWN if it wasn't possible to determine the revision number

The zip file must be unpacked in the root directory of any Windows disk drive and you will be able to find the Mono installation in the directory whose name follows the pattern:

    Z:\mono-X.Y-BRANCH-REVISION

or, if you used the `-p PREFIX` option,

    Z:\PREFIX\mono-X.Y-BRANCH-REVISION

where:

    * Z - the letter identifying the Windows disk drive where you unpacked the zip
    * X.Y - major.minor mono version
    * BRANCH - Mono branch or tarball if svn branch could not have been detected
    * REVISION - Mono svn revision or rUNKNOWN if it wasn't possible to determine the revision number

If you want to permanently put a path to the Mono bin directory from the above package in your global `PATH` environment variable, but you're worried you will have to update it every time you compile new package from another Mono revision, do not despair - there is a way to create symlinks on Windows 2000 onwards if your disk is formatted with the NTFS filesystem. Install [this utility](http://technet.microsoft.com/en-us/sysinternals/bb896768.aspx) and issue the following command from the cmd prompt:

    junction Z:\mono-trunk Z:\mono-X.Y-BRANCH-REVISION

where the elements of the path are described above. After that you can add the `z:\mono-trunk\bin` path to your system `PATH` variable and just update the symlink every time you install new version of Mono built from trunk.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#list-of-packages-needed-for-cross-compiling">1 List of packages needed for cross-compiling</a></li>
<li><a href="#distribution-specific-instructions">2 Distribution-specific instructions</a>
<ul>
<li><a href="#opensuse">2.1 openSUSE</a></li>
<li><a href="#ubuntu---debian-">2.2 Ubuntu ( / Debian? )</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

### List of packages needed for cross-compiling

Not all of the packages are strictly necessary, but having them around in your mingw environment can't hurt. If you're not using any distribution-specific package, you will need to unpack the packages in the top-level directory of your MinGW installation (e.g. `/opt/cross/i386-mingw32msvc`):

    * glib
    * glib-dev 
    * zlib binaries
    * zlib devel package
    * pkg-config
    * libpng
    * libpng-dev
    * libtiff
    * libtiff-dev
    * libjpeg
    * libjpeg-dev
    * giflib-bin
    * giflib-lib
    * freetype
    * freetype-dev
    * fontconfig
    * fontconfig-dev
    * expat
    * proxy-libintl
    * gettext-runtime
    * gettext-runtime-dev

The list is valid as of `April 2nd, 2010`. You can substitute the above packages with newer versions (if supported by Mono).

### Distribution-specific instructions

#### openSUSE

With openSUSE all you need to do in order to satisfy all the requirements is to add two repositories using Yast:

    * http://download.opensuse.org/repositories/Mono:/Community/
    * http://download.opensuse.org/repositories/CrossToolchain:/mingw/

Note that the above URLs do **NOT** specify the final repository - you need to visit them and pick the version of openSUSE you are using (e.g. [http://download.opensuse.org/repositories/Mono:/Community/openSUSE\_10.3/](http://download.opensuse.org/repositories/Mono:/Community/openSUSE_10.3/)) After configuring and refreshing the repositories in Yast, proceed to install the following packages:

    * cross-mingw-gcc
    * cross-mono-build-dependencies

And that's it! You're set to compile as described above!

#### Ubuntu ( / Debian? )

Install the packages mingw32, mingw32-binutils and mingw32-runtime.

### Cross compiling from OSX

See this blog post: http://blog.worldofcoding.com/2014/05/cross-compiling-c11-without-going-madder.html#windows
