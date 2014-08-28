---
title: "Accessibility: Release Notes 0.9.1"
lastmodified: '2009-02-06'
redirect_from:
  - /Accessibility:_Release_Notes_0.9.1/
---

Accessibility: Release Notes 0.9.1
==================================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#mono-accessibility-091-release-notes">1 Mono Accessibility 0.9.1 Release Notes</a>
<ul>
<li><a href="#supported-controls">1.1 Supported Controls</a></li>
<li><a href="#notes">1.2 Notes</a></li>
<li><a href="#errata">1.3 Errata</a></li>
<li><a href="#downloading">1.4 Downloading</a></li>
<li><a href="#contributors">1.5 Contributors</a></li>
<li><a href="#reporting-bugs">1.6 Reporting Bugs</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Mono Accessibility 0.9.1 Release Notes
======================================

The Mono Accessibility project enables Windows applications to be fully accessible on Linux.

This release is a developer release, meaning that it has not gone through exhaustive testing, and as such should not be used for production tasks.

**NOTE:** This release will not work with (the -- as of yet -- unreleased) Mono 2.4 or GTK# 2.12.8. Version 1.0 will not have this limitation and will be released shortly.

Codename: Calculon

*Release Date: Feb 5th, 2009*

Supported Controls
------------------

-   Button
-   CheckBox
-   CheckedListBox
-   ComboBox (only DropDown & DropDownList styles)
-   DomainUpDown
-   ErrorProvider
-   Form
-   GroupBox
-   HelpProvider
-   HScrollBar
-   Label
-   LinkLabel
-   ListBox
-   ListView
-   MenuStrip
-   NumericUpDown
-   Panel
-   PictureBox
-   ProgressBar
-   RadioButton
-   RichTextBox
-   ScrollBar
-   StatusBar
-   StatusBarPanel
-   StatusStrip
-   TextBox
-   ToolStrip
-   ToolStripComboBox
-   ToolStripDropDownButton
-   ToolStripLabel
-   ToolStripMenuItem
-   ToolStripProgressBar
-   ToolStripSplitButton
-   ToolStripTextBox
-   ToolTip
-   VScrollBar
-   WebBrowser

Notes
-----

-   ToolStripSplitButton: Add support.
-   ToolStripDropDownButton: Fixed invoke behavior.
-   RadioButton: Listen for ISelectedProperty change event rather than ElementSelected event.
-   ListItem, Spinner: Only set Editable state if not ReadOnly

Bugs Fixed:

-   [#449599](https://bugzilla.novell.com/show_bug.cgi?id=449599) - Selection implemented for ComboBox items
-   [#444325](https://bugzilla.novell.com/show_bug.cgi?id=444325) - MessageBox should have a Dialog role not a Frame role
-   [#449317](https://bugzilla.novell.com/show_bug.cgi?id=449317) - Handle basic AutomationEvents for StatusBarPanel
-   [#448465](https://bugzilla.novell.com/show_bug.cgi?id=448465) - Change role of StatusBarPanel from Edit to Text.
-   [#456319](https://bugzilla.novell.com/show_bug.cgi?id=456319) - Fix crash after clicking the text box inside of ComboBox
-   [#456336](https://bugzilla.novell.com/show_bug.cgi?id=456336) - Fix Focused state of ComboBox
-   [#447240](https://bugzilla.novell.com/show_bug.cgi?id=447240) - Properly set Name of LinkLabel controls
-   [#447231](https://bugzilla.novell.com/show_bug.cgi?id=447231) - Properly set Role of LinkLabel controls
-   [#457787](https://bugzilla.novell.com/show_bug.cgi?id=457787) - Fix accessibility bridge loading issue on openSUSE 11.1

Errata
------

-   WebBrowser support is pending the resolution of [#427866](https://bugzilla.novell.com/show_bug.cgi?id=427866) for focus events to be properly captured.
-   Changing the View property in the ListView control to/from View.Details is not supported yet. [#428525](https://bugzilla.novell.com/show_bug.cgi?id=428525)
-   MessageBox does not yet export details about its message text. [#447783](https://bugzilla.novell.com/show_bug.cgi?id=447783)
-   Items cleared from a ToolStrip or ToolStripDropDownItem may still appear in ATK ([#446783](https://bugzilla.novell.com/show_bug.cgi?id=446783))
-   Support for focus and selection events for ToolStripItem is incomplete ([#443971](https://bugzilla.novell.com/show_bug.cgi?id=443971)).
-   RadioButtons don't have a MemberOf relation yet. [#447885](https://bugzilla.novell.com/show_bug.cgi?id=447885)
-   Text attributes are not present in any Atk.Object yet ([#442581](https://bugzilla.novell.com/show_bug.cgi?id=442581)) because of a bug in the Atk# binding: [#393565](https://bugzilla.novell.com/show_bug.cgi?id=393565).
-   Active state of a Form is not removed when switching to another application (due to a [limitation](/Accessibility:_Specification_Notes#Feature_requests) in the Provider API) ([#445199](https://bugzilla.novell.com/show_bug.cgi?id=445199))

Downloading
-----------

Mono Accessibility is available for a variety of Linux distributions, including:

-   OpenSUSE 11.0 - [1-Click Install](http://download.opensuse.org/repositories/Mono:/UIA/MonoPreviewOpenSUSE_11.0/mono-uia.ymp)
-   OpenSUSE 11.1 - [1-Click Install](http://download.opensuse.org/repositories/Mono:/UIA/MonoPreviewOpenSUSE_11.1/mono-uia.ymp)

If packages aren't available for your distribution, you'll probably have to install Mono Accessibility from source. Step-by-step instructions are [available](/Accessibility:_Installing_From_Source "Accessibility: Installing From Source").

If you just want to grab a source tarball, check out the [Novell ftp](ftp://ftp.novell.com/pub/mono/uia/) page.

Contributors
------------

The following people have contributed to making this release happen:

> Andrés G. Aragoneses, Brad Taylor, Brian Merrell, Calen Chen, Calvin Gaisford, Mario Carrion, Michael Gorse, Neville Gao, Ray Wang, Sandy Armstrong, Stephen Shaw

Reporting Bugs
--------------

If you find any issues with this release, please don't hesitate to [file bugs](https://bugzilla.novell.com/enter_bug.cgi?product=UI%20Automation).

If you want to contribute or need specific assistance, please join our [mailing list](http://forge.novell.com/mailman/listinfo/mono-a11y), or drop in [#mono-a11y](irc://irc.gimp.org/mono-a11y) on irc.gimp.org.

