---
title: "System.IO.Pipes from CoreFX (Georgios Athanasopoulos)"
---

Author: Georgios Athanasopoulos

This is a report for my contribution to [Mono Project](http://www.mono-project.com/) as Google Summer of Code 2017 student

# Description

Mono is a open source development platform based on the `.Net Framework` and allows developers to build cross-platform applications. Mono's .NET implementation is based on the ECMA standards for `C#` and the `Common Language Infrastructure`. It includes both developer tools and the infrastructure needed to run .NET client and server applications on `Linux, Microsoft Windows, macOS, BSD, Sun Solaris, Nintendo Wii, Sony PlayStation 3, Apple iPhone and Android`.

Mono is supported by Microsoft and .Net Foundation and consisted by:
* [`C# Compiler`](http://www.mono-project.com/docs/about-mono/languages/csharp/)
* [`Mono Runtime`](http://www.mono-project.com/docs/advanced/runtime/)
* `.NET Framework Class Library`
* `Mono Class Library`

# Goal

The implementation of Pipe Streams in `Mono` doesn't support some functionalities such as parallel builds on msbuild. `CoreFX` is the foundational libraries for .NET Core. The implementation of Pipe Streams in CoreFx fixes the previous problems. So, the goal of the project was to import `System.IO.Pipes.PipeStream` from CoreFX to Mono. Doing this, new features are offered by Mono.

# Work process

Initially, I learned more about Mono Project and explored platform structure. Mono Project in order to manage running at different platforms, has implemented layer abstraction. There are source files (with .dll.sources extension) which are responsible for building of libraries. In these files are included source files of classes that will integrate every library. For example I worked on System.Core library that contains LINQ To Objects implementation and the classes HashSet, TimeZoneInfo, Pipes, ReaderWriteLockSlim, System.Security.*, System.Diagnostics.Eventing.* and System.Diagnostics.PerformanceData. For this library, there is the `common_System.Core.dll.sources` file in which independent classes from platforms or profiles, are included. One of profile specific files is the `net_4_x_System.Core.dll.sources`. This file import common classes from `common_System.Core.dll.sources` and additional classes that are required by net_4_x profile. Similarly the `win32_net_4_x_System.Core.dll.sources` file is windows platform specific and import classes from `net_4_x_System.Core.dll.sources` and additional classes that are required by windows platform. The schema of this structure is presented at Figure 1.

|[![gsoc-2017-corefx-System.IO.Pipes.png](/images/gsoc-2017-corefx-System.IO.Pipes.png)](/images/gsoc-2017-corefx-System.IO.Pipes.png)|
|:---:|
|*Figure 1*|

Some other profile specific files are `monodroid_System.Core.dll.sources`, `monotouch_System.Core.dll.sources`, `monotouch_runtime_System.Core.dll.sources`, `monotouch_watch_System.Core.dll.sources`, `monotouch_watch_runtime_System`, `monotouch_tv_System.Core.dll.sources`, `monotouch_tv_runtime_System.Core.dll.sources`, `testing_aot_hybrid_System.Core.dll.sources`, `testing_full_hybrid_System.Core.dll.sources`, `winaot_System.Core.dll.sources`, `xammac_System.Core.dll.sources`, `xammac_net_4_5_System.Core.dll.sources`, `orbis_System.Core.dll.sources`.

Some other platform specific files are `win32_basic_System.Core.dll.sources`, `win32_build_System.Core.dll.sources`, `win32_net_4_x_System.Core.dll.sources`, `linux_basic_System.Core.dll.sources`, `linux_build_System.Core.dll.sources`, `linux_net_4_x_System.Core.dll.sources`, `darwin_basic_System.Core.dll.sources`, `darwin_build_System.Core.dll.sources`, `darwin_net_4_x_System.Core.dll.sources`.

I should have imported from CoreFx the files that are in [this](https://github.com/dotnet/corefx/blob/master/src/System.IO.Pipes/src/System.IO.Pipes.csproj) csproj file. A `.csproj` file contains a list of all the files to be compiled as part of a project, as well as other options like the project name, release and debug configurations and compilation options. In `System.IO.Pipes.csproj`, I found the files that are compiled when the project is building. Because they are the files that constitute Pipes in corefx, should be transfered in mono. Csproj files have two ways for referring in compiled files. The explicit way in which every file being compiled and conditional way in which a file being compiled only if a condition is true. So, I found files that are compiled only when the platform is either Windows or Unix and files that are compiled at any case. On the first occasion, I added these files in `win32_net_4_x_System.Core.dll.sources`, `linux_net_4_x_System.Core.dll.sources` and `darwin_System.Core.dll.sources` regarding to platform, while on the second I added files in `common_System.Core.dll.sources` because should be compiled at every platform.
The import of CoreFx code was easy because the code existed as submodule in repo. Also, I added some errors messages in `SR.cs` file that are existed now due to new CoreFx code.

When I resolved some duplicated references between Mono and CoreFx code, built mono with my changes. Running tests, I found out that some APIs of Mono were dropped by CoreFx. In particular, mono has this function `NamedPipeServerStream(String pipeName, PipeDirection direction, int maxNumberOfServerInstances, PipeTransmissionMode transmissionMode, PipeOptions options, int inBufferSize, int outBufferSize,PipeSecurity pipeSecurity, HandleInheritability inheritability,  PipeAccessRights additionalAccessRights)` while in corefx implementation there is `NamedPipeServerStream(String pipeName, PipeDirection direction, int maxNumberOfServerInstances, PipeTransmissionMode transmissionMode, PipeOptions options, int inBufferSize, int outBufferSize, HandleInheritability inheritability)`. Mono's version has two more arguments, PipeSecurity pipeSecurity and PipeAccessRights additionalAccessRights. So, I had to change CoreFx code in order to support the broken APIs of Mono. First I added the missing arguments in corefx's NamedPipeServerStream and I put default values where NamedPipeServerStream was called. Also, in NamedPipeServerStream there was a call of `Create` which is used for creation of a pipe on a specific platform. I put the two additional arguments in Create as well. In Create of Windows platform, I added additionalAccessRights at openMode variable and pipeSecurity in GetSecAttrs, implementing the same functionality as mono's version.

Afterwards, I imported `System.IO.Pipes.PipeStream` from CoreFx to build and basic profile with similar way as before. I built and run tests on Windows and Linux platform. The results of tests were successful. For macOS platform, I couldn't build and run tests because didn't have a machine.

Beacause I couldn't test all profiles, some includes from previous version of `common_System.Core.dll.sources` had to stay there. It caused conflicts with the includes from corefx. The solution was to transfer these files to the layer of profile specific files ( e.g `monodroid_System.Core.dll.sources`, `net_4_x_System.Core.dll.sources`). So, the profiles which I couln't test have the previous includes of mono, but the other have corefx includes.

Also, I tried to import my changes to `testing_aot_full` and `testing_aot_hybrid` profile which are relative to Ahead Of Time Compiler of Mono. But there was crash in the runtime in stable version of Mono, so it prevented me from testing.
About `monotouch` and `monodroid` profiles, I couldn't test them because it was very hard to test on Android and IOS environment.
The profiles, that I couldn't test with System.IO.Pipes.PipeStream from CoreFx, have the initial version of Mono.

Here, are the profiles that was tested:
* net_4_x
* xbuild_12
* xbuild_14
* build
* basic

Here, are the profiles that aren't tested:
* monodroid
* monotouch
* monotouch_runtime
* monotouch_watch
* monotouch_watch_runtime
* monotouch_tv
* monotouch_tv_runtime
* testing_aot_hybrid
* testing_aot_full
* winaot
* winaot
* xammac
* xammac_net_4_5
* orbis

At the end, I enabled signing of libraries for security reasons.

Here are the commits that I did in Mono and CoreFx repos:
* [Mono](https://github.com/Geotha/mono/commits/gsoc-System.IO.Pipes?author=geotha)
* [CoreFx](https://github.com/Geotha/corefx/commits/gsoc-System.IO.Pipes?author=geotha)

# Extra Work

In addition to proposed work, I undertook to run [`msbuild`](https://msdn.microsoft.com/en-us/library/dd393574.aspx) with parallel builds enabled on Linux using mono. Before my changes, parallel builds weren't possible. So, the purpose was to check if this important feature will work with CoreFx implementation. Running tests on msbuild with mono and without parallel builds enabled, I took errors both stable and my version of mono. Enabling parallel builds, errors were remaining and I couldn't determine if my version works properly.

# Future work

* Test CoreFx implementation to `testing_aot_full` and `testing_aot_hybrid` profiles, when runtime crash is resolved.
* Test CoreFx implementation to `monotouch` and `monodroid` profiles, when there is suitable equipment.
* Test mono on msbuild with `parallel builds` enabled, when tests will run successfully.

# Acknowledgement

Finally, I would like to thank my mentor **Ludovic Henry** for guidance, immense support and excellent collaboration that we had.