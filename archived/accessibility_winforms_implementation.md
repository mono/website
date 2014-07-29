---
layout: obsolete
title: "Accessibility: Winforms Implementation"
lastmodified: '2008-08-11'
permalink: /archived/Accessibility:_Winforms_Implementation/
redirect_from:
  - /Accessibility:_Winforms_Implementation/
---

Accessibility: Winforms Implementation
======================================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#diagram">1 Diagram</a></li>
<li><a href="#definitions">2 Definitions</a>
<ul>
<li><a href="#provider">2.1 Provider</a></li>
<li><a href="#behavior">2.2 Behavior</a></li>
<li><a href="#event">2.3 Event</a></li>
<li><a href="#navigation">2.4 Navigation</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Diagram
-------

[![Uia-winform-diagram.png]({{ site.github.url }}/images/4/46/Uia-winform-diagram.png)]({{ site.github.url }}/images/4/46/Uia-winform-diagram.png)

Definitions
-----------

### Provider

Represents the mechanism to support UI Automation in Windows Forms Controls.

Each Provider may support several Behaviors in order to support different Control Patterns. Internally the Provider implementation is mapped to its Control Pattern specialization, thus, the pattern and its properties are requested through the Automation methods, such as GetPropertyValue and GetPatternProvider.

### Behavior

Represents the Control Pattern implementation supported in the Control Type that may or may not be used dynamically within the Provider.

Some Providers may need to support different Control Patterns dynamically depending on the control properties, for example, when ComboBox Control changes its Drop down style, the ComboBoxProvider supports different Control Patterns. Enabling and disabling Behaviors to support or don't support Control Patterns in the Provider must be set by the Provider itself.

### Event

Represents the relation between Windows Forms Control events and Automation Events.

Several Automation Events are generated in the same way in the Automation Framework, however the Controls may emit the event in different ways.

### Navigation

Defines the logic to Navigate through the elements tree.

The navigation is defined automatically based on the Provider base class:

-   Provider subclassing FragmentControlProvider, then navigation is ChildNavigation.
-   Provider subclassing FragmentRootControlProvider, then navigation is ParentNavigation.

The following example is listed in the following order: **Control Class - Control Type - Navigation Type**:

-   Form - Window - ParentNavigation
    -   ListBox - List - ParentNavigation
        -   HScrollBar - ScrollBar - ParentNavigation
            -   FirstButton - Button - ChildNavigation
            -   SecondButton - Button - ChildNavigation
            -   Thumb - Thumb - ChildNavigation
            -   ThirdButton - Button - ChildNavigation
            -   FourthButton - Button - ChildNavigation
        -   Item0 - ListItem - ChildNavigation
        -   Item1 - ListItem - ChildNavigation
        -   VScrollBar - ScrollBar - ParentNavigation
            -   FirstButton - Button - ChildNavigation
            -   SecondButton - Button - ChildNavigation
            -   Thumb - Thumb - ChildNavigation
            -   ThirdButton - Button - ChildNavigation
            -   FourthButton - Button - ChildNavigation
    -   Label - Text - ChildNavigation

Be aware **ALL** children are added to the end of the navigation list, so the navigation is defined dynamically according added and removed children, for example, *ListBox* with 2 items may have any the following navigation depending of internal control properties:

-   Item0, HScrollBar, Item1, VScrollBar
-   Item0, Item1, VScrollBar, HScrollBar
-   Item0, Item1, HScrollBar
-   ...


