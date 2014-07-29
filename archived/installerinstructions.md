---
layout: obsolete
title: "InstallerInstructions"
lastmodified: '2007-12-10'
permalink: /archived/InstallerInstructions/
redirect_from:
  - /InstallerInstructions/
---

InstallerInstructions
=====================

First, ensure the integrity of your download. Go to a terminal window and type:

    md5sum mono-1.2.3.1_2-installer.bin

You should see the following output:

    bdef093eedcf5eef0f09ba36d3522ba9  mono-1.2.3.1_2-installer.bin

If you don't get this exact output, download the installer file and try again.

Now launch the installer after ensuring the integrity:

    chmod +x mono-1.2.3.1_2-installer.bin
    ./mono-1.2.3.1_2-installer.bin

The Mono version included in the installer should work in all supported Linux versions, including Debian. The installer contains MonoDevelop, but it requires that you have gtk 2.4 or greater installed, as well as the Gnome libraries.

If the installer fails to run in the default GTK graphics mode, try starting it with:

    ./mono-1.2.3.1_2-installer.bin --mode xwindow

or

    ./mono-1.2.3.1_2-installer.bin --mode text

If you find any issues with the installer itself (not Mono), please email me at daniel //at// bitrock //dot// com

Please CC wberrier //at// novell //dot// com as he will be maintaining the installer.

Mini FAQ
--------

**What is in the Mono installer?**

The Mono installer you can download here contains a binary distribution of Mono and a number of third-party library dependencies (for example, libgtkhtml). This all adds up to over 60Mb, but it allows the same runtime to run out-of-the-box in most Linux distributions.

**What is the purpose of the installer?**

The installer provides an alternate way for installing Mono. It is particularly useful when you have trouble installing from RPMs or compiling from source. It is also a good way for people coming from a Windows/.NET background to try Mono on Linux with minimal effort (so we can take them over to this side of the force ;)

**Does the installer interfere with other Mono installations ?**

No, the Mono installer creates installations that are self-contained. You can even have multiple Mono installations, just run the installer multiple times and select different destination directories.

**Does the installer register with the RPM database?**

Not currently, but it will be an option in the future

**Why don't the MonoDoc and MonoDevelop Nautilus icons work?**

As long as you have the necessary libraries installed, this is no longer a problem in version 1.2.3.1. If you're using an older version, you need to restart your desktop for the .bashrc/.profile settings to take effect. See below about running Monodevelop if you're still having problems.

**Why doesn't MonoDevelop run on NLD9?**

You probably have Firefox installed, but not Mozilla. Install the Mozilla package and this should fix the problem. This requirement will not be necessary with future versions of MonoDevelop.

**The installer crashes/segfaults**

This seems to occur ramdomly on newer distributions (Kernel 2.6) when using GTK2-QT engine. This will be fixed in future releases. For now, please invoke the installer like this:

    ./mono-1.2.3.1_2-installer.bin --mode xwindow

**Why doesn't the gacutil tool work in the 1.1.8.2-1 Linux installer?**

There is a mistype in the /installationdir/bin/gacutil file. You may receive error messages such as:

    $ gacutil -l
    cannot open assembly /installationdir/lib/mono/1.0/gacutil.exe -gacdir /installationdir

Change the /installationdir/bin/gacutil file to read (note position of double quotes):

    #!/bin/sh
    exec /installationdir/bin/mono "/installationdir/lib/mono/1.0/gacutil.exe"
    -gacdir /installationdir "$@"

**I decided to not have the install modify my environment. How do I modify it myself?**

If you're using 1.2.3.1 or later, you can add "source \<installdir\>/bin/setup.sh" to either \~/.bashrc or /etc/profile (replace \<installdir\> with your install location). If you're using a previous version, add this to either of those files instead:

    export PATH=<installdir>/bin:$PATH
    export PKG_CONFIG_PATH=<installdir>/lib/pkgconfig:$PKG_CONFIG_PATH
    export MANPATH=<installdir>/share/man:$MANPATH
    export LD_LIBRARY_PATH=<installdir>/lib:$LD_LIBRARY_PATH

This will alleviate DllNotFoundExceptions as well as put the installed programs in your path.

**Why do I get System.DllNotFoundException when running MonoDevelop?**

MonoDevelop is included in the installer even though it won't work on all distros. Possible reasons for failure:

-   The gtk libraries on your distro are too old. MonoDevelop (and gtk-sharp2) requires gtk+ 2.4 or later.
-   The natives gtk-sharp2 libraries have unresolved symbols.
-   The environment necessary for runtime has not been loaded.

The solution: run a distro that has gtk+ 2.4 or above, make sure Gnome is installed, and make sure you load the settings from .bashrc which were created by the installer. (They are also listed in the above faq question). You can try to run "\<install dir\>/bin/.installer\_post\_libscan \<install dir\>" to see why libraries you are missing (of course, replace \<install dir\> with the path where you installed Mono).

If you're still getting this Exception, running monodevelop from the command line with:

    MONO_LOG_LEVEL=debug monodevelop

can give some clues. Seriously though, if you're still having problems at this point, you'd be better off using a supported distribution and installing MonoDevelop from the rpms.

**Will the installer work on x86\_64?**

No, this installer is only built to run on 32 bit systems. Some distributions have both 32 bit and 64 bit libraries and programs installed. If a 64 bit system has all the necessary 32 bit components installed, it should work, although this is not a tested scenario.

**Towards the end of the install I get this message: Syntax error: "(" unexpected**

This is a warning while detecting whether MonoDevelop has the necessary libraries. It can safely be ignored, although you may have troubles running MonoDevelop. Newer versions of Debian/Ubuntu use 'dash' instead of 'bash' for /bin/sh. The post install script that runs is bash specific, and thus fails when running under dash. This will be fixed in 1.2.6.

