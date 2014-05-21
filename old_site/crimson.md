---
layout: obsolete
title: "Crimson"
lastmodified: '2008-02-18'
permalink: /old_site/Crimson/
redirect_from:
  - /Crimson/
---

Crimson
=======

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#what-is-it-">1 What is it ?</a>
<ul>
<li><a href="#target-audience">1.1 Target audience</a></li>
<li><a href="#support">1.2 Support</a></li>
<li><a href="#export-restrictions">1.3 Export restrictions</a></li>
</ul></li>
<li><a href="#goals">2 Goals</a>
<ul>
<li><a href="#extend">2.1 Extend</a></li>
<li><a href="#simplify">2.2 Simplify</a></li>
<li><a href="#optimize">2.3 Optimize</a></li>
</ul></li>
<li><a href="#availability">3 Availability</a></li>
<li><a href="#current-state">4 Current state</a>
<ul>
<li><a href="#wrappers">4.1 Wrappers</a></li>
</ul></li>
<li><a href="#plans">5 Plans</a></li>
</ul></td>
</tr>
</tbody>
</table>

What is it ?
============

Crimson offers a superset of the cryptographic features available in the .NET framework. For various reasons Crimson isn't distributed within Mono. The main reasons being:

Target audience
---------------

As a superset to both .NET and Mono cryptographic features, Crimson is useful to everyone, not just Mono users.

Support
-------

Crimson is not required inside Mono to reach feature parity with MS implementation of the .NET framework and it's related tools. As such supporting Crimson is not the goal of the Mono project.

Export restrictions
-------------------

Laws regarding export and, sometimes import, of cryptography are diverse and complex. It is difficult to add/remove algorithms and keep all the required paperwork in sync.

Goals
=====

Extend
------

Crimson can **extends** .NET cryptography by providing:

-   alternative implementations of existing cryptographic algorithms;
-   new cryptographic algorithms (e.g. algorithms unavailable in .NET);
-   new tools (e.g. benchmarking);

Simplify
--------

Crimson can **simplify** .NET cryptography by providing easier API mapping to user, not cryptographic, tasks (e.g. Encrypting file using a key, certificate...).

Optimize
--------

Crimson can **optimize** .NET cryptography because it let you choose the best implementation (e.g. memory restrictions, performance, deployment) for your project.

Availability
============

The source code for Crimson is available in [SVN]({{site.github.url}}/old_site/SourceCodeRepository) under the module name **crimson**.

Current state
=============

Wrappers
--------

Crimson now has wrappers for all hash algorithms part of the **libmhash** library. Performance gains are visible when digesting large buffers (e.g. more than 1 Mb).

Plans
=====

-   Move **Mono.Security.Win32**, which is a wrapper around CryptoAPI, to the Crimson project;
-   Add a wrapper assembly around **libmcrypt**;
-   Copy managed cryptographic implementations of Mono into Crimson to optimize them (e.g. unrolling);
-   Copy managed (and safe) cryptographic implementation of Mono into a Silverlight/Moonlight compatible assembly;
-   Add more general benchmarking tools


