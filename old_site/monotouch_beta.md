---
layout: obsolete
title: "MonoTouch Beta"
lastmodified: '2009-08-11'
permalink: /old_site/MonoTouch_Beta/
redirect_from:
  - /MonoTouch_Beta/
---

MonoTouch Beta
==============

This is the page for the [MonoTouch]({{site.github.url}}/old_site/MonoTouch "MonoTouch") Beta program. If you are interested in participating on the beta, you can fill out our [Beta Signup Form](http://spreadsheets.google.com/viewform?hl=en&formkey=dHRXeFI5b1NjUWdRRkpiSmxkanh6T1E6MA..).

 Here are some pointers to get you started:

-   [Installing MonoTouch]({{site.github.url}}/old_site/MonoTouch_Installation "MonoTouch Installation").
-   [MonoTouch Tutorials]({{site.github.url}}/old_site/MonoTouch_Tutorials "MonoTouch Tutorials").
-   [API design for MonoTouch]({{site.github.url}}/old_site/MonoTouch_API "MonoTouch API").
-   [Using MonoDevelop to create a MonoTouch application]({{site.github.url}}/old_site/MonoTouch_Tutorial_MonoDevelop_HelloWorld "MonoTouch Tutorial MonoDevelop HelloWorld").

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#live-support-over-chat">1 Live Support over Chat</a></li>
<li><a href="#bugs-in-monotouch">2 Bugs in MonoTouch</a></li>
<li><a href="#release-history">3 Release History</a></li>
<li><a href="#caveats">4 Caveats</a>
<ul>
<li><a href="#the-net-api">4.1 The .NET API</a></li>
<li><a href="#limitations">4.2 Limitations</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Live Support over Chat
======================

You can get live support for MonoTouch using [IRC]({{site.github.url}}/old_site/IRC "IRC") at server irc.gnome.org channel \#monotouch.

Bugs in MonoTouch
=================

You can query or report new bugs using Bugzilla, here are some links:

||
||Query|Add|
|**MonoTouch Bugs**|||
|  Runtime|[http://mono-project.com/files/7/79/Magnifier.png](http://tinyurl.com/l9xfck)|[http://mono-project.com/files/a/a7/Add.png](http://tinyurl.com/lxsfrz)|
|  Class Libraries|[http://mono-project.com/files/7/79/Magnifier.png](http://tinyurl.com/knzc8s)|[http://mono-project.com/files/a/a7/Add.png](http://tinyurl.com/mfcw8k)|
|  Tools|[http://mono-project.com/files/7/79/Magnifier.png](http://tinyurl.com/lxc273)|[http://mono-project.com/files/a/a7/Add.png](http://tinyurl.com/lgm6vd)|

Release History
===============

[MonoTouch Release History]({{site.github.url}}/old_site/MonoTouch_ReleaseNotes "MonoTouch ReleaseNotes")

Caveats
=======

We consider MonoTouch feature complete, but there will be bugs lurking in this beta release. We will be issuing new builds every few days to correct bugs that developers will be running into, so please report these issues to the monotouch@lists.ximian.com mailing list.

The beta does not come with a license to redistribute the code beyond testing. For that you will need to wait for the official release in the first two weeks of September to buy the real product version.

The .NET API
------------

MonoTouch is based on a hybrid .NET 2.0 and Silverlight 2 API profile, this was done to help the Mono Linker remove code to make your code smaller. If you want to use existing C\# code, you will need to compile it from scratch using our compiler and tools to make sure that the proper assemblies are referenced.

Limitations
-----------

Since MonoTouch is a static compiler (no JIT engine), there are some [limitations]({{site.github.url}}/old_site/MonoTouch:Limitations "MonoTouch:Limitations") that you should be aware of before you write your code.

