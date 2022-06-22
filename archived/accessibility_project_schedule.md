---
title: "Accessibility: Project Schedule"
lastmodified: '2008-09-17'
redirect_from:
  - /Accessibility%3A_Project_Schedule/
---

Accessibility: Project Schedule
===============================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#summary">1 Summary</a></li>
<li><a href="#current-iterations">2 Current Iterations</a>
<ul>
<li><a href="#iteration-16---september-10---16">2.1 Iteration 16 - September 10 - 16</a></li>
<li><a href="#iteration-17---september-17---23">2.2 Iteration 17 - September 17 - 23</a></li>
<li><a href="#iteration-18---september-24---30">2.3 Iteration 18 - September 24 - 30</a></li>
<li><a href="#iteration-19---october-1---7">2.4 Iteration 19 - October 1 - 7</a></li>
<li><a href="#iteration-20---october-8---14">2.5 Iteration 20 - October 8 - 14</a></li>
<li><a href="#iteration-21---october-15---21">2.6 Iteration 21 - October 15 - 21</a></li>
<li><a href="#iteration-22---october-22---28">2.7 Iteration 22 - October 22 - 28</a></li>
<li><a href="#iteration-23---october-28---november-4">2.8 Iteration 23 - October 28 - November 4</a></li>
<li><a href="#iteration-24---november-5---november-11">2.9 Iteration 24 - November 5 - November 11</a></li>
<li><a href="#iteration-25---november-12---18">2.10 Iteration 25 - November 12 - 18</a></li>
<li><a href="#iteration-26---november-19---25">2.11 Iteration 26 - November 19 - 25</a></li>
</ul></li>
<li><a href="#elements-delayed">3 Elements delayed</a></li>
<li><a href="#past-iterations">4 Past Iterations</a>
<ul>
<li><a href="#iteration-1---may-19---27">4.1 Iteration 1 - May 19 - 27</a></li>
<li><a href="#iteration-2---may-28---june-3">4.2 Iteration 2 - May 28 - June 3</a></li>
<li><a href="#iteration-3---june-4---10">4.3 Iteration 3 - June 4 - 10</a></li>
<li><a href="#iteration-4---june-11---17">4.4 Iteration 4 - June 11 - 17</a></li>
<li><a href="#iteration-5---june-18---24">4.5 Iteration 5 - June 18 - 24</a></li>
<li><a href="#iteration-6---june-25---july-1">4.6 Iteration 6 - June 25 - July 1</a></li>
<li><a href="#iteration-7---july-2---july-8">4.7 Iteration 7 - July 2 - July 8</a></li>
<li><a href="#iteration-8---july-8---15">4.8 Iteration 8 - July 8 - 15</a></li>
<li><a href="#iteration-9---july-16---22">4.9 Iteration 9 - July 16 - 22</a></li>
<li><a href="#iteration-10---july-23---29">4.10 Iteration 10 - July 23 - 29</a></li>
<li><a href="#iteration-11---july-30---august-5">4.11 Iteration 11 - July 30 - August 5</a></li>
<li><a href="#iteration-12---august-6---12">4.12 Iteration 12 - August 6 - 12</a></li>
<li><a href="#iteration-13---august-13---19">4.13 Iteration 13 - August 13 - 19</a></li>
<li><a href="#iteration-14---august-20---september-2-2-week-iteration-because-of-hackweek">4.14 Iteration 14 - August 20 - September 2 (2 week iteration because of hackweek)</a></li>
<li><a href="#iteration-15---september-3---9">4.15 Iteration 15 - September 3 - 9</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Summary
-------

This page contains the iteration schedule for the [UI Automation accessibility](/Accessibility) project. If you are looking for a higher level view of the project status, you can view the [project roadmap](/Accessibility:_Roadmap) page.

The project is broken down into two phases:

-   Phase 1 - Q4 2008 - UIA Provider and WinForms integration
-   Phase 2 - Q4 2009 - UIA Client and Moonlight integration

The work is broken down into one week iterations with tasks assigned to members of the [team](/Accessibility:_Team). The iterations are listed in order of dates with past iterations being listed by date at the bottom of the page.

You can also get a view of the status of the work here:

Development Status

-   [WinForms Control Status](/Accessibility:_Control_Status)
-   [UIA Control Types Status](/Accessibility:_Mapping_UIA_to_ATK)

Testing Status

-   [Accessibility:_Test_Plan_WinForms_Controls](/Accessibility:_Test_Plan_WinForms_Controls)

Current Iterations
------------------

### Iteration 16 - September 10 - 16

