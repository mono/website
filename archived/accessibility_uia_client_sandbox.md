---
title: "Accessibility: UIA Client Sandbox"
lastmodified: '2009-02-27'
redirect_from:
  - /Accessibility:_UIA_Client_Sandbox/
---

Accessibility: UIA Client Sandbox
=================================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#specific-tasks-for-research-week">1 Specific Tasks for Research Week</a></li>
<li><a href="#investigate-at-spidbus-cspi-and-cspidbus-and-all-issues-related-to-the-creation-of-managed-bindings-for-at-spi-questions-to-answer">1.1 Investigate at-spi/dbus, cspi and cspi/dbus, and all issues related to the creation of managed bindings for at-spi. Questions to answer:</a></li>
<li><a href="#deliverables-1">1.1.1 Deliverables</a></li>
<li><a href="#investigate-common-users-of-client-api-to-see-how-much-work-it-would-be-to-port-them-to-linux">1.2 Investigate common users of client API, to see how much work it would be to port them to Linux:</a></li>
<li><a href="#deliverables-2">1.2.1 Deliverables</a></li>
<li><a href="#we-want-a-uispy-alike-on-linux-written-in-winforms-for-testing-purposes-dogfooding-verification-etc-investigate-advantagesdisadvantages-of-creating-our-own-tool-vs-extending-uiaverify-consider-these-issues">1.3 We want a UISpy-alike on Linux written in Winforms for testing purposes, dogfooding, verification, etc. Investigate advantages/disadvantages of creating our own tool vs extending UIAVerify. Consider these issues:</a></li>
<li><a href="#deliverables-3">1.3.1 Deliverables</a></li>
<li><a href="#investigate-how-to-perform-mapping-from-at-spi-accessibles-to-uia-automationelements-here-are-the-major-issues">1.4 Investigate how to perform mapping from at-spi accessibles to UIA AutomationElements. Here are the major issues:</a></li>
</ul></td>
</tr>
</tbody>
</table>

Specific Tasks for Research Week
================================

Investigate at-spi/dbus, cspi and cspi/dbus, and all issues related to the creation of managed bindings for at-spi. Questions to answer
---------------------------------------------------------------------------------------------------------------------------------------

-   If we chose to bind to cspi:
    -   What problems to expect when using cspi/corba vs cspi/dbus?
    -   Assuming we have to do all the work, how much effort to complete cspi/dbus?
-   If we chose to bind straight to dbus:
    -   Assuming we have to do a lot of the work, how much effort to complete atspi-dbus to our satisfaction by GNOME 2.28 (6 months)? By GNOME 2.30 (12 months)?
    -   Any issues to look out for with ndesk-dbus?

### Deliverables

-   Email report summarizing findings. Work estimates for each possible approach, along with pros/cons. Include your recommendation, if you have one.

Investigate common users of client API, to see how much work it would be to port them to Linux
----------------------------------------------------------------------------------------------

-   White
-   UIAVerify
-   WindowCatcher
-   Others?

### Deliverables 1

-   Email report summarizing findings. List of popular software already using Client API. For each product/project, include a summary of what it is, a description of work needed to port to Linux, and a ballpark estimate of hours required to do the work. Include your recommendation of which would be most valuable to have running on Linux.

We want a UISpy-alike on Linux written in Winforms for testing purposes, dogfooding, verification, etc. Investigate advantages/disadvantages of creating our own tool vs extending UIAVerify. Consider these issues
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-   How well does MWF support Visual Verify's custom controls?
-   Is upstream (Microsoft) interested in accepting contributions? There has only ever been one revision in their source control. Should we contact MS directly? Fork?
-   How much work to port code that uses Windows-native API to Linux?
-   Any licensing issues? MS-PL.
-   How well does each option exercise the UIA Client API?

### Deliverables 2

-   Email report summarizing findings. If not already done in previous task, include a description or work/hours required to port UIAVerify. Include pros/cons of starting with UIAVerify vs creating our own tool. A report of how well the custom controls work in Linux should also be included (so you need to get this running in Linux somehow). Report on any issues that may affect us regarding the upstream maintainers and the license. Include your recommendation of the course to follow, if you have one.

Investigate how to perform mapping from at-spi accessibles to UIA AutomationElements. Here are the major issues
---------------------------------------------------------------------------------------------------------------

-   How to correctly determine appropriate ControlType and support Control Patterns based on roles, etc.
-   How to emulate AutomationElement.FromHandle for non-Winforms apps, and how to make it work for Winforms apps.
-   Relatedly, how can we get properties from the Provider side to the Client side? Can we use at-spi?
    -   Can we set arbitrary attributes on accessibles, so that an accessible from a Winforms app can have an attribute telling its Control.Handle?
        -   The bridge could return attributes to the client via GetAttributes
        -   Sometimes there are no atk objects (ie, Header, DataItem, Thumb, buttons in ScrollBar or DomainUpDown). We would need to have attributes in their parent to store their name.
        -   It would be better for events to show up exactly as they do in the provider. Otherwise tests might act differently on our implementation. Probably better to replicate UIA events. We already invoke atk-bridge ourselves, so we could call functions in it. We could, therefore, add a raiseEvent method to spiatk that would send a custom signal.
    -   If not, can we extend the info via dbus in at-spi/dbus?
        -   This would probably have to be done without using ndesk-dbus on the bridge, since spiatk uses libdbus, and I don't think that one can share a connection between libdbus and managed dbus. So spiatk would need to have a callback that would allow us to receive dbus messages or their parameters and construct replies. We would need to somehow marshal/demarshal the input/output parameters.
    -   If not, are we forced to create an IPC layer directly between the Provider side and the Client side, bypassing at-spi so we can get more rich info? What are the repercussions of doing this?
        -   Some providers are different from what atk provides (ITextProvider) or don't have equivalents (ITransformProvider)
        -   The registerApplication and getApplications interfaces in org.freedesktop.atspi.Registry could be extended to take an interface type, or the returned bus names could be queried for the interfaces they support.
        -   May mean writing more code, since we have to write code to bridge from atk anyway for gtk applications. However, most of it should be straight-forward, and it would be less vulnerable to errors caused by round-trip translation. It would, thus, be simpler to test, and the time spent writing the code may be offset by having fewer bugs as a result of a cleaner implementation.

### Deliverables 3

-   Email report summarizing findings. Summarize different approaches for getting "extra" data from Provider side to Client side, including comparisons of work involved. Include your recommendation of the course to follow, if you have one.


