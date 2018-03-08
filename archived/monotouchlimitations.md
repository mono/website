---
title: "MonoTouch:Limitations"
lastmodified: '2009-09-04'
redirect_from:
  - /MonoTouch%3ALimitations/
---

MonoTouch:Limitations
=====================

Since applications on the iPhone using MonoTouch are compiled to static code, it is not possible to use any facilities that require code generation at runtime.

These are the MonoTouch limitations compared to desktop Mono/Moonlight:

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#limited-debugging-support">1 Limited Debugging Support</a></li>
<li><a href="#limited-generics-support">2 Limited Generics Support</a>
<ul>
<li><a href="#generic-virtual-methods">2.1 Generic Virtual Methods</a></li>
<li><a href="#pinvokes-in-generic-types">2.2 P/Invokes in Generic Types</a></li>
<li><a href="#value-types-as-dictionary-keys">2.3 Value types as Dictionary Keys</a></li>
</ul></li>
<li><a href="#no-dynamic-code-generation">3 No Dynamic Code Generation</a>
<ul>
<li><a href="#systemreflectionemit">3.1 System.Reflection.Emit</a></li>
<li><a href="#reverse-callbacks">3.2 Reverse Callbacks</a></li>
</ul></li>
<li><a href="#no-remoting">4 No Remoting</a></li>
<li><a href="#runtime-disabled-features">5 Runtime Disabled Features</a></li>
<li><a href="#only-tested-with-iphoneos-30">6 Only tested with iPhoneOS 3.0</a></li>
</ul></td>
</tr>
</tbody>
</table>

Limited Debugging Support
=========================

There is no support for debugging in MonoTouch, except for low-level debugging with GDB of the runtime.

To learn how to use GDB to debug the runtime you can read [Debugging](/Debugging)

Most of the debugging is done with Console.WriteLine.

Limited Generics Support
========================

Mono's [Full AOT](/docs/advanced/aot/#full-aot) support has the following limitations with respect to generics:

Generic Virtual Methods
-----------------------

Generic virtual methods aren't supported, as it isn't possible to determine statically what method will be called in all circumstances. (Which is why C++ doesn't support virtual template methods, either.)

``` csharp
class HasGenericVirtualMethod {
    public virtual PrintValues<T>(params T[] values)
    {
        // ...
    }
}
 
// ...
var a = new HasGenericVirtualMethod ();
a.PrintValues (new[]{1, 2, 3, 4});
```

P/Invokes in Generic Types
--------------------------

P/Invokes in generic methods aren't supported:

``` csharp
class GenericType<T> {
    [DllImport ("System")]
    public static extern int getpid ();
}
```

Value types as Dictionary Keys
------------------------------

Using a value type as a Dictionary\<TKey, TValue\> key is problematic, as the default Dictionary constructor attempts to use EqualityComparer\<TKey\>.Default. EqualityComparer\<TKey\>.Default, in turn, attempts to use Reflection to instantiate a new type which implements the IEqualityComparer\<TKey\> interface.

This works for reference types (as the reflection+create a new type step is skipped), but for value types it crashes and burns rather quickly once you attempt to use it on the device.

**Workaround**: Manually implement the [IEqualityComparer\<TKey\>](http://docs.go-mono.com/index.aspx?link=T%3aSystem.Collections.Generic.IEqualityComparer%601) interface in a new type and provide an instance of that type to the [Dictionary\<TKey, TValue\>(IEqualityComparer\<TKey\>) constructor](http://docs.go-mono.com/monodoc.ashx?link=C%3aSystem.Collections.Generic.Dictionary%602(System.Collections.Generic.IEqualityComparer%7b%600%7d)).

No Dynamic Code Generation
==========================

Since the iPhone's kernel prevents an application from generating code dynamically Mono on the iPhone does not support any form of dynamic code generation. These include:

-   The System.Reflection.Emit is not available.
-   No support for System.Runtime.Remoting.
-   No support for creating types dynamically (no Type.GetType ("MyType")).
-   Reverse callbacks must be registered with the runtime at compile time.

System.Reflection.Emit
----------------------

The lack of System.Reflection.Emit means that no code that depends on runtime code generation will work. This includes things like:

-   The Regular expression IL generation engine.
-   The Dynamic Language Runtime.
-   Any languages built on top of the Dynamic Language Runtime.
-   Remoting's TransparentProxy or anything else that would cause the runtime to generate code dynamically.

Reverse Callbacks
-----------------

In standard Mono it is possible to pass C# delegate instances to unmanaged code in lieu of a function pointer. The runtime would typically transform those function pointers into a small thunk that allows unmanaged code to call back into managed code.

In Mono these bridges are implemented by the Just-in-Time compiler. When using the ahead-of-time compiler required by the iPhone there are two important limitations at this point:

-   You must flag all of your callback methods with the [MonoPInvokeCallbackAttribute](http://docs.go-mono.com/monodoc.ashx?tlink=20@ecma%3a1%23MonoPInvokeCallbackAttribute%2f).
-   The methods have to be static methods, there is no support for instance methods (this limitation will be removed in the future).

No Remoting
===========

The Remoting stack is not available on MonoTouch.

Runtime Disabled Features
=========================

The following features have been disabled in Mono's iPhone Runtime:

-   Profiler
-   Reflection.Emit
-   Reflection.Emit.Save functionality
-   COM bindings
-   The JIT engine
-   Metadata verifier (since there is no JIT)

Only tested with iPhoneOS 3.0
=============================

We have only tested MonoTouch with iPhoneOS 3.0 and we do not know if it would work with older versions.

