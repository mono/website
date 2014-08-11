---
title: "Summer2006"
lastmodified: '2006-05-24'
redirect_from:
  - /Summer2006/
---

Summer2006
==========

During the Summer of 2006, the Mono project will be mentoring a group of students as part of Google's Open Source Summer of Code initiative. We thank Google for their financial support.

Last year Summer projects are listed [here](/Summer2005 "Summer2005")

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#a-cil-linker">1 A CIL Linker</a></li>
<li><a href="#aspnet-project-support-for-monodevelop">2 ASP.NET Project Support for MonoDevelop</a></li>
<li><a href="#assembly-browser-addin-for-monodevelop">3 Assembly Browser Addin for MonoDevelop</a>
<ul>
<li><a href="#new-class-wizard">3.1 New Class Wizard:</a></li>
</ul></li>
<li><a href="#bindings-for-gstreamer">4 Bindings for Gstreamer</a></li>
<li><a href="#bittorrent-class-library-clientcore">5 Bittorrent Class Library: Client/Core</a></li>
<li><a href="#bittorrent-class-libraries-gui">6 BitTorrent Class Libraries, GUI</a></li>
<li><a href="#bittorrent-class-libraries-servertracker">7 BitTorrent Class Libraries: Server/Tracker</a></li>
<li><a href="#distributed-transactions">8 Distributed Transactions</a></li>
<li><a href="#elimination-of-redundant-checks-in-jitted-code">9 Elimination of redundant checks in JITted code</a>
<ul>
<li><a href="#deliverables">9.1 Deliverables</a></li>
<li><a href="#project-details">9.2 Project Details</a></li>
</ul></li>
<li><a href="#further-implementation-of-mbuild-build-tool">10 Further implementation of MBuild build tool</a></li>
<li><a href="#gcc-cil-backend">11 GCC CIL Backend</a></li>
<li><a href="#monodevelop-source-code-control-integration">12 MonoDevelop Source Code Control Integration</a></li>
<li><a href="#phpnet-compiler-continuation-to-last-summers-project">13 PHP.NET Compiler (continuation to last summer's project)</a></li>
<li><a href="#strip-controls">14 Strip Controls</a></li>
<li><a href="#visual-basic-compiler">15 Visual Basic Compiler</a></li>
<li><a href="#webparts-implementation">16 WebParts Implementation</a></li>
<li><a href="#x-gl-compositing-for-mono-a-compiz-clr-binding">17 X GL compositing for Mono: a compiz CLR binding</a></li>
</ul></td>
</tr>
</tbody>
</table>

A CIL Linker
============

Student: Jb Evain

Mentor: Miguel de Icaza, Paolo Molaro

The idea is to create a "linker" for assemblies in Mono. The goal is to only ship the minimal possible set of functions that a set of programs might require to run as opposed to the full libraries.

This is convenient in many cases:

-   Embedded systems could continue to work, but not resort to hacks to fit Mono down
-   It could be used to generate libraries for multiple profiles from the same binary: ECMA profile, 1.0 profile, 1.1 profile, 1.1 service pack profile, etc.
-   Applications that embed Mono could reduce the download size by shipping only the bits that they require.

The Mark and Sweep needs to be very inclusive and should be possible to augment it with flags or extra work to do, so the behavior of the program can be customized.

For example, if we were to define an ECMA-basic profile (no Math, Reflection or anything like that, we would create a sample EcmaBasic.cs file that references all the methods in the ECMA basic profile.

Then the linker could be used on the resulting EcmaBasic.dll to produce a minimal set of libraries for mscorlib.dll, System.dll, System.Xml.dll.

It should also be possible to fine-tune the result, by manually listing classes and members that must be extracted.

ASP.NET Project Support for MonoDevelop
=======================================

Student: Michael Hutchinson

Mentor: Lluis Sanchez Gual

Last summer Michael Hutchinson and Blagovest Dachev created a GUI editor for ASP.NET pages. We would like to see a MonoDevelop Add-in that would allow developers to maintain web sites with it.

The add-in can take inspiration from both WebMatrix and the new VS.NET 2005 development style for applications. It should also ideally launch XSP on demand to test drive the pages.

Assembly Browser Addin for MonoDevelop
======================================

Student: Philip Turnbull

Mentor: Lluis Sanchez Gual

The project can be broken down as: 1) Improve Formatting in the ClassPad Component 2) Show Project References in the ClassPad Component 3) Show Base Types in the ClassPad Component 4) Create an Assembly Browser Component 5) Create Separate Assembly Browser Application 6) Create New Class Wizard 7) AssemblyInfo Front-End

