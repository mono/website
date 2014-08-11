---
title: "JScript"
lastmodified: '2008-02-10'
redirect_from:
  - /JScript/
---

JScript
=======

**JScript.NET compiler is not currently supported in Mono**

There is no active maintainer, and there is no active development on it. Chances are that we will focus on a new Javascript implementation based on the DLR in the future, but there are no news at this point

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#introduction">1 Introduction</a></li>
<li><a href="#status">2 Status</a></li>
<li><a href="#future-plans">3 Future Plans</a></li>
<li><a href="#working-with-mjs">4 Working with mjs</a>
<ul>
<li><a href="#how-to-get-the-compiler">4.1 How to get the compiler</a></li>
<li><a href="#how-mjs-is-implemented">4.2 How mjs is implemented</a></li>
<li><a href="#how-to-contribute">4.3 How to contribute</a></li>
<li><a href="#submitting-bug-reports">4.4 Submitting bug reports</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

### Introduction

Mono's support for [JScript .NET](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/jscript7/html/jsorijscript.asp) is no longer under development

Originally, we were targeting the [ECMAScript](http://www.ecma-international.org/publications/standards/Ecma-262.htm) language specification published by [Ecma International](http://www.ecma-international.org/)in the standard ECMA-262.

The JScript's support it's divided in two areas:

1.  **Compiler.**
2.  **Runtime support.**

### Status

We are using Mozilla's JavaScript [test suite](http://www.mozilla.org/js/tests/library.html) with some small modifications and a custom runner for testing. It can be found at directory **mcs/class/Microsoft.JScript/Test/Mozilla**.

The results are: 8640 successful tests out of 8917 (96.89%).

### Future Plans

We are working toward being full ECMAScript-262 compliant at compiler and runtime level. But also we want to include MS proposed extensions for ECMAScript4:

           Enumerations: http://msdn2.microsoft.com/en-us/library/y94acxy2.aspx

           Constants: http://msdn2.microsoft.com/en-us/library/7t07247t.aspx

           Class based object oriented programming:
                   class declaration: http://msdn2.microsoft.com/en-us/library/ezts5hx6.aspx
                   interface declaration: http://msdn2.microsoft.com/en-us/library/h30d6hy0.aspx
                   function_get: http://msdn2.microsoft.com/en-us/library/77kz8hy0.aspx
                   function_set: http://msdn2.microsoft.com/en-us/library/6ysbstsx.aspx
                   static statement: http://msdn2.microsoft.com/en-us/library/7k208hb5.aspx
                   expando modifier: http://msdn2.microsoft.com/en-us/library/ch149y3b.aspx
                   super modifier: http://msdn2.microsoft.com/en-us/library/f3cbk963.aspx
                   public modifier: http://msdn2.microsoft.com/en-us/library/0cs1ax5t.aspx
                   private modifier: http://msdn2.microsoft.com/en-us/library/52zye4wa.aspx
                   protected modifier: http://msdn2.microsoft.com/en-us/library/x35feb9t.aspx
                   internal modifier: http://msdn2.microsoft.com/en-us/library/ah1b9xxb.aspx
                   abstract modifier: http://msdn2.microsoft.com/en-us/library/a2fb5y72.aspx
                   final modifier: http://msdn2.microsoft.com/en-us/library/47ezsw2s.aspx
                   hide modifier: http://msdn2.microsoft.com/en-us/library/1k022k51.aspx
                   override modifier: http://msdn2.microsoft.com/en-us/library/2wte5sx9.aspx
                   static modifier: http://msdn2.microsoft.com/en-us/library/f4ewhdb8.aspx

           Conditional compilation.
                   @cc_on: http://msdn2.microsoft.com/en-us/library/eb0w91wa.aspx
                   @if and friends: http://msdn2.microsoft.com/en-us/library/ct27x3xa.aspx
                   @set: http://msdn2.microsoft.com/en-us/library/k0h7dyd7.aspx
                   @debug: http://msdn2.microsoft.com/en-us/library/2a464tzs.aspx
                   @position: http://msdn2.microsoft.com/en-us/library/1fkt8wb5.aspx
                   Conditional compilation variables: http://msdn2.microsoft.com/en-us/library/7142yyxw(VS.80).aspx

 But that should not stop you from implementing new cool features like:

-   [E4X](http://www.ecma-international.org/publications/standards/Ecma-357.htm) support (ECMAScript for XML).
-   [Continuations](http://wiki.apache.org/cocoon/RhinoWithContinuations) support.
-   Access to Mono's base class library.
-   Implement a [MonoDevelop](http://www.monodevelop.com/) add-in, which should include an interactive shell.
-   Emit debug info.
-   Microsoft extensions like typed variables.

### Working with mjs

#### How to get the compiler

Mono's JScript compiler is part of the 'mcs' module and is built by default, it's distributed under the name of **mjs**.

#### How mjs is implemented

Mono's JScript compiler is written in C\#, and it's constructed under the standard compiler architecture, which means that it is separated into phases. The current phases are tokenizing, parsing, semantic analysis and code generation.

We use a handcoded tokenizer and parser which was ported from Mozilla's [Rhino](http://www.mozilla.org/rhino/) compiler, after that we build an abstract syntax tree which is used by the semantic analyser and code generator for context analysis and the generation of the CIL image, respectively. mjs uses .NET's System.Reflection.Emit API for code generation which makes it much more understandable and readable.

#### How to contribute

There are a number of ways to contribute to the JScript effort. They range from reporting bugs in **mjs** and **Microsoft.JScript.dll**, implementing JScript's object system classes as well as the embedded runtime support which involves the implementation of classes related to **VsaEngine**; those classes are located in the **mcs/class/Microsoft.JScript** directory.

Currently, the best way of contributing is to have a look at the failing tests in **mcs/class/Microsoft.JScript/Test/Mozilla** and fix them. Detailed instructions for how to use the test suite are in the README of that directory.

If you need specific details don't hesitate to send an e-mail to [cesar](mailto:cesar@ciencias.unam.mx) or the [mono-devel](mailto:mono-devel-list@lists.ximian.com) mailing list. If you have questions about the run time you can also try contacting [flgr](mailto:flgr@ccan.de) for help.

If you are generally interested in the project you might also want to join the developers at [\#mjs on irc.gimp.org](irc://irc.gimp.org/mjs).

#### Submitting bug reports

**mjs** has its own [query module](http://bugzilla.ximian.com/buglist.cgi?product=Mono%3A+Compilers&component=jscript&bug_status=NEW&bug_status=ASSIGNED&bug_status=REOPENED&order=bugs.bug_id) and also you can [add](http://bugzilla.ximian.com/enter_bug.cgi?product=Mono%3A+Compilers&component=jscript) more reports. Take a look at Mono's good practices for creating a [bug report](/Bugs)

