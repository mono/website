---
layout: docpage
navgroup: community
title: Help
---

 When having a more frequent problem as listed below please click the link to jump to the corresponding section:

1.  Dealing with [compilations issues when building Mono](#issues-compiling-mono-itself) or [bugs]({{ site.github.url }}/community/bugs/) of Mono
2.  Problems when using Mono
    1.  [Can not compile my source](#can-not-compile-my-source)
    2.  [Works under .Net but not on Mono](#works-under-net-but-not-on-mono)

3.  Looking for [commercial support]({{ site.github.url }}/old_site/Support "Support")
4.  [Lost in the website]({{ site.github.url }}/old_site/SiteMap "SiteMap")

If your issue has not been listed please read the [Problems of a different kind](#problems-of-a-different-kind)-Section.

Issues compiling Mono itself
----------------------------

Since Mono is a large piece of software you must strictly follow the [Compiling Mono]({{ site.github.url }}/docs/compiling-mono/)-Article as it contains a good compiling-howto. Especially keep a close look at the requirements of mono and if they are met (e.g. [libgdiplus]({{ site.github.url }}/docs/gui/libgdiplus/)). If the problems still remain please send a mail to the [mono-devel-list](http://lists.ximian.com/mailman/listinfo/mono-devel-list).

Can not compile my source
-------------------------

When compiling your sources please bear in mind that mono provides three [C\#-Compilers]({{ site.github.url }}/docs/about-mono/languages/csharp/), **mcs**, **gmcs** and **smcs**.

-   **mcs** is the standard compiler for code which is targeting the .Net Framework 1.1
-   **gmcs** is Mono's compiler for the the .Net Framework 2.0 and beyond\*

    ``` nowiki
    *
    ```

    gmcs does partly support [C\# 3.0 language features]({{ site.github.url }}/docs/about-mono/languages/csharp/#under-development-features "CSharp Compiler")

-   **smcs**: compiler to target the 2.1 runtime, to build [Moonlight]({{ site.github.url }}/docs/web/moonlight/) applications.

Most help request regarding the compilation of user software can be fixed by adding the proper references because only `mscorlib.dll` and `System.dll` are referenced by default.

To add references to additional assemblies, the `-r:Assembly` switch can be used:

``` bash
gmcs Source.cs -r:System.Drawing.dll -r:System.Windows.Forms.dll
```

More help can be found in the manuals of mcs and gmcs:

``` bash
man gmcs
```

Works under .Net but not on Mono
--------------------------------

Naturally this question is very hard to answer since it relies on the specific application trying to run on Mono. Please read [Guide: Porting Winforms Applications]({{ site.github.url }}/old_site/Guide:_Porting_Winforms_Applications "Guide: Porting Winforms Applications") or [Guide: Porting ASP.NET Applications]({{ site.github.url }}/old_site/Guide:_Porting_ASP.NET_Applications "Guide: Porting ASP.NET Applications") as they provide a good overview on how to run windows applications on Mono.

Problems of a different kind
----------------------------

In general users can always turn to the [Mailing Lists]({{ site.github.url }}/community/help/mailing-lists/) when having problems.

