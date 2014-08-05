---
title: About Mono
redirect_from:
  - /About_Mono/
  - /About/
  - /Mono:About/
  - /What_is_Mono/
  - /What_is_Mono%3F/
---

Mono, the open source development platform based on the .NET framework, allows developers to build cross-platform applications with improved developer productivity. Mono's .NET implementation is based on the ECMA standards for [C\#](http://www.ecma-international.org/publications/standards/Ecma-334.htm) and the [Common Language Infrastructure](http://www.ecma-international.org/publications/standards/Ecma-335.htm).

Sponsored by Novell, the Mono project has an active and enthusiastic contributing community. Mono includes both developer tools and the infrastructure needed to run .NET client and server applications.

The Components
--------------

There are several components that make up Mono:

**[C\# Compiler]({{ site.github.url }}/docs/about-mono/languages/csharp/)** - Mono's C\# compiler is feature complete for C\# 1.0, 2.0, 3.0, and 4.0 (ECMA). A good description of the feature of the various versions is available on [Wikipedia](http://en.wikipedia.org/wiki/C_Sharp_%28programming_language%29#Versions).

**[Mono Runtime]({{ site.github.url }}/docs/advanced/runtime/)** - The runtime implements the ECMA Common Language Infrastructure (CLI). The runtime provides a Just-in-Time (JIT) compiler, an Ahead-of-Time compiler (AOT), a library loader, the garbage collector, a threading system and interoperability functionality.

**Base Class Library** - The Mono platform provides a comprehensive set of classes that provide a solid foundation to build applications on. These classes are compatible with Microsoft's .Net Framework classes.

**Mono Class Library** - Mono also provides many classes that go above and beyond the Base Class Library provided by Microsoft. These provide additional functionality that are useful, especially in building Linux applications. Some examples are classes for Gtk+, Zip files, LDAP, OpenGL, Cairo, POSIX, etc.

Mono Feature Highlights
-----------------------

[Multi-Platform]({{ site.github.url }}/docs/about-mono/supported-platforms/)  
Runs on [Linux]({{ site.github.url }}/docs/about-mono/supported-platforms/linux/), [OS X]({{ site.github.url }}/docs/about-mono/supported-platforms/osx/), [BSD]({{ site.github.url }}/docs/about-mono/supported-platforms/bsd/), and [Microsoft Windows]({{ site.github.url }}/docs/getting-started/install/windows/), including [x86]({{ site.github.url }}/docs/about-mono/supported-platforms/x86/), [x86-64]({{ site.github.url }}/docs/about-mono/supported-platforms/amd64/), [ARM]({{ site.github.url }}/docs/about-mono/supported-platforms/arm/), [s390]({{ site.github.url }}/docs/about-mono/supported-platforms/s390/), [PowerPC]({{ site.github.url }}/docs/about-mono/supported-platforms/powerpc/) and much more

[Multi-Language]({{ site.github.url }}/docs/about-mono/languages/)  
Develop in [C\# 4.0]({{ site.github.url }}/docs/about-mono/languages/csharp/) (including LINQ and `dynamic`), [VB 8]({{ site.github.url }}/docs/about-mono/languages/visualbasic/), [Java]({{ site.github.url }}/docs/about-mono/languages/java/), [Python]({{ site.github.url }}/archived/python "Python"), [Ruby](http://www.ironruby.net/), [Eiffel](http://www.eiffel.com/), [F\#](http://research.microsoft.com/fsharp/), [Oxygene](http://remobjects.com/oxygene), and more

Binary Compatible  
Built on an implementation of the [ECMA]({{ site.github.url }}/docs/about-mono/languages/ecma/)'s [Common Language Infrastructure]({{ site.github.url }}/docs/advanced/runtime/) and [C\#]({{ site.github.url }}/docs/about-mono/languages/csharp/)

[Microsoft Compatible API]({{ site.github.url }}/docs/getting-started/application-portability/)  
Run [ASP.NET]({{ site.github.url }}/docs/web/aspnet/), [ADO.NET]({{ site.github.url }}/docs/database-access/adonet/), [Silverlight]({{ site.github.url }}/docs/web/moonlight/) and [Windows.Forms]({{ site.github.url }}/docs/gui/winforms/) applications without recompilation

[Open Source, Free Software]({{ site.github.url }}/docs/faq/licensing/)  
Mono's runtime, compilers, and libraries are distributed under OSI approved licenses and are available for dual-licensing

[Comprehensive Technology Coverage]({{ site.github.url }}/docs/about-mono/plans/)  
Bindings and managed implementations of many popular libraries and protocols

The Benefits
------------

There are many benefits to choosing Mono for application development:

**Popularity** - Built on the success of .Net, there are millions of developers that have experience building applications in C\#. There are also tens of thousands of books, websites, tutorials, and example source code to help with any imaginable problem.

**Higher-Level Programming** - All Mono languages benefit from many features of the runtime, like automatic memory management, reflection, generics, and threading. These features allow you to concentrate on writing your application instead of writing system infrastructure code.

**Base Class Library** - Having a comprehensive class library provides thousands of built in classes to increase productivity. Need socket code or a hashtable? There's no need to write your own as it's built into the platform.

**Cross Platform** - Mono is built to be cross platform. Mono runs on [Linux]({{ site.github.url }}/docs/about-mono/supported-platforms/linux/), [Microsoft Windows]({{ site.github.url }}/docs/getting-started/install/windows/), [Mac OS X]({{ site.github.url }}/docs/about-mono/supported-platforms/osx/), [BSD]({{ site.github.url }}/docs/about-mono/supported-platforms/bsd/), and [Sun Solaris]({{ site.github.url }}/docs/about-mono/supported-platforms/solaris/), [Nintendo Wii]({{ site.github.url }}/docs/about-mono/supported-platforms/wii/), [Sony PlayStation 3]({{ site.github.url }}/docs/about-mono/supported-platforms/playstation3/), [Apple iPhone]({{ site.github.url }}/docs/about-mono/supported-platforms/iphone/). It also runs on [x86]({{ site.github.url }}/docs/about-mono/supported-platforms/x86/), [x86-64]({{ site.github.url }}/docs/about-mono/supported-platforms/amd64/), [IA64]({{ site.github.url }}/docs/about-mono/supported-platforms/ia64/), [PowerPC]({{ site.github.url }}/docs/about-mono/supported-platforms/powerpc/), [SPARC (32)]({{ site.github.url }}/docs/about-mono/supported-platforms/sparc/), [ARM]({{ site.github.url }}/docs/about-mono/supported-platforms/arm/), Alpha, [s390, s390x (32 and 64 bits)]({{ site.github.url }}/docs/about-mono/supported-platforms/s390/) and more. Developing your application with Mono allows you to run on nearly any computer in existance.

**Common Language Runtime (CLR)** - The CLR allows you to choose the programming language you like best to work with, and it can interoperate with code written in any other CLR language. For example, you can write a class in C\#, inherit from it in VB.Net, and use it in Eiffel. You can choose to write code in Mono in a [variety of programming languages]({{ site.github.url }}/docs/about-mono/languages/).

Other Uses
----------

[Scripting]({{ site.github.url }}/docs/advanced/embedding/scripting/) and [Embedding]({{ site.github.url }}/docs/advanced/embedding/) - The Mono runtime can also be used to script your applications by embedding it inside other applications, to allow managed code and scripts to run in a native application.

See [Embedding Mono]({{ site.github.url }}/docs/advanced/embedding/) for details on how to embed Mono.

See [Scripting With Mono]({{ site.github.url }}/docs/advanced/embedding/scripting/) for strategies on how to script your application using the Mono runtime.

