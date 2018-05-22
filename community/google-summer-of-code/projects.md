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

**[MonoDevelop / Xamarin Studio IDE](#monodevelop--xamarin-studio-ide)**

Help developers build applications by improving the cross-platform MonoDevelop / Xamarin Studio IDE

* [Code Contracts Support](#code-contracts-support)
* [CodeLens for MonoDevelop](#codelens-for-monodevelop)
* [Debugging disassembled code could use C# decompiler to generate source](#debugging-disassembled-code-could-use-c-decompiler-to-generate-source)
* [Improve Auto-Documentation System](#improve-auto-documentation-system)
* [Overhaul MonoDevelop C/C++ support](#overhaul-monodevelop-cc-support)
* [Resurrect MonoDevelop database support](#resurrect-monodevelop-database-support)
* [Reuse MonoDevelop Roslyn compilation to perform compile](#reuse-monodevelop-roslyn-compilation-to-perform-compile)
* [Support creation of sandboxed Linux apps](#support-creation-of-sandboxed-linux-apps)
* [Support for Symbol Servers](#support-for-symbol-servers)
* [Unit tests code coverage visualised inside MonoDevelop editor](#unit-tests-code-coverage-visualised-inside-monodevelop-editor)
* [Urho3D Material Editor for MonoDevelop](#urho3d-material-editor-for-monodevelop)
* [Urho3D Scene Editor for MonoDevelop](#urho3d-scene-editor-for-monodevelop)
* [Visual Basic with Roslyn in MD](#visual-basic-with-roslyn-in-md)

**[Compilers and Tools](#compilers-and-tools)**

Work on Mono's tools and compilers

* [Bring IronPython to Android and iOS](#bring-ironpython-to-android-and-ios)
* [Port ilasm to use IKVM.Reflection instead of PEAPI](#port-ilasm-to-use-ikvmreflection-instead-of-peapi)
* [Replace mono-cil-strip](#replace-mono-cil-strip)

**[Mono Runtime](#mono-runtime)**

Improve the core Mono runtime and JIT

* [Add platform specific backends for the ThreadPool](#add-platform-specific-backends-for-the-threadpool)
* [Add RISC-V Backend](#add-risc-v-backend)
* [Allocator for sgen blocks](#allocator-for-sgen-blocks)
* [Implement a LLDB plugin that can understands the mono runtime](#implement-a-lldb-plugin-that-can-understands-the-mono-runtime)
* [Implement Clang static analyser checkers that would verify runtime invariants](#implement-clang-static-analyser-checkers-that-would-verify-runtime-invariants)
* [Implement System.Runtime.Intrinsics from CoreFX](#implement-systemruntimeintrinsics-from-corefx)
* [Improve our dynamic checking mode](#improve-our-dynamic-checking-mode)
* [Improve sgen debugging](#improve-sgen-debugging)
* [JIT optimizations](#jit-optimizations)
* [Make sgen's binary protocol a general purpose runtime tool](#make-sgens-binary-protocol-a-general-purpose-runtime-tool)

**[Microsoft .NET and Mono integration](#microsoft-net-and-mono-integration)**

Work on blending the worlds of open source .NET and Mono projects together

* [Import reference source System.Web* assemblies](#import-reference-source-systemweb-assemblies)
* [Import System.IO.FileStream from CoreFX](#import-systemiofilestream-from-corefx)

**[Platforms and Bindings](#platforms-and-bindings)**

Bindings to native toolkits and libraries, including GTK#, Xamarin.Android, Xamarin.iOS, Xamarin.Mac and UrhoSharp

* [Implement WebAssembly versions of class library missing bits](#implement-webassembly-versions-of-class-library-missing-bits)
* [Port Go's HTTP client/server to .NET](#port-gos-http-clientserver-to-net)
* [Test & fix remaining profile assemblies under WASM](#test--fix-remaining-profile-assemblies-under-wasm)
* [Urho3d Game Engine Improvements](#urho3d-game-engine-improvements)

**[Other Ideas](#other-ideas)**

Suggest your own ideas for a project

**[Contacting the Mono Team](#contacting-the-mono-team)**

How to get in touch with us and ask questions

## MonoDevelop / Xamarin Studio IDE

### Code Contracts Support

**Complexity:** Medium

The goal of this project is to add Code COntracts support to Mono using the open-source [.NET Code Code Contracts support](https://github.com/Microsoft/CodeContracts).

For more information, see:

* [Code Contracts docs](https://docs.microsoft.com/en-us/dotnet/framework/debug-trace-profile/code-contracts)
* [MS Research Project page](https://www.microsoft.com/en-us/research/project/code-contracts/)

This is a technology that is made of four components:

* APIs in mscorlib that are used to specify things like preconditions and post conditions
* The use of these APIs in user code
* Tools to modify binaries to insert/remove code contracts instrumentation
* IDE support for the tools.

We have already done the first step, and as we import more code from .NET, the second step will be done for us in the core libraries.

This task focuses on two things:

* Porting the tools to modify binaries to insert/remove code
* IDE support for the tools

The first step should be relatively simple.   The code is open source, and might require some minimal changes to run on Unix with Mono.

The second step includes extending the MonoDevelop IDE to add the configuration options to use Code Contracts and call the code contract tools at the appropriate times. The UI looks like the attached screenshot, and under the hood it works using MSBuild targets.

**Deliverables**: Code contracts tools working on Mono and integrated into MonoDevelop.

**Mentors:** Aleksey Kliger

### CodeLens for MonoDevelop

**Complexity:** Medium

A code lens is an adornment drawn above lines in the source editor to provide ambient contextual information, such as when a method was last modified, or the number of places it is referenced. They can be seen in action in Visual Studio and Visual Studio Code.

This task is to create an infrastructure for code lenses in MonoDevelop that can be extended by extension packages, and to implement several built-in code lenses using this infrastructure.

Many of the underpinnings are already present, so this project is partly a UX task. Prior to the implementation, you will need to do user research and testing to provide support for the design:

* What information is useful to show in a code editor, and how should it be displayed?
* How do developers interact with the code lenses?
* How do we make them unobtrusive, and make the experience smooth and subtle?

You will learn how to find a tradeoff between optimal user experience and technical complications.

**Mentors:** maryannexe

### Debugging disassembled code could use C# decompiler to generate source

**Complexity:** Medium

MonoDevelop already has IL->C# logic, and the debugger already supports stepping into methods without code. These two components have to be combined to give a user the option to see C# code instead of IL when stepping into methods without source code.

**Deliverables:** Ability to see C# instead of IL when debugging methods without source code.

**Mentors:** David Karlas

### Improve Auto-Documentation System

**Complexity:** Medium

MonoDevelop has an addin that automatically generates documentation comments based on the member types and  naming conventions. This is very useful, as it gets the boilerplate out the way leaving more time for the developer to add meaningful details.

However, sometimes its assumptions do not hold and the resulting docs  do not make sense. Although this is funny, we would like to fix it.

This is an ideal project for a student interested in linguistics, parsing & understanding natural language.

Your proposal should describe the approaches you intend to use to fix the issue, and a number of cases where the generated docs could be improved.

**Deliverables:** Fix the docs generation for the cases covered in your proposal.

**Mentors:** Mike Krüger

### Overhaul MonoDevelop C/C++ support

**Complexity:** Medium

The [MonoDevelop C/C++ extension](https://github.com/mhutch/cbinding) was substantially updated as part of Summer of Code 2015 and 2017. However, there are still many things that could be done to improve it!

There's far more than could be done in a single Summer of Code, so feel free to pick and choose from the list of tasks when writing your proposal:

* detect missing dependencies (libclang, CMake etc) and prompt the user to install them
* improve the code completion and add a test suite
* add various refactorings
* integrate the [Clang Source Analyzer](https://clang-analyzer.llvm.org)
* improve the GDB debugger integration
* integrate the LLDB debugger
* improve the file and project templates
* anything else you can think of!

**Deliverables:** a set of improvements to the C/C++ addin, as specified in your proposal

**Mentors:** Mikayla Hutchinson

### Resurrect MonoDevelop database support

**Complexity:** Medium

MonoDevelop used to have database support, but it was abandoned and eventually bitrotted away. This task is to bring it back!

The recommended approach is to start with the old database extensions and update them to MonoDevelop 7.0 API. Remove all the backends except Sqlite, MySQL and PostgreSQL, and ship the remaining extensions as standalone extensions. You should also add a unit test suite, fix bugs (check bugzilla) and add general polish and features (to be proposed by student).

**Deliverables**: Working database support in MonoDevelop, with details to be specified in the proposal

**Mentors:** Marius Ungureanu

### Reuse MonoDevelop Roslyn compilation to perform compile

**Complexity:** Medium

MonoDevelop now uses the Roslyn compiler for its type system, and keeps fully updated Roslyn compilations in memory. It should be possible when building for the build engine to connect back the the IDE and use the existing Roslyn compilations for code generation, in the same way that Visual Studio does. This will greatly improve compile time during development.

This will require implementing the MSBuild ICscHostObject interface in the MonoDevelop build system and having the Csc build task delegate the code generation to the in-process compiler.

**Deliverables**: Fully implement ICscHostObject in the MonoDevelop build system, including tests.

**Mentors:** Marius Ungureanu

### Support creation of sandboxed Linux apps

**Complexity:** Medium

When creating new C or Vala apps in the GNOME Builder IDE, projects are created with a manifest file for building a sandboxed version of the application for distribution. MonoDevelop's current Linux package creation support should be enhanced to make it easy to create sandboxed applications, in line with GNOME Builder's feature

**Deliverables**: New projects on Linux should offer to create a flatpak-builder manifest file, and build/run should integrate sufficiently with flatpak-builder that its use should be transparent.

**Mentors:** Jo Shields

### Support for Symbol Servers

**Complexity:** Hard

Support for downloading symbol packages from symbol servers on demand and using them in the debugger. This is primarily useful for NuGet.

Making this work will require implementing support for handling debugger symbols on the client (IDE) side instead of the debugger agent.

**Deliverables**: Support for downloading symbol packages and using them when debugging apps.

**Mentors:** David Karlas

### Unit tests code coverage visualised inside MonoDevelop editor

**Complexity:** Medium

The [monocov](https://github.com/mono/monocov) profiler module can be used to collect information about which code was executed. This project would involve adding support to the MonoDevelop.UnitTesting extension to collect code coverage information when running unit tests on the Mono runtime, and to display that information in a pad and visually in the source editor.

**Deliverables**: Add support to MonoDevelop to collect code coverage information when running tests, and display it visually in the text editor.

**Mentors:** David Karlas

### Urho3D Material Editor for MonoDevelop

**Complexity:** Medium

Urho3D is an open source game engine that C#/F# developers can use via the [UrhoSharp](https://github.com/xamarin/urho) binding. It's small and easily embeddeable, and thus suitable for visualization as well as games.

It would be very useful for developers using MonoDevelop to be able to edit Urho3D materials definitions directly within their project. The editor should have code completion and validation for the material format, and a way to preview the material live as is is edited.

**Deliverables**: An Urho3D material editor embedded into MonoDevelop that allows developers to preview and edit materials that are in their projects.

**Mentors:** Mikayla Hutchinson, Miguel de Icaza

### Urho3D Scene Editor for MonoDevelop

**Complexity:** Medium

Urho3D is an open source game engine that C#/F# developers can use via the [UrhoSharp](https://github.com/xamarin/urho) binding. It's small and easily embeddeable, and thus suitable for visualization as well as games.

It would be very useful for developers using MonoDevelop to be able to edit Urho3D scene definitions directly within their project. This editor should allow placing objects in the scene; moving, scaling and rotating; and editing properties such as materials and components.

**Deliverables**: An Urho3D scene editor embedded into MonoDevelop that allows developers to preview and edit scenes that are in their projects.

**Mentors:** Mikayla Hutchinson

### Visual Basic with Roslyn in MD

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

**Mentors:** Vsevolod Kukol, Marius Ungureanu

## Compilers and Tools

### Bring IronPython to Android and iOS

**Complexity:** Medium

IronPython has been maintained all of this years, and with the increased popularity of Python in schools, we would like to add bring IronPython to mobile platforms.

You will need to define the workflow and project/build system for working with IronPython code on Android and/or iOS, including samples and templates, and port IronPython to compile with the Xamarin mobile profiles.

**Deliverables**: end-to-end IronPython support on iOS and/or Android

**Mentors:** Miguel de Icaza, Mikayla Hutchinson

### Port ilasm to use IKVM.Reflection instead of PEAPI

**Complexity:** Medium

Port ilasm, the IL assembler, to use IKVM.Reflection as its code emission backend instead of PEAPI. This will require extending IKVM.Reflection to support the advanced metadata that ilasm supports.

**Deliverables:** ilasm emitting code using IKVM.Reflection instead of PEAPI, and passing all tests.

**Mentors:** Marek Safar, Zoltan Varga

### Replace mono-cil-strip

**Complexity:** Medium

The current tool requires [1] us to keep a very old version of Cecil around (in the submodules). It's also not very fast [2] and cannot be reused with (or embedded into) other projects [3] that are using a new version of Cecil.

Notes: it does not have to use (or hack around) the latest Cecil, e.g. it could be based on System.Reflection.Metadata or even a custom solution.

[1] The most important feature, for full-AOT, is that the metadata tokens *must* remain identical (it's part of the executable and stripping happens after the AOT process).

[2] needs measurements but the old-cecil was not very fast

[3] XI mtouch, XM mmp and XA tooling - the later too needs a mode that can partially strip IL too

**Deliverables**: Pull requests that replace *mono-cil-strip* with a new version that has the described characteristics.

**Mentors:** Alexander Kyte

## Mono Runtime

### Add platform specific backends for the ThreadPool

**Complexity:** Medium

The ThreadPool supports the concept of workers backend which is responsible for allocating the appropriate number of threads. This allows for platform-specific implementations. For example, we can use  `dispatch_async` on macOS/iOS, the Win32 threadpool on Windows, and the existing - hand rolled - implementation on the other platforms.

**Deliverables:** Add backend for `dispatch_async` on macOS/iOS and for the Win32 threadpool on Windows.

**Mentors:** Ludovic Henry

### Add RISC-V Backend

**Complexity:** Hard

I believe that it is within scope to add an LLVM-based backend for RISC-V within a summer.

Quad-core consumer RISC-V boards are going to be available by this summer, so it seems time to put some effort into RISC-V. We want a student to write the architecture-specific code necessary for our LLVM backend to compile source for RISC-V.

Steps:
1) Add build infrastructure for RISC-V (look at what our autogen stuff and source tree does for arm or mips, copy that)
2) Write LLVM aot support for RISC-V (use existing backend in LLVM project, it's mostly just configuration in C)
3) Write runtime support for RISC-V (requires some platform ABI knowledge)

**Mentors:** Alexander Kyte

### Allocator for sgen blocks

**Complexity:** Hard

Most of the objects in sgen are allocated in major blocks. We don't allocate the blocks in an organised way, we allocate them in chunks and free them individually. This leads to incapability of freeing them on some targets, virtual space fragmentation and bad structure.

We need to allocate blocks in well determined contiguous regions that we can keep track of and have sgen's compaction mechanism account for this structure.

**Deliverables** : Implement an allocator for sgen blocks

**Mentors:** Vlad Brezae

### Implement a LLDB plugin that can understands the mono runtime

**Complexity:** Hard

LLDB support plugins and we should write one that exposes as much as possible of the runtime. A few ideas:

* object layout, introspection and heap walking
* unwinding and symbolifying managed methods
* lookup line information for managed methods
* pretty print all runtime structs
* threadpool introspection?

Note that some work on this has been done already and can be found [here](https://github.com/mono/lldb) and [here](https://github.com/mono/lldb-binaries).

**Deliverables:** One or more of the above bullet points, as listed in your proposals.

**Mentors:** Alexis Christoforides

### Implement Clang static analyser checkers that would verify runtime invariants

**Complexity:** Medium

Clang static analyser support writing custom rules.

Add new rules that understand idioms in the runtime (and maybe extra hints on it) to verify multiple conditions:

* Managed exception cleaningness;
* Managed allocation OOM handling;
* Correct lock ordering;
* GC invariants;
* AppDomain invariants;

Together with the clang work, this project should annotate the runtime to verify those properties as needed.

**Deliverables:** One or more of the above bullet points.

**Mentors:** Bernhard Urban

### Implement System.Runtime.Intrinsics from CoreFX

**Complexity:** Medium

See code on [CoreFX GitHub](https://github.com/dotnet/corefx/tree/master/src/System.Runtime.Intrinsics)

**Mentors:** Miguel de Icaza, Zoltan Varga

### Improve our dynamic checking mode

**Complexity:** Medium

One way we're improving how we test mono is by having a build mode with a lot of extra checks done.

This project would extend it with some number of the following improvements, to be specified in your proposal:

* Integrate the existing offline lock checker tool into checked builds
* Extend the memory management audit points to more places
* Continue the work of verifying memory stores
* Optimize the mm checker
* Add fault injection mode [1]
* Add do-a-lot mode [2]
* Implement other checked modes (TBD)

[1] It's very hard to produce test cases for a lot of failure conditions, so injecting faults instead is a much easier way to test those paths.

[2] Some important, but rarely done, runtime mechanisms are not well tested since they naturally happen very rarely. The idea is to identify a few and have a checked-build mode that triggers then *A LOT*.

**Deliverables**: Implement the dynamic checking mode improvements listed in your proposal.

**Mentors:** Alexander Kyte

### Improve sgen debugging

**Complexity:** Medium

In order to debug issues with our garbage collector, we have a set of functions that we invoke (at runtime or from gdb) in order to check the state of the heap.

We encounter problems with these debugging functions crashing on invalid heap states (we need safe dereferencing of invalid pointers and recovering) or not being fully supported on all configurations.

**Deliverables**: Make debug functions crash safe. Expand support for nursery canaries.

**Mentors:** Vlad Brezae, Alexis Christoforides

### JIT optimizations

**Complexity:** Hard

There are a few JIT optimizations that we could profile from:

* type propagation. Right now we perform zero type propagation in the JIT, leading to a lot of missed opportunities.
* delayed/iterated inlining & casting. Allow those to be performed after method-to-ir. This would allow us to do a TON of VERY profitable strength reduction.

**Deliverables**: Implementation of a JIT optimization from the above list, or another of your suggestion. Must pass all unit tests.

**Mentors:** Bernhard Urban

### Make sgen's binary protocol a general purpose runtime tool

**Complexity:** Medium

SGen's binary protocol proved to be an invaluable troubleshooting tool.

It's a flight-recorder kind of tool that should be accessible for all part of the runtime.

This project is to extract it from sgen and make it a general purpose tool for the runtime.

In addition, it should add probes for a few runtime facilities:

* threadpool events
* JIT activity
* ???

A good use case would be to use it to replace the runtime's dtrace probes.

Additionally, improving the tooling around processing binprot files can be part of this project.

**Deliverables**: Extract the binary protocol from sgen and use it to replace the runtime's dtrace probes.

**Mentors:** Ludovic Henry

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

### Import System.IO.FileStream from CoreFX

**Complexity:** Medium

`System.IO.FileStream` is the main class that allow users to read and write to files, pipes and consoles. It's a core component of Mono and the .NET platform. Its quality and reliability is key to a stable and fast development platform.

The goal is to replace our BCL implementation of [`System.IO.FileStream`](https://github.com/mono/mono/blob/master/mcs/class/corlib/System.IO/FileStream.cs), with the [CoreFX one](https://github.com/dotnet/corefx/blob/master/src/System.IO.FileSystem/src/System/IO/FileStream.cs). This would allow us to get closer to .NET Core code quality and behaviour.

All changes made to adapt `System.IO.FileStream` to Mono would then be upstreamed to the .NET foundation [CoreFx repo](https://github.com/dotnet/corefx)

**Deliverables**: Integrate `FileStream` from CoreFX into Mono and upstream any necessary changes.

**Mentors:** Marek Safar

## Platforms and Bindings

### Implement WebAssembly versions of class library missing bits

**Complexity:** Medium

Our BCL has a lot of pieces that require a new implementation for WebAssembly.

The deliverables of this project is implement WASM specific versions of the following bits:

* System.Threading.Timer
* HttpClient handler
* TimeZone
* Locale

A student proposal should pick a few of those items.

**Deliverables**: Pull requests with implementations of the features specified in your proposal.

**Mentors:** Miguel de Icaza

### Port Go's HTTP client/server to .NET

**Complexity:** Medium

[Go's HTTP client/server stack](https://github.com/golang/go/tree/master/src/net/http) is fast and elegant. This project is to make it available to C# developers by porting it line by line to C#.

**Deliverables**:  a working port of the Go client/server stack in C#, with tests

**Mentors:** Miguel de Icaza

### Test & fix remaining profile assemblies under WASM

**Complexity:** Medium

Today only mscorlib, System and System.Core have being tested under WebAssembly.

Test the remaining assemblies and fix issues found.

**Deliverables**: pull requests that fix issues found during testing.

**Mentors:** Rodrigo Kumpera

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

**Mentors:** Mikayla Hutchinson, Miguel de Icaza

## Other Ideas

If a project is not listed here, but you think you have a great idea, feel free to
[contact the Mono team, mentors and org admins](#contacting-the-mono-team) to discuss or suggest your own project ideas.

Over the past years we have picked projects that were not listed here because they were great ideas, and we had students
that were passionate about those projects. In the end, most of these projects were a success.

Do not be afraid to pick up a project that would be interesting and also help the Mono universe.

You can find some additional ideas on the
[Gnome ideas page](https://wiki.gnome.org/Outreach/SummerOfCode/2017/Ideas) (Mono-based projects in Gnome: Banshee, Blam, Tasque,
Tomboy, GBrainy, Mistelix, F-Spot, ChronoJump, SparkleShare, LongoMatch).

## Contacting the Mono Team

If you have questions or suggestions that you want to make in real-time and talk to a member of the team, please join us
on IRC on the server "irc.gnome.org" in channel "#monosoc", "#monodev" or the "#mono" channel. Various mentors and
students from past years are usually there and can answer some quick questions about the program and about Mono.

The mailing lists are a very important communication channel, students should use them to get more information and
feedback about ideas and proposals. Community engagement is essential for a successful summer of code, so get involved!

For any questions you may have about the program itself and to talk to the Mono GSoC admin, you can use
[soc@xamarin.com](mailto:soc@xamarin.com).
