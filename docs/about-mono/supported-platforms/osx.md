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

A maioria dos usuários utiliza o[MonoDevelop IDE](http://monodevelop.com) para criar suas aplicações.

Vocë pode escolher entre o [GUI toolkits](/docs/gui/gui-toolkits/) para construir as suas aplicações cross platform, para aplicações especificas para o Mac pode utilizar o [MonoMac](/docs/tools+libraries/libraries/monomac/).

Suporte a 32 e a 64 bit
---------------------

Os pacotes do Mono, publicados neste site são disponibilizados com suporte a Mono VM de 32-bit.

O suporte para VM de 64-bit assim como Mono 2.10, só está disponível se você compilar e criar sua propria VM partindo do codigo fonte do Mono. (macho que é macho compila a sua propria VM). Em um futuro iremos disponibilizar as duas versões dos binarios para download.

Atualmente o suporte a 64-bit possui algumas limitações e é por isso que por enquanto a versão do Mono não foi completamente alterada para ela.

-   A implementação do Windows.Forms utilizad Carbon e, como tal, não trabalha com a versão 64-bit do Mono.
-   MonoDevelop utiliza Carbon para integração do seu menu, por isso não vai rodar na versão 64-bit da VM.
-   Os bindings do MonoMac ainda não foram portados para a versão de 64 bits.

O suporte a 64-bit, exigiria a disponibilização de um pacote incluindo a versão 64-bit mais o stack Gtk+ o que aumentaria o tamanho do download para a maioria dos usuários.

Construindo aplicações Client
----------------------------

Existem algumas opções para construir aplicações no OSX, você deve escolher a tecnologia que melhor se adequa aos seus objetivos, você pode escolher entre:

||
|Toolkit|Runs on Linux|Runs on Windows|Runs on Mac|Binding Style|License|Status|
|[MonoMac](/docs/tools+libraries/libraries/monomac/)|no|no|yes|Strongly typed C# binding to Cocoa APIs|MIT X11|Actively developed, builds on the design lessons from [MonoTouch](http://monotouch.net) but still incomplete. This will be the new default binding for Mono on OSX. Separate download.|
|Gtk#|yes|yes|yes|Strongly typed C# binding to the cross platform Gtk+ API. Applications look foreign on OSX.|LGPL v2|Actively developed, cross platform. Bundled with Mono.|
|Windows.Forms|yes|yes|yes|Cross platform implementation of Microsoft's Windows.Forms. Applications look foreign on OSX.|MIT X11|The Windows.Forms API was frozen in time by Microsoft. Bundled with Mono.|
|[MonObjc](http://www.monobjc.net)|no|no|yes|Binding to the native Cocoa APIs, but requires manual use of Objective-C selectors to work with, relatively thin wrapper around the underlying APIs.|LGPL v3|Actively developed. Separate download.|
|CocoaSharp|no|no|yes|Binding to the native Cocoa APIs, but requires manual use of Objective-C selectors to work with, relatively thin wrapper around the underlying APIs.|MIT X11|No longer developed, no longer maintained, deprecated. Bundled with Mono.|

Executando aplicações Mono no MacOS X
------------------------------------

Executar aplicações no MacOS X é muito similiar a execução em sistemas Linux, partindo do Terminal digite:

    mono myprogram.exe

Para aplicações GTK#, o processo é facilitado, você de utilizar o *xterm* por X11.app

    Existe uma versão especifica em desenvolvimento do launcher para MacOS X Mono mas o seu atual status não esta claro.

Windows.Forms
-------------

Mono's implementation of the System.Windows.Forms API is built on top of Carbon and can only run with Mono on 32 bit systems. The look and feel of System.Windows.Forms applications mimics the Windows style and does not currently render like a native OSX application.

A implementação do Mono para a API System.Windows.Forms é construida em cima do Carbon e só pode ser executada com a versão 32 bits do Mono. O visual das aplicações System.Windows.Forms imita o estilo do Windows e atualmente não são renderizados como um aplicativo nativo OSX.

Bibliotecas de terceiros
---------------------

[ObjC#](/archived/objcsharp) é uma biblioteca que implementa de forma transparente uma ponte que permite ao CLR ter acesso aos frameworks do ObjectiveC (two way), proporcionando acesso direto aos frameworks da linguagem ObjectiveC.

Desinstalando o Mono no Mac OSX
-----------------------------

Execute no Terminal:

    #!/bin/sh -x

    #Este script remove o Mono do sistema OSC, você deve ter acesso de super usuário para executa-lo.

    rm -r /Library/Frameworks/Mono.framework

    rm -r /Library/Receipts/MonoFramework-*

    for dir in /usr/bin /usr/share/man/man1 /usr/share/man/man3 /usr/share/man/man5; do
       (cd ${dir};
        for i in `ls -al | grep /Library/Frameworks/Mono.framework/ | awk '{print $9}'`; do
          rm ${i}
        done);
    done

