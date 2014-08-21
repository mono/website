---
title: "Accessibility: Bug Specification"
lastmodified: '2009-02-24'
redirect_from:
  - /Accessibility:_Bug_Specification/
  - /Accessibility:_Bug_Template/
---

Accessibility: Bug Specification
================================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#references">1 References</a></li>
<li><a href="#definitions">2 Definitions</a></li>
<li><a href="#bug-specification">3 Bug Specification</a>
<ul>
<li><a href="#purpose">3.1 Purpose</a></li>
<li><a href="#remember">3.2 Remember</a></li>
<li><a href="#bug-template">3.3 Bug Template</a>
<ul>
<li><a href="#problem-statement">3.3.1 PROBLEM STATEMENT:</a></li>
<li><a href="#repro">3.3.2 REPRO:</a></li>
<li><a href="#results">3.3.3 RESULTS:</a></li>
<li><a href="#expected-results">3.3.4 EXPECTED RESULTS:</a></li>
<li><a href="#comments">3.3.5 COMMENTS:</a></li>
</ul></li>
<li><a href="#definitions_2">3.4 Definitions</a>
<ul>
<li><a href="#severity">3.4.1 SEVERITY</a></li>
<li><a href="#priority">3.4.2 PRIORITY</a></li>
</ul></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

References
----------

[Product Test Case Plan](/Accessibility:_Test_Plan "Accessibility: Test Plan")
 [Product Test Case Specification](/Accessibility:_Test_Case_Specification "Accessibility: Test Case Specification")
 [Product Test Log](/Accessibility:_Test_Log "Accessibility: Test Log")
 [Product Test Summary](/Accessibility:_Test_Summary "Accessibility: Test Summary")
 [Product Bug Specification](/Accessibility:_Bug_Specification) (current page)
 [Product Home](/Accessibility "Accessibility")

Definitions
-----------

FCS Release---(F)inal (C)ustomer (S)hipping Release

Bug Specification
-----------------

### Purpose

This is the template that should be used for all bugs when they are entered into Bugzilla. Here is an [example](https://bugzilla.novell.com/show_bug.cgi?id=459153).

### Remember

Whenever you log a bug, please remember to add a comment with a [bug reference](/Accessibility:_Testing_Howto#bug-references "Accessibility: Testing Howto") (e.g., BUG459153) where the bug occurs in your test. You must use the syntax BUG[0-9][0-9][0-9][0-9][0-9][0-9] so it can be easily found when regressing bugs.

### Bug Template

* * * * *

#### PROBLEM STATEMENT

*More detailed expansion of summary. (The summary is a very abstract description of the problem required by Bugzilla to create a bug.)*

#### REPRO

*Detailed step-by-step instructions that instruct the reader how to reproduce the bug. The instructions should be detailed and clear enough that anyone (developer, community member, new employee) can reproduce the bug. Remember to include any special setup steps.*

#### RESULTS

*What happens what the REPRO steps are followed*

#### EXPECTED RESULTS

*What \*should\* happen when the REPRO steps are followed*

#### COMMENTS

*Any additional information*

* * * * *

### Definitions

Here are some definitions to keep in mind when submitting a bug in Bugzilla:

#### SEVERITY

Define defect severity value by Bugzilla default severity definition. The severity describes the impact of a bug.

-   Blocker: Prevents developers or testers from performing their jobs. Impacts the development process.
-   Critical: Crash, loss of data, corruption of data, severe memory leak.
-   Major: Major loss of function, as specified in the product requirements for this release, or existing in the current
-   Normal: Non-major loss of function.
-   Minor: Issue that can be viewed as trivial (e.g. cosmetic, UI, easily documented).
-   Enhancement: Request for software enhancement, or any non-defect task or work item.

#### PRIORITY

Define defect priority value by Bugzilla default priority definition. The priority specifies the level of urgency to be resolved for the defect.

-   P1-Urgent: Defects are urgent issues. Developers should try to fix P1 issues as soon as possible during the current iteration.
-   P2-High: Defects must be resolved in this release. Developers should try to fix P2 issues during the next iteration.
-   P3-Medium: Defects would like to be fix, but won't hold shipment for them.
-   P4-Low: Defects are not as strong as desirable.

Bugzilla has many fields that provide additional information (e.g., environment details, found in version, etc.). Please provide as much information as possible when logging bugs.

