---
layout: obsolete
title: "Embedded-api"
lastmodified: '1970-01-01'
permalink: /old_site/Embedded-api/
redirect_from:
  - /Embedded-api/
---

Embedded-api
============

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#embedding-mono">1 Embedding Mono</a>
<ul>
<li><a href="#embedding-the-mono-runtime-preliminary-version">1.1 Embedding the Mono runtime, preliminary version</a></li>
<li><a href="#embedding-the-runtime">1.2 Embedding the runtime</a></li>
<li><a href="#exposing-c-code-to-the-cil-universe">1.3 Exposing C code to the CIL universe</a></li>
<li><a href="#invoking-methods-in-the-cil-universe">1.4 Invoking Methods in the CIL universe</a></li>
<li><a href="#samples">1.5 Samples</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Embedding Mono
==============

-   Embedding the Mono runtime, preliminary version

-   Embedding the runtime

-   Exposing C code to the CIL universe

-   Invoking Methods in the CIL universe

-   Samples

Embedding the Mono runtime, preliminary version
-----------------------------------------------

This document describes how to embed the Mono runtime in your application, and how to invoke CIL methods from C, and how to invoke C code from CIL

Slides for Paolo's presentation at .NET ONE on the embedding API are available here: \<a href="[http://primates.ximian.com/\~lupus/slides/embed](http://primates.ximian.com/~lupus/slides/embed)"\>Hosting the Mono Runtime\</a\>. You can also get his \<a href="[http://primates.ximian.com/\~lupus/slides/embed/Mono-0.01.tar.gz](http://primates.ximian.com/~lupus/slides/embed/Mono-0.01.tar.gz)"\>sample Mono module for Perl\</a\>

Authors: Paolo Molaro, Miguel de Icaza.

Embedding the runtime
---------------------

Embedding the runtime consists of various steps:

-   Compiling and linking the Mono runtime

-   Initializing the Mono runtime

-   Optionally expose C code to the C\#/CIL universe.

 These are discussed in detail next.

**Compiling and Linking**

To embed the runtime, you have to link your code against the Mono runtime libraries. To do this, you want to pass the flags returned by pkg-config to your compiler:


    pkg-config --cflags --libs mono

 Like this:


    gcc sample.c `pkg-config --cflags --libs mono`

 You can separate the compilation flags from the linking flags, for instance, you can use the following macros in your makefile:


    CFLAGS=`pkg-config --cflags mono`
    LDFLAGS=`pkg-config --libs mono`

 **Initializing the Mono runtime**

To initialize the runtime, call mono\_jit\_init, like this:


    MonoDomain 
    *domain;
    domain = mono_jit_init ("domain-name");

 That will return a MonoDomain where your code will be executed. You can create multiple domains. Each domain is isolated from the other domains and code in one domain will not interfere with code in other domains. This is useful if you want to host different applications in your program.

