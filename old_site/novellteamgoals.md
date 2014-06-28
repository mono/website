---
layout: obsolete
title: "NovellTeamGoals"
lastmodified: '2010-02-01'
permalink: /old_site/NovellTeamGoals/
redirect_from:
  - /NovellTeamGoals/
---

NovellTeamGoals
===============

This page documents the goals of the Mono team at Novell.

This is a work in progress.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#organization">1 Organization</a></li>
<li><a href="#communication">2 Communication</a></li>
<li><a href="#documentation">3 Documentation</a></li>
<li><a href="#teams">4 Teams</a>
<ul>
<li><a href="#runtime-team">4.1 Runtime Team</a>
<ul>
<li><a href="#runtime-team-goals">4.1.1 Runtime Team Goals</a></li>
</ul></li>
<li><a href="#windowsforms-team">4.2 Windows.Forms Team</a></li>
<li><a href="#windowsforms-goals">4.3 Windows.Forms Goals</a></li>
<li><a href="#moonlight-team">4.4 Moonlight Team</a></li>
<li><a href="#monodevelop-team">4.5 MonoDevelop Team</a></li>
<li><a href="#other-groups">4.6 Other Groups</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Organization
============

Each member of the team should post a weekly status report to the internal x-m-l mailing list describing what they worked on during the week, and what are the plans for the next week. This status report must be posted on Friday before adjourning for the weekend to give Miguel a chance to provide feedback and direction for the work in the upcoming week.

It is the responsibility of team leaders to update the goals set in this page for each individual team and to provide task assignments and monthly project overviews in the internal mailing lists.

Since Mono is a relatively small team compared to the goals of the project, developers in the team should do much more than just write code, each developer should:

-   Run the [test suite]({{ site.github.url }}/old_site/Test_Suite "Test Suite") for the given component.
-   Monitor the [build bots](http://wrench.mono-project.com/builds) for potential failures and regressions.
-   When writing code, ensure that tests exist for this new feature.
-   Make sure that proper documentation exists.
-   Write clean, maintainable code, do not skim on the comments.
-   C Runtime code should have inline API documentation for new APIs.

Communication
=============

Communication happens mostly in public forums ([mailing lists]({{ site.github.url }}/old_site/Mailing_Lists "Mailing Lists"), [chat rooms]({{ site.github.url }}/old_site/IRC "IRC") and this web site).

Documentation
=============

Developers should pay special attention when they write code to ensure that features are properly documented: if a feature is not documented, the feature should be considered non-existent and we should consider the work as wasted effort.

If you add a new tool, a new command line option, a new feature to a tool:

-   You must document on a manual page.

If you introduce a new API to Mono-developed APIs:

-   Ensure that there is proper coverage in Monodoc for it
-   If there is no Monodoc framework for it, make sure you [generate it]({{ site.github.url }}/old_site/Generating_Documentation "Generating Documentation").

If you improve or change the semantics of an API:

-   Make sure that [you contribute the update]({{ site.github.url }}/old_site/Monodoc_Contributing "Monodoc Contributing").

If you answer a public question on the forums, consider whether it would not be a good candidate for the FAQs.

If you notice data that is out-of-date on the Wiki, or that is incorrect, please take the time to fix it and update it.

Teams
=====

Runtime Team
------------

Lead: Paolo Molaro.

### Runtime Team Goals

-   Debugger
    -   Plans is available [debugger plans' here]({{ site.github.url }}/old_site/Debugger#plan "Debugger").
-   Generics Support Improvements
    -   The current support needs to be audited, and cleaned up
    -   Optimize memory usage of generics-relate data structures (like removing generic\_container from non-generic MonoMethods).
    -   Far future: code sharing optimizations.
-   Compacting Garbage Collector
-   Correctness/Bug Fixes
    -   The MonoJitInfo lookups need to be made lock-less
-   Performance Optimizations
    -   Mono Runtime vNext should use linear-ir branch.
    -   New register allocator on the linear-ir branch.
    -   Interface table dispatch memory reduction.
    -   Review generated JIT code quality, and improve it.
    -   Remove type check from generic stelemref when we store a T inside a T[] (and maybe also for ArrayList)
-   Security:
    -   Implementation of the Mono Verifier
    -   Implement stack overflow clean shutdown.
    -   Implement new sandboxed execution system (see [Moonlight]({{ site.github.url }}/old_site/Moonlight#security-model "Moonlight") for details).
-   Reduce Memory Usage
    -   For all runtime data structures (MonoMethod, MonoClassField, MonoClass, exception tables).
-   IO-Layer
    -   Towards a SHM-less world
    -   Removal of shared process and thread handles

Some other ideas, not critical:

-   Support AOT on more platforms (PPC, ARM).
-   Support full pre-AOTing (not decided).

Windows.Forms Team
------------------

Lead: Chris Toshok

Windows.Forms Goals
-------------------

-   WebControl implemented on top of Mozilla
    -   See module mozembed for Zac's work-in-progress
-   Complete the 2.0 API

Moonlight Team
--------------

Details about the Silverlight implementation are available on the [Moonlight]({{ site.github.url }}/old_site/Moonlight "Moonlight") page.

MonoDevelop Team
----------------

Lead: Lluis Sánchez

Ship MonoDevelop 1.0, the planning document is:

-   [[1]](http://spreadsheets.google.com/ccc?key=pS-RZuhR9F_CaaOcopqtFOg)

Other Groups
------------

Other groups include developers that do not directly belong to any of the previous groups, that own code in various places, or that on temporary loans to other projects (Mike Kestner for Gtk\#)

Lead by default: Miguel de Icaza

