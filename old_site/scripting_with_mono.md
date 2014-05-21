---
layout: obsolete
title: "Scripting With Mono"
lastmodified: '2009-12-04'
permalink: /old_site/Scripting_With_Mono/
redirect_from:
  - /Scripting_With_Mono/
---

Scripting With Mono
===================

by [Miguel de Icaza](/index.php?title=Miguel&action=edit&redlink=1 "Miguel (page does not exist)")

In this article we will discuss how you can use Mono to increase your productivity and make your software applications extensible without having to rewrite any of your existing C or C++ code into C\#.

This technique has many names: application scripting, runtime hosting, runtime embedding. They are all the same thing.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#scripting">1 Scripting</a></li>
<li><a href="#the-mono-offering">2 The Mono Offering</a></li>
<li><a href="#scripting-an-application">3 Scripting an Application</a></li>
<li><a href="#game-developers">4 Game Developers</a>
<ul>
<li><a href="#performance">4.1 Performance</a></li>
<li><a href="#language-support">4.2 Language Support</a></li>
<li><a href="#licensing">4.3 Licensing</a></li>
</ul></li>
<li><a href="#continued-performance-increase">5 Continued Performance Increase</a></li>
<li><a href="#using-mono-in-your-application">6 Using Mono in your Application</a></li>
</ul></td>
</tr>
</tbody>
</table>

Scripting
=========

In the past, software used to be written entirely in a single programming language. Developers had to strike a balance between high performance and having to pick a low-level language or slower execution speed but using a high level language.

For example a C/C++ application would look like this:

[![Text2286.png]({{site.github.url}}/old_site/images/6/6b/Text2286.png)]({{site.github.url}}/old_site/images/6/6b/Text2286.png)

A scripted language application would look like this:

[![Text2304.png]({{site.github.url}}/old_site/images/a/a7/Text2304.png)]({{site.github.url}}/old_site/images/a/a7/Text2304.png)

Picking one or the other is a difficult choice as there are many nuances that software developers face. The high-level languages are more productive and developers get more done for each line of code written. But high-level languages come with a price, the software does not run as fast as it could and sometimes requires more cpu, more resources and in some markets might make the difference between a successful project or a failed project.

Developers have turned to scripting as a mechanism to balance the best of both worlds, the idea is simple. The **engine** of the application is developed in C or C++ and usually maintained and developed by the veteran members of a team, while pieces of the UI, dialogs, interaction, or non-performance critical routines are written in a higher-level scripting language.

The result looks like this:

[![Text2330.png]({{site.github.url}}/old_site/images/3/30/Text2330.png)]({{site.github.url}}/old_site/images/3/30/Text2330.png)

