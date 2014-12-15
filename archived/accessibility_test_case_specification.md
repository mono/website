---
title: "Accessibility: Test Case Specification"
lastmodified: '2008-11-12'
redirect_from:
  - /Accessibility:_Test_Case_Specification/
---

Accessibility: Test Case Specification
======================================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#currently-this-page-does-not-apply-we-are-currently-not-using-manual-testing-our-automation-scripts-are-our-test-cases-these-guidelines-should-be-followed-if-manual-test-cases-are-introduced-in-the-future">1 Currently this page does not apply. We are currently not using manual testing, our automation scripts are our test cases. These guidelines should be followed if manual test cases are introduced in the future</a>
<ul>
<li><a href="#references">1.1 References</a></li>
<li><a href="#test-case-specification">1.2 Test case specification</a>
<ul>
<li><a href="#purpose">1.2.1 Purpose</a></li>
<li><a href="#outline">1.2.2 Outline</a>
<ul>
<li><a href="#summary-description">1.2.2.1 Summary Description</a></li>
<li><a href="#test-case-specification-identifier">1.2.2.2 Test case specification identifier</a></li>
<li><a href="#test-items">1.2.2.3 Test items</a></li>
<li><a href="#input-specifications">1.2.2.4 Input specifications</a></li>
<li><a href="#output-specifications">1.2.2.5 Output specifications</a></li>
<li><a href="#environmental-needs">1.2.2.6 Environmental needs</a></li>
<li><a href="#special-procedural-requirements">1.2.2.7 Special procedural requirements</a></li>
<li><a href="#intercase-dependencies">1.2.2.8 Intercase dependencies</a></li>
<li><a href="#test-script">1.2.2.9 Test script</a></li>
<li><a href="#chose-component">1.2.2.10 Chose component</a></li>
</ul></li>
</ul></li>
<li><a href="#resources">1.3 Resources</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Currently this page does not apply. We are currently not using manual testing, our automation scripts are our test cases. These guidelines should be followed if manual test cases are introduced in the future
===============================================================================================================================================================================================================

References
----------

[Product Test Case Plan](/Accessibility:_Test_Plan)<br/>
 [Product Test Case Specification](/Accessibility:_Test_Case_Specification) (current page)<br/>
 [Product Test Log](/Accessibility:_Test_Log)<br/>
 [Product Test Summary](/Accessibility:_Test_Summary)<br/>
 [Product Bug Specification](/Accessibility:_Bug_Specification)<br/>
 [Product Home](/Accessibility)

Test case specification
-----------------------

All manual test cases must be stored on Testopia from [http://bugzilla.novell.com](http://bugzilla.novell.com). Individual test cases cannot be found on this page.

### Purpose

The outline below must be used for all manual test cases. When creating or modifying a test case, please ensure that all the fields below are present. Do not skip fields; if the field is not applicable please mark it not applicable.

### Outline

This specification is created base on Testopia content items.

#### Summary Description

*Abstract description of what is to be tested.* this should be provided in Testopia's "Summary" field.

#### Test case specification identifier

*Some way to uniquely identify a test case. Testopia provides this.*

#### Test items

*Items (e.g., requirement specs, design specs, code, etc.) required to run a particular test case. This should be provided in Testopia's "Notes" or "Attachment" feature.*

#### Input specifications

*Description of what is required (step-by-step) to execute the test case (e.g., input files, values that must be entered into a field, etc.). This should be provided in Testopia's "Action" field.*

#### Output specifications

*Description of what the system should look like after the test case is run. This should be provided in the Testopia's "Expected Results" field.*

#### Environmental needs

*Description of any special environmental needs. This includes system architectures, tools, records or files, interfaces, etc. System OS, architecture should be provided in Testopia's "Environment" field. Other environmental needs should be provided under "Notes" and files should be added to "Attachments"*

#### Special procedural requirements

*Description of any special procedures or special configurations necessary to set up and breakdown the test environment. This should be provided in Testopia's "Setup" and "Breakdown" fields*

#### Intercase dependencies

*Dependencies or relations with other test cases. This should be provided in Testopia's "Notes" field.*

#### Test script

*If test case include some test scripts, scripts should be added into Testopia's "Attachments" field and give abstract description.*

#### Chose component

*each test case should chose a component to rely on which component of project in Testopia's "Component" field.*

Resources
---------

[Linux Accessibility Testcases](http://developer.gnome.org/projects/gap/testing/IBM-testing-guide/)

