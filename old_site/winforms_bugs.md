---
layout: obsolete
title: "WinForms Bugs"
permalink: /old_site/WinForms_Bugs/
redirect_from:
  - /WinForms_Bugs/
---

WinForms Bugs
=============

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#prioritization">1 Prioritization</a></li>
<li><a href="#point-descriptions">2 Point Descriptions</a></li>
<li><a href="#examples">3 Examples</a></li>
<li><a href="#working-with-bugzilla">4 Working with Bugzilla</a></li>
<li><a href="#reference">5 Reference</a></li>
</ul></td>
</tr>
</tbody>
</table>

Prioritization
--------------

In an effort to prioritize Winforms bugs, we assign 3 values to each bug, based on the Type, Priority, and Likelihood. This attempts to objectively determine which bugs are the most important for us to concentrate on.

We take the assigned 3 values, multiply them together, and divide by 1.25 to get a total score. Bugs with higher values are considered to give users more "pain", and therefore are the ones we should concentrate on.

Point Descriptions
------------------

**Type (What type of bug is this?)**

-   **5:** Crash, Hang, Regression
-   **4:** Major usability: Impairs usability in key scenarios.
-   **3:** Minor usability: Impairs usability in secondary scenarios.
-   **2:** Visual Defect
-   **1:** Enhancement

**Priority (How will those affected feel about the bug?)**

-   **5:** Blocking further development of Mono.
-   **4:** User cannot use Mono for their application.
-   **3:** User will have to code around issue for their application.
-   **2:** User would notice, but would probably ignore.
-   **1:** User wouldn't notice.

**Likelihood (Who will be affected by this bug)**

-   **5:** Will affect all users. [\> 90%]
    -   Form, Control, etc.
-   **4:** Will affect most users. [60%-90%]
    -   Button, ComboBox, TextBox, ListBox, CheckBox, RadioButton, etc.
-   **3:** Will affect average number of users. [40%-60%]
    -   ToolStrip, DataGrid, DataGridView, Dialogs, WebBrowser, TreeView, ListView, TabControl, etc.
-   **2:** Will only affect a few users. [10%-40%]
    -   SplitContainer, TableLayout, FlowLayout, PropertyGrid, MonthCalendar, ErrorProvider, Windows/Mac Only, etc.
-   **1:** Will affect almost no one. [\< 10%]
    -   Rarely used methods or use cases.

**Note:** The listed controls are guidelines for common use cases. If the bug use case is not common, the likelihood goes down. For example, Form.Region (creating irregularly shaped forms) is a rare use case of Form, and would therefore receive a 1, not a 5.

Examples
--------

A bug where Mono crashes when a user tries to show a Form:
 (5 x 4 x 5) / 1.25 = 80

A bug where TabControl draws a couple of pixels off:
 (2 x 2 x 3) / 1.25 = 9.6

A bug where ListBox doesn't databind correctly:
 (4 x 3 x 4) / 1.25 = 38.4

Working with Bugzilla
---------------------

This value goes into the "Business Priority" field in Bugzilla.

The composite values are available in the "NTS Support\#" field, like this: [5, 4, 5].

You can then choose "Change Columns" at the bottom of the Bugzilla list to add the Business Priority column and sort by it.

Reference
---------

This methodology is adapted from this article:
 [http://lostgarden.com/2008/05/improving-bug-triage-with-user-pain.html](http://lostgarden.com/2008/05/improving-bug-triage-with-user-pain.html)

