---
layout: blog
title: "Mono's 2017 Google Summer of Code"
author: Alexander Kyte
tags: [gsoc]
---

This Summer of Code, the Mono project had many exciting submissions. It's been great to see what our applicants have been able to accomplish. Some were very familiar with the codebases they worked on, while others had to learn quickly. Let's summarize how they spent this summer.

CppSharp Defect Removal And General Feature Work
------------------------------------------------

[Mohit Mohta](http://www.mono-project.com/community/google-summer-of-code/reports/2017/cppsharp-mohit-mohta/) and [Kimon Topouzidis](http://www.mono-project.com/community/google-summer-of-code/reports/2017/cppsharp-kimon-topouzidis/) chose to address a number of bugs and add features to the code of CppSharp. Std::string was added, stacks were fixed, options were added, structure packing was added, and primitive types support was improved. They both seem to have learned a lot about the workflow of methodical debugging of systems code.

Clang Sanitizers
----------------

Many software bugs don't result in immediate errors and crashes. Some corrupt program state in such a way that a cryptic error is seen much later. In the worst case, each such delayed crash may have a different stack trace. Many of these bugs have root causes that can be spotted in a running program the second they go wrong. The tooling to do so has only recently been able to spot race conditions, which can be some of the worst of these bugs. Clang has integrated a number of such sanitizers.

[Armin Hasitzka](http://www.mono-project.com/community/google-summer-of-code/reports/2017/clang-sanitizers/) chose to use clang's runtime sanitizers for race conditions and for memory safety to automatically catch Mono bugs. In his efforts, he ran into false positives and legitimate bugs alike. He fixed a number of bugs, helped silence false positives, and left behind infrastructure to automatically catch regressions as they appear.

CppSharp Qt Bindings And Maintenance
------------------------------------

[Dimitar Dobrev](http://www.mono-project.com/community/google-summer-of-code/reports/2017/cppsharp-dimitar-dobrev/) is familiar to the Mono project. He has done the Google Summer of Code with Mono in 2015, and has helped maintain CppSharp since.

This summer, he sought to commit his time to developing the Qt bindings further. In the development of CppSharp, the problem of mapping C# types onto C++ generics arose. There were many potential solutions, but very few retained the feeling of the underlying API. After some experimentation, the hard problems were solved.

As the summer came to an end, he fixed the minor issues that arose during tests of QtSharp. The burden of maintaining the project and responding to bugs from the community did not stop for Dimiar, resulting in partial completion of milestones yet significant overall contribution. Development of QtSharp proceeds alongside his ongoing maintenance work and contributions.

MonoDevelop C/C++ Extension Feature Enhancements
------------------------------------------------

The CBinding extension for MonoDevelop adds a lot of great functionality for working with C and C++ projects. It is still a work in progress, and [Anubhav Singh](http://www.mono-project.com/community/google-summer-of-code/reports/2017/monodevelop-c-cpp-extension/) wanted to add some more functionality. He focused on bringing support for Windows compilers and for CMake. He also chose this moment to update the extension to reflect the newer APIs of MonoDevelop. In the process, he had to begin the process of upstreaming some changes to MonoDevelop.

C# Compiler Caching with CSCache
--------------------------------

Something often mentioned around a warm laptop with spinning fans is how nice C developers have it. CCache enables someone to recompile large C projects after minor modifications in a very small amount of time. Going beyond the build system skipping recompilation, the system compiler is wrapped by a program that spits back the old output in a fraction of the time that a compiler takes. This is a trick that managed languages haven't learned until now.

[Daniel Calancea](http://www.mono-project.com/community/google-summer-of-code/reports/2017/cscache-report/) created a tool which wraps mcs and understands the commands sent to it. If it is invoked with the same files and the same options twice, it checks that all of the hashes of all of the files are the same between runs. If so, it returns the output of the C# compiler the first time. Equally important is that this tool will return the same return codes as the first run, and will integrate as seamlessly into any build system as ccache does. It even reports the same warnings that the initial compiler did.

Daniel published this tool for Windows and Linux to Nuget.

Import of System.IO.Pipes.PipeStream from CoreFX
------------------------------------------------

Mono's implementation of System.IO.Pipes has historically not had some features available to the CLR. After msbuild was made open source, users found that Mono unfortunately could not build in parallel because of the API differences. CoreFX brought with it the promise of a System.IO.Pipes.PipeStream that would enable parallel msbuild. CoreFX's API surface was not strictly a superset of Mono's though. Mono implemented a couple of endpoints that CoreFX did not, and we used those endpoints in other places in the BCL.

[Georgios Athanasopoulos](http://www.mono-project.com/community/google-summer-of-code/reports/2017/corefx-System.IO.Pipes/) chose to do the work required to make Mono work with CoreFX's PipeStream. Modifying both CoreFX and Mono was required. Mono's build system had to choose to use the new implementation files, rather than looking for them in the BCL directory. His work was a success. Finishing early, he chose to experimentally enable a parallel msbuild and test it. Things seem to be mostly working.

Lamdba Debugger Support
-----------------------

Often when debugging C# code in the middle of a large project, it's important to invoke code to understand how variables are behaving in a segment of code. Sometimes, the code that one wishes to invoke hasn't been written yet. The developer is left squinting at variables, invoking existing methods, and manually running code in their head. Much better would be to enable the developer to write a new function and invoke it on the variables in question. Interpreted languages offer support for this without much trouble usually because code doesn't have as much metadata associated with it, and because they have integrated compilers for the debugged languages.

This summer, [Haruka Matsumoto](http://www.mono-project.com/community/google-summer-of-code/reports/2017/lambda-support-in-debugger-expression-evaluator/) worked on a system that enables developers to use these arbitrary code snippets entered into the debugger. Mono runs the debugger and the debuggee in separate running instances of the runtime. As the running mono runtime for the application being debugged doesn't have access to a C# compiler, this code has to be compiled by the debugger. The debugger uses Roslyn to compile the code segments, and this assembly is sent to the debugged application's runtime.

This is made more difficult by the fact that the debugger is trying to run a Lambda that has access to the variables and methods defined in the functions the debugger is currently debugging. Shorter method names need to resolve to what they would if the original function had used them, and variables should be accessible by name. Issues with private types are potentially unsolvable without special casing, as mono prevents arbitrary code from modifying private fields. Haruka handled these and other difficult considerations, and delivered a very strong prototype of Lambda support in the integrated runtime debugger. It should be immediately useful for anybody who spends a lot of time using mono to debug C# code.

Import Synchronization Primitives from CoreRT
---------------------------------------------

It is often the case that small differences in the implementations of core runtime functions can result in perceived bugs introduced by switching runtimes. The differences are due to depending on API behavior that may not be entirely defined by the specification, but works in a certain case on a certain machine. This sensitivity is nowhere more baffling to debug than around threading and synchronization primitives. The .NET Core Project contains an open-source, cross-platform implementation of C# synchronization primitives. We expect this to receive much community development and user testing. We hoped to import them to gain both consistent behavior and quality.

This summer, [Alexander Efremov](https://github.com/mono/mono/pull/5054) imported EventWaitHandle, AutoResetEvent, ManualResetEvent, Mutex and Semaphore into Mono. He both manually integrated these libraries into Mono and automated the process of building them. System.Private.CoreLib.Native was successfully added to mono. System.Threading was identified as the next API to import, in order to enable importing Thread from CoreFX.