ClassPad Component: Firstly, the ClassPad should include support for formatting of members in a user-defined way. My current implementation relies on my own custom formatting rules. The new implementation would extend the Ambience related services so an ambience for ant particular language can be retrieved (the current services only allow for querying the ambience of individual projects). The formatting would be user defined to either the project ambience (i.e. C\#, Boo) or to a generic ambience (similar to standard UML notation). In addition to this, project references, both assembly and other projects, would be shown in the ClassPad. These would be be navigable similar to projects. Also, types in the ClassPad would show a new 'Base Types' node, which would list each type's base types (classes and interfaces).

With the new formatting rules in the ClassPad, the default search behaviour does not work quite as well. The existing behaviour is a straight match with the text of the node. The new proposed behaviour would search nodes based on their 'semantic' name, eg. A search for “GetI” would match both “string GetIcon(string name)” and “GetIcon(name : string) : string”.

 Assembly Browser Component: The major part of the proposed project is the new Assembly Browser Component. This would involve creating a new 'View' that would act similarly to the assembly browser in Visual Studio and SharpDevelop. The implementation would be heavily based on the existing ClassPad code, indeed the existing code would perhaps be made more generic to avoid code duplication. The Assembly Browser would contain all projects and referenced assemblies in the current solution but also allow arbitrary assemblies to be inspected as well. The proposed component would be tightly integrated with the IDE, for example the standard right-click menu on the source view would have a new 'View in Assembly Browser'.

Similarly to SharpDevelop's AssemblyScout addin, methods will be able to be decompiled to ILAsm in the AssemblyBrowser. This will be based on the Mono.Cecil library. This would include support for exporting whole classes or just individual methods to file.

Additionally, embedded resources in assemblies will be viewable in the AssemblyBrowser. The resources can be exported from assemblies. The exporting would support addins, eg. Addins could be added to export images in different formats (PNG, bitmap, JPEG etc) or export string data in different formats (XML, plain-text, ODS etc)

Lastly a stand alone application would be created that would contain just the Assembly Browser container. Thanks to the way SharpDevelop/MonoDevelop is designed, this would be a simple task.

New Class Wizard:
-----------------

Similar to Visual Studio and SharpDevelop, create a 'New Class' wizard to autogenerate code for new classes. This would include choosing base type and interfaces to implement. These base types would be chosen from TreeView widgets. The generated classes would implement the stub for each inherited method, which would just throw a NotImplementedException. The generation of code would be customizable in an options panel, for example, the order of generated methods, whether documentation comments are generated, whether '\#region' comments are generated etc.

AssemblyInfo Front-End: As a lower level priority for the project, someone on the MonoDevelop bug list [2] suggested a new panel in the project properties that would auto-generate the AssemblyInfo.cs file. This would contain the common properties such as Name, Copyright etc. and a path to a public key file for signing the assembly. It would also contain a secting for entering custom attributes if required.

Bindings for Gstreamer
======================

Student: Khaled Abdul Karim Mohammed

Mentor: Aaron Bockover, Mike Kestner

-   Create C\# binding for the GStreamer plugins.
-   Create NUnit Tests for testing the new formats.
-   Try to make the library portable to windows, solaris and others.

Bittorrent Class Library: Client/Core
=====================================

Student: Alan McGovern

Mentor: Miguel de Icaza

An API to bittorrent to use it for downloading and exposing files to the world (tracker included).

The library should

-   Initializing a download from a local torrent file
-   Initializating a download from a remote torrent file.
-   Download pieces of files from other machines on the torrent.
-   Provide pieces of the files to other machines on the torrent.
-   Have an API that exposes the current progress, clients.
-   Have an API to tune the uploads/downloads.
-   A sample command-line client to demostrate it works

BitTorrent Class Libraries, GUI
===============================

Student: Piotr Wolny

Mentor: Miguel de Icaza

See previous entry for details;

This will be a Gtk\# based client for the Bittorrent client and server.

BitTorrent Class Libraries: Server/Tracker
==========================================

Student: Gregor Burger

Mentor: Miguel de Icaza

See previous entry for details.

This component will implement the tracker-side of BitTorrent.

Distributed Transactions
========================

Student: Hugo Matos

Mentor: Raja R Harinath

Mono currently supports Local transactions, implement a daemon that would support multi-process transactions.

Elimination of redundant checks in JITted code
==============================================

Student: Gianluigi Spagnuolo

Mentor: Massimiliano Mantione

Extend the current Array Bounds Check Elimination system to the isinst and null pointer checks.

Deliverables
------------

Add to ABCREM a system for the isinst and null pointer redundant check elimination. Write a paper on the ABCREM internals, for possible future extension to other checks.

Project Details
---------------

For the extension of ABCREM to other checks is necessary to characterize new relations for the isinst and null checks. These new types of relations must be added to those already used by ABCREM, inside the structures in abcremoval.h, integrating them or creating some new structures. We have to modify the build mechanism of 'MonoVariableRelationsEvaluationArea area' and 'MonoAdditionalVariableRelationsForBB additional\_relations', in order to hold the new relations. Then in process\_inst(), in addition to the array accesses, we look for the opcodes introducing isinst and null pointer checks. Then we execute the proper functions that, using the evaluation area and the dominator tree, verify if the check is redundant. That said, I intend to write a paper about the implementation of ABCREM, extending abcrem.txt in the Mono documentation.

Further implementation of MBuild build tool
===========================================

Student: Peter Williams

Mentor: Richard Porter

More information: [here](http://www.newton.cx/~peter/mbuild/handbook/whybother.xhtml)

The chief deliverable for the summer will be a build specification compiler for MBuild. This will take the textual build files, process them into a fully-expanded build graph, and save the result in an efficient on-disk format. (Currently, MBuild processes the textual build files on every invocation and constructs the target graph in memory with a C\# object heirarchy.) The compiler will just be a separate stage of execution in MBuild, not a standalone program. Such a compiler will help clean up MBuild conceptually, because constructing the target graph and traversing it are completely separate steps in MBuild. I think that codifying this separation will also make it easy to implement more complex processing of the build specification; eg, creation of intermediary build targets that the developer shouldn't need to worry about (foo.c -\> foo.o -\> foo). Adding a compiler step will also make MBuild more efficient, because 1) the parsing/construction step will almost always be skipped and 2) the core build engine will be changed to work with integer target IDs instead of textual target names. (The fundamental nature of such a change makes me think that adding this compiler is not a case of premature optimization.) I think this compiler will take about seven weeks to implement: it's a somewhat large change to the codebase, but a lot of its implementation will be refactoring the current MBuild code, and I'm pretty sure that there aren't many subtleties to the compilation step.

A second deliverable will be support for build rules private to individual projects. MBuild is like automake in that it uses prepackaged build rules; however, it is obvious that many projects need custom build rules for miscellaneous tasks. At the moment, MBuild currently does not support a convenient way for specifying and using custom rules in a project. I will develop an infrastructure that supports such rules. If time permits, I will write a System.CodeDom formatter for Boo so that build rules can be written in that language. (Right now I write rules in C\#, but Boo seems like a better language for the build rule code.) This support should take about four weeks to implement. I'm pretty sure that this feature won't involve a whole lot of code when it's done, but I haven't thought about the details of its implementation much and there are a few bootstrapping-related details that may be tricky to resolve.

GCC CIL Backend
===============

Student: Yi Wang

Mentor: Massimiliano Mantione

During the last summer, some progress was achieved in creating a CIL backend for GCC. A backedn that would allow all of the GCC languages to target the Mono CIL intermediate language. But Jey, the developer behind this effort, broke his wrist before the project was completed.

MonoDevelop Source Code Control Integration
===========================================

Student: Thiago Becker

Mentor: Lluis Sanchez Gual

PHP.NET Compiler (continuation to last summer's project)
========================================================

Student: Maria Inmaculada

Mentor: Miguel de Icaza

Complete the third milestone of the existing Mono PHP.NET compiler.

Strip Controls
==============

Student: Matthew Balkam

Mentor: Aaron Bockover

Implement the Winforms 2.0 StripControls.

Visual Basic Compiler
=====================

Student: Rolf Bjarne Kvinge

Mentor: Miguel de Icaza

An implementation of a VB.NET 8 Compiler in VB.

The deliverable for the end of the summer is to have this compiler bootstrap itself.

WebParts Implementation
=======================

Student: Dimitar Dimitrov

Mentor: Gonzalo Paniagua Javier

Implementation of the WebParts classes for ASP.NET.

X GL compositing for Mono: a compiz CLR binding
===============================================

Student: Alp Toker

Mentor: Massimiliano Mantione

Bindings to allow developers to create Compiz extensions with Mono, C\# and Tao.

Deliverables should include a sample plugin that hooks up to all the Compiz events and does something interesting (it does not have to be useful, it has to work).

