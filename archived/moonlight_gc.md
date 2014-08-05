---
title: "Moonlight/GC"
lastmodified: '2010-06-29'
redirect_from:
  - /Moonlight/GC/
---

Moonlight/GC
============

The Problem
===========

Moonlight uses managed and unmanaged peers, with the managed peer lifetime being controlled by the GC, and the unmanaged peer lifetime being controlled via reference counts. It's possible (and quite easy in common usage) to create cycles that cross the managed/unmanaged boundary.

This is a rather simple example, but is pretty much what happens with ScrollViewer+ScrollContentPresenter, along with pretty much all the other control/template scenarios. The "..." is any chain of strong references, either through collection+value, or direct reference like UIElement::subtree\_object or Control::template\_root.

             strong
     +--------+ gchandle             +------------------+ +1
     | parent |<--------TR--------->| unmanaged parent |<----- runtime code
     +--------+                   +1 +------------------+
         ^                            |
         |                                |
         |                           ...
      delegate                        |
         |                                |
         |       strong                   v +1
     +-------+ gchandle              +-----------------+
     | child |<---------TR--------->| unmanaged child |
     +-------+                +1 +-----------------+

Runtime code drops its ref, dropping the reference count of "unmanaged parent" to 1. this causes its toggle ref to switch the gchandle to a weak reference.

     +--------+ weakref             +------------------+
     | parent |<--------TR--------->| unmanaged parent |
     +--------+                   +1 +------------------+
         ^                            |
         |                                |
         |                           ...
      delegate                        |
         |                                |
         |       strong                   v +1
     +-------+ gchandle              +-----------------+
     | child |<---------TR--------->| unmanaged child |
     +-------+                +1 +-----------------+

"unmanaged child"'s ref count is still 2, so its managed peer "child" is kept alive by the gchandle. The delegate keeps "parent" alive, and since "parent" is still reachable, "unmanaged parent" is kept alive as well.

One important thing to notice is that there are no reference from parent to child (at any level) on the managed side of things. Each of the possible solutions outlined below depend on the movement to strong refs from the unmanaged side to the managed side, so that there are no cycles crossing the boundary.

Possible Solution 1: Force Managed Peers and Refs Everywhere
============================================================

This solution requires the following:

-   All parent-child refs in unmanaged land \_must\_ not increase the refcount. We'd need to hook up Destroyed event handlers to clear out unmanaged pointers when the objects are destroyed.

-   All unmanaged refs \_must\_ be paired by strong managed references.

<!-- -->

                        strong
            +--------+ gchandle            +------------------+ +1
          ->| parent |<--------TR--------->| unmanaged parent |<----- runtime code
         /  +--------+                  +1 +------------------+
        /       |                                  |
       /        |                                  |
    delegate   ...                                ...
      \         |                                  |
       \        |                                  |
        \       v                                  v
         \  +-------+  weakref             +-----------------+
          ->| child |<---------TR--------->| unmanaged child |
            +-------+                   +1 +-----------------+

now if runtime code unrefs "unmanaged parent", its toggle ref switches to a weakref on the managed side. Now we have a cycle completely contained on the managed side, with two weakrefs from unmanaged to managed.

            +--------+  weakref            +------------------+
          ->| parent |<--------TR--------->| unmanaged parent |
         /  +--------+                  +1 +------------------+
        /       |                                  |
       /        |                                  |
    delegate   ...                                ...
      \         |                                  |
       \        |                                  |
        \       v                                  v
         \  +-------+  weakref             +-----------------+
          ->| child |<---------TR--------->| unmanaged child |
            +-------+                   +1 +-----------------+

The GC should be able to collect this cycle, at which point both unmanaged peers will be destroyed when their refcounts drop to 0.

Problems with this approach
---------------------------

This approach requires that every unmanaged peer has a managed peer counterpart once the unmanaged peer is added to the tree. This requires a few different things:

-   collections must not increment the refcount of their elements.

-   local, autocreated Values must not increment the refcount of their DO's.

-   UIElement must not increment the refcount subtree\_object.

-   Control must not increment the refcount of template\_root.

The trouble with this is that until a possibly complex subtree is added to tree, there are no managed peers (and can't be any, since there would be no strong managed references to keep the managed subtree alive.) So, basically in DependencyObject::SetValueWithError (and Collection::AddImpl, and a few other places) we'd need to traverse everything, ensuring that managed peers are created and ensuring that strong refs are in place to duplicate the unmanaged refs. Also, during this process we'd need to decrement the refcount of all objects when their managed peer is created (in effect breaking the unmanaged reference.)

