---
title: Sobre o Mono
redirect_from:
  - /About_Mono/
  - /About/
  - /about/
  - /Mono:About/
  - /What_is_Mono/
  - /What_is_Mono%3F/
---

Mono, a plataforma de código aberto de desenvolvimento baseada no framework .NET, permite aos desenvolvedores construir aplicações multi-plataforma com maior produtividade. A implementação .NET do Mono é baseada nas padronizações ECMA para o [C#](http://www.ecma-international.org/publications/standards/Ecma-334.htm) e o [Common Language Infrastructure](http://www.ecma-international.org/publications/standards/Ecma-335.htm).

Apoiado anteriormente pela Novell e agora pela [Xamarin](http://xamarin.com/), o projeto Mono tem uma ativa e entusiástica comunidade de contribuidores. O Mono inclue ferramentas de desenvolvimento e a infraestrutura necessária para rodar aplicações .NET cliente e servidor.

Os Componentes
--------------

Existem diversos componentes que forma o Mono:

**[Compilador C#](/docs/about-mono/languages/csharp/)** - O compilador C# do Mono tem todas as funcionalidades das versões do C# 1.0, 2.0, 3.0, 4.0 e 5.0 (ECMA). Uma boa descrição das funcionalidades de cada versão está disponível na [Wikipedia](http://en.wikipedia.org/wiki/C_Sharp_%28programming_language%29#Versions).

**[Runtime do Mono](/docs/advanced/runtime/)** - O runtime (ambiente de execução) implementa a Common Language Infrastructure (CLI) do ECMA. O runtime prove um compilador Just-in-Time (JIT), um compilador Ahead-of-Time (AOT), um carregador de bibliotecas, o coletor de lixo, o sistema de execução concorrente (threads) e funcionalidade de interoperabilidade com bibliotecas nativas.

**Biblioteca de Classes Base** - A plataforma Mono provê um extenso conjunto de classes que fornece uma fundação sólida para construir aplicações. Estas classes são compatíveis com as classes do Framework .Net da Microsoft.

**Biblioteca de Classes do Mono** - O Mono também provê muitas classes que vão acima e além do que a Biblioteca de Classes Base fornecida pela Microsoft. Estes fornecem funcionalidade adicional utéis, especialmente para construir aplicações Linux. Alguns exemplos são de classes para Gtk+, arquivos Zipados, LDAP, OpenGL, Cairo, POSIX, etc.

Pontos Altos das Capacidades do Mono
------------------------------------

[Multi-Plataforma](/docs/about-mono/supported-platforms/)<br/>
Roda em [Linux](/docs/about-mono/supported-platforms/linux/), [OS X](/docs/about-mono/supported-platforms/osx/), [BSD](/docs/about-mono/supported-platforms/bsd/), e [Microsoft Windows](/docs/getting-started/install/windows/), incluindo hardware [x86](/docs/about-mono/supported-platforms/x86/), [x86-64](/docs/about-mono/supported-platforms/amd64/), [ARM](/docs/about-mono/supported-platforms/arm/), [s390](/docs/about-mono/supported-platforms/s390/), [PowerPC](/docs/about-mono/supported-platforms/powerpc/) e muito mais...

[Multi-Linguagem](/docs/about-mono/languages/)<br/>
Desenvolva em [C# 4.5](/docs/about-mono/languages/csharp/) (incluindo LINQ e `dynamic`), [VB 8](/docs/about-mono/languages/visualbasic/), [Java](/docs/about-mono/languages/java/), [Python](/archived/python "Python"), [Ruby](http://www.ironruby.net/), [Eiffel](http://www.eiffel.com/), [F#](http://research.microsoft.com/fsharp/), [Oxygene](http://remobjects.com/oxygene), [Boo](http://pt.wikipedia.org/wiki/Boo) e mais...

Compatibilidade Binária<br/>
Construa sua aplicação em uma implementação no padrão [ECMA](/docs/about-mono/languages/ecma/) do [Common Language Infrastructure](/docs/advanced/runtime/)e do [C#](/docs/about-mono/languages/csharp/).

[API Compatível com a Microsoft](/docs/getting-started/application-portability/)<br/>
Rode aplicações [ASP.NET](/docs/web/aspnet/), [ADO.NET](/docs/database-access/adonet/), [Silverlight](/docs/web/moonlight/) e [Windows.Forms](/docs/gui/winforms/) sem recompilação.

[Código Aberto, Software Livre](/docs/faq/licensing/)<br/>
O runtime, compiladores, e bibliotecas do Mono são distribuidos sob licenças aprovadas pela OSI e estão disponíveis para licenciamento-dual.

[Extensiva Cobertura Tecnológica](/docs/about-mono/plans/)<br/>
Conexões nativas(bindings) e implementações gerenciadas de muitas bibliotecas e protocolos.

Os Benefícios
-------------

Existem muitos benefícios para quem escolhe o Mono para desenvolver suas aplicações:

**Popularidade** - Construido sobre o sucesso do .Net, existem milhões de desenvolvedores com experiência em criar aplicações em C#. Existem dezenas de milhares de livros, websites, tutoriais, e exemplos de código fontepara ajudar com qualquer problema imaginável.

**Programação de Nível Mais Elevado** - Todas as linguagens do Mono beneficiam-se das muitas funcionalidade do runtime, como gerenciamento automático de memória, instrospecção (reflection), generics, e threading. Essas funcionalidades permitem que você se concentre em escrever aplicação ao invés de escrever código de infraestrutura.

**Biblioteca de Classes Base** - Ter uma extensa biblioteca de classes provê milhares de classes prontas para aumentar a produtividade. Precisa de código de rede ou uma hashtable? Não precisa escrever a sua use a embutida na plataforma.

**Multi-Platform** - O Mono foi construido para ser multi-plataforma. O Mono roda em [Linux](/docs/about-mono/supported-platforms/linux/), [Microsoft Windows](/docs/getting-started/install/windows/), [Mac OS X](/docs/about-mono/supported-platforms/osx/), [BSD](/docs/about-mono/supported-platforms/bsd/), e [Sun Solaris](/docs/about-mono/supported-platforms/solaris/), [Nintendo Wii](/docs/about-mono/supported-platforms/wii/), [Sony PlayStation 3](/docs/about-mono/supported-platforms/playstation3/), [Apple iPhone](/docs/about-mono/supported-platforms/iphone/) e [Android](/docs/about-mono/supported-platforms/android/). Ele também roda em hardware [x86](/docs/about-mono/supported-platforms/x86/), [x86-64](/docs/about-mono/supported-platforms/amd64/), [IA64](/docs/about-mono/supported-platforms/ia64/), [PowerPC](/docs/about-mono/supported-platforms/powerpc/), [SPARC (32)](/docs/about-mono/supported-platforms/sparc/), [ARM](/docs/about-mono/supported-platforms/arm/), Alpha, [s390, s390x (32 and 64 bits)](/docs/about-mono/supported-platforms/s390/) e mais. Desenvolvendo em Mono a sua aplicação lhe permite rodar em praticamente qualquer computador existente.

**Common Language Runtime (CLR)** - O CLR permite escolher a linguagem de programação que melhor funciona para você, e poder interoperar com código escrito em qualquer outra linguagem CLR. Por exemplo, você pode escrever uma classe em C#, herdar dela em VB.Net, e usar em Eiffel ou F#. Você pode escrever o código para o Mono em uma [variedae de linguagens de programação](/docs/about-mono/languages/).

Outros Usos
-----------

[Scripting](/docs/advanced/embedding/scripting/) e [Embarcar](/docs/advanced/embedding/) - O runtime do Mono pode ser usado para adicionar funcionalidade de scripting ao embarcá-lo na sua aplicação,para permitir execução de código gerenciado e de scripts na sua aplicação nativa.

Veja [Embarcando o Mono](/docs/advanced/embedding/) para detalhes sobre como embutir o Mono.

Veja [Scripting com o Mono](/docs/advanced/embedding/scripting/) para estratégias para habilitar scripts na sua aplicação usando o Mono.
