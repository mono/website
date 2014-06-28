---
layout: obsolete
title: "Release Notes Mono 3.0"
lastmodified: '2013-07-18'
permalink: /old_site/Release_Notes_Mono_3.0/
redirect_from:
  - /Release_Notes_Mono_3.0/
  - /Release_Notes_Mono_2.12/
  - /Release_Notes_Mono_3.0.3/
  - /Release_Notes_Mono_3.0.4/
  - /Release_Notes_Mono_3.0.5/
  - /Release_Notes_Mono_3.0.6/
  - /Release_Notes_Mono_3.0.9/
---

Release Notes Mono 3.0
======================

Mono 3.0 is a portable and open source implementation of the .NET framework for Unix, Windows, MacOS and other operating systems.

Mono 3.0 is an update to [Mono 2.10]({{ site.github.url }}/old_site/Release_Notes_Mono_2.10 "Release Notes Mono 2.10") based on the master branch of github, it is not a minor upgrade to 2.10. Mono 3.0 was released on October 18th 2012.

We will continue to bug fix and update Mono 2.10 for another six months for users that can not upgrade to Mono 3.0.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#30x-series-release-notes">1 3.0.x Series Release Notes</a></li>
<li><a href="#new-in-mono-312">2 New in Mono 3.1.2</a>
<ul>
<li><a href="#bugs">2.1 Bugs</a></li>
</ul></li>
<li><a href="#new-in-mono-311">3 New in Mono 3.1.1</a>
<ul>
<li><a href="#whats-new">3.1 What's new</a></li>
<li><a href="#bug-fixes">3.2 Bug fixes</a></li>
</ul></li>
<li><a href="#new-in-mono-3012">4 New in Mono 3.0.12</a>
<ul>
<li><a href="#whats-new_2">4.1 What's new</a></li>
<li><a href="#bugs_2">4.2 Bugs</a></li>
</ul></li>
<li><a href="#new-in-mono-3010">5 New in Mono 3.0.10</a></li>
<li><a href="#new-in-mono-309">6 New in Mono 3.0.9</a></li>
<li><a href="#new-in-mono-308">7 New in Mono 3.0.8</a></li>
<li><a href="#new-in-mono-307">8 New in Mono 3.0.7</a></li>
<li><a href="#new-in-mono-306">9 New in Mono 3.0.6</a></li>
<li><a href="#new-in-mono-305">10 New in Mono 3.0.5</a></li>
<li><a href="#new-in-mono-304">11 New in Mono 3.0.4</a>
<ul>
<li><a href="#garbage-collector">11.1 Garbage Collector</a></li>
<li><a href="#async">11.2 Async</a></li>
<li><a href="#aspnet">11.3 ASP.NET</a></li>
<li><a href="#other-improvements">11.4 Other improvements</a></li>
<li><a href="#packaging">11.5 Packaging</a></li>
</ul></li>
<li><a href="#new-in-mono-303">12 New in Mono 3.0.3</a>
<ul>
<li><a href="#garbage-collector_2">12.1 Garbage Collector</a></li>
<li><a href="#bug-fixes_2">12.2 Bug Fixes</a></li>
</ul></li>
<li><a href="#new-in-mono-302">13 New in Mono 3.0.2</a>
<ul>
<li><a href="#major-features">13.1 Major Features</a></li>
<li><a href="#bug-fixes-in-302">13.2 Bug fixes in 3.0.2</a></li>
</ul></li>
<li><a href="#new-in-mono-30">14 New in Mono 3.0</a></li>
<li><a href="#major-highlights">15 Major Highlights</a>
<ul>
<li><a href="#c-compiler">15.1 C# Compiler</a>
<ul>
<li><a href="#evaluation-can-now-compile-types">15.1.1 Evaluation can now Compile Types</a></li>
<li><a href="#instance-api">15.1.2 Instance API</a></li>
</ul></li>
<li><a href="#c-interactive-shell">15.2 C# Interactive Shell</a></li>
<li><a href="#45-profile">15.3 4.5 Profile</a></li>
<li><a href="#new-microsoft-open-source-stacks">15.4 New Microsoft Open Source Stacks</a></li>
<li><a href="#garbage-collector_3">15.5 Garbage Collector</a></li>
<li><a href="#runtime-optimizations">15.6 Runtime Optimizations</a></li>
<li><a href="#aspnet_2">15.7 ASP.NET</a></li>
<li><a href="#codecontracts">15.8 CodeContracts</a></li>
<li><a href="#smaller-updates">15.9 Smaller Updates</a></li>
<li><a href="#macos-x">15.10 MacOS X</a></li>
<li><a href="#monodatasqlite">15.11 Mono.Data.Sqlite</a></li>
<li><a href="#c5-library">15.12 C5 Library</a></li>
</ul></li>
<li><a href="#breaking-changes-since-mono-210">16 Breaking Changes Since Mono 2.10</a>
<ul>
<li><a href="#gdb">16.1 GDB</a></li>
<li><a href="#mips-port">16.2 MIPS port</a></li>
<li><a href="#soft-debugger">16.3 Soft Debugger</a></li>
<li><a href="#static-compiler-aot">16.4 Static Compiler (AOT)</a></li>
</ul></li>
<li><a href="#installing-mono-30">17 Installing Mono 3.0</a></li>
<li><a href="#bug-fixes_3">18 Bug Fixes</a></li>
</ul></td>
</tr>
</tbody>
</table>

