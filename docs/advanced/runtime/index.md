---
title: The Mono Runtime
redirect_from:
  - /Mono%3ARuntime/
  - /Mono_Runtime/
---

The Mono runtime implements the [ECMA Common Language Infrastructure](http://www.ecma-international.org/publications/standards/Ecma-335.htm) (CLI). The Mono runtime implements this virtual machine.<br/>
If you are interested in the technical aspects of the Mono runtime check the [Runtime Documentation](/docs/advanced/runtime/docs/).

The runtime offers the following services:

-   Code Execution
    -   Code loading
    -   Support for dynamically generating code
    -   [On-the-fly marshalling to invoke native methods.](/docs/advanced/pinvoke/)
    -   [COM Interoperability](/docs/advanced/com-interop/)
-   Garbage Collection, using one of:
    -   [Precise SGen Garbage Collector](/docs/advanced/garbage-collector/sgen/)
    -   Conservative Boehm Garbage Collector
-   Code Generation
    -   Just-in-Time compilation, partial and full [Ahead-of-Time modes](/docs/advanced/aot/)
    -   Backend engines:
        -   Mono's own engine
        -   [LLVM optimizing compiler backend engine](/docs/advanced/mono-llvm/)
    -   [First-class SIMD datatypes (Mono.Simd)](http://go-mono.com/docs/index.aspx?link=N%3aMono.Simd)
-   Exception Handling
    -   Software-triggered exceptions
    -   Hardware-triggered exceptions like Floating point exceptions, null reference exceptions
-   Operating system interface
    -   File system IO
    -   Networking IO
    -   Access to operating system properties and features
    -   On Unix systems, [Mono.Posix APIs](http://go-mono.com/docs/index.aspx?link=N%3aMono.Posix)
-   Program isolation using Application Domains (AppDomain)
-   Thread management:
    -   Threadpool for user code
    -   Threadpool for networked IO
    -   Asynchronous method invocation
-   Console access
-   Security System
    -   [CoreCLR/Transparent Security Sandbox](/docs/advanced/coreclr-howto/)

The Mono runtime can be used as a stand-alone process, or it can be [embedded into applications](/docs/advanced/embedding/)

Embedding the Mono runtime allows applications to be extended in C# while reusing all of the existing C and C++ code. For more details, see the [Embedding Mono](/docs/advanced/embedding/) page and the [Scripting With Mono](/docs/advanced/embedding/scripting/) page.

Supported Platforms
-------------------

Mono has support for both 32 and 64 bit systems on a number of architectures as well as a number of operating systems.

### Supported Operating Systems

**Operating Systems**

-   [Android](https://developer.xamarin.com/guides/android/)
-   [Apple iOS](https://developer.xamarin.com/guides/ios), [iOS](/docs/about-mono/supported-platforms/iphone/)
-   [Apple macOS](/docs/about-mono/supported-platforms/osx/),
-   [Apple tvOS](https://developer.xamarin.com/guides/ios/tvos/)
-   [Apple watchOS](https://developer.xamarin.com/guides/ios/watch/)
-   [BSD](/docs/about-mono/supported-platforms/bsd/) - OpenBSD, FreeBSD, NetBSD
-   [Linux](/docs/about-mono/supported-platforms/linux/)
-   [Microsoft Windows](/docs/getting-started/install/windows/)
-   [Nintendo Wii](/docs/about-mono/supported-platforms/wii/)
-   [Sony PlayStation 3](/docs/about-mono/supported-platforms/playstation3/)
-   [Sony PlayStation 4](/docs/about-mono/supported-platforms/playstation4/)
-   [Sun Solaris](/docs/about-mono/supported-platforms/solaris/)

### Supported Architectures

|Supported Architectures|Operating system|
|:----------------------|:---------------|
|[s390, s390x (32 and 64 bits)](/docs/about-mono/supported-platforms/s390/)|Linux|
|[SPARC (32)](/docs/about-mono/supported-platforms/sparc/)|Solaris, Linux|
|[PowerPC](/docs/about-mono/supported-platforms/powerpc/)|Linux, Mac OSX, Wii, PlayStation 3|
|[x86](/docs/about-mono/supported-platforms/x86/)|Linux, FreeBSD, OpenBSD, NetBSD, Microsoft Windows, Solaris, OS X, Android|
|[x86-64](/docs/about-mono/supported-platforms/amd64/): AMD64 and EM64T (64 bit)|Linux, FreeBSD, OpenBSD, Solaris, OS X|
|[IA64](/docs/about-mono/supported-platforms/ia64/) Itanium2 (64 bit)|Linux|
|[ARM](/docs/about-mono/supported-platforms/arm/): little and big endian|Linux (both old and new ABI), iPhone, Android|
|Alpha|**not maintained**. Linux|
|[MIPS](/docs/about-mono/supported-platforms/mips/)|Linux|
|HPPA|**not maintained** Linux|

Note that the Alpha, MIPS, ARM big-endian and HPPA architectures are community-supported and may not be as complete as the other architectures.

Support for SPARC64 works in older versions of Mono, but not in the recent versions.

 Packages for most platforms are available from the [Downloads](/download/stable/) page.

### Embedded systems

To make mono more suitable for some architectures used as embedded systems have a look at the [Small footprint](/docs/compiling-mono/small-footprint/) page.

Compilation Engine
------------------

Paolo Molaro did a presentation on the current JIT engine and the new JIT engine. You can find his slides [here](/docs/advanced/runtime/jitslides/).

We have re-written our JIT compiler. We wanted to support a number of features that were missing: Ahead of Time compilation, simplify porting and have a solid foundation for compiler optimizations.

### Ahead-of-time compilation

The idea is to allow developers to pre-compile their code to native code to reduce startup time, and the working set that is used at runtime in the just-in-time compiler.

Although in Mono this has not been a visible problem, we wanted to pro-actively address this problem.

When an assembly (a Mono/.NET executable) is installed in the system, then it is possible to pre-compile the code, and have the JIT compiler tune the generated code to the particular CPU on which the software is installed.

This is done in the Microsoft.NET world with a tool called ngen.exe.

The code produced by Mono's ahead-of-time compiler is Position Independent Code (PIC) which tends to be a bit slower than regular JITed code, but what you loose in performance with PIC you gain by being able to use all the available optimizations.

To compile your assemblies with this, just run this command:

     $ mono -O=all --aot program.exe

The above command will turn on all optimizations (`-O=all`) and then instructs Mono to compile the code to native code.

Additionally, if you want to do full static builds (and be able to run without the JIT engine), you can use:

     $ mono -O=all --aot --full-aot program.exe

Then you can configure your Mono runtime with --enable-minimal to remove the JIT engine. This is useful on systems that do not support Just-in-Time compilation at the kernel level.

Some features like Reflection.Emit and other forms of dynamic code generation are not support in this scenario.

Notice that for Mono 2.0 generics are not supported when doing full-AOT.

Some optimizations are being planned: [OptimizingAOT](/archived/optimizingaot)

### Bundles

Mono also offers bundles. Bundles merge your application, the libraries it uses and the Mono runtime into a single executable image. You can think of bundles as "statically linking mono" into your application.

To do this, you use the "mkbundle" command (see the man page distributed with Mono for more details).

For example, to create a fully static and bundled version of Mono for "hello world", you would:

``` bash
bash$ mcs hello.cs
bash$ mkbundle --simple hello.exe -o hello
Done
bash$ ./hello
Hello, world.
bash$
```

Of course, you can also just embed the libraries, without the actual Mono runtime, by removing the --static flag.

### Linker

Mono ships with a customizable assembly-linker.   This is a technology that can be used to
create a custom deployment of the Mono runtime that only contains the code that your application
uses.   This is similar to what a native linker does, except that we retain the same assemblies.

For example:

``` bash
bash$ mcs hello.cs
bash$ monolinker -c link -a hello.exe -out minimal
bash$ ls -l minimal
-rwxr-xr-x  1 miguel  wheel   683008 Jun  2 15:16 I18N.CJK.dll
-rwxr-xr-x  1 miguel  wheel    32768 Jun  2 15:16 I18N.MidEast.dll
-rwxr-xr-x  1 miguel  wheel    36352 Jun  2 15:16 I18N.Other.dll
-rwxr-xr-x  1 miguel  wheel   182272 Jun  2 15:16 I18N.Rare.dll
-rwxr-xr-x  1 miguel  wheel    71168 Jun  2 15:16 I18N.West.dll
-rwxr-xr-x  1 miguel  wheel    39936 Jun  2 15:16 I18N.dll
-rw-r--r--  1 miguel  wheel     3072 Jul 21 23:49 hello.exe
-rw-r--r--  1 miguel  wheel  2223104 Jul 21 23:49 mscorlib.dll
bash$ cd minimal
bash$ mono hello.exe
Hello, world.
```

You can combine the output of the linker with the bundler.   Allowing you to produce
smaller versions of your self-contained executables.

### Platform for Code Optimizations

Beyond the use of the Mono VM as Just-in-Time compiler, we need to make Mono code generation as efficient as possible.

The design called for a good architecture that would enable various levels of optimizations: some optimizations are better performed on high-level intermediate representations, some on medium-level and some at low-level representations.

Also it should be possible to conditionally turn these on or off. Some optimizations are too expensive to be used in just-in-time compilation scenarios, but these expensive optimizations can be turned on for ahead-of-time compilations or when using profile-guided optimizations on a subset of the executed methods.

### Simplify Porting

We wanted to reduce the effort required to port the Mono code generator to new architectures.

For Mono to gain wide adoption in the UNIX world, it is necessary that the JIT engine works in most of today's commercial hardware platforms.

The new Mono engine now supports both 32 and 64 bit systems and various architectures (See [Supported Platforms](/docs/about-mono/supported-platforms/)).

### Profiling and Code Coverage

Mono provides a number of profiling tools and code coverage tools.

See the [Performance Tips](/docs/advanced/performance-tips/) page for details on using the profiler, and the [Code Coverage](/docs/debug+profile/profile/code-coverage/) page for information on how to use the code coverage functionality with your application and your test suites.

### DTrace

Mono's [support for DTrace](/docs/debug+profile/profile/dtrace/) is available on Solaris and MacOS X.

### Logging runtime events

See [Logging runtime events](/docs/advanced/runtime/logging-runtime-events/).

Versioning
----------

Mono supports a Global Assembly Cache or GAC. The GAC is used to share libraries between different applications, to keep multiple versions of the same library installed at once and to avoid conflicts over the names of the libraries and they also play an important role in trust and security.

See the [Assemblies_and_the_GAC](/docs/advanced/assemblies-and-the-gac/) document for more details.

Garbage Collection
------------------

Mono today uses Boehm's GC as its Garbage Collection engine. We are also working on a precise and compacting GC engine specific to Mono.

The GC interface is being isolated to allow for more than one GC engine to be used or for the GC to be tuned for specific tasks.

### Mono's use of Boehm GC

We are using the Boehm conservative GC in precise mode.

There are a few areas that the GC scans for pointers to managed objects:

1.  The heap (where other managed objects are allocated)
2.  thread stacks and registers
3.  static data area
4.  data structures allocated by the runtime

(1) is currently handled in mostly precise mode: almost always the GC will only consider memory words that contain only references to the heap, so there is very little chance of pointer misidentification and hence memory retention as a result. The new GC requires a fully precise mode here, so it will improve things marginally. The details about mostly precise have to do with large objects with sparse bitmaps of references and the handling of multiple appdomains safely.

(2) is always scanned conservatively. This will be true for the new GC, too, at least for the first versions, where I'll have my own share of fun at tracking the bugs that a moving generational GC will expose. Later we'll conservatively scan only the unmanaged part of the stacks.

(3) We already optimized this both with Boehm and the current GC to work in precise mode.

(4) I already optimized this to work in mostly precise mode (ie some data structures are dealt with precisely, others not yet). I'll need to do more work in this area, especially for the new GC, where having pinned objects can be a significant source of pain.

### References

-   Garbage collection list and FAQ: [http://www.iecc.com/gclist/](http://www.iecc.com/gclist/)

-   [GC points in a Threaded Environment](http://research.sun.com/techrep/1998/abstract-70.html)

-   "A Generational Mostly-concurrent Garbage Collector":

-   [A Generational Mostly-concurrent Garbage Collector](http://research.sun.com/techrep/2000/abstract-88.html)

-   Details on The Microsoft .NET Garbage Collection Implementation:

[http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnmag00/html/GCI.asp](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnmag00/html/GCI.asp)

[http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnmag00/html/GCI2.asp](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnmag00/html/GCI2.asp)

IO and threading
----------------

The ECMA runtime and the .NET runtime assume an IO model and a threading model that is very similar to the Win32 API.

Dick Porter has developed WAPI: the Mono abstraction layer that allows our runtime to execute code that depend on this behaviour, this is called the \`io-layer' in the Mono source code distribution.

This io-layer offers services like named mutexes that can be shared across multiple processes.

To achieve this, the io-layer uses a shared file mapping across multiple Mono processes to track the state that must be shared across Mono applications in the \~/.wapi directory.

Useful links
------------

See our [Papers](/archived/papers) section for various articles describing virtual machines and JIT compilers.

Porting
-------

See the [Porting](/docs/advanced/runtime/porting/) page for more details on porting Mono to a new platform.

Projects Under Development
--------------------------

There are a number of projects being developed in branches or on separate trees for the runtime, these are:

-   [Runtime Projects](/docs/advanced/runtime/runtime-projects/): General Runtime Projects.
-   [Runtime Requests](/docs/advanced/runtime/runtime-requests/): Ideas of things that we could use to improve Mono's runtime.
-   [Compacting GC](/docs/advanced/garbage-collector/sgen/): A generational, compacting GC for Mono.
-   JIT Regalloc: A new register allocation framework.
-   [Mono_Runtime_API_Changes](/archived/mono_runtime_api_changes): Changes that will be introduced in Mono 2.8.

Completed projects:

-   [Continuations](/archived/continuations): Support for co-routines and continuations in Mono.
-   [SafeHandles](/docs/advanced/safehandles/): Support for 2.0 SafeHandles.
-   [Linear](/docs/advanced/runtime/docs/linear-ir/): An update to the JIT's internal representation (IR).

COM and XPCOM
-------------

Mono's COM support can be used to interop with system COM components in Windows and in Linux (if you use a COM implementation). Additionally, Mono's COM support can be used to access software based on Mozilla's XPCOM.

For details on the progress, see the [COM Interop](/docs/advanced/com-interop/) page.

