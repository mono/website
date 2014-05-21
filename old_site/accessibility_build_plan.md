---
layout: obsolete
title: "Accessibility: Build Plan"
lastmodified: '2010-05-06'
permalink: /old_site/Accessibility:_Build_Plan/
redirect_from:
  - /Accessibility:_Build_Plan/
---

Accessibility: Build Plan
=========================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#scope">1 Scope</a></li>
<li><a href="#build-team">2 Build Team</a></li>
<li><a href="#build-meetings">3 Build Meetings</a></li>
<li><a href="#outline">4 Outline</a>
<ul>
<li><a href="#deliverables">4.1 Deliverables</a>
<ul>
<li><a href="#intervals">4.1.1 Intervals</a></li>
<li><a href="#software">4.1.2 Software</a></li>
</ul></li>
<li><a href="#other-packages">4.2 Other Packages</a>
<ul>
<li><a href="#possible-packages">4.2.1 Possible Packages</a></li>
</ul></li>
<li><a href="#packages-dependencies">4.3 Packages Dependencies</a></li>
<li><a href="#current-build-systems">4.4 Current Build Systems</a></li>
<li><a href="#build-distributions">4.5 Build Distributions</a></li>
<li><a href="#build-architectures">4.6 Build Architectures</a></li>
<li><a href="#build-risk-issues">4.7 Build risk issues</a></li>
<li><a href="#general-guidelines">4.8 General Guidelines</a></li>
<li><a href="#suspension-criteria-and-resumption-requirements">4.9 Suspension criteria and Resumption requirements</a></li>
<li><a href="#build-preparation-and-setup">4.10 Build preparation and setup</a></li>
<li><a href="#environmental-needs">4.11 Environmental needs</a>
<ul>
<li><a href="#hardware">4.11.1 Hardware:</a>
<ul>
<li><a href="#build0">4.11.1.1 Build0</a></li>
<li><a href="#build1">4.11.1.2 Build1</a></li>
</ul></li>
<li><a href="#architectures">4.11.2 Architectures</a></li>
<li><a href="#software_2">4.11.3 Software:</a></li>
</ul></li>
<li><a href="#responsibilities">4.12 Responsibilities</a></li>
<li><a href="#staffing-needs">4.13 Staffing needs</a></li>
<li><a href="#schedule">4.14 Schedule</a></li>
<li><a href="#ongoing-tasks">4.15 Ongoing tasks</a></li>
<li><a href="#risks-and-contingencies">4.16 Risks and contingencies</a></li>
</ul></li>
<li><a href="#references">5 References</a>
<ul>
<li><a href="#build-systems">5.1 Build Systems</a></li>
</ul></li>
<li><a href="#build-plan-identifier">6 Build plan identifier</a></li>
</ul></td>
</tr>
</tbody>
</table>

Scope
-----

A build plan for the Accessibility team's efforts in bringing accessibility to mono by implementing the managed UI Automation framework.

Build Team
----------

Stephen Shaw (aka decriptor)
 Ray Wang (aka Ray)

[Full A11y team]({{site.github.url}}/old_site/Accessibility:_Team "Accessibility: Team")

Build Meetings
--------------

As needed on irc

Where: \#mono-a11y on irc.gimp.org

Outline
-------

#### Deliverables

##### Intervals

