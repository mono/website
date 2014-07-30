---
title: "Old Visual Basic"
lastmodified: '2007-01-23'
permalink: /archived/Old_Visual_Basic/
redirect_from:
  - /Old_Visual_Basic/
---

Old Visual Basic
================

The following text refers to the Old Mono Basic compiler, an effort that has now been abandoned in favor of a new compiler written completely in VB.NET by Rolf.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#the-compiler">1 The Compiler</a></li>
<li><a href="#compiler-status">2 Compiler Status</a></li>
<li><a href="#runtime-status">3 Runtime Status</a></li>
<li><a href="#team">4 Team</a></li>
</ul></td>
</tr>
</tbody>
</table>

The Compiler
------------

MonoBASIC (mbas) is a CIL compiler for the VisualBasic.NET language, an extended version of Visual Basic.

Applications developed on Windows with vbc can execute on Mono and applications compiled with 'mbas' can be executed on .NET runtime.

mbas is based on mcs - Mono's C\# compiler. It is under active development and is available as an alpha preview on the Mono distribution.

Compiler Status
---------------

Support for following features is complete:

-   Namespaces
-   Module, Class, Struct, Enum
-   Field, Function, Sub and Properties
-   Parameter passing between methods
-   Object creation
-   Delegates and Events
-   Statements : Assignment, Conditional, Loop statements.
-   Expressions :
-   Conversions

The above features are fully implemented and are being checked for conformance to MS's implementation.

Runtime Status
--------------

A complete runtime for running Visual Basic.NET applications on Mono was contributed by [Mainsoft](http://www.mainsoft.com) in Java and has been ported to C\#. This allows applications compiled using Microsoft's Visual Basic.NET compiler to run on Mono.

Team
----

-   Rafael "Monoman" Teixeira
-   B Anirban
-   Jambunathan K
-   Marco Ridoni
-   Dennis Hayes
-   Jochen Wezel
-   Team MonoBASIC Brasil
    -   Alexandre Rocha Lima e Marcondes
    -   Maverson Eduardo Schulze Rosa
    -   Aldo Monteiro
    -   Renato Suga
-   Manjula GHM
-   Satya Sudha K


