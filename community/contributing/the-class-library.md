---
title: The Class Library
redirect_from:
  - /The_Class_Library/
---

The Class Library is be compatible with Microsoft's .NET implementation. We will write as much code as possible in C#. We may need to interface with code written in C to gain access to the functionality of libraries like libart, Gtk+, and libc.

Contributing
------------

We welcome contributions to the the Class Library. To get started, check the status page for information about which APIs are being worked on, and how to get in touch with individual maintainers.

If you want to work on a class, first check the master branch to see if it is not implemented yet.

Layout
------

The Class Library resides in the \`mcs' module in the directoy \`class'.

Each directory in the directory represents the assembly where the code belongs to, and inside each directory we divide the code based on the namespace they implement.

For example, the "corlib" directory contains mscorlib:

    mcs/class/corlib

Inside that directory the namespaces appear:

    mcs/class/corlib/System
    mcs/class/corlib/System.IO
    mcs/class/corlib/System.Security

And we use a file per class in each of those directories.

Licensing
---------

The class library is being licensed under the terms of the [MIT license.](http://www.opensource.org/licenses/mit-license.html) This is the same license used by the X11 window system.

Class Library testing
---------------------

We need to write regression tests that will verify the correctness of the class library, compiler, and JIT engine.

Please write your regression tests using [NUnit](http://nunit.sourceforge.net)

Coding conventions
------------------

See our [Coding Guidelines](/community/contributing/coding-guidelines/) document for details on the coding conventions.

Missing implementation bits
===========================

If you implement a class and you are missing implementation bits, please use the MonoTODO attribute and a description of what is missing to be implemented, for example:

``` csharp
   [MonoTODO ("Finish this routine")]
   string Greet () {
       throw new NotImplementedException ();
   }
```

Tagging buggy code
------------------

If there is a bug in your implementation tag the problem by using the word "FIXME" in the code, together with a description of the problem. Do not use XXX or obscure descriptions, because otherwise people will not be able to understand what you mean.

Tagging Incomplete Specifications
---------------------------------

Sometimes the specification will be lame (consider Version.ToString (fieldCount) where there is no way of knowing how many fields are available, making the API not only stupid, but leading to unreliable code). In those cases, use the keyword "LAMESPEC".

FAQ
---

Frequently asked questions about the class library:

I am writing a new class that overrides one of the system classes, and I am getting a 1595 warning from the compiler. Should we use a different namespace?

There is a quick solution to the problem, you can pass the command line argument /nowarn:1595 and this will effectively let you use your implementation of the code, while overriding the ones from the system assemblies

