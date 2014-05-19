---
layout: obsolete
title: "CPlusPlus"
permalink: /old_site/CPlusPlus/
redirect_from:
  - /CPlusPlus/
---

CPlusPlus
=========

The CLI is able to host C++ compiled code on all [supported platforms]({{site.github.url}}/old_site/Supported_Platforms "Supported Platforms") as long as the compiled code only contains CIL instructions and not a mix of CIL and native code. Microsoft Managed C++ and C++/CLI compilers produce mixed-mode assemblies by default.

Mixed-mode assemblies are experimentally supported only on Windows because native code is platform specific. With the help of [Wine](http://www.winehq.org/) mixed-mode assemblies can be used on other platforms by the [Windows version]({{site.github.url}}/old_site/Using_Mono_on_Windows "Using Mono on Windows") of Mono.

There is little rationale to implement support for mixed-mode assemblies on other platforms because a different version of the same mixed-mode assembly would be required for each platform. Portable Executable format could not be used on operating systems other than Windows that would require non-standard ELF based assemblies for example.

[Embed Mono]({{site.github.url}}/old_site/Embedding_Mono "Embedding Mono") in your application and/or use [P/Invoke]({{site.github.url}}/old_site/Interop_with_Native_Libraries "Interop with Native Libraries") to achieve the goals of mixed-mode assemblies on other platforms. IJW thunks are P/Invoke calls with predefined function pointers thus have no performance advantage over P/Invoke.

Notice that Mono does not currently support the mixed-mode versions (there is no pure CIL version) of the Microsoft Visual C Runtime Library.

The following document describes the ways to produce platform independent pure CIL code using Microsoft compilers.

The Compilers
=============

Currently only Microsoft ships compilers for C++ that target the CIL, so this document will focus on that, at the end we discuss projects to create free C++ compilers that target the CIL.

There are two families of compilers:

-   Microsoft Managed C++: this shipped with .NET 1.0 and 1.1.
-   Microsoft C++/CLI: this ships with .NET 2.x frameworks

Both compilers produce CIL images, but the older compiler generated code that was a mix of CIL and native code, which made the code non-portable to non 80x86 systems.

The new compiler has vastly improved this situation and supports a number of command line switches to choose the kind of CIL code produced.

Code Generation
---------------

Although /clr:pure generates 100% pure valid IL code, it will add CRT DLL references using P/Invoke that will not run under Mono because Mono hasn't got a compatible CRT DLL. Furthermore you even can't use MS CRT DLLs with Mono because managed objects are passed using P/Invoke to CRT DLL and it is not supported by the Mono runtime. In addition P/Invoke calls to kernel32.dll are added as well to the assembly.

If you don't use CRT at all you can use it under Mono.

Using /clr:safe you cannot use CRT so it will run under Mono. Note that /clr:safe uses a more strict syntax than /clr:pure so it may be better to use /clr:pure.

I think that eliminating CRT references (replacing them with class library) is simpler than rewriting the code in C\#.

-   Use [Run-Time Routines by Category](http://msdn.microsoft.com/en-us/library/2aza74he.aspx) on MSDN to find class library replacements for CRT functions.

-   compile a CRT free assembly with /clr:pure following the [How to: Create a Partially Trusted Application by Removing Dependency on the CRT Library DLL](http://msdn.microsoft.com/en-us/library/ms235238.aspx) on MSDN.

Alternatively, or additionally, you may need to do the following:

-   Use ignore all default libraries linker option to avoid CRT dependency. This will generate a lot of linker errors for every CRT calls. You have to replace CRT functions with class library functions.

-   You will notice that the linker wants to use some overdecorated entry point found in CRT. Just set the entry point to main.

-   There still will be a missing "?.cctor@@\$\$FYMXXZ". This is a static constructor for the assembly similar to DllMain but is supported for exe files as well. This dependency cannot be avoided and is quite difficult to create a function with this signature. Declare it as the following:

<!-- -->

     #pragma warning(disable:4483)
     
     void __clrcall __identifier(".cctor")()
     {
     }

(If you want you can add some initialization code to the constructor.)

After these things you have to be able to run your /clr:pure assembly on Mono. Note that the above steps are easy. The only difficult thing is that you cannot use CRT functions.

(based on an email from Kornél Pál)

If you are using Managed C++ see [Producing Verifiable Components with Managed Extensions for C++](http://msdn.microsoft.com/en-us/library/ms384352.aspx) on MSDN.

Efforts
=======

Through Google's Summer of Code funding work has been done to modify GCC to produce CIL code. When this code is complete it will be possible to have any of the GCC languages produce code that will run on Mono's VM.

But this is not sufficient to compile C++ CLI code that targets Mono, as these extensions will require modifications to GCC to recognize this new language and emit the proper code.

The ideal path to support C++ is to finish the work that was started by Jey on the summer of code to make GCC emit CIL code. You can get some links to the work-in-progress from: [Summer of Code GCC CIL project]({{site.github.url}}/old_site/Summer2005#gcc-cil "Summer2005")

The blog linked there has some details about the progress so far.

Once this stage is done, there are two extra stages that are fairly complex:

-   Add Managed C++ support to the C++ front-end (this is required if you want to share objects between .NET and C++)

-   Add the necessary data to pass the extra information to the backend so that the metadata is preserved.

Each one of these three tasks are probably six months of work each.

Given the complexity of C++ this is really the only choice, implementing a new C++ compiler just to support the CIL is not realistic.

