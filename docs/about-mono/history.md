---
title: História
redirect_from:
  - /History/
---

Aqui algumas datas importantes para o Mono.

Posts Recentes
===========

-   [Mono and GNOME, the long reply](http://mail.gnome.org/archives/gnome-hackers/2002-February/msg00031.html) [Local Copy](/archived/mailpostlongreply "Mailpost:longreply")
-   [Mono early history](http://lists.ximian.com/archives/public/mono-list/2003-October/016345.html) [Local Copy](/archived/mailpostearlystory "Mailpost:earlystory")

Marcos Importantes
==========

2001
----

-   30 de Junho: O projeto mono é anunciado.

-   21 de Agosto: Um serviço de compilação remota é criado. As pessoas que contribuem para o Mono podem enviar seus códigos via web e compilar o código com o Mirosoft C# Compiler.

-   28 de Agosto: O Mono runtime roda "Hello World" pela primeira vez. Hello World consiste em 1821 instruções CIL, executa 66 chamadas de subrotinas e carrega 12 classes da biblioteca corlib.dll

-   04 de Setembro: O modelo de seleção de instruções monoburg tree é verificada em CVS, este é o início do sistema gerador de código nativo Mono.

-   05 de Setembro: O compilador de Mono C# que é escrito em C# compila seu primeiro programa: "Hello World" no Windows usando o .NET runtime. O executável gerado, roda no Linux como o runtime de 28 de Agosto.

-   10 de Setembro: Dietmar Maurer verifica as regras do compilador x86 para o monoburg.

-   17 de Setembro: A primeira versão do Gtk# é verificada com repositório do Mono CVS.

-   18 de Setembro: É lançcada a versão 0.7 do Mono.([release notes](http://www.go-mono.com/archive/mono-0.7)).

-   21 de Setembro: Dick Portner fornece o suporte inicial de thread no interpretador do Mono. Paolo Molaro implementa muitos novos opcodes; Dietmar Maurer faz com que long operations e mul/div trabalhem com a engine JIT. Ravi reescreve o seletor de metodos para expressões ficarem conformes; Miguel faz i++ trabalhar com o compilador.

-   26 de Setembro: O sistema de construção baseada em Ant recebe a contribuição de Sergey e Sean. Nós vamos manter o duplo sistema de construção baseado em Makefiles e Ant por algum tempo.

-   04 de Outubro: O suporte para o Mono está completo e suficiente para gerar um programa de exemplo.

-   05 de Outubro: Sergey publica seu IL assembler.

-   04 de Novembro: Mike posta o [update on Gtk#](http://lists.ximian.com/archives/public/gtk-sharp-list/2001-November/000017.html)

-   14 de Novembro: Paolo Molaro verifica no código que fazer o compilador C# rodar e compilar "Hello World" no Linux pela primeira vez.

-   30 de Novembro: Diemar traz para o JIT uma boa solução: Todos os testes que nós tivemos com o interpretador Mono agora são executados com a Mono JIT engine.

-   11 de Dezembro: A engine JIT está apta para hospedar o compilador Mono C# e rodar todos os testes anteriores.

-   28 de Dezembro: O compilador Mono C# compila a si mesmo, mas o código gerado ainda não está correto.

2002
----

-   03 de Janeiro: O compilador Mono C# pode compilar a si próprio utilizando a plataforma .NET. O próximo passo é inicializar com a plataforma Mono (Mono runtime).

-   04 de Janeiro: Mono recebe suporte Unicode.

-   21 de Janeiro: Dick postou uma screenshot de um simples web server rodando em Mono. [here](http://primates.ximian.com/~miguel/dick-mis-server.png). Este web server é utilizado para testar e exercitar nossas camadas de IO.

-   23 de Janeiro: Lançado os mon-patches para a lista de e-mails. Cada patch é enviado as pessoas da lista de e-mails. Começa a era das revisões assíncronas.

-   28 de Janeiro: As bibliotecas de classes do Mono são relicensiadas do LRPL para a licensa [MIT X11](http://www.opensource.org/licenses/mit-license.html).

-   29 de Janeiro: Dan Lewis contribui para o System.Text.RegularExpressions.

-   11 de Fevereiro: Portas iniciais do interpretador Mono to SPARC e PowerPC.

-   13 de Fevereiro: Dietmar checa o código para suporte de AppDomains, Nick Drochak levou o grupo para usar NUnit para testar a implementação atual das bibliotecas de classes.

-   22 de Fevereiro. É lançado o Mono 0.9 [released](http://www.go-mono.com/archive/mono-0.9).

-   25 de Fevereiro: A porta Sergey´s StrongARM do Mono é verificada.

-   07 de Março: Primeira vez que o compilador Mono C# compila no Linux.

-   12 de Março: Paolo providencia que o compilador Mono C# se auto-hospede no Linux. P

-   25 de Junho: Piers Haken contribui para a implementação do Xpath inicial para Mono e Dick Portner contribui para processas as classes e se relacionarem com a estrutura do Mono.

-   30 de Junho: O compilador Mono C# está pronto para construir mscorlib, a ultima peça para alcançar a auto-hospedagem do Mono runtime.

2004
----

-   30 de Junho: Lançado o Mono 1.0


