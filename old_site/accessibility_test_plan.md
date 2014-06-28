---
layout: obsolete
title: "Accessibility: Test Plan"
lastmodified: '2010-01-27'
permalink: /old_site/Accessibility:_Test_Plan/
redirect_from:
  - /Accessibility:_Test_Plan/
---

Accessibility: Test Plan
========================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#scope">1 Scope</a></li>
<li><a href="#references">2 References</a></li>
<li><a href="#qa-meetings">3 QA Meetings</a></li>
<li><a href="#definitions">4 Definitions</a></li>
<li><a href="#test-plan">5 Test plan</a>
<ul>
<li><a href="#purpose">5.1 Purpose</a></li>
<li><a href="#outline">5.2 Outline</a>
<ul>
<li><a href="#test-plan-identifier">5.2.1 Test plan identifier</a></li>
<li><a href="#introduction">5.2.2 Introduction</a></li>
<li><a href="#test-items">5.2.3 Test items</a></li>
<li><a href="#software-risk-issues">5.2.4 Software risk issues</a></li>
<li><a href="#features-to-be-tested">5.2.5 Features to be tested</a>
<ul>
<li><a href="#winforms">5.2.5.1 WinForms</a></li>
<li><a href="#moonlight">5.2.5.2 Moonlight</a></li>
<li><a href="#uia-provider">5.2.5.3 UIA Provider</a></li>
<li><a href="#uiaatk-bridge">5.2.5.4 UIA/ATK Bridge</a></li>
<li><a href="#uiaat-spi-bridge">5.2.5.5 UIA/AT-SPI Bridge</a></li>
<li><a href="#uia-client-api">5.2.5.6 UIA Client API</a></li>
</ul></li>
<li><a href="#features-not-to-be-tested">5.2.6 Features not to be tested</a></li>
<li><a href="#approach">5.2.7 Approach</a>
<ul>
<li><a href="#winforms-testing">5.2.7.1 WinForms Testing</a></li>
<li><a href="#moonlight-testing">5.2.7.2 Moonlight Testing</a></li>
<li><a href="#uiautomation-client-api-testing">5.2.7.3 UIAutomation Client API Testing</a></li>
<li><a href="#general-guidelines">5.2.7.4 General Guidelines</a></li>
</ul></li>
<li><a href="#item-passfail-criteria">5.2.8 Item pass/fail criteria</a></li>
<li><a href="#suspension-criteria-and-resumption-requirements">5.2.9 Suspension criteria and resumption requirements</a></li>
<li><a href="#test-deliverables">5.2.10 Test deliverables</a></li>
<li><a href="#testing-preparation-and-setup">5.2.11 Testing preparation and setup</a></li>
<li><a href="#environmental-needs">5.2.12 Environmental needs</a></li>
<li><a href="#responsibilities">5.2.13 Responsibilities</a>
<ul>
<li><a href="#test-suit">5.2.13.1 Test Suit</a></li>
<li><a href="#winforms_2">5.2.13.2 WinForms</a></li>
<li><a href="#moonlight_2">5.2.13.3 MoonLight</a></li>
<li><a href="#uiautomation-client-api">5.2.13.4 UIAutomation Client API</a></li>
</ul></li>
<li><a href="#staffing-and-training-needs">5.2.14 Staffing and training needs</a>
<ul>
<li><a href="#training-plan">5.2.14.1 Training Plan</a></li>
</ul></li>
<li><a href="#schedule">5.2.15 Schedule</a>
<ul>
<li><a href="#winforms_3">5.2.15.1 WinForms</a></li>
<li><a href="#moonlight_3">5.2.15.2 MoonLight</a></li>
<li><a href="#client-api">5.2.15.3 Client API</a></li>
</ul></li>
<li><a href="#risks-and-contingencies">5.2.16 Risks and contingencies</a></li>
<li><a href="#approvals">5.2.17 Approvals</a></li>
</ul></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Scope
-----

A test plan for the Accessibility team's efforts in bringing accessibility to mono by implementing the managed UI Automation framework.

References
----------

