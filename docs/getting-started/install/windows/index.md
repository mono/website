---
title: Instalando Mono no Windows
redirect_from:
  - /Using_Mono_on_Windows/
  - /Mono:Windows/
---

O Mono roda no Windows, esta página descreve os vários recursos disponíveis para os usuários que querem usar Mono no Windows, bem como a utilização de tecnologias baseadas em Mono no Windows sem Mono (como Gtk #)

<<<<<<< HEAD
Instalando o Mono no Windows
============================

1.  Baixe o último instalador do Mono para Windows em [Downloads](/download/)
2.  Execute o programa baixado como administrador. Durante a instalação lhe será perguntado se aceita os termos da licença, apresentada com a página de informações, bem como pedidas algumas poucas outras informações, incluindo:
    [![windows-install-mono.png](/images/windows-install-mono.png)](/images/windows-install-mono.png)

A instalação padrão cria uma pasta "Mono for Windows" dentro do Menu Iniciar com um atalho "Open Mono Command Prompt".
Este atalho abre um shell de linha de comando com o PATH ajustado para o Mono, o que significa que as ferramentas do Mono "simplesmente funcionam".

	[![windows-install-mono-cmd.png](/images/windows-install-mono-cmd.png)](/images/windows-install-mono-cmd.png)

Neste ponto é uma boa idéia 'passear' pelos exemplos básicos de "hello world" desta [ página](/docs/getting-started/mono-basics/) para verificar que o Mono está funcionando corretamente.

Gtk#
-----

O [Gtk#](/docs/gui/gtksharp/) está incluido como parte da instalação do Mono, isso permite que você crie aplicações Gtk# em Windows como o runtime do Mono que depois você pode instalar em Linux. Veja a página do [Gtk#](/docs/gui/gtksharp/) para mais detalhes sobre o toolkit, ou vá direto ao [Guia para Iniciantes do Gtk#](/docs/gui/gtksharp/beginners-guide/).

Alternativamente, se você só quiser usar o Gtk# em Windows, sem o Mono, você pode usar o [Instalador do Gtk# para .NET](/docs/gui/gtksharp/installer-for-net-framework/).
