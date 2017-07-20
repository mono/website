---
title: "Boo"
lastmodified: '2017-07-20'
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

Boo is an object oriented, statically typed programming language for the Common Language Infrastructure, with a Python-inspired syntax and a special focus on language and compiler extensibility. Features such as type inference everywhere, duck typing on demand, pattern matching and syntactic macros are just a few of the special features Boo offers, in addition to the standard features a modern CLR developer expects (classes, structs, enums, generics, extension methods, async/await and so on.)

It was designed with a strong emphasis on metaprogramming, with language-level support for macros, meta-methods, and AST-transforming attributes to do AOP-style rewriting as a part of the ordinary compile process.

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

-   [booc](https://github.com/boo-lang/boo/wiki/How-To-Compile) - Compile boo code to IL assemblies.
-   [booi](https://github.com/boo-lang/boo/wiki/How-to-Run) - Execute a boo script without first compiling it.
-   [booish](https://github.com/boo-lang/boo/wiki/Interactive-Interpreter) - Interactive interpreter boo shell.

Additional Information
======================

-   [Boo Project Home Page](https://github.com/boo-lang/boo)


