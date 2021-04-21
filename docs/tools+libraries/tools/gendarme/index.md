---
title: Gendarme
redirect_from:
  - /Gendarme/
---

Gendarme is a extensible rule-based tool to find problems in .NET applications and libraries. Gendarme inspects programs and libraries that contain code in ECMA CIL format (Mono and .NET) and looks for common problems with the code, problems that compiler do not typically check or have not historically checked.

Gendarme uses the [Cecil](/docs/tools+libraries/libraries/Mono.Cecil/) library to introspect code.

Why ?
=====

1.  Because we often repeat our mistakes. The biggest one being not to review things we *know*.
2.  Because it's a lot funnier (and safer) to write a rule than to review millions of source lines of code (SLOC) to ensure it's being followed.

History
=======

Gendarme was originally created by Sebastien Pouliot to assist in the security auditing process in Mono. Aaron Tomb later integrated his .NET bug-finding code (supported by the 2005 Google Summer of Code, GSoC) into the same framework. Since then the number of [contributors](https://github.com/mono/mono-tools/blob/master/gendarme/AUTHORS) and rules has been growing.

Many Gendarme tasks have been realized in [Google Summer Of Code](http://code.google.com/soc/2008/) (GSoC): three projects in 2007, one in 2008 - and in the [Google Highly Open Participation](https://developers.google.com/open-source/ghop) (GHOP): 17 tasks providing 40 rules (2007/2008), renamed [Google Code In](http://www.google-melange.com/gci/task/list_org_tasks/google/gci2010/mono) (2010/2011) : 30 tasks providing 30 rules and a few tools/templates. If you are interested in such tasks please see the [StudentProjects](/community/google-summer-of-code/projects/) page.

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

Daniel Nauck (dna on [Chat](/community/help/chat/)) contributed Gendarme support for [CC.NET](https://sourceforge.net/projects/ccnet/). Note: The Gendarme task is available since CC.NET version 1.4.3. CC.NET has not been updated since 2014.

NAnt
----

[Néstor Salceda](https://nestorsalceda.com/), a long time Gendarme contributor, has released a first preview version of a [NAnt](http://nant.sourceforge.net/) task-based runner. Gendarme has a Google Group which can be found [here](https://groups.google.com/g/gendarme).

Daniel Nauck (dna) also created a NAnt task for Gendarme. Unlike the previous one this is not a runner itself but calls the console runner, which reduce the build dependencies.

Rules
=====

Gendarme is modular and load all of it's rules from assemblies, i.e. there are no hard-coded, static, rules.

For the console runner the list of assemblies to load rules from is defined in the **rules.xml** configuration file and can be adapted to different needs (e.g. project specific rules). The wizard runner will display all rules from every assemblies present in it's installation directory.

Current rules are divided into the following categories/assemblies:

-   [Gendarme.Rules.BadPractice](/docs/tools+libraries/tools/gendarme/rules/bad-practice/)
-   [Gendarme.Rules.Concurrency](/docs/tools+libraries/tools/gendarme/rules/concurrency/)
-   [Gendarme.Rules.Correctness](/docs/tools+libraries/tools/gendarme/rules/correctness/)
-   [Gendarme.Rules.Design](/docs/tools+libraries/tools/gendarme/rules/design/)
-   [Gendarme.Rules.Design.Generic](/docs/tools+libraries/tools/gendarme/rules/design-generic/)
-   [Gendarme.Rules.Design.Linq](/docs/tools+libraries/tools/gendarme/rules/design-linq/) (new in 2.2)
-   [Gendarme.Rules.Exceptions](/docs/tools+libraries/tools/gendarme/rules/exceptions/)
-   [Gendarme.Rules.Interoperability](/docs/tools+libraries/tools/gendarme/rules/interoperability/)
-   [Gendarme.Rules.Maintainability](/docs/tools+libraries/tools/gendarme/rules/maintainability/) (new in 2.0)
-   [Gendarme.Rules.Naming](/docs/tools+libraries/tools/gendarme/rules/naming/)
-   [Gendarme.Rules.Performance](/docs/tools+libraries/tools/gendarme/rules/performance/)
-   [Gendarme.Rules.Portability](/docs/tools+libraries/tools/gendarme/rules/portability/)
-   [Gendarme.Rules.Security](/docs/tools+libraries/tools/gendarme/rules/security/)
-   [Gendarme.Rules.Security.Cas](/docs/tools+libraries/tools/gendarme/rules/security-cas/) (new in 2.2)
-   [Gendarme.Rules.Serialization](/docs/tools+libraries/tools/gendarme/rules/serialization/) (new in 2.0)
-   [Gendarme.Rules.Smells](/docs/tools+libraries/tools/gendarme/rules/smells/)
-   [Gendarme.Rules.Ui](/docs/tools+libraries/tools/gendarme/rules/ui/)

Download
========

Linux
-----

-   Gendarme is part of **mono-tools** and is available on most recent Linux distributions
-   Packages for many distributions and, from time to time, preview versions are also available from the [openSUSE Build Service](http://software.opensuse.org/search?baseproject=ALL&p=1&q=mono-tools)

Windows
-------

-   Win32 installers (msi) are available on [GitHub](https://github.com/spouliot/gendarme/downloads) web site. The .NET framework version 3.5 (or later) needs to be installed prior to running the setup.

Binaries only (multi-platform)
------------------------------

-   ZIP files that contains Gendarme's binaries and configuration files are also available on the [GitHub](https://github.com/spouliot/gendarme/downloads) web site. They requires Mono 2.8 or the .NET framework 3.5 to be installed to execute properly.

Source Code
-----------

-   From Git (master): `git clone https://github.com/mono/mono-tools.git`
-   Browse [Git](https://github.com/mono/mono-tools/tree/master/gendarme) for individual files

Other Cool Stuff
----------------

-   [NAnt task runner](http://groups.google.com/group/gendarme/files)

Resources
=========

-   What's planned ? [Gendarme.Roadmap](/docs/tools+libraries/tools/gendarme/roadmap/)
-   What's happening ? You can read real-time news on Gendarme's development on its [Ohloh's journal](http://www.ohloh.net/projects/gendarme/messages).

Getting Help
------------

-   A list of frequently asked questions can be found in [Gendarme.FAQ](/docs/tools+libraries/tools/gendarme/faq/).
-   You can find some basic answers about developing rules, or hacking on Gendarme itself, in the [FAQ](/docs/tools+libraries/tools/gendarme/development-faq/).