-   svn builds (internal Novell site, mostly for sanity checks)
-   [nightly](https://build.opensuse.org/project/show?project=Mono:UIA:Bleeding)
-   [release builds](https://build.opensuse.org/project/show?project=Mono:UIA) (target: Mono 2.6)

-   Maybe disk images with everything pre-installed?

##### Software

Packages from our codebase:

mono-uia

-   UIAUtomationBridge.dll
-   UIAutomationClient.dll
-   UIAutomationProvider.dll
-   UIAutomationSource.dll
-   UIAutomationTypes.dll

uiaatkbridge

-   UiaAtkBridge.dll
-   libbridge-glue.so

uiautomationwinforms

-   UIAutomationWinforms.dll

uiadbus

-   UiaDbus.dll
-   UiaDbusBridge.dll
-   UiaDbusSource.dll

atspiuiasource

-   AtspiUiaSource.dll

Moonlight UIA

-   novell-moonlight-a11y.xpi

Note: This might change as this is still being developed.

FAQ:

-   Why not include UIAtomoationWinForms.dll in mono-uia.rpm? This layout would allow one user to install moonlight accessibility but not Windows.Forms accessibility (by installing uiaautomationmoonlight but not uiaautomationwinforms).
-   Why not include UiaAtkBridge.dll in mono-uia.rpm? This layout would allow one user to install UIA without bridging to ATK technology (that is, using UIA Clients to inspect UIA Servers).

#### Other Packages

at-spi-sharp

-   at-spi-sharp.dll

##### Possible Packages

-   iron python

#### Packages Dependencies

-   libgdiplus-2.4
-   mono-core-2.4
-   mono-winforms
-   mono-winfxcore (part of mono as of 2.6)
-   gtksharp-2.12
    -   gtksharp-2.12.7 for 0.9.1
    -   gtksharp-2.12.8 for 1.0.0
-   at-spi2-core
-   at-spi2-atk

#### Current Build Systems

[Hudson](https://hudson.dev.java.net/)

-   UIAutomation
-   UiaAtkBridge
-   UIAutomationWinforms
-   mono/mcs
-   gtk-sharp2
-   moonlight
-   moonatkbridge
-   firefox
-   at-spi2
-   at-spi-sharp

 [OBS](http://build.opensuse.org)

       nightly builds
       currenty released
     

#### Build Distributions

Current

-   openSUSE 11.1
-   openSUSE 11.2
-   SLE 11
-   Fedora 12
-   Ubuntu 9.10

Future (definite)

-   openSUSE 11.3
-   Fedora 13
-   Ubuntu 10.4

Distros that have packaged it (or parts of it)

-   Debian
-   Mandriva

#### Build Architectures

Current

-   i586
-   x86\_64

#### Build risk issues

*This section describes any risks resulting from lack of time and/or resources.*

-   New deliverable files that aren't currently handled in the build file, ie. .spec
-   Code that compiles with errors
-   Missing dependencies

#### General Guidelines

-   All builders shall be on the team IRC channel (\#mono-a11y on irc.gimp.org) during work hours.
-   Builds shall be automated whenever possible. Time constraint is not a good excuse not to automate.

#### Suspension criteria and Resumption requirements

Suspension criteria:

-   Unavailability of external packages/dependencies
-   Source Code no longer compiles
-   A specific holiday shuts down both development and testing.
-   Build servers become unavailable

Resumption requirements:

-   Consider building those dependencies
-   Find out who was working on that code and contact them
-   The holiday period ends.
-   Building resources become available

#### Build preparation and setup

*set of tasks necessary to prepare for and perform a build*

Individual Preparation:

-   Have access to the build server
-   Correct packaging files (spec/deb)
-   Available jail for distro/arch
-   RPMs for latest dependencies

#### Environmental needs

*Hardware, software, data, interfaces, facilities, publications, other requirements that pertain to the testing effort*

Build Servers with root jails for each of the various architectures and distributions. This is largely taken care of by the build service and osc. osc creates jails on the fly.

##### Hardware:

Currently there are 2 build servers (build0 and build1) There are now several other machines

###### Build0

-   openSUSE 11.2 32 bit
-   hudson master
-   osc tools

###### Build1

-   openSUSE 11.2 64 bit
-   hudson slave
-   osc tools
-   location of per rev svn snapshot rpm

##### Architectures

-   i586
-   x86\_64

##### Software:

-   Hudson
-   OBS
-   osc
-   nunit

#### Responsibilities

||Coordinate Build|Maintain Hudson|Maintain OBS|Maintain Patches|Nightly Builds|Weekly Builds|Release Builds|
|:--|:---------------|:--------------|:-----------|:---------------|:-------------|:------------|:-------------|
|Stephen Shaw (Build Engineer)|X|X|-|X|X|-|X|
|Ray Wang (Build Engineer)|-|-|X|-|-|X|X|

#### Staffing needs

-   Build Engineers
    -   Programming experience with C\#, Python, and bash
    -   Build Engineer experience
    -   Autotools experience
    -   Build system experience
    -   Solid Linux experience in the command line (CLI)
    -   Writing rpm and/or deb build files experience

Anyone interested in learn/helping with build is welcome to join our team.

#### Schedule

*Built around the [roadmap]({{site.github.url}}/old_site/Accessibility:_Roadmap "Accessibility: Roadmap")*

Based on Q2 in roadmap, our initial testing schedule is below:

|Task|Start Time|End Time|Percent complete|Owner|Notes|
|:---|:---------|:-------|:---------------|:----|:----|
|Update/Maintain build page on A11y pages|July|||Stephen & Ray|Ongoing|
|Design build plan|July|July||Stephen & Ray|Stephen needs to inform Ray of this page :)|
|Build Initial RPMs and Make sure they work!|June|July||Stephen & Ray|done, moved to continuous builds|
|Install Build servers|June|July||Stephen||
|Set up build environments|July|July||Stephen & Ray|Build0 is the hudson master and Build1 is the slave|
|Get full build server access to Ray|July|July|100%|Stephen|Depends on servers being installed|
|First Release|Dec 2008||100%|Stephen & Ray|Provider|
|Next Release|2009||100%|Stephen & Ray|On hold until 0.9 is ready for release|
|Build 1.0|2009||100%|Stephen & Ray|On hold until 1.0 is ready for release|
|Post 1.0 work|2009||0%|Stephen & Ray|Anything that comes after 1.0|

#### Ongoing tasks

|Task|Owner|Notes|
|:---|:----|:----|
|Maintain Mono Accessibility wiki build pages|A11y build team|As new information or decisions come about|
|Adjust for patches and new packages|A11y build team|When other packages require them|
|...|A11y build team|...|

#### Risks and contingencies

*Any activity that jeopardizes the building schedule is a planning risk*

-   Any major changes in development (causing delays)

References
----------

The [Product roadmap]({{site.github.url}}/Accessibility:_Roadmap)
 The [Architecture overview]({{site.github.url}}/Accessibility#Architecture)
 [The Novell & Microsoft announcement](http://www.novell.com/news/press/microsoft-and-novell-celebrate-year-of-interoperability-expand-collaboration-agreement) to create cross-platform accessibility framework

### Build Systems

[http://www.mono-project.com/BuildSystem/MonoBuild]({{site.github.url}}/BuildSystem/MonoBuild) MonoBuild---The current mono build system. We have tied into this for the time being.
 [https://build.opensuse.org/](https://build.opensuse.org/) OBS---This is a really cool build system that can handle several different distributions and architectures

Build plan identifier
---------------------

Build Plan versions

|ID|Level|Software Version|Modify Time|Author|
|:--|:----|:---------------|:----------|:-----|
|Accessibility-BP-V0.1|Draft|N/A|07-03-2008|Decriptor|
|Accessibility-BP-V0.9|Draft|N/A|02-12-2009|Decriptor|
|Accessibility-BP-V1.0|Draft|N/A|01-06-2010|Decriptor|
|Accessibility-BP-V1.1|Draft|N/A|05-06-2010|Decriptor|



