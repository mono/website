---
title: Repositório de Fontes
redirect_from:
  - /SourceCodeRepository/
  - /AnonSVN/
  - /SVN/
---

O fonte do Mono está hospedado no [GitHub](http://GitHub.com) usando o [Git](http://git-scm.com/) como sistema de controle de fontes para todo o seu código. Embora só contribuidores ativos tenham acesso de escrita ao módulos via Git, outros desenvolvedores podem facilmente realizar um ```fork``` do código no GitHub ou baixar uma cópia completa dos repositórios para seu próprios sistemas.

Aqui descrevemos com alguém pode obter acesso de escrita (commit) no repositório Git do Mono e as responsabilidades que vem junto com esse privilégio.

Olhando os Fontes
-----------------

Se tudo que você precisa é olhar os fontes, vá diretamente para a página da nossa [organização no GitHub](https://github.com/mono).

Compilando o Mono
-----------------

Uma vez que você obteve os fontes dos diferentes módulos do projeto Mono, você provavelmente quererá [compilar o Mono a partir dos fontes](/docs/compiling-mono/)

Contribuindo Patches
====================

Agora que o Mono está hospedado no GitHub, contribuir se tornou muito mais fácil. Se você não está familiarizado com o Git/GitHub, você pode desejar ler o guia do próprio GitHub sobre [como começar a usar(em Inglês)](https://help.github.com/articles/set-up-git/).

Depois que você obteve a sua conta do GitHub e montou o seu ambiente, você deve ler o outro guia sobre [fazer um _fork_ de um repositório (em Inglês)](https://help.github.com/articles/fork-a-repo/). Assim que você achar que um patch está finalizado e que você testou que tudo ainda compila e funciona como esperado, você pode iniciar um [_pull request_](https://help.github.com/articles/using-pull-requests/) que alerta os mantenedores ativos que devem examinar e revisar o seu patch, mergeando o mesmo no repositório principal se ele for adequado.

Regras
======

É importante que todos sigam estas regras e convenções:

### Convenções de Código

Nós temos nosso conjunto de  [convenções de código](/community/contributing/coding-guidelines/).

### Licenciamento do Código

Se você está providenciando código para ser incorporado em algum módulo, esse código deve ser liberado sob uma licença X11. O código do Mono em sis está licenciado da seguinte forma: compiladores, bibliotecas de código e ferramentas em código gerenciado: X11; ambiente de execução: LGPL.

Se em dúvida, verifique com os mantenedores do módulo, ou mande um email para mono-devel-list@ximian.com.

### Alterando o Código Existente

Mesmo se você tem acesso de escrita nos repositórios oficiais do Projeto Mono no GitHub, isso não significa que você pode mudar o código ao seu bel-prazer em qualquer diretório ou módulo. Diretórios e Espaços de Nomes (Namespaces) têm 'donos' extra-oficiais. Se você não é o dono de um pedaço de código e quer fazer modificações/correções, existem dois casos:

- A alteração é de um pequeno erro tipográfico ou só uma linha de código, uma correção trivial. Neste caso quase qualquer um pode comitar (sempre lembrando de adicionar uma entrada na lista de alterações (changelog) para explicar a alteração). Nós dizemos "quase qualquer um", porque mudanças em alguns diretórios quase sempre devem ser revisadas antes. Mudanças para pedaços críticos como: corlib/System, System.Collections, mini/, metadata/, System.IO.

- A alteração é maior. Neste caso o patch **DEVE** ser enviado para a lista mono-devel-list para revisão pelo dono do código e por outros hackers. Sempre envie esses patches para lista ou no controle de bugs (bugzilla), embora você possa 'copiar' o dono do código no email. Hackers vem e vão. Enviando o patch apenas para um email pessoal é um bom jeito de vê-lo ser esquecido e perdido. Além disso, fazendo os patches serem revistos e revisando os de outros, é uma boa coisa, portanto se habitue a fazê-lo.

Nota: Se um patch é uma adição de código e não modifica nenhum código existente (inclusive configurações/scripts de compilação), as regras sem levemente mais relaxadas: existe liberdade para incorporar essas modificações, se eleas não interferirem com o código existente. Mas evitem entulhar o Mono, não queremos bloatware!

### Virando Dono de Código

Now, how do you get to be the owner of a chunk of code? The answer is simple. You wrote the code, so you're the unofficial owner. There is also another way. After sending a few patches for the code, the owner (or the core developers of mono, if the owner somehow disappeared) trusts you and tells you you're free to commit without getting his review first.

You can most likely find ownership by reading ChangeLogs or by using `git blame`. The entries are with emails, so feel free to ask them. If you are still unsure, post your patch to the mailing list (mono-devel-list).

If you are the owner of a piece of code, feel free to commit code, and delegate the work to others.

But, if you're not the owner of the code, committing a rewrite without getting a review first is frowned upon (especially when the rewrite claimed to fix bugs, but not a single regression test has been added to the suite).

### Pull-Request Rules

There are a few rules to follow before making a pull request on GitHub:

-   Always make sure to add meaningful commit logs

-   If you fix a bug, add a regression test for it in the [test suite](/community/contributing/test-suite/)

-   Don't commit unrelated changes together with a fix: do fine-grained commits

-   Always check what you're committing: make sure you're only committing what you need and make sure you don't change line endings and whitespace. Do a `git diff` of the files you're going to commit and check the changes.

-   Don't do reformatting commits, unless you're the original author of the code

-   When fixing bugs, don't follow the documentation blindly, it may well be wrong. Test the behavior on the MS runtime or ask on the list for discussion if unsure. Don't be afraid of having your changes reviewed.

-   Never remove copyright notices from the code

-   Never remove licensing info from code

-   Never commit code you didn't write yourself or code that doesn't have a suitable license

-   For documentation fixes, never copy paste documentation from Visual Studio class view or MSDN.

-   Never use a decompiler or disassembler to look at proprietary code.

-   Follow the [coding guidelines](/community/contributing/coding-guidelines/)

-   Keep an eye on performance considerations, especially for code in core classes, ask on the list for guidance

-   Do a regression test run and a bootstrapping build if making changes to core functionality before committing. Do not commit code that would break the compile, because that wastes everybody's time. Two things are important in this step: trying to build your sources and making sure that you add all the new files before you do a commit.

Also, remember to pat yourself on the back after the commit, smile and think we're a step closer to a better free software world.

Getting Help With Git
=====================

GitHub maintains some great resources for developers here:

[https://help.github.com/](https://help.github.com/)

Keeping track of code changes
=============================

### Via Email

We provide an e-mail based mechanisms to keep track of changes to the code base:

-   [mono-patches](http://lists.ximian.com/mailman/listinfo/mono-patches): This mailing list receives in patch form all the changes that are being made to git. To subscribe, send an email message to mono-patches-request@ximian.com and in the body of the message put \`subscribe' or click on the link.

This will send you an email message every time a change is made to the git repository, together with the information that the author of the changes submitted.
