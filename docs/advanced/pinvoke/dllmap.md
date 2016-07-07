---
title: DllMaps
redirect_from:
  - /Config_DllMap/
  - /DllMap/
---

Overview
--------

DllMaps are used to map windows library names (.dll) to linux/unix library names (usually .so).

DllMaps are specfied in either the mono configuration file, or in assembly configuration files.

The `<dllmap>` is a directive that can be used directly in the `<configuration>` section.

### Children

The `<dllmap>` directive can be further tuned using the `<dllentry>` directive.

The `<dllentry>` directive can be used to map a specific dll/function pair to a different library and also a different function name. It should appear inside a `<dllmap>` element with only the dll attribute specified.

The `<dllentry>` element takes 3 attributes:

-   `dll`: This is the target library, where the function can be found.

-   `name`: This is the name of the function as it appears in the metadata: it is the name of the P/Invoke method.

-   `target`: This is the name of the function to lookup instead of the name specified in the P/Invoke method.   As of Mono 4.8.0, this element is optional, and if not specified, it will default to the same value as `name`.    In previous versions, you must specify the value.

Usage
-----

You use the `<dllmap>` directive to map shared libraries referenced by P/Invoke in your assemblies to a different shared library.

This is typically used to map Windows libraries to Unix library names. The `<dllmap>` element takes two attributes:

-   `dll`: This should be the same string used in the DllImport attribute. This can be prefixed with **i:** to specify that name matching should be done in a case-insensitive fashion.
-   `target`: This should be the name of the library where the function can be found: this name should be suitable for use with the platform native shared library loading routines (`dlopen` etc.).

Note that later entries will override the entries defined earlier in the file.

Both the `<dllmap>` and `<dllentry>` elements allow the following attributes which make it easy to use a single configuration file and support multiple operating systems and architectures with different mapping requirements:

-   `os`: This is the name of the operating system for which the mapping should be applied. Allowed values are: linux, osx, solaris, freebsd, openbsd, netbsd, windows, aix, hpux.
-   `cpu` This is the name of the architecture for which the mapping should be applied. Allowed values are: x86, x86-64, sparc, ppc, s390, s390x, arm, armv8 (AArch64), mips, alpha, hppa, ia64.
-   `wordsize` you can use this to differentiate between 32 and 64 bit systems. The possible values are : 32 and 64.

The attribute value for both attributes can be a comma-separated list of the allowed values. Additionally, the first character may be a '!' to reverse the meaning. An attribute value of `!windows,osx`, for example, would mean that the entry is considered on all operating systems, except on Windows and OS X.

No spaces are allowed in any part of the value.

Example
=======

The following example maps references to the `cygwin1.dll` shared library to the `libc.so.6` file:

``` xml
<configuration>
  <dllmap dll="cygwin1.dll" target="libc.so.6"/>
</configuration>
```

This one maps the following C# method:

``` csharp
[DllImport ("libc")]
static extern void somefunction ();
```

to a different function in libdifferent.so, but to the same function in the library **libanother.so** when running under the Solaris and FreeBSD operating systems.

``` xml
<configuration>
  <dllmap dll="libc">
    <dllentry dll="libdifferent.so" name="somefunction" target="differentfunction" />
    <dllentry os="solaris,freebsd" dll="libanother.so" name="somefunction" target="differentfunction" />
  </dllmap>
</configuration>
```

Starting with Mono 4.8.0, you can also specify a different dll target on a per-`dllentry` basis.  Imagine that on Windows you have a library `SolarSystem.dll`, but on Unix the same functionality is available in two libraries `libearth.so` and `libmars.so`, so you can write:

```xml
<configuration>
  <dllmap os="!windows" dll="SolarSystem">
    <dllentry dll="libearth.so" name="get_Animals" />
    <dllentry dll="libmars.so" nane="get_Plants" />
  </dllmap>
</configuration>
```

Common Problems
---------------

-   [DllNotFoundException](/docs/advanced/pinvoke/dllnotfoundexception/)
