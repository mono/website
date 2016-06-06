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

**[MonoDevelop / Xamarin Studio IDE](#monodevelop--xamarin-studio-ide)**<br/>
Help developers build applications by improving the cross-platform MonoDevelop / Xamarin Studio IDE

* [Unit tests code coverage visualised inside MonoDevelop editor](#unit-tests-code-coverage-visualised-inside-monodevelop-editor)
* [Visual Basic with Roslyn on Windows](#visual-basic-with-roslyn-on-windows)
* [Debugging .fsx scripts in FSI](#debugging-fsx-scripts-in-fsi)
* [Reuse MonoDevelop Roslyn compilation to perform compile](#reuse-monodevelop-roslyn-compilation-to-perform-compile)
* [Support for Symbol Servers](#support-for-symbol-servers)
* [Lambda support in debugger expression evaluator](#lambda-support-in-debugger-expression-evaluator)
* [Debugging disassembled code could use C# decompiler to generate source](#debugging-disassembled-code-could-use-c-decompiler-to-generate-source)
* [Syntax Highlighting Overhaul](#syntax-highlighting-overhaul)
* [Improve Auto-Documentation System](#improve-auto-documentation-system)
* [Overhaul MonoDevelop C/C++ addin](#overhaul-monodevelop-cc-addin)

**[Compilers and Tools](#compilers-and-tools)**<br/>
Work on Mono's tools and compilers

* [Port ilasm to use IKVM.Reflection instead of PEAPI.](#port-ilasm-to-use-ikvmreflection-instead-of-peapi)
* [A ccache-like tool for managed languages](#a-ccache-like-tool-for-managed-languages)

**[Mono Runtime](#mono-runtime)**<br/>
Improve the core Mono runtime and JIT

* [Implement a LLDB plugin that can understands the mono runtime](#implement-a-lldb-plugin-that-can-understands-the-mono-runtime)
* [Port mono to WinRT](#port-mono-to-winrt)
* [Make FileStream async operation really async](#make-filestream-async-operation-really-async)
* [JIT optimizations](#jit-optimizations)

**[Microsoft .NET and Mono integration](#microsoft-net-and-mono-integration)**<br/>
Work on blending the worlds of open source .NET and Mono projects together

* [Import reference source System.Web* assemblies](#import-reference-source-systemweb-assemblies)

**[GTK# and Bindings](#gtk-and-bindings)**<br/>
GTK# Core, Bindings and Applications

* [Urho3d Game Engine Improvements](#urho3d-game-engine-improvements)
* [CppSharp / Continue Mono/.NET bindings for Qt](#cppsharp--continue-mononet-bindings-for-qt)

**[Other Ideas](#other-ideas)**<br/>
Suggest your own ideas for a project

**[Contacting the Mono Team](#contacting-the-mono-team)**<br/>
How to get in touch with us and ask questions

## MonoDevelop / Xamarin Studio IDE

### Unit tests code coverage visualised inside MonoDevelop editor

**Complexity:** Easy

The Mono runtime supports outputting an xml file containing information about which lines were executed. This could be used to collect code coverage information when running unit tests, which could be visualized in the text editor.

This project would involve adding support to the MonoDevelop.UnitTesting AddIn to collect code coverage information when running tests, and to display that information visually in the editor.

**Deliverables**: Add support to MonoDevelop to collect code coverage information when running tests, and display it visually in the text editor.

**Mentors:** Iain Holmes

### Visual Basic with Roslyn on Windows

**Complexity:** Medium

Overhaul the VB language binding addin or rewrite it from scratch and
make use of the full VB .NET support in Roslyn (without mono-basic). The CSharpBinding addin is a good starting point and reference.

Main goals:

* Compatibility with Visual Studio projects
* Panels for editing all project options
* Updated project templates
* Integration into the MonoDevelop type system
* Code completion ported from Roslyn EditorFeatures
* Other standard IDE language integration (code folding, document outline, symbol tooltips, Find References, etc)

Optional:

* Mac/Linux support (depends on MSBuild and Roslyn compilers being included in Mono)
* VB.NET source analysis
* VB.NET refactorings ported from Roslyn EditorFeatures
* Semantic highlighting

**Deliverables**: VB.NET support in MonoDevelop with updated project options and templates, and Roslyn-based code completion

**Mentors:** Vsevolod Kukol

### Debugging .fsx scripts in FSI

**Complexity:** Hard

It would be nice to be able to set breakpoints in F# scripts and debug them when running in F# interactive (FSI) inside MonoDevelop.

To implement this, we would need to:

1. Attach the debugger to the FSI process that is running inside MonoDevelop. The Mono runtime has limited and untested support for attaching the debugger to a running process that was launched in "debuggable" mode, so perhaps we could attach and detach it. Alternatively, perhaps we run FSI in the debugger and simply leave it always attached.

2. Implement a debugging frontend that only debugs code in the dynamic assembly generated by FSI, while ignoring code in the FSI process itself.

3. Modify the F# add-in for MonoDevelop to have a "Debug in F# interactive" command when the active document is an `.fsx` file.

**Deliverables**: Working "Debug in F# interactive" command in MonoDevelop.

**Mentors:** Alex Corrado

### Reuse MonoDevelop Roslyn compilation to perform compile

**Complexity:** Medium

MonoDevelop now uses the Roslyn compiler for its type system, and keeps fully updated Roslyn compilations in memory. It should be possible when building for the build engine to connect back the the IDE and use the existing Roslyn compilations for code generation, in the same way that Visual Studio does. This will greatly improve compile time during development.

This will require implementing the MSBuild ICscHostObject interface in the MonoDevelop build system and having the Csc build task delegate the code generation to the in-process compiler.

**Deliverables**: Fully implement ICscHostObject in the MonoDevelop build system, including tests.

**Mentors:** David Karlas

### Support for Symbol Servers

**Complexity:** Hard

Support for downloading symbol packages from symbol servers on demand and using them in the debugger. This is primarily useful for NuGet.

Making this work will require implementing support for handling debugger symbols on the client (IDE) side instead of the debugger agent.

**Deliverables**: Support for downloading symbol packages and using them when debugging apps.

**Mentors:** David Karlas

### Lambda support in debugger expression evaluator

**Complexity:** Hard

Support for lambdas in the MonoDevelop debugger's expression evaluator, used in the Immediate pad. This will require compiling the lambdas locally and uploading them to the debuggee.

Roslyn has [support for compiling expressions](https://github.com/dotnet/roslyn/tree/master/src/ExpressionEvaluator) that could be used as a basis for this.

**Deliverables**: Support for lambdas in the Immediate pad.

**Mentors:** David Karlas

### Debugging disassembled code could use C# decompiler to generate source

**Complexity:** Medium

MonoDevelop already has IL->C# logic, and the debugger already supports stepping into methods without code. These two components have to be combined to give a user the option to see C# code instead of IL when stepping into methods without source code.

**Deliverables:** Ability to see C# instead of IL when debugging methods without source code.

**Mentors:** David Karlas, Jeff Stedfast

### Syntax Highlighting Overhaul

**Complexity:** Medium

The syntax highlighting in MonoDevelop is done by defining a grammar as xml file to colorize tokens. Some highlightings are extended with hand written code. The highlighting system can be made faster (maybe with an on the fly compiler approach), more extensible (atm it’s difficult to write semantic highlightings) and more scaleable . You will first need to understand how our highlighting files are defined and how the semantic highlighting currently works. After that a new implementation approach needs to be implemented. One of our current drawbacks are that regular expressions could be integrated better - for example span begin/end constructs aren’t atm regular. In fact everything should be based on regular expressions.

**Deliverables**: An extensible syntax highlighting system that reads our xml files or a similar format. It should be scalable even for large files (lazy analysis) and much faster than the current implementation (speed tests included).

**Mentors:** Mike Krüger

### Improve Auto-Documentation System

**Complexity:** Medium

MonoDevelop has an addin that automatically generates documentation comments based on the member types and  naming conventions. This is very useful, as it gets the boilerplate out the way leaving more time for the developer to add meaningful details.

However, sometimes its assumptions do not hold and the resulting docs  do not make sense. Although this is funny, we would like to fix it.

This is an ideal project for a student interested in linguistics, parsing & understanding natural language.

Your proposal should describe the approaches you intend to use to fix the issue, and a number of cases where the generated docs could be improved.

**Deliverables:** Fix the docs generation for the cases covered in your proposal.

**Mentors:** Mike Krüger

### Overhaul MonoDevelop C/C++ addin

**Complexity:** Medium

The [MonoDevelop C/C++ addin](https://github.com/mhutch/cbinding) was substantially updated as part of last year's Summer of Code. However, there are still many things that could be done to improve it!

* improving the code completion and adding a test suite
* adding refactoring support
* improving the GDB debugger addin or switching to LLDB
* making the addin usable on Windows with msvc, clang and/or mingw32 gcc.

Your proposal can include any of that you find interesting and feel can be realistically be completed in addition to the core tasks.

**Deliverables:** a set of improvements to the C/C++ addin of your choosing, to be specified in your proposal

**Mentors:** mhutch

## Compilers and Tools

### Port ilasm to use IKVM.Reflection instead of PEAPI

**Complexity:** Medium

Port ilasm, the IL assembler, to use IKVM.Reflection as its code emission backend instead of PEAPI. This will require extending IKVM.Reflection to support the advanced metadata that ilasm supports.

**Deliverables:** ilasm emitting code using IKVM.Reflection instead of PEAPI, and passing all tests.

**Mentors:** Marek Safar

### A ccache-like tool for managed languages

**Complexity:** Medium

C-based languages (C/C++/Objective-C) have ccache to cache results of compilations to make rebuilds faster.

It would be nice to have something similar for C#/VB/F#.

This can be used as a starting point to identify the set of inputs for C#/VB:
<https://github.com/dotnet/roslyn/blob/master/docs/compilers/Deterministic%20Inputs.md>

ccache (for reference): <https://github.com/jrosdahl/ccache>

**Deliverables**: a functional tool for C# that works on linux + mac, with a test suite, and is able to cache/lookup everything during a (re)build of the mono BCL.

**Mentors:** Rolf Bjarne Kvinge

## Mono Runtime

### Implement a LLDB plugin that can understands the mono runtime

**Complexity:** Hard

LLDB support plugins and we should write one that exposes as much as possible of the runtime. A few ideas:

* object layout, introspection and heap walking
* unwinding and symbolifying managed methods
* lookup line information for managed methods
* pretty print all runtime structs
* threadpool introspection?

**Deliverables:** One or more of the above bullet points.

**Mentors:** João Matos, Alexis Christoforides

### Port mono to WinRT

**Complexity:** Hard

WinRT is the runtime sandbox that Windows Store apps run in.

Right now Mono doesn't run on it.

The goal of this project is to get the runtime to compile for WinRT and get
a simple Hello World app working.

**Deliverables:** A Hello World app running in the WinRT sandbox.

**Mentors:** João Matos, Alexis Christoforides

### Make FileStream async operation really async

**Complexity:** Easy

We could use our already existing infrastructure used for Socket, to make FileStream BeginRead, BegrinWrite, etc. methods really async.
They are right now simple their synchronous method counter part called enqueued on the ThreadPool. For example, `FileStream.BeginRead` is implemented as `Read.BeginInvoke (...)`

**Deliverables**: Properly async FileStream, passing Mono tests.

**Mentors:** Ludovic Henry

### JIT optimizations

**Complexity:** Hard

There are a few JIT optimizations that we could profile from:

* type propagation. Right now we perform zero type propagation in the JIT, leading to a lot of missed opportunities.

* delayed/iterated inlining & casting. Allow those to be performed after method-to-ir. This would allow us to do a TON of VERY profitable strength reduction.

**Deliverables**: Implementation of a JIT optimization from the above list, or another of your suggestion. Must pass all unit tests.

**Mentors:** Rodrigo Kumpera

## Microsoft .NET and Mono integration

Microsoft open sourced large chunks of code the past couple of years:

* ReferenceSource: the source code for the class libraries of .NET as it ships on Windows
* CoreFX: a fresh take on the distribution of the class libraries for a new, slimmer, smaller runtime
* CoreCLR: their C/C++ based runtime, JIT, GC for running on Mac, Linux and Windows
* Roslyn: Microsoft's C# and VB compiler as a service
* CodeContracts: the tools needed to instrument your code

We are tracking various ideas in the [.NET Integration in Mono](https://trello.com/b/vRPTMfdz/net-framework-integration-into-mono) trello board.

### Import reference source System.Web* assemblies

**Complexity:** Medium

Mono has its own implementation of the System.Web assemblies. Microsoft has open-sourced their Reference Source implementation. We would like to replace Mono's existing implementation with Reference Source in order to increase compatibility, and fix bugs and missing features..

**Deliverables**: integrate the Reference Source System.Web.* assemblies into Mono, passing Mono test suite on Windows and Unix.

**Mentors:** Marek Safar

## GTK# and Bindings

### Urho3d Game Engine Improvements

**Complexity:** Hard

The [UrhoSharp](https://github.com/xamarin/urho) binding makes the [Urho3D](http://urho3d.github.io) game engine accessible from C#, F# and other .NET languages.

Improvements to Urho3D will directly benefit UrhoSharp users. This is an open-ended project idea; you should pick a specific project for your proposal.

Examples of possible projects include:

* [Vulkan](https://www.khronos.org/vulkan) rendering backend
* [Metal](https://developer.apple.com/metal) rendering backend
* Impostor system
* Procedural texture generation
* Water or sky simulation

NOTE: Contributions must follow the Urho3D contribution rules, and you should confirm with the Urho3D maintainers that they will be willing to merge the feature.

**Deliverables**: Add a feature of your choice to the Urho3D engine, as specified in your proposal.

**Mentors:** Miguel de Icaza

### CppSharp | Continue Mono/.NET bindings for Qt

**Complexity:** Hard

As part of this task you’ll need to continue the bindings effort for the Qt framework so that it can be used with Mono/.NET languages such as C#, similar to the existing bindings of GTK# for GTK+.

QtSharp has reached alpha status and it needs the final improvements to make it a complete product. The necessary work can be broken down into five categories:

* Type maps for basic types – mostly because of the relatively new support for wrapping templates, QtSharp still only has a type map for QString ↔ string. Many other basic type maps are necessary for an optimal coding experience.
Deliverables: The following type maps: QList<>, QVector<> ↔ List<>; QMap<,>, QHash<,> ↔ Dictionary<,>; and QChar<> ↔ char;

* Qt Quick support –  enables writing of Qt Quick applications using C#.
Deliverables: the ability to include QML files in the application (an integrated in Visual Studio/MonoDevelop editor is not included, for now external editors such as Qt Creator will have to be used) and working interaction between C# and QML (property changes and emitting of signals in QML must call the corresponding C# code);

* Documentation package – online and off-line documentation for QtSharp.
Deliverables: A compressed directory containing a complete DOxygen documentation package for QtSharp. The documentation itself is generated as XML code comments which DOxygen then takes from the source files and uses a configuration file to generate the package;

* Binaries – users must be able to download binaries for each platform QtSharp currently supports, namely all three major desktop platforms – Windows, Linux and OS X.
Deliverables: Build scripts to produce and upload Qt# binaries;

* Auto-memory management – this feature is deliberately last in the list because it may or may not be reasonable. The problem is that the only way to implement it is to use managed destructors to call their native counterparts, and the former are, in short, not guaranteed to be called. In long, each managed destructor (or finaliser) must take less than two seconds of execution time and all finalisers combined must take less than forty. If either condition fails, the VM terminates the process without calling the remaining finalisers (<https://blogs.msdn.microsoft.com/oldnewthing/20100809-00/?p=13203>, <http://blog.stephencleary.com/2009/08/finalizers-at-process-exit.html>) which would lead to leaks in native memory. On the other hand, if the bindings are correct, a finaliser would only take an instant so the time limit should be more than enough for all of them. Basically, it can be done but it really is a stretch of the capabilities of the VM, so what's certain is that this task must be left last – if implemented at all.
Deliverables: Generation of managed destructors (finalisers) to call their native counterparts in order to free the memory allocated for the native part of wrapped objects.

Related code:

<https://github.com/mono/CppSharp>
<https://gitlab.com/ddobrev/QtSharp>
<https://techbase.kde.org/Development/Languages/Qyoto> – obsolete bindings for Qt which can however give some ideas, for example for type maps

Feel free to get in touch with @tritao if you’re interested in this and would like more guidance.

**Deliverables:** Improve the Qt bindings generator to the point that they can be used for a non-trivial Qt sample written in idiomatic C#, with and without QML.

**Mentors:** João Matos

## Other Ideas

If a project is not listed here, but you think you have a great idea, feel free to
[contact the Mono team, mentors and org admins](#contacting-the-mono-team) to discuss or suggest your own project ideas.

Over the past years we have picked projects that were not listed here because they were great ideas, and we had students
that were passionate about those projects. In the end, most of these projects were a success.

Do not be afraid to pick up a project that would be interesting and also help the Mono universe.

You can find some additional ideas on the [MonkeySquare ideas page](http://monkeysquare.org/gsoc/projects), and on the
[Gnome ideas page](https://live.gnome.org/SummerOfCode2013/Ideas) (Mono-based projects in Gnome: Banshee, Blam, Tasque,
Tomboy, GBrainy, Mistelix, F-Spot, ChronoJump, SparkleShare, LongoMatch).

## Contacting the Mono Team

If you have questions or suggestions that you want to make in real-time and talk to a member of the team, please join us
on IRC on the server "irc.gnome.org" in channel "#monosoc", "#monodev" or the "#mono" channel. Various mentors and
students from past years are usually there and can answer some quick questions about the program and about Mono.

The mailing lists are a very important communication channel, students should use them to get more information and
feedback about ideas and proposals. Community engagement is essential for a successful summer of code, so get involved!

For any questions you may have about the program itself and to talk to the Mono GSoC admin, you can use
[soc@xamarin.com](mailto:soc@xamarin.com).

### Mailing Lists

[http://lists.ximian.com/mailman/listinfo/mono-devel-list](http://lists.ximian.com/mailman/listinfo/mono-devel-list)
A mailing list dedicated to discussions about developing Mono itself, such as development of the runtime, class libraries, and related Mono projects.

[http://lists.ximian.com/mailman/listinfo/monodevelop-devel-list](http://lists.ximian.com/mailman/listinfo/monodevelop-devel-list)
Discussion on the development/implementation of MonoDevelop.

A complete breakdown of all Mono mailing lists is available at [Mailing Lists](/community/help/mailing-lists/).

