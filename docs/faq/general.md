---
título: "FAQ: Geral"
arquivo original_from:
  - /FAQ:_General/
---

Perguntas Básicas
------

**O Mono pode executar binários gerados pelo Visual Studio?**

Sim, o Mono pode executar os binários gerados pelo Visual Studio, sem necessidade de compilar os fontes originais.

Utilize nossa ferramenta [Mono Migration Analysis](/docs/tools+libraries/tools/moma/) para verificar se os recursos que sua aplicação utiliza foram implementados e/ou são compatíveis com o Mono, ou se existem quaisquer particularidades que necessitam de atenção.

A API atual do Mono está entre a versão .NET 2.0 e .NET 4.0; veja nosso [Roadmap](/docs/about-mono/roadmap/) para detalhes sobre o que está efetivamente implementado.

**O que o Mono™ é exatamente?**

O Projeto Mono é uma iniciativa de desenvolvimento de um framework de desenvolvimento comunitário, patrocinado pela Novell, de uma versão UNIX e livre (open source), da plataforma .NET da Microsoft. Ele tem por objetivo permitir que desenvolvedores UNIX possam criar e distribuir aplicações .NET cross-platform. O projeto implementa várias tecnologias desenvolvidas pela Microsoft que foram então submetidas à ECMA para padronização.

O Projeto Mono também tem despertado grande interesse no desenvolvimento de componentes derivados do C#, bibliotecas e frameworks. Dentre os mais importantes, alguns deles inclusive foram desenvolvidos pelo time do Mono, podemos citar:

