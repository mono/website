---
layout: obsolete
title: "Boo"
lastmodified: '2005-09-21'
permalink: /old_site/Boo/
redirect_from:
  - /Boo/
---

Boo
===

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#overview">1 Overview</a></li>
<li><a href="#syntax-example">2 Syntax Example</a></li>
<li><a href="#compilersinterpreters">3 Compilers/Interpreters</a></li>
<li><a href="#additional-information">4 Additional Information</a></li>
</ul></td>
</tr>
</tbody>
</table>

Overview
========

Boo is a new object oriented statically typed programming language for the Common Language Infrastructure with a python inspired syntax and a special focus on language and compiler extensibility. Features such as type inference, closures (similar to C\#'s anonymous delegates), duck typing, and syntactic macros are just a few of the features Boo offers that are not found in many currently available CLI languages.

Syntax Example
==============

    namespace BooSyntaxExample

    class NamedClass:
        private name as string

        def constructor (name as string):
            self.name = name

        def ToString():
            return name

    named = NamedClass ('Say my name!')

    print named

Compilers/Interpreters
======================

-   [booc](http://boo.codehaus.org/How+To+Compile) - Compile boo code to IL assemblies.
-   [booi](http://boo.codehaus.org/How+To+Run) - Execute a boo script without first compiling it.
-   [booish](http://boo.codehaus.org/Interactive+Interpreter) - Interactive interpreter boo shell.

Additional Information
======================

-   [Boo Home Page](http://boo.codehaus.org/)


