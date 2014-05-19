---
layout: obsolete
title: "Unsupported Advanced Mono Compile Options"
permalink: /old_site/Unsupported_Advanced_Mono_Compile_Options/
redirect_from:
  - /Unsupported_Advanced_Mono_Compile_Options/
---

Unsupported Advanced Mono Compile Options
=========================================

Most users will use the default configuration, and the Mono team will provide help and support for the standard configuration. Any use of extra configuration options is likely going to have little or no support from the team.

The documentation in the following sections merely documents these features as they have been known to be useful to people.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#minimal-mono">1 Minimal Mono</a></li>
<li><a href="#alternative-stack-during-overflows">2 Alternative Stack during Overflows</a></li>
<li><a href="#static-vs-dynamic-mono">3 Static vs Dynamic Mono</a></li>
<li><a href="#thread-local-storage-specification">4 Thread Local Storage Specification</a></li>
<li><a href="#controlling-the-profile-to-build">5 Controlling the Profile to Build</a></li>
<li><a href="#individual-prefix-configuation">6 Individual Prefix Configuation</a></li>
</ul></td>
</tr>
</tbody>
</table>

### Minimal Mono

It is possible to build a Mono virtual machine that has fewer features than a full installation. This allows Mono to be shipped in 2-3 megabytes of disk space and consume less memory, but it will also limit the funcionality available. To do this use the --enable-minimal parameter, this parameter takes a comma separated list of features that you want removed, like this:

``` bash
./configure --enable-minimal=aot
```

That would remove the [ahead of time compilation]({{site.github.url}}/old_site/Mono:Runtime#ahead-of-time-compilation "Mono:Runtime") feature.

The following features can be removed:

-   [aot]({{site.github.url}}/old_site/Mono:Runtime#ahead-of-time-compilation "Mono:Runtime") ahead of time compilation.
-   profiler: profiler support.
-   decimal: support for the System.Decimal (decimal type) in Mono.
-   [pinvoke]({{site.github.url}}/old_site/Interop_with_Native_Libraries "Interop with Native Libraries"): Platform Invoke services to call into native libraries
-   debug: debugging support (line number information, debuggability of applications.
-   reflection\_emit: generating code with the System.Reflection.Emit API
-   logging: a handful of routines used for debugging the JIT.
-   [com]({{site.github.url}}/old_site/COM_Interop "COM Interop"): Support for COM Interop.
-   ssa: the SSA-family of optimizations.
-   generics: support for the 2.0 generics in the runtime.

### Alternative Stack during Overflows

By default Mono will detect whether your operating system/architecture supports an alternate stack when a stack overflow happens. If supported, Mono will run a small piece of code that will trigger a StackOverflowException in your program instead of aborting your application with a Segmentation Fault.

You can overwrite the auto detection by using the --enable-sigaltstack flag.

We only support this feature if it is auto-detected, not if you manually forced it.

### Static vs Dynamic Mono

The Mono compilation will produce a binary to run your ECMA CLI applications (mono) and a library that can be used to embed the Mono runtime in other applications (libmono).

Compilers generate slower code when they produce shared libraries, so by default the Mono build system will create the "mono" binary with a static copy of the libraries and will not use its own libmono shared library.

You can change this feature by using the --with-static\_mono option, but we discourage this practice as static Mono is faster and static Mono is also the most commonly tested configuration.

### Thread Local Storage Specification

Use the --with-tls option to specify the kind of thread local storage that Mono should use. The possible values are \_\_thread (which uses the compiler supported attribute for TLS) or pthread (which uses the POSIX API for storing thread-local data).

This configuration option is automatically detectd at configure time, and we only support this option if its auto-detected, if you force this option, you are on your own.

### Controlling the Profile to Build

By default, Mono will build 1.0 and 2.0 libraries and compilers. You can turn off the compilation of 2.0 features by using the flag:

``` bash
--with-profile2=no
```

Turning 2.0 off is not a supported configuration.

You can also enable compilation of 4.0 features by using the flag:

``` bash
--with-profile4=yes
```

You can also disable compilation of Moonlight ("2.1") features by using the flag:

``` bash
--with-moonlight=no
```

### Individual Prefix Configuation

Mono also allows different components to be installed into other places other than the prefix-rooted installation. These are not supported by the Mono team, but might be useful:

You can further control various data files by using one or more of the following options:

``` bash
  --bindir=DIR           user executables [EPREFIX/bin]
  --sbindir=DIR          system admin executables [EPREFIX/sbin]
  --libexecdir=DIR       program executables [EPREFIX/libexec]
  --datadir=DIR          read-only architecture-independent data [PREFIX/share]
  --sysconfdir=DIR       read-only single-machine data [PREFIX/etc]
  --sharedstatedir=DIR   modifiable architecture-independent data [PREFIX/com]
  --localstatedir=DIR    modifiable single-machine data [PREFIX/var]
  --libdir=DIR           object code libraries [EPREFIX/lib]
  --includedir=DIR       C header files [PREFIX/include]
  --oldincludedir=DIR    C header files for non-gcc [/usr/include]
  --infodir=DIR          info documentation [PREFIX/info]
  --mandir=DIR           man documentation [PREFIX/man]
```

