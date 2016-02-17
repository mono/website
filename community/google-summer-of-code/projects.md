---
title: Projects
redirect_from:
  - /StudentProjects/
  - /GSoC/
---

This is the Mono Project's project ideas page. For general information and rules about participating in
[Google Summer of Code (GSoC)](http://code.google.com/soc/) for the Mono Project, please see our
[overview page](/community/google-summer-of-code/).

This page lists some ideas for Mono GSoC projects that students can apply for. Additionally, we encourage students
to submit their own interesting Mono-related project proposals. In past years, roughly 20% of the accepted
proposals were original ideas from students instead of from our suggestions. You can submit more than one proposal,
so you can submit your own ideas as well as apply for one from this list - but only one can be chosen, of course!

You can use the following links to jump to sections that you're interested in:

**[Other Ideas](#other-ideas)**<br/>
Suggest your own ideas for a project

**[Microsoft .NET and Mono integration](#microsoft-net-and-mono-integration)**<br/>
Work on blending the worlds of open source .NET and Mono projects together

**[Compilers and Tools](#compilers-and-tools)**<br/>
Work on Mono's tools and compilers

**[MonoDevelop / Xamarin Studio IDE](#monodevelop--xamarin-studio-ide)**<br/>
Help developers build applications by improving the cross-platform MonoDevelop / Xamarin Studio IDE

**[Mono Runtime](#mono-runtime)**<br/>
Improve the core Mono runtime and JIT

**[GTK# and Bindings](#gtk-and-bindings)**<br/>
GTK# Core, Bindings and Applications

**[Contacting the Mono Team](#contacting-the-mono-team)**<br/>
How to get in touch with us and ask questions

Other Ideas
===========

If a project is not listed here, but you think you have a great idea, feel free to
[contact the Mono team, mentors and org admins](#contacting-the-mono-team) to discuss or suggest your own project ideas.

Over the past years we have picked projects that were not listed here because they were great ideas, and we had students
that were passionate about those projects. In the end, most of these projects were a success.

Do not be afraid to pick up a project that would be interesting and also help the Mono universe.

You can find some additional ideas on the [MonkeySquare ideas page](http://monkeysquare.org/gsoc/projects), and on the
[Gnome ideas page](https://live.gnome.org/SummerOfCode2013/Ideas) (Mono-based projects in Gnome: Banshee, Blam, Tasque,
Tomboy, GBrainy, Mistelix, F-Spot, ChronoJump, SparkleShare, LongoMatch).

Microsoft .NET and Mono Integration
===================================

Microsoft open sourced large chunks of code this year:

* ReferenceSource: the source code for the class libraries of .NET as it ships on Windows
* CoreFX: a fresh take on the distribution of the class libraries for a new, slimmer, smaller runtime
* CoreCLR: their C/C++ based runtime, JIT, GC for running on Mac, Linux and Windows
* Roslyn: Microsoft's C# and VB compiler as a service
* CodeContracts: the tools needed to instrument your code

We are tracking various ideas in the [.NET Integration in Mono](https://trello.com/b/vRPTMfdz/net-framework-integration-into-mono) trello board.

Import reference source System.Web* assemblies
----------------------------------------------

**Complexity:** Medium

Mono has its own implementation of the System.Web assemblies. Microsoft has open-sourced their Reference Source implementation. We would like to replace Mono's existing implementation with Reference Source in order to increase compatibility, and fix bugs and missing features..

**Deliverables**: integrate the Reference Source System.Web.* assemblies into Mono, passing Mono test suite on Windows and Unix.

**Mentors:** Marek Safar

Compilers and Tools
===================

Port ilasm to use IKVM.Reflection instead of PEAPI.
---------------------------------------------------

**Complexity:** Medium

Port ilasm, the IL assembler, to use IKVM.Reflection as its code emission backend instead of PEAPI. This will require extending IKVM.Reflection to support the advanced metadata that ilasm supports.

**Deliverables:** ilasm emitting code using IKVM.Reflection instead of PEAPI, and passing all tests.

**Mentors:** Marek Safar

A ccache-like tool for managed languages
----------------------------------------

**Complexity:** Medium

C-based languages (C/C++/Objective-C) have ccache to cache results of compilations to make rebuilds faster.

It would be nice to have something similar for C#/VB/F#.

This can be used as a starting point to identify the set of inputs for C#/VB:
https://github.com/dotnet/roslyn/blob/master/docs/compilers/Deterministic%20Inputs.md

ccache (for reference): https://github.com/jrosdahl/ccache

**Deliverables**: a functional tool for C# that works on linux + mac, with a test suite, and is able to cache/lookup everything during a (re)build of the mono BCL.

**Mentors:** Rolf Bjarne Kvinge

MonoDevelop / Xamarin Studio IDE
================================

Syntax Highlighting Overhaul
----------------------------

**Complexity:** Medium

The syntax highlighting in MonoDevelop is done by defining a grammar as xml file to colorize tokens. Some highlightings are extended with hand written code. The highlighting system can be made faster (maybe with an on the fly compiler approach), more extensible (atm it’s difficult to write semantic highlightings) and more scaleable . You will first need to understand how our highlighting files are defined and how the semantic highlighting currently works. After that a new implementation approach needs to be implemented. One of our current drawbacks are that regular expressions could be integrated better - for example span begin/end constructs aren’t atm regular. In fact everything should be based on regular expressions.

**Deliverables**: An extensible syntax highlighting system that reads our xml files or a similar format. It should be scalable even for large files (lazy analysis) and much faster than the current implementation (speed tests included).

**Mentors:** Mike Krüger

Improve Auto-Documentation System
---------------------------------

**Complexity:** Medium

MonoDevelop has an addin that automatically generates documentation comments based on the member types and  naming conventions. This is very useful, as it gets the boilerplate out the way leaving more time for the developer to add meaningful details.

However, sometimes its assumptions do not hold and the resulting docs  do not make sense. Although this is funny, we would like to fix it.

This is an ideal project for a student interested in linguistics, parsing & understanding natural language.

Your proposal should describe the approaches you intend to use to fix the issue, and a number of cases where the generated docs could be improved.

**Deliverables:** Fix the docs generation for the cases covered in your proposal.

**Mentors:** Mike Krüger

Overhaul MonoDevelop C/C++ addin
--------------------------------

**Complexity:** Medium

The [MonoDevelop C/C++ addin](https://github.com/mhutch/cbinding) was substantially updated as part of last year's Summer of Code. However, there are still many things that could be done to improve it!

* improving the code completion and adding a test suite
* adding refactoring support
* improving the GDB debugger addin or switching to LLDB
* making the addin usable on Windows with msvc, clang and/or mingw32 gcc.

Your proposal can include any of that you find interesting and feel can be realistically be completed in addition to the core tasks.

**Deliverables:** a set of improvements to the C/C++ addin of your choosing, to be specified in your proposal

**Mentors:** mhutch

Mono Runtime
============

Implement a LLDB plugin that can understands the mono runtime
-------------------------------------------------------------

**Complexity:** Hard

LLDB support plugins and we should write one that exposes as much as possible of the runtime. A few ideas:

* object layout, introspection and heap walking
* unwinding and symbolifying managed methods
* lookup line information for managed methods
* pretty print all runtime structs
* threadpool introspection?

**Deliverables:** One or more of the above bullet points.

**Mentors:** João Matos, Alexis Christoforides

Port mono to WinRT
------------------

**Complexity:** Hard

WinRT is the runtime sandbox that Windows Store apps run in.

Right now Mono doesn't run on it.

The goal of this project is to get the runtime to compile for WinRT and get
a simple Hello World app working.

**Deliverables:** A Hello World app running in the WinRT sandbox.

**Mentors:** João Matos, Alexis Christoforides

Make FileStream async operation really async
--------------------------------------------

**Complexity:** Easy

We could use our already existing infrastructure used for Socket, to make FileStream BeginRead, BegrinWrite, etc. methods really async.
They are right now simple their synchronous method counter part called enqueued on the ThreadPool. For example, `FileStream.BeginRead` is implemented as `Read.BeginInvoke (...)`

**Deliverables**: Properly async FileStream, passing Mono tests. 

**Mentors:** Ludovic Henry

JIT optimizations
-----------------

**Complexity:** Hard

There are a few JIT optimizations that we could profile from:

* type propagation. Right now we perform zero type propagation in the JIT, leading to a lot of missed opportunities.

* delayed/iterated inlining & casting. Allow those to be performed after method-to-ir. This would allow us to do a TON of VERY profitable strength reduction.

**Deliverables**: Implementation of a JIT optimization from the above list, or another of your suggestion. Must pass all unit tests.

**Mentors:** Rodrigo Kumpera

GTK# and Bindings
==================

**We don't have any ideas in this area right now, but feel free to propose your own!**

Contacting the Mono Team
========================

If you have questions or suggestions that you want to make in real-time and talk to a member of the team, please join us
on IRC on the server "irc.gnome.org" in channel "#monosoc", "#monodev" or the "#mono" channel. Various mentors and
students from past years are usually there and can answer some quick questions about the program and about Mono.

The mailing lists are a very important communication channel, students should use them to get more information and
feedback about ideas and proposals. Community engagement is essential for a successful summer of code, so get involved!

For any questions you may have about the program itself and to talk to the Mono GSoC admin, you can use
[soc@xamarin.com](mailto:soc@xamarin.com).

Mailing Lists
-------------

[http://lists.ximian.com/mailman/listinfo/mono-devel-list](http://lists.ximian.com/mailman/listinfo/mono-devel-list)
A mailing list dedicated to discussions about developing Mono itself, such as development of the runtime, class libraries, and related Mono projects.

[http://lists.ximian.com/mailman/listinfo/monodevelop-devel-list](http://lists.ximian.com/mailman/listinfo/monodevelop-devel-list)
Discussion on the development/implementation of MonoDevelop.

A complete breakdown of all Mono mailing lists is available at [Mailing Lists](/community/help/mailing-lists/).
