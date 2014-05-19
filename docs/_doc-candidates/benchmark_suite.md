---
layout: obsolete
title: "Benchmark Suite"
permalink: /old_site/Benchmark_Suite/
redirect_from:
  - /Benchmark_Suite/
---

Benchmark Suite
===============

The [Mono benchmark suite](http://storage.bos.xamarin.com/mono-gcbench/index.html) is a set of benchmarks that is run by Wrench against newly built revisions. The data thereby gathered is then put into visual form, so as to be quickly comprehensible. The source of the benchmark suite is [available](https://github.com/xamarin/benchmarker).

We have a list of explanations for [Benchmark Regressions]({{site.github.url}}/old_site/Benchmark_Regressions "Benchmark Regressions").

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#index">1 Index</a></li>
<li><a href="#configuration-page">2 Configuration page</a>
<ul>
<li><a href="#configuration-overview-graph">2.1 Configuration overview graph</a></li>
</ul></li>
<li><a href="#individual-benchmark-page">3 Individual benchmark page</a>
<ul>
<li><a href="#benchmark-graph">3.1 Benchmark graph</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Index
=====

The [index page](http://storage.bos.xamarin.com/mono-gcbench/index.html) shows all configurations on which the benchmark suite was run. For the last revision, it shows the average benchmark runtime relative to the best performing revision so far, as well as the relative runtime of the worst-performing benchmark of the current revision.

The configuration overview graphs are explained below.

Configuration page
==================

[Configuration pages](http://storage.bos.xamarin.com/mono-gcbench/default-sgen/index.html) summarize individual configuration results. The table has a row for each benchmark, giving times and revisions for the best and worst results, as well as absolute and relative times for the latest three revisions.

It also shows small versions of the benchmark graphs for each benchmark. Those graphs are explained below.

In the rightmost column it gives graphs of native code size, as reported by `mono --stats`.

Configuration overview graph
----------------------------

In the [configuration overview graph](http://storage.bos.xamarin.com/mono-gcbench/default-sgen/combined_large.png) revision time moves from left to right, i.e. earlier revisions are left, later revisions are right. The vertical axis is relative runtime, so lower is better.

The main (black) line shows the average relative benchmark runtime, i.e. it gives a good measure of how each revision performs on average. The green and red lines show the best and worst performing individual benchmark runtimes per revision, i.e. they indicate whether a revision has any outliers in terms of performance.

The green and red markers indicate the best and worst performing revisions, respectively, based on average relative benchmark runtime.

Individual benchmark page
=========================

Each individual [benchmark page](http://storage.bos.xamarin.com/mono-gcbench/default-sgen/graph4.html) lists results for all revisions the particular benchmark was run on the particular configuration. It presents average, minimum and maximum run times (in seconds), native code size, and gives a link to the raw run time files.

Benchmark graph
---------------

In the [benchmark graph](http://storage.bos.xamarin.com/mono-gcbench/default-sgen/graph4_large.png), just as in the configuration overview graph, revision time moves from left to right and the vertical axis indicates runtime, in this case absolute.

The main (black) line shows the average runtime, over three runs, whereas the gray area shows the variation of the runs, i.e. slowest to fastest.

The green and red markers indicate the best and worst performing revisions for the benchmark, respectively.

