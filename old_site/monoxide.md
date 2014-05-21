---
layout: obsolete
title: "Monoxide"
lastmodified: '2006-10-26'
permalink: /old_site/Monoxide/
redirect_from:
  - /Monoxide/
---

Monoxide
========

What is it ?
============

Monoxide is an extensible assembly viewer written using [Cecil]({{site.github.url}}/old_site/Cecil "Cecil") and [Gtk\#]({{site.github.url}}/old_site/GtkSharp). It's main purpose, just like it's cousin Gendarme, is to help find defects in compiled software. However Monoxide's strategy is different. Gendarme provides rules that can be used/automated without much human involvement, while Monoxide is an interactive tool to find problem for which no rules exists. If, after a while, some defect pattern emerge then it's time to turn this new knowledge into a Gendarme rule.

History (pre-SVN)
=================

Monoxide evolved from a few graphs produced in early 2005 by playing with Cecil and dot (graphviz).

-   [http://pages.infinit.net/ctech/20050327-0940.html](http://pages.infinit.net/ctech/20050327-0940.html)
-   [http://pages.infinit.net/ctech/20050418-1109.html](http://pages.infinit.net/ctech/20050418-1109.html)
-   [http://pages.infinit.net/ctech/20050425-0635.html](http://pages.infinit.net/ctech/20050425-0635.html)

Soon after starting Monoxide it became apparent that a rule-based tool would be more useful to the Mono community. So was born [Gendarme]({{site.github.url}}/old_site/Gendarme "Gendarme"). Monoxide had to wait until late 2006, at the Mono Meeting in Cambridge, to be publicly released.

Warning
=======

Carefully review any license agreements before using Monoxide on any assembly that you have not written yourself. In many cases using Monoxide could be interpreted as some kind of reverse engineering.

