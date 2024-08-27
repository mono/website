---
title: Documentation
redirect_from:
  - /Documentation/
  - /Class_Library_Documentation/
  - /Docs/
---

{% capture docNote %}
The [Mono Project (mono/mono)]( https://github.com/mono/mono) (‘original mono’) has been an important part of the .NET ecosystem since it was launched in 2001. Microsoft became the steward of the Mono Project when it acquired Xamarin in 2016.

The last major release of the Mono Project was in July 2019, with minor patch releases since that time. The last patch release was February 2024.

We are happy to announce that the WineHQ organization will be taking over as the stewards of the Mono Project upstream at [wine-mono / Mono · GitLab (winehq.org)](https://gitlab.winehq.org/wine-mono/mono).  Source code in existing [mono/mono](https://github.com/mono/mono) and other repos will remain available, although repos may be archived. Binaries will remain available for up to four years.

Microsoft maintains a modern fork of [Mono runtime in the dotnet/runtime repo](https://github.com/dotnet/runtime/tree/main/src/mono) and has been progressively moving workloads to that fork. That work is now complete, and we recommend that active Mono users and maintainers of Mono-based app frameworks migrate to [.NET](https://github.com/dotnet/core) which includes work from this fork.

We want to recognize that the Mono Project was the first .NET implementation on Android, iOS, Linux, and other operating systems. The Mono Project was a trailblazer for the .NET platform across many operating systems. It helped make cross-platform .NET a reality and enabled .NET in many new places and we appreciate the work of those who came before us.

Thank you to all the Mono developers!
{% endcapture %}

These docs cover Mono specific topics, like setting up and configuring Mono or information about Mono internals such as the runtime, garbage collector or various Mono-specific tools.

For general information about the .NET framework and the class libraries you can refer to Microsoft's [MSDN pages](http://msdn.microsoft.com/en-us/library/ff361664.aspx).

{% capture docNote %}
Our website is open source on [GitHub](https://github.com/mono/website). If you find errors or think a page could be improved, just click the "Edit page on GitHub" link beneath the page title. See [contributing to the website](https://github.com/mono/website#contributing-to-the-website) for more details.
{% endcapture %}
{% include note.html type='info' message=docNote %}

## [Getting Started](/docs/getting-started)

* Install Mono on
    * [macOS](/docs/getting-started/install/mac/)
    * [Linux](/docs/getting-started/install/linux/)
    * [Windows](/docs/getting-started/install/windows/)
* [Mono Basics](/docs/getting-started/mono-basics/)
* [Development Environments](/docs/getting-started/development-environments/)
* [Application Portability](/docs/getting-started/application-portability/)
* [Application Deployment](/docs/getting-started/application-deployment/)

## [About Mono](/docs/about-mono/)

* [Supported Platforms](/docs/about-mono/supported-platforms/)
* [Languages](/docs/about-mono/languages/)
* [Compatibility](/docs/about-mono/compatibility/)
* [Releases](/docs/about-mono/releases/)
* [Versioning](/docs/about-mono/versioning/)
* [Maintainers](/docs/about-mono/maintainers/)
* [History](/docs/about-mono/history/)
* [Concerns about Mono](/docs/about-mono/concerns-about-mono/)
* [Roadmap](/docs/about-mono/roadmap/)
* [Plans](/docs/about-mono/plans/)
* [Vulnerabilities](/docs/about-mono/vulnerabilities/)

### Showcases

* [Screenshots](/docs/about-mono/showcase/screenshots/)
* [Software](/docs/about-mono/showcase/software/)
* [Companies using Mono](/docs/about-mono/showcase/companies-using-mono/)
* [Mono Logos](/docs/about-mono/logos/)

## [Compiling Mono](/docs/compiling-mono/)

* Platforms
    * [macOS](/docs/compiling-mono/mac/)
    * [Linux](/docs/compiling-mono/linux/)
    * [Windows](/docs/compiling-mono/windows/)
* Source
    * [Git](/docs/compiling-mono/compiling-from-git/)
    * [Tarball](/docs/compiling-mono/compiling-from-tarball/)
* [Advanced compile options](/docs/compiling-mono/advanced-mono-compile-options/)
* [Unsupported advanced compile options](/docs/compiling-mono/unsupported-advanced-compile-options/)
* [Parallel Mono environments](/docs/compiling-mono/parallel-mono-environments/)
* [Small footprint](/docs/compiling-mono/small-footprint/)

## [FAQ](/docs/faq/general/)

* [Security](/docs/faq/security/)
* [Technical](/docs/faq/technical/)
* [Licensing](/docs/faq/licensing/)
* [Documentation](/docs/faq/documentation/)
* [ASP.NET](/docs/faq/aspnet/)
* [GTK](/docs/faq/gtk/)
* [WinForms](/docs/faq/winforms/)

## [Database Access](/docs/database-access/)

* [ADO.NET](/docs/database-access/adonet/)
* [EntityFramework](/docs/database-access/entityframework/)

## [Debugging](/docs/debug+profile/debug/)

* [Debugger](/docs/debug+profile/debug/debugger/)

## [Profiling](/docs/debug+profile/profile/)

* [Profiler](/docs/debug+profile/profile/profiler/)
* [HeapShot](/docs/debug+profile/profile/heapshot/)
* [DTrace](/docs/debug+profile/profile/dtrace/)
* [Code Coverage](/docs/debug+profile/profile/code-coverage/)

## [Clang Sanitizers](/docs/debug+profile/clang/)

* [ThreadSanitizer (TSan)](/docs/debug+profile/clang/threadsanitizer/)
* [AddressSanitizer (ASan)](/docs/debug+profile/clang/addresssanitizer/)

## GUI

* [Toolkits](/docs/gui/gui-toolkits/)
* [WinForms](/docs/gui/winforms/)
* [Gtk#](/docs/gui/gtksharp/)
* [System.Drawing](/docs/gui/drawing/)
* [libgdiplus](/docs/gui/libgdiplus/)
* [WPF](/docs/gui/wpf/)

## Web

* [ASP.NET](/docs/web/aspnet/)
* [WCF](/docs/web/wcf/)
* [FastCGI](/docs/web/fastcgi/)
* [mod_mono](/docs/web/mod_mono/)
* [Moonlight](/docs/web/moonlight/)
* [Porting ASP.NET applications](/docs/web/porting-aspnet-applications/)

## [Tools](/docs/tools+libraries/tools/)

* [Linker](/docs/tools+libraries/tools/linker/)
* [mkbundle](/docs/tools+libraries/tools/mkbundle/)
* [Gendarme](/docs/tools+libraries/tools/gendarme/)
* [MoMA](/docs/tools+libraries/tools/moma/)

## [Libraries](/docs/tools+libraries/libraries/)

* [MonoMac](/docs/tools+libraries/libraries/monomac/)
* [XML](/docs/tools+libraries/libraries/xml/)
* [Mono.Cairo](/docs/tools+libraries/libraries/Mono.Cairo/)
* [Mono.Cecil](/docs/tools+libraries/libraries/Mono.Cecil/)

## Advanced Topics

### [Runtime](/docs/advanced/runtime/)

* [Runtime memory leaks](/docs/advanced/runtime/memory-leaks/)
* [Garbage Collector](/docs/advanced/garbage-collector/sgen/)
* [GC Benchmark Suite](/docs/advanced/garbage-collector/benchmark-suite/)
* [AOT](/docs/advanced/aot/)
* [Base Class Library debugging](/docs/advanced/bcl-debugging/)
* [Embedding](/docs/advanced/embedding/)
* [Assemblies and the GAC](/docs/advanced/assemblies-and-the-gac/)
* [P/Invoke](/docs/advanced/pinvoke/)
* [IOMap](/docs/advanced/iomap/)
* [Mono LLVM](/docs/advanced/mono-llvm/)
* [CAS](/docs/advanced/cas/)
* [COM](/docs/advanced/com/)
* [COM Interop](/docs/advanced/com-interop/)
* [Performance Tips](/docs/advanced/performance-tips/)
* [Safehandles](/docs/advanced/safehandles/)
* [Sandbox](/docs/advanced/sandbox/)
* [Signals and third-party crash reporters](/docs/advanced/signals/)
