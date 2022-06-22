---
title: "Workflow"
lastmodified: '2010-12-14'
redirect_from:
  - /Workflow/
---

Workflow
========

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#introduction">1 Introduction</a></li>
<li><a href="#status">2 Status</a></li>
<li><a href="#contributions">3 Contributions</a></li>
<li><a href="#roadmap">4 Roadmap</a></li>
<li><a href="#getting-a-copy">5 Getting a copy</a></li>
<li><a href="#compiling-samples">6 Compiling samples</a></li>
<li><a href="#resources">7 Resources</a></li>
<li><a href="#other-open-source-workflow-projects">8 Other open source workflow projects</a></li>
</ul></td>
</tr>
</tbody>
</table>

Introduction
------------

Welcome to Windows Workflow Foundation Mono implementation.

Windows Workflow Foundation (WF) has been introduced as part of Microsoft .Net 3.0 framework (formerly called WinFX). It is a namespace and a set of tools designed for building workflow enabled applications on .Net.

The WF is implemented using three assemblies: System.Workflow.Activities, System.Workflow.ComponentModel and System.Workflow.Runtime.

Microsoft WF is a very sophisticated workflow engine that supports persistence (hydratation, dehydratation), tracking, visual design, compiling, communications, timer and rules services and it is highly extensible from new activities to new hosts. Windows Workflow Foundation also provides an extensible model and designer to build custom activities which encapsulate workflow functionality for end-users. WWF it is heavily object oriented designed and a bit overbloatted.

Microsoft also allows to define workflows using XOML (Extensible Object Markup Language) and provides a compiler for it.

Status
------

This library is in pre-alpha state. Development is still in the very early stages. Bug reports are welcome, provided they don't just point out missing classes. Please use [http://bugzilla.ximian.com/](http://bugzilla.ximian.com/).

This table describes the main features provided by WF and its level of implementation.

|Feature|Description|Status|
|:------|:----------|:-----|
|Activities|Collection of different tasks that a workflow can perform.|About 70% of activities are implemented|
|Communication|Different communications services from Queues to data activities|Queues and some basic communication are implemented.|
|Compensation|Role back the changes in a not finished workflow.|Not implemented|
|Compiler services|Services to build compilers from XOML|Not implemented|
|Dynamic update|Allows updating a workflow that has been already started in run-time|Not implemented|
|Persistence|Persistence with different providers including databases|Not implemented|
|Rules|Provide policy execution and CodeDOM condition evaluation|Basic rules and the main CodeDOM rules are implemented|
|Tracking||Not implemented|
|Visual designers|Allow to draw the representation of a workflows on a System.Drawing surface.|Not implemented|

Contributions
-------------

Some indications when contributing to this namespace:

-   Contributions providing only stubs are not useful at this point. Our goal is to have a consistent and complete working implementation. New classes, enumerator or interfaces should be defined as they are need it as progress is made in the implementation.

-   For every new class or behavior added to a class provide a clear test case to verify its functionality and it to the test case suite for the assembly.

-   Before committing a change or propose a patch please verify that it does not break any existing test case for any of the three assemblies used to implement WF.

-   Check the Mono [Coding Guidelines](/Coding_Guidelines)

Roadmap
-------

Tentative roadmap for WF:

-   Finish all the activities (including custom ones) and rules. Been able to run the Microsoft technology samples for activities, basic workflows and the OrderStateMachine application.

-   Complete all the communication services.

-   Complete persistence support.

If you are interested in helping in this effort please join the mono-devel-list@lists.dot.net mailing list, explain your experiencie and how you can help.

Getting a copy
--------------

Currently Windows Workflow Foundation (WF) lives in the olive SVN module at mono-cvs.ximian.com subversion.

You can get a copy using an anonymous access:

\$ svn co [svn://anonsvn.mono-project.com/source/trunk/olive](svn://anonsvn.mono-project.com/source/trunk/olive)

Compiling samples
-----------------

You can find some samples at class/System.Workflow.Runtime/Samples/. To compile them you should use:

    gmcs sample.cs -pkg:olive

Resources
---------

-   [Microsoft Windows.Workflow community site](http://wf.netfx3.com/)

-   [Microsoft official site](http://msdn.microsoft.com/winfx/technologies/workflow/default.aspx)

-   The book Presenting Windows Workflow Foundation: ISBN 0672328488

-   The book Essential Windows Workflow Foundation: ISBN 0321399838

-   Microsoft Windows Workflow Foundation Step by Step: ISBN 073562335X

-   Pro WF: Windows Workflow in .NET 3.0: ISBN 1590597788

Other open source workflow projects
-----------------------------------

-   [OpenWFE](http://www.openwfe.org) is an open source workflow engine. It is implemented in Java and is available under the BSD license.

-   [NetBpm](http://www.netbpm.org./) is an open source platform for building, executing and managing workflows

-   [Bossa](http://www.bigbross.com/bossa/) is a workflow engine written in Java
