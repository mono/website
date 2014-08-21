---
title: "Accessibility: Test Log"
lastmodified: '2010-09-13'
redirect_from:
  - /Accessibility:_Test_Log/
---

Accessibility: Test Log
=======================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#references">1 References</a></li>
<li><a href="#description">2 Description</a>
<ul>
<li><a href="#20-release-test-result">2.1 2.0 Release Test Result</a>
<ul>
<li><a href="#winformsatkbridge">2.1.1 WinformsAtkBridge</a></li>
<li><a href="#moonlightatkbridge">2.1.2 MoonlightAtkBridge</a></li>
<li><a href="#clientapi-winforms">2.1.3 ClientAPI-Winforms</a></li>
</ul></li>
<li><a href="#21-release-test-result">2.2 2.1 Release Test Result</a>
<ul>
<li><a href="#winformsatkbridge_2">2.2.1 WinformsAtkBridge</a></li>
<li><a href="#moonlightatkbridge_2">2.2.2 MoonlightAtkBridge</a></li>
<li><a href="#clientapi">2.2.3 ClientAPI</a></li>
<li><a href="#bug-report-list">2.2.4 Bug Report List</a></li>
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
 [Product Test Log](/Accessibility:_Test_Log "Accessibility: Test Log") (current page)
 [Product Test Summary](/Accessibility:_Test_Summary "Accessibility: Test Summary")
 [Product Bug Specification](/Accessibility:_Bug_Specification "Accessibility: Bug Specification")
 [Product Home](/Accessibility "Accessibility")

Description
-----------

The test log is used to log the relevant details about the execution of each release version test. Its purpose is to share information among testers, users, developers, and others. It also facilitates the replication of situations encountered during testing.

### 2.0 Release Test Result

#### WinformsAtkBridge

Test Platforms:
 openSUSE 11.1, openSUSE 11.2, SLED 11, Fedora 12, Ubuntu 9.10

1. Closed bugs:

-   Bug 558289 - Slider: Key Navigation Does Not Update Slider's Value with SmallChange Property

2. New bugs:

-   Bug 589269 - PrintPreviewDialog: modal dialog is missing 'active' state

 Some Winforms bugs cause test failure:

-   Bug 575635 - ThreadExceptionDialog: modal dialog should always be actived on the top of main form
-   Bug 574257 - DataGridBoolColumn: Cells under doesn't supprot press key to check and uncheck
-   Bug 589989 - DomainUpDown: ReadOnly Property Has No Effects
-   Bug 590090 - ToolStripMenuItem: KeyCombo Has No Effect
-   Bug 590093 - NotifyIcon: notifyicon doesn't appears on panel except for openSUSE11.2

