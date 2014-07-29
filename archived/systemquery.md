---
layout: obsolete
title: "System.Query"
lastmodified: '2007-03-12'
permalink: /archived/System.Query/
redirect_from:
  - /System.Query/
---

System.Query
============

This libary aims the provide the neccessary set of classes in order to be able to get some features of C\# 3.0, such as extension methods and query expressions. More details of the current idea behind this can be found at [the MSDN Linq page](http://msdn.microsoft.com/netframework/future/linq/default.aspx).

The `System.Query.Sequence` class provides methods that work in `IEnumerable` objects such as arrays and lists:

-   Restriction: `Where`
-   Projection: `Select`
-   Partitioning: `Take, Skip`
-   Concatenation: `Concat`
-   Ordering: `OrderBy, ThenBy`
-   Grouping: `GroupBy`
-   Set: `Union, Distinct, Intersect, Except`
-   Element: `First, ElementAt`
-   Quantifiers: `All, Any`
-   Aggregate: `Max, Min, Average, Sum, Count, Fold`

Most of the functionality is indeed inside this class, except ordering, which occurs inside `OrderedSequence`. The algorithm used for ordering is the traditional QuickSort.

Any compiler that would like to provide a set of à-la-SQL operators should rely on this library.

