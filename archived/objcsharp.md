---
title: "ObjCSharp"
lastmodified: '2005-11-09'
permalink: /archived/ObjCSharp/
redirect_from:
  - /ObjCSharp/
  - /ObjC/
---

ObjCSharp
=========

Introduction
------------

ObjC\# is a two way bridge to leverage the CLR into the ObjectiveC programming language and expose your ObjectiveC classes to the CLR. ObjC\# is currently only support on Mac OS X. There are a few simple rules to remember when translating a CLR method into a ObjC selector:

-   All method names with arguments are appended based on the argument type. That is MyMethod (int a, float b) would become MyMethodWithInt32:Single:
-   The parameterless constructor are mapped to init
-   Constructors with parameters are mapped like methods but prefaced with init (eg; initWithInt32:)

You also need to remember that if your method is returning a primitive type it is returned as a pointer to the result; so if you had:

``` csharp
public int MyMethod () {
  return 1;
}
```

Then your objc\# code would be:

` NSLog (*(int *)[yourinstance MyMethod]);`

Tutorials
---------

The beginning of every ObjC\# invokation involves initializing the bridge:

Allocate a new instance of the bridge:

` ObjCSharpBridge bridge = [ObjCSharpBridge alloc];`

Initialize the bridge:

` [bridge init];`

After you have a working instance of the bridge you need to load the assembly you wish to interact with:

` [bridge loadAssembly: "test-library.dll"]`

You are now ready to load a class representation of any class in the loaded assembly (or its referenced assemblies).

` Class yourClass = [bridge getClass: "YourNameSpace.YourClass"];`

If you wanted to call a static method; you do so directly on the class representation:

` [yourClass YourStaticMethod];`

You now of course need to initialize the class (mapped to the constructor in the CLR):

` id instance = [yourClass initWithInt32:-2];`

You may now call methods according to the rules stated above.

Make sure you look at the test/ directory in SVN for more examples of different code/call paths.

Versions & Status
-----------------

ObjC\# is currently at v0.1 and only available from SVN. It can successfully represent classes both ways across the bridge. It can also invoke events through the bridge. Marshalling of primitives works.

