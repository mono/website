---
layout: obsolete
title: "Accessibility: Roadmap"
lastmodified: '2009-03-16'
permalink: /old_site/Accessibility:_Roadmap/
redirect_from:
  - /Accessibility:_Roadmap/
---

Accessibility: Roadmap
======================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#introduction">1 Introduction</a></li>
<li><a href="#current-release">2 Current release</a>
<ul>
<li><a href="#release-10---march-17th-2009">2.1 Release 1.0 - March 17th 2009</a></li>
</ul></li>
<li><a href="#upcoming-releases">3 Upcoming releases</a>
<ul>
<li><a href="#release-11---mid-late-april-2009">3.1 Release 1.1 - Mid-late April 2009</a></li>
</ul></li>
<li><a href="#past-releases">4 Past releases</a>
<ul>
<li><a href="#release-091---december-6th-2008">4.1 Release 0.9.1 - December 6th 2008</a></li>
<li><a href="#release-09---november-26th-2008">4.2 Release 0.9 - November 26th 2008</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Introduction
------------

This page contains a high level view of the UI Automation accessibility project. If you are looking for a detailed view of the project schedule, you can view the [project schedule]({{ site.github.url }}/old_site/Accessibility:_Project_Schedule "Accessibility: Project Schedule") page.

The big picture of the [roadmap]({{ site.github.url }}/old_site/Accessibility:_Roadmap "Accessibility: Roadmap") can be broken down into two phases with target dates as follows:

-   Phase 1 - Q1 2009 - UIA Provider and WinForms integration
    -   The UIA Provider interfaces will be implemented to support Windows Forms on Mono.
    -   The ATK/UIA bridge will be completed.
    -   Windows Forms applications running on Linux (in Mono) will be accessible using available Linux ATs.
-   Phase 2 - Q4 2009 - UIA Client and Moonlight integration
    -   The UIA Client will be implemented using AT-SPI as the IPC.
    -   The UIA Provider interfaces will be implemented to support Moonlight.
    -   The AT-SPI/UIA bridge will be completed and UIA based ATs will be able to provide support for all ATK enabled apps.
    -   Moonlight based applications will be accessible using available Linux ATs as well as UIA based ATs.

Current release
---------------

### [Release 1.0 - March 17th 2009]({{ site.github.url }}/old_site/Accessibility:_Release_Notes_1.0 "Accessibility: Release Notes 1.0")

100% of the System.Windows.Forms controls supported.

Upcoming releases
-----------------

### Release 1.1 - Mid-late April 2009

Bugfix follow-up to 1.0.

Past releases
-------------

### [Release 0.9.1 - December 6th 2008]({{ site.github.url }}/old_site/Accessibility:_Release_Notes_0.9.1 "Accessibility: Release Notes 0.9.1")

Bugfix release for 0.9.

### [Release 0.9 - November 26th 2008]({{ site.github.url }}/old_site/Accessibility:_Release_Notes_0.9 "Accessibility: Release Notes 0.9")

Initial preview release, not all controls covered.