-   [Gtk#](http://gtk-sharp.sf.net): uma variante do popular conjunto de ferramentas gráficas Gtk+ dos sistemas UNIX e Windows. Outras vertentes disponíveis são: Diacanvas-Sharp e MrProject.

-   [Mono.Cecil](/docs/tools+libraries/libraries/Mono.Cecil/): biblioteca para gerar e analisar assemblies CIL.

-   [#ZipLib](http://www.icsharpcode.net/OpenSource/SharpZipLib/Default.aspx): biblioteca para manipular diferentes tipo de arquivos compactados (Zip e tar).

-   [Tao Framework](/archived/tao "Tao"): variante do OpenGL.

-   Mono.Directory.LDAP / Novell.Directory.LDAP: acesso LDAP para aplicações .NET.

-   Mono.Data: suporte para banco de dados PostgreSQL, MySQL, Firebird, Sybase ASE, IBM DB2, SQLite, Microsoft SQL Server, Oracle, e ODBC.

-   Mono.Cairo: variante da engine de renderização [Cairo](http://www.cairographics.org) (nosso System.Drawing utiliza esse pacote).

-   Mono.Posix / Mono.UNIX: variante para criar aplicações POSIX utilizando C#.

-   Mono.Remoting.Channels.Unix: socket UNIX para comunicação remota.

-   Mono.Security: framework com recursos avançados de segurança e criptografia.

-   Mono.Math: geração de números BigInteger e Prime.

-   Mono.Http: suporte à criação de servidores HTTP customizados e servers and manipuladores HTTP bastante úteis para suas aplicações.

-   Mono.XML: provê suporte adicional à XML.

-   Managed.Windows.Forms (também conhecido como System.Windows.Forms): implementação de pacote (System.Drawing) completo e cross-platform, baseado na implementação Winforms.

-   [Remoting.CORBA](http://remoting-corba.sourceforge.net/): implementação CORBA para Mono.

-   Ginzu: implementação sobre o pacote Remoting da pilha [ICE](http://www.zeroc.com).

Para a lista completa, veja as páginas [Libraries](/docs/tools+libraries/libraries/) e [Software](/docs/about-mono/showcase/software/).

**Qual a diferença entre o Mono e .NET Initiative?**

A ".NET Initiative" é uma espécie de esforço corporativo da Microsoft, e parte desse projeto prevê o desenvolvimento de um framework cross-platform. O Mono é uma implementação de um framework de desenvolvimento, mas não é uma implementação de nada relativo à .NET Initiative, como por exemplo o Passport ou o software-as-a-service.

**Quais tecnologias estão incluídas no Mono?**

Mono contains a number of components useful for building new software:

-   A Common Language Infrastructure (CLI) virtual machine that contains a class loader, Just-in-time compiler, and a garbage collecting runtime.

-   A class library that can work with any language which works on the CLR. Both .NET compatible class libraries as well as Mono-provided class libraries are included.

-   A compiler for the C# language. In the future we might work on other compilers that target the Common Language Runtime.

Windows has compilers that target the virtual machine from [a number of languages:](http://msdn.microsoft.com/net/thirdparty/default.asp#lang) Managed C++, Java Script, Eiffel, Component Pascal, APL, Cobol, Perl, Python, Scheme, Smalltalk, Standard ML, Haskell, Mercury and Oberon.

The CLR and the Common Type System (CTS) enables applications and libraries to be written in a collection of different languages that target the byte code This means for example that if you define a class to do algebraic manipulation in C#, that class can be reused from any other language that supports the CLI. You could create a class in C#, subclass it in C++ and instantiate it in an Eiffel program. A single object system, threading system, class libraries, and garbage collection system can be shared across all these languages.

**Where can I find the specification for these technologies?**

You can find the information here:

C# [http://www.ecma-international.org/publications/standards/Ecma-334.htm](http://www.ecma-international.org/publications/standards/Ecma-334.htm)

CLI [http://www.ecma-international.org/publications/standards/Ecma-335.htm](http://www.ecma-international.org/publications/standards/Ecma-335.htm)

**Will you implement the .NET Framework SDK class libraries?**

Yes, we will be implementing the APIs of the .NET Framework SDK class libraries.

**Will you offer an ECMA-compliant set of class libraries?**

Eventually we will. Our current focus is on inter-operating with the Microsoft SDK, but we will also offer an ECMA compliant subset of the libraries.

**What does the name "Mono" mean?**

Mono is the word for 'monkey' in Spanish. We like monkeys.

**Does Mono work today?**

Yes, Mono is used in many [commercial and open source applications](/docs/about-mono/showcase/software/) and is used by many [companies](/docs/about-mono/showcase/companies-using-mono/).

The execution engine works on many platforms (See the [detailed list](/docs/about-mono/supported-platforms/)) and the scope of Mono is quite comprehensive. Detailed plans are available in our [Plans](/docs/about-mono/plans/) page.

 **What companies are using Mono?**

You can see a list of some [Companies Using Mono](/docs/about-mono/showcase/companies-using-mono/) page.

A number of commercial software products are listed [here](/docs/about-mono/showcase/software/).

**When will you ship Mono?**

Please see the [Mono Roadmap](/docs/about-mono/roadmap/) for more details on the release plans.

**How can I contribute?**

Check the [contributing](/community/contributing/) section.

**Is there an online guide for Mono?**

Visit the [Monkeyguide](/archived/monkeyguide "Monkeyguide") page.

**Aren't you just copying someone else's work?**

We are interested in providing the best tools for programmers to develop applications for Free Operating Systems. We also want to help provide the interoperability that will allow those systems to fit in with other standards.

**Miguel said once that Mono was being implemented in COBOL. Is that true?**

No. It was a joke.

**Is there a list of known vulnerabilities affecting versions of Mono ?**

Yes. We have compiled a list of [vulnerabilities](/docs/about-mono/vulnerabilities/) for Mono and its tools.

Availability
------------

**What architectures and operating systems does Mono support?**

See our [Supported Platforms](/docs/about-mono/supported-platforms/) page for the complete list.

Although we support plenty of platforms, we do not package Mono in binary form for all of the supported platforms.

**My platform is not supported, can Mono support it?**

Porting Mono to a new platform has two dimensions:

-   Architecture port: this means porting the code generator used by the JIT to produce native code for a new CPU.
-   Operating system port: this includes porting Mono's IO-Layer which copes with threading, file I/O and networking as well as porting the garbage collector and exception handling code, which tends to be operating system specific.

Most Unix variants behave very similarly, so porting to a new Unix is relatively simple. Porting to embedded operating systems or new research operating systems are the only places where a new operating system port might be required.

Porting Mono to a new architecture takes about three months of work.

**Will Novell port Mono to my architecture/operating system?**

In the past Novell has done ports of Mono to new architectures and operating systems. We have done this for internal Novell needs (x86-64, Itanium and with Neale's help to s390, s390x) or for customer needs (PowerPC).

Novell is certainly open to adding support for new architectures, but there are a number of variables: is the port going to benefit a large segment of users, hardware requirements and adequate funding.

If you want to discuss a port of Mono to a new architecture, you should [contact the Mono team at Novell](http://www.go-mono.com/contact/).

Installation Problems
---------------------

**I installed Mono from the installer, but some applications now fail to work?**

When you install Mono with the installer, the new Mono will take precedence over your system Mono. Lets call these MonoNew and MonoSystem.

The problem is typically that applications depend on assemblies installed in the system GAC. This is usually located in /usr/lib/mono/gac. MonoNew is typically installed into a user's home directory, for example /home/bob/mono-1.2.6.

You can instruct MonoNew to fallback to load assemblies from the system directory by setting the following environment variable:

``` bash
export MONO_GAC_PREFIX=/home/bob/mono-1.2.6:/usr
```

Notice that the first directory points to the MonoNew GAC. This is necessary so the new assemblies are always loaded before the MonoSystem assemblies. If the Mono assembly loader does not find the assembly in the MonoNew prefix, it will fallback to load the assemblies from the /usr directory structure.

Mono and GNOME
--------------

**How is Mono related to GNOME?**

In a number of ways. This project was born out of the need of providing improved tools for the GNOME community, and will use existing components that have been developed for GNOME when they are available. Mono team members work actively on the [Gtk#](/GtkSharp) project: a binding of the GNOME class libraries for .NET and Mono.

**Has the GNOME Foundation or the GNOME team adopted Mono?**

Mono is too new to be adopted by those groups. We hope that the tools that we will provide will be adopted by free software programmers including the GNOME Foundation members and the GNOME project generally.

**Should GNOME programmers use Mono?**

Yes, we believe that Mono is a great development platform for building applications for the GNOME desktop. Mono includes [Gtk#](/docs/gui/gtksharp/) a .NET binding for GTK+ and various GNOME libraries which together with C# and the System libraries provide developers with great productivity for building graphical applications especially when compared to GTK+ or Java Swing.

**Will Mono include compatibility with Bonobo components? What is the relationship between Mono and Bonobo?**

Although we had plan to support Bonobo, we have not yet done any work on this area and it is no longer a high priority.

**Does Mono depend on GNOME?**

No, Mono does not depend on GNOME. We use a few packages produced by the GNOME team like the 'glib' library, we also use other third-party open source libraries like Cairo and ICU.

**But will I be able to build GNOME applications?**

Yes, we will enable people to write GNOME applications using Mono.

**Do you have C# bindings for GNOME?**

Yes, the [Gtk# project](/docs/gui/gtksharp/) provides bindings for Gtk+, Gdk, Atk, libgnome, libgnomecanvas, and libgnomeui. Other libraries under the GNOME framework will be added on an as-needed (and as-requested) basis.

GUI applications
----------------

See also our [FAQ on Windows Forms](/docs/faq/winforms/) page.

**Will Mono enable GUI applications to be authored?**

Yes, you will be able to build GUI applications.

Indeed, that was the main driver for the creation of Mono. Today you can use [Gtk#](/docs/gui/gtksharp/) to develop GUI applications on Windows, Linux and MacOS X.

We are also developing a complete [Windows.Forms](/docs/gui/winforms/) implementation.

A list of pros and cons on the various APIs is available in our [Gui Toolkits](/docs/gui/gui-toolkits/) page.

**Will Gtk# applications run on Windows?**

Yes, applications compiled using Gtk# will work out of the box on Windows.

Note that using the Mozilla and most Gnome libraries is not currently supported and will limit the portability of your application.

**What is the difference between Gtk# and System.Windows.Forms?**

Gtk# is a set of bindings for the Gtk+ toolkit for C# (and other CIL-enabled languages), it integrates natively with the Gnome desktop. System.Windows.Forms is an API defined by Microsoft to build GUI applications.

For more details see the [Gui Toolkits](/docs/gui/gui-toolkits/) page which presents the pros and cons of using each option.

**Where can I learn more about Gtk#?**

See the [Gtk#](/docs/gui/gtksharp/) page for more information about Gtk# or jump on over to the [Gtk# Beginners Guide](/docs/gui/gtksharp/beginners-guide/) to get started.

**What can I do with Gtk#?**

Gtk# is becoming very usable and you can create applications and applets like those you see in a GNOME desktop environment. It's easy to install so it's worth a try.

**How can I compile my HelloWorld.cs which uses Gtk#?**

Try: mcs -pkg:gtk-sharp-2.0 HelloWorld.cs

See [Gtk# Beginners Guide](/docs/gui/gtksharp/beginners-guide/) for more details.

**Do you have a comparison chart about the various toolkit offerings?**

See [Gui Toolkits](/docs/gui/gui-toolkits/).

Languages and Bindings
----------------------

**What programming languages are available for Mono?**

See our [Languages](/docs/about-mono/languages/) page for a complete list of open source and commercial compilers that are available for Mono.

**Why do arrow keys and tab not work with IronPython?**

IronPython defaults to strict emulation of the python console, to get the arrow keys, backspace and tab completion working, run your IronPython interepter like this:

mono ipy.exe -X:TabCompletion

**Does Mono support COM?**

See [COM Interop](/docs/advanced/com-interop/).

**Are there bindings for Open Office?**

There are .NET bindings for creating OpenOffice applications. For more details see Go-OpenOffice's [Open Office integration with Mono](http://go-ooo.org/wiki/index.php/Mono_Integration) article.

openSUSE ships with a Mono-enabled version of OpenOffice which developers can use right away.

Mono and Microsoft
------------------

**Is Microsoft helping Novell with this project?**

Until September of 2007 there was no high level communication between Novell and Microsoft, but engineers who work on .NET or the ECMA groups have been very friendly, and very nice to answer our questions, or clarify part of the specification for us.

In September 2007 an agreement between Microsoft and Novell opened the doors to collaboration specifically on the implementation of open source implementations of Silverlight 1.0 and Silverlight 2.0.

Silverlight 2.0 contains a subset of the virtual execution engine, and a subset of the class libraries that are designed to write rich web applications.

Microsoft is interested in other implementations of .NET and are willing to help make the ECMA spec more accurate for this purpose. Novell participates in the ECMA committee meetings for C# and the CLI.

 **Do you fear that Microsoft will change the spec and render Mono useless?**

No. Microsoft proved with the CLI and the C# language that it was possible to create a powerful foundation for many languages to inter-operate. We will always have that.

Even if changes happened in the platform which were undocumented, the existing platform would have value on its own.

**Are you writing Mono from the ECMA specs?**

Yes, we are writing them from the ECMA specs and the published materials in print about .NET.

**If my applications use Mono, will I have to pay a service fee?**

No. Mono is not related to Microsoft's initiative of software-as-a-service.

**If Microsoft will release a port of their .NET platform under the 'Shared Source' license, why should I bother with anything else?**

The Shared Source implementation will be expensive and its uses will be tightly restricted, especially for commercial use. We are working towards an implementation that will grant a number of important rights to recipients: use for any purpose, redistribution, modification, and redistribution of modifications. This is what we call [Free Software](http://www.gnu.org/philosophy/free-sw.html)

**Will Mono running on Linux make Passport available for Linux?**

No. However, the Passport toolkit for Linux-based web servers is available from Microsoft.

**Will Mono allow me to run Microsoft Office on Linux?**

No, it will not. Microsoft Office is a Windows application. To learn more about running Windows applications on Intel UNIX systems refer to [the Wine Project](http://www.winehq.com).

**Can mono run the WebMatrix?**

No. WebMatrix is not a pure .NET application making use of many different Win32 API calls.

**Does mono have something like Passport? Will mono have a server side Passport/Similar framework for XSP as well as client classes?**

Not yet, but the client side API for authentication is not the problem. We will likely have a lot of other authentication APIs, like the Liberty Alliance APIs. The problem is people on the web provider end that might use this for authentication.

Credits
-------

The FAQ contains material contributed by Miguel de Icaza, Jaime Anguiano, Lluis Sánchez.

