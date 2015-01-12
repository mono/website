---
title: Instalando Mono no Windows
redirect_from:
  - /Using_Mono_on_Windows/
  - /Mono:Windows/
---

O Mono roda no Windows, esta página descreve os vários recursos disponíveis para os usuários que querem usar Mono no Windows, bem como a utilização de tecnologias baseadas em Mono no Windows sem Mono (como Gtk #)

Instalando o Mono no Windows
============================

1.  Baixe o último instalador do Mono para Windows em [Downloads](/download/)
2.  Execute o programa baixado como administrador. Durante a instalação lhe será perguntado se aceita os termos da licença, apresentada com a página de informações, bem como pedidas algumas poucas outras informações, incluindo:
    1.  Em qual diretório o Mono deve ser instalado
    2.  Que componentes opcionais devem ser instalados
    3.  Em qual pasta do Menu Iniciar deve ser colocados os atalhos
    4.  Qual porta IP o servidor web do Mono (XSP) deve usar

A instalação padrão cria uma pasta "Mono for Windows" dentro do Menu Iniciar com atalhos para as ferramentas de uso mais comum ao começar a lidar com o Mono

Mono Experimental Installer for Windows
---------------------------------------

In addition to the standard installer of Mono on Windows, there is an experimental installer that contains the latest experiments in integrating Mono into Windows.

See [Mono Experimental Installer for Windows](/Mono_Experimental_Installer_For_Windows) for more details.

Using Mono on Windows
=====================

The combined installer creates a "Mono Command Prompt" shortcut under the main Mono program group which starts a command shell with mono-relevant path information already configured.

[![WinMonoCmdStart.png](/archived/images/9/92/WinMonoCmdStart.png)](/archived/images/9/92/WinMonoCmdStart.png)

To test the mcs compiler and the mono runtime, launch this command prompt, from there create a simple C# file:

``` bash
C:\> echo class X { static void Main () { System.Console.Write("OK");} } > x.cs
```

Now you can compile the resulting "x.cs" file into an executable, with the Mono C# compiler:

``` bash
C:\> mcs x.cs
```

The resulting executable (x.exe) will work with both Mono and the Microsoft runtime, to try it with Mono do:

``` bash
C:\> mono x.exe
OK
C:\>
```

To try it with Windows do:

``` bash
C:\> x.exe
OK
C:\>
```

If you get this far, you have a working Mono installation.

Gtk#
-----

[Gtk#](/docs/gui/gtksharp/) is included as part of the Mono installation, this will allow you to create Gtk# applications on Windows with the Mono runtime which you can later deploy into Linux. See the [Gtk#](/docs/gui/gtksharp/) page for more details about the toolkit, or go directly to the [Monkeyguide](/archived/monkeyguide) to check the [Gtk# beginner's guide](/docs/gui/gtksharp/beginners-guide/).

The combined installer creates an "Applications" folder under the main Mono program group with two sample Gtk# applications which can be run to test your Gtk# installation.

[![WinMonoGtkStart.png](/archived/images/8/81/WinMonoGtkStart.png)](/archived/images/8/81/WinMonoGtkStart.png)

These are:

-   Prj2Make# GTK - This is a graphical interface to the prj2make library which can be used to generate Makefiles from Visual Studio.NET C# projects and solutions. You can find out more about this application in the article [Working with Mono and Visual Studio](/archived/working_with_mono_and_visual_studio).
-   Sql# GTK - A Graphical "Query Analyzer" style tool which supports several different databases.

Alternatively, if you only want to use Gtk# on Windows, without Mono, you can use the [Gtk# installer for the .NET Framework](/docs/gui/gtksharp/installer-for-net-framework/).

ASP.NET with Mono: xsp & xsp2
-----------------------------

The combined installer also creates an "XSP" folder under the main Mono program group with links to run XSP and XSP2, the Mono ASP.NET and ASP.NET 2.0 Web Servers.

[![WinMonoXspStart.png](/archived/images/5/54/WinMonoXspStart.png)](/archived/images/5/54/WinMonoXspStart.png)

To test XSP, simply start the Web Server with:

-   The "XSP Test Web Server" or "XSP 2.0 Test Web Server" shortcut, and browse to the server using
-   The corresponding "XSP Index Page" or "XSP 2.0 Index Page" shortcut.

Contents of the Mono Packages for Windows
=========================================

The Mono packages for Windows, include the following Mono packages:

-   Gtk# 1.0
-   Gtk# 2.0
-   sql#
-   prj2make
-   XSP
-   mono
-   mcs

as well as the following dependencies:

-   GTK+ 2.4.14
-   Glib 2.4
-   Gda 2.4
-   Pango 2.4
-   glade 2 and libglade
-   libArt
-   libjpeg
-   libtiff
-   libpng
-   pkg-config

