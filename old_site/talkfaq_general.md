---
layout: obsolete
title: "Talk:FAQ: General"
permalink: /old_site/Talk:FAQ:_General/
redirect_from:
  - /Talk:FAQ:_General/
---

Talk:FAQ: General
=================

I've got src of Mono. I need to build it (in Linux) with my own "script" e.g. keep everything connected with ASP.NET and discard everything I need not in order to reduce size of Mono. What should I do to rich my purpose?

XSP
---

You will need XSP, the mono runtime, and mcs and that should be it. With XSP2 you can package your site into a single dll so then you won't need mcs. No special scripts needed :-)