3. Bugs wait to be fixed:
 [Bug List](https://bugzilla.novell.com/buglist.cgi?classification=Mono&query_format=advanced&bug_status=NEW&bug_status=ASSIGNED&bug_status=NEEDINFO&bug_status=REOPENED&component=Winforms%20-%20ATK&component=Winforms%20-%20ATK%20Spec&component=Winforms%20-%20General&component=Winforms%20-%20UIA&product=UI%20Automation)

4. Test result:
 [Winforms test result on Dashboard](http://147.2.207.213/dashboard/winforms.xml) with VPN connection.
 DataGridBoolColumn: Bug 589987, Bug 574257
 DomainUpDown: Bug589989
 NotifyIcon: Bug 590093
 ToolStripMenuItem: Bug 590090

#### MoonlightAtkBridge

Test Platforms:
 openSUSE 11.2, Fedora 12, Ubuntu 9.10

1. Closed bugs:

-   BUG 554025 CheckBox: is missing 'indeterminate' state
-   BUG 556463 ListBox: select or clear selection on accerciser make the firefox \* BUG crashed
-   BUG 560711 Slider: some extraneous push buttons
-   BUG 562187 TabControlAutomationPeer does not return children from GetChildren()
-   BUG 567650 DataGrid: view on accerciser left treeview make the app crash
-   BUG 567651 Calendar: week labels have extraneous 'selectable' state
-   BUG 567653 Calendar: title buttons have extraneous 'selectable' state

2. New bugs:

-   BUG 564820 REOP DatePicker control is missing Calendar child
-   BUG 587783 NEW TabControl: 'page tab' has 2 extraneous labels
-   BUG 587792 NEW TabControl: select invisible label child make the application crashed

3. Bugs wait to be fixed:
 [Bug list](https://bugzilla.novell.com/buglist.cgi?bug_severity=Blocker&bug_severity=Critical&bug_severity=Major&bug_severity=Normal&bug_severity=Minor&classification=Mono&query_based_on=moon&query_format=advanced&bug_status=NEW&bug_status=ASSIGNED&bug_status=REOPENED&component=Moonlight%20-%20ATK&component=Moonlight%20-%20General&component=Moonlight%20-%20UIA&product=UI%20Automation&known_name=moon)

BUG references on strongwind tests:

-   button-regression.py:\# BUG553170: MessageBox is not accessible now.
-   button-regression.py:\# BUG554017: doesn't focus the clicked button
-   checkbox-regression.py:\# BUG554017: click action doesn't move focus
-   combobox-regression.py:\# BUG554449: application crashed
-   hyperlinkbutton-regression.py:\# BUG555714: do 'jump' action for the second link crash the app
-   radiobutton-regression.py:\# BUG559133, BUG554017:missing focused states
-   scrollviewer-regression.py:\# BUG572163: moonlight bug that \* ScrollBarVisibility.Hidden doesn't work
-   slider-regression.py:\# BUG558289: Key Navigation Does Not Update Slider's Value with SmallChange Property
-   textblock-regression.py:\# BUG561268: Multi-line Name Is Parsed Incorrectly
-   togglebutton-regression.py:\# BUG554017: doesn't focus to the clicked button

4. Test result:
 [Moonlight test result on Dashboard](http://147.2.207.213/dashboard/moonlight.xml) with VPN connection.
 We are going to test ComboBox and GridSplitter on 2.0.1 since BUG554449 and BUG555165 have been fixed.

#### ClientAPI-Winforms

Test Platforms:
 openSUSE 11.1, openSUSE 11.2, SLED 11, Fedora 12, Ubuntu 9.10

1. Closed bugs:

-   BUG 569846 [uiaclient-winforms]:UIA Client matches wrong element for LabeledByproperty on Linux
-   BUG 571799 [uiaclient-Winforms]：The dialog who has parent has been found twice
-   BUG 574269 Cannot find pane control on Linux

2. New bugs:
 nope

3. Remains of bugs

-   BUG 574242 Can't define custom provider by using the WM\_GETOBJECT message
-   BUG 573464 [uiaclient-winforms] Some dialog's name has been changed in Linux compares to in Windows.
-   BUG 574226 [uiaclient-winforms]The name of Button is "Icon" in Windows but in linux is ""
-   BUG 574620 On linux a control who's control type is "SplitButton" on Windows is "Button"
-   BUG 576050 [uiaclient-winforms]: The splitbutton's Invoke method doesn't work
-   BUG 576450 [uiaclient-winforms] The dialog's Window Pattern' WindowInteractionState will be different between Windows and Linux
-   BUG 576455 All the "Text" controls are recognized as "Edit" on Linux
-   BUG 581625 GetText of TextPatternRange may not work
-   BUG 578244 The datagrid's GetItem method can't be run on Linux.
-   BUG 580431 [UIAClient-Winforms] Scroll bar of datagrid could not be detected on Linux
-   BUG 580433 [UIAClient-Winforms] The window is same size on Window and Linux, but the horizontal or vertical view size is not identical
-   BUG 580452 [UIAClient-Winforms] The window is same size on Window and Linux, but the horizontal or vertical scroll percentage is not identical
-   BUG 580447 The viewId is difference between on Linux and Windows

4. Test result:
 The tests of Winforms applications via client api have been run successfully on all platforms.

### 2.1 Release Test Result

#### WinformsAtkBridge 2

Test Platforms:
 In both 32bit and 64bit: openSUSE 11.1, openSUSE 11.2, SLED 11, Fedora 12, Ubuntu 9.10

Test result:
 [Winforms test result on Dashboard](http://147.2.207.213/dashboard/winforms.xml) with VPN connection.

Explanation of the failing tests:
 [Winforms Strongwind tests with some new bugs](https://spreadsheets.google.com/ccc?key=tbc5LQC4kyt8MyxPYMKjdeQ&authkey=CPOZ2OAE&hl=zh_CN&pli=1#gid=0)

#### MoonlightAtkBridge 2

Test Platforms:
 In both 32bit and 64bit: openSUSE 11.2, Fedora 12, Ubuntu 9.10

Test result:
 [Moonlight test result on Dashboard](http://147.2.207.213/dashboard/moonlight.xml) with VPN connection.

Explanation of the failing tests:
 [Moonlight Strongwind tests with some new bugs](https://spreadsheets.google.com/ccc?key=tbc5LQC4kyt8MyxPYMKjdeQ&authkey=CPOZ2OAE&hl=zh_CN&pli=1#gid=1)

#### ClientAPI

Test Platforms:
 In both 32bit and 64bit: openSUSE 11.1, openSUSE 11.2, SLED 11, Fedora 12, Ubuntu 9.10

Test result:

Bug List:
 Product still remains more than 100 [bugs of UIAClientAPI](https://bugzilla.novell.com/buglist.cgi?classification=Mono&query_based_on=clientAPI&query_format=advanced&bug_status=UNCONFIRMED&bug_status=NEW&bug_status=ASSIGNED&bug_status=REOPENED&component=at-spi-dbus&component=at-spi-sharp&component=Client%20-%20AT-SPI&component=Client%20-%20General&component=Client%20-%20UIA&component=Moonlight%20-%20UIA&component=Winforms%20-%20UIA&product=UI%20Automation&known_name=clientAPI)

#### Bug Report List

[Bug report](https://bugzilla.novell.com/report.cgi?x_axis_field=bug_status&y_axis_field=component&z_axis_field=&query_format=report-table&short_desc_type=allwordssubstr&short_desc=&longdesc_type=fulltext&longdesc=&classification=Mono&product=UI+Automation&component=at-spi-dbus&component=at-spi-sharp&component=Client+-+AT-SPI&component=Client+-+General&component=Client+-+QA&component=Client+-+UIA&component=Core-Provider&component=Moonlight+-+ATK&component=Moonlight+-+General&component=Moonlight+-+QA&component=Moonlight+-+UIA&component=Winforms+-+ATK&component=Winforms+-+ATK+Spec&component=Winforms+-+General&component=Winforms+-+UIA&bug_file_loc_type=allwordssubstr&bug_file_loc=&status_whiteboard_type=allwordssubstr&status_whiteboard=&keywords_type=anywords&keywords=&deadlinefrom=&deadlineto=&bug_status=UNCONFIRMED&bug_status=NEW&bug_status=ASSIGNED&bug_status=NEEDINFO&bug_status=REOPENED&bug_status=RESOLVED&bug_status=VERIFIED&bug_status=CLOSED&emailassigned_to1=1&emailtype1=substring&email1=&emailassigned_to2=1&emailreporter2=1&emailqa_contact2=1&emailcc2=1&emailtype2=substring&email2=&bugidtype=include&bug_id=&votes=&chfieldfrom=&chfieldto=2010-9-10&chfieldvalue=&format=table&action=wrap&field0-0-0=noop&type0-0-0=noop&value0-0-0=) of each Component in difference Status

