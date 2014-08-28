---
title: "Running your first Mono application"
lastmodified: '2006-06-01'
redirect_from:
  - /Running_your_first_Mono_application/
---

Running your first Mono application
===================================

The normal way to run an application you have compiled with Mono would be to invoke it through the Mono runtime, like this:

     mono myprogram.exe

However, there are two things you can do to make it more convenient to run Mono applications on Linux. The first is to use a shell script instead of the EXE file. For example, if you had "myprogram.exe" you could create a shell script called "myprogram" that had the contents:

     #!/bin/sh /usr/bin/mono /usr/bin/myprogram.exe "$@"

When you run "myprogram," the shell will replace \$@ with any arguments you provided.

If you installed mono to a different location, substitute that for /usr/bin/mono. You can check with the "which mono" command.

Debian GNU/Linux systems also ship with the ability to launch Mono or WINE directly as appropriate when exe files are executed.

On other systems, this can be achieved manually using BINFMT_MISC to register the exe files as non-native binaries. Then, when trying to launch an exe file, the kernel will invoke the mono runtime to handle the command. BINFMT_MISC can also be used to launch Windows executables using WINE, or Java .class files using a JVM. To register exe with the kernel:

-   Become root and turn on the BINFMT_MISC module in your kernel with this command:

<!-- -->

     modprobe binfmt_misc

In addition, you may want to add that command to your /etc/rc.local boot script, so that it will be executed on boot.

-   Add the line below to your /etc/fstab file:

<!-- -->

     binfmt_misc /proc/sys/fs/binfmt_misc binfmt_misc none

-   Then, have your system run the following command on boot:

<!-- -->

     echo ':CLR:M::MZ::/usr/bin/mono:' > /proc/sys/fs/binfmt_misc/register

-   Be sure to mark your .exe files as executable in the filesystem as well:

<!-- -->

     chmod +x myprogram.exe

