---
layout: docpage
navgroup: docs
title: Gendarme Roadmap
---

Gendarme has synchronized it's version numbers with Mono since the 2.0 release. All future releases will share the same schedule. See Mono [Roadmap]({{site.github.url}}/old_site/Mono_Project_Roadmap "Mono Project Roadmap") for the exact release dates planned for each version.

Gendarme 2.8 (in progress)
==========================

-   Framework
    -   [in progress] Use System.ComponentModel to configure the rules
        -   allow to build dynamic configuration UI for rules (e.g. property grid)
    -   Complete XML documentation and add some examples
    -   More unit tests and move coverage to existing fixtures
    -   Engines
        -   Finish the incomplete engine from Hack Week 3
-   Rules
    -   More (of course ;-)
    -   More rules that works on the assembly set, i.e. that benefits from the information of all assemblies being analyzed
    -   Better visibility checks (e.g. InternalVisibleTo)
    -   Moonlight/Silverlight specific rules
-   Runners
    -   Add GUI configuration to the wizard runner

Gendarme 3.0+ (in planning)
===========================

-   General
    -   Start building against FX 4.0 and C\# 4
    -   Update to cecil/light (latest version)
-   Rules
    -   More (of course ;-)
-   Runners
    -   a more feature-full GUI runner

Ideas
=====

Ideas without specific timeframes or with a different release strategy.

Mono Build
----------

-   Integrate into Mono build farm and publish the results (just like the API status pages) [bug report](https://bugzilla.novell.com/show_bug.cgi?id=403499)

Runner-related
--------------

-   New GUI-based runners, like
    -   standalone (Gtk\#, Cocoa\#...)
    -   MonoDevelop plugin
    -   VS.NET plugin, see GSoC 2008 work by Ed Ropple

-   Msbuild / Xbuild (like the NAnt runner)

-   Console Runner to show source text [nestor]
    -   Method and Instruction based messages.

<!-- -->

    Source Text (regarding UseStringEmptyRule)
    File: C:\Development\mono\gendarme\console\ConsoleRunner.cs
                           
    005    public void Foo () {
    006        Console.WriteLine ("");
     -------------------------^^
    007    }

That's pretty easy, Instruction has a ServicePoint which points to a Start/End-Line/Column.

-   -   Member based messages.

<!-- -->

    Source Text
    File: C:\Development\mono\gendarme\console\ConsoleRunner.cs
                           
    007 /// </summary>
    008    public void Foo (out bar) {
    ---------------------^^^
    009        bar = null        
    010    }

I've yet to find a way to get a ServicePoint out of a Method declaration so that's pretty hard to display. A solution might be taking the first instruction of a method, but what offset shall we calculate? 1 line above the instruction?

-   -   Type/Module or Assembly based message

<!-- -->

    Source Text
    File: C:\Development\mono\gendarme\console\ConsoleRunner.cs

    007 /// </summary>
    008    public class Foo {        
    009        
    010

What to display if a type/module or assembly rule is hit and no member is specified? The class header? How to identify it (Cecil has no TypeDefinition::ServicePoint property).

-   -   [reference](http://lists.ximian.com/pipermail/mono-devel-list/2006-September/020651.html)

Framework
---------

-   Localization support I18N
    -   [reference 1](http://lists.ximian.com/pipermail/mono-devel-list/2006-September/020651.html)
    -   [reference 2](http://lists.ximian.com/pipermail/mono-devel-list/2006-August/020161.html)
    -   [reference 3](http://lists.ximian.com/pipermail/mono-devel-list/2006-August/020166.html)

-   Statistics
    -   [Keep useful/debugging statistics in gendarme]({{site.github.url}}/StudentProjects#Statistics_.26_Performance_Analysis)

Rules
-----

-   Too many to list here - send your ideas to the [Gendarme Google Group](http://groups.google.com/group/gendarme)


