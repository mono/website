---
layout: obsolete
title: "Gendarme"
lastmodified: '2011-01-14'
permalink: /old_site/Gendarme/
redirect_from:
  - /Gendarme/
---

Gendarme
========

Gendarme is a extensible rule-based tool to find problems in .NET applications and libraries. Gendarme inspects programs and libraries that contain code in ECMA CIL format (Mono and .NET) and looks for common problems with the code, problems that compiler do not typically check or have not historically checked.

Gendarme uses the [Cecil]({{site.github.url}}/old_site/Cecil "Cecil") library to introspect code.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#why-">1 Why ?</a></li>
<li><a href="#history">2 History</a></li>
<li><a href="#runners">3 Runners</a>
<ul>
<li><a href="#console">3.1 Console</a></li>
<li><a href="#wizard">3.2 Wizard</a></li>
<li><a href="#cruisecontrolnet">3.3 CruiseControl.NET</a></li>
<li><a href="#nant">3.4 NAnt</a></li>
</ul></li>
<li><a href="#rules">4 Rules</a></li>
<li><a href="#download">5 Download</a>
<ul>
<li><a href="#linux">5.1 Linux</a></li>
<li><a href="#windows">5.2 Windows</a></li>
<li><a href="#binaries-only-multi-platform">5.3 Binaries only (multi-platform)</a></li>
<li><a href="#source-code">5.4 Source Code</a></li>
<li><a href="#other-cool-stuff">5.5 Other Cool Stuff</a></li>
</ul></li>
<li><a href="#resources">6 Resources</a>
<ul>
<li><a href="#getting-help">6.1 Getting Help</a></li>
</ul></li>
<li><a href="#feedback">7 Feedback</a></li>
</ul></td>
</tr>
</tbody>
</table>

Why ?
=====

1.  Because we often repeat our mistakes. The biggest one being not to review things we *know*;
2.  Because it's a lot funnier (and safer) to write a rule than to review millions of source lines of code (SLOC) to ensure it's being followed.

History
=======

