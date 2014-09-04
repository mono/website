---
title: AOT
redirect_from:
  - /AOT/
---

Ahead of Time Compilation or AOT is a feature of the Mono runtime code generator.

The Mono code generator can operate in two modes: Just-in-Time compilation or JIT, and Ahead-of-Time compilation or AOT.

AOT compilation works in two stages. The first stage consists of precompiling the assemblies. As of Mono 1.2, this is a manual process that individual deployments must do. The second stage is automatic, the Mono runtime will automatically load any precompiled code that you have generated.

Generating AOT code from an assembly is very simple, just invoke the Mono runtime with the --aot flag, like this:

``` bash
mono --aot program.exe
```

This will generate a file called "program.exe.so", which contains the native code that was precompiled by Mono for most of the IL methods. The --aot flag by default will limit itself to IL methods which will give you the most benefits, but will not compile absolutely everything you need. See below for more details.

Although the JIT mode is very fast, and the default optimizations in Mono have been tuned to provide a good balance between optimizations and JIT speed, AOT compilation provides a few extra benefits:

-   Reduced startup time.
-   Increased memory sharing.
-   Potential better performance.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#full-aot">1 Full AOT</a>
<ul>
<li><a href="#known-limitations">1.1 Known Limitations</a>
<ul>
<li><a href="#limitation-platform">1.1.1 Limitation: Platform</a></li>
<li><a href="#limitation-generic-interface-instantiation">1.1.2 Limitation: Generic Interface Instantiation</a></li>
<li><a href="#generic-valuetype-sharing">1.1.3 Generic ValueType Sharing</a></li>
</ul></li>
</ul></li>
<li><a href="#supported-platforms">2 Supported Platforms</a></li>
<li><a href="#reduced-startup-time">3 Reduced Startup Time</a></li>
<li><a href="#increased-memory-sharing">4 Increased Memory Sharing</a></li>
<li><a href="#potential-better-performance">5 Potential Better Performance</a></li>
<li><a href="#limitations">6 Limitations</a></li>
<li><a href="#discussion">7 Discussion</a></li>
<li><a href="#aoting-all-the-system-libraries">8 AOTing all the system libraries</a></li>
</ul></td>
</tr>
</tbody>
</table>

Full AOT
--------

In some operating system configurations (mostly embedded systems) the operating system services for generating code dynamically are not available, this prevents Mono's JIT from working. In those systems, you can use --aot=full to ensure that Mono precompiles everything, and then use the option --full-aot to ensure that Mono never uses the JIT engine.

``` bash
# Do a full AOT:
$ mono --aot=full mscorlib.dll
$ mono --aot=full sample.exe
 
# Run, but request that Mono never tries to JIT:
$ mono --full-aot sample.exe
```

Full AOT is a fairly straightforward process except in the case of generic instantiations. In those cases Mono must perform a static analysis of the code and determine all of the possible instantiations of a type and generate the code required. For example if a program uses a List\<int\> and a List\<double\> mono will detect this and generate all of the referenced methods for both data types.

### Known Limitations

If you depend on the full AOT option because of OS limitations, you should make sure to test your software using the "--full-aot" option to ensure that no dynamic code is used by your application.

 This testing is required because some of Mono's class libraries generate code dynamically (for example LINQ's Expression.Compile() method for expression ASTs) or load code at runtime (for example the default operation mode for the XML serializer, see MONO_XML_SERIALIZER_THS on the manual page to configure this).

#### Limitation: Platform

Full AOT currently only works on AMD64/ARM and only with git HEAD, not 2.0/2.2/ 2.4.

#### Limitation: Generic Interface Instantiation

While generics are supported, there are some rare cases that are not supported.

The following class of interface dispatch is not supported in FullAOT mode:

``` csharp
interface IFoo<T> {
...
    void SomeMethod ();
}
```

Since Mono has no way of determining from the static analysis what method will implement the interface IFoo\<int\>.SomeMethod this particular pattern is not supported.

#### Generic ValueType Sharing

Xamarin's version of AOT compilation extends the AOT compiler to support generic code generation for value types. This can be either an optimization (generate fewer versions of Foo\<X\> where X is a value type) to filling holes where previously you would get a runtime failure due to a Foo\<X\> where X is value type from not being implemented.

This feature is currently only available to iOS users of Xamarin.

Supported Platforms
-------------------

AOT is only available in a few platforms:

-   [Mono:X86](/docs/about-mono/supported-platforms/x86/)
-   [x86-64](/docs/about-mono/supported-platforms/amd64/)
-   [Mono:ARM](/docs/about-mono/supported-platforms/arm/).

Reduced Startup Time
--------------------

At startup, the Mono runtime will probe if an AOT version of the assembly lives side-by-side, and if so, instead of JITing the methods in the given assembly, it will load the native code from the side-by-side file.

This is particularly useful for large programs that might need to execute a lot of code before they are operational (large class libraries for example).

Increased Memory Sharing
------------------------

The code generated by AOT compilation is position-independent code (PIC). Mono will load this code using the "mmap" kernel call, and all of the code will actually be shared across multiple Mono instances in the system.

Not only will the JIT not waste time or memory in generating the code, but the code that is executed is the same copy of code in memory that is shared across multiple processes in a system.

Potential Better Performance
----------------------------

When you pre-compile an assembly with the --aot flag to Mono, you also can turn on extra optimizations that are not part of the default optimizations that Mono applies while JITing. JITing has to balance startup-time vs performance of the generated code. This means that the most advanced optimization that require a more thorough code analysis and which run slower are not enabled by default.

With AOT, you can turn on and off specific optimizations that you want to apply to your code, optimizations that you would not use with the JIT engine as they would slow down your program startup too much.

One common use is:

``` bash
mono --aot -O=all program.exe
```

The "all" flag to the "-O" command line option will turn on all optimizations, but we suggest that you actually profile and test whether some particular optimizations improve or decrease the performance of your code, as not all optimizations work equally well with all different code patterns.

Limitations
-----------

Code generated by the AOT compilation step is position independent, unlike the JIT code which is tuned for the actual execution of the process. This means that certain programs might run slower as the generated code is more general than the specific code that the JIT can produce.

As of Mono 2.0, AOT compilation is only supported for non-generic methods. support for generics is currently under development.

If you want to disable the use of the AOT generated code for a particular program execution, use the -O=-aot command line flag to the runtime.

See the discussion on [OptimizingAOT](/archived/optimizingaot "OptimizingAOT")

Discussion
----------

Documentation on the Mono AOT implementation is found in the [Mono:Runtime:Documentation:AOT](/docs/advanced/runtime/docs/aot/) page.

AOTing all the system libraries
-------------------------------

You can use the following commands to AOT all of the libraries on your system:

``` bash
mono --aot /usr/lib/mono/1.0/mscorlib.dll
for i in /usr/lib/mono/gac/*/*/*.dll; do mono --aot $i; done
```
