---
layout: docpage
navgroup: docs
title: What is Mono?
---

Mono is a software platform designed to allow developers to easily create cross platform applications. It is an open source implementation of Microsoft's .Net Framework based on the [ECMA]({{ site.github.url }}/old_site/ECMA "ECMA") standards for C\# and the Common Language Runtime. We feel that by embracing a successful, standardized software platform, we can lower the barriers to producing great applications for Linux.

The Components
--------------

There are several components that make up Mono:

**[C\# Compiler]({{ site.github.url }}/old_site/CSharp_Compiler "CSharp Compiler")** - Mono's C\# compiler is feature complete for C\# 1.0, 2.0, 3.0, and 4.0 (ECMA). A good description of the feature of the various versions is available on [Wikipedia](http://en.wikipedia.org/wiki/C_Sharp_%28programming_language%29#Versions).

**[Mono Runtime]({{ site.github.url }}/old_site/Mono:Runtime "Mono:Runtime")** - The runtime implements the ECMA Common Language Infrastructure (CLI). The runtime provides a Just-in-Time (JIT) compiler, an Ahead-of-Time compiler (AOT), a library loader, the garbage collector, a threading system and interoperability functionality.

**Base Class Library** - The Mono platform provides a comprehensive set of classes that provide a solid foundation to build applications on. These classes are compatible with Microsoft's .Net Framework classes.

**Mono Class Library** - Mono also provides many classes that go above and beyond the Base Class Library provided by Microsoft. These provide additional functionality that are useful, especially in building Linux applications. Some examples are classes for Gtk+, Zip files, LDAP, OpenGL, Cairo, POSIX, etc.

The Benefits
------------

There are many benefits to choosing Mono for application development:

**Popularity** - Built on the success of .Net, there are millions of developers that have experience building applications in C\#. There are also tens of thousands of books, websites, tutorials, and example source code to help with any imaginable problem.

**Higher-Level Programming** - All Mono languages benefit from many features of the runtime, like automatic memory management, reflection, generics, and threading. These features allow you to concentrate on writing your application instead of writing system infrastructure code.

**Base Class Library** - Having a comprehensive class library provides thousands of built in classes to increase productivity. Need socket code or a hashtable? There's no need to write your own as it's built into the platform.

**Cross Platform** - Mono is built to be cross platform. Mono runs on [Linux]({{ site.github.url }}/old_site/Mono:Linux "Mono:Linux"), [Microsoft Windows]({{ site.github.url }}/old_site/Using_Mono_on_Windows), [Mac OS X]({{ site.github.url }}/old_site/Mono:OSX "Mono:OSX"), [BSD]({{ site.github.url }}/old_site/Mono:BSD "Mono:BSD"), and [Sun Solaris]({{ site.github.url }}/old_site/Mono:Solaris "Mono:Solaris"), [Nintendo Wii]({{ site.github.url }}/old_site/Mono:Wii "Mono:Wii"), [Sony PlayStation 3]({{ site.github.url }}/old_site/Mono:PlayStation3 "Mono:PlayStation3"), [Apple iPhone]({{ site.github.url }}/old_site/Mono:Iphone "Mono:Iphone"). It also runs on [x86]({{ site.github.url }}/old_site/Mono:X86 "Mono:X86"), [x86-64]({{ site.github.url }}/old_site/Mono:AMD64 "Mono:AMD64"), [IA64]({{ site.github.url }}/old_site/Mono:IA64 "Mono:IA64"), [PowerPC]({{ site.github.url }}/old_site/Mono:PowerPC "Mono:PowerPC"), [SPARC (32)]({{ site.github.url }}/old_site/Mono:SPARC "Mono:SPARC"), [ARM]({{ site.github.url }}/old_site/Mono:ARM "Mono:ARM"), [Alpha](/index.php?title=Mono:Alpha&action=edit&redlink=1 "Mono:Alpha (page does not exist)"), [s390, s390x (32 and 64 bits)]({{ site.github.url }}/old_site/Mono:S390 "Mono:S390") and more. Developing your application with Mono allows you to run on nearly any computer in existance ([details](/index.php?title=Platforms&action=edit&redlink=1 "Platforms (page does not exist)")).

**Common Language Runtime (CLR)** - The CLR allows you to choose the programming language you like best to work with, and it can interoperate with code written in any other CLR language. For example, you can write a class in C\#, inherit from it in VB.Net, and use it in Eiffel. You can choose to write code in Mono in a [variety of programming languages]({{ site.github.url }}/old_site/Languages "Languages").

Other Uses
----------

[Scripting]({{ site.github.url }}/old_site/Scripting_With_Mono "Scripting With Mono") and [Embedding]({{ site.github.url }}/old_site/Embedding_Mono "Embedding Mono") - The Mono runtime can also be used to script your applications by embedding it inside other applications, to allow managed code and scripts to run in a native application.

See [Embedding Mono]({{ site.github.url }}/old_site/Embedding_Mono "Embedding Mono") for details on how to embed Mono.

See [Scripting With Mono]({{ site.github.url }}/old_site/Scripting_With_Mono "Scripting With Mono") for strategies on how to script your application using the Mono runtime.

