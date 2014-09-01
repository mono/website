---
title: Documentação
redirect_from:
  - /Documentation/
  - /Class_Library_Documentation/
  - /Docs/
---

Estes documentos cobrem tópicos específicos do Mono, como ajustar e configurar o Mono ou informações internas do Mono como as da máquina virtual, coletor de lixo ou várias ferramentas específicas do Mono. 

Informações gerais sobre o Framework .NET e sobre as bibliotecas de classes você pode buscar no site da Microsoft [MSDN pages](http://msdn.microsoft.com/en-us/library/ff361664.aspx).

{% capture docNote %}
A documentação é open source e está (em Inglês) no [GitHub](https://github.com/mono/website/docs), a versão em Pôrtugues do Brasil está sendo mantida pela comunidade MonoBrasil em [GitHub](https://github.com/monobrasil/website/docs). 
Caso você encontre erros ou pense que algo possa ser melhorado, apenas clique no link "Edit page on GitHub" abaixo do título da página. Veja [Contribuindo com o Site](https://github.com/mono/website#contributing-to-the-website) para maiores detalhes.
{% endcapture %}
{% include note.html type='info' message=docNote %}

Começando
---------

 - [Visão Geral](/docs/getting-started/)
 - Instalando o Mono no [Mac OS X](/docs/getting-started/install/mac/), no [Linux](/docs/getting-started/install/linux/) ou no [Windows](/docs/getting-started/install/windows/)
 - [O Básico do Mono](/docs/getting-started/mono-basics/)
 - [Ambientes de Desenvolvimento](/docs/getting-started/development-environments/)
 - [Portabilidade de Aplicações](/docs/getting-started/application-portability/) e [Publicação de Aplicações](/docs/getting-started/application-deployment/)

Sobre o Mono
------------

 - [Visão Geral](/docs/about-mono/)
 - [Plataformas Suportadas](/docs/about-mono/supported-platforms/)
 - [Linguagens](/docs/about-mono/languages/)
 - [Compatibilidade](/docs/about-mono/compatibility/) e [Status da Bibliotecas de Classes](/docs/about-mono/class-status/) 
 - [Liberações](/docs/about-mono/releases/) e [Versionamento](/docs/about-mono/versioning/) 
 - [Mantenedores](/docs/about-mono/maintainers/)
 - [História](/docs/about-mono/history/), [Preocupações com o uso do Mono](/docs/about-mono/concerns-about-mono/)
 - [A Estrada a Frente](/docs/about-mono/roadmap/) e [Planos](/docs/about-mono/plans/)
 - [Vulnerabilidades](/docs/about-mono/vulnerabilities/)
 - Mostra: [Captura de Telas](/docs/about-mono/showcase/screenshots/), [Software](/docs/about-mono/showcase/software/), [Companhias Usando o Mono](/docs/about-mono/showcase/companies-using-mono/), [Logotipos do Mono](/docs/about-mono/logos/)

Compilando o Mono
--------------

 - [Visão Geral](/docs/compiling-mono/), com instruções para compilar em OS X, Linux e Windows
 - [Compilando a Partir do Git](/docs/compiling-mono/compiling-from-git/) e [Compilando a Partir do Tarball](/docs/compiling-mono/compiling-from-tarball/)
 - [Opções Avançadas de Compilação](/docs/compiling-mono/advanced-mono-compile-options/)
 - [Opções Avançadas de Compilação Não-Suportadas](/docs/compiling-mono/unsupported-advanced-compile-options/)
 - [Instalações Paralelas do Mono](/docs/compiling-mono/parallel-mono-environments/)
 - [Versões Enxutas](/docs/compiling-mono/small-footprint/)

FAQ
---

 - [Geral](/docs/faq/general/)
 - [Securança](/docs/faq/security/)
 - [Técnico](/docs/faq/technical/)
 - [Licenciamento](/docs/faq/licensing/)
 - [Documentação](/docs/faq/documentation/)
 - [ASP.NET](/docs/faq/aspnet/)
 - [GTK](/docs/faq/gtk/)
 - [WinForms](/docs/faq/winforms/)

Acessando Banco de Dados
------------------------

 - [Visão Geral](/docs/database-access/)
 - [ADO.NET](/docs/database-access/adonet/)
 - [EntityFramework](/docs/database-access/entityframework/)

Debug e Profile
-----------------

 - [Debug - Visão Geral](/docs/debug+profile/debug/)
   - [Debugger](/docs/debug+profile/debug/debugger/)
 - [Profile - Visão Geral](/docs/debug+profile/profile/)
   - [Profiler](/docs/debug+profile/profile/profiler/)
   - [HeapShot](/docs/debug+profile/profile/heapshot/)
   - [DTrace](/docs/debug+profile/profile/dtrace/)
   - [Cobertura de Código](/docs/debug+profile/profile/code-coverage/)

GUI
---

 - [GUI Toolkits](/docs/gui/gui-toolkits/)
 - [WinForms](/docs/gui/winforms/)
 - [Gtk#](/docs/gui/gtksharp/)
 - [Drawing](/docs/gui/drawing/)
 - [libgdiplus](/docs/gui/libgdiplus/)
 - [WPF](/docs/gui/wpf/)

Web
---

 - [ASP.NET](/docs/web/aspnet/)
 - [WCF](/docs/web/wcf/)
 - [FastCGI](/docs/web/fastcgi/)
 - [mod_mono](/docs/web/mod_mono/)
 - [Moonlight](/docs/web/moonlight/)
 - [Portando Aplicações ASP.NET](/docs/web/porting-aspnet-applications/)
 - [Usando Certificados de Cliente com o XSP](/docs/web/using-clientcertificates-with-xsp/)

Ferramentas e Bibliotecas
-------------------------

 - [Ferramentas - Visão Geral](/docs/tools+libraries/tools/)
   - [Gendarme](/docs/tools+libraries/tools/gendarme/)
   - [MoMA](/docs/tools+libraries/tools/moma/)
   - [XBuild](/docs/tools+libraries/tools/xbuild/)
 - [Biblitecas - Visão Geral](/docs/tools+libraries/libraries/)
   - [MonoMac](/docs/tools+libraries/libraries/monomac/)
   - [XML](/docs/tools+libraries/libraries/xml/)
   - [Mono.Cairo](/docs/tools+libraries/libraries/Mono.Cairo/)
   - [Mono.Cecil](/docs/tools+libraries/libraries/Mono.Cecil/)

Tópicos Avançados
-----------------

 - [Runtime](/docs/advanced/runtime/)
 - [Garbage Collector - SGEN](/docs/advanced/garbage-collector/sgen/)
   - [GC Benchmark Suite](/docs/advanced/garbage-collector/benchmark-suite/)
 - [AOT](/docs/advanced/aot/)
 - [Embedding](/docs/advanced/embedding/)
 - [Assemblies e o GAC](/docs/advanced/assemblies-and-the-gac/)
 - [P/Invoke](/docs/advanced/pinvoke/)
 - [IOMap](/docs/advanced/iomap/)
 - [monolite](/docs/advanced/monolite/)
 - [Mono LLVM](/docs/advanced/mono-llvm/)
 - [CAS](/docs/advanced/cas/)
 - [COM](/docs/advanced/com/)
   - [COM-Interop](/docs/advanced/com-interop/)
 - [CoreCLR](/docs/advanced/coreclr/)
   - [CoreCLR HowTo](/docs/advanced/coreclr-howto/)
 - [Dicas de Performance](/docs/advanced/performance-tips/)
 - [SafeHandles](/docs/advanced/safehandles/)
 - [Sandbox](/docs/advanced/sandbox/)
