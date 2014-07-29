---
layout: obsolete
title: "WPF Notes"
lastmodified: '2010-07-14'
permalink: /archived/WPF_Notes/
redirect_from:
  - /WPF_Notes/
---

WPF Notes
=========

Notes on implementation strategies for a Mono-based WPF.

For details on Moonlight (a subset of WPF) see [Moonlight]({{ site.github.url }}/Moonlight "Moonlight").

WPF
===

At this point, no group in the Mono project has plans to implement Windows Presentation Foundation APIs as part of the project. The notes on this page are merely to keep some notes around.

Rendering Engine
----------------

### Polygon Clipping

**Update:** It does not seem like Silverlight exposes the APIs or classes to do polygon clipping, so this might not be necessary to implement.

Neither Cairo or Antigrain come with an open source polygon clipping library, so we will have to implement one.

Although [Libgdiplus]({{ site.github.url }}/Libgdiplus "Libgdiplus") does have a clipping implementation it is based on bitmasks and this might not be fast enough for our needs.

Although there are various polygon clipping libraries available in the net, nothing exists as open source that takes care of all the corner cases. A complete solution to the problem is described in [Bala R. Vatti's "A Generic Solution to Polygon Clipping"](http://portal.acm.org/citation.cfm?doid=129902.129906) available from the ACM. We need the polygon clipping library to support complement, exclude, intersection, xor and union (covered in the later parts of the paper).

A performance improvement over Vatti's paper is [Efficient Clipping of Arbitrary Polygons](http://davis.wpi.edu/~matt/courses/clipping/). Notice that this does not deal with all of the operations that we need (but could be implemented on top of it).

Not clear if we need the library to handle holes, but it seems that self-intersecting polygons is a must.

