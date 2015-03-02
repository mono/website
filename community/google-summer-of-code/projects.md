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


Port CoreCLR Features to Mono
-----------------------------

**Complexity:** Hard

We are interested in allowing Mono to optionally use components of the CoreCLR, like their Garbage Collector or their JIT, or extend Mono to support some of the features that the CoreCLR JIT now has, and Mono lacks (like the recently introduced Microsoft SIMD support).

Your proposal should identify the CoreCLR features you wish to port and explain why it is beneficial to port them.

**Deliverables**: Port a CoreCLR feature of your choice to the Mono runtime.

**Mentors:** Ludovic Henry


Compilers and Tools
===================


CppSharp | Improve C++ inline code / default arguments bindings
---------------------------------------------------------------

**Complexity:** Medium

As part of this task you'll need to extend CppSharp's support for binding C++ functions/methods with default arguments and handling of inlined code.

Both of these features rely on extending the AST (Abstract Syntax Tree) layer in CppSharp to support expressions and statement nodes.

To get an idea of the information provided by Clang's AST you can view it's class reference for [Expression](http://clang.llvm.org/doxygen/classclang_1_1Expr.html) and [Statement](http://clang.llvm.org/doxygen/classclang_1_1Stmt.html). For the default arguments work only a subset of the expression nodes will be needed so it might be a good way to start with those. The rest can be done iteratively as they are needed.

With this information available, the generator can then be extended to take advantage of it.

We already have some work-in-progress support for default arguments but it's done in a flawed way. It does a mix of string parsing and parser hacks to figure out the types of the default arguments. It'd be nice to replace it with something more robust based by making the translation of C++ types to C# at the generator level with support from the information in the AST.

Inlined code is currently problematic because it's not exported in the shared object when compiled, so there's no way to call it from C#. This can even happen when the code is not marked with the inline keyword (the compiler uses some heuristics to classify some functions/methods as inline). This could be improved with the AST information because we could convert a subset of C++ to C#. Code considered as inline is usually not very complicated so we should be able to solve a big chunk of this problem with something relatively simple.

The main tasks would be:

1. Add expressions/statements support to the managed AST layer
2. Improve the C++ parsing layer to bind Clang's AST to the one defined in 1.
3. Extend the binding generator backends to rely on the information from the managed AST and generate better code

Related code:

https://github.com/mono/CppSharp/blob/master/src/CppParser/Parser.cpp#L2559

https://github.com/mono/CppSharp/blob/master/src/AST/Expression.cs

Feel free to get in touch with @tritao if you're interested in this and would like more guidance.

**Mentors:** João Matos


Integrate Reference Sources code into Mono
------------------------------------------

**Complexity:** Medium

While the Mono team has replaced some parts of the Mono class libraries with code from Microsoft, we have found that some of the interesting bits are either tied to the Windows platform, is not portable, or will not work with Mono’s multi-profile facades.

We are interested in students that would like to take on the challenge of porting existing ReferenceSource code to Linux, Mac, Unix, Android, iOS and making it available to both Mono and the CoreFX efforts.

The things that we are interested in porting are tracked in [this Trello board](https://trello.com/b/vRPTMfdz/net-framework-integration-into-mono).

Your proposal should identify the features you wish to port and explain why it is beneficial to port them.

**Deliverables**: Port Reference Sources code of your choice to Mono.

**Mentors:** Ludovic Henry


MonoDevelop / Xamarin Studio IDE
================================


Overhaul MonoDevelop C/C++ addin
--------------------------------

**Complexity:** Medium

The MonoDevelop C/C++ addin has been unmaintained for some time. We would like to move it to a standalone addin so it is more easily maintainable, and improve its core project model to use with MSBuild or CMake.

There are many other aspects of the addin that could be improved, such as:

* improving the code completion using libclang instead of CTags
* adding refactoring support
* improving the GDB debugger addin or switching to LLDB
* making the addin usable on Windows with msvc, clang and/or mingw32 gcc.

Your proposal can include any of that you find interesting and feel can be realistically be completed in addition to the core tasks.

**Deliverables:** a standalone C/C++ addin that uses MSBuild or CMake, along with other improvements of your choosing

**Mentors:** Michael Hutchinson, João Matos


Improve Auto-Documentation System
---------------------------------

**Complexity:** Medium

MonoDevelop has an addin that automatically generates documentation comments based on the member types and  naming conventions. This is very useful, as it gets the boilerplate out the way leaving more time for the developer to add meaningful details.

However, sometimes its assumptions do not hold and the resulting docs  do not make sense. Although this is funny, we would like to fix it.

This is an ideal project for a student interested in linguistics, parsing & understanding natural language.

Your proposal should describe the approaches you intend to use to fix the issue, and a number of cases where the generated docs could be improved.

**Deliverables:** Fix the docs generation for the cases covered in your proposal.

**Mentors:** Mike Krüger


Port NRefactory 5 Actions/Issues to NRefactory 6
------------------------------------------------

**Complexity:** Medium

NRefactory is the library used by MonoDevelop for parsing, analysis and refactoring of C# code. The upcoming NR6 is completely rebased on the Microsoft Roslyn compiler, but many of the analysis features have not yet been ported. Your task would be to port a number of Code Actions and Code Issues of your choice.

**Deliverables**: Port the Code Actions and Code issues listed in your proposal to NR6

**Mentors:** Mike Krüger


MD Class Diagrams
-----------------

**Complexity:** Medium

Addin to generate UML-like class diagrams

Creating an addin for MonoDevelop to generate UML style class diagrams would give developers an easy way to view class structure and relationships.

This project is ideal for a student interested in code documentation and code design.

Your proposal should include what form you think the class diagrams will take, as well as your intended method of implementing the solution.

**Deliverables**: A MonoDevelop addin for generating class diagrams.

**Mentors:** Michael Hutchinson


Adding Version Control Backends
-------------------------------

**Complexity:** Easy

MonoDevelop has support for a plugging new Version Control systems. Currently, Subversion and Git support is implemented.

-- TODO: How to mention Eno's HG addin and the TFS one?

Having additional systems would add diversity to the options developers have when they want IDE support for Version Control.

This is an ideal project for a student interested in version control integration and version control system bindings.

Your proposal should describe the approaches you intend to use to implement the support, your experience with the chosen system(s).

**Deliverables**: Add support for other version control systems in self-contained addins.

**Mentors:** Marius Ungureanu


Syntax highlighting overhaul.
-----------------------------

**Complexity:** Medium

The syntax highlighting in MonoDevelop is done by defining a grammar as xml file to colorize tokens. Some highlightings are extended with hand written code. The highlighting system can be made faster (maybe with an on the fly compiler approach), more extensible (atm it’s difficult to write semantic highlightings) and more scaleable . You will first need to understand how our highlighting files are defined and how the semantic highlighting currently works. After that a new implementation approach needs to be implemented. One of our current drawbacks are that regular expressions could be integrated better - for example span begin/end constructs aren’t atm regular. In fact everything should be based on regular expressions.

**Deliverables**: An extensible syntax highlighting system that reads our xml files or a similar format. It should be scalable even for large files (lazy analysis) and much faster than the current implementation (speed tests included).

**Mentors:** Mike Krüger


Debugger Tasks window support
-----------------------------

**Complexity:** Medium

Since async and await keywords were introduced, tasks have become crucial part of development process. With the Tasks window, a user will be able to easily see current task state (Scheduled, Executing, Waiting or Deadlocked). More information: https://msdn.microsoft.com/en-us/library/dd998369.aspx

**Deliverables:** Tasks window implemented in MonoDevelop.

**Mentors:** David Karlas


Debugging disassembled code could use C# decompiler to generate source
----------------------------------------------------------------------

**Complexity:** Medium

MonoDevelop already has IL->C# logic, and the debugger already supports stepping into methods without code. These two components have to be combined to give a user the option to see C# code instead of IL when stepping into methods without source code.

**Deliverables:** Ability to see C# instead of IL when debugging methods without source code.

**Mentors:** David Karlas, Jeff Stedfast


Mono Runtime
============


Make the SGen garbage collector work independently of Mono
----------------------------------------------------------

**Complexity:** Medium

We've begun work on making Mono's garbage collector, SGen, work independently of Mono, for embedding in other programming language implementations:

  https://github.com/schani/mono/tree/sgen-independence
  https://github.com/schani/simple-sgen-client

It still needs a lot of polishing, documentation, and has to be brought into a state where it can be merged with Mono.  That includes doing benchmarking to make sure it doesn't regress in performance or memory usage.

It also needs a nontrivial project to use it.  Ideally another free language implementation that needs a better GC.

Your proposal should include how you plan to benchmark SGen, and some candidates for other languages to implement it in.

**Deliverables**: SGen garbage collector successfully working with another free language implementation.

**Mentors:** Mark Probst


Show Referring Objects in Debugger
----------------------------------

**Complexity:** Medium

IntelliJ's debugger has a feature "Show Referring Objects", which displays a list of all objects that reference a given object:

  http://blog.jetbrains.com/idea/2014/09/intellij-idea-14-eap-138-1980-1-is-out/

Wouldn't it be nice if the mono debugger had that feature, too?  SGen already has the functionality for internal debugging (it doesn't handle all states the heap can be in, but that can be arranged).

There's two major components to this project--the runtime and debugger support to surface this information, and the UI elements to make that information human-readable.

Your proposal should include which components of the project you wish to work on, and how you plan on implementing your solution.

**Deliverables**: Mono runtime support to show referring objects, and some UI implementation of referring objects information.


**Mentors:** David Karlas, Mark Probst


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

