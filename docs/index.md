---
title: Documentation
redirect_from:
  - /Documentation/
  - /Class_Library_Documentation/
  - /Docs/
---

Estes documentos cober tópicos específicos do Mono, como ajustar e configurar o Mono ou informações internas do Mono como as da máquina virtual, coletor de lixo ou várias ferramentas específicas do mono. 

Para informações gerais sobre o .NET Framework e sobre as bibliotecas de classe você pode buscar no site da  Microsoft [MSDN pages](http://msdn.microsoft.com/en-us/library/ff361664.aspx).

{% capture docNote %}
Nossa documentação é open source está [GitHub](https://github.com/mono/website/docs), a verão em portugues brasil está mantida pela comunidade MonoBrasil em [GitHub](https://github.com/monobrasil/website/docs). Caso você encontre erros ou pense que algo que possa ser melhorado, apensa clique em "Edit page on GitHub" link abaixo do titulo da página. Veja [contributing to the website](https://github.com/mono/website#contributing-to-the-website) para maiores detalhes.
{% endcapture %}
{% include note.html type='info' message=docNote %}

Começando
---------------

 - [Overview](/docs/getting-started/)
 - Install Mono on [Mac OS X](/docs/getting-started/install/mac/), [Linux](/docs/getting-started/install/linux/) or [Windows](/docs/getting-started/install/windows/)
 - [Mono Basics](/docs/getting-started/mono-basics/)
 - [Development Environments](/docs/getting-started/development-environments/)
 - [Application Portability](/docs/getting-started/application-portability/) and [Application Deployment](/docs/getting-started/application-deployment/)

Sobre Mono
----------

 - [Overview](/docs/about-mono/)
 - [Supported Platforms](/docs/about-mono/supported-platforms/)
 - [Languages](/docs/about-mono/languages/)
 - [Compatibility](/docs/about-mono/compatibility/) and [Class Status](/docs/about-mono/class-status/) 
 - [Releases](/docs/about-mono/releases/) and [Versioning](/docs/about-mono/versioning/) 
 - [Maintainers](/docs/about-mono/maintainers/)
 - [History](/docs/about-mono/history/), [Concerns about Mono](/docs/about-mono/concerns-about-mono/)
 - [Roadmap](/docs/about-mono/roadmap/) and [Plans](/docs/about-mono/plans/)
 - [Vulnerabilities](/docs/about-mono/vulnerabilities/)
 - Showcase: [Screenshots](/docs/about-mono/showcase/screenshots/), [Software](/docs/about-mono/showcase/software/), [Companies using Mono](/docs/about-mono/showcase/companies-using-mono/), [Mono Logos](/docs/about-mono/logos/)

Compilando o Mono
--------------

 - [Overview](/docs/compiling-mono/), with instructions for compiling on OS X, Linux and Windows
 - [Compiling from Git](/docs/compiling-mono/compiling-from-git/) and [Compiling from Tarball](/docs/compiling-mono/compiling-from-tarball/)
 - [Advanced compile options](/docs/compiling-mono/advanced-mono-compile-options/)
 - [Unsupported advanced compile options](/docs/compiling-mono/unsupported-advanced-compile-options/)
 - [Parallel Mono environments](/docs/compiling-mono/parallel-mono-environments/)
 - [Small footprint](/docs/compiling-mono/small-footprint/)

FAQ
---

 - [General](/docs/faq/general/)
 - [Security](/docs/faq/security/)
 - [Technical](/docs/faq/technical/)
 - [Licensing](/docs/faq/licensing/)
 - [Documentation](/docs/faq/documentation/)
 - [ASP.NET](/docs/faq/aspnet/)
 - [GTK](/docs/faq/gtk/)
 - [WinForms](/docs/faq/winforms/)

Acessandro Banco de Dados
---------------

 - [Overview](/docs/database-access/)
 - [ADO.NET](/docs/database-access/adonet/)
 - [EntityFramework](/docs/database-access/entityframework/)
 
Debug e Profile
-----------------

 - [Debug - Overview](/docs/debug+profile/debug/)
   - [Debugger](/docs/debug+profile/debug/debugger/)
 - [Profile - Overview](/docs/debug+profile/profile/)
   - [Profiler](/docs/debug+profile/profile/profiler/)
   - [HeapShot](/docs/debug+profile/profile/heapshot/)
   - [DTrace](/docs/debug+profile/profile/dtrace/)
   - [Code Coverage](/docs/debug+profile/profile/code-coverage/)

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
 - [Porting ASP.NET applications](/docs/web/porting-aspnet-applications/)
 - [Using client certificates with XSP](/docs/web/using-clientcertificates-with-xsp/)

Ferramenta e Bibliotecas
-------------------

 - [Tools - Overview](/docs/tools+libraries/tools/)
   - [Gendarme](/docs/tools+libraries/tools/gendarme/)
   - [MoMA](/docs/tools+libraries/tools/moma/)
   - [XBuild](/docs/tools+libraries/tools/xbuild/)
 - [Libraries - Overview](/docs/tools+libraries/libraries/)
   - [MonoMac](/docs/tools+libraries/libraries/monomac/)
   - [XML](/docs/tools+libraries/libraries/xml/)
   - [Mono.Cairo](/docs/tools+libraries/libraries/Mono.Cairo/)
   - [Mono.Cecil](/docs/tools+libraries/libraries/Mono.Cecil/)

Tópicos Avançados
---------------

 - [Runtime](/docs/advanced/runtime/)
 - [Garbage Collector - SGEN](/docs/advanced/garbage-collector/sgen/)
   - [GC Benchmark Suite](/docs/advanced/garbage-collector/benchmark-suite/)
 - [AOT](/docs/advanced/aot/)
 - [Embedding](/docs/advanced/embedding/)
 - [Assemblies and the GAC](/docs/advanced/assemblies-and-the-gac/)
 - [P/Invoke](/docs/advanced/pinvoke/)
 - [IOMap](/docs/advanced/iomap/)
 - [monolite](/docs/advanced/monolite/)
 - [Mono LLVM](/docs/advanced/mono-llvm/)
 - [CAS](/docs/advanced/cas/)
 - [COM](/docs/advanced/com/)
   - [COM-Interop](/docs/advanced/com-interop/)
 - [CoreCLR](/docs/advanced/coreclr/)
   - [CoreCLR HowTo](/docs/advanced/coreclr-howto/)
 - [Performance Tips](/docs/advanced/performance-tips/)
 - [SafeHandles](/docs/advanced/safehandles/)
 - [Sandbox](/docs/advanced/sandbox/)