[Product Test Plan]({{ site.github.url }}/old_site/Accessibility:_Test_Plan "Accessibility: Test Plan") (current page)
 [Product Test Case Specification]({{ site.github.url }}/old_site/Accessibility:_Test_Case_Specification "Accessibility: Test Case Specification")
 [Product Test Log]({{ site.github.url }}/old_site/Accessibility:_Test_Log "Accessibility: Test Log")
 [Product Test Summary]({{ site.github.url }}/old_site/Accessibility:_Test_Summary "Accessibility: Test Summary")
 [Product Bug Specification]({{ site.github.url }}/old_site/Accessibility:_Bug_Specification "Accessibility: Bug Specification")
 [Product Test Coding Standard]({{ site.github.url }}/old_site/Accessibility:_Test_Coding_Standard "Accessibility: Test Coding Standard")
 [Product Home]({{ site.github.url }}/old_site/Accessibility "Accessibility")

The [Product roadmap]({{ site.github.url }}/Accessibility:_Roadmap)
 The [Architecture overview]({{ site.github.url }}/Accessibility#Architecture)
 [The Novell & Microsoft announcement](http://www.novell.com/news/press/microsoft-and-novell-celebrate-year-of-interoperability-expand-collaboration-agreement) to create cross-platform accessibility framework

QA Meetings
-----------

[June 5 2008]({{ site.github.url }}/old_site/Accessibility:_QA_Meetings_2008_Jun_5 "Accessibility: QA Meetings 2008 Jun 5")
 [August 13 2008]({{ site.github.url }}/old_site/Accessibility:_QA_Meetings_2008_Aug_13 "Accessibility: QA Meetings 2008 Aug 13")
 [Mar 25 2009]({{ site.github.url }}/old_site/Accessibility:_QA_Meetings_2009_Mar_25 "Accessibility: QA Meetings 2009 Mar 25")
 [May 20 2009]({{ site.github.url }}/old_site/Accessibility:_QA_Meetings_2009_May_20 "Accessibility: QA Meetings 2009 May 20")

No meetings scheduled

Definitions
-----------

[UIA](http://msdn2.microsoft.com/en-us/accessibility/bb892133.aspx)---Microsoft UI Automation. A managed code application programming interface (API), exposing user interface controls for test automation and assistive technology. Part of the .NET framework starting at 3.0. Successor of MSAA (Microsoft Active Accessibility)
 UIA Clients---Applications such as screen readers and testing frameworks written in managed code (e.g., C\#/VB).
 UIA Providers---UI implementations or application controls such as checkboxes. Written in managed code or C/C++.
 AT---Assistive technology. A generic term that includes assistive, adaptive, and rehabilitative devices and the process used in selecting, locating, and using them.
 AT-SPI---A toolkit neutral way of providing accessibility facilities in applications. AT-SPI can also be used to automate testing of user interfaces. AT-SPI is currently supported by GTK+2, JAVA/Swing, Mozilla, and StarOffice/OpenOffice. For our product, AT-SPI will act as the equivalent of the UIA core.
 ATK---Accessibility toolkit. A developer toolkit that allows programmers to use common GNOME accessibility features in their applications.
 ATK/UIA Bridge---Mapping of ATK to the UIA provider APIs.
 UIA/at-spi Bridge---Mapping of AT-SPI to the UIA provider APIs.
 [WinForms]({{ site.github.url }}/old_site/WinForms "WinForms")---One of the many GUI Toolkits for use with Mono, working towards compatibility with Microsoft's System.Windows.Forms.
 [Moonlight]({{ site.github.url }}/old_site/Moonlight "Moonlight")---The Mono-based implementation of Silverlight.
 [Accerciser](http://live.gnome.org/Accerciser)---An interactive Python accessibility explorer for the GNOME desktop. It uses AT-SPI to inspect and control widgets, allowing you to check if an application is providing correct information to assistive technologies and automated test frameworks.
 [Orca](http://live.gnome.org/Orca)---Open source scriptable screen reader. Using various combinations of speech, braille, and magnification, Orca helps provide access to applications and toolkits that support the AT-SPI (e.g., the GNOME desktop).
 [IronPython](http://www.codeplex.com/Wiki/View.aspx?ProjectName=IronPython)---Implementation of the Python programming language, targeting .NET and Mono. It makes .NET libraries easily available to Python programmers, while maintaining full compatibility with the Python language.
 [CPython](http://www.python.org)---The default, most-widely used implementation of the Python programming language. It is written in C, hence the name CPython.
 [Strongwind](http://medsphere.org/projects/strongwind)---A GUI test automation framework inspired by dogtail. Strongwind is object-oriented and extensible. Strongwind is written in Python and uses the pyatspi library to manipulate and query the state of applications.

Test plan
---------

### Purpose

This document is a comprehensive test strategy to be used by testers to ensure proper and exhaustive testing. It also acts as a reference for all stakeholders wishing to obtain information on current and past testing efforts.

### Outline

#### Test plan identifier

The purpose of this section is to identify the current and previous versions of the test plan, its level, and the version of software it pertains to.

|ID|Level|Software Version|Modify Time|Author|
|:--|:----|:---------------|:----------|:-----|
|Accessibility-TP-V0.1|Draft|N/A|03-25-2008|Brian & Calen|
|Accessibility-TP-V1.0|Initial Release|N/A|03-25-2008|Brian & Calen|
||||||
||||||

#### Introduction

Testing efforts will be related to the project goals, which are:

-   Make mono [WinForms]({{ site.github.url }}/old_site/WinForms "WinForms") accessible. All WinForms currently supported by mono.
-   Make [Moonlight]({{ site.github.url }}/old_site/Moonlight "Moonlight") accessible
-   Allow [UI Automation]({{ site.github.url }}/old_site/UI_Automation "UI Automation") based Accessibility Technologies to run on Linux

This plan includes integration, system, and acceptance testing. Unit testing is excluded, as it is being managed by individual developers.

Integration testing to test WinForms accessibility via UIA provider and UIA/ATK bridge to AT-SPI is scheduled to be completed in 2008.
 System testing will be performed in 2009. Testing will be performed using an AT management tool to test the client and provider.
 Acceptance testing will be performed later in 2009 before the product is released. During system testing, the product should be tested in its entirety from the end user's point of view.

#### Test items

According to the project plan, test items is below:

Test Components:

|Test Items|Priority(S1/S2/S3)|Schedule|
|:---------|:-----------------|:-------|
|Winforms Providers|S1||
|Moonlight Providers|S1||
|Core-Provider|S1||
|Core-Client|S1||
|ATSPIBridge|S1||

#### Software risk issues

*This section describes any risks resulting from lack of time and/or resources.*

-   frequent changes to requirements and/or design.
-   loss of support from Novell/Microsoft upper management

Developers are also tracking problems they encounter:

-   [UIA/ATK Bridge Problems]({{ site.github.url }}/Accessibility:_UiaAtkBridge#Problems_found)

#### Features to be tested

*Abstraction of test items. What will be tested from the user or customer point of view.*

##### WinForms

We plan to test all Functionalities of WinForms controls those have been mentioned in [Provider\_Functional\_Specification](http://monouia.wik.is/Provider_Functional_Specification) and [Bridge\_Functional\_Specification]({{ site.github.url }}/Accessibility:_Bridge_Functional_Specification).

According to Q2 2008 of the [Accessibility\#Roadmap roadmap]({{ site.github.url }}/old_site/Accessibility#roadmap-roadmap "Accessibility"), testing contents need relate with below info:

-   The WinForms sheet in [WinForms Controls list]({{ site.github.url }}/Accessibility:_Test_Plan_WinForms_Controls) defines which WinForms controls will be implemented and therefore need to be tested.
-   Create WinForms application samples to test against. These application samples should be written in IronPython. Our sample applications can be found at [svn://anonsvn.mono-project.com/source/trunk/uia2atk](svn://anonsvn.mono-project.com/source/trunk/uia2atk) /test/samples. Some C\# samples (that can be translated) can be checked out via svn from [http://anonsvn.mono-project.com/viewvc/trunk/winforms](http://anonsvn.mono-project.com/viewvc/trunk/winforms).
-   Test WinForms applications samples using Accerciser to ensure that the samples are accessible.
-   Test WinForms applications samples using Orca to ensure that the samples are accessible.
-   Write automated scripts using Strongwind to verify accessibility of all WinForms controls.

Stuffs for WinForms test:

-   Define what WinForms controls will be tested
-   Define what WinForms application samples will be used
-   Create custom WinForms applications in IronPython
-   Test WinForms application samples with Accerciser to ensure accessibility
-   Test WinForms application samples with Orca to ensure accessibility
-   Create automated test suite in Python with StrongWind framework to ensure accessibility of all WinForms controls
-   Review automated test suites with each other by using [Review\_Board](http://reviews.mono-a11y.org/), Please read [UsersGuide](http://www.review-board.org/docs/manual/dev/users/#usersguide) before you use it.

##### Moonlight

According to [Silverlight doc](http://msdn.microsoft.com/en-us/library/cc645072%28VS.95%29.aspx) that we have 32 Moonlight controls will be implemented, so we should test 32 controls whether they are accessible. (there might be some differences between silverlight and moonlight, it's not sure yet)

-   The Moonlight sheet in [Moonlight Controls List](http://spreadsheets.google.com/ccc?key=0AkMHBvpvUyGOcHd5ZHk3UzNYUFRCVFJTOW5fb0JqSkE&hl=EN) defines what Moonlight controls should be tested.
-   Moonlight test sample will be written in C\# and xaml
-   Moonlight test script will be written in Python with Strongwind framework

Testing for Moonlight test:

-   Define what Moonlight elements will be tested
-   Define what Moonlight application samples will be used
-   Create or reuse Moonlight applications
-   Test Moonlight application samples with Accerciser(against Firefox web browser?)
-   Create automated test suite to ensure the accessibility of all Moonlight elements
-   Test Moonlight application samples with Orca

##### UIA Provider

-   Define what functional should be test for each control according to [Provider\_Functional\_Specification](http://monouia.wik.is/Provider_Functional_Specification)
-   Test each controls to ensure provider interface is implemented

##### UIA/ATK Bridge

-   Define what functional should be test for each control according to [Bridge\_Functional\_Specification]({{ site.github.url }}/Accessibility:_Bridge_Functional_Specification)
-   Test each controls to ensure ATK interface is showing correct information

##### UIA/AT-SPI Bridge

-   Test each controls to ensure AT-SPI is showing correct information

##### UIA Client API

UIA verify is an open source test tool like UISpy running on Windows, developer can use it to watch controls properties and patterns, it will be posted running on Linux, so we will need to make sure the behavior of UIA verify on Linux is match to Windows.

White is a thin wrapper of UIAutomationClient that is like Strongwind wrap pyatspi, developer will post it running on Linux, so we will use White framework to write tests for Client API to against Winforms, Moonlight, Gtk+ applications. The work path of using White to test application is: C\# -\> White -\> UIAutomationClient -\> DBus -\> UIA -\> applications(Winforms/Moonlight/GTK+)

Testing for UIAutomation Client API test:

-Winforms

-   Design UserCases of the real application(We will use KeePass), analyze the coverage of each ControlPattern's properties and methods
-   Write tests using White in C\# for the real application
-   Run the tests on Linux to make sure they do the same behavior as on Windows

-Moonlight

-   Design UserCases of the real application, analyze the coverage of each ControlPattern's properties and methods
-   Write tests using White in C\# for Moonlight apps on Windows
-   Run the tests on Linux to make sure they do the same behavior as on Windows
-   Test UIA verify on Linux to make sure the behavior is match with on Windows. UIA verify have provided automation tests, we can run all the applications on Linux and Windows, then to verify we get the same result of how many tests pass or fail

-GTK+

-   Design UserCases of the real application(gedit?), analyze the coverage of each ControlPattern's properties and methods
-   Write tests using White for GTK+ apps
-   Run the tests on Linux to make sure Client API is worked for GTK+ app

#### Features not to be tested

*Any features that will not be tested and why. Decisions not to test a feature should be based on priority and risk. If a feature will not be tested, define what features (class, methods, properties) will not be tested.*

At this time we plan to test all features exhaustively.

#### Approach

*A description of how and where testing will be performed and explain any issues that have a major impact on the success of testing and ultimately on the project.*

##### WinForms Testing

The accessibility of WinForms applications will be tested using Strongwind tests and WinForms sample applications. A test harness has also been developed to facilitate the execution and logging of a suite of tests. For more information see the [WinForms portion]({{ site.github.url }}/old_site/Accessibility:_Testing_Howto#winforms "Accessibility: Testing Howto") of the [Testing Howto]({{ site.github.url }}/old_site/Accessibility:_Testing_Howto "Accessibility: Testing Howto").

##### Moonlight Testing

The accessibility of Moonlight applications will be tested using Strongwind tests and Moonlight sample applications. Moonlight application will be writted in C\#. For more information see the [Moonlight portion]({{ site.github.url }}/old_site/Accessibility:_Testing_Howto#moonlight "Accessibility: Testing Howto") of the [Testing Howto]({{ site.github.url }}/old_site/Accessibility:_Testing_Howto "Accessibility: Testing Howto").

##### UIAutomation Client API Testing

WinForms, Moonlight and Gtk+ applications will be tested using White framework. For more information of how to create White test please see [ClientAPI portion]({{ site.github.url }}/old_site/Accessibility:_Testing_Howto#clientapi "Accessibility: Testing Howto") of the [Testing Howto]({{ site.github.url }}/old_site/Accessibility:_Testing_Howto "Accessibility: Testing Howto").

##### General Guidelines

-   All testers shall be on the team IRC channel (\#mono-a11y on irc.gimp.org) during work hours.
-   Tests shall be automated whenever possible. Time constraint is not a good excuse not to automate.
-   Test plan will be developed using the IEEE Std. 829-1998 Standard for Software Test Documentation.
-   All bugs shall be logged in [Bugzilla](https://bugzilla.novell.com) at the time they are found.
-   Bugzilla can be accessed from [http://bugzilla.novell.com](http://bugzilla.novell.com) with Novell account. The product category is "UI Automation," which can be found under the Mono classification.
-   When a bug's status is changed to RESOlVED or VERIFIED in Bugzilla, the reporter of the bug should change the bug's status to CLOSED or reopen the bug as soon as possible. If the person who reported the bug verifies the bug, the bug can be closed without having its status changed to VERIFIED. A bug should not be closed by someone who did not report the bug unless the reporter is unavailable.
-   Types of system testing include function, performance, security, load, reliability, usability, documentation testing.
-   Acceptance criteria for patch acceptance: Before a patch is accepted, a QA engineer must ensure that the patch submitted from developer passes QA testing. A build engineer must ensure the patch builds properly and meets packaging standards. QA and build engineers will then create a patch acceptance report, and the patch can be included in the product.
-   Testers may perform system testing on the product only after development has verified that they have completed a development milestone and the build team has created a stable release.
-   WinForms samples will be created in C\#, Boo, or IronPython(here we chose IronPython). Automation scripts, that test the accessibility of the WinForms apps will be created in CPython. [Strongwind]({{ site.github.url }}/old_site/Accessibility:_Testing_Howto#strongwind "Accessibility: Testing Howto") and [Orca Regression Tests]({{ site.github.url }}/old_site/Accessibility:_Testing_Howto#orca "Accessibility: Testing Howto") will be used for the automation scripts.
-   No regularly scheduled meetings at this time
-   Minor editing (grammar and spelling corrections) of this test plan can be done at any time. Any change to the test plan that changes how the product will be tested shall be approved by the QA team who will determine if the changes are large enough to require a change to the test plan identifier.
-   Black box and white box testing methods are both acceptable. However, it is anticipated that black box testing will be the norm.
-   Integration testing will involve the iterative testing of new developer code as it becomes available and it is integrated into the product. System testing will begin after provider and client pieces has been implemented and released.
-   Smoke tests will be performed and will consist of (1) ensuring that the newest packages provided by the build team install successfully and (2) ensuring basic functionality and sanity of the newest packages.
-   Exit criteria has yet to be established. This should be discussed with project management.
-   At this time, Orca and Accerciser are the standard tools to be used to test the accessibility of an application. The Orca test harness and Strongwind will be used to automate accessibility tests.
-   Run sample with UISpy in Windows system as reference to ensure we implement the similar accessibility.
-   Run Gtk sample with Accerciser in Linux system as reference to ensure we implemnet the similar accessibility.
-   Log bug into bugzilla, add bug reference like "\#BUGxxxx: xxxxxxxx" into automated test suite and comment out the test case if test case is failing. Delete bug reference and uncomment test case till bug is closed.

#### Item pass/fail criteria

The pass/fail criteria for each of the items described in Test Items section.

Criteria for Test Components:

|Test Items|Pass|Fail|
|:---------|:---|:---|
|Winforms Providers| ?||
|Moonlight Providers| ?||
|Core-Provider| ?||
|Core-Client| ?||
|ATKBridge| ?||
|ATSPIBridge| ?||

Individual test case pass/fail criterion is defined by the automated script which performs the testing. Upon failure of a test case, the script should will log the failure. For exit criteria, see [Approach]({{ site.github.url }}/old_site/Accessibility:_Test_Plan#approach "Accessibility: Test Plan").

#### Suspension criteria and resumption requirements

Suspension criteria:

-   Unavailability of external dependency during execution.
-   When a defect is introduced that cannot allow any further testing (i.e., a blocker bug).
-   Critical path deadline is missed so that the client will not accept delivery even if all testing is completed.
-   A specific holiday shuts down both development and testing.
-   Lack of testing resources (e.g., testers, hardware, etc).

Resumption requirements:

-   When the external dependent systems become available again.
-   When a fix is successfully implemented and the testing team is notified to continue testing.
-   The contract is renegotiated with the client to extend delivery.
-   The holiday period ends.
-   Testing resources become available

A failed build would not constitute suspension as we could generally continue to use the previous build. Major or critical defects would also not constitute suspension as other areas of the system could continue to be tested.

#### Test deliverables

*All documents, tools, and other components that are to be developed and maintained in support of the testing effort*

-   Test plan (this document)
-   Test cases - test cases are been included into test scripts
-   Custom tools - test harness, test scripts, sample applications
-   Defect reports - none at this time
-   Test summary reports - dashboard web page
-   Other - none at this time

#### Testing preparation and setup

*set of tasks necessary to prepare for and perform testing*

Team Setup:

|Task|Finished|
|:---|:-------|
|Build UIAutomation project on Bugzilla and Testopia.|X|
|Prepare virtual machines for most recent releases of supported platforms (openSUSE, Ubuntu, Fedora)|X|
|Setup test environment on VMs|X|
|Obtain testable build|X|
|Build DashBoard for Test Summary Report|P|

X = Done P = In Progress

Individual Preparation:

-   Enable assistive technologies on the GNOME desktop. This is done from "Assistive Technology Preferences" from the GNOME Control Center.
-   Create Novell Bugzilla account
-   Install Accerciser on OS
-   Install most recent Mono
-   Install most recent Orca
-   Install most recent Strongwind
-   Install Python \>=2.5
-   Install Iron Python (IPCE) \>=1.1
-   Setup Windows os(Vista) with UISpy on VM if necessary

#### Environmental needs

*Hardware, software, data, interfaces, facilities, publications, other requirements that pertain to the testing effort*

Testing may be done on physical and virtual machines.

All tests must be performed on the most recent official release of the following platforms:

|Product|openSUSE 11.1|openSUSE 11.2|SLED 11|Fedora 12|Ubuntu 9.10 Karmic Koala|openSUSE 11.3|Fedora 13|
|:------|:------------|:------------|:------|:--------|:-----------------------|:------------|:--------|
|Moonlight ATK Bridge||x||x|x|||
|Winforms ATK Bridge|x|x|x|x|x|||
|Client API project|x|x|x|x|x|||

\</br\>

||x86|x86\_64|
|:--|:--|:------|
|openSUSE|X|X|
|SLED|X|X|
|Fedora|X|X|
|Ubuntu|X|X|

Hardware:

-   No specific hardware requirements at this time

Software:

-   Mono - most recent release
-   Accerciser - most recent package for your platform
-   Orca - most recent package for your platform
-   Python \>=2.5
-   IronPython (IPCE) - most recent package for your platform
-   Strongwind - most recent release

#### Responsibilities

-   All testers can work wherever they are needed, however, below is where our team focuses their efforts at this time:

##### Test Suit

Test Harness: Brian
 DashBoard: Brian, Neville

##### WinForms

Strongwind Tests: Brian, Calen, Ray
 Orca Tests: Brian
 Smoke Tests: Brian
 Sample Applications: Calen, Ray

##### MoonLight

Sample Applications: Calen, Neville
 Strongwind Tests:: Calen, Neville

##### UIAutomation Client API

White Tests: Ray, Felicia

#### Staffing and training needs

-   QA Automation Engineer (4)
    -   Solid programming experience (C\#, Python are a bonus)
    -   QA Engineer experience
    -   Bugzilla experience is a bonus
    -   Iterative testing experience is a bonus

##### Training Plan

|Time|Contents|Author|
|:---|:-------|:-----|
|Oct 19|C\# Introduction|Matt|
|Oct 23|C\# Introduction|Matt|
|Oct 30|C\# Introduction|Matt|

Everyone in the open source community is encouraged to join our QA team!

#### Schedule

*Built around the [roadmap]({{ site.github.url }}/old_site/Accessibility:_Roadmap "Accessibility: Roadmap") but specific to testing with testing milestones*

##### WinForms

Based on Q2 in roadmap, our initial testing schedule is below:

|Task|Start Time|End Time|Owner|
|:---|:---------|:-------|:----|
|Design test plan|Mar.|Apr.|Brian & Calen|
|Prepare test environmental stuff(OS, VM, App samples)|Mar.||Brian & Calen|
|Set up test environment|Apr.|May.|Brian & Calen|
|Design test case and test samples|Apr.|Jun.|Brian & Calen & Ray|
|Automate smoke tests|Sep. 10 2008|Sep. 12 2008|Brian|
|Design Strongwind test, Run testcase and submit defect (release 0.9)|July|Nov|Calen & Brian|
|Design Strongwind test, Run testcase and submit defect (release 1.0 BETA)|Dec|Jan|Calen & Brian & Ray|
|Design Strongwind test, Run testcase and submit defect (release 1.0 FINAL)|Jan|March 16 2009|Calen & Brian & Ray|
|Review Strongwind test, expand test cases|April|Jun|Brian & Author|
|Build DashBoard|May|Jun|Brian & Neville|
|Finish test report|||Brian & Calen|

##### MoonLight

|Task|Start Time|End Time|Owner|
|:---|:---------|:-------|:----|
|Design test plan|Aug. 6|Aug. 7|Calen & Neville|
|create application samples|Aug. 10|Aug. 31|Calen & Neville|
|Write and Review Strongwind tests for each control(5 weeks)|Sep. 1|Oct. 16(10.1-10.11 are national holiday)|Calen & Neville|
|Run tests and log bugs(3 weeks)|Oct. 19|Nov. 6|Calen & Neville|
|test one or two Real Moonlight app(1 week)|Nov. 9|Nov. 13|Calen & Neville|
|test report(add moonlight test to dashbard)(1 week)|Nov. 9|Nov. 13|Calen & Neville|

##### Client API

|Task|Start Time|End Time|Owner|
|:---|:---------|:-------|:----|
|Design test plan|Aug. 6|Aug. 14|Calen & Ray|
|Study how to use White to write tests|Aug. 6|Aug. 14|Ray & Felicia|
|Study C\# and UIA ClientAPI(4 weeks)|Aug. 17|Sep. 11|Ray & Felicia|
|Create UIA ClientAPI UserCases and Tests for WinForms real app(KeePass)|Sep. 14|Oct. 30(10.1-10.11 are national holiday)|Ray & Felicia|
|Run UIA ClientAPI tests and log bugs for Winforms(KeePass)|Nov. 2|Nov. 9|Ray & Felicia|
|Create UIA ClientAPI UserCases and Tests for Moonlight real apps|||Neville & Calen|
|Run UIA ClientAPI tests and log bugs for Moonlight real apps|||Neville & Calen|
|Create UIA ClientAPI UserCases and tests for GTK+ real app(Tomboy, Tasque?)|||Felicia|
|Run UIA ClientAPI tests and log bugs for GTK+ real app(Tomboy, Tasque?)|||Ray & Felicia|
|Finish test report|||Calen & Neville & Ray & Felicia|

#### Risks and contingencies

*Any activity that jeopardizes the testing schedule is a planning risk*

-   Program release schedule delay will jeopardizes testing schedule
-   Program quality of release version couldn't satisfy with acceptance criteria
-   Test environmental stuff unobtainable easily
-   Delays in necessary QA training (e.g., understanding what needs to be tested, writing sample applications, test tools, and automation scripts)
-   Tester staff change or lack of tester resources
-   Changes to the original requirements or Designs
-   Frequent program design changes
-   Loss of support from Novell/Microsoft upper management

#### Approvals

*Persons who declare that the software is ready to move to the next stage*

Brian Merrell
 Calen Chen
 Brad Taylor


