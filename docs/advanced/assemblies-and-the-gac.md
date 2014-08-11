---
title: Assemblies and the GAC
redirect_from:
  - /Assemblies_and_the_GAC/
  - /Gacutil/
---

How Mono Finds Assemblies
=========================

Application code is always split between many assemblies. In addition to an application's own assembly, all Mono applications reference the `mscorlib` assembly, which contains the core class libraries of the runtime. An application may use any number of assemblies, some of which may come with the runtime, some of which may be optional runtime components, and others might be written by third-party developers.

At run time, Mono looks in three places for assemblies necessary to run a program. It first searches the location of the executing assembly. If your application uses assemblies not provided by the runtime, you may place them all in the same directory so that Mono may find them. If a required assembly isn't found there, Mono searches the MONO\_PATH environment variable. The environment variable should be a colon-separated list of paths to search for assemblies. To set this variable in Linux, if you use the `bash` shell, type:

    export MONO_PATH=/path/to/assemblies:/another/path/to/assemblies

Lastly, if an assembly was still not found, Mono searches the the Global Assembly Cache (GAC), a repository of shared assemblies. All assemblies provided by Mono are stored in the GAC.

The Global Assembly Cache (GAC)
===============================

The Global Assembly Cache (GAC) is a central repository for storing shared assemblies. The GAC allows multiple versions of the same assembly to be installed concurrently and also prevents different assembly vendors from overwriting each other's assemblies.

The use of the GAC is encouraged for assemblies that will be used by more than one application on the system, and also for assemblies that are expected to be versioned in the future. When an application is launched, Mono extracts the name of the assembly, the version and its public key token and loads the required assembly from the GAC.