|Task|Status|Owner|Notes|
|:---|:-----|:----|:----|
|**Recursive Properties**
Support proper event propagation.|In progress|Sandy||
|**MenuStrip**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**ToolStripMenuItem**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**ToolStripDropDownItem**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**TextBox**, **RichTextBox**, **MaskedTextBox** *(Edit/Document)*
Implement needed UIA Provider interfaces|70%|Mario|Missing methods in TextRangeProvider. Missing IScrollProvider implementation.|
|**ComboBox**
Implement needed UIA Provider interfaces|99%|Mario|Implement ScrollBar in internal ListBox.|
|**Mono-a11y-Bugs**
Fixing of P1 bugs.|Done|Mario|~~[Bug 414937](https://bugzilla.novell.com/show_bug.cgi?id=414937)~~
~~[Bug 415320](https://bugzilla.novell.com/show_bug.cgi?id=415320)~~
~~[Bug 419023](https://bugzilla.novell.com/show_bug.cgi?id=419023)~~
~~[Bug 423240](https://bugzilla.novell.com/show_bug.cgi?id=423240)~~
~~[Bug 424681](https://bugzilla.novell.com/show_bug.cgi?id=424681)~~
~~[Bug 423356](https://bugzilla.novell.com/show_bug.cgi?id=423356)~~
~~[Bug 414617](https://bugzilla.novell.com/show_bug.cgi?id=414617)~~
~~[Bug 425597](https://bugzilla.novell.com/show_bug.cgi?id=425597)~~
~~[Bug 425774](https://bugzilla.novell.com/show_bug.cgi?id=425774)~~
~~[Bug 426254](https://bugzilla.novell.com/show_bug.cgi?id=426254)~~
~~[Bug 419019](https://bugzilla.novell.com/show_bug.cgi?id=419019)~~|
|**Mono-MWF-Bugs**
Tooltip-based providers (ToolTip, HelpProvider and ErrorProvider) and Events-missing providers.|Done|Mario|~~[Bug 425277. ToolTip](https://bugzilla.novell.com/show_bug.cgi?id=425277)~~~~
[Bug 425988. HelpProvider](https://bugzilla.novell.com/show_bug.cgi?id=425988)~~
~~[Bug 426459. ErrorProvider](https://bugzilla.novell.com/show_bug.cgi?id=426459)~~
~~[Bug 426464. ScrollBar.RangeValue](https://bugzilla.novell.com/show_bug.cgi?id=426464)~~|
|**MWF.MessageBox a11y**
Patch MWF.MessageBox to add Label|Planned|Mario||
|**StatusBar**
Implement needed UIA Provider interfaces|90%|Neville|Missing Navigation.|
|**Header UIA Control Type**
Map UIA Provider interfaces to ATK|Planned|Brad||
|**HeaderItem UIA Control Type**
Map UIA Provider interfaces to ATK|Planned|Mike||
|**Create Smoke Test Harness**
Create a smoke test suite based on the regression harness|Done|Brian||
|**Update openSUSE test VMs**
Add passwordless sudo for smoke tests, and update packages|Done|Brian||
|**Write Smoke Test for Form**
Create a smoke tests that test for basic uia2atk functionality for the Form control|Done|Brian||
|**Write Smoke Test for PictureBox**
Create a smoke tests that test for basic uia2atk functionality for the PictureBox control|Done|Brian||
|**Review Form smoke test code**
Review code before adding to test suite|Done|Brian||
|**Review PictureBox smoke test code**
Review code before adding to smoke test suite|Done|Brian||
|**Implement Winforms Samples**
Continue to implement winforms test samples|95%|Ray|get more detials from [Accessibility:_Test_Plan_WinForms_Controls](/Accessibility:_Test_Plan_WinForms_Controls) (71/75)|
|**Work on Orca**
Investigate and Learn Orca Test|10%|Ray||
|**Test NotifyIcon control**
commited strongwind test code and run test|95%|Calen||
|**verify bugs**
upgrad test environment and verify bugs|Done|Calen||
|**update strongwind test code**
modify strongwind test code with a new way to test states and actions|50%|Calen||
|**Winforms Samples**
implement winforms test samples DataGrid and DataGridBoolColumn|Done|Calen||
|||||
|**Iteration 17 Planning Meeting**||||

### Iteration 17 - September 17 - 23

|Task|Status|Owner|Notes|
|:---|:-----|:----|:----|
|**ToolStripSeparator**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**ToolStripSplitButton**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**PrintPreviewControl**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**ContextMenu**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**ContextMenuStrip**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**DateTimePicker**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**FlowLayoutPanel**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**FontDialog**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**MainMenu**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**MonthCalendar**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**NotifyIcon**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**OpenFileDialog**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**ProgressBar**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**ScrollableControl**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**TabPage**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**ToolBarButton**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**StatusStrip**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**TabControl**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**ToolStrip**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**ToolStripComboBox**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**MenuStrip**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**ToolStripLabel**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**ToolStripProgressBar**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**ToolStripDropDownButton**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**TrackBar**
Implement needed UIA Provider interfaces|Planned|Mario||
|**Hyperlink UIA Control Type**
Map UIA Provider interfaces to ATK|Planned|Brad||
|**Thumb UIA Control Type**
Map UIA Provider interfaces to ATK|Planned|Mike||
|**DataGrid Sample**
Implement DataGrid WinForms sample|Planned|Brian||
|**DataGridBoolColumn Sample**
Implement DataGridBoolColumn WinForms sample|Planned|Brian||
|**DataGridTextBoxColumn Sample**
Implement DataGridTextBoxColumn WinForms sample|Planned|Brian||
|**DataGridView Sample**
Implement DataGridView WinForms sample|Planned|Brian||
|**Review Form test code**
Review code before adding to smoke test suite|Planned|Brian||
|**Review button_label_linklabel test code**
Review code before adding to test suite|50%|Brian||
|**Review PictureBox test code**
Review code before adding to test suite|Planned|Brian||
|**Review StatusBar test code**
Review code before adding to test suite|Planned|Brian||
|**Review VScrollBar test code**
Review code before adding to test suite|Planned|Brian||
|**Review HScrollBar test code**
Review code before adding to test suite|Planned|Brian||
|**Review ProgressBar test code**
Review code before adding to test suite|Planned|Brian||
|**Implement Winforms Samples**
Continue to implement winforms test samples|95%|Ray|get more detials from [Accessibility:_Test_Plan_WinForms_Controls](/Accessibility:_Test_Plan_WinForms_Controls) (71/75)|
|**Work on Orca**
Investigate and Learn Orca Test|10%|Ray||
|||||
|**Iteration 18 Planning Meeting**||||

### Iteration 18 - September 24 - 30

|Task|Status|Owner|Notes|
|:---|:-----|:----|:----|
|**ToolStripTextBox**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**TreeView**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**WebBrowser**
Implement needed UIA Provider interfaces|Planned|Mario||
|**Table UIA Control Type**
Map UIA Provider interfaces to ATK|Planned|Brad||
|**Tree UIA Control Type**
Map UIA Provider interfaces to ATK|Planned|Mike||
|||||
|**Iteration 19 Planning Meeting**||||

### Iteration 19 - October 1 - 7

|Task|Status|Owner|Notes|
|:---|:-----|:----|:----|
|**TitleBar UIA Control Type**
Map UIA Provider interfaces to ATK|Planned|Brad||
|**DataGrid UIA Control Type**
Map UIA Provider interfaces to ATK|Planned|Brad||
|**DataItem UIA Control Type**
Map UIA Provider interfaces to ATK|Planned|Brad||
|**MenuItem UIA Control Type**
Map UIA Provider interfaces to ATK|Planned|Brad||
|**TreeItem UIA Control Type**
Map UIA Provider interfaces to ATK|Planned|Mike||
|**DomainUpDown**
Implement needed UIA Provider interfaces|Planned|Mario||
|**FileDialog**
Implement needed UIA Provider interfaces|Planned|Mario||
|**ListView**
Implement needed UIA Provider interfaces|Planned|Mario||
|**DataGrid**
Implement needed UIA Provider interfaces|Planned|Mario||
|**DataGridBoolColumn**
Implement needed UIA Provider interfaces|Planned|Mario||
|**DataGridView**
Implement needed UIA Provider interfaces|Planned|Mario||
|**DataGridTextBoxColumn**
Implement needed UIA Provider interfaces|Planned|Mario||
|**MenuItem**
Implement needed UIA Provider interfaces|Planned|Mario||
|**ColumnHeader**
Implement needed UIA Provider interfaces|Planned|Mario||
|**Panel**
Implement needed UIA Provider interfaces|Planned|Mario||
|**PageSetupDialog**
Implement needed UIA Provider interfaces|Planned|Mario||
|**PropertyGrid**
Implement needed UIA Provider interfaces|Planned|Mario||
|**ColorDialog**
Implement needed UIA Provider interfaces|Planned|Mario||
|**SaveFileDialog**
Implement needed UIA Provider interfaces|Planned|Mario||
|**Splitter**
Implement needed UIA Provider interfaces|Planned|Mario||
|**TableLayoutPanel**
Implement needed UIA Provider interfaces|Planned|Mario||
|**ThreadExceptionDialog**
Implement needed UIA Provider interfaces|Planned|Mario||
|**ToolBar**
Implement needed UIA Provider interfaces|Planned|Mario||
|**SplitContainer**
Implement needed UIA Provider interfaces|Planned|Mario||
|**ContainerControl**
Implement needed UIA Provider interfaces|Planned|Mario||
|||||
|**Iteration 20 Planning Meeting**||||

### Iteration 20 - October 8 - 14

|Task|Status|Owner|Notes|
|:---|:-----|:----|:----|
|**Calendar UIA Control Type**
Map UIA Provider interfaces to ATK|Planned|Brad||
|||||
|**Iteration 21 Planning Meeting**||||

### Iteration 21 - October 15 - 21

|Task|Status|Owner|Notes|
|:---|:-----|:----|:----|
|||||
|**Iteration 22 Planning Meeting**||||

### Iteration 22 - October 22 - 28

|Task|Status|Owner|Notes|
|:---|:-----|:----|:----|
|||||
|**Iteration 23 Planning Meeting**||||

### Iteration 23 - October 28 - November 4

|Task|Status|Owner|Notes|
|:---|:-----|:----|:----|
|||||
|**Iteration 24 Planning Meeting**||||

### Iteration 24 - November 5 - November 11

|Task|Status|Owner|Notes|
|:---|:-----|:----|:----|
|||||
|**Iteration 25 Planning Meeting**||||

### Iteration 25 - November 12 - 18

|Task|Status|Owner|Notes|
|:---|:-----|:----|:----|
|||||
|**Iteration 26 Planning Meeting**||||

### Iteration 26 - November 19 - 25

|Task|Status|Owner|Notes|
|:---|:-----|:----|:----|
|||||
|**Iteration 27 Planning Meeting**||||

Elements delayed
----------------

This table contains tasks not started that were initially planned in a specific iteration.

|Task|Iteration|Status|Owner|Reason|
|:---|:--------|:-----|:----|:-----|
|**ScrollBar UIA Control Type**
Map UIA Provider interfaces to ATK|Not started|7|Mike|GuadecES & Guadec|
|**MenuBar UIA Control Type**
Map UIA Provider interfaces to ATK|Not started|8|Mike|Guadec|

Past Iterations
---------------

### Iteration 1 - May 19 - 27

|Task|Status|Owner|Notes|
|:---|:-----|:----|:----|
|**Button** *(Button)*
Implement needed UIA Provider interfaces|95% Done|Sandy|Some unimplemented properties, see [Control Status](/Accessibility:_Control_Status).|
|**CheckBox** *(CheckBox)*
Implement needed UIA Provider interfaces|Done|Sandy||
|**Label**
Implement needed UIA Provider interfaces|Done|Sandy||
|**GroupBox** *(Pane)*
Implement needed UIA Provider interfaces|Planned|Sandy|Didn't get very far.|
|**TextBox** *(Edit/Document)*
Implement needed UIA Provider interfaces|50%|Mario|Missing IScrollProvider and ITextProvider implementations. This provider may work for MaskedTextBox and RichTextBox.|
|**LinkLabel** *(Hyperlink)*
Implement needed UIA Provider interfaces|Done|Mario||
|**Button UIA Control Type**
Map UIA Provider interfaces to ATK|65%|Calvin|Missing base implementation of Atk.ComponentImplementor which is work needed for all control types. Also missing Atk.ImageImplementor and some Atk.TextImplementor methods related to coordinates. Also need to finish up states and events.|
|**Text UIA Control Type**
Map UIA Provider interfaces to ATK|65%|Andres|Missing tests: more Atk-centric for events (although Label may only have property-changed), and other non-Atk-centric ones (in BridgeTester.cs). Missing some methods implementation related to coordinates. Missing ComponentImplementor methods which may be reusable in the base class. Missing the study of the role ATK_ROLE_ACCEL_LABEL and the state ATK_STATE_MULTI_LINE.|
|**Write WinForms Sample Application**
Implement needed WinForms sample application to be tested|13%|Calen|Finished some simple application sample with winforms "button\\label\\linklabel\\numericUpDown\\textbox\\groupBox\\checkbox\\radiobutton\\panel" control by Ironpython. the code reposit in uiaqa.sled.lab.novell.com:/var/qa/code.|
|**Write Test Script For Button**|0%|Brian|Push|
|**Build Packages**
Build packages for preparing building & testing environment.|Done|Ray|Built olive and gtk-sharp on OBS, but should do some works to simplify the olive package.|
|**Understand Architecture**
Understand the architecture well & build Provider from svn.|Done|Neville||
|**Cspi**
Modify spi_main.c and spi_event.c to use dbus|Done (untested)|Mike||
|**Proof-of-Concept Automation Tests**|Done|Brian|[Strongwind](http://www.medsphere.org/projects/strongwind/) test created against sample GTK app|
|**Setup Testing Lab**|Done|Brian|[https://wiki.innerweb.novell.com/index.php/UIAQA](https://wiki.innerweb.novell.com/index.php/UIAQA)|
|**Research automated testing of WinForms actions and properties**|Done|Brian|We'll use [Strongwind](http://www.medsphere.org/projects/strongwind/)|
|**Iteration 2 Planning Meeting**
IRC Meeting on #mono-a11y on Wednesday, May 28, 2008
[14:00:00 UTC time](http://www.timeanddate.com/worldclock/fixedtime.html?year=2008&month=5&day=28&hour=14&min=0&sec=0)||All||

### Iteration 2 - May 28 - June 3

|Task|Status|Owner|Notes|
|:---|:-----|:----|:----|
|**Form**
Implement needed UIA Provider interfaces|50% Done|Sandy|Along with GroupBox, there remain issues with child control/provider management.|
|**Button** *(Button)*
Implement needed UIA Provider interfaces|95% Done|Sandy|Some unimplemented properties, see [Control Status](/Accessibility:_Control_Status).|
|**GroupBox** *(Group)*
Implement needed UIA Provider interfaces|50% Done|Sandy||
|**RadioButton**
Implement needed UIA Provider interfaces|50% Done|Sandy|RadioButton needs to be handled in the context of its sibling RadioButtons.|
|**TextBox** *(Edit/Document)*
Implement needed UIA Provider interfaces|60%|Mario|Partial implementation of ITextProvider. Missing IScrollProvider implementation.|
|**RichTextBox** *(Edit/Document)*
Implement needed UIA Provider interfaces|40%|Mario|Reuses TextRangeProvider implemented in TextBox.|
|**MaskedTextBox** *(Edit)*
Implement needed UIA Provider interfaces|60%|Mario|Reuses TextRangeProvider implemented in TextBox.|
|**Button UIA Control Type**
Map UIA Provider interfaces to ATK|95% done|Calvin|Still a few items left that need to be done for all controls (see [UIA Control Types Status](/Accessibility:_Mapping_UIA_to_ATK)).|
|**Pane UIA Control Type**
Map UIA Provider interfaces to ATK|95% done|Calvin|Still a few items left that need to be done for all controls (see [UIA Control Types Status](/Accessibility:_Mapping_UIA_to_ATK)).|
|**CheckBox UIA Control Type**
Map UIA Provider interfaces to ATK|100%|Andres|It seems to be working completely, but note: DoAction() is the function that is called when performing the action from accerciser, it works with CheckBox, but not for Button.|
|**Write WinForms Sample Application**
Implement needed WinForms sample application to be tested|34%|Calen||
|**Cspi**
Get event listeners to work with dbus and test.|Coded but untested|Mike||
|**Get all our test code in Mono SVN**|Done|Brian||
|**Implement test framework**
Automate Strongwind tests simultaneously on all test machines|Done|Brian||
|**Write more Strongwind tests**
Write at least 1 more Strongwind test against GTK, add to test suite|Planned|Brian||
|**Document+Blog testing techniques**
Howto write Strongwind tests and how to add them to the test suite|50%|Brian||
|**Simplify & Build new packages**
Simplify olive package and build patched new packages. e.g. mcs, mono|Done|Ray|hackers could download the lastest modified uia-windowsbase libraries and strongwind from [here](http://download.opensuse.org/repositories/home:/rawang/openSUSE_10.3/noarch/).|
|**StatusBar** *(StatusBar)*
Familiarize the steps of implementing Providers & Implement needed UIA Provider interfaces|50%|Neville|No unit test|
|**Iteration 3 Planning Meeting**
IRC Meeting on #mono-a11y on Wednesday, June 4, 2008
[14:00:00 UTC](http://www.timeanddate.com/worldclock/fixedtime.html?year=2008&month=6&day=4&hour=14&min=0&sec=0)||All||

### Iteration 3 - June 4 - 10

|Task|Status|Owner|Notes|
|:---|:-----|:----|:----|
|**Form**
Implement needed UIA Provider interfaces|80% Done|Sandy|Along with GroupBox, there remain issues with child control/provider management.|
|**GroupBox** *(Group)*
Implement needed UIA Provider interfaces|80% Done|Sandy|See Form notes.|
|**Button** *(Button)*
Implement needed UIA Provider interfaces|95% Done|Sandy|Some unimplemented properties, see [Control Status](/Accessibility:_Control_Status).|
|**RadioButton**
Implement needed UIA Provider interfaces|95% Done|Sandy|Finishing testing.|
|**TextBox** *(Edit/Document)*
Implement needed UIA Provider interfaces|85%|Mario|Partial implementation of ITextProvider: missing methods in TextRangeProvider. Missing IScrollProvider implementation.|
|**RichTextBox** *(Edit/Document)*
Implement needed UIA Provider interfaces|50%|Mario|Reuses TextRangeProvider class (part of TextBoxProvider). Missing TextUnit.Format (used by this control) and IScrollProvider implementation.|
|**MaskedTextBox** *(Edit)*
Implement needed UIA Provider interfaces|85%|Mario|Reuses TextRangeProvider class (part of TextBoxProvider).|
|**List UIA Control Type**
Map UIA Provider interfaces to ATK|0% (FTO most of the time)|Calvin|Moved this forward|
|**ComboBox UIA Control Type**
Map UIA Provider interfaces to ATK|50%|Andres|Atk tests done. Left: non-Atk centric tests, and implementation (but easy because it has only one new interface: Atk.Selection, that's why I put 50%)|
|**Prepare Demo**
Setup VM with demos for Jared's MS demo, write sample scripts|Done|Brian||
|**cspi**
Finish caching; implement Accessible, Component, Selection, and Text interfaces|Done (untested)|Mike||
|**at-spi-registryd**
Test that applications are able to register|50%|Mike||
|**DEB package & QA works**
build packages to deb format, and research some QA works.|70%|Ray|take over some what Calen did, and start to write test samples|
|**Write WinForms Sample Application**
Implement needed WinForms sample application to be tested|34%|Calen|According to QA meeting decision, I will stop this job, and Ray will take over it.|
|**Test Coding Standards**
create standards for test coding and test files/directory name.|90%|Calen|should review it with Brian|
|**Test Script**
build automation test scripts for winforms.|0%|Calen||
|**StatusBar** *(StatusBar)*
Implement needed UIA Provider interfaces|90%|Neville|Missing unit test. GridPatternIdentifiers. To determine the value of IDs.|
|**Iteration 4 Planning Meeting**||||

### Iteration 4 - June 11 - 17

|Task|Status|Owner|Notes|
|:---|:-----|:----|:----|
|**Form**
Implement needed UIA Provider interfaces|80% Done|Sandy|Testing incomplete.|
|**GroupBox** *(Group)*
Implement needed UIA Provider interfaces|90% Done|Sandy|Testing incomplete.|
|**Button** *(Button)*
Implement needed UIA Provider interfaces|95% Done|Sandy|Some unimplemented properties, see [Control Status](/Accessibility:_Control_Status).|
|**RadioButton**
Implement needed UIA Provider interfaces|95% Done|Sandy|Testing incomplete.|
|**ListBox**
Implement needed UIA Provider interfaces|0% Done|Sandy|Not started|
|**Winforms Patch**
Get necessary MWF patches comitted to mcs project|100% Done|Sandy|Worked with jpobst and kangaroo to get patch in shape and committed.|
|**Olive Infrastructure**
Set up deployment of UIAutomation\* assemblies|90% Done|Sandy|Waiting for patch review; adds a11y.pc and installs symlinks of our assemblies in \$prefix/lib/mono/a11y (previous it was in .../mono/3.0).|
|**Uia2Atk Makefiles**
Create makefiles for UIAutomationWinforms and UiaAtkBridge solutions|50% Done|Sandy|Finished UIAutomationWinforms, UiaAtkBridge will require more work because MD doesn't generate Makefiles for C projects.|
|**TextBox** *(Edit/Document)*
Implement needed UIA Provider interfaces|85%|Mario|Partial implementation of ITextProvider: missing methods in TextRangeProvider. Missing IScrollProvider implementation.|
|**RichTextBox** *(Edit/Document)*
Implement needed UIA Provider interfaces|50%|Mario|Reuses TextRangeProvider class (part of TextBoxProvider). Missing TextUnit.Format (used by this control) and IScrollProvider implementation.|
|**MaskedTextBox** *(Edit)*
Implement needed UIA Provider interfaces|85%|Mario|Reuses TextRangeProvider class (part of TextBoxProvider).|
|**ComboBox**
Implement needed UIA Provider interfaces|90%|Mario|Tests missing.|
|**Write winforms architecture wiki-page**|Planned|Mario||
|**List UIA Control Type**
Map UIA Provider interfaces to ATK|10% Done|Calvin|Carrying this forward to next iteration|
|**RadioButton UIA Control Type**
Map UIA Provider interfaces to ATK|70% done|Andres|Lacking events and unresolved issue about radiobutton default checked behaviour|
|**ComboBox UIA Control Type**
Map UIA Provider interfaces to ATK|70% done|Andres|Lacking events and investigation on different CB styles|
|**Event Capture Script**
Write app that will catch at-spi events|Done|Brian||
|**Polish test harness**
check results, bug fixes, summarized error logs, etc.|Done|Brian||
|**Review QA standards**
Review the QA standards info that Calen created|Done|Brian||
|**Cspi**
Finish testing and debugging application registration and event passing|75%|Mike||
|**StatusBar**
Implement needed UIA Provider interfaces|Done|Neville|Determine the value of IDs. Run nunit on Vista.|
|**Write Samples**
Catch up to speed to finish test samples|79%|Ray|pick Form and FontDialog controls to "cut my teeth" on.|
|**Test Coding Standards**
review it with Brian and finish it|Done|Calen||
|**Test Script**
start to learn and practice strongwind test scripts against gtk app with Brian's help.|30%|Calen||
|**winforms application samples**
update winforms application samples base on test coding standards.|Done|Calen||
|**Iteration 5 Planning Meeting**
June 18, 2008
[14:00:00 UTC](http://www.timeanddate.com/worldclock/fixedtime.html?month=6&day=18&year=2008&hour=8&min=0&sec=0&p1=220)|planned|All||

### Iteration 5 - June 18 - 24

Task

Status

Owner

Notes

**Form**
Implement needed UIA Provider interfaces

80% Done

Sandy

Testing incomplete.

**GroupBox** *(Group)*
Implement needed UIA Provider interfaces

90% Done

Sandy

Testing incomplete.

**Button** *(Button)*
Implement needed UIA Provider interfaces

95% Done

Sandy

Some unimplemented properties, see [Control Status](/Accessibility:_Control_Status).

**RadioButton**
Implement needed UIA Provider interfaces

95% Done

Sandy

Testing incomplete.

**Olive Infrastructure**
Set up deployment of UIAutomation\* assemblies

95% Done

Sandy

Waiting for patch review.

**Uia2Atk Makefiles**
Create makefiles for UIAutomationWinforms and UiaAtkBridge solutions

95% Done

Sandy

Need to clean up install targets and commit. Not too worried about accidentally deploying test assemblies at this point.

**TextBox** *(Edit/Document)*
Implement needed UIA Provider interfaces

85%

Mario

Missing methods in TextRangeProvider. Missing IScrollProvider implementation.

**RichTextBox** *(Edit/Document)*
Implement needed UIA Provider interfaces

50%

Mario

Missing methods in TextRangeProvider. Missing IScrollProvider implementation.

**MaskedTextBox** *(Edit)*
Implement needed UIA Provider interfaces

85%

Mario

Missing methods in TextRangeProvider. Missing IScrollProvider implementation.

**ComboBox**
Implement needed UIA Provider interfaces

90%

Mario

Missing tests and internal controls in Navigation: Edit, List and Button.

**ListBox**
Implement needed UIA Provider interfaces

80%

Mario

Navigation logic missing.

**Write winforms architecture wiki-page**

Done

Mario

[Windows Forms Implementation Page.](/Accessibility:_Winforms_Implementation) More detailed information will be added as soon as we add more classes.

**List UIA Control Type**
Map UIA Provider interfaces to ATK

10% Done

Calvin

Carried over from last iteration

**Window UIA Control Type**
Map UIA Provider interfaces to ATK

70%

Andres

Lacking events

**Update openSUSE VMs**
Create new openSUSE11 VMs and setup test environment on them

Done

Brian

**Implement Samples**
Continue to implement test samples

79%

Ray

get more details from [Accessibility:_Test_Plan_WinForms_Controls](/Accessibility:_Test_Plan_WinForms_Controls) (57/72)

**Cspi**
Finish testing and debugging application registration and event passing

87.5%

Mike

**Cspi**
Implement table, hypertext, and editableText interfaces

Done (untested)

Mike

**discuss strongwind test**
discuss strongwind test with Brian.

Done

Calen

**Test Script**
start to learn and practice strongwind test scripts against gtk TreeView app work with Brian's help.

Done

Calen

**Build UiaAtkBridge**
 This is the first initial build

99%

decriptor

Autotools stuff is pretty much finished. Working on creating rpms

**Build UIAutomationWinforms**
 This is the first initial build

99%

decriptor

Autotools stuff is pretty much finished. Working on creating rpms

**Iteration 6 Planning Meeting**

### Iteration 6 - June 25 - July 1

|Task|Status|Owner|Notes|
|:---|:-----|:----|:----|
|**Form**
Implement needed UIA Provider interfaces|80% Done|Sandy|Testing incomplete.|
|**GroupBox** *(Group)*
Implement needed UIA Provider interfaces|90% Done|Sandy|Testing incomplete.|
|**Button** *(Button)*
Implement needed UIA Provider interfaces|95% Done|Sandy|Some unimplemented properties, see [Control Status](/Accessibility:_Control_Status).|
|**RadioButton**
Implement needed UIA Provider interfaces|95% Done|Sandy|Testing incomplete.|
|**Olive Infrastructure**
Set up deployment of UIAutomation\* assemblies|95% Done|Sandy|Waiting for patch review.|
|**Uia2Atk Makefiles**
Create makefiles for UIAutomationWinforms and UiaAtkBridge solutions|Done|Sandy|There may be outstanding issues related to installing test assemblies and providing packaging support...will work with Stephen Shaw if such issues surface.|
|**TextBox** *(Edit/Document)*
Implement needed UIA Provider interfaces|85%|Mario|Missing methods in TextRangeProvider. Missing IScrollProvider implementation.|
|**RichTextBox** *(Edit/Document)*
Implement needed UIA Provider interfaces|50%|Mario|Missing methods in TextRangeProvider. Missing IScrollProvider implementation.|
|**MaskedTextBox** *(Edit)*
Implement needed UIA Provider interfaces|85%|Mario|Missing methods in TextRangeProvider. Missing IScrollProvider implementation.|
|**ComboBox**
Implement needed UIA Provider interfaces|90%|Mario|List navigation preview. Missing tests and internal controls in Navigation: Edit and Button.|
|**ListBox**
Implement needed UIA Provider interfaces|80%|Mario|Navigation logic preview: tests missing. This provider will support CheckListBox.|
|**CheckedListBox**
Implement needed UIA Provider interfaces|80%|Mario|Same as ListBox provider.|
|**ScrollBar**
Implement needed UIA Provider interfaces|90%|Mario|This provider supports: ScrollBar, HScrollBar and VScrollBar. Missing: more tests.|
|**HScrollBar**
Implement needed UIA Provider interfaces|90%|Mario|Same as ScrollBar.|
|**VScrollBar**
Implement needed UIA Provider interfaces|90%|Mario|Same as ScrollBar.|
|**Revamping'**
 Navigation logic and Fragment subclassing.|Done|Mario||
|**List UIA Control Type**
Map UIA Provider interfaces to ATK|40% Done|Calvin|Carried over.|
|**Bridge Code re-work**
Fix up contruction of DOM to be based on fragement elements|Planned|Calvin||
|**Edit UIA Control Type**
Map UIA Provider interfaces to ATK|30%|Andres|Uncommitted yet|
|**Research Orca Automated Testing**
Determine how we are going to test our product with Orca|Done|Brian||
|**Add WinForms testing info to test plan**
Discuss how we are doing WinForms testing on the Approach section of the test plan|Done|Brian||
|**Update test plan**
Update test plan with current information.|Done|Brian||
|**Test test harness and gtk tests on OS11**|Done|Brian||
|**Submit abstract for UTOSC**
Submit proposal to present at UTOSC 08|Done|Brian||
|**Test Script**
practice strongwind test scripts to check Button against gtk. work with Brian's help.|Done|Calen||
|**Implement Samples**
Continue to implement test samples|79%|Ray|get more detials from [Accessibility:_Test_Plan_WinForms_Controls](/Accessibility:_Test_Plan_WinForms_Controls) (57/72)|
|**Cspi**
Finish testing and debugging application registration|Done?|Mike||
|**Cspi**
Adapt cspi test template as needed for dbus|Planned|Mike||
|**Build UiaAtkBridge**
This is the first initial build|99%|decriptor|Working on creating rpms. This should be done this iteration|
|**Build UIAutomationWinforms**
This is the first initial build|99%|decriptor|Working on creating rpms. This should be done this iteration|
|**Build System**
A methodology or system for building|planned|decriptor||
|**StatusBar**
Implement needed UIA Provider interfaces|90%|Neville|Testing incomplete.|
|**Parallel Mono Environments**
Set up build environment|50%|Neville||
|**CheckedListBox** *(List)*
Implement needed UIA Provider interfaces|Planned|Neville||
|**Iteration 7 Planning Meeting**||||

### Iteration 7 - July 2 - July 8

|Task|Status|Owner|Notes|
|:---|:-----|:----|:----|
|**Form**
Implement needed UIA Provider interfaces|80% Done|Sandy|Testing incomplete.|
|**GroupBox** *(Group)*
Implement needed UIA Provider interfaces|90% Done|Sandy|Testing incomplete.|
|**Button** *(Button)*
Implement needed UIA Provider interfaces|95% Done|Sandy|Some unimplemented properties, see [Control Status](/Accessibility:_Control_Status).|
|**RadioButton**
Implement needed UIA Provider interfaces|95% Done|Sandy|Testing incomplete.|
|**Olive Infrastructure**
Set up deployment of UIAutomation\* assemblies|95% Done|Sandy|Waiting for patch review.|
|**TextBox** *(Edit/Document)*
Implement needed UIA Provider interfaces|85%|Mario|Missing methods in TextRangeProvider. Missing IScrollProvider implementation.|
|**RichTextBox** *(Edit/Document)*
Implement needed UIA Provider interfaces|50%|Mario|Missing methods in TextRangeProvider. Missing IScrollProvider implementation.|
|**MaskedTextBox** *(Edit)*
Implement needed UIA Provider interfaces|85%|Mario|Missing methods in TextRangeProvider. Missing IScrollProvider implementation.|
|**ComboBox**
Implement needed UIA Provider interfaces|90%|Mario|Finish navigation: missing Edit. More tests.|
|**ListBox** and **CheckedListBox**
Implement needed UIA Provider interfaces|80%|Mario|More tests|
|**ScrollBar**, **HScrollBar** and **VScrollBar**
Implement needed UIA Provider interfaces|90%|Mario|More tests.|
|**StatusBar**
Implement needed UIA Provider interfaces|90%|Neville|Update provider to new changes.|
|**Parallel Mono Environments**
Set up build environment|Done|Neville||
|**FTO and Bridge work**||Calvin||
|**Cspi**
Implement login-helper interface|Done (untested)|Mike||
|**Review WinForms sample apps**
Review our current WinForms sample apps and make some notes for Ray|Done|Brian||
|**Write example tests**
Determine methods for testing Tooltip and Treeview widgets|Done|Brian||
|**Write another Strongwind test**
Work with Calen on one test.|Done|Brian||
|**Implement Samples**
Continue to implement test samples|79%|Ray|get more detials from [Accessibility:_Test_Plan_WinForms_Controls](/Accessibility:_Test_Plan_WinForms_Controls) (57/72)|
|**Polish samples**
polish the samples to suite the test needs.|70%|Ray|11 samples need to be improved|
|**strongwind Test Script**
practice strongwind test scripts for statusbar, menubar/menuitem, toolbar, pagetab, scrollbar.|Done|Calen|I wrote all of those tests in one test script by runing gedit as practice application|
|**blog document**
worte strongwind study information in blog.|Done|Calen||
|||||
|**Iteration 8 Planning Meeting**||||

### Iteration 8 - July 8 - 15

|Task|Status|Owner|Notes|
|:---|:-----|:----|:----|
|**Form**
Implement needed UIA Provider interfaces|80% Done|Sandy|Testing incomplete.|
|**GroupBox** *(Group)*
Implement needed UIA Provider interfaces|90% Done|Sandy|Testing incomplete.|
|**Button** *(Button)*
Implement needed UIA Provider interfaces|95% Done|Sandy|Some unimplemented properties, see [Control Status](/Accessibility:_Control_Status).|
|**RadioButton**
Implement needed UIA Provider interfaces|95% Done|Sandy|Testing incomplete.|
|**Olive Infrastructure**
Set up deployment of UIAutomation\* assemblies|95% Done|Sandy|Waiting for patch review.|
|**New Contributor Guidelines**
Document how a new UIA developer should get started building and developing our code, and what guidelines to follow for patches and direct svn access.|100% Done|Sandy|Of course the wiki page, [Accessibility: Getting Started With Development](/Accessibility:_Getting_Started_With_Development), is a living document, so it can always be improved. Explanatory email sent to list.|
|**TextBox** *(Edit/Document)*
Implement needed UIA Provider interfaces|85%|Mario|Missing methods in TextRangeProvider. Missing IScrollProvider implementation.|
|**RichTextBox** *(Edit/Document)*
Implement needed UIA Provider interfaces|50%|Mario|Missing methods in TextRangeProvider. Missing IScrollProvider implementation.|
|**MaskedTextBox** *(Edit)*
Implement needed UIA Provider interfaces|85%|Mario|Missing methods in TextRangeProvider. Missing IScrollProvider implementation.|
|**ComboBox**
Implement needed UIA Provider interfaces|95%|Mario|Missing internal Vertical ScrollBar in internal ListBox.|
|**ListBox** and **CheckedListBox**
Implement needed UIA Provider interfaces|95%|Mario|More tests|
|**ScrollBar**, **HScrollBar** and **VScrollBar**
Implement needed UIA Provider interfaces|95%|Mario|More tests.|
|**StatusBar**
Implement needed UIA Provider interfaces|90%|Neville|Missing Navigation.|
|**FTO**||Calvin|on FTO during iteration|
|**strongwind Test Script**
practice strongwind test scripts for openDialog, saveDialog, update two test scripts.|Done|Calen||
|**tooltip problem in openSUSE11.0**
encountered tooltip problem,and spent some times to reseach the reason and discuss the problem with bgmerrell and other people.|Done|Calen||
|**Implement Samples**
Continue to implement test samples|79%|Ray|get more detials from [Accessibility:_Test_Plan_WinForms_Controls](/Accessibility:_Test_Plan_WinForms_Controls) (57/72)|
|**Polish samples**
polish the samples to suite the test needs.|87%|Ray||
|**Strongwind practice**
write strongwind tests for multiple dialogs and several strongwind widgets we haven't dealt with yet|Done|Brian||
|**Resolve tooltip problem**
discover why tooltips aren't accessible in openSUSE11|Done|Brian|[http://bugzilla.gnome.org/show_bug.cgi?id=542873](http://bugzilla.gnome.org/show_bug.cgi?id=542873)|
|**Support radio button menu items**
Add support for radio menu items to Strongwind|Done|Brian|[http://bugzilla.gnome.org/show_bug.cgi?id=542458](http://bugzilla.gnome.org/show_bug.cgi?id=542458)|
|**Support menu items with children**
Add support for menu items with children to Strongwind|Done|Brian|[http://bugzilla.gnome.org/show_bug.cgi?id=542458](http://bugzilla.gnome.org/show_bug.cgi?id=542458)|
|||||
|**Iteration 9 Planning Meeting**||||

### Iteration 9 - July 16 - 22

|Task|Status|Owner|Notes|
|:---|:-----|:----|:----|
|**Correct StructureChangedEvents Usage**|100% Done|Sandy|Providers now send the correct events, and the bridge "remove" notification handling is partially implemented.|
|**Form**
Implement needed UIA Provider interfaces|99% Done|Sandy|Need small tweak before committing.|
|**GroupBox** *(Group)*
Implement needed UIA Provider interfaces|99% Done|Sandy|Need small tweak before committing.|
|**Button** *(Button)*
Implement needed UIA Provider interfaces|100% Done|Sandy||
|**RadioButton**
Implement needed UIA Provider interfaces|99% Done|Sandy|Need small tweak before committing.|
|**Olive Infrastructure**
Set up deployment of UIAutomation\* assemblies|95% Done|Sandy|Waiting for patch review.|
|**Winforms Implementation Wiki Page**
Update.|Done|Mario|[Page updated](/Accessibility:_Winforms_Implementation) to latest changes.|
|**TextBox**, **RichTextBox**, **MaskedTextBox** *(Edit/Document)*
Implement needed UIA Provider interfaces|70%|Mario|Missing methods in TextRangeProvider. Missing IScrollProvider implementation.|
|**ComboBox**
Implement needed UIA Provider interfaces|99%|Mario|Implement ScrollBar in internal ListBox.|
|**ListBox** and **CheckedListBox**
Implement needed UIA Provider interfaces|98%|Mario|ListBox done. Finish CheckedListBox Unitary Tests.|
|**ScrollBar**, **HScrollBar** and **VScrollBar**
Implement needed UIA Provider interfaces|Done|Mario||
|**PictureBox**
Implement needed UIA Provider interfaces|50%|Mario|Finish Unitary Tests.|
|**ErrorProvider**, **ToolTip**, **HelpProvider**
Implement needed UIA Provider interfaces|30%|Mario|Partial implementation, need to improve logic to get components from winform control: Form. Write Unitary Tests.|
|**StatusBar**
Implement needed UIA Provider interfaces|80%|Neville|Missing Navigation.|
|**GridItem**
Implement needed Control Pattern interfaces|Done|Neville||
|**ProgressBar**
Implement needed UIA Provider interfaces|Planned|Neville|Prepare for StatusBar Navigation.|
|**Bridge Work**
Catch up on bridge work|Planned|Calvin||
|**Menu UIA Control Type**
Map UIA Provider interfaces to ATK|Planned|Andres||
|**Edit UIA Control Type**
Map UIA Provider interfaces to ATK|30%|Andres|Planned to finish and commit|
|**StatusBar UIA Control Type**
Map UIA Provider interfaces to ATK|80%?|Mike|Need to finish tests. Also, StatusBarPanels are untested.|
|**Add repo to test machines**
Add Mono repo with our packages to test machines and set auto updates.|Aborted|Brian|Not using repos anymore (at this time)|
|**Fix logging in test harness**
Log directories aren't unique using time only. Need to use date and time.|Done|Brian||
|**Refactor Gtk Test Examples**
Do more abstraction in the application wrapper to make the test scripts more simple.|Done|Brian|These Gtk examples are what we will base our WinForms tests on.|
|**Create actions and states constants**
setup scripts with string values for valid actions and states|Done|Brian|This didn't turn out like I had hoped, but the scripts are there. We'll add to them as we go. I had hoped to get a complete static list from the beginning.|
|**Implement Samples**
Continue to implement test samples|79%|Ray|get more detials from [Accessibility:_Test_Plan_WinForms_Controls](/Accessibility:_Test_Plan_WinForms_Controls) (57/72)|
|**Polish samples**
polish the samples to suite the test needs.|Done|Ray||
|**Test Button control**
strongwind test scripts for winforms Button control.and log bug|80%|Calen|test script need to be checked to add into the test suite. bugs need to be fixed|
|**Analyze Frame problem**
Analyze why strongwind can't find Frame|done|Calen|program doesn't support 'showing' state, but strongwind need run findFrame() with x.showing, and program can't get new label text when click button, so test run false.|
|**upgrade winforms app**
upgrade some winforms applicaltion not use '&' in form text.|done|Calen|if there is '&' in form text, strongwind can't find the frame.|
|**Build System**
A methodology or system for building|done|decriptor|Moving forward with a hybrid solution of monobuild and OBS|
|**RPM push script**
A script that grabs all the latest|90%|decriptor|Collects all of the latest rpms and pushes them to build1|
|**Extend Monobuild**
Build out monobuild to handle our needs|00%|decriptor|Learn the code ( the original coder is gone )|
|||||
|**Iteration 10 Planning Meeting**||||

### Iteration 10 - July 23 - 29

|Task|Status|Owner|Notes|
|:---|:-----|:----|:----|
|**Commit outstanding tests**
Form, RadioButton, GroupBox|Committed, but Form tests could be improved.|Sandy||
|**Update contributor guidelines**
Specifically, document where our coding standards, etc, deviate from the rest of Mono.|Done|Sandy||
|**Olive Infrastructure**
Set up deployment of UIAutomation\* assemblies|Done|Sandy|Committed.|
|**PictureBox**
Implement needed UIA Provider interfaces|50%|Mario|Finish Unitary Tests. Update Navigation.|
|**ErrorProvider**, **ToolTip**, **HelpProvider**
Implement needed UIA Provider interfaces|70%|Mario|Missing Navigation, unitary Tests and HelpProvider provider implementation.|
|**StatusBar**
Implement needed UIA Provider interfaces|80%|Neville|Missing Navigation.|
|**ProgressBar**
Implement needed UIA Provider interfaces|80%|Neville|Prepare for StatusBar Navigation.|
|**ScrollBar UIA Control Type**
Map UIA Provider interfaces to ATK|60%|Mike|Need test, orientation support, GetValue fix|
|**atspi-dbus ATK adaptor**
Finish collection interface|Done (untested)|Mike||
|**Image UIA Control Type**
Map UIA Provider interfaces to ATK|Planned|Calvin||
|**Spinner UIA Control Type**
Map UIA Provider interfaces to ATK|Planned|Andres||
|**Implement Samples**
Continue to implement test samples|80%|Ray|get more detials from [Accessibility:_Test_Plan_WinForms_Controls](/Accessibility:_Test_Plan_WinForms_Controls) (58/72)|
|**Build software**
Promote the lastest Accerciser into openSUSE:Facctory|10%|Ray|fork a branch, wait for built and promote it.|
|**Write uia2atk update script**
Write a script that pulls down and installs the latest uia2atk related rpms|Done|Brian||
|**Update Gtk samples with constants**
Update the Gtk samples to use the actions and states constants instead of strings|Done|Brian||
|**Test Button control**
script strongwind test for winforms Button control.and run test|80%|Calen|test script need to be checked to add into the test suite. waiting bugs to be fixed|
|**Test CheckBox control**
script strongwind test scripts for winforms CheckBox control. and run test|80%|Calen|test script need to be checked to add into the test suite. waiting bugs to be fixed|
|**Test RadioButton control**
script strongwind test scripts for winforms RadioButton control.|60%|Calen|not run the test yet, developer doesn't finish it. and test script need to be checked to add into the test suite.|
|||||
|**Iteration 11 Planning Meeting**||||

### Iteration 11 - July 30 - August 5

|Task|Status|Owner|Notes|
|:---|:-----|:----|:----|
|**NumericUpDown**
Implement needed UIA Provider interfaces|95%|Sandy|Testing not completed.|
|**PrintPreviewDialog**
Implement needed UIA Provider interfaces|Not started|Sandy||
|**Bugfixing**
Address major issues in bugzilla|Done|Sandy|Fixed bugs 411328, 412206, and 411345. No luck with 411882.|
|**PictureBox** *(Pane)*
Implement needed UIA Provider interfaces|50%|Mario|Finish Unitary Tests. Update Navigation.|
|**ErrorProvider**, **ToolTip**, **HelpProvider** *(Pane, ToolTip, ToolTip)*
Implement needed UIA Provider interfaces|70%|Mario|Missing Navigation, unitary Tests and HelpProvider provider implementation.|
|**TextBox**, **RichTextBox**, **MaskedTextBox** *(Edit/Document)*
Implement needed UIA Provider interfaces|70%|Mario|Missing methods in TextRangeProvider. Missing IScrollProvider implementation.|
|**ComboBox**
Implement needed UIA Provider interfaces|99%|Mario|Implement ScrollBar in internal ListBox.|
|**StatusBar**
Implement needed UIA Provider interfaces|Done|Neville||
|**ProgressBar**
Implement needed UIA Provider interfaces|Done|Neville|Prepare for StatusBar Navigation.|
|**Image**
Implement needed UIA Provider interfaces|50%|Neville|Finding Image Type Control.|
|**Edit**
Implement needed UIA Provider interfaces|50%|Neville|Prepare for StatusBar Navigation.|
|**ScrollBar UIA Control Type**
Finish mapping UIA Provider interfaces to ATK|50%|Mike|Still need tests|
|**Separator UIA Control Type**
Map UIA Provider interfaces to ATK|Planned|Calvin||
|**Group UIA Control Type**
Map UIA Provider interfaces to ATK|Planned|Calvin||
|**Document UIA Control Type**
Map UIA Provider interfaces to ATK|Planned|Andres||
|**uia2atk update cron job**
Put cron jobs on openSUSE test machines to execute uia2atk update script at a certain interval|Planned|Brian||
|**Write an Orca Automated Test**
Write an automated proof-of-concept test with Orca's test harness.|Planned|Brian||
|**Update test VMs**
Setup test environment non-openSUSE VMs|Planned|Brian||
|**Document+Blog testing techniques**
Howto write Strongwind tests and how to add them to the test suite.|60%|Brian|Finished with sample application. Started writing howto.|
|**Implement Samples**
Continue to implement test samples|84%|Ray|get more detials from [Accessibility:_Test_Plan_WinForms_Controls](/Accessibility:_Test_Plan_WinForms_Controls) (61/72)|
|**Test scrollbar control**
script strongwind test scripts for winforms scrollbar control against checkedlistbox.py, and run test.|80%|Calen|[Bug414937](https://bugzilla.novell.com/show_bug.cgi?id=414937) is blocking the test|
|**Test vscrollbar control**
script strongwind test scripts for winforms vscrollbar control against vscrollbar.py, and run test.|80%|Calen|minor [Bug414617](https://bugzilla.novell.com/show_bug.cgi?id=414617)|
|**Test hscrollbar control**
script strongwind test scripts for winforms hscrollbar control against hscrollbar.py, and run test.|80%|Calen|same as vscrollbar test|
|||||
|**Iteration 12 Planning Meeting**||||

### Iteration 12 - August 6 - 12

|Task|Status|Owner|Notes|
|:---|:-----|:----|:----|
|**NumericUpDown**
Implement needed UIA Provider interfaces|95%|Sandy|Testing not completed.|
|**PrintPreviewDialog**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**Bugfixing**
Address major issues in bugzilla|Planned|Sandy||
|**ErrorProvider**, **ToolTip**, **HelpProvider** *(Pane, ToolTip, ToolTip)*
Implement needed UIA Provider interfaces|70%|Mario|Missing Navigation, unitary Tests and HelpProvider provider implementation.|
|**TextBox**, **RichTextBox**, **MaskedTextBox** *(Edit/Document)*
Implement needed UIA Provider interfaces|70%|Mario|Missing methods in TextRangeProvider. Missing IScrollProvider implementation.|
|**ComboBox**
Implement needed UIA Provider interfaces|99%|Mario|Implement ScrollBar in internal ListBox.|
|**Navigation**
Updated Navigation to support Component-based providers.|Done|Mario||
|**Winforms Implementation**
Updated [wiki](/Accessibility:_Winforms_Implementation) page.|Done|Mario||
|**MWF Patches**
Bugs opened to track UIA patches in MWF controls|Done|Mario|Opened [ListBox](https://bugzilla.novell.com/show_bug.cgi?id=416663) Bug
 Opened [ComboBox](https://bugzilla.novell.com/show_bug.cgi?id=416640) Bug
 Opened [HScrollBar/VScrollBar](https://bugzilla.novell.com/show_bug.cgi?id=416759) Bug|
|**Mono-a11y Patches**
Review of patches sent to mailing list.|Done|Mario||
|**Image**
Implement needed UIA Provider interfaces|50%|Neville|Finding Image Type Control.|
|**Edit**
Implement needed UIA Provider interfaces|Done|Neville|Canceled because it could be automatically added.|
|**StatusBarPanel**
Implement needed UIA Provider interfaces|Planned|Neville|Puzzled with its type (Edit or Pane).|
|**ScrollBar UIA Control Type**
Finish mapping UIA Provider interfaces to ATK|50%|Mike||
|**ProgressBar UIA Control Type**
Map UIA Provider interfaces to ATK|Done (untested)|Mike||
|**Slider UIA Control Type**
Map UIA Provider interfaces to ATK|Planned|Andres||
|**Example Code**
Code Gtk example to show how we can test the sorting order of certain controle. e.g., ensure that clicking a column header reorders the table cells in a treeview|Done|Brian|Code added to the gtktreeview tests|
|**Create QA Architecture Diagrams**
Create architecture diagrams for Strongwind by itself and Strongwind together with our test harness.|Done|Brian|[1](/archived/images/5/5a/Strongwind_arch.png) and [2](/archived/images/7/75/Qa_arch.png)|
|**Plan testing of other "styles"**
Discuss and come up with a plan to test different styles/subelements of WinForms controls|Done|Brian|[https://bugzilla.novell.com/show_bug.cgi?id=418916](https://bugzilla.novell.com/show_bug.cgi?id=418916)|
|**Implement Samples**
Continue to implement test samples|88%|Ray|get more detials from [Accessibility:_Test_Plan_WinForms_Controls](/Accessibility:_Test_Plan_WinForms_Controls) (64/72)|
|**Test CheckBox control**
script strongwind test scripts for winforms CheckBox control. and run test, verified bug|95%|Calen|test script need to be checked to add into the test suite.|
|**Test Form control**
script strongwind test scripts for winforms Form control. and run test|80%|Calen|test script need to be checked to add into the test suite. waiting bugs to be fixed|
|**Test Label control**
script strongwind test scripts for winforms Label control. and run test|80%|Calen|test script need to be checked to add into the test suite.|
|**modify old strongwind test code**|Done|Calen|added 'showing' state to our test list and modify some states with '-' to link two word in states.py, modify all of the old code because bug411345 has been fixed.|
|||||
|**Iteration 13 Planning Meeting**||||

### Iteration 13 - August 13 - 19

|Task|Status|Owner|Notes|
|:---|:-----|:----|:----|
|**NumericUpDownProvider**
Implement needed UIA Provider interfaces|Done|Sandy||
|**Implement LabeledByProperty**|Done|Sandy|(tested, too)|
|**Prepare UTOSC talk with Brian**|In Progress|Sandy||
|**Support recursive provider property changes**|20%|Sandy||
|**ErrorProvider** and **ToolTip** *(Pane, ToolTip)*
Implement needed UIA Provider interfaces|90%|Mario|Missing Unitary Tests.|
|**HelpProvider** *(ToolTip)*
Implement needed UIA Provider interfaces|Planned|Mario|Missing implementation and Unitary Tests.|
|**TextBox**, **RichTextBox**, **MaskedTextBox** *(Edit/Document)*
Implement needed UIA Provider interfaces|70%|Mario|Missing methods in TextRangeProvider. Missing IScrollProvider implementation.|
|**ComboBox**
Implement needed UIA Provider interfaces|99%|Mario|Implement ScrollBar in internal ListBox.|
|**MWF Patches**
Bugs opened to track UIA patches in MWF controls|Planned|Mario|Update [ListBox](https://bugzilla.novell.com/show_bug.cgi?id=416663) patch.
 Update [ComboBox](https://bugzilla.novell.com/show_bug.cgi?id=416640) patch.
 Update [HScrollBar/VScrollBar](https://bugzilla.novell.com/show_bug.cgi?id=416759) patch.|
|**SWF.StatusBar Patch**|Done|Neville|Make StatusBar support PanelAdded Event.|
|**StatusBar**
Implement needed UIA Provider interfaces|90%|Neville|Navigation problems.|
|**StatusBarPanel**
Implement needed UIA Provider interfaces|90%|Neville|Missing test.|
|**GroupBox UIA Control Type**
Map UIA Provider interfaces to ATK|50%|Mike|Mapped to Pane; missing IExpandCollapseProvider|
|**ToolBar UIA Control Type**
Map UIA Provider interfaces to ATK|Planned|Andres||
|**Fix crashing WinForms tests**
WinForms takes a little longer than Gtk for the application to launch and applications list to settle; this was causing the crashes.|Done|Brian|Affects all \_\_init\_\_.py scripts.|
|**Smoke test plan**
Create smoke test plan with Ray and Calen|Done|Brian||
|**initial UTOSC slides"**
create UTOSC slides for my part of the presentation|Done|Brian|TOP SECRET!|
|**Research Orca Automated Testing**
Determine how we are going to test our product with Orca|Done|Brian|Have the beginnings of a functional test|
|**Implement Samples**
Continue to implement test samples|88%|Ray|get more detials from [Accessibility:_Test_Plan_WinForms_Controls](/Accessibility:_Test_Plan_WinForms_Controls) (64/72)|
|**Test Form control**
run test again|95%|Calen|test script need to be checked to add into the test suite.|
|**Test RadioButton control**
run test again|80%|Calen|bug411882 block the frame be closed|
|**Test PictureBox control**
commit test code and run test|80%|Calen||
|**Test StatusBar control**
commit test code and run test again|80%|Calen||
|**Test ListBox control**
commit test code and run test again|80%|Calen|accerciser can't get list's parent, and cant use 'click' action to select listitem,there is no action can be use|
|**Test GroupBox control**
commit test code and run test again|80%|Calen||
|**comment bug**
gave comment info for bug411328|Done|Calen||
|||||
|**Iteration 14 Planning Meeting**||||

### Iteration 14 - August 20 - September 2 (2 week iteration because of hackweek)

|Task|Status|Owner|Notes|
|:---|:-----|:----|:----|
|**Name and LabeledBy Properties**
Fix these properties to behave as expected.|Done and tested|Sandy||
|**Recursive Properties**
Support proper event propagation.|80% Done|Sandy||
|**ErrorProvider** and **ToolTip** *(Pane, ToolTip)*
Implement needed UIA Provider interfaces|90%|Mario|Missing Unitary Tests.|
|**HelpProvider** *(ToolTip)*
Implement needed UIA Provider interfaces|Planned|Mario|Missing implementation and Unitary Tests.|
|**TextBox**, **RichTextBox**, **MaskedTextBox** *(Edit/Document)*
Implement needed UIA Provider interfaces|70%|Mario|Missing methods in TextRangeProvider. Missing IScrollProvider implementation.|
|**ComboBox**
Implement needed UIA Provider interfaces|99%|Mario|Implement ScrollBar in internal ListBox.|
|**MWF Patches**
Bugs opened to track UIA patches in MWF controls|Done|Mario|Updated [ListBox](https://bugzilla.novell.com/show_bug.cgi?id=416663) patch: Commited in mcs r111718.
 Updated [ComboBox](https://bugzilla.novell.com/show_bug.cgi?id=416640) patch: Commited in mcs r111719.
 Updated [HScrollBar/VScrollBar](https://bugzilla.novell.com/show_bug.cgi?id=416759) patch: Commited in mcs r111720.|
|**ProgressBar**
Implement needed UIA Provider interfaces|Done|Neville||
|**StatusBarPanel**
Implement needed UIA Provider interfaces|90%|Neville|Couldn't get control instance in Test|
|**MWF Patches**
Bugs opened to track UIA patches in MWF controls|Done|Neville|Updated [StatusBar](https://bugzilla.novell.com/show_bug.cgi?id=419079) patch: Commited in mcs r112138.|
|**Tab UIA Control Type**
Map UIA Provider interfaces to ATK|Planned|Brad||
|**Spinner UIA Control Type**
Map UIA Provider interfaces to ATK|Planned|Mike||
|**TabItem UIA Control Type**
Map UIA Provider interfaces to ATK|Planned|Mike||
|**Review and edit Form test**
Review Calen's Form test and make updates|Done|Brian||
|**UTOSC plans & practice**
Plan and prepare for UTOSC presentation with Sandy|Done|Brian||
|**QA Process Bugs**
Log some bugs about our QA process and discuss with Brad & Andres|Done|Brian|[418916](https://bugzilla.novell.com/show_bug.cgi?id=418916), [418909](https://bugzilla.novell.com/show_bug.cgi?id=418909)|
|**UTOSC presentation graphics**
Finish up the architecture graphics for our utosc slides|Done|Brian|TOP SECRET!|
|**Enhance uia2atk_rpm_update.sh**
Better command line argument parsing and add functionality to download and install older rpms (in case smoke tests fail)|Done|Brian||
|**Implement Samples**
Continue to implement test samples|90%|Ray|get more detials from [Accessibility:_Test_Plan_WinForms_Controls](/Accessibility:_Test_Plan_WinForms_Controls) (65/72)|
|**Work on Strongwind**
try to write my first strongwind test sample|0%|Ray||
|**Test CheckedListBox control**
commit test code and run test|80%|Calen||
|**Test ToolTip control**
commit test code|50%|Calen||
|**Test StatusBar control**
run test again|95%|Calen||
|**verify bugs**
upgrad test environment and verify bugs|Done|Calen||
|**run tests and file bugs**
re-run some strongwind tests|Done|Calen|[Bug421836](https://bugzilla.novell.com/show_bug.cgi?id=421836) [Bug421831](https://bugzilla.novell.com/show_bug.cgi?id=421831)|
|||||
|**Iteration 15 Planning Meeting**||||

### Iteration 15 - September 3 - 9

|Task|Status|Owner|Notes|
|:---|:-----|:----|:----|
|**Recursive Properties**
Support proper event propagation.|In progress|Sandy||
|**MenuStrip**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**ToolStripMenuItem**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**ToolStripDropDownItem**
Implement needed UIA Provider interfaces|Planned|Sandy||
|**ErrorProvider**, **ToolTip** and **HelpProvider** *(Pane, ToolTip, ToolTip)*
Implement needed UIA Provider interfaces|90%|Mario|Done|
|**TextBox**, **RichTextBox**, **MaskedTextBox** *(Edit/Document)*
Implement needed UIA Provider interfaces|70%|Mario|Missing methods in TextRangeProvider. Missing IScrollProvider implementation.|
|**ComboBox**
Implement needed UIA Provider interfaces|99%|Mario|Implement ScrollBar in internal ListBox.|
|**MWF Patches**
Assembly friend|Done|Mario|[Patched](https://bugzilla.novell.com/show_bug.cgi?id=422821).|
|**StatusBar**
Implement needed UIA Provider interfaces|90%|Neville|Missing Navigation.|
|**ToolTip UIA Control Type**
Map UIA Provider interfaces to ATK|Planned|Brad||
|**SplitButton UIA Control Type**
Map UIA Provider interfaces to ATK|Planned|Mike||
|**Gtk Orca test**
Finish a complete orca test for our code that utilizes their test harness to execute it|Done|Brian|uia2atk/test/keystrokes|
|**Orca test docs**
Add information about how we will use Orca to test to the [Accessibility:_Testing_Howto](/Accessibility:_Testing_Howto)|Done|Brian|[Accessibility:_Testing_Howto#Orca](/archived/accessibility_testing_howto/#orca)|
|**Implement Winforms Samples**
Continue to implement winforms test samples|90%|Ray|get more detials from [Accessibility:_Test_Plan_WinForms_Controls](/Accessibility:_Test_Plan_WinForms_Controls) (65/72)|
|**Work on Strongwind**
try to write my first strongwind test sample|0%|Ray||
|**Build Deb Package**
Build UIAutomation and UiaAtkBridge to deb packages in home:uia2atk, openSUSE Build Service.|0%|Ray||
|**Test progressbar control**
commited strongwind test code, run test|95%|Calen|Pass|
|**Test numericupdown control**
commited strongwind test code, run test|80%|Calen|when set value in accerciser you should move mouse through the widge otherwise appliction can't get the new value, appearances is the same as bug 415320 and 419023|
|**Test picturebox control**
run test again|95%|Calen|Pass|
|**Test vscrollbar control**
run test again|95%|Calen|Pass|
|**Test hscrollbar control**
run test again|95%|Calen|Pass|
|**Test statusbar control**
run test again|95%|Calen|Pass|
|**verify bugs**
upgrad test environment and verify bugs|Done|Calen||
|**run tests and file bugs**
re-run strongwind tests, and file bugs|Done|Calen|checkbox:[Bug424681](https://bugzilla.novell.com/show_bug.cgi?id=424681)|
|||||
|**Iteration 16 Planning Meeting**||||
