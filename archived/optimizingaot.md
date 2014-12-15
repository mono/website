---
title: "OptimizingAOT"
lastmodified: '2006-11-11'
redirect_from:
  - /OptimizingAOT/
---

OptimizingAOT
=============

 See also the [AOT](/AOT) page for an introduction.

### Prelinking

A prelinking optimization could be applied to our system assemblies, i.e. setting preferred load addresses for them as the unix 'prelink' tool does. This would allow these assemblies to avoid relocations altogether, and assemblies using these to avoid some of the relocations.

Another source of relocations is the calls made by AOTed code to various runtime helper functions. Since the addresses of these functions change only when the runtime is recompiled, it may be possible to embed the addresses directly into AOTed code. During loading, the AOT loader would have to check that the addresses are correct. A significant problem with this approach is that these functions are not called directly, but through a runtime generated wrapper, whose address is not constant.