This idea was for a long time championed by John Ousterhout. You can read some of his discussions [here](http://home.pacbell.net/ouster/scripting.html).

The following figure is a slightly updated version of John's figure:

[![Screenshot103.png]({{site.github.url}}/old_site/images/a/a3/Screenshot103.png)]({{site.github.url}}/old_site/images/a/a3/Screenshot103.png)

From John Ousterhout's paper:

A comparison of various programming languages based on their level (higher level languages execute more machine instructions for each language statement) and their degree of typing. System programming languages like C tend to be strongly typed and medium level (5-10 instructions/statement). Scripting languages like Tcl tend to be weakly typed and very high-level (100-1000 instructions per statement).

By using a high-level scripting language, developers are able to mix low-level code with high level code.

Historically, developers have turned to different technologies to implement scripting, from the very simple "batch processing" languages, to evolutions of those (Tcl, the tool command language comes to mind) to some custom in-house developed languages (Second Life's LSL is a good example) to more mainstream languages like Lua, Perl or Python.

Some languages were designed with embedding in mind from the beginning (like Python) which makes embedding Python very simple. Other languages are embeddable but the embedding API is not as clear as it could be, and mostly they expose the internals of the language and merely allow for the language to be embedded.

You can think of the speed of languages as a progression (and here am taking a few liberties, but this is just for illustration purposes), roughly it goes like this:

-   Assembler (fastest).
-   Compiled Static, unsafe languages C/C++.
-   JITed Static, safe languages (C\#, Java).
-   ...
-   A **large** performance gap goes here.
-   ...
-   JITed Dynamic, safe languages (IronPython)
-   Interpreted dynamic, safe languages and mainstream (Python, Perl, Javascript).
-   In-house custom languages.

As I said, the above is just a rough approximation.

The worst kind of language tends to be the in-house custom language. These in-house and ad-hoc languages tend to be quick hacks that evolve over the life time of a program. The authors of those languages are not language designers or experts in language design nor compiler developers, so their languages suffer as a result. The languages tend to be slow, buggy, poorly documented and packed with quirks.

This is why many developers tend to look for more mature language implementations when possible.

Extending your applications has many benefits. By using a scripting language, you will get an environment that is suitable for quickly prototyping without having to rebuild your core product for small changes, or polishing an existing application.

Scripting languages also offer a secure execution sandbox that allows high-level developers to quickly prototype and experiment without having to worry about many low-level details of the core C engine and without having to take care of some of the more mundane details like resource management and memory management, vastly simplifying the development of applications.

By splitting the responsibilities between the engine developer and the scripting developer, it is possible to reduce the complexity in a software project and it allows developers to focus on the bigger picture instead of having to learn all the details of the underlying core engine implementation for your software and the various rules for resource management that you might have.

The Mono Offering
=================

Mono offers the same functionality that developers have used to extend their application with a safe environment for scripting language with Just-in-Time compiled code.

Scripting languages tend to be interpreted, and as such are not as fast as native code. Mono expands the option of scripting language users to use languages that are suitable to be JIT-compiled into native code. The performance is typically much better than those of a scripted language and many of the high-level language benefits are still available to the developer.

It also offers a wide variety of programming languages depending on the needs of your software.

Mono offers:

-   A choice of languages for scripting your application, some examples:
    -   Static languages: C\#, VisualBasic.NET, RemObject's Pascal.
    -   Dynamic languages: [Boo](http://boo.codehaus.org), IronPython, IronRuby.
    -   Functional languages: Nemerle, F\#
    -   And of course, many more, see [Languages]({{site.github.url}}/old_site/Languages "Languages") for more details.
-   A native code generator to run your software as fast as possible.
-   Easy support for calling your native code
    -   [PInvoke]({{site.github.url}}/old_site/Interop_with_Native_Libraries) allows you skeleton/stub-less invocation of C methods.
    -   InternalMethod provide access to raw C/C++ methods.
    -   C function pointer to scripting language transitions (a function pointer provided by Mono when invoked would trigger a transition to Mono-controlled code for execution of any scripting capability, very useful for callbacks or notifications).
-   Access to a large body of [libraries]({{site.github.url}}/old_site/Libraries "Libraries") and reusable components.

Scripting an Application
========================

Scripting an application usually exposes some of the internals of the low-level code in one way or another. Usually there are handles or object systems that are surfaced for the scripting developer to consume. The developer of the binding will typically have to design the system to allow for the scripting language to consume it.

Game Developers
===============

Game developers are some of the major users of scripting technologies, they develop the performance sensitive code in C and assembler and they take advantage of graphics-accelerated hardware, physics libraries, physics accelerated hardware and multi-cpu processing to increase the performance of a game.

Performance
-----------

Higher-level constructs and game play are typically implemented in a scripting language. The problem that game developers face with scripting languages is that they are usually the major performance bottleneck in a game. After spending years fine-tuning their C, C++ and assembly language code and taking advantage of every little trick in their GPUs, the game play ends up running very slow because the scripting language is just not as fast as it could be.

Consider [SecondLife](http://www.secondlife.com), an online 3D virtual world that is scripted with the LSL programming language. An ongoing effort at Linden Labs is replacing the LSL scripting engine with the Mono runtime. They have written an LSL compiler that will generate the ECMA bytecode consumed by the Mono runtime, this allows them to keep all of their existing scripts running without modifications and get the advantages of Mono.

The early results of switching showed that there was a 50 to 150 times performance increase in switching from LSL/interpreted to LSL/Mono.

The [Unity3D](http://unity3d.com) game design engine uses Mono to provide scripting capabilities to the applications and games built with it by supporting Boo, C\# and UnityScript (a strongly-typed version of Javascript which helps make the code faster).

Language Support
----------------

By using Mono as a scripting engine, you get to pick the language that better suits your needs. Mono's extensive [language support]({{site.github.url}}/old_site/Languages "Languages") allows developers to pick the best language or the best languages for their particular problem.

Developers familiar with LUA can use the [LUA2IL](http://www.lua.inf.puc-rio.br/luanet/lua2il/) compiler to run their existing code, or apply existing skills to run the same LUA code under the Mono optimizing JIT compiler at increased speed.

In addition, developers get to reuse their experience with C\# and the .NET class libraries with their game, companies get access to a larger pool of developers that are experienced with a mainstream language and they can focus on creating the best possible game play instead of spending precious resources and time implementing yet another virtual machine, another set of debugging tools and a new ad-hoc language.

Mono allows code to be written in multiple languages: components can be authored in C\# that is a language with strong support for best engineering practices (your core libraries, and reusable components can be authored in it) and yet allow the flexibility of a scripting language like Python or Javascript for code that you must quickly prototype or alter.

C\#'s support for yielding execution is also very convenient for writing clear code that must maintain state.

The [Boo programming language](http://boo.codehaus.org/) is also a popular choice. This language is an extensible programming language which allows developers to create new language constructs that can be applied to the particular scenarios that are necessary for your game.

Licensing
---------

Mono is an open source technology that can be used freely under the terms of the GNU LGPL license. Novell alternatively offers commercial licenses of the Mono runtime if you require to use Mono in any of the following situations:

-   On Windows or Mac games, if:
    -   Static linking Mono into your application.
    -   Preventing Mono or its class libraries from being upgraded (for example, to prevent gamers from cheating).
    -   You want to add proprietary extensions that you want to keep.

-   On Consoles where the end user is not allowed to upgrade the Mono runtime and repackage the game:
    -   Wii, PS3 or Xbox360

-   Proprietary extensions:
    -   If your game requires proprietary extensions that would be incompatible with the LGPL.

[Mono Tools for Visual Studio Ultimate Edition](http://www.go-mono.com/store/#Mono_Tools_Ultimate) includes a commercial license to redistribute Mono under non-LGPL terms on Windows, Linux, and Mac OS X PCs for products with volumes under 100,000 and revenues under \$2M annually. If your organization intends to redistribute software which embeds or bundles Mono, but is unable to comply with the terms of GNU LGPL v2, the Ultimate Edition may be right for you.

For other licensing options, [contact us]({{site.github.url}}/old_site/Contact "Contact").

Continued Performance Increase
==============================

We are committed to improving Mono's JIT performance and code generation quality. In the last year plenty of optimizations have been done to the runtime in many areas and applications run as much as twice as fast just by upgrading to a newer version of the Mono runtime.

As Mono matures, and its JIT compiler evolves you can expect bigger performance improvements becoming available for your software.

Using Mono in your Application
==============================

Now that you have seen a high-level overview of what scripting with Mono can do, you can take a look at the [Embedding Mono]({{site.github.url}}/old_site/Embedding_Mono "Embedding Mono") page for the actual technical details of how you consume the Mono runtime in your application: how you compile against it, and the APIs that your application can use.

