---
title: Help
redirect_from:
  - /Need_Help/
---

 When having a more frequent problem as listed below please click the link to jump to the corresponding section:

1.  Dealing with [compilations issues when building Mono](#issues-compiling-mono-itself) or [bugs](/community/bugs/) of Mono
2.  Problems when using Mono
    1.  [Can not compile my source](#can-not-compile-my-source)
    2.  [Works under .Net but not on Mono](#works-under-net-but-not-on-mono)

Issues compiling Mono itself
----------------------------

Since Mono is a large piece of software you must strictly follow the [Compiling Mono](/docs/compiling-mono/)-Article as it contains a good compiling-howto. Especially keep a close look at the requirements of mono and if they are met (e.g. [libgdiplus](/docs/gui/libgdiplus/)).

Can not compile my source
-------------------------

When compiling your sources please bear in mind that Mono provides a [C#-Compiler](/docs/about-mono/languages/csharp/), **mcs**.<br/>
Most help request regarding the compilation of user software can be fixed by adding the proper references because only `mscorlib.dll` and `System.dll` are referenced by default.

To add references to additional assemblies, the `-r:Assembly` switch can be used:

``` bash
mcs Source.cs -r:System.Drawing.dll -r:System.Windows.Forms.dll
```

More help can be found in the manuals of mcs:

``` bash
man mcs
```

Works under .Net but not on Mono
--------------------------------

Naturally this question is very hard to answer since it relies on the specific application trying to run on Mono. Please read [Guide: Porting Winforms Applications](/docs/gui/winforms/porting-winforms-applications/) or [Guide: Porting ASP.NET Applications](/docs/web/porting-aspnet-applications/) as they provide a good overview on how to run windows applications on Mono.