Now, it is necessary to transfer control to Mono, and setup the threading infrastructure, you do this like this:


    void 
    *user_data = NULL;
    mono_runtime_exec_managed_code (domain, main_thread_handler, user_data);

 Where your main\_thread\_handler can load your assembly and execute it:


    static void main_thread_handler (gpointer user_data)
    {
    MonoAssembly 
    *assembly;
    assembly = mono_domain_assembly_open (domain, "file.dll");
    if (!assembly)
    error ();

 In the above example, the contents of \`file.dll' will be loaded into the domain. This only loads the code, but it will not execute anything yet. You can replace \`file.dll' with another transport file, like \`file.exe'

To start executing code, you must invoke a method in the assembly, or if you have provided a static Main method (an entry point), you can use the convenience function:


    retval = mono_jit_exec (domain, assembly, argc - 1, argv + 1);

 If you want to invoke a different method, look at the \`Invoking Methods in the CIL universe' section later on.

**Shutting down the runtime**

To shutdown the Mono runtime, you have to clean up all the domains that were created, use this function:


    mono_jit_cleanup (domain);

 **Applications that use threads.**

The Boehm GC system needs to catch your calls to the pthreads layer, so in each file where you use pthread.h you should include the \<gc/gc.h\> file.

If you can not do this for any reasons, just remember that you can not store pointers to Mono Objects on the stack, you can store them safely in the heap, or in global variables though

Exposing C code to the CIL universe
-----------------------------------

The Mono runtime provides two mechanisms to expose C code to the CIL universe: internal calls and native C code. Internal calls are tightly integrated with the runtime, and have the least overhead, as they use the same data types that the runtime uses.

The other option is to use the Platform Invoke (P/Invoke) to call C code from the CIL universe, using the standard P/Invoke mechanisms.

To register an internal call, use this call in the C code:


    mono_add_internal_call ("Hello::Sample", sample);

 Now, you need to declare this on the C\# side:


    using System;
    using System.Runtime.CompilerServices;


    class Hello {
    [MethodImplAttribute(MethodImplOptions.InternalCall)]
    extern static string Sample ();
    }

 Since this routine returns a string, here is the C definition:


    static MonoString
    *
    Sample ()
    {
    return mono_string_new (mono_domain_get (), "Hello!");
    }

 Notice that we have to return a \`MonoString', and we use the \`mono\_string\_new' API call to obtain this from a string.

Invoking Methods in the CIL universe
------------------------------------

Calling a method in the CIL universe from C requires a number of steps:

-   Obtaining the MonoMethod handle to the method.

-   The method invocation.

 **Obtaining a MonoMethod**

To get a MonoMethod there are several ways.

You can get a MonoClass (the structure representing a type) using [[|mono\_class\_from\_name]]

and then loop in the returned class method array until you get the one you're looking for. There are examples of such searches as static functions in several C files in metadata/

-   .c: we need to expose one through the API and remove

the duplicates.

The other, simpler, way is to use the functions in debug-helpers.h: there are examples of their use in monograph, mint and the jit as well. You basically use a string description of the method, like:


    "System.Object:GetHashCode()"

 and create a MonoMethodDesc out of it with [[|mono\_method\_desc\_new]]

You can then use [[|these methods]] to search for the method in a class or in an image. You would typically do this just once at the start of the program and store the result for reuse somewhere.

**Invoking a Method**

There are two functions to call a managed method:


    MonoObject
    *
    mono_runtime_invoke (MonoMethod 
    *method, void 
    *obj,
    void 
    *
    *params,
    MonoObject 
    *
    *exc);
    and
    MonoObject
    *
    mono_runtime_invoke_array (MonoMethod 
    *method, void 
    *obj,
    MonoArray 
    *params,
    MonoObject 
    *
    *exc);

 obj is the 'this' pointer, it should be NULL for static methods, a MonoObject

-   for object instances and a pointer to

the value type for value types.

The params array contains the arguments to the method with the same convention: MonoObject

-   pointers for object instances and

pointers to the value type otherwise. The \_invoke\_array variant takes a C\# object[] as the params argument (MonoArray

-   params): in this case the value types are boxed inside the

respective reference representation.

 From unmanaged code you'll usually use the mono\_runtime\_invoke() variant. Note that this function doesn't handle virtual methods for you, it will exec the exact method you pass: we still need to expose a function to lookup the derived class implementation of a virtual method (there are examples of this in the code, though).

You can pass NULL as the exc argument if you don't want to catch exceptions, otherwise,

-   exc will be set to the exception

thrown, if any. if an exception is thrown, you can't use the MonoObject

-   result from the function.

If the method returns a value type, it is boxed in an object reference. We have plans for providing an additional method that returns an unmanaged-\>managed thunk like this:


    void
    * mono_method_get_unmanaged_thunk (MonoMethod 
    *method);

 You'll be able to store the returned pointer in a function pointer with the proper signature and [[|call that directly from C:]]

It may not be possible to manage exceptions in that case, though. I need to think more about it.

**Threading issues**

If your application creates threads on its own, and you want them to be able to call code into the CIL universe with Mono, you have to register the thread with Mono before issuing the call.

To do so, call the mono\_thread\_attach() function before you execute any managed code from the thread

Samples
-------

See the sample programs in mono/sample/embed for examples of embedding the Mono runtime in your application.

