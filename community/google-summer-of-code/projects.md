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

**[MonoDevelop IDE](#monodevelop-ide)**

Help developers build applications by improving the cross-platform MonoDevelop IDE (also used as the core of Visual Studio for Mac)

* [Debugging disassembled code could use C# decompiler to generate source](#debugging-disassembled-code-could-use-c-decompiler-to-generate-source)
* [Overhaul MonoDevelop C/C++ support](#overhaul-monodevelop-cc-support)
* [Support for Symbol Servers](#support-for-symbol-servers)
* [Unit tests code coverage visualised inside MonoDevelop editor](#unit-tests-code-coverage-visualised-inside-monodevelop-editor)
* [Urho3D Material Editor for MonoDevelop](#urho3d-material-editor-for-monodevelop)
* [Urho3D Scene Editor for MonoDevelop](#urho3d-scene-editor-for-monodevelop)
* [Visual Basic with Roslyn in MD](#visual-basic-with-roslyn-in-md)

**[Compilers and Tools](#compilers-and-tools)**

Work on Mono's tools and compilers

* [Add integration to use LLVM Superoptimizer](#add-integration-to-use-llvm-superoptimizer)
* [Bring IronPython to Android and iOS](#bring-ironpython-to-android-and-ios)
* [Flatpak support for Mono apps](#flatpak-support-for-mono-apps)
* [Polish LLVM C backend for Mono](#polish-llvm-c-backend-for-mono)
* [Port ilasm to use IKVM.Reflection instead of PEAPI](#port-ilasm-to-use-ikvmreflection-instead-of-peapi)
* [Replace mono-cil-strip](#replace-mono-cil-strip)

**[Mono Runtime](#mono-runtime)**

Improve the core Mono runtime and JIT

* [Add RISC-V Backend](#add-risc-v-backend)
* [Allocator for sgen blocks](#allocator-for-sgen-blocks)
* [Implement Clang static analyser checkers that verify runtime invariants](#implement-clang-static-analyser-checkers-that-verify-runtime-invariants)
* [Improve our dynamic checking mode](#improve-our-dynamic-checking-mode)
* [Improve sgen debugging](#improve-sgen-debugging)
* [JIT optimizations](#jit-optimizations)
* [Make sgen's binary protocol a general purpose runtime tool](#make-sgens-binary-protocol-a-general-purpose-runtime-tool)
* [MJIT - Mini.Compiler ongoing work](#mjit---minicompiler-ongoing-work)
* [Persistence for the Mono class loader](#persistence-for-the-mono-class-loader)
* [RR integration](#rr-integration)
* [Succinct data structure implementations to replace glib dependencies](#succinct-data-structure-implementations-to-replace-glib-dependencies)

**[Platforms and Bindings](#platforms-and-bindings)**

Bindings to native toolkits and libraries, including GTK#, Xamarin.Android, Xamarin.iOS, Xamarin.Mac and UrhoSharp

* [.NET Bindings for Flutter](#net-bindings-for-flutter)
* [Continue SEALsharp bindings](#continue-sealsharp-bindings)
* [Extend Xamarin.Analysis support](#extend-xamarinanalysis-support)
* [Urho3d Game Engine Improvements](#urho3d-game-engine-improvements)
* [Xamarin.iOS/Xamarin.Mac Roslyn Analyzers](#xamariniosxamarinmac-roslyn-analyzers)

**[Other Ideas](#other-ideas)**

Suggest your own ideas for a project

**[Contacting the Mono Team](#contacting-the-mono-team)**

How to get in touch with us and ask questions

## MonoDevelop IDE

### Debugging disassembled code could use C# decompiler to generate source

**Complexity:** Medium

MonoDevelop already has IL->C# logic, and the debugger already supports stepping into methods without code. These two components have to be combined to give a user the option to see C# code instead of IL when stepping into methods without source code.

**Deliverables:** Ability to see C# instead of IL when debugging methods without source code.

**Mentors:** David Karlas

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

**Mentors:** Mikayla Hutchinson

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

### Add integration to use LLVM Superoptimizer

**Complexity:** Hard

Superoptimization is a method for generating provably-optimal code for short segments of logical operations. The process of stitching these together had classically been seen as intractable, but modern optimizations of the process makes it doable, if a bit slow.

Production applications sometimes would benefit from much faster code, even at the cost of compilation time and the audibility of compilation.

This project would see the student do further build and automation work to enable us to use Souper out-of-the box. Creation of some diagrams and benchmarks showing the cost and improvements with Souper would be one deliverable as well.

This student can hope to gain some familiarity with binding LLVM and working with the LLVM tooling ecosystem.

<https://www.mono-project.com/news/2018/12/06/souper/>

**Mentors:** Alexander Kyte

### Bring IronPython to Android and iOS

**Complexity:** Medium

IronPython has been maintained all of this years, and with the increased popularity of Python in schools, we would like to add bring IronPython to mobile platforms.

You will need to define the workflow and project/build system for working with IronPython code on Android and/or iOS, including samples and templates, and port IronPython to compile with the Xamarin mobile profiles.

**Deliverables**: end-to-end IronPython support on iOS and/or Android

**Mentors:** Miguel de Icaza, Mikayla Hutchinson, Larry O'Brien

### Flatpak support for Mono apps

**Complexity:** Medium

Flatpak is all the rage these days in the Open Source and GNOME community. It's still a bit of work to create a Flatpak with Mono (the whole runtime needs to be included, dependency resolution, including nugets, and total bundle size is large).

Ideas for Flatpak + Mono tools:

* *An extension for MonoDevelop that turns any C# project into a Flatpak
* *A flatpak-builder extension that includes the Mono runtime to save time/space when compiling a bundle
* *A tool that uses mkbundle to statically link the entire app and keep mono based flatpak bundles small
* *Templates for easy inclusion of open source NuGets

**Deliverables**: An end-to-end experience for creating a Flatpak from a  MonoDevelop project

**Mentors:** Hylke Bons

### Polish LLVM C backend for Mono

**Complexity:** Hard

A proof of concept has been demonstrated using Julia's [LLVM C Backend](https://github.com/JuliaComputing/llvm-cbe) with Mono to generate C code from a managed executable. This would allow using Mono on older/limited/exotic platforms where it cannot currently be used.

For details, see <https://github.com/mono/mono/issues/11940>

The project is to make this more complete and stable. A key part of this would be to make the backend use Mono's intrinsics instead of LLVM-CBE's Julia-specific intrinsics.

**Mentors:** Alexander Kyte

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

### Add RISC-V Backend

**Complexity:** Hard

There was some initial bootstrapping done for RISC-V:
<https://github.com/mono/mono/pull/11593>

I see two projects possible around this area:

* (1) continue implementing the JIT backend. I wouldn't expect a student to get it to a "complete" state after two months, but the delivery can be reduced to "make the mini regression test suite work", which is a huge achievement, but not a fully working runtime.
* (2) get the interpreter working on this target. This needs some low-level hacking in terms of writing RISC-V assembly. However, it's a fairly contained work item and as a reward it should be able to run almost anything (as the interpreter itself is pretty complete).

Note1: I would not recommend using the LLVM backend, because it needs the regular JIT backend as a fallback.

Note2: Real hardware, aka. a development board is *not* needed, the simulator tooling is quite good. In fact, I think it's much easier to develop with the simulator than on real (slow) hardware. The only fast hardware available is >$1000.

**Mentors:** Bernhard Urban

### Allocator for sgen blocks

**Complexity:** Hard

Most of the objects in sgen are allocated in major blocks. We don't allocate the blocks in an organised way, we allocate them in chunks and free them individually. This leads to incapability of freeing them on some targets, virtual space fragmentation and bad structure.

We need to allocate blocks in well determined contiguous regions that we can keep track of and have sgen's compaction mechanism account for this structure.

**Deliverables** : Implement an allocator for sgen blocks

**Mentors:** Vlad Brezae

### Implement Clang static analyser checkers that verify runtime invariants

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

### MJIT - Mini.Compiler ongoing work

**Complexity:** Hard

The [MJIT](https://www.mono-project.com/news/2018/09/11/csharp-jit/) Mini.Compiler is a managed interface that lets you interpose some managed code every time that the Mono "mini" JIT needs to compile some IL to native code. The project would be to flesh out the interface and get it working in more scenarios. Then explore moving more of the guts of "mini" to managed code.

**Mentors:** Aleksey Kliger, Bernhard Urban

### Persistence for the Mono class loader

**Complexity:** Medium

What if we used a database (such as SQLlite or [LMDB](https://github.com/LMDB/lmdb/blob/mdb.master/libraries/liblmdb/intro.doc))  to persist Mono's class initialization results. The idea is that all the computation that mono does over a MonoClass in order to initialize it (computing sizes and layouts, etc) could be stored in a robust DB backend and recalled (concurrently, if necessary) on the next run of Mono. If we persisted the initialization of corlib and Roslyn, would that help us decrease startup times?

**Mentors:** Aleksey Kliger

### RR integration

**Complexity:** Medium

RR is a debugger that allows for recording of execution in a way that can be replayed later in a debugger. The results of syscalls are fed back into the program to replicate the environment the program saw over time.

The runtime can be debugged with RR on linux, but this is mostly useful for low-level debugging.

We have two options here: We can expose managed logging and heap/stack snapshotting to the debugger-agent and do this is a managed way. This allows us to work on ARM, linux, windows, ios, etc. The downside is that we don't get to replay state changes in unmanaged code.

Alternatively, we can have the student create glue code for using rr to debug the entire runtime remotely, and add in the hooks to get the information on managed methods from the runtime. Someone can then record a crash on their machine as it is happening, and submit it with a bug report.

I believe that the latter idea would make bug reports an order of magnitude more useful. By removing the difficulty of reproducing crashes, we may save our own developers a lot of time.

Deliverables:

* Get RR debugging of mono working interactively
* Create automated RR client that records and replays mono
* Create infrastructure to use RR client and create self contained "debug me" blob

**Mentors:** Bernhard Urban

### Succinct data structure implementations to replace glib dependencies

**Complexity:** Medium

Bitmask-driven data structures allow for SIMD operations on the data structure's top-level structure schema. They're space-efficient, cache-efficient, and they're easy to debug after a crash because the bitmask and the data structure have a minimal number of pointers.

Offering succinct arrays (no nulls) and other data structures as drop-in replacements might be ways to significantly reduce memory footprint for some specific use cases.

Benchmarking is necessary to find those use-cases.

Deliverables:

* Implement full replacement for GArray and ensure passes GLib GArray tests.

* Benchmark high-allocation places and see if the succinct replacement helps

* (Optional) Implement replacement for ghashtable which supports bare minimum of operations, using CTries

* (Optional) Use CTries in high-contention environments or high-allocation environments and benchmark uses that have savings

**Mentors:** Alexander Kyte

## Platforms and Bindings

### .NET Bindings for Flutter

**Complexity:** Medium

This project will treat Flutter as a platform, and produce a 1:1 mapping of Darts APIs into .NET.   This will allow C# and F# developers to access this library.

This effort would include:

* Create C# bindings for each public type, method and property in Flutter.
* Turn the Flutter library into a loadable module that can be initialized after startup.

This effort would use the Dart compiler to process the Flutter API and output the C# bindings for it, producing a 1:1 mapping.

**Mentors:** Miguel de Icaza

### Continue SEALsharp bindings

**Complexity:** Medium

We have a C# binding for the SEAL homomorphic encryption library.
<https://www.microsoft.com/en-us/research/project/simple-encrypted-arithmetic-library/>

The current status is that we can work with 64-bit ints and we have the beginnings of a Linq Expression analyzer to automate creating encrypted computations.

<https://github.com/lambdageek/sealsharp/tree>

Next steps would be to add more bindings (for example, support for floats and matrices), and to work on automating some of the entropy and relinearization key management by taking advantage of the analyzability of Linq expressions.

**Mentors:** Aleksey Kliger

### Extend Xamarin.Analysis support

**Complexity:** Easy

Xamarin.Analysis is a set of rules for finding common problems in Xamarin apps by inspecting the project, code and/or package.

You can see them at `/Library/Frameworks/Xamarin.iOS.framework/Versions/Current/lib/msbuild/iOS/Xamarin.iOS.Analysis.targets`.

The goal would be to add more rules in `xamarin-macios` based on our existing list or new ideas.

We'd also like to add an automated way to fix the encountered problem.

**Mentors:** Vincent Dondain

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

**Mentors:** Mikayla Hutchinson

### Xamarin.iOS/Xamarin.Mac Roslyn Analyzers

**Complexity:** Medium

Xamarin.iOS and Xamarin.Mac APIs often have custom attributes (you can see some of them [here](https://developer.xamarin.com/guides/cross-platform/macios/binding/binding-types-reference/)).

The idea of this project would be to make new Roslyn Analyzer that would be shipped as Nuggets (hosted in the [xamarin-macios](https://github.com/xamarin/xamarin-macios) repo).

What's especially interesting is the ability to automatically offer code fixes which would greatly help our users.

Example 1: The `[RequiresSuper]` attribute means that you must call the base method when overriding. An analyzer could alert you when an override is missing that base call and offer to add it for you.

Example 2: We use `[Advice]` or `[Obsolete]` to recommend the usage of a better API. Maybe we'd need to create a new attribute in the SDK but it'd be great to have one that has a generic message like "Use '{0}' instead."(translated) and based on {0} (the better API) we could refactor the user's code to indeed use the better API

There are a lot of other things we could do with attributes and we can always include new ones.

**Mentors:** Vincent Dondain

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

If you have questions or suggestions, or would like feedback on your idea, please join us
in [our Discord channels](https://www.mono-project.com/community/help/chat). Various mentors and
students from past years are usually there and can answer questions about the program and about Mono.
Community engagement is essential for a successful Summer of Code, so get involved!

Feel free to file an issue in the relevant GitHub repo if you want to discuss something, even if it's not a bug.

For any questions you may have about the program itself and to talk to the Mono GSoC admin, you can use
[soc@xamarin.com](mailto:soc@xamarin.com).
