---
title: "Guide:Running Mono Applications"
lastmodified: '2012-04-14'
redirect_from:
  - /Guide:Running_Mono_Applications/
---

Guide:Running Mono Applications
===============================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#basic-usage">1 Basic usage</a></li>
<li><a href="#shell-scripts">2 Shell Scripts</a></li>
<li><a href="#registering-exe-as-non-native-binaries-linux-only">3 Registering .exe as non-native binaries (Linux only)</a></li>
<li><a href="#bundles">4 Bundles</a></li>
<li><a href="#macpack-mac-os-x-only">5 macpack (Mac OS X only)</a></li>
</ul></td>
</tr>
</tbody>
</table>

Basic usage
-----------

The normal way to run an application you have compiled with Mono would be to invoke it through the Mono runtime, like this:

    mono myprogram.exe

Mono includes two execution systems:

-   one is based on an advanced code generator (with the `mono` command); and
-   one, older and unsupported, is based on an interpreter (the `mint` command).

With the mono JIT default, not all optimizations are turned on, since some of them can be quite time consuming. However, when using it in batch mode, it is recommended that you use the `-O=all` switch to improve the code generation, for example:

    $ mono --aot -O=all library.dll

The above will leave the native version of the code in \`library.dll.so'. See the page on [AOT](/AOT "AOT") for more details.

Shell Scripts
-------------

However, there are two things you can do to make it more convenient to run Mono applications. The first is to use a shell script instead of the EXE file. For example, if you had "myprogram.exe" you could create a shell script called "myprogram" that had the contents:

    #!/bin/sh
    /usr/bin/mono /usr/lib/APPLICATION/myprogram.exe "$@"

When you run "myprogram," the shell will replace \$@ with any arguments you provided.

If you installed mono to a different location, substitute that for /usr/bin/mono. You can check with the "which mono" command.

See also [Application Deployment Layout Guidelines](/Guidelines:Application_Deployment#layout-recommendation "Guidelines:Application Deployment").

Registering .exe as non-native binaries (Linux only)
----------------------------------------------------

Because this is a Linux-specific feature, we do not recommend that developers deploy this solution, as it would limit the portability of their scripts.

In addition, this mechanism does not work as intended by the [Application Deployment Guidelines](/Guidelines:Application_Deployment "Guidelines:Application Deployment").

You can also make a systemwide change, and use binfmt to register the exe files as non-native binaries. Then, when trying to launch an exe file, the kernel will run the mono interpreter to handle the command. Binfmt can also be used to launch Windows executables using WINE, or Java .class files using a JVM. To register exe with the kernel:

-   Become root and turn on the binfmt module in your kernel with this command:

<!-- -->

    modprobe binfmt

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

Note that this doesn't change your kernel, just the modules that it loads when you boot your system. In other words, you can still upgrade your kernel without worrying about losing these changes. Similarly, you can upgrade your Mono runtime without affecting any of the invocation methods listed in this section.

Bundles
-------

*mkbundle* generates an executable program that will contain static copies of the assemblies listed on the command line.

By default only the assemblies specified in the command line will be included in the bundle. To automatically include all of the dependencies referenced, use the "--deps" command line option.

For example, to create a bundle for hello world, use the following command:

                $ mkbundle -o hello hello.exe --deps
                 Sources: 1 Auto-dependencies: True
                    embedding: /home/ed/Projects/hello_world/hello.exe
                    embedding: /mono/lib/mono/1.0/mscorlib.dll
                 Compiling:
                 as -o /tmp/tmp54ff73e6.o temp.s
                 cc -o hello -Wall temp.c `pkg-config --cflags --libs mono` /tmp/tmp54ff73e6.o
                 Done

                 $ ls -l
                 total 1481
                 -rwxr-xr-x  1 ed users 1503897 2005-04-29 11:07 hello
                 -rw-r--r--  1 ed users     136 2005-04-29 11:06 hello.cs
                 -rwxr-xr-x  1 ed users    3072 2005-04-29 11:06 hello.exe

The resulting executable is self contained and does not need the Mono runtime installed to run. However, if your application relies on libraries linked to by the mono runtime or Gtk\#, those will need to be installed (Gtk\# helper libraries come to mind).

An example with a slightly more complex application (with the same mkbundle options) which uses Gtk\# and misc assemblies:

                $ mkbundle eGuide.exe --deps -o eGuide
                Sources: 1 Auto-dependencies: True
                   embedding: /home/ed/Projects/eguide-mono/eGuide.exe
                   embedding: /mono/lib/mono/1.0/mscorlib.dll
                   embedding: /mono/lib/mono/gac/gtk-sharp/1.0.0.0__35e10195dab3c99f/gtk-sharp.dll
                 config from: /mono/lib/mono/gac/gtk-sharp/1.0.0.0__35e10195dab3c99f/gtk-sharp.dll.config
                   embedding: /mono/lib/mono/gac/glib-sharp/1.0.0.0__35e10195dab3c99f/glib-sharp.dll
                 config from: /mono/lib/mono/gac/glib-sharp/1.0.0.0__35e10195dab3c99f/glib-sharp.dll.config
                   embedding: /mono/lib/mono/1.0/System.dll
                   embedding: /mono/lib/mono/1.0/System.Xml.dll
                   embedding: /mono/lib/mono/gac/gdk-sharp/1.0.0.0__35e10195dab3c99f/gdk-sharp.dll
                 config from: /mono/lib/mono/gac/gdk-sharp/1.0.0.0__35e10195dab3c99f/gdk-sharp.dll.config
                   embedding: /mono/lib/mono/gac/pango-sharp/1.0.0.0__35e10195dab3c99f/pango-sharp.dll
                 config from: /mono/lib/mono/gac/pango-sharp/1.0.0.0__35e10195dab3c99f/pango-sharp.dll.config
                   embedding: /mono/lib/mono/gac/atk-sharp/1.0.0.0__35e10195dab3c99f/atk-sharp.dll
                 config from: /mono/lib/mono/gac/atk-sharp/1.0.0.0__35e10195dab3c99f/atk-sharp.dll.config
                   embedding: /mono/lib/mono/gac/glade-sharp/1.0.0.0__35e10195dab3c99f/glade-sharp.dll
                 config from: /mono/lib/mono/gac/glade-sharp/1.0.0.0__35e10195dab3c99f/glade-sharp.dll.config
                   embedding: /mono/lib/mono/1.0/System.DirectoryServices.dll
                   embedding: /mono/lib/mono/1.0/Novell.Directory.Ldap.dll
                   embedding: /mono/lib/mono/1.0/Mono.Security.dll
                Compiling:
                as -o /tmp/tmp713f3cc1.o temp.s
                cc -o eGuide -Wall temp.c `pkg-config --cflags --libs mono` /tmp/tmp713f3cc1.o
                Done
                
                $ ls -l
                -rwxr-xr-x  1 ed users 5022039 2005-04-29 10:52 eGuide
                -rwxr-xr-x  1 ed users   16384 2005-04-13 16:20 eGuide.exe

The -z option allows you to compress the assemblies included in the bundle, and reduce the disk space consumed.

The -c option will create a host.c file which contains the main function of the program, which you can modify before compiling and linking the application.

With -c, the further option --nomain will generate the host.c file without a main method so that you can embed it as a library in an existing native application in which you are embedding the Mono runtime yourself. Just call mono\_mkbundle\_init() before initializing the JIT to make the bundled assemblies available.

Bundles in addition support a --static flag. The --static flag causes mkbundle to generate a static executable that statically links the Mono runtime. Be advised that this option will trigger the LGPL requirement that you still distribute the independent pieces to your user so he can manually upgrade his Mono runtime if he chooses to do so. Alternatively, you can obtain a proprietary license of Mono by [contacting Xamarin](/Contact "Contact").

macpack (Mac OS X only)
-----------------------

*macpack* is a tool that must be used to bundle Cocoa\# applications into Double-Clickable, Finder friendly, bundles on Mac OS X. It bundles static libraries and resources, as well as generates a basic info.plist into the .app bundle.

For example the following commands are used to build the CurrencyConverter.exe into an application bundle:

    $ mcs -g -debug+ CurrencyConverter.cs -out:CurrencyConverter.exe -pkg:cocoa-sharp
    $ rm -rf CurrencyConverter.app
    $ macpack -m:2 -o:.  -r:/Library/Frameworks/Mono.framework/Versions/Current/lib/ libCocoaSharpGlue.dylib
            -r:CurrencyConverter.nib -n:CurrencyConverter -a:CurrencyConverter.exe

The resulting CurrencyConverter.app is just another Mac OS X application as far as the Finder is concerned, and can be opened from Finder, or launched from Terminal using the open -a CurrencyConverter command.

