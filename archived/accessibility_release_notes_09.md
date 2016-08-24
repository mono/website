---
title: "Accessibility: Release Notes 0.9"
lastmodified: '2008-11-26'
redirect_from:
  - /Accessibility%3A_Release_Notes_0.9/
---

Accessibility: Release Notes 0.9
================================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#mono-accessibility-09-release-notes">1 Mono Accessibility 0.9 Release Notes</a>
<ul>
<li><a href="#supported-controls">1.1 Supported Controls</a></li>
<li><a href="#errata">1.2 Errata</a></li>
<li><a href="#downloading">1.3 Downloading</a></li>
<li><a href="#contributors">1.4 Contributors</a></li>
<li><a href="#reporting-bugs">1.5 Reporting Bugs</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Mono Accessibility 0.9 Release Notes
====================================

The Mono Accessibility project enables Windows applications to be fully accessible on Linux.

This release is a developer release, meaning that it has not gone through exhaustive testing, and as such should not be used for production tasks.

Codename: Zoidberg

*Release Date: Nov 24th, 2008*

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
-   ToolStripTextBox
-   ToolTip
-   VScrollBar
-   WebBrowser

Errata
------

-   WebBrowser support is pending the resolution of [#427866](https://bugzilla.novell.com/show_bug.cgi?id=427866) for focus events to be properly captured.
-   Changing the View property in the ListView control to/from View.Details is not supported yet. [#428525](https://bugzilla.novell.com/show_bug.cgi?id=428525)
-   MessageBox does not yet export details about its message text. [#447783](https://bugzilla.novell.com/show_bug.cgi?id=447783)
-   Items cleared from a ToolStrip or ToolStripDropDownItem may still appear in ATK ([#446783](https://bugzilla.novell.com/show_bug.cgi?id=446783))
-   Support for focus and selection events for ToolStripItem is incomplete ([#443971](https://bugzilla.novell.com/show_bug.cgi?id=443971)).
-   RadioButtons don't have a MemberOf relation yet. [#447885](https://bugzilla.novell.com/show_bug.cgi?id=447885)
-   Text attributes are not present in any Atk.Object yet ([#442581](https://bugzilla.novell.com/show_bug.cgi?id=442581)) because of a bug in the Atk# binding: [#393565](https://bugzilla.novell.com/show_bug.cgi?id=393565).
-   Active state of a Form is not removed when switching to another application (due to a [limitation](/archived/accessibility_specification_notes/#feature-requests) in the Provider API) ([#445199](https://bugzilla.novell.com/show_bug.cgi?id=445199))

Downloading
-----------

Mono Accessibility is available for a variety of Linux distributions, including:

-   OpenSUSE 11.0 - [1-Click Install](http://download.opensuse.org/repositories/Mono:/UIA/MonoPreviewOpenSUSE_11.0/mono-uia.ymp)

If packages aren't available for your distribution, you'll probably have to install Mono Accessibility from source. Step-by-step instructions are [available](/Accessibility:_Installing_From_Source).

If you just want to grab a source tarball, check out the [Novell ftp](ftp://ftp.novell.com/pub/mono/uia/) page.

Contributors
------------

The following people have contributed to making this release happen:

> Andrés G. Aragoneses, Brad Taylor, Brian Merrell, Calen Chen, Calvin Gaisford, Mario Carrion, Michael Gorse, Neville Gao, Ray Wang, Sandy Armstrong, Stephen Shaw

Reporting Bugs
--------------

If you find any issues with this release, please don't hesitate to [file bugs](https://bugzilla.novell.com/enter_bug.cgi?product=UI%20Automation).

If you want to contribute or need specific assistance, please join our [mailing list](http://forge.novell.com/mailman/listinfo/mono-a11y), or drop in [#mono-a11y](irc://irc.gimp.org/mono-a11y) on irc.gimp.org.

