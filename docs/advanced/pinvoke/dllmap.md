---
layout: docpage
navgroup: docs
title: DllMaps
---

Overview
--------

DllMaps are used to map windows library names (.dll) to linux/unix library names (usually .so).

DllMaps are specfied in either the mono configuration file, or in assembly configuration files.

The \<dllmap\> is a directive that can be used directly in the [\<configuration\>]({{ site.github.url }}/old_site/Config "Config") section.

### Children

The \<dllmap\> directive can be further tuned using the \<dllentry\> directive.

The \<dllentry\> directive can be used to map a specific dll/function pair to a different library and also a different function name. It should appear inside a dllmap element with only the dll attribute specified.

The dllentry element takes 3 attributes:

-   dll: This is the target library, where the function can be found.

-   name: This is the name of the fuction as it appears in the metadata: it is the name of the P/Invoke method.

-   target: This is the name of the function to lookup instead of the name specified in the P/Invoke method.

Usage
-----

You use the dllmap directive to map shared libraries referenced by P/Invoke in your assemblies to a different shared library.

This is typically used to map Windows libraries to Unix library names. The dllmap element takes two attributes:

-   dll: This should be the same string used in the DllImport attribute. This can be prefixed with **i:** to specify that name matching should be done in a case-insensitive fashion.
-   target: This should be the name of the library where the function can be found: this name should be suitable for use with the platform native shared library loading routines (dlopen etc.).

Note that later entries will override the entries defined earlier in the file.

In Mono releases after 1.1.18, both the dllmap and dllentry elements allow the following two attributes which make it easy to use a single configuration file and support multiple operating systems and architectures with different mapping requirements:

-   **os**: This is the name of the operating system for which the mapping should be applied. Allowed values are: linux, osx, solaris, freebsd, openbsd, netbsd, windows, aix, hpux.
-   **cpu** This is the name of the architecture for which the mapping should be applied. Allowed values are: x86, x86-64, sparc, ppc, s390, s390x, arm, mips, alpha, hppa, ia64.
-   **wordsize** you can use this to differentiate between 32 and 64 bit systems. The possible values are : 32 and 64.

The attribute value for both attributes can be a comma-separated list of the allowed values. Additionally, the first character may be a '!' to reverse the meaning. An attribute value of "!windows,osx", for example, would mean that the entry is considered on all operating systems, except on Windows and OS X.

No spaces are allowed in any part of the value.

Example
=======

The following example maps references to the \`cygwin1.dll' shared library to the \`libc.so.6' file:

``` xml
    <configuration>
            <dllmap dll="cygwin1.dll" target="libc.so.6"/>
    </configuration>
```

This one maps the following C\# method:

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

Common Problems
---------------

-   [DllNotFoundException]({{ site.github.url }}/old_site/DllNotFoundException "DllNotFoundException")


