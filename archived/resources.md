---
title: "Resources"
lastmodified: '2011-09-20'
redirect_from:
  - /Resources/
---

Resources
=========

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#articles">1 Articles</a></li>
<li><a href="#api-completion-status-pages">2 API completion status pages</a></li>
<li><a href="#continuous-tasks">3 Continuous Tasks</a>
<ul>
<li><a href="#build-bot">3.1 Build Bot</a></li>
<li><a href="#benchmarks">3.2 Benchmarks</a>
<ul>
<li><a href="#cuni-tests">3.2.1 Cuni Tests</a></li>
<li><a href="#debian-language-shootout">3.2.2 Debian Language Shootout</a></li>
</ul></li>
<li><a href="#daily-regression-test-suite-results">3.3 Daily Regression Test Suite Results</a></li>
<li><a href="#new-build-system">3.4 New Build System</a></li>
</ul></li>
<li><a href="#browseable-source-code">4 Browseable Source Code</a>
<ul>
<li><a href="#third-party-patches">4.1 Third Party Patches</a></li>
</ul></li>
<li><a href="#security-vulnerabilities">5 Security Vulnerabilities</a></li>
</ul></td>
</tr>
</tbody>
</table>

Articles
========

[Articles]({{ site.github.url }}/Articles "Articles") written about Mono or covering specific parts of Mono.

[Spanish Mono Book](http://tornatmico.org/libro/LibroMono) available as a Wiki.

API completion status pages
===========================

The API status pages are available [go-mono.com/status](http://go-mono.com/status/).

Continuous Tasks
================

Build Bot
---------

Track the status of the Mono repository (builds and regression tests) executed on multiple platforms on the [Mono Build](http://wrench.mono-project.com/builds)

Benchmarks
----------

We keep a page with details on [performance testing]({{ site.github.url }}/PerformanceTesting "PerformanceTesting").

Any tests that are added to the mono/tests directory will become a performance test which can be reviewed a day later at [the regressions tests](http://nenya.ms.mff.cuni.cz/projects/mono/benchmarks/rtests.phtml) page.

### Cuni Tests

Tomas Kalibera and his team keep a database of improvements done on a daily basis on the Mono runtime, it is available here:

[http://nenya.ms.mff.cuni.cz/benchmark](http://nenya.ms.mff.cuni.cz/benchmark)

### Debian Language Shootout

[Language Shootout](http://shootout.alioth.debian.org/debian/benchmark.php?test=all&lang=csharp&lang2=java) benchmarks tracks the performance of Mono vs other frameworks shipped in Debian.

The language shootout is usually a bit lagging regarding the latest version of Mono, but it is close enough.

Daily Regression Test Suite Results
-----------------------------------

Detailed reports of the regression test suite as well as graphics on progress are available [Mono Test Suite Results](http://mono.ximian.com/tests)

New Build System
----------------

[BuildSystem]({{ site.github.url }}/BuildSystem "BuildSystem")

Browseable Source Code
======================

The source code for Mono can be browsed in [the anonymous SVN repository](http://anonsvn.mono-project.com/)

Third Party Patches
-------------------

Distributions sometimes apply patches to Mono, you can see a list of distributions and their patches in our [ThirdPartyPackages]({{ site.github.url }}/ThirdPartyPackages "ThirdPartyPackages") page.

Security Vulnerabilities
========================

A list of known [vulnerabilities]({{ site.github.url }}/Vulnerabilities "Vulnerabilities") affecting older versions of Mono is available.

