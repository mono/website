---
title: "Accessibility: Release Notes 1.0"
lastmodified: '2009-03-31'
redirect_from:
  - /Accessibility:_Release_Notes_1.0/
---

Accessibility: Release Notes 1.0
================================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#mono-accessibility-10-release-notes">1 Mono Accessibility 1.0 Release Notes</a>
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

Mono Accessibility 1.0 Release Notes
====================================

The Mono Accessibility project enables Windows applications to be fully accessible on Linux.

This is our first stable release including UIA Provider and ATK support for all of the System.Windows.Forms controls.

Our next phase, the 2.0 release, will encompass a UIA Client implementation that targets both System.Windows.Forms and ATK applications, and UIA Provider support for [Moonlight](/Moonlight "Moonlight").

Codename: Leela

*Release Date: Mar 31, 2009*

Supported Controls
------------------

-   Button
-   CheckBox
-   CheckedListBox
-   ColorDialog
-   ComboBox
-   ContainerControl
-   ContextMenu
-   ContextMenuStrip
-   DataGrid
-   DataGridView
-   DateTimePicker
-   DomainUpDown
-   ErrorProvider
-   FileDialog
-   FolderBrowserDialog
-   FontDialog
-   Form
-   GroupBox
-   HelpProvider
-   Label
-   LinkLabel
-   ListBox
-   ListView
-   MainMenu
-   MaskedTextBox
-   MenuItem
-   MenuStrip
-   MessageBox
-   MonthCalendar
-   NotifyIcon
-   NumericUpDown
-   OpenFileDialog
-   Panel
-   PageSetupDialog
-   PictureBox
-   PrintDialog
-   PrintPreviewDialog
-   PrintPreviewControl
-   ProgressBar
-   PropertyGrid
-   PropertyGridInternal.PropertyGridTextBox
-   PropertyGridInternal.PropertyGridView
-   RadioButton
-   RichTextBox
-   SaveFileDialog
-   ScrollableControl
-   SplitContainer
-   Splitter
-   StatusBar
-   StatusStrip
-   TabControl
-   TabPage
-   TextBox
-   ThreadExceptionDialog
-   ToolBar
-   ToolBarButton
-   ToolStrip
-   ToolStripButton
-   ToolStripComboBox
-   ToolStripDropDownItem
-   ToolStripLabel
-   ToolStripMenuItem
-   ToolStripProgressBar
-   ToolStripSeparator
-   ToolStripSplitButton
-   ToolStripTextBox
-   ToolTip
-   TrackBar
-   TreeView
-   WebBrowser

Notes
-----

17 new features have been added and over 135 bugs have been addressed since the 0.9.1 release. Please check out our [bug tracker](https://bugzilla.novell.com/buglist.cgi?query_format=advanced&classification=Mono&product=UI+Automation) for the [full list](https://bugzilla.novell.com/buglist.cgi?query_format=advanced&classification=Mono&product=UI+Automation&bug_status=RESOLVED&bug_status=VERIFIED&bug_status=CLOSED&chfieldfrom=2009-02-06&chfieldto=2009-03-13).

Errata
------

For the most up-to-date errata, please look at the [Mono Accessibility bug tracker](https://bugzilla.novell.com/buglist.cgi?query_format=advanced&classification=Mono&product=UI+Automation) for [issues filed against Release 1.0](https://bugzilla.novell.com/buglist.cgi?query_format=advanced&classification=Mono&product=UI+Automation&version=Release+1.0&bug_status=NEW&bug_status=ASSIGNED&bug_status=NEEDINFO&bug_status=REOPENED).

Downloading
-----------

Mono Accessibility is available for a variety of Linux distributions, including:

-   OpenSUSE 11.0 - [1-Click Install](http://download.opensuse.org/repositories/Mono:/UIA/MonoOpenSUSE_11.0/mono-uia.ymp)
-   OpenSUSE 11.1 - [1-Click Install](http://download.opensuse.org/repositories/Mono:/UIA/MonoOpenSUSE_11.1/mono-uia.ymp)

If packages aren't available for your distribution, you'll probably have to install Mono Accessibility from source. Step-by-step instructions are [available](/Accessibility:_Installing_From_Source "Accessibility: Installing From Source").

If you just want to grab a source tarball, check out the [Novell FTP](ftp://ftp.novell.com/pub/mono/sources/) page. You will want [mono-uia](ftp://ftp.novell.com/pub/mono/sources/mono-uia), [uiautomationwinforms](ftp://ftp.novell.com/pub/mono/sources/uiautomationwinforms), and [uiaatkbridge](ftp://ftp.novell.com/pub/mono/sources/uiaatkbridge).

Contributors
------------

The following people have contributed to making this release happen:

> Andrés G. Aragoneses, Brad Taylor, Brian Merrell, Calen Chen, Calvin Gaisford, Feng Xia Mu (Felicia), Mario Carrion, Michael Gorse, Neville Gao, Ray Wang, Rui Guo (Matt), Sandy Armstrong, Stephen Shaw

Reporting Bugs
--------------

If you find any issues with this release, please don't hesitate to [file bugs](https://bugzilla.novell.com/enter_bug.cgi?product=UI%20Automation).

If you want to contribute or need specific assistance, please join our [mailing list](http://forge.novell.com/mailman/listinfo/mono-a11y), or drop in [\#mono-a11y](irc://irc.gimp.org/mono-a11y) on irc.gimp.org.

