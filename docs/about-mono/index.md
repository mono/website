---
title: About Mono
redirect_from:
  - /About_Mono/
  - /About/
  - /about/
  - /Mono:About/
  - /What_is_Mono/
  - /What_is_Mono%3F/
---

Mono, the open source development platform based on the .NET Framework, allows developers to build cross-platform applications with improved developer productivity. Mono's .NET implementation is based on the ECMA standards for [C#](http://www.ecma-international.org/publications/standards/Ecma-334.htm) and the [Common Language Infrastructure](http://www.ecma-international.org/publications/standards/Ecma-335.htm).

Supported previously by Novell, [Xamarin](http://xamarin.com/) and now [Microsoft](http://www.microsoft.com) and the [.NET Foundation](http://www.dotnetfoundation.org/), the Mono project has an active and enthusiastic contributing community. Mono includes both developer tools and the infrastructure needed to run .NET client and server applications.

The Components
--------------

There are several components that make up Mono:

**[C# Compiler](/docs/about-mono/languages/csharp/)** - Mono's C# compiler is feature complete for C# 1.0, 2.0, 3.0, 4.0 and 5.0 (ECMA). A good description of the feature of the various versions is available on [Wikipedia](http://en.wikipedia.org/wiki/C_Sharp_%28programming_language%29#Versions).

**[Mono Runtime](/docs/advanced/runtime/)** - The runtime implements the ECMA Common Language Infrastructure (CLI). The runtime provides a Just-in-Time (JIT) compiler, an Ahead-of-Time compiler (AOT), a library loader, the garbage collector, a threading system and interoperability functionality.

**.NET Framework Class Library** - The Mono platform provides a comprehensive set of classes that provide a solid foundation to build applications on. These classes are compatible with Microsoft's .Net Framework classes.

**Mono Class Library** - Mono also provides many classes that go above and beyond the Base Class Library provided by Microsoft. These provide additional functionality that are useful, especially in building Linux applications. Some examples are classes for Gtk+, Zip files, LDAP, OpenGL, Cairo, POSIX, etc.

Mono Feature Highlights
-----------------------

[Multi-Platform](/docs/about-mono/supported-platforms/)<br/>
Runs on [Linux](/docs/about-mono/supported-platforms/linux/), [OS X](/docs/about-mono/supported-platforms/osx/), [BSD](/docs/about-mono/supported-platforms/bsd/), and [Microsoft Windows](/docs/getting-started/install/windows/), including [x86](/docs/about-mono/supported-platforms/x86/), [x86-64](/docs/about-mono/supported-platforms/amd64/), [ARM](/docs/about-mono/supported-platforms/arm/), [s390](/docs/about-mono/supported-platforms/s390/), [PowerPC](/docs/about-mono/supported-platforms/powerpc/) and much more

[Multi-Language](/docs/about-mono/languages/)<br/>
Develop in [C# 4.0](/docs/about-mono/languages/csharp/) (including LINQ and `dynamic`), [VB 8](/docs/about-mono/languages/visualbasic/), [Java](/docs/about-mono/languages/java/), [Python](/archived/python), [Ruby](http://www.ironruby.net/), [Eiffel](http://www.eiffel.com/), [F#](http://research.microsoft.com/fsharp/), [Oxygene](http://remobjects.com/oxygene), and more

Binary Compatible<br/>
Built on an implementation of the [ECMA](/docs/about-mono/languages/ecma/)'s [Common Language Infrastructure](/docs/advanced/runtime/) and [C#](/docs/about-mono/languages/csharp/)

[Microsoft Compatible API](/docs/getting-started/application-portability/)<br/>
Run [ASP.NET](/docs/web/aspnet/), [ADO.NET](/docs/database-access/adonet/), [Silverlight](/docs/web/moonlight/) and [Windows.Forms](/docs/gui/winforms/) applications without recompilation

[Open Source, Free Software](/docs/faq/licensing/)<br/>
Mono's runtime, compilers, and libraries are distributed the MIT license.

[Comprehensive Technology Coverage](/docs/about-mono/plans/)<br/>
Bindings and managed implementations of many popular libraries and protocols

The Benefits
------------

There are many benefits to choosing Mono for application development:

**Popularity** - Built on the success of .Net, there are millions of developers that have experience building applications in C#. There are also tens of thousands of books, websites, tutorials, and example source code to help with any imaginable problem.

**Higher-Level Programming** - All Mono languages benefit from many features of the runtime, like automatic memory management, reflection, generics, and threading. These features allow you to concentrate on writing your application instead of writing system infrastructure code.

**Base Class Library** - Having a comprehensive class library provides thousands of built in classes to increase productivity. Need socket code or a hashtable? There's no need to write your own as it's built into the platform.

**Cross Platform** - Mono is built to be cross platform. Mono runs on [Linux](/docs/about-mono/supported-platforms/linux/), [Microsoft Windows](/docs/getting-started/install/windows/), [Mac OS X](/docs/about-mono/supported-platforms/osx/), [BSD](/docs/about-mono/supported-platforms/bsd/), and [Sun Solaris](/docs/about-mono/supported-platforms/solaris/), [Nintendo Wii](/docs/about-mono/supported-platforms/wii/), [Sony PlayStation 3](/docs/about-mono/supported-platforms/playstation3/), [Apple iPhone](/docs/about-mono/supported-platforms/iphone/) and [Android](/docs/about-mono/supported-platforms/android/). It also runs on [x86](/docs/about-mono/supported-platforms/x86/), [x86-64](/docs/about-mono/supported-platforms/amd64/), [IA64](/docs/about-mono/supported-platforms/ia64/), [PowerPC](/docs/about-mono/supported-platforms/powerpc/), [SPARC (32)](/docs/about-mono/supported-platforms/sparc/), [ARM](/docs/about-mono/supported-platforms/arm/), Alpha, [s390, s390x (32 and 64 bits)](/docs/about-mono/supported-platforms/s390/) and more. Developing your application with Mono allows you to run on nearly any computer in existence.

**Common Language Runtime (CLR)** - The CLR allows you to choose the programming language you like best to work with, and it can interoperate with code written in any other CLR language. For example, you can write a class in C#, inherit from it in VB.Net, and use it in Eiffel. You can choose to write code in Mono in a [variety of programming languages](/docs/about-mono/languages/).

Other Uses
----------

[Scripting](/docs/advanced/embedding/scripting/) and [Embedding](/docs/advanced/embedding/) - The Mono runtime can also be used to script your applications by embedding it inside other applications, to allow managed code and scripts to run in a native application.

See [Embedding Mono](/docs/advanced/embedding/) for details on how to embed Mono.

See [Scripting With Mono](/docs/advanced/embedding/scripting/) for strategies on how to script your application using the Mono runtime.

