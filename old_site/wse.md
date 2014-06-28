---
layout: obsolete
title: "WSE"
lastmodified: '2007-03-12'
permalink: /old_site/WSE/
redirect_from:
  - /WSE/
---

WSE
===

At this point the Web Services Enhancements (WSE, WSE2 and WSE3) are not supported in Mono.

Those are the Microsoft.Web.Services and Microsoft.Web.Services2, and Mircosoft.Web.Services3 namespaces. They are not supported and will not likely be supported anytime soon.

Status
======

There was some initial work done to support WSE in Mono early on, but only a handful of classes were implemented. Also, notice that WSE2 is not a superset of WSE, but a replacement for it.

The MS implementation of WSE2 at this point is believed to have some very strong dependencies on the MS implementation of the basic Web services stack, which is incompatible with Mono, so attempts to run the Microsoft provided DLLs will fail.

It is also believed that WSE, WSE2 and WSE3 will become outdated technologies when Indigo is released.

We recommend that you look at the [Olive]({{ site.github.url }}/old_site/Olive "Olive") project if you are interested in the advanced Web Services functionality. It is project under development at this point.

