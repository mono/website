---
title: "Introduction to developing with Mono"
lastmodified: '2006-11-11'
redirect_from:
  - /Introduction_to_developing_with_Mono/
  - /Basic_Mono_Programming/
  - /Introduction_to_Mono_development/
---

Introduction to developing with Mono
====================================

Assemblies
==========

Mono and .NET compile source code into 'assemblies'. Assemblies, which are similar to collections of Java `.class` files, contain language-independent, platform-independent bytecode called CIL (Common Intermediate Language). Because assemblies are language independent, it doesn't matter what language was used to create them. Assemblies made with C# can mix with assemblies created with VB.NET, Java (using [IKVM](/Java)), or any language that someone has written a CIL compiler for.

But, being platform independent means, of course, that assemblies need to be compiled *again* into native code before they can run on any particular machine. It's important to distinguish the two compilations involved in Mono applications: from source code to byte code, and from byte code to native machine code. The first compilation is performed by the developer. The second compilation is generally performed just when the program begins executing, on the very computer that will run the application, and for this reason it's called Just-In-Time (JIT) compilation. This second compilation and the execution of the application is performed by a Common Language Runtime (CLR).

Mono also supports Ahead-Of-Time (AOT) compilation. This is a mode that pre-compiled the code, and it is useful to reduce application startup time (by eliminating the JIT startup time) and increasing the code that can be shared across multiple applications.

On Windows and Linux, as well as other operating systems, assemblies are stored in files with the `.dll` or `.exe` extension. The only difference between a `.dll` assembly and a `.exe` assembly is that a `.exe` assembly contains a starting point for an application (a Main method), whereas `.dll` assemblies only are class libraries.

Classes
=======

An assembly contains the byte-code for classes. Classes in Mono/.NET are exactly parallel to classes in Java, C++, and other object-oriented languages. They contain constructors, methods, and fields, as with other languages, and CLR classes also contain properties and events.

Classes are grouped into namespaces (the Java equivalent of packages). The namespace of the core classes in the class library is `System`. Other class library namespaces include `System.IO`, `System.Windows.Forms`, and `System.Xml`. The full name of a class is its namespace plus its short name. The full name of the `Stream` class in `System.IO` is `System.IO.Stream`.

Namespaces often share their names with the names of assemblies, but don't be misled. Although GUI classes appear in the `System.Windows.Forms` namespace and the `System.Windows.Forms` assembly, this is only an accident. The class `System.IO.Stream` is in the `System.IO` namespace, but it is found in the `mscorlib` assembly. When you write code (e.g. the `using` statement), you always deal with 'namespaces'. When you invoke the compiler, you specify the 'assemblies' to load.

Hello World
===========

Here's a Hello World application written in C#. When the program starts, it writes "Hello, World!" to the console and exits.

``` csharp
// Hello World! : hello.cs
 
using System;
 
class Hello {
    static void Main() {
        Console.WriteLine ("Hello, World!");
    }
}
```

If you have Mono installed, you can compile this source code with the command:

    mcs hello.cs

Mono's C# compiler, mcs, creates in an assembly named `hello.exe` that you can execute on any platform supporting the CLR -- using Mono on any supported platform, or using .NET on Windows. To run the program using Mono, type:

    mono hello.exe

