---
title: Mono.Cecil
redirect_from:
  - /Cecil/
---

Cecil is a library written by [Jb Evain](http://evain.net/blog/) to generate and inspect programs and libraries in the ECMA CIL format. It has full support for generics, and support some debugging symbol format.

In simple English, with Cecil, you can load existing managed assemblies, browse all the contained types, modify them on the fly and save back to the disk the modified assembly.

Today it is used by the Mono [Debugger](/docs/debug+profile/debug/debugger/), the bug-finding and compliance checking tool [Gendarme](/docs/tools+libraries/tools/gendarme/), [MoMA](/docs/tools+libraries/tools/moma/) and [many other tools](https://github.com/jbevain/cecil/wiki/Users).

Mailing List
============

There is a Google Group to discuss everything Cecil related: [mono-cecil](http://groups.google.com/group/mono-cecil)

Versions
========

Recently, Cecil undergone a large refactoring, to be able to fix some issues the previous version had. In its previous form, the code was compilable on a .net 1.0 profile, and you need to use Cecil from the 0.6 family if you still want to use it.

For every other usage, you're urged to switch to the new version 0.9. Its development has been moved to the [Cecil github page](http://github.com/jbevain/cecil) until all the code in Mono is updated to this version.

Using Cecil
===========

Since Cecil's API has not yet been frozen as we want to continue improving it from the lessons learned from various consumers of the API, using Cecil requires your project to take some extra steps compared to when you use a published API.

The 0.9 family of Cecil, is very close to API stability.

The pattern used for using libraries whose API is not frozen is described in the [[Deployment](/docs/getting-started/application-deployment/)] guidelines.

To summarize it, it is necessary for you to copy and bundle a version of Cecil with your project before using it. To do this, you use the following pattern:

``` bash
cp `pkg-config --variable=Libraries cecil` .
gmcs program.cs -r:Mono.Cecil.dll
```

In a Makefile you would achieve that by doing:

``` bash
Mono.Cecil.dll:
        cp `pkg-config --variable=Libraries cecil` .
```

And adding Mono.Cecil.dll as one of your dependencies.

Download
========

If you want the up to date version of Mono.Cecil, you need to get it from its [github page](http://github.com/jbevain/cecil).

If you need a recent build of the 0.6 branch, the recommended way of quickly getting a binary of Mono.Cecil.dll, is to grab it from the last MonoCharge tarball which are part of our [daily builds](http://mono.ximian.com/daily/).

If needed, you can download Cecil's last revision from the [Subversion repository](/community/contributing/source-code-repository/) in mcs/class/Mono.Cecil.

Documentation
=============

You can visit, and even contribute, to Cecil's [wiki](http://wiki.github.com/jbevain/cecil/).

Release notes
=============

Here are the release notes for every version of Cecil:

    * Mono.Cecil 0.9.1
    * Mono.Cecil 0.9
    * Mono.Cecil 0.6
    * Mono.Cecil 0.5
    * Mono.Cecil 0.4.3
    * Mono.Cecil 0.4.1
    * Mono.Cecil 0.3
    * Mono.Cecil 0.2
    * Mono.Cecil 0.1

Differences with other alternatives
===================================

Reflection/Reflection.Emit
--------------------------

Reflection and Reflection.Emit only expose a subset of all the features in a CLI image. Since we want to remain compatible with the Microsoft implementation, we can not add or change the behavior of this library to be more complete.

Two big differences are that:

-   Cecil has support for extracting the CIL bytecodes.
-   Cecil does not need to load the assembly or have compatible assemblies to introspect the images.

Projects
========

The following are projects that we want to implement using Cecil:

<table>
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<thead>
<tr class="header">
<th align="left">Area</th>
<th align="left">Description</th>
<th align="left">Difficulty</th>
<th align="left">Time estimate</th>
<th align="left">Additional information</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">Disassembler/assembler</td>
<td align="left"><p>although today we have both tools, we are not very happy with our disassembler as it uses the Mono internal calls which are not really designed to cope with incomplete assemblies (we have an all-or-nothing codebase in this scenario).</p></td>
<td align="left"><p>Medium</p></td>
<td align="left">3-4 Months</td>
<td align="left">jbevain is working on ildasm, still need to update the assembler.</td>
</tr>
<tr class="even">
<td align="left">Code optimization using Cecil</td>
<td align="left"><p>this is a longer-term project, but today compilers that target the CIL are known to generate fairly straightforward CIL code leaving most of the work to the JIT engine. An optimizer that could perform some tasks before the JIT compiler hits the code would be useful.</p>
<p>Although our code generator is fairly good, and getting better the most effective optimizations are never turned on for JIT-use as they are very time consuming.</p>
<p>There are a couple of temporary measures that can be taken to address this issue (ahead-of-time compilation and dynamic recompilation). Both have small drawbacks.</p>
<p>A code optimizer would convert a CIL stream into a different CIL stream that is compatible but has applied some optimizations before the JIT sees them.</p>
<p>These optimizations could be a lot more complex than what the JIT compiler can do today doing things like loop unrolling or processing a file to automatically multithread some pieces of the program.</p>
<p>It is rumored that the MS C++ compiler produces better code than the C# compiler as it does do some IL-level loop unrolling for example.</p></td>
<td align="left"><p>Medium-Hard</p></td>
<td align="left">3-4 Months</td>
<td align="left">Must validate claims, could reuse the semantic information from a bug-finding tool.</td>
</tr>
</tbody>
</table>



