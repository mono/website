---
title: "HeapBuddy"
lastmodified: '2010-11-11'
redirect_from:
  - /HeapBuddy/
---

HeapBuddy
=========

Note: HeapBuddy is obsolete, Mono from git has a better profiler that is documented [here](/Profiler).

HeapBuddy is a summarizing profiler. It is part of the Mono [profiling](/Profile) tools.

HeapBuddy collects allocation statistics while the program is running and writes out the aggregate info to a file which you analyze with a command-line tool after it's finished running.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#collecting-the-data">1 Collecting the Data</a></li>
<li><a href="#examining-the-data">2 Examining the Data</a></li>
<li><a href="#obtaining-heapbuddy">3 Obtaining HeapBuddy</a></li>
<li><a href="#see-also">4 See Also</a></li>
</ul></td>
</tr>
</tbody>
</table>

Collecting the Data
===================

Run your application like this:

``` bash
mono --profile=heap-buddy:outputfile program.exe
```

Run your application under a regular load, and once you are done, terminate it. You will need the application to terminate completely before you can examine the data.

Once you have this data, you can examine it.

Examining the Data
==================

To examine the data you use the **heap-buddy** command, for example:

``` bash
heap-buddy outfile types
```

The above instructs Heap Buddy to process the data using the types mode. The tool has four basic modes: summary, history, types and backtraces.

**Summary** provides high-level info: how many objects/bytes were allocated, the final size of the heap, the number of GCs, etc.

**History** gives you a timeline of each heap resize and GC, reporting the sizes of the heap, the number of objects and their size, and how it changed over time.

This mode is useful for example to explore cases like: if your heap resizes 5 times in a row without a GC all within 2 seconds that you have a run away allocation pattern.

**Types** will show you all the value types that have been created, how many total instances, the total bytes, the average size of one instance, and the average age (ie, the number of GCs) it lived for.

If you're dealing with runaway memory, this will tell you what it is. The average age is good for finding memory leaks.

**Backtraces** is similar to types but has more granularity. It shows the same information as types, but it breaks the types up by the call trace that allocated them.

This is good when you are trying to find out what is allocating all those strings.

Obtaining HeapBuddy
===================

HeabBuddy is availale as an [Subversion](/SourceCodeRepository) checkout, use the following command line to download it:

``` bash
svn co svn://anonsvn.mono-project.com/source/trunk/heap-buddy
```

To build HeapBuddy use:

``` bash
cd heap-buddy
./autogen.sh
make
make install
```

See Also
========

[Performance Tips](/Performance_Tips)

[Heap Shot Memory Profiler](/HeapShot)
