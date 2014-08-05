---
title: "Benchmark Regressions"
lastmodified: '2012-09-12'
redirect_from:
  - /Benchmark_Regressions/
---

Benchmark Regressions
=====================

This is a list of explanations for regressions in the [Benchmark Suite]({{ site.github.url }}/Benchmark_Suite "Benchmark Suite").

sharpsatbench
=============

[sharpsatbench](http://storage.bos.xamarin.com/mono-gcbench/default-sgen/sharpsatbench.html) performance improves by about 20% in [71bb64df71](https://github.com/mono/mono/commit/71bb64df713675bd40c62f3071a6d4cb86b3c94c), and then regresses by about 7% in [876615e258](https://github.com/mono/mono/commit/876615e25856931250e0d3c9ef48fe7989f71fc1). Both are due to changes in Corlib's qsort implementation. The first change implements a fallback to insertion sort for small arrays, the second change fixes a bad performance regression, but also regresses performance overall.