3.0.x Series Release Notes
==========================

-   [New in 3.0](#new-in-mono-30)
-   [New in 3.0.2](#new-in-mono-302)
-   [New in 3.0.3](#new-in-mono-303)
-   [New in 3.0.4](#new-in-mono-304)
-   [New in 3.0.5](#new-in-mono-305)
-   [New in 3.0.6](#new-in-mono-306)
-   [New in 3.0.7](#new-in-mono-307)
-   [New in 3.0.8](#new-in-mono-308)
-   [New in 3.0.9](#new-in-mono-309)
-   [New in 3.0.10](#new-in-mono-3010)
-   [New in 3.0.12](#new-in-mono-3012)
-   [New in 3.1.1](#new-in-mono-311)
-   [New in 3.1.2](#new-in-mono-312)

New in Mono 3.1.2
=================

This is a bugfix only release.

Bugs
----

10782 - Emit additional sequence points for call entry when needed.

12989 - Loading of nested type of missing type needs to create another missing type.

13110 - Equality structural comparer needs to do recursive comparisons.

13197 - Allow async for explicitly implemented interface methods.

13200 - Implement webrequest cancellation.

13202 - Prefer user operators over predefined operators for binary enum operations too.

New in Mono 3.1.1
=================

What's new
----------

Mono now defaults to sgen

Fixed AOT on OSX 10.9

Update Mono.Cairo to include APIs from cairo 1.10

Update the LLVM used from Nov-2012 to Jul-2013

Several optimizations to improve string performance, exposed by a naive implementation of Sudoku:

-   Enable managed allocation using gsharing
-   Implemented the string allocator for SGen
-   Fixed String.Contains, as it is not supposed to be culture aware (Mono was, so we took a big perf hit, and were wrong)

Added a dummy implementation of System.Net.Http.WebRequestHandler

On iOS, managed-to-native wrappers now follow the native ABI and can be unwinded.

Better FreeBSD support, sgen and dtrace can now be enabled

Bug fixes
---------

-   3324 - Make WebClient report an error when the download aborted prematurely.

-   12457 - Add [Serializable] to X509Certificate2 (added in .NET 4.0)

-   12544 - Fix order of capturing of this inside switch statement.

-   12608 - Rewrite lifted binary operators to match C\# spec more closely.

-   12638 - Fix MethodImplOptions argument checks.

-   12640 - Make ServicePointManager hash on the proxy as well as uri and use\_connect

-   12731 - Emit dwarf line number info using .file/.loc assembler directives on osx.

-   12741 - Fix register allocation for hw remainder opcodes on armv7s.

-   12745 - Block task awaiter until task completes.

-   12762 - Use directly captured this instead of parent reference for nested state machine inside another state machine without anonymous storey.

-   12786 - When unloading domains, free dynamic assemblies first.

-   12799 - Mutate generic catch block type when needed.

-   12856 - Fix MethodInfo::ToString () to properly format generic structs.

-   12889 - Recover more from invalid throw statement.

-   12892 - Path.GetFullPath() may return incorrect relative path under Windows

-   12898 - Verify if the catch type is valid under the method context.

-   12949 - Call correct ApplyToExtraTarget base override.

-   12991 - Do system.object type scan after all references are loaded.

New in Mono 3.0.12
==================

What's new
----------

Added PCL support to xbuild, mono's MSBuild implementation.

Fixed multiple hangs that happen during shutdown or appdomain unload

Merged most of the ARM support for NaCl

mkbundle now uses IKVM.Reflection

Mono is now compatible with OSX 10.9

Bugs
----

-   5904 - Fix incorrect end-of-stream with null callback.

-   10887 - Handle shifts by multiple of 32 correctly.

-   11945 - Better handle default value BigInteger.

-   12329 - Properly handle csc when AOT code using the async keyword

-   12342 - Implement Task::AsyncWaitHandle

-   12349 - Keep cancellation token for all running requests.

-   12361 - Resolve unreachable block with correct flow settings.

-   12394 - Older versions of iOS don't have pthread\_mutexattr\_setpolicy\_np

-   12412 - Fix support for dynamic methods in collect\_method\_images ().

-   12429 - Use a different function for emitting write barriers for gsharedvt types which can handle reference types too.

-   12446 - Run YieldAwaitable tests on default synchronization context.

-   12461 - Make sure the behavior between GetFiles and EnumerateFiles are the same regarding symlinks.

-   12493 - Fix random unit test failures on the bots

-   12494 - Keep the exception object alive during debugger suspensions.

-   12509 - Clear ss\_invoke\_addr when stopping single stepping so runtime invokes don't stop single stepping.

-   12541 - Use the proper value to calculate whenever to do a near call on amd64.

-   12549 - Keep hoisted this when lambda parent is async lambda.

-   12568 - Check class level type parameters used in explicit delegate parameters conversion.

-   12572 - Correct encoding transformation flags for type arguments arrays without dynamic element.

-   12583 - Resolve switch cases without look aheah look-up.

-   12611 - Mark MonoCMethod (runtime subclass of ConstructorInfo) as serializable.

-   12655 - Make the MONO\_DISABLE\_SHARED\_AREA env variable actually work.

New in Mono 3.0.10
==================

A hot-fix release.

Reverted parallel mkbundle.

Fixed duplicated debug symbol problem in the compiler.

New in Mono 3.0.9
=================

Fix gtk+ copy & paste.

Fix debugger support for custom attributes.

Proper stack bounds calculation on windows.

Add partial generic methods to our C\# compiler.

NaCL support for ARM.

Fix LLVM loading on OSX.

New in Mono 3.0.8
=================

Multiple improvements to the BCL to reduce usage of non generic collections and use faster string comparisons.

Optimize large object cloning and boxing.

Multiple changes to bring mono closer to full PCL compatibility.

Add System.WeakReference\<T\>

Sgen can now return memory to the system for

Many compiler fixes for async.

Improved FullAOT support for async.

NaCl build fixes and improvements.

WCF now has cookie support in .net 4.0.

Optimize Marshal.Read/Write methods to avoid a trip to unmanaged when needed.

Optimize LINQ with arrays.

Multiple fixes to the sgen's concurrent collector.

New in Mono 3.0.7
=================

Multiple fixes to the sgen's concurrent collector.

Performance improvements in primitive types parsing.

Add a configuration time option to disable remoting.

Optimize tls lookups on full-aot + arm.

Add a configuration option to disable remoting.

Multiple improvements and bug fixes in culture related code.

Runtime assembly mapping for PCL.

Fix Binder primitive conversion to make .net.

Optimize Activator.CreateInstance ().

Optimize icalls in FullAOT code.

Implement Volatile.Read/Write\<T\> and Interlocked.MemoryBarrier ().

Optimized unmanaged to managed string conversion.

New in Mono 3.0.6
=================

This is another hotfix release. It reverses the visibility change made to Mono.Runtime.GetDisplayName.

New in Mono 3.0.5
=================

This is a hot-fix release. It fixes a crash in the runtime support for generics, which could be triggered by Xamarin Studio.

New in Mono 3.0.4
=================

Garbage Collector
-----------------

Many changes went into our GC implementation. We added long links support to our traditional Boehm collector. As for SGen, it is finally a true concurrent GC, with cementing support. We also fixed several bugs, such as \#9928 pointer free deadlock problem and bugs in mono\_gc\_weak\_link\_get.

Async
-----

Rewrite of async StreamReader/StreamWritter operations to not fail on subsequent async call. Fixes \#9761

ASP.NET
-------

Updated encoding support.

Some minor bug fixes.

Other improvements
------------------

New MONO\_DISABLE\_SHARED\_AREA environment variable lets you turn of the use of shared memory in Mono (used by performance counters and optionally by the io-layer).

Updated EntityFramework version that ships with Mono.

Support for ConnectionLifetime parameter in SqlClient (contributed by 7digital).

Fixed C\# Evaluator Terse reader with loops

Don't report user operator error during probing user conversions. Fixes \#10170.

Add explicit interface GetType implementation to avoid object::GetType become proxy. (C\# compiler fix)

Implement use of \_\_refvalue as an lvalue. Fixes \#10034.

Packaging
---------

We no longer install a /usr/bin/pkg-config on OSX, to stop clashing with Homebrew.

New in Mono 3.0.3
=================

Mono garbage collectors now feature multiple dtrace probes for users on MacOS and Solaris.

Many stability improvements and performance work on Mono's Async support.

Garbage Collector
-----------------

Sgen now has a concurrent GC that can significantly reduce max pauses. This is an experimental feature that is been continuously developed. Click [here](http://schani.wordpress.com/2012/12/21/sgen-concurrent-mark) for more details.

Bug Fixes
---------

[\#8401](https://bugzilla.xamarin.com/show_bug.cgi?id=8401), [\#9247](https://bugzilla.xamarin.com/show_bug.cgi?id=9247), [\#8903](https://bugzilla.xamarin.com/show_bug.cgi?id=8903), [\#9087](https://bugzilla.xamarin.com/show_bug.cgi?id=9087), [\#9225](https://bugzilla.xamarin.com/show_bug.cgi?id=9225), [\#9186](https://bugzilla.xamarin.com/show_bug.cgi?id=9186), [\#9118](https://bugzilla.xamarin.com/show_bug.cgi?id=9118), [\#9137](https://bugzilla.xamarin.com/show_bug.cgi?id=9137), [\#9133](https://bugzilla.xamarin.com/show_bug.cgi?id=9133), [\#9116](https://bugzilla.xamarin.com/show_bug.cgi?id=9116), [\#1446](https://bugzilla.xamarin.com/show_bug.cgi?id=1446), [\#2246](https://bugzilla.xamarin.com/show_bug.cgi?id=2246), [\#6918](https://bugzilla.xamarin.com/show_bug.cgi?id=6918), [\#8904](https://bugzilla.xamarin.com/show_bug.cgi?id=8904), [\#8927](https://bugzilla.xamarin.com/show_bug.cgi?id=8927), [\#2907](https://bugzilla.xamarin.com/show_bug.cgi?id=2907), [\#8829](https://bugzilla.xamarin.com/show_bug.cgi?id=8829), [\#8786](https://bugzilla.xamarin.com/show_bug.cgi?id=8786)

New in Mono 3.0.2
=================

We are now on a cadence to deliver new Mono features and updates on a regular basis. A month after our last release we are now bringing some 363 commits, with 3055 files changed, 171240 insertions(+), 179104 deletions(-)

Major Features
--------------

'*Reactive Extensions':* Mono now bundles the open sourced Microsoft's [Reactive Extensions](http://rx.codeplex.com/)

**F\# 3.0:** We have updated the bundled F\# compiler on OSX to version 3.0 (tag 3.0.22 from the open source fsharp repository).

**SGen Garbage Collector:** new lazy sweep strategy in Mono's new GC that reduces the GC times for major collections significantly. We have also tuned and improved the collector.

**System.Json:** We reverted System.Json to Mono's version, as it was lighter and tolerates more input than Microsoft's one. We ship System.Json.Microsoft as well for users that want to use the Microsoft stack.

**Runtime:** Many improvements to Mono, better x86 and ARM support across the board.

**NTLM:** Large upgrade to our NTLM stack.

**clang:** Mono now builds with Clang.

**monodoc:** vast improvements to our documentation infrastructure.

Bug fixes in 3.0.2
------------------

[\#8566](https://bugzilla.xamarin.com/show_bug.cgi?id=8566), [\#8565](https://bugzilla.xamarin.com/show_bug.cgi?id=8565), [\#8549](https://bugzilla.xamarin.com/show_bug.cgi?id=8549), [\#8646](https://bugzilla.xamarin.com/show_bug.cgi?id=8646), [\#8592](https://bugzilla.xamarin.com/show_bug.cgi?id=8592), [\#8561](https://bugzilla.xamarin.com/show_bug.cgi?id=8561), [\#8559](https://bugzilla.xamarin.com/show_bug.cgi?id=8559), [\#8557](https://bugzilla.xamarin.com/show_bug.cgi?id=8557), [\#8553](https://bugzilla.xamarin.com/show_bug.cgi?id=8553), [\#8533](https://bugzilla.xamarin.com/show_bug.cgi?id=8533), [\#8502](https://bugzilla.xamarin.com/show_bug.cgi?id=8502), [\#8468](https://bugzilla.xamarin.com/show_bug.cgi?id=8468), [\#8449](https://bugzilla.xamarin.com/show_bug.cgi?id=8449), [\#8448](https://bugzilla.xamarin.com/show_bug.cgi?id=8448), [\#8414](https://bugzilla.xamarin.com/show_bug.cgi?id=8414), [\#8399](https://bugzilla.xamarin.com/show_bug.cgi?id=8399), [\#8385](https://bugzilla.xamarin.com/show_bug.cgi?id=8385), [\#8384](https://bugzilla.xamarin.com/show_bug.cgi?id=8384), [\#8383](https://bugzilla.xamarin.com/show_bug.cgi?id=8383), [\#8366](https://bugzilla.xamarin.com/show_bug.cgi?id=8366), [\#8334](https://bugzilla.xamarin.com/show_bug.cgi?id=8334), [\#8320](https://bugzilla.xamarin.com/show_bug.cgi?id=8320), [\#8312](https://bugzilla.xamarin.com/show_bug.cgi?id=8312), [\#8285](https://bugzilla.xamarin.com/show_bug.cgi?id=8285), [\#8283](https://bugzilla.xamarin.com/show_bug.cgi?id=8283), [\#8263](https://bugzilla.xamarin.com/show_bug.cgi?id=8263), [\#8232](https://bugzilla.xamarin.com/show_bug.cgi?id=8232), [\#8156](https://bugzilla.xamarin.com/show_bug.cgi?id=8156), [\#8037](https://bugzilla.xamarin.com/show_bug.cgi?id=8037), [\#7965](https://bugzilla.xamarin.com/show_bug.cgi?id=7965), [\#6650](https://bugzilla.xamarin.com/show_bug.cgi?id=6650), [\#5760](https://bugzilla.xamarin.com/show_bug.cgi?id=5760), [\#4587](https://bugzilla.xamarin.com/show_bug.cgi?id=4587), [\#3582](https://bugzilla.xamarin.com/show_bug.cgi?id=3582), [\#3275](https://bugzilla.xamarin.com/show_bug.cgi?id=3275), [\#2471](https://bugzilla.xamarin.com/show_bug.cgi?id=2471) and [\#2190](https://bugzilla.xamarin.com/show_bug.cgi?id=2190)

New in Mono 3.0
===============

Major Highlights
================

C\# Compiler
------------

Mono now has a complete C\# 5.0 compiler with [asynchronous programming support](http://msdn.microsoft.com/en-us/vstudio/async.aspx).

Our C\# compiler has now completed its migration from using System.Reflection.Emit as its code generation backend to use the IKVM.Reflection API. This functionality was previewed in Mono 2.10 and is now the default. With this functionality, developers can use any mscorlib that they want (for example the MicroFramework one, or a custom one) without having to build a custom compiler. We were able to eliminate the multiple executables for the compiler, and unify all the compilers into one as well as reducing our build times significantly.

**gmcs**, **dmcs** and **smcs** are now merely aliases to call the **mcs** compiler with the proper -sdk flag.

Tool/Library

Purpose

Profile

New Backend

2.10 Backend

**gmcs**

C\# Compiler

2.0

IKVM.Reflection

System.Reflection 2.0

**dmcs**

C\# compiler

4.0

IVKM.Reflection

System.Reflection 4.0

**smcs**

C\# Compiler

2.1 (Silverlight, MonoTouch, MonoDroid)

IKVM.Reflection

System.Reflection 2.0

**mcs**

C\# Compiler

Any profile, any mscorlib

IKVM.Reflection

IKVM.Reflection

**csharp**

Interactive C\# Shell/REPL

4.5

System.Reflection 4.5

System.Reflection 4.0

**Mono.CSharp**

C\# Compiler as a Service

2.0, 2.1 and 4.0.

System.Reflection 4.0

System.Reflection

System.Reflection is still used as a backend for the compiler as a service and the [C\# interactive shell](/index.php?title=CSharpRepl&action=edit&redlink=1 "CSharpRepl (page does not exist)").

### Evaluation can now Compile Types

The Evaluator.Eval () API is no longer limited to expressions and statements, you can now pass entire namespace, class, interface, struct definitions as a string and have the result get compiled.

This extends to the **csharp** command:

``` csharp
csharp> class X { public int a; }
csharp> var t = new X () { a = 1 };
csharp> print (t.a);
1
csharp>
```

### Instance API

The compiler as a service exposed by the Mono.CSharp library is no longer limited to be a global compiler, now you can instantiate multiple scopes for the compiler, each having its own set of localized types and global variables.

For example, the following sample assigns a string in one context and an int in another one:

``` csharp
using System;
using Mono.CSharp;
 
class MyWorld {
       public Evaluator Evaluator;
 
       public MyWorld (string [] args)
       {
               var r = new Report (new ConsoleReportPrinter ());
               var cmd = new CommandLineParser (r);
 
               var settings = cmd.ParseArguments (args);
               if (settings == null || r.Errors > 0)
                       Environment.Exit (1);
 
               Evaluator = new Evaluator (settings, r);
       }
}
 
class X {
       static int Main (string [] args)
       {
               var first = new MyWorld (args);
               var second = new MyWorld (args);
 
               first.Evaluator.Run ("var Demo = \"hello, world\";");
               second.Evaluator.Run ("var Demo = 1;");
               first.Evaluator.Run ("print (Demo);");
               second.Evaluator.Run ("print (Demo);");
               return 0;
       }
}
```

C\# Interactive Shell
---------------------

New convenience function print, can be used instead of Console.WriteLine

Additionally, the C\# interactive shell will by default use a terse syntax that does not require a semicolon at the end of an expression, for example:

``` csharp
csharp> 1 + 2
3
csharp>
```

4.5 Profile
-----------

The 4.5 Profile is a strict superset of the 4.0 API and is now the default profile.

Because 4.5 API is a strict superset of 4.0 API they both share the same assembly version number, so we actually install the 4.5 library into the GAC.

Some of the changes in the 4.5 API family include:

-   New Async methods
-   WinRT compatibility API
-   Newly introduced assemblies (System.Net.Http, System.Threading.Tasks.Dataflow)

New Microsoft Open Source Stacks
--------------------------------

We now include the following assemblies as part of Mono from Microsoft's [ASP.NET WebStack](http://aspnetwebstack.codeplex.com/):

-   System.Net.Http.Formatting.dll
-   System.Web.Http.dll
-   System.Web.Razor.dll
-   System.Web.WebPages.Deployment.dll
-   System.Web.WebPages.Razor.dll
-   System.Web.WebPages.dll
-   System.Web.Mvc.dll
-   System.Json.dll (Previously available in Mono, but now replaced with Microsoft's implementation)

We also bundle the recently open sourced Entity Framework and

-   EntityFramework.dll

Garbage Collector
-----------------

SGen now has a new task management system that allows it to easily scale new GC-related tasks across multiple CPUs if available:

-   SGen on SMP systems is able to distribute more work across the worker threads. Previously only the mark phase was distributed.
-   SGen is now able to perform parallel collection in the nursery.
-   SGen has been ported to Win32
-   SGen has been ported to the MIPS platform
-   Precise stack scanning has been improved considerably, and it is now supported on x86 and ARM.
-   On OSX, SGen now uses Mach APIs directly to speedup some tasks in the garbage collector.

Runtime Optimizations
---------------------

Implemented fast version of ThreadLocal\<T\> (it is now a low-level intrinstic operation)

List\<T\> optimizations

Support for new attributes to force inlining.

**Major change in Mono** to support the full table of Unicode surrogate characters. This code was written by Damien Diederen and David Mitchell from Logos software.

Runtime supports deferred attaching to the process (when using suspend=n,server=y the runtime collects metadata until a debugger is attached).

Implement tail call optimizations on PowerPC for F\# (Bug \#664631)

New profiler that can be used with Intel's VTune Amplifier Profiler.

Support for System.Net.NetworkInformation.NetworkChanged events on Linux.

New tool: crlupdate this is the Mono Certficate Revocation List Downloader and Updater and can be used to download of new, or update of existing, Certficate Revocation List (CRL) associated with the certificates present in the user (default) or machine stores. The CRL present in the stores are used to determine the validity of unexpired, trusted X.509 certificates.

ASP.NET
-------

Bring the error page to the new millenium.

CodeContracts
-------------

Alexander Chebaturkin has implemented initial version of static Code Contract analyser as part of SoC 2011.

Smaller Updates
---------------

Partial support for Portable Class Libraries (details)

Updated Unicode tables, fixes long-standing 480178

MacOS X
-------

We continue to expand significantly our support for MacOS X and iOS.

Mono can now be compiled by users as a 64-bit binary. Mono still ships as a 32-bit binary, as most libraries that exist today for Mono run only in 32 bits.

DriveInfo now returns correct information on OSX.

Mono.Data.Sqlite
----------------

It is now possible to configure the threading model for SQLite using the SetConfig method in the SQLiteConnection class.

Supports iOS crypto APIs.

C5 Library
----------

We have updated the venerable C5 library to the latest version.

Breaking Changes Since Mono 2.10
================================

In order to be compatible with Microsoft .NET's behavior, exceptions thrown in object finalizers now cause a full runtime abort. This behavior was already present for thread pool threads, but hadn't been enabled for the finalizer thread yet.

Generally, one should avoid exceptions in finalizers entirely. If you must use them, catch them so that they do not terminate the application.

GDB
---

-   GDB support has been extended with a new gdb hook that is aware of the SGenGC internals.
-   Added pretty printers for more runtime data structures like MonoVTable to the mono gdb mode.

MIPS port
---------

The MIPS port is now complete, it can do a full bootstrap, and run the runtime/corlib test suites.

Soft Debugger
-------------

-   Single stepping is now implemented using breakpoints in most cases, speeding it up considerably.
-   Calls to System.Diagnostics.Debugger:Log()/Break () are now routed to the debugger using new UserLog/UserBreak event types.
-   S390x is now supported (Neale Ferguson).
-   MIPS is now supported.
-   Added new methods to Mono.Debugger.Soft and the runtime to decrease the amount of packets transmitted between the debugger and the debuggee. This significantly improves performance over high latency connections like USB.
-   Many bug fixes.

Static Compiler (AOT)
---------------------

Made changes to some AOT data structures to reduce their size, especially when using generics. This reduces the size of an mscorlib AOT image by about 1-2%.

Many changes to the class libraries allow more core Generics code to run on systems that do not support JIT compilation.

Installing Mono 3.0
===================

**Binary Packages and Source Code Downloads:**

    Source code and pre-compiled packages for Linux, Solaris, 
    MacOS X and Windows are available from our web site from 
    the Downloads section.

**Quick source code installation:**

    If we have no packages for your platform, installing from 
    source code is very simple.   

Compile libgdiplus to support System.Drawing:

``` bash
    $ tar xjvf libgdiplus-3.0.tar.bz2
    $ cd libgdiplus-3.0
    $ ./configure
    $ make
    $ make install
```

Then compile Mono itself:

``` bash
    $ tar xjvf mono-3.0.tar.bz2
    $ cd mono-3.0
    $ ./configure
    $ make
    $ make install
```

Bug Fixes
=========

-   *mdoc update* has been fixed so that *-fno-assembly-versions* and *--delete* interact properly, and delete XML types and members which do not exist in the target assembly. This allows copying e.g. [corlib/Documentation/en](https://github.com/mono/mono/tree/master/mcs/class/corlib/Documentation/en), processing *en* against the Silverlight-profile *mscorlib.dll*, and removing all types and members which don't exist in the Silverlight profile.


