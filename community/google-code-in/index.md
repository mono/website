---
title: Google Code-in
redirect_from:
  - /GoogleCodeIn/
---

Here's are some initial ideas for students ... Most of them are "meta-ideas" that needs to be further detailed and split into (many) individual tasks.

By Category
===========

Code
----

-   Mono Class Library Parameter Names
-   Mono Class Library Unit Tests
-   Mono Command-Line Tools
-   Porting Gtk+ Samples to GtkSharp
-   Gendarme Rules
-   Port and fix existing ASP.NET apps to Linux
-   MonoDevelop bugfixes or enhancements
-   MonoDevelop unit tests

Documentation / Training
------------------------

-   Mono Command-Line Tools
-   Mono API Documentation
-   Porting Gtk+ Samples to GtkSharp
-   Gendarme Rules
-   MonoDevelop documentation and tutorials

Outreach / Research
-------------------

-   Research the most common photo raw formats and recommend a priority list of formats to support.
-   Update and improve the f-spot website
-   Clean up the monodevelop.com wiki as it is fairly dated.
-   Clean up the mono-project wiki
-   Provide links to the various mono packages in different distributions

Quality Assurance
-----------------

-   Mono Class Library Unit Tests
-   Gendarme Rules
-   Improve the unit tests in F-Spot.
-   Improve the unit tests for tomboy-lib (formerly tomboy-library)

User Interfaces
---------------

-   Porting Gtk+ Samples to GtkSharp
-   Create user scenarios for f-spot to help improve searching tags
-   Create mockups for an iOS version of Tomboy
-   Create design suggestions for Rainy. The new online tomboy.

Idea Descriptions
=================

Mono Class Library Parameter Names
----------------------------------

Mono provides many class libraries (assemblies) that are (near 100%) compatible with Microsoft .NET. This is possible because we provide the same API to developers. However, for historic reasons, the parameter names in our class libraries do not always match the one provided by Microsoft.

This is becoming an increased compatibility issue for us since C# version 4 (and all versions of VB.NET) allows developers to use 'named' parameters. In this case having different parameter names will result in compilation errors.

We'll provide a tool (gui-compare) that allow people to spot all different names. The student will review them, fix them in the source code, re-run the unit tests and, when completed, submit patch (diff) to us.

-   Since Mono's class libraries are quite huge this will be split into several, individual tasks.

Port and fix existing libraries and applications to Linux
---------------------------------------------------------

There are a number of popular libraries as well as applications that could be ported trivially to Linux. For the port to be useful, we need both the patches as well as the packaging in RPM form (or DEB form) to easily distribute them to Linux and macOS users.

The task is to port the libraries to Linux by making enough changes to them that they will run out of the box. We can keep the changes as patches to create both RPM and DEB packages and we should also submit them upstream to make sure that future releases of those packages run out of the box on Linux.

Some projects include:

-   NHibernate
-   Orchard
-   NUget

Mono Class Library Unit Tests
-----------------------------

A lot of Mono unit tests date back to the days of .NET 1.0. The collection has grown with time to include 1.1, 2.0 (and service packs), 3.0 (new assemblies), 3.5 (and service packs) to the recently released 4.0. Right now some of our test cases are still checking for 2.0 (or even earlier) specific behavior and do not reflect the exact results of .NET (3.5 or 4.0).

The task is to compile and run Mono unit tests against either .NET 3.5 or 4.0 and fix the assertions to make them run successfully (i.e. no error) on Microsoft Windows. Once successful the student will submit patches to our unit tests.

-   Since Mono's unit tests are quite huge this will be split into several, individual tasks.

Mono Command-Line Tools
-----------------------

Mono provides a lot of development tools, most of them "command-line tools" and written in C#. Almost all of them implement their own way of dealing with command-line options.

The task is to migrate the custom command-line parsing code to use the excellent Mono.Options class. Once migrated the student will verify that the tool's documentation (i.e. the man page) is complete (includes everything the tool supports) then provide a patch (diff) to update the tool(s).

-   Since Mono provide a lots of tools this will be split into several, individual tasks (one complex tool, or a few simple ones).

Mono API Documentation
----------------------

Mono provides a lot of functionality not available in Microsoft .NET (e.g. Gtk#, Cecil...). However documentation for those API is completely missing, scarce or lack examples.

The task is to find (e.g. blog entries, source code) or write some missing documentation for the Mono.\* class libraries. The student will be able to use monodoc to write and submit the documentation.

When no sources of information exist, the idea is to document the class libraries based on the actual code implementation.

This task is limited to Mono specific APIs:

-   Gendarme framework
-   Mono.Cecil framework
-   MonoMac bindings
-   Gnome libraries (Gnome.\*, Gtk.\*, Gdk.\*, Atk.\*, Pango.\*)
-   Cairo
-   Commons.Xml framework
-   Mono.Addins
-   Mono.Math
-   Mono.Security
-   Mono.Unix
-   Mono.Xml

-   Since Mono provide a lot of API this will be split into several, individual tasks (e.g. one namespace).

Porting Gtk+ Samples to GtkSharp
--------------------------------

A lot of sample code exists for Gtk+, most of them written in C or Python. The task is to translate those samples to Gtk# and make these available from our GitHub repository.

-   Since a lot of Gtk+ samples exists this will be split into several, individual tasks.

Gendarme Rules
--------------

Gendarme is a tool to find problems in programs. Gendarme inspects programs and libraries that contain code in ECMA CIL format (Mono and .NET) and looks for common problems with the code, problems that compiler do not typically check or have not historically checked.

The task is to write one (or few similar) Gendarme rule(s) to check for a (task specific) problem. E.g. write a Gendarme rule that implement the logic of FxCop rule [CA1413](http://msdn.microsoft.com/en-US/library/ms182196%28v=VS.80%29.aspx)

The student must write the rule (C#), documentation (in source xmldoc) and unit tests then submit them for review.

-   Many different tasks (i.e. different rules) will be available to students. The difficulty level will vary between the rules and will be noted in each task.

MonoDevelop bugfixes or enhancements
------------------------------------

There are many minor bug reports and suggested enhancements in the MonoDevelop bug trackers for components outside the MD core, such as the C/C++ addin, the VB.NET addin, and so on. Tasks would involve picking a small feature or bug in a specific area, and implementing or fixing it. There will be a large selection of tasks to choose from - both specific suggestions, and "pick a bug" type tasks.

MonoDevelop Source Analysis Rules
---------------------------------

MonoDevelop has a source analysis engine that finds potential issues in source code, underlines them, and offers automatic fixes. Your task would be to write a new rule (you can take inspiration from Gendarme, FXCop, ReSharper, IntelliJ, Eclipse, etc), or improve the accuracy of an existing rule.

MonoDevelop unit tests
----------------------

Write units tests for MonoDevelop features, especially the parsers and completion engines, and the vi editor mode. Simple tests will generally involve writing some input data - for example a C# or XML snippet - and a set of expected values from the parser or completion engine. More advanced tests could involve manipulating the MD API to simulate common tasks, such as creating and compiling projects, and verifying the output.

MonoDevelop documentation and tutorials
---------------------------------------

We would like to have more documentation for MonoDevelop features, and walkthroughs for accomplishing common tasks.