Gendarme was originally created by Sebastien Pouliot to assist in the security auditing process in Mono. Aaron Tomb later integrated his .NET bug-finding code (supported by the 2005 Google Summer of Code, GSoC) into the same framework. Since then the number of [contributors](http://anonsvn.mono-project.com/source/trunk/mono-tools/gendarme/AUTHORS) and rules has been growing.

Many Gendarme tasks have been realized in [Google Summer Of Code](http://code.google.com/soc/2008/) (GSoC): three projects in 2007, one in 2008 - and in the [Google Highly Open Participation](http://code.google.com/opensource/ghop/2007-8/) (GHOP): 17 tasks providing 40 rules (2007/2008), renamed [Google Code In](http://www.google-melange.com/gci/task/list_org_tasks/google/gci2010/mono) (2010/2011) : 30 tasks providing 30 rules and a few tools/templates. If you are interested in such tasks please see the [StudentProjects]({{site.github.url}}/old_site/StudentProjects "StudentProjects") page.

Runners
=======

Gendarme's rules are executed against user code by using a 'runner'. This is the application responsible to load the rules, user assemblies, analysis and finally reporting defects. Gendarme currently ships with two different runners.

Console
-------

A console-based runner is available to use Gendarme, and the rules, on your own compiled assemblies. It is capable to output its results directly on the console, into XML files or into nice looking HTML reports.

This runner is the one that includes the most features. To see every options just type the following command in your terminal:

    man gendarme

Wizard
------

A System.Windows.Forms-based GUI runner is also part of the Gendarme distribution. This is a step-by-step, wizard-based, runner that allows you to select assemblies, rules, options and report the analysis results just like the console runner does (i.e. text, xml or html reports). However it has fewer options (to remain simple) than the console runner.

CruiseControl.NET
-----------------

[Daniel Nauck](http://www.mono-project.de/) (dna on [IRC]({{site.github.url}}/old_site/IRC "IRC")) contributed Gendarme support for [CC.NET](http://confluence.public.thoughtworks.org/display/CCNET/Welcome+to+CruiseControl.NET). You can find the documentation [here](http://confluence.public.thoughtworks.org/display/CCNET/Using+CruiseControl.NET+with+Gendarme). Note: The Gendarme task is available since CC.NET version 1.4.3.

NAnt
----

[Néstor Salceda](http://nestor.babuine.net/), a long time Gendarme contributor, has released a first preview version of a [NAnt](http://nant.sourceforge.net/) task-based runner. A [screencast](http://nestor.babuine.net/wp-content/uploads/2008/10/gendarme-nant.ogg) showing it in action is available. The preview can be downloaded from Gendarme's Google Group [files section](http://groups.google.com/group/gendarme/files).

Daniel Nauck (dna) also created a NAnt task for Gendarme. Unlike the previous one this is not a runner itself but calls the console runner, which reduce the build dependencies.

Rules
=====

Gendarme is modular and load all of it's rules from assemblies, i.e. there are no hard-coded, static, rules.

For the console runner the list of assemblies to load rules from is defined in the **rules.xml** configuration file and can be adapted to different needs (e.g. project specific rules). The wizard runner will display all rules from every assemblies present in it's installation directory.

Current rules are divided into the following categories/assemblies:

-   [Gendarme.Rules.BadPractice]({{site.github.url}}/old_site/Gendarme.Rules.BadPractice "Gendarme.Rules.BadPractice")
-   [Gendarme.Rules.Concurrency]({{site.github.url}}/old_site/Gendarme.Rules.Concurrency "Gendarme.Rules.Concurrency")
-   [Gendarme.Rules.Correctness]({{site.github.url}}/old_site/Gendarme.Rules.Correctness "Gendarme.Rules.Correctness")
-   [Gendarme.Rules.Design]({{site.github.url}}/old_site/Gendarme.Rules.Design "Gendarme.Rules.Design")
-   [Gendarme.Rules.Design.Generic]({{site.github.url}}/old_site/Gendarme.Rules.Design.Generic "Gendarme.Rules.Design.Generic") (new in 2.2)
-   [Gendarme.Rules.Design.Linq]({{site.github.url}}/old_site/Gendarme.Rules.Design.Linq "Gendarme.Rules.Design.Linq") (new in 2.2)
-   [Gendarme.Rules.Exceptions]({{site.github.url}}/old_site/Gendarme.Rules.Exceptions "Gendarme.Rules.Exceptions")
-   [Gendarme.Rules.Interoperability]({{site.github.url}}/old_site/Gendarme.Rules.Interoperability "Gendarme.Rules.Interoperability")
-   [Gendarme.Rules.Maintainability]({{site.github.url}}/old_site/Gendarme.Rules.Maintainability "Gendarme.Rules.Maintainability") (new in 2.0)
-   [Gendarme.Rules.Naming]({{site.github.url}}/old_site/Gendarme.Rules.Naming "Gendarme.Rules.Naming")
-   [Gendarme.Rules.Performance]({{site.github.url}}/old_site/Gendarme.Rules.Performance "Gendarme.Rules.Performance")
-   [Gendarme.Rules.Portability]({{site.github.url}}/old_site/Gendarme.Rules.Portability "Gendarme.Rules.Portability")
-   [Gendarme.Rules.Security]({{site.github.url}}/old_site/Gendarme.Rules.Security "Gendarme.Rules.Security")
-   [Gendarme.Rules.Security.Cas]({{site.github.url}}/old_site/Gendarme.Rules.Security.Cas "Gendarme.Rules.Security.Cas") (new in 2.2)
-   [Gendarme.Rules.Serialization]({{site.github.url}}/old_site/Gendarme.Rules.Serialization "Gendarme.Rules.Serialization") (new in 2.0)
-   [Gendarme.Rules.Smells]({{site.github.url}}/old_site/Gendarme.Rules.Smells "Gendarme.Rules.Smells")
-   [Gendarme.Rules.Ui]({{site.github.url}}/old_site/Gendarme.Rules.Ui "Gendarme.Rules.Ui")

Download
========

Linux
-----

-   Gendarme is part of **mono-tools** and is available on most recent Linux distributions
-   Packages for many distributions and, from time to time, preview versions are also available from the [openSUSE Build Service](http://software.opensuse.org/search?baseproject=ALL&p=1&q=mono-tools)

Windows
-------

-   Win32 installers (msi) are available on [github](https://github.com/spouliot/gendarme/downloads) web site. The .NET framework version 3.5 (or later) needs to be installed prior to running the setup.

Binaries only (multi-platform)
------------------------------

-   ZIP files that contains Gendarme's binaries and configuration files are also available on the [github](https://github.com/spouliot/gendarme/downloads) web site. They requires Mono 2.8 or the .NET framework 3.5 to be installed to execute properly.

Source Code
-----------

-   From GIT (master): `git clone https://github.com/mono/mono-tools.git`
-   Browse [GIT](https://github.com/mono/mono-tools/tree/master/gendarme) for individual files

Other Cool Stuff
----------------

-   [NAnt task runner](http://groups.google.com/group/gendarme/files)

Resources
=========

-   What's planned ? [Gendarme.Roadmap]({{site.github.url}}/old_site/Gendarme.Roadmap "Gendarme.Roadmap")
-   What's happening ? You can read real-time news on Gendarme's development on its [Ohloh's journal](http://www.ohloh.net/projects/gendarme/messages).

Getting Help
------------

-   A list of frequently asked questions can be found in [Gendarme.FAQ]({{site.github.url}}/old_site/Gendarme.FAQ "Gendarme.FAQ").
-   You can find some basic answers about developing rules, or hacking on Gendarme itself, in the [FAQ]({{site.github.url}}/old_site/Gendarme.Development.FAQ "Gendarme.Development.FAQ").
-   You are welcome to participate in Gendarme's discussions on [it's Google Group](http://groups.google.com/group/gendarme). This group is used for both users and developers of Gendarme.
-   Gendarme's fans are also present on [IRC]({{site.github.url}}/old_site/IRC "IRC") (\#gendarme on GIMPnet).

Feedback
========

Please report any documentation errors, typos or suggestions to the [Gendarme Google Group](http://groups.google.com/group/gendarme). Thanks!

