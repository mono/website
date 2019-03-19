---
title: "FAQ: General"
redirect_from:
  - /FAQ%3A_General/
---

Basics
------

### Can Mono run binaries produced by Visual Studio?

Yes, Mono can run binaries produced by Visual Studio, there is no need to recompile.

Use our [Mono Migration Analysis](/docs/tools+libraries/tools/moma/) tool to check if everything that your application uses has been implemented in Mono or if there are special considerations to keep in mind.

See our [Roadmap](/docs/about-mono/roadmap/) for details about what is implemented.

### What is Mono exactly?

The Mono Project is an open development initiative sponsored by the .NET Foundation and Microsoft to develop an open source, UNIX version of the Microsoft .NET development platform. Its objective is to enable UNIX developers to build and deploy cross-platform .NET Applications. The project implements various technologies developed by Microsoft that have now been submitted to the ECMA for standardization.

The Mono Project has also sparked a lot of interest in developing C#-based components, libraries and frameworks. The most important ones, some of which were developed by the Mono team, are:

-   [Gtk#](http://gtk-sharp.sf.net): Bindings for the popular Gtk+ GUI toolkit for UNIX and Windows systems. Other bindings are available: Diacanvas-Sharp and MrProject.

-   [Mono.Cecil](/docs/tools+libraries/libraries/Mono.Cecil/): A library to generate and inspect CIL assemblies.

-   [#ZipLib](http://www.icsharpcode.net/OpenSource/SharpZipLib/Default.aspx): A library to manipulate various kinds of compressed files and archives (Zip and tar).

-   [Tao Framework](/archived/tao): bindings for OpenGL

-   Mono.Directory.LDAP / Novell.Directory.LDAP: LDAP access for .NET apps.

-   Mono.Data: We ship support for PostgreSQL, MySQL, Firebird, Sybase ASE, IBM DB2, SQLite, Microsoft SQL Server, Oracle, and ODBC data sources.

-   Mono.Cairo: Bindings for the [Cairo](http://www.cairographics.org) rendering engine (Our System.Drawing is implemented on top of this).

-   Mono.Posix / Mono.UNIX: Bindings for building POSIX applications using C#.

-   Mono.Remoting.Channels.Unix: Unix socket based remoting

-   Mono.Security: Enhanced security and crypto framework

-   Mono.Math: BigInteger and Prime number generation

-   Mono.Http: Support for creating custom, embedded HTTP servers and common HTTP handlers for your applications.

-   Mono.XML: Extended support for XML

-   Managed.Windows.Forms (aka System.Windows.Forms): A complete and cross platform, System.Drawing based Winforms implementation.

-   [Remoting.CORBA](http://remoting-corba.sourceforge.net/): A CORBA implementation for Mono.

-   Ginzu: An implementation on top of Remoting for the [ICE](http://www.zeroc.com) stack

For a more complete list, see the [Libraries](/docs/tools+libraries/libraries/) and [Software](/docs/about-mono/showcase/software/) pages.

### What technologies are included in Mono?

Mono contains a number of components useful for building new software:

-   A Common Language Infrastructure (CLI) virtual machine that contains a class loader, Just-in-time compiler, and a garbage collecting runtime.

-   A class library that can work with any language which works on the CLR. Both .NET compatible class libraries as well as Mono-provided class libraries are included.

-   A compiler for the C# language. In the future we might work on other compilers that target the Common Language Runtime.

Windows has compilers that target the virtual machine from [a number of languages:](http://msdn.microsoft.com/net/thirdparty/default.asp#lang) Managed C++, Java Script, Eiffel, Component Pascal, APL, Cobol, Perl, Python, Scheme, Smalltalk, Standard ML, Haskell, Mercury and Oberon.

The CLR and the Common Type System (CTS) enables applications and libraries to be written in a collection of different languages that target the byte code This means for example that if you define a class to do algebraic manipulation in C#, that class can be reused from any other language that supports the CLI. You could create a class in C#, subclass it in C++ and instantiate it in an Eiffel program. A single object system, threading system, class libraries, and garbage collection system can be shared across all these languages.

### Where can I find the specification for these technologies?

You can find the information here:

C# [http://www.ecma-international.org/publications/standards/Ecma-334.htm](http://www.ecma-international.org/publications/standards/Ecma-334.htm)

CLI [http://www.ecma-international.org/publications/standards/Ecma-335.htm](http://www.ecma-international.org/publications/standards/Ecma-335.htm)

### Will you implement the .NET Framework SDK class libraries?

Yes, we will be implementing the APIs of the .NET Framework SDK class libraries.

### What does the name "Mono" mean?

Mono is the word for 'monkey' in Spanish. We like monkeys.

### Does Mono work today?

Yes, Mono is used in many [commercial and open source applications](/docs/about-mono/showcase/software/) and is used by many [companies](/docs/about-mono/showcase/companies-using-mono/).

The execution engine works on many platforms (See the [detailed list](/docs/about-mono/supported-platforms/)) and the scope of Mono is quite comprehensive. Detailed plans are available in our [Plans](/docs/about-mono/plans/) page.

### What companies are using Mono?

You can see a list of some [Companies Using Mono](/docs/about-mono/showcase/companies-using-mono/) page.

A number of commercial software products are listed [here](/docs/about-mono/showcase/software/).

### When will you ship Mono?

Please see the [Mono Roadmap](/docs/about-mono/roadmap/) for more details on the release plans.

### How can I contribute?

Check the [contributing](/community/contributing/) section. You will also have to sign the [.NET Foundation CLA](https://cla.dotnetfoundation.org).

### Aren't you just copying someone else's work?

We are interested in providing the best tools for programmers to develop applications for Free Operating Systems. We also want to help provide the interoperability that will allow those systems to fit in with other standards.

### Miguel said once that Mono was being implemented in COBOL. Is that true?

No. It was a joke.

### Is there a list of known vulnerabilities affecting versions of Mono ?

Yes. We have compiled a list of [vulnerabilities](/docs/about-mono/vulnerabilities/) for Mono and its tools.

Availability
------------

### What architectures and operating systems does Mono support?

See our [Supported Platforms](/docs/about-mono/supported-platforms/) page for the complete list.

Although we support plenty of platforms, we do not package Mono in binary form for all of the supported platforms.

### My platform is not supported, can Mono support it?

Porting Mono to a new platform has two dimensions:

-   Architecture port: this means porting the code generator used by the JIT to produce native code for a new CPU.
-   Operating system port: this includes porting Mono's IO-Layer which copes with threading, file I/O and networking as well as porting the garbage collector and exception handling code, which tends to be operating system specific.

Most Unix variants behave very similarly, so porting to a new Unix is relatively simple. Porting to embedded operating systems or new research operating systems are the only places where a new operating system port might be required.

Porting Mono to a new architecture takes about three months of work.

Installation Problems
---------------------

### I installed Mono from the installer, but some applications now fail to work?

When you install Mono with the installer, the new Mono will take precedence over your system Mono. Lets call these MonoNew and MonoSystem.

The problem is typically that applications depend on assemblies installed in the system GAC. This is usually located in /usr/lib/mono/gac. MonoNew is typically installed into a user's home directory, for example /home/bob/mono-1.2.6.

You can instruct MonoNew to fallback to load assemblies from the system directory by setting the following environment variable:

``` bash
export MONO_GAC_PREFIX=/home/bob/mono-1.2.6:/usr
```

Notice that the first directory points to the MonoNew GAC. This is necessary so the new assemblies are always loaded before the MonoSystem assemblies. If the Mono assembly loader does not find the assembly in the MonoNew prefix, it will fallback to load the assemblies from the /usr directory structure.

Mono and GNOME
--------------

### How is Mono related to GNOME?

In a number of ways. This project was born out of the need of providing improved tools for the GNOME community, and will use existing components that have been developed for GNOME when they are available. Mono team members work actively on the [Gtk#](/GtkSharp) project: a binding of the GNOME class libraries for .NET and Mono.

### Has the GNOME Foundation or the GNOME team adopted Mono?

We hope that the tools that we will provide will be adopted by free software programmers including the GNOME Foundation members and the GNOME project generally.

### Should GNOME programmers use Mono?

Yes, we believe that Mono is a great development platform for building applications for the GNOME desktop. Mono includes [Gtk#](/docs/gui/gtksharp/) a .NET binding for GTK+ and various GNOME libraries which together with C# and the System libraries provide developers with great productivity for building graphical applications especially when compared to GTK+ or Java Swing.

### Will Mono include compatibility with Bonobo components? What is the relationship between Mono and Bonobo?

Although we had plan to support Bonobo, we have not yet done any work on this area and it is no longer a high priority.

### Does Mono depend on GNOME?

No, Mono does not depend on GNOME. We use a few packages produced by the GNOME team like the 'glib' library, we also use other third-party open source libraries like Cairo and ICU.

### But will I be able to build GNOME applications?

Yes, we will enable people to write GNOME applications using Mono.

### Do you have C# bindings for GNOME?

Yes, the [Gtk# project](/docs/gui/gtksharp/) provides bindings for Gtk+, Gdk, Atk, libgnome, libgnomecanvas, and libgnomeui. Other libraries under the GNOME framework will be added on an as-needed (and as-requested) basis.

Languages and Bindings
----------------------

### What programming languages are available for Mono?

See our [Languages](/docs/about-mono/languages/) page for a complete list of open source and commercial compilers that are available for Mono.

### Why do arrow keys and tab not work with IronPython?

IronPython defaults to strict emulation of the python console, to get the arrow keys, backspace and tab completion working, run your IronPython interepter like this:

mono ipy.exe -X:TabCompletion

### Does Mono support COM?

See [COM Interop](/docs/advanced/com-interop/).

### Are there bindings for Open Office?

There are .NET bindings for creating OpenOffice applications. For more details see Go-OpenOffice's [Open Office integration with Mono](http://go-ooo.org/wiki/index.php/Mono_Integration) article.

openSUSE ships with a Mono-enabled version of OpenOffice which developers can use right away.

Credits
-------

The FAQ contains material contributed by Miguel de Icaza, Jaime Anguiano, Lluis Sánchez.

