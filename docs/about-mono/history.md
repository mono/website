---
title: História
redirect_from:
  - /History/
---

Aqui algumas datas importantes para o Mono.

Posts Recentes
===========

-   [Mono e Gnome, a longa resposta (em inglês)](http://mail.gnome.org/archives/gnome-hackers/2002-February/msg00031.html) [Cópia Local](/archived/mailpostlongreply "Mailpost:longreply")
-   [A história inicial do Mono](http://lists.ximian.com/archives/public/mono-list/2003-October/016345.html) [Copia Local](/archived/mailpostearlystory "Mailpost:earlystory")

Marcos Importantes
==========

2001
----

-   30 de Junho: O projeto Mono é anunciado.

-   21 de Agosto: Um serviço de compilação remota é criado. As pessoas que contribuem para o Mono podem enviar seus códigos via web e compilar o código com o Compilador C# da Microsoft.

-   28 de Agosto: O ambiente de execução do Mono roda o "Hello World" pela primeira vez. O "Hello World" consiste de 1821 instruções CIL, executa 66 chamadas de subrotinas e carrega 12 classes da biblioteca corlib.dll

-   04 de Setembro: O mecanismo de seleção de instruções por casamento de padrões (pattern matching) em árvore (monoburg) é incorporado no CVS, este é o início do sistema gerador de código nativo Mono.

-   05 de Setembro: O compilador de Mono C# que é escrito em C# compila seu primeiro programa: "Hello World" no Windows usando o .NET runtime. O executável gerado, roda no Linux como o runtime de 28 de Agosto.

-   10 de Setembro: Dietmar Maurer incorpora as regras de geração de código x86 para o monoburg.

-   17 de Setembro: A primeira versão do Gtk# é incorporada no repositório CVS do Mono.

-   18 de Setembro: É lançada a versão 0.7 do Mono.([release notes](http://www.go-mono.com/archive/mono-0.7)).

-   21 de Setembro: Dick Porter fornece o suporte inicial de thread no interpretador do Mono. Paolo Molaro implementa muitos novos opcodes; Dietmar Maurer faz com que operações com long e mul/div funcionem no motor do JIT.. Ravi reescreve o seletor de metodos para expressões ficarem conformes; Miguel faz o compilador C# entender e compilar o operador de incremento (i++).

-   26 de Setembro: O sistema de compilação baseado em Ant é contribuido por Sergey e Sean. Nós mantivemos o duplo sistema de compilação baseado em Makefiles e Ant por algum tempo.

-   04 de Outubro: O suporte para o Mono está completo o suficiente para gerar um programa de exemplo.

-   05 de Outubro: Sergey publica seu IL assembler.

-   04 de Novembro: Mike posta uma [atualização sobre o Gtk#](http://lists.ximian.com/archives/public/gtk-sharp-list/2001-November/000017.html)

-   14 de Novembro: Paolo Molaro incorpora o código que faz o compilador C# rodar e compilar "Hello World" no Linux pela primeira vez.

-   30 de Novembro: Diemar deixa o JIT em boa forma: Todos os testes que nós tinhamos rodando com o interpretador Mono agora rodam no motor JIT do Mono.

-   11 de Dezembro: O motor JIT está apto a executar o compilador Mono C# e rodar todos os testes anteriores.

-   28 de Dezembro: O compilador Mono C# compila a si mesmo, mas o código gerado ainda não está correto.

2002
----

-   03 de Janeiro: O compilador Mono C# pode compilar a si próprio utilizando a plataforma .NET. O próximo passo é fazer o mesmo ser possível na própria plataforma do Mono.

-   04 de Janeiro: O Mono implementa suporte a Unicode.

-   21 de Janeiro: Dick postou uma screenshot de um simples web server rodando em Mono. [here](http://primates.ximian.com/~miguel/dick-mis-server.png). Este web server é utilizado para testar e exercitar nossa camada de E/S.

-   23 de Janeiro: Lançada a lista de e-mails mono-patches. Cada patch é enviado as pessoas da lista de e-mails. Começa a era das revisões assíncronas.

-   28 de Janeiro: As bibliotecas de classes do Mono são relicensiadas do LGPL para a licença [MIT X11](http://www.opensource.org/licenses/mit-license.html).

-   29 de Janeiro: Dan Lewis contribui para o System.Text.RegularExpressions.

-   11 de Fevereiro: Porte inicial do interpretador Mono para as arquiteturas SPARC e PowerPC.

-   13 de Fevereiro: Dietmar incorpora o código para de suporte a AppDomains, Nick Drochak lidera grupo que usa NUnit para testar a implementação atual das bibliotecas de classes.

-   22 de Fevereiro. É lançado o [Mono 0.9] [released](http://www.go-mono.com/archive/mono-0.9).

-   25 de Fevereiro: O porte para StrongARM do interpretador do Mono, contribuido pelo Sergey, é incorporado.

-   07 de Março: Primeira vez que o compilador Mono C# compila no Linux.

-   12 de Março: Paolo providencia que o compilador Mono C# se auto-hospede no Linux. P

-   25 de Junho: Piers Haken contribui para a implementação inicial do XPath para o Mono e Dick Porter contribui a implementação da classe Process e a sua infraestrutura relacionada.

-   30 de Junho: O compilador C# do Mono finalmente consegue compilar a nossa implementação da mscorlib, a ultima peça para alcançar a auto-hospedagem do Mono runtime.

2004
----

-   30 de Junho: Lançado o Mono 1.0


