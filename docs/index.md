---
title: Documentação
redirect_from:
  - /Documentation/
  - /Class_Library_Documentation/
  - /Docs/
---

Estes documentos cobrem tópicos específicos do Mono. Por exemplo: como ajustar e configurar o Mono, informações internas do Mono sobre a máquina virtual, o coletor de lixo e sobre várias ferramentas especializadas do Mono. 

Informações gerais sobre o Framework .NET e sobre as bibliotecas de classes você pode buscar no site da Microsoft [MSDN pages](http://msdn.microsoft.com/en-us/library/ff361664.aspx).

{% capture docNote %}
Esta documentação é código aberto e está (em Inglês) no [GitHub - Mono](https://github.com/mono/website/docs), a versão em Pôrtugues do Brasil está sendo mantida pela comunidade MonoBrasil também no [GitHub - MonoBrasil](https://github.com/MonoBrasil/website). 
Caso você encontre erros ou pense que algo possa ser melhorado, apenas clique no link "Edit page on GitHub" abaixo do título da página. Veja [Contribuindo com o Site](https://github.com/MonoBrasil/website#contributing-to-the-website) para maiores detalhes.
{% endcapture %}
{% include note.html type='info' message=docNote %}

<dl class="accordion" data-accordion>
    <dd class="accordion-navigation">
        <a class="panel" href="#getting-started"><h2>Começando</h2></a>
        <div id="getting-started" class="content panel active">
            <ul class="disc">
                <li><a href="/docs/getting-started">Visão Geral</a></li>
                <li>Instalando o Mono no <a href="/docs/getting-started/install/mac/">Mac OS X</a>,<a href="/docs/getting-started/install/linux/">Linux</a>,<a href="/docs/getting-started/install/windows/">Windows</a></li>
                <li><a href="/docs/getting-started/mono-basics/">O Básico do Mono</a></li>
                <li><a href="/docs/getting-started/development-environments/">Ambientes de Desenvolvimento</a> </li>
                <li><a href="/docs/getting-started/application-portability/">Portabilidade de Aplicações</a> e <a href="/docs/getting-started/application-deployment/">Publicação de Aplicações</a></li>
            </ul>
        </div>
    </dd>

   <dd class="accordion-navigation">
        <a class="panel" href="#about-mono"><h2>Sobre o Mono</h2></a>
        <div id="about-mono" class="content panel">
            <ul class="disc">
                <li><a href="/docs/about-mono/">Visão Geral</a></li>
                <li><a href="/docs/about-mono/supported-platforms/">Plataformas Suportadas</a></li>
                <li><a href="/docs/about-mono/languages/">Linguagens</a></li>
                <li><a href="/docs/about-mono/compatibility/">Compatibilidade</a> e <a href="/docs/about-mono/class-status/">Status das Bibliotecas de Classes</a></li>
                <li><a href="/docs/about-mono/releases/">Liberações</a> e <a href="/docs/about-mono/versioning/">Versionamento</a></li>
                <li><a href="/docs/about-mono/maintainers/">Mantenedores</a></li>
                <li><a href="/docs/about-mono/history/">História</a> , <a href="/docs/about-mono/concerns-about-mono/">Preocupações com o uso do Mono</a></li>
                <li><a href="/docs/about-mono/roadmap/">A Estrada a Frente</a> e <a href="/docs/about-mono/plans/">Planos</a></li>
                <li><a href="/docs/about-mono/vulnerabilities/">Vulnerabilidades</a></li>
                <li>Mostra: <a href="/docs/about-mono/showcase/screenshots/">Captura de Telas</a> , <a href="/docs/about-mono/showcase/software/">Software</a> , <a href="/docs/about-mono/showcase/companies-using-mono/">Companhias Usando o Mono</a> , <a href="/docs/about-mono/logos/">Logotipos do Mono</a></li>
            </ul>
        </div>
    </dd>

   <dd class="accordion-navigation">
        <a class="panel" href="#compiling-mono"><h2>Compilando o Mono</h2></a>
        <div id="compiling-mono" class="content panel">
            <ul class="disc">
                <li><a href="/docs/compiling-mono/">Visão Geral</a>, com instruções para compilar em OS X, Linux e Windows</li>
                <li><a href="/docs/compiling-mono/compiling-from-git/">Compilando a Partir do Git</a> e <a href="/docs/compiling-mono/compiling-from-tarball/">Compilando a Partir do Tarball</a></li>
                <li><a href="/docs/compiling-mono/advanced-mono-compile-options/">Opções Avançadas de Compilação</a></li>
                <li><a href="/docs/compiling-mono/unsupported-advanced-compile-options/">Opções Avançadas de Compilação Não-Suportadas</a></li>
                <li><a href="/docs/compiling-mono/parallel-mono-environments/">Instalações Paralelas do Mono</a></li>
                <li><a href="/docs/compiling-mono/small-footprint/">Versões Enxutas</a></li>
            </ul>
        </div>
    </dd>
    <dd class="accordion-navigation">
        <a class="panel" href="#faq"><h2>FAQ - Perguntas Frequentes</h2></a>
        <div id="faq" class="content panel">
            <ul class="disc">
                  <li><a href="/docs/faq/general/">Geral</a></li>
                  <li><a href="/docs/faq/security/">Segurança</a></li>
                  <li><a href="/docs/faq/technical/">Técnico</a></li>
                  <li><a href="/docs/faq/licensing/">Licenciamento</a></li>
                  <li><a href="/docs/faq/documentation/">Documentação</a></li>
                  <li><a href="/docs/faq/aspnet/">ASP.NET</a></li>
                  <li><a href="/docs/faq/gtk/">GTK</a></li>
                  <li><a href="/docs/faq/winforms/">WinForms</a></li>
            </ul>
        </div>
    </dd>

    <dd class="accordion-navigation">
        <a class="panel" href="#database-access"><h2>Acessando Banco de Dados</h2></a>
        <div id="database-access" class="content panel">
            <ul class="disc">
                <li><a href="/docs/database-access/">Visão Geral</a></li>
                <li><a href="/docs/database-access/adonet/">ADO.NET</a></li>
                <li><a href="/docs/database-access/entityframework/">EntityFramework</a></li>
            </ul>
        </div>
    </dd>

    <dd class="accordion-navigation">
        <a class="panel" href="#debug-and-profile"><h2>Debug e Profile</h2></a>
        <div id="debug-and-profile" class="content panel ">
            <ul class="disc">
                <li><a href="/docs/debug+profile/debug/">Debug - Visão Geral</a>
                    <ul>
                        <li><a href="/docs/debug+profile/debug/debugger/">Depurador</a></li>
                    </ul>
                </li>
                <li><a href="/docs/debug+profile/profile/">Profile - Visão Geral</a>
                    <ul>
                        <li><a href="/docs/debug+profile/profile/profiler/">Profiler</a></li>
                        <li><a href="/docs/debug+profile/profile/heapshot/">HeapShot</a></li>
                        <li><a href="/docs/debug+profile/profile/dtrace/">DTrace</a></li>
                        <li><a href="/docs/debug+profile/profile/code-coverage/">Cobertura de Código</a></li>
                    </ul>
                </li>
            </ul>
        </div>
   </dd>

    <dd class="accordion-navigation">
        <a class="panel" href="#gui"><h2>Interfaces Gráficas</h2></a>
        <div id="gui" class="content panel ">
            <ul class="disc">
                <li><a href="/docs/gui/gui-toolkits/">Toolkits Gráficos</a></li>
                <li><a href="/docs/gui/winforms/">WinForms</a></li>
                <li><a href="/docs/gui/gtksharp/">Gtk#</a></li>
                <li><a href="/docs/gui/drawing/">Drawing</a></li>
                <li><a href="/docs/gui/libgdiplus/">libgdiplus</a></li>
                <li><a href="/docs/gui/wpf/">WPF</a></li>
            </ul>
        </div>
    </dd>

    <dd class="accordion-navigation">
        <a class="panel" href="#web"><h2>Web</h2></a>
        <div id="web" class="content panel ">
            <ul class="disc">
                <li><a href="/docs/web/aspnet/">ASP.NET</a></li>
                <li><a href="/docs/web/wcf/">WCF</a></li>
                <li><a href="/docs/web/fastcgi/">FastCGI</a></li>
                <li><a href="/docs/web/mod_mono/">mod_mono</a></li>
                <li><a href="/docs/web/moonlight/">Moonlight</a></li>
                <li><a href="/docs/web/porting-aspnet-applications/">Portando Aplicações ASP.NET</a></li>
                <li><a href="/docs/web/using-clientcertificates-with-xsp/">Usando Certificados de Cliente com o XSP</a></li>
            </ul>
        </div>
    </dd>

   <dd class="accordion-navigation">
        <a class="panel" href="#tools-and-libraries"><h2>Ferramentas e Bibliotecas</h2></a>
        <div id="tools-and-libraries" class="content panel ">
            <ul class="disc">
                <li><a href="/docs/tools+libraries/tools/">Ferramentas - Visão Geral</a>
                    <ul>
                        <li><a href="/docs/tools+libraries/tools/gendarme/">Gendarme</a></li>
                        <li><a href="/docs/tools+libraries/tools/moma/">MoMA</a></li>
                        <li><a href="/docs/tools+libraries/tools/xbuild/">XBuild</a></li>
                    </ul>
                </li>
                <li><a href="/docs/tools+libraries/libraries/">Bibliotecas - Visão Geral</a>
                   <ul>
                      <li><a href="/docs/tools+libraries/libraries/monomac/">MonoMac</a></li>
                      <li><a href="/docs/tools+libraries/libraries/xml/">XML</a></li>
                      <li><a href="/docs/tools+libraries/libraries/Mono.Cairo/">Mono.Cairo</a></li>
                      <li><a href="/docs/tools+libraries/libraries/Mono.Cecil/">Mono.Cecil</a></li>
                   </ul>
                </li>
            </ul>
        </div>
    </dd>

   <dd class="accordion-navigation">
        <a class="panel" href="#advanced-topics"><h2>Tópicos Avançados</h2></a>
        <div id="advanced-topics" class="content panel ">
            <ul class="disc">
                <li><a href="/docs/advanced/runtime/">Ambiente de Execução</a></li>
                <li><a href="/docs/advanced/garbage-collector/sgen/">Coletor de Lixo - SGEN</a>
                    <ul>
                        <li><a href="/docs/advanced/garbage-collector/benchmark-suite/">GC Benchmark Suite</a></li>
                    </ul>
                </li>
                <li><a href="/docs/advanced/aot/">AOT</a></li>
                <li><a href="/docs/advanced/embedding/">Embedding</a></li>
                <li><a href="/docs/advanced/assemblies-and-the-gac/">Assemblies e o GAC</a></li>
                <li><a href="/docs/advanced/pinvoke/">P/Invoke</a></li>
                <li><a href="/docs/advanced/iomap/">IOMap</a></li>
                <li><a href="/docs/advanced/monolite/">monolite</a></li>
                <li><a href="/docs/advanced/mono-llvm/">Mono LLVM</a></li>
                <li><a href="/docs/advanced/cas/">CAS</a></li>
                <li><a href="/docs/advanced/com/">COM</a>
                    <ul>
                        <li><a href="/docs/advanced/com-interop/">COM-Interop</a></li>
                    </ul>
                </li>
                <li><a href="/docs/advanced/coreclr/">CoreCLR</a>
                    <ul>
                        <li><a href="/docs/advanced/coreclr-howto/">CoreCLR HowTo</a></li>
                    </ul>
                </li>
                <li><a href="/docs/advanced/performance-tips/">Dicas de Performance</a></li>
                <li><a href="/docs/advanced/safehandles/">SafeHandles</a></li>
                <li><a href="/docs/advanced/sandbox/">Sandbox</a></li>
            </ul>
        </div>
    </dd>
</dl>
