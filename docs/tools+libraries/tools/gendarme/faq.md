---
title: Gendarme FAQ
redirect_from:
  - /Gendarme.FAQ/
---

General
=======

Is Gendarme a C# source checking tool ?
----------------------------------------

Not directly. [Gendarme](/docs/tools+libraries/tools/gendarme/) does **not** work on source code but on compiled assemblies. Once compiled (into Intermediate Language, **IL**) C# code looks identical to any other (compiled) .NET language. Hence [Gendarme](/docs/tools+libraries/tools/gendarme/) is a .NET static assembly analyzer and is not language specific.

Which versions of the .NET framework are supported ?
----------------------------------------------------

For analysis [Gendarme](/docs/tools+libraries/tools/gendarme/) can process any .NET assembly (that [Cecil](/docs/tools+libraries/libraries/Mono.Cecil/) can read), back to the original 1.0 if you need. Rules are smart enough to disable themselves if the runtime targeted by the analyzed assembly does not support the feature under scrutiny (i.e. there is no performance degradation to use every rule versus a set of 1.x rules).

However in order to **execute** [Gendarme](/docs/tools+libraries/tools/gendarme/) you'll need either Mono (same version) or the .NET framework 3.5 since [Gendarme](/docs/tools+libraries/tools/gendarme/) use some recent (C# 3) features such as LINQ.

Usage
=====

When should I use Gendarme ?
----------------------------

Some of [Gendarme](/docs/tools+libraries/tools/gendarme/)'s rules are better suited in early stage of projects (e.g. design rules). Others can be useful anytime (e.g. bad practice) and some are better suited when the project is stable enough to be released. So you'll gain more if you start using [Gendarme](/docs/tools+libraries/tools/gendarme/) early but you can still benefit from it anytime.

I maintain of old code base. Is it too late to start using Gendarme ?
---------------------------------------------------------------------

No, but at this stage you might want to consider using a subset of the rules that won't break binary compatibility of your assemblies.

I'm scripting Gendarme, what are the different exit code of the console runner ?
--------------------------------------------------------------------------------

**0** : The runner returns 0 when no error has occurred. If some code was analyzed then this also means that no defects were found and reported.

**1** : The runner execution was successful but either some defects where found or no assembly was specified.

**2** : The runner execution was interrupted by I/O errors (e.g. missing files).

**3** : The runner founds errors in the (default or user supplied) configuration files. Specific error messages should be printed on the console.

**4** : The runner execution was interrupted by a non-handled exception. This is likely a bug inside Gendarme and should be reported on the mailing-list.

Features
========

Do I need debugging symbols to use Gendarme ?
---------------------------------------------

No, debugging symbols are not required to use [Gendarme](/docs/tools+libraries/tools/gendarme/). The most useful aspect of debugging symbols is that, when available, reports can include the source file and line numbers (when applicable) for defects found during the analysis.

A few rules (e.g. `RemoveUnusedLocalVariables`) might turn themselves off if debugging symbols are not available. Others will use the extra information provided (e.g. variable names) and, in a few cases, it could also affect the number of false positives.

Which symbols format are supported ?
------------------------------------

[Gendarme](/docs/tools+libraries/tools/gendarme/) will read and use the MDB (mono debug) format when available (either when executed on Mono or MS runtime). The PDB (MS debug) format can also be used when executed on the MS runtime. The format selection and loading of symbols is transparent to [Gendarme](/docs/tools+libraries/tools/gendarme/)'s end users.

Why are source line numbers imprecise ?
---------------------------------------

Line numbers, like source file names, are not part of an assembly metadata. They are part of the debugging symbols that you can, optionally, generate when compiling your assemblies.

The symbols files structure is based on **sequence points**. Each **sequence point** is related to an IL instructions. When [Gendarme](/docs/tools+libraries/tools/gendarme/) finds a defect, and debugging symbols are available, it will find the corresponding **sequence point** and extract the source file, line and column numbers.

Now many IL instructions do not have their own **sequence point**. Also several defects are not related to IL instructions (e.g. methods, type, assemblies-level defects). In such case [Gendarme](/docs/tools+libraries/tools/gendarme/) will *try to approximate* the location of the defect. But since [Gendarme](/docs/tools+libraries/tools/gendarme/) never reads source files (or even requires them to be available) the result will be more or less precise.

Why can't I see the source file names or line numbers associated with a defect ?
--------------------------------------------------------------------------------

There can be several reasons for this. First make sure the debugging symbols are available for the assemblies being analyzed. [Gendarme](/docs/tools+libraries/tools/gendarme/) requires either a **.mdb** or **.pdb** to be located in the same directory as the matching **.exe** or **.dll** files. Without them [Gendarme](/docs/tools+libraries/tools/gendarme/) won't be able to report the source files (or line numbers) for any defect.

If debugging symbols are present then ensure that **Mono.Cecil.Pdb.dll** (under Windows for .pdb support) or **Mono.Cecil.Mdb.dll** (under Linux or Windows for .mdb support) is present in the [Gendarme](/docs/tools+libraries/tools/gendarme/) installation directory. The installer should have provided them automatically - but a manual installation (or compiling from source code) could be missing them.

If some defects, located in the same assembly, have source file names (or line numbers) then your setup should be correct. What's happening is likely a lack of a matching **sequence point** in the debugging symbols (see previous answer about them). In some rare circumstances it could be possible that no **sequence point** could be found. This can occurs on types without any methods (or only abstract methods) since **sequence points** are associated with IL.

Finally it could be a bug (e.g. the rule does not report the *right* target as the defect). If you believe this is the case then fill a bug report including both assembly and the debugging symbols. Also provide the defect location (e.g. method name) and rule where this occurs so we can track it down.

Why are defects decorated using `[SuppressMessage]` attributes still showing in my reports ?
--------------------------------------------------------------------------------------------

Make sure your project was compiled with the **CODE_ANALYSIS** symbol defined. Otherwise the `[SuppressMessage]` attribute wont be compiled inside the assembly binary (i.e. there's a `[Conditional]` attribute on the type.). That would makes it impossible for [Gendarme](/docs/tools+libraries/tools/gendarme/) to ignore the defects.

Rules
=====

What are rules
--------------

Basically a rule is a piece of code that a runner executes over a set of assemblies in order to find some potential defects. Rules are grouped together in assemblies that perform similar analysis (e.g. [performance rules](/docs/tools+libraries/tools/gendarme/rules/performance/)).

Rule X checks for something that can't happen using C#
-------------------------------------------------------

Some rules (e.g. `FinalizersShouldCallBaseClassFinalizerRule`) checks for condition that cannot occurs in C# (and/or other languages) compiled assemblies. However if this condition can occurs by using IL, either directly (assembler) or indirectly (generated code), or by using some other .NET languages then the rule is still useful in [Gendarme](/docs/tools+libraries/tools/gendarme/). In other words C# != .NET :-)

Results
=======

Can I reduce false positives ?
------------------------------

Yes. The first and easiest way applies to MS compilers users (at least CSC). When used without `/o` (optimize) the compilers can emit very ugly (but still legal) IL. This includes additional variables (that can be reported as unused), unneeded cast (also reported as defects) and complex branches that can be misinterpreted.

The second way is to ignore some results.This can be done using ignore lists (see [example](https://github.com/mono/mono-tools/blob/master/gendarme/self-test.ignore)) and used with the console runner (`--ignore ignore-file`). It's also possible to filter defects based on their severity (`--severity=*`) and confidence levels (`--confidence=*`).

