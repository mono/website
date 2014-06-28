---
layout: docpage
navgroup: docs
title: Mixing with Other Languages
---

Mixing and Matching CLR Languages
=================================

-   [Using Mono with Java]({{ site.github.url }}/old_site/Java "Java")
-   [Using Mono with Visual Basic.NET]({{ site.github.url }}/old_site/VisualBasic.NET_support "VisualBasic.NET support")
-   [Using Mono with Other Languages]({{ site.github.url }}/old_site/Languages "Languages")

Embedding the Mono runtime in an existing native application
============================================================

The Mono runtime can be embedded into an existing C, C++ or Objective-C based application. Embedding allows developers to keep their existing investment on their current code base while extending its functionality with CIL-based components. This is a key concept: to take advantage of Mono, you do not need to rewrite your software from scratch: you can keep everything you have today, and write new code in Mono, and have both universes communicate with each other.

Embedding is also known as "hosting" to developers coming from the .NET Framework.

Embedding is particularly useful when you have an existing application, but you would like to extend its functionality either by reusing third-party Mono, .NET components or Java components, or enable developers to "script" components of your application with any of the .NET or Java supported languages.

The embedding API of Mono requires some little knowledge about C and C\#. You might not need to read this entire document, it depends very much on the needs of your application.

(P/Invoke allows Mono developers to call from the managed world APIs that are exposed by the C universe and provides various automatic marshalling mechanisms to convert information back and forth between the managed world and the unmanaged world. For more details on the P/Invoke platform, you are encouraged to read the [Interop\_with\_Native\_Libraries]({{ site.github.url }}/old_site/Interop_with_Native_Libraries "Interop with Native Libraries").)

For more information, see [Scripting With Mono]({{ site.github.url }}/old_site/Scripting_With_Mono "Scripting With Mono") and [Embedding Mono]({{ site.github.url }}/old_site/Embedding_Mono "Embedding Mono").

