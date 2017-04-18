---
title: Gendarme Development FAQ
redirect_from:
  - /Gendarme.Development.FAQ/
---

General
=======

Can I have my own, private, Gendarme rules ?
--------------------------------------------

Of course. From the beginning [Gendarme](/docs/tools+libraries/tools/gendarme/) framework was designed for that very purpose. [Gendarme](/docs/tools+libraries/tools/gendarme/) own rules are separated from its framework (and runners) logic to ensure this scenario will always works.

Can I use something other than C# to write rules ?
---------------------------------------------------

Yes you can. However such rules have a very low chance of being accepted into [Gendarme](/docs/tools+libraries/tools/gendarme/) itself since the extra dependencies (e.g. the compiler) would add a burden to our parent package, **mono-tools**, and make it difficult to build and package.

When should I write an engine ?
-------------------------------

Maybe never :-) Seriously engines grows from the frustration of writing **many** rules and finding too much duplication inside them. Even then we must ensure that the new engine, under normal circumstances, provide a net gain (e.g. performance) over the existing duplication. Other (simpler) solutions to the same problem are to use helpers classes and/or rocks (i.e. extension methods).

Where can I ask technical questions about Gendarme ?
----------------------------------------------------

Many [Gendarme](/docs/tools+libraries/tools/gendarme/) developers are on [Chat](/community/help/chat/), channel **#gendarme** on **GimpNET**. You can also join the [Gendarme Google group](http://groups.google.com/group/gendarme) and email your questions to its mailing-list.

If your questions are related to [Cecil](/docs/tools+libraries/libraries/Mono.Cecil/) then you should send them to the [Cecil Google group](http://groups.google.com/group/mono-cecil?hl=en).

Building
========

How can I build Gendarme ?
--------------------------

There are several ways. The main, totally supported, way is to use the provided Makefile.

Why Makefiles ?
---------------

-   Because it is nearly universal;
-   It's what [Gendarme](/docs/tools+libraries/tools/gendarme/) need to exists inside **mono-tools** and get packaged across several Linux distributions;
-   It's the only configuration that is automatically tested by **monobuild** (our continuous integration bots).

Which version of Mono is required ?
-----------------------------------

The same version of Gendarme - i.e. if you want to build Gendarme 2.2 then you need Mono 2.2. It's likely that older versions will also works but this cannot be guaranteed.

Can I use MonoDevelop to build Gendarme ?
-----------------------------------------

Yes. A [MonoDevelop](http://www.monodevelop.org) solution and project files are available in our [SourceCodeRepository](/community/contributing/source-code-repository/). However since this is **not** the main build mechanism being used its likely that some files (rules or tests) could be missing. I.e. you may have to adjust the solution / project to make it work.

Can I use Visual Studio to build Gendarme ?
-------------------------------------------

Yes, but you'll need VS.NET 2010 (or later) in order to compile the solution (a C# 4 compiler is **required**). Note that, just like [MonoDevelop](http://www.monodevelop.org), it is likely that the solution and project files in our [SourceCodeRepository](/community/contributing/source-code-repository/) could be out of date (e.g. missing some files).

Contribute
==========

How can I contribute a new rule ?
---------------------------------

1.  Define your idea, i.e. what the rule is about.
2.  *(optional but recommended)* Send an email to [Gendarme Google group](http://groups.google.com/group/gendarme) to solicit feedback and comments. You can go ahead while waiting for feedback.
3.  Develop the rule. We recommend writing the "core" unit tests before the rule.
4.  Test the rule
    1.  against your unit tests
    2.  against defects that Gendarme can find in your rule (*aka* `make self-test`)
    3.  against a large chunk of code (e.g. Mono 2.0 class libraries)

5.  Fix failures (i.e. things that should be reported as defects) and false positives (i.e. things that should not be reported as defects)
6.  Create a patch (unified diff) and sent it to the [Gendarme Google group](http://groups.google.com/group/gendarme) for review. This patch should include:
    1.  The source code for the new rule, including its documentation (XML doc in source)
    2.  The unit tests
    3.  Makefile integration (it should simply be adding the 2 files to Makefile.am)
    4.  ChangeLog entries (for both the rule and tests)

Can I use C# 3 ?
-----------------

Yes, [Gendarme](/docs/tools+libraries/tools/gendarme/) already use C# 3 features like extension methods and LINQ. This is not a problem since Mono support it\* and [Gendarme](/docs/tools+libraries/tools/gendarme/) can requires the (released) Fx 3.5 for Windows users. \*unless there is a known issue that makes the code incompatible between Mono and MS runtimes.

Can I use C# 4 ?
-----------------

Yes, starting with version 2.11 [Gendarme](/docs/tools+libraries/tools/gendarme/) can use C#4 features as long as the new Mono C# compiler (mcs) support them. Just like C# 3 (or any other features) it is important to be able to build [Gendarme](/docs/tools+libraries/tools/gendarme/), for both testing and packaging, on the two .NET runtimes.