The GAC is a black boxed repository of assemblies capable of keeping multiple version/cultures of a same assembly. A *strongname* is considered a unique entry in the GAC (i.e. the GAC requires all it's assemblies to be strongnamed and signed). Note that the GAC has nothing to do with security! In fact assemblies in the GAC aren't verified when loaded from the runtime. The GAC is for manageability (avoiding DLL hell).

GAC Definitions
===============

The GAC is built on the foundation of strongnames. Strongnames can be difficult to understand because they serve a dual purpose: manageability and security. Hopefully these definitions can help everyone understand the difference between the two.

 Strongname   
An assembly filename with a version number, a culture and a public key token. As a strongname uniquely identifies an assembly this is the best way to reference them.

 Strongname Signature   
A binary blob inside an assembly that can be verified as the digital signature of the assembly (i.e. providing integrity). Because the the public key (inside the assembly) is part of the signature it is not possible to modify the assembly contents without detection (providing integrity).

 Strongnamed Assembly   
An assembly that has a all the required informations to create a strongname (i.e. a public key). Note that this doesn't mean that the assembly is signed! (See delay signed assemblies.)

 Delay Signed Assembly   
An assembly that has a strongname but no strongname signature. While they are a kind of strongnamed assembly the runtime will, by default, refuse to load them as they are unsigned. They are often used in development to keep the private signing key confidential.

 ECMA Key   
The ECMA key isn't a public key (or a key at all). It is a special 16 bytes header that the runtime detect in an assembly where the assembly public key should be. If found the runtime uses it's own public key to validate the strongname signature. This hack allows an assembly to reference a standard assembly (e.g. System.dll) in a uniform way (i.e. independent of the runtime) without having ECMA (or anyone else) involved in the signing process.

 Standard (ECMA) Assembly   
Assemblies that are defined in the ECMA standards. They are signed using the ECMA key (although other assemblies are also signed with that key, like System.Windows.Forms.

 SNK   
Strongname Key (file extension). These are files created by the tool sn.exe. They can contains a 1024 bits RSA key pair (private and public keys) or only the public key.

Assembly Names
==============

The Mono Runtime uses the following components to make up unique names for the assemblies: The assembly name, the assembly culture, the assembly version, and the assembly public key token. All of those elements are used to make a unique assembly name that can be referenced from the GAC.

 Assembly Name   
The assembly name is the human readable name you give your assembly, and is also the physical name of the assembly minus the extension. You don't need to do anything special to create an assembly name. Its added to the assemblies metadata when the assembly is compiled.

 Assembly Culture   
All assemblies have a culture associated with them. If you do not specify a culture the invariant (neutral) culture is associated with your assembly. By giving an assembly a culture you can create localized versions of assemblies and install them side-by-side in the GAC without them interfering with each other. The assembly culture is specified using an assembly attribute:

<!-- -->

    [assembly: AssemblyCulture ("en-CA")]

 Assembly Version   
The assembly version is specified as a four part number. The parts are:

\<Major\>.\<Minor\>.\<Build\>.\<Revision\>. The assembly version is specified using an assembly attribute. Common practice is to update the major and minor version numbers for changes that break backwards compatibility. If you don't want to specify a build and revision number you can use a wild card and the compiler will automatically generate one for you. Examples

    [assembly: AssemblyVersion ("1.3.3.7")]

    [assembly: AssemblyVersion ("1.0.*")]

 Assembly Public Key Token   
The assembly public key token is a short representation of the public key compiled in the assembly. The token value is the first 8 bytes of the SHA-1 hash of public key. Having a public key inside the assembly allows, once the assembly is signed, to verify it's integrity. It also ensures that there will be no naming conflicts with shared assembly names. To generate a key pair we use the sn.exe tool:

<!-- -->

    $ sn -k my.key
    Mono StrongName 0.30.99.0
    Copyright 2002, 2003 Motus Technologies. Copyright 2004 Novell. BSD licensed.
     
    A new strong name key pair has been generated in my.key

Once the key pair is generated we must then reference that key from inside of our assembly using an assembly attribute:

    [assembly: AssemblyKeyFile ("my.key")]

Installing Assemblies to The GAC
================================

Once you have given an assembly a proper shared name with a version and public key it can be installed into the GAC. Not all assemblies should be installed to the GAC. See the what should be installed to the GAC section to help you decide whether your assembly should be installed into the GAC.

To install an assembly to the GAC we use the gacutil tool. Gacutil can be used to install assemblies, uninstall assemblies, and list the assemblies in the GAC. Here is a sample installation:

    $ gacutil -i gac_lib.dll
    gac_lib installed into the gac (/usr/lib/mono/gac)

The -i directive tells gacutil to install the assembly. If we want to see what assemblies we have installed in our GAC we can use the /l directive:

    $ gacutil -l
    The following assemblies are installed into the GAC:
            Accessibility, Version=1.0.5000.0, Culture=neutral,
    PublicKeyToken=b03f5f7f11d50a3a
            Accessibility, Version=2.0.3600.0, Culture=neutral,
    PublicKeyToken=b03f5f7f11d50a3a
    ....
            gac_lib, Version=1.2.3.4, Culture=neutral, PublicKeyToken=29fba40140d13a14
            gac_lib, Version=1.2.3.4, Culture=en-US, PublicKeyToken=29fba40140d13a14

At the top of the list you can see that there are two versions of the Accessibility assembly installed. One for version 1.0.5000.0 and one for version 2.0.3600.0.

At the bottom of the list you can see there are two versions of gac\_lib installed. One for the neutral, or invariant culture, and one for the en-US culture.

If you want to expose the assembly for developers, you should use the -package NAME option to gacutil:

    $ gacutil -i gac_lib.dll -package DEMO
    gac_lib installed into the gac (/usr/lib/mono/gac)

The above will surface the assembly on /usr/lib/mono/DEMO, which is a convenient location to pass to the compiler as a assembly directory:

    $ mcs -lib:/usr/lib/mono/DEMO sample.cs
    Compilation succeeded
    $ 

Using Multiple GACs
===================

The Mono runtime allows you to reference multiple GACs and the Mono gacutil will allow you to create GACs in multiple locations. These features are useful during development and for certain deployment scenarios.

The default GAC is located in \<prefix\>/lib/mono/gac. To install your libraries to another location you use the -gacdir option with the Mono gacutil. -gacdir is a Mono only gacutil feature and will not work with other gacutil implementations. To use -gacdir you simply specify a location you would like your gac installed to. If there is currently no GAC directory structure at that location a new one will be created:

    $ gacutil /i gac_lib.dll -gacdir ~/.mono
    gac_lib installed into the gac (/home/monkey/.mono/lib/mono/gac)
    $ ls ~/.mono/lib/mono/gac/gac_lib/1.2.3.4_en-us_29fba40140d13a14/gac_lib.dll

mono/gac is always appended to the path that is supplied to -gacdir. lib will be appended if the supplied path does not end with a lib directory. The reason for this is to ease package creation.

To reference this new GAC the MONO\_GAC\_PREFIX environment variable is used. MONO\_GAC\_PREFIX points to the prefix directory of an install or the directory supplied to -gacdir. The runtime will append the lib/mono/gac and search for the assembly in that directory. The following source code loads gac\_lib.dll and prints out the assemblies codebase so we can see where it was loaded from:

    public class GacExe {
            public static void Main ()
            {
                    GacLib g = new GacLib ();
                    System.Console.WriteLine (g.GetType ().Assembly.CodeBase);
            }
    }

The first time this code is run the gac\_lib.dll will be loaded from the current directory because there is no gac\_lib.dll found in the default GAC:

    $ mono gac_exe.exe
    file:///home/monkey/projects/mono/tests/gac_lib.dll

If the MONO\_GAC\_PREFIX is set to the gacdir that gac\_lib.dll was installed to earlier the library will be loaded from the new GAC:

    $ export MONO_GAC_PREFIX=~/.mono
    $ mono gac_exe.exe
    file:///home/monkey/.mono/lib/mono/gac/gac_lib/1.2.3.4_en-us_29fba40140d13a14/gac_lib.dll

What Should Be Installed to the GAC
===================================

Not all assemblies should be installed to the GAC. In fact apart from system assemblies very few assemblies should be installed to the GAC.

Installing an assembly on the GAC involves a commitment to keep the API backwards compatible. If you are to break compatibility, you will have to change the version and ship and maintain as many copies as you have versions to avoid breaking existing applications.

Here are the criteria an assembly should meet to be installed into the GAC:

-   **Useful to more then one application**- There is no point to sharing a assembly if only one application is going to use it. If a assembly is only used by one application or is very tightly coupled to an application side-by-side deployment is a better solution then the GAC
-   **Only loads assemblies that are in the GAC**- If your assembly loads or references assemblies that are not in the GAC it should not be installed to the GAC.
-   **Commitment to maintain a backwards-compatible library, commitment to use different versions on API breakage** - Unless your API is mature you really want to avoid using the GAC because you will make breaking changes or need to refactor your library. If you have existing users, the burden is on the user to install multiple versions of your library.

If your library does not match the above criteria, or you are not in a position to guarantee backwards compatibility of the libraries at this time, you should encourage your users to link and develop against a particular version and to ship the library bundled with their software.

Libraries with Unstable APIs
============================

Sometimes developers might want to distribute a library to other developers but they might not have a library that is API stable or has not matured enough over time to guarantee the backwards-compatibility of their libraries or they are not willing to maintain multiple packages of the various versions for users.

This is a very common scenario and most libraries will go through this phase before they are considered for installation on the GAC.

The problem that arises is how to allow third party developers to consume this library with minimal effort.

To solve this problem, we recommend that:

-   The library developer ships a properly configured pkg-config file.
-   The library consumers include an "update-libraries" target on their Makefile that will import the latest version of a library from a system directory into their application source code distribution.
-   The library consumers ship this library as part of their package.
-   The consumer follow the [Guidelines for Application Deployment](/docs/getting-started/application-deployment/)

Here is how this works, the library developer installs a pkg-config file like this:

``` bash
$ cat Thing.pc
prefix=/usr
assemblies_dir=${prefix}/lib/thing
Libraries=${assemblies_dir}/Thing.dll ${assemblies_dir}/ThingCore.dll
 
Name: Thing
Description: The Thing Library
Version: 0.5
Libs: -r:Thing.dll -r:ThingCore.dll
```

The important parts are "Libraries" a new variable that lists the full path to all of the assemblies that make up the "Thing" package, and the "Libs" line.

The "Libraries" line is used by the consumer like this, as part of their "update-libraries" makefile target:

``` bash
update-libraries:
        cp `pkg-config --variable=Libraries Thing` .
        pkg-config --libs Thing > thing.flags
```

The Libs line is used like this in your Makefile:

``` bash
Demo.exe: Demo.cs thing.flags
       mcs -out:$@ Demo.cs `cat thing.flags`
```

The libraries will be copied from the system installation directory into your application directory, and the --libs line will link to the local libraries, not libraries installed into the GAC.

This means that developers that consume unstable API libraries do not have to worry about their schedule being the same as the schedule for API stability on the libraries they consume as they will always have a private copy at development time and at runtime, and they choose when they upgrade to a new version of the library.

If the developer had been using the GAC for an unstable library, he would force the end-user deploying his application to always track the dependency of the latest library his application is consuming, risking missing packages for versions that are no longer distributed for example.

Note: a production-ready, detailed example of this can be found in the [Autotools](/docs/getting-started/application-deployment/#auto-tools) section, and can be seen by checking out and exploring the source code in the monoskel and monoskel-lib modules from Mono SVN.

Comparing this to other models
------------------------------

### How is this better than using the GAC?

This model requires a minimal amount of work on various parts.

The library developer benefits in these ways:

-   It releases the library developer from the requirement to keep the API backwards compatible.
-   The library developer does not have to ship old and new versions of his library.
-   The library developer can update, change, refactor his code with freedom without worrying about breaking third party applications.

The distribution packager:

-   The packager does not have to solve naming conflicts, parallel installation and multiple versions shipping on the same OS.

The library consumer:

-   The library consumer does not have to add requirements for a specific version of a library.
-   The library consumer does not have to add checks for a specific version of a library.
-   The library consumer decides when to upgrade the library at his own pace.
-   The library consumer can properly test and QA his product with the library without having to retest with different versions.

The end user:

-   Does not have to hunt down multiple versions of the library.
-   Applications that consume under-development libraries will not break when he upgrades his system.
-   He can upgrade software at his own pace without being forced to upgrade all software at once that depends on an unstable library.

This puts the burden of fetching and distributing the correct library on the hands of the software developer consuming the library, the advantage is that there are no external requirements and the dependencies for deployment are minimized.

### How is this better than the "egg" model?

The "egg" model is a model used in Gnome, where a source code repository of useful routines is kept. The routines and libraries live in this "egg" module until they graduate and can live in an API stable library. Developers copy/paste this code from "egg" into their applications and distribute the result.

The problem is that developers must integrate the configuration system and bring the source code into their projects to effectively use the routines. They also must do their own source code importing which is more complex than just copying the binary library.

Small Libraries
===============

Small libraries that can be made available as source code and that application developers are expected to integrate into their applications should ship a pkg-config file that contains the line:

    Sources: File1.cs File.cs

And developers would copy those files in their project makefiles, like this:

``` csharp
File1.cs File2.cs: 
       cp `pkg-config --variable=Sources package` .
```

And distribute the results.

Advanced Topics
===============

Using A Delay Signed Assembly
-----------------------------

Delay signed assemblies are often used during software development to keep the private signing key confidential. This is a necessary step if you also want to use the strongnames as an integrity mechanism.

Mono 1.0 doesn't support the verification of the strongname signatures by the runtime. This means that the integrity mechanism isn't present. However it is still possible to use delay signed assemblies with Mono. For example developers may want the integrity of the strongnames when their assemblies are running on a different runtime or may use the same private key for other purpose.

To delay sign an assembly you need to include:

-   the **AssemblyDelaySign**attribute with a **true**parameter somewhere in the project; and
-   the **AssemblyKeyFile**attribute with a reference to a file containing the public key. The private key would also work but would be pointless to use.

<!-- -->

    [assembly: AssemblyDelaySign (true)]
    [assembly: AssemblyKeyFile ("mypublickeyfile.pub")]

By contrast a fully signed assembly would use a **false**parameter to the **AssemblyDelaySign**attribute (or completely remove this attribute) and the **AssemblyKeyFile**attribute would reference a file containing complete key pair (i.e. both the private and the public key).

Now a delay-signed assembly can't be of much help if it can't be used by the runtime. This isn't generally a problem with Mono 1.0 (as the runtime doesn't enforce the strongname signature) but the verification can still be turned off for:

-   a single assembly (specificed as the assembly filename and public key token) for a specific user, a list of users or all users; or
-   all assemblies sharing the same public key token, again for a specific user, a list of users or all users.

### Delay Signed Configuration

The list of assemblies, or public key token, to be exempted of signature verification is kept in the **machine.config**file. This file is usually located in **[prefix]/etc/mono**.

The configuration is kept under the **configuration/strongNames/verificationSettings**section. Each entry is named **skip**and has three attributes.

-   **Token**: the public key token to ignore;
-   **Assembly**: the specific assembly name to ignore. A **\***can be used for ignore every assemblies using the specified token; and
-   **Users**: the users for whom the signature verification is skipped. Multiple user names are comma separated. Again a **\***can be used to skip verification for all users for the assembly/public key token.

For example an entry to ignore all ECMA assemblies signatures for all users would look like this:

    <skip Token="b77a5c561934e089" Assembly="*" Users="*" />

Public Key Token Remapping
--------------------------

The best example of remapping is the [ECMA](/docs/about-mono/languages/ecma/) key. Every runtime must remap the ECMA public key token to it's own public key. This way each runtime can verify the digital signature of the standard ECMA assemblies.

The same problem applies to other assemblies as well. Few people have access to the private key used to sign most of the framework assemblies (known as msfinal). However to keep the same strongname we need the same public key (and public key token). Mono's solution to this problem is to generalize the ECMA remapping mechanism to any public key token.

This generic remapping mechanism is only present in Mono. This means that the assemblies using it cannot work, out-of-the-box, with a different runtime (as the signature can't be directly verified). If you need to use those assemblies (e.g. for testing or debugging purposes) then you must turn off strongname verification for the specific assembly (or for entire public key token).

### Public Key Token Remapping Configuration

The remapping configuration is kept in the **machine.config**file. This file is usually located in **[prefix]/etc/mono**.

The configuration is kept under the **configuration/strongNames/pubTokenMapping**section. Each entry is named **map**and has two attributes.

-   **Token**: the public key token of the assembly; and
-   **PublicKey**: the public key that will be used to verify the assembly strongname signature.

For example the entry for the ECMA key would look like this:

    <map Token="b77a5c561934e089" PublicKey="002400000480000000..." />

Developers and Versioning
=========================

So having multiple versions of the same assembly is useful to the user: he does not have to worry about conflicting assembly filenames and he can have multiple versions of the same assembly installed at once without breaking his existing software when he updates software.

But how do developers cope with having multiple assemblies, and how does the compiler choose the right version of a assembly to link with?

The compiler will automatically load assemblies that are located in the same directory as the compiler (by default /usr/lib/mono/1.0) and these include all the assemblies that are part of the standard Mono. But for third party assemblies, it is necessary to indicate a directory that holds the assembly to link against.

In the GAC world, the assemblies are exposed in two places: in the GAC (which is what the runtime uses to load assemblies) and to the compiler in a different location, this is done with the `-package `flag to the `gacutil `command.

What the `-package `option does is to expose the assembly in a different location for the compiler to pick up (by default the assembly is only exposed in a cryptic location, for example:: /usr/lib/mono/gac/monodoc/1.0.0.0\_\_0738eb9f132ed756/monodoc.dll) which is not very practical to type. The `-package NAME `option will surface the assembly (using a symbolic link) in /usr/lib/mono/NAME directory, which is a convenient assembly to pass to the compiler.

To further integrate into the Unix build process, we go one step beyond, and we encourage developers to not only install their assembly into the GAC and surface it for developers with the `-package `option, but to also ship a `pkg-config `configuration file. The pkg-config configuration file has all the information required to build against a assembly.

This can be used in conjunction with the compiler flag `-pkg: `to directly reference a software package, for example to compile with Gtk\# and Pango\#, this is the command line used:

    $ mcs -pkg:gtk-sharp,pango-sharp sample.cs
    Compilation succeeded

The above is convenient for developers as they do not have to remember the paths, or probe for the paths, they can just use pkg-config to probe on their configuration scripts for the presence and a specific version if they need to.

The gtk-sharp.pc file is a file that is installed into /usr/lib/pkgconfig directory (on most systems) or on any directory references by the PKG\_CONFIG\_PATH. This allows a developer to have multiple development versions installed at once, and have the compiler pick the right version based on the .pc file

Here is what the gtk-sharp.pc file looks like:

    prefix=/usr
    exec_prefix=${prefix}
    libdir=${exec_prefix}/lib


    Name: Gtk#
    Description: Gtk# - GNOME .NET Binding
    Version: 0.91.99
    Libs: -r:${libdir}/mono/gtk-sharp/glib-sharp.dll     \
        -r:${libdir}/mono/gtk-sharp/pango-sharp.dll  \
        -r:${libdir}/mono/gtk-sharp/atk-sharp.dll    \
        -r:${libdir}/mono/gtk-sharp/gdk-sharp.dll    \
        -r:${libdir}/mono/gtk-sharp/gtk-sharp.dll

Notice that the assemblies are referenced directly instead of passing the -lib: command line and then the -r option separately: This helps specifying exactly what assembly must be linked with.
