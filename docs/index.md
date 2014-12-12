---
title: Documentation
redirect_from:
  - /Documentation/
  - /Class_Library_Documentation/
  - /Docs/
---

These docs cover Mono specific topics, like setting up and configuring Mono or information about Mono internals such as the runtime, garbage collector or various Mono-specific tools.

For general information about the .NET framework and the class libraries you can refer to Microsoft's [MSDN pages](http://msdn.microsoft.com/en-us/library/ff361664.aspx).

{% capture docNote %}
Our website is open source on [GitHub](https://github.com/mono/website). If you find errors or think a page could be improved, just click the "Edit page on GitHub" link beneath the page title. See [contributing to the website](https://github.com/mono/website#contributing-to-the-website) for more details.
{% endcapture %}
{% include note.html type='info' message=docNote %}


<dl class="accordion" data-accordion>
    <dd class="accordion-navigation">
        <a class="panel" href="#panel1"><h2>Getting Started</h2></a>
        <div id="panel1" class="content active">
            <ul class="disc">
                <li><a href="/docs/getting-started">Overview</a></li>
                <li>Install Mono on <a href="/docs/getting-started/install/mac/">Mac OS X</a>,<a href="/docs/getting-started/install/linux/">Linux</a>,<a href="/docs/getting-started/install/windows/">Windows</a></li>
                <li><a href="/docs/getting-started/mono-basics/">Mono Basics</a></li>
                <li><a href="/docs/getting-started/development-environments/">Development Environments</a> </li>
                <li><a href="/docs/getting-started/application-portability/">Application Portability</a> and <a href="/docs/getting-started/application-deployment" >Application Deployment</a></li>
            </ul>
        </div>
    </dd>
    <br/>
 
   <dd class="accordion-navigation">
        <a class="panel" href="#panel2"><h2>About Mono</h2></a>
        <div id="panel2" class="content">
            <ul class="disc">
                <li><a href="/docs/about-mono/">Overview</a></li>
                <li><a href="/docs/about-mono/supported-platforms/">Supported Platforms</a></li>
                <li><a href="/docs/about-mono/languages/">Languages</a></li>
                <li><a href="/docs/about-mono/compatibility/">Compatibility</a> and <a href="/docs/about-mono/class-status/" >Class Status</a></li>
                <li><a href="/docs/about-mono/releases/">Releases</a> and <a href="/docs/about-mono/versioning/" >Versioning</a></li>
                <li><a href="/docs/about-mono/maintainers/">Maintainers</a></li>
                <li><a href="/docs/about-mono/history/">History</a> , <a href="/docs/about-mono/concerns-about-mono/" >Concerns about Mono</a></li>
                <li><a href="/docs/about-mono/roadmap/">Roadmap</a> and <a href="/docs/about-mono/plans/" >Plans</a></li>
                <li><a href="/docs/about-mono/vulnerabilities/">Vulnerabilities</a></li>
                <li>Showcase: <a href="/docs/about-mono/showcase/screenshots/">Screenshots </a> , <a href="/docs/about-mono/showcase/software" >Software</a> , <a href="/docs/about-mono/showcase/companies-using-mono" >Companies using Mono</a> , <a href="/docs/about-mono/logos" >Mono Logos</a></li>
            </ul>
        </div>
    </dd>
    <br/>

   <dd class="accordion-navigation">
        <a class="panel" href="#panel3"><h2>Compiling Mono</h2></a>
        <div id="panel3" class="content">
            <ul class="disc">
                <li><a href="/docs/compiling-mono/">Overview</a>, with instructions for compiling on OS X, Linux and Windows</li>
                <li><a href="/docs/compiling-mono/compiling-from-git/">Compiling from Git</a> and <a href="/docs/compiling-mono/compiling-from-tarball/">Compiling from Tarball</a></li>
                <li><a href="/docs/compiling-mono/advanced-mono-compile-options/">Advanced compile options</a></li>
                <li><a href="/docs/compiling-mono/unsupported-advanced-compile-options/">Unsupported advanced compile options</a></li>
                <li><a href="/docs/compiling-mono/parallel-mono-environments/">Parallel Mono environments</a></li>
                <li><a href="/docs/compiling-mono/small-footprint/">Small footprint</a></li>
            </ul>
        </div>
    </dd>
    <br/>

    <dd class="accordion-navigation">
        <a class="panel" href="#panel4"><h2>FAQ</h2></a>
        <div id="panel4" class="content">
            <ul class="disc">
                  <li><a href="/docs/faq/general/">General</a></li>
                  <li><a href="/docs/faq/security/">Security</a></li>
                  <li><a href="/docs/faq/technical/">Technical</a></li>
                  <li><a href="/docs/faq/licensing/">Licensing</a></li>
                  <li><a href="/docs/faq/documentation/">Documentation</a></li>
                  <li><a href="/docs/faq/aspnet/">ASP.NET</a></li>
                  <li><a href="/docs/faq/gtk/">GTK</a></li>
                  <li><a href="/docs/faq/winforms/">WinForms</a></li>
            </ul>
        </div>
    </dd>
    <br/>

    <dd class="accordion-navigation">
        <a class="panel" href="#panel5"><h2>Database Access</h2></a>
        <div id="panel5" class="content">
            <ul class="disc">
                <li><a href="/docs/database-access/">Overview</a></li>
                <li><a href="/docs/database-access/adonet/">ADO.NET</a></li>
                <li><a href="/docs/database-access/entityframework/">EntityFramework</a></li>
            </ul>
        </div>
    </dd>
    <br/>

    <dd class="accordion-navigation">
        <a class="panel" href="#panel6"><h2>Debug and Profile</h2></a>
        <div id="panel6" class="content">
            <ul class="disc">
                <li><a href="/docs/debug+profile/debug/">Debug - Overview</a>
                    <ul>
                        <li><a href="/docs/debug+profile/debug/debugger/">Debugger</a></li>
                    </ul>
                </li>
                <li><a href="/docs/debug+profile/profile/">Profile - Overview</a>
                    <ul>
                        <li><a href="/docs/debug+profile/profile/profiler/">Profiler</a></li>
                        <li><a href="/docs/debug+profile/profile/heapshot/">HeapShot</a></li>
                        <li><a href="/docs/debug+profile/profile/dtrace/">DTrace</a></li>
                        <li><a href="/docs/debug+profile/profile/code-coverage/">Code Coverage</a></li>
                    </ul>
                </li>
            </ul>
        </div>
   </dd>
   <br/>

    <dd class="accordion-navigation">
        <a class="panel" href="#panel7"><h2>GUI</h2></a>
        <div id="panel7" class="content">
            <ul class="disc">
                <li><a href="/docs/gui/gui-toolkits/">GUI Toolkits</a></li>
                <li><a href="/docs/gui/winforms/">WinForms</a></li>
                <li><a href="/docs/gui/gtksharp/">Gtk#</a></li>
                <li><a href="/docs/gui/drawing/">Drawing</a></li>
                <li><a href="/docs/gui/libgdiplus/">libgdiplus</a></li>
                <li><a href="/docs/gui/wpf/">WPF</a></li>
            </ul>
        </div>
    </dd>
    <br/>

    <dd class="accordion-navigation">
        <a class="panel" href="#panel8"><h2>Web</h2></a>
        <div id="panel8" class="content">
            <ul class="disc">
                <li><a href="/docs/web/aspnet/">ASP.NET</a></li>
                <li><a href="/docs/web/wcf/">WCF</a></li>
                <li><a href="/docs/web/fastcgi/">FastCGI</a></li>
                <li><a href="/docs/web/mod_mono/">mod_mono</a></li>
                <li><a href="/docs/web/moonlight/">Moonlight</a></li>
                <li><a href="/docs/web/porting-aspnet-applications/">Porting ASP.NET applications</a></li>
                <li><a href="/docs/web/using-clientcertificates-with-xsp/">Using client certificates with XSP</a></li>
            </ul>
        </div>
    </dd>
    <br/>

   <dd class="accordion-navigation">
        <a class="panel" href="#panel9"><h2>Tools and Libraries</h2></a>
        <div id="panel9" class="content">
            <ul class="disc">
                <li><a href="/docs/tools+libraries/tools/">Tools - Overview</a>
                    <ul>
                        <li><a href="/docs/tools+libraries/tools/gendarme/">Gendarme</a></li>
                        <li><a href="/docs/tools+libraries/tools/moma/">MoMA</a></li>
                        <li><a href="/docs/tools+libraries/tools/xbuild/">XBuild</a></li>
                    </ul>
                </li>
                <li><a href="/docs/tools+libraries/libraries/">Libraries - Overview</a>
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
    <br/>

   <dd class="accordion-navigation">
        <a class="panel" href="#panel10"><h2>Advanced Topics</h2></a>
        <div id="panel10" class="content">
            <ul class="disc">
                <li><a href="/docs/advanced/runtime/">Runtime</a></li>
                <li><a href="/docs/advanced/garbage-collector/sgen/">Garbage Collector - SGEN</a>
                    <ul>
                        <li><a href="/docs/advanced/garbage-collector/benchmark-suite/">GC Benchmark Suite</a></li>
                    </ul>
                </li>
                <li><a href="/docs/advanced/aot/">AOT</a></li>
                <li><a href="/docs/advanced/embedding/">Embedding</a></li>
                <li><a href="/docs/advanced/assemblies-and-the-gac/">Assemblies and the GAC</a></li>
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
                <li><a href="/docs/advanced/performance-tips/">Performance Tips</a></li>
                <li><a href="/docs/advanced/safehandles/">SafeHandles</a></li>
                <li><a href="/docs/advanced/sandbox/">Sandbox</a></li>
            </ul>
        </div>
    </dd>
    <br/>
</dl>

  

  