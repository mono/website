---
title: COM
redirect_from:
  - /COM/
---

What is COM
-----------

In the C++ world, there is no standardized way to access a member function of a class - every compiler names methods differently, encoding return types, parameter counts, class names and other distinguishing features of a member function in the compiled name to enable overloads and other C++ features. This is a problem for a non C-based language like C# (and many others), because there's no way the runtime can possibly know how to map a call from C# to a member function of a C++ object instance.

The usual way to circumvent this problem is to create a C library that provides a bridge between C# and C++ instances - these C helper libraries are usually called glue libraries. You create a C++ object instance via the C library, store it in C# as an IntPtr, and when you want to call member functions on that pointer/object, you call an equivalent method in the glue library, passing it the pointer, and the glue library does the call to C++ for you. Most glue libraries are a collection of one-liner functions that just get parameters and pass them on to C++ and back, and there are a few projects out there that can take a C++ header file and create all the needed C calls for you. All the calls from C# are done via P/Invoke as usual.

This strategy works, but it completely defeats the purpose of having an managed object oriented language talking to a native object oriented language - all the nice OOP gets lost in the translation, replaced by hundreds of static P/Invoke calls, and the C# classes end up storing IntPtrs everywhere.

COM (Component Object Model) is a way to bridge this gap, allowing the runtime to invoke member functions of C++ object instances in an object oriented way, without having to go through C glue libraries. It is a contract that defines how objects should be exposed, created and referenced, both in code and in memory. A COM-conforming C++ class always has a fixed initial structure, which allows the runtime to know exactly where methods are located, so it can invoke them directly regardless of compiler name-mangling conventions or other compiler issues.

The most basic COM C++ class only has 3 methods: QueryInterface, AddRef and Release. No matter how many members the class might have, those 3 are always present at the top of the class' vtable. Seeing as the vtable layout for the class is now known and well defined, any other method on that class can also be invoked directly just by it's position on the vtable.

COM-conforming C++ classes can be described in C# with interfaces that have the same layout as the C++ class they are mapping. Mono has internal support for dealing with COM calls, via the COM Interop layer, which means the whole process is completely transparent to the developer. Once you've defined an interface with the same methods in the same order as the original C++ class, you don't even realize you're using a COM object, it's just another object that you invoke methods on. Mono does all the marshalling automatically, which means that instead of passing IntPtrs around, you're passing and storing actual typed objects that you defined.

