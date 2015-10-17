---
title: OSX
redirect_from:
  - /Mono:OSX/
  - /Mono_on_MacOS_X/
---

Introdução ao Mono no MacOS X
-------------------------------

O Mono suporta as versão 10.7 (Lion) e superiores do Mac OS X.

Você pode utilizar o Mono no OSX para construir aplicações console, server e com interface gráfica para usuários. Abaixo você vai encontrar uma lista de opções para construção de aplicações disponíveis para criação de interface gráfica para usuários.

Se você está interessado em criar aplicações que utilizam GUI nativas, utilize o [MonoMac](/docs/tools+libraries/libraries/monomac/) ou o MonoDevelop add-in. Leia a descrição na página [MonoMac](/docs/tools+libraries/libraries/monomac/), para obter mais informações de como você pode começar.

Instalando o Mono no MacOS X
--------------------------

Você pode utilizar o mono como runtime para execução de aplicações pre existentes, ou como SDK para desenvolver novas aplicações.

Na [página de downloads](/download/) você vai enconrar a versão mais recente do pacote para MacOS X. Seguindo as instruções disponíveis nesta página, você pode instalar uma runtime basica, ou completa incluindo a SDK. 

Se você pretente desenvolver aplicações utilizando o Mono, nós sugerimos que você tambem efetue o download e instale a [IDE MonoDevelop](http://monodevelop.com/download) logo depois que você já tiver instalado o Mono.

O pacote do Mono inclui:

-   A Runtime do Mono
-   GUI Toolkits: Windows.Forms e Gtk# para OSX.
    -   Observação: A GUI toolkit [MonoMac](/docs/tools+libraries/libraries/monomac/) para desenvolvimento de GUI nativas, para OSX está disponível em um pacote para download separado.
-   SDK: compiladores C#, Visual Basic, assemblers e tools (ferramentas).
-   XSP ASP.NET server
-   Manuais.

O pacote do Mono instala o framework no diretorio /Library/Framework (da mesma forma que os pacotes Java são instalados). São criados symlinks para os executaveis localizados em /usr/bin. Caso você queira acessa a mono *manpages* é necessario acrescentar /Library/Frameworks/Mono.framework/Versions/Current/man ao seu *manpath*. O pacote do Mono para MacOS C não incluem [Gtk#](/GtkSharp), XSP ou mod_mono, eles devem ser compilados a partir de sua origem.

Caso você precise utilizar o Mono em uma versão do OSX inferior a 10.7 tera que compilar a partir da origem.

Utilizando o Mono no MacOS X
---------------------

Por enquanto você precisa utilizar o Mono partindo do Terminal via linha de comando, não se preocupe pois os comandos usuais que estão disponíveis em outros ports do Mono tambem já incluidos. 

Para compilar suas aplicações você pode utilizar o comando ["mcs"](/docs/about-mono/languages/csharp/) e para executá-las você deve executar o comando [mono](/docs/advanced/runtime/).

Vamos tentar? Abra o Terminal e execute os comandos abaixo:

``` bash
$ vi hello.cs
$ mcs hello.cs
$ mono hello.exe
Hello, World
$
```
A maioria dos usuários deve estar utilizando o 

A maioria dos usuários estariam usando  [MonoDevelop IDE](http://monodevelop.com) para criar suas aplicações.

Vocë pode escolher entre o [GUI toolkits](/docs/gui/gui-toolkits/) para construir as suas aplicações cross platform, para aplicações especificas para o Mac pode utilizar o [MonoMac](/docs/tools+libraries/libraries/monomac/).

Suporte a 32 e a 64 bit
---------------------

The Mono packages published on this web site provide a 32-bit Mono VM.

Support for 64-bit VMs as of Mono 2.10 is only available if you build Mono from source code and install your own copy of the VM. In the future we will ship both mono and mono64 binaries for our users.

The 64 bit support has a few limitations today which is why we have not entirely switched to it:

-   Our Windows.Forms implementation uses Carbon, and as such, it would not work with a 64-bit Mono.
-   MonoDevelop uses Carbon for its menu integration so it would not run on a 64-bit VM.
-   MonoMac bindings have not been ported to 64 bits.

Supporting 64-bit Mono across the board would also require us to ship a 64-bit Gtk+ stack and that would increase the download size for most users.

Building Client Applications
----------------------------

There are a few choices to build client applications on OSX, you should pick the technology that better fits your goals, your choices are:

||
|Toolkit|Runs on Linux|Runs on Windows|Runs on Mac|Binding Style|License|Status|
|[MonoMac](/docs/tools+libraries/libraries/monomac/)|no|no|yes|Strongly typed C# binding to Cocoa APIs|MIT X11|Actively developed, builds on the design lessons from [MonoTouch](http://monotouch.net) but still incomplete. This will be the new default binding for Mono on OSX. Separate download.|
|Gtk#|yes|yes|yes|Strongly typed C# binding to the cross platform Gtk+ API. Applications look foreign on OSX.|LGPL v2|Actively developed, cross platform. Bundled with Mono.|
|Windows.Forms|yes|yes|yes|Cross platform implementation of Microsoft's Windows.Forms. Applications look foreign on OSX.|MIT X11|The Windows.Forms API was frozen in time by Microsoft. Bundled with Mono.|
|[MonObjc](http://www.monobjc.net)|no|no|yes|Binding to the native Cocoa APIs, but requires manual use of Objective-C selectors to work with, relatively thin wrapper around the underlying APIs.|LGPL v3|Actively developed. Separate download.|
|CocoaSharp|no|no|yes|Binding to the native Cocoa APIs, but requires manual use of Objective-C selectors to work with, relatively thin wrapper around the underlying APIs.|MIT X11|No longer developed, no longer maintained, deprecated. Bundled with Mono.|

Running Mono applications on MacOS X
------------------------------------

Running applications on MacOS X is very similar to linux systems, from the terminal:

    mono myprogram.exe

For GTK# applications, it's easiest to run them the same way but using *xterm* from X11.app

    A MacOS X specific Mono launcher was in development but its status is unclear today

Windows.Forms
-------------

Mono's implementation of the System.Windows.Forms API is built on top of Carbon and can only run with Mono on 32 bit systems. The look and feel of System.Windows.Forms applications mimics the Windows style and does not currently render like a native OSX application.

Third Party Libraries
---------------------

[ObjC#](/archived/objcsharp) is a transparent two way bridge that allows the CLR to access the rich underlying ObjectiveC frameworks as well as providing direct access to the CLR frameworks from the ObjectiveC language.

Uninstalling Mono on Mac OS X
-----------------------------

Run this script in a terminal:

    #!/bin/sh -x

    #This script removes Mono from an OS X System.  It must be run as root

    rm -r /Library/Frameworks/Mono.framework

    rm -r /Library/Receipts/MonoFramework-*

    for dir in /usr/bin /usr/share/man/man1 /usr/share/man/man3 /usr/share/man/man5; do
       (cd ${dir};
        for i in `ls -al | grep /Library/Frameworks/Mono.framework/ | awk '{print $9}'`; do
          rm ${i}
        done);
    done

