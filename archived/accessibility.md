---
title: "Accessibility"
lastmodified: '2011-02-14'
redirect_from:
  - /Accessibility/
  - /A11y/
---

Accessibility
=============

The latest version of Mono Accessibility is 2.1, released on August 24, 2010. [Get more info about this release.](/Accessibility:_Release_Notes_2.1)

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#mono-accessibility">1 Mono Accessibility</a>
<ul>
<li><a href="#project-goals">1.1 Project Goals</a></li>
<li><a href="#how-do-i-get-it">1.2 How do I get it?</a></li>
<li><a href="#participating">1.3 Participating</a></li>
<li><a href="#development">1.4 Development</a>
<ul>
<li><a href="#high-level-overview">1.4.1 High Level Overview</a></li>
<li><a href="#functional-specifications">1.4.2 Functional Specifications</a></li>
</ul></li>
<li><a href="#for-team-members">1.5 For Team Members</a>
<ul>
<li><a href="#general">1.5.1 General</a></li>
<li><a href="#developers">1.5.2 Developers</a></li>
<li><a href="#quality-assurance">1.5.3 Quality Assurance</a></li>
<li><a href="#build">1.5.4 Build</a></li>
</ul></li>
<li><a href="#related-material">1.6 Related Material</a>
<ul>
<li><a href="#mono-winforms">1.6.1 Mono Winforms</a></li>
<li><a href="#other-organizations">1.6.2 Other Organizations</a>
<ul>
<li><a href="#linux-foundation">1.6.2.1 Linux Foundation</a></li>
<li><a href="#gnome">1.6.2.2 GNOME</a></li>
<li><a href="#others">1.6.2.3 Others</a></li>
</ul></li>
</ul></li>
<li><a href="#project-origins">1.7 Project Origins</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Mono Accessibility
==================

The Mono Accessibility project enables many Windows applications to be fully accessible on Linux.

Applications based upon System.Windows.Forms can take advantage of this with no extra code, and enjoy the same level of Accessibility provided by Windows on any system Mono supports.

This is accomplished through two efforts -- First, implement the managed [UI Automation](/UI_Automation) framework targeted towards Mono's [System.Windows.Forms](/WinForms) project and second, implement a [bridge](/Accessibility:_UiaAtkBridge) between our UI Automation implementation and [ATK](http://www.linuxfoundation.org/en/Accessibility/ATK), the dominant Accessibility technology on Linux.

Project Goals
-------------

-   Make [System.Windows.Forms](/docs/gui/winforms/) applications accessible via ATK
-   Make [Silverlight](http://silverlight.net/) applications (using [Moonlight](/Moonlight)) accessible via ATK
-   Allow [UI Automation](/UI_Automation) based Accessibility Technologies to read Linux applications built on at-spi

How do I get it?
----------------

Packages are provided for various Linux distributions, or you can [build from source](/Accessibility:_Installing_From_Source).

A summary of past releases are available on our [Releases](/Accessibility:_Releases) page.

Participating
-------------

The Mono Accessibility team is always looking for people to assist us writing code, documentation or finding and filing bugs. If you're interested, join our [mailing list](http://forge.novell.com/mailman/listinfo/mono-a11y), or hop in to our active IRC channel, [#mono-a11y](irc://irc.gimp.org/mono-a11y) at irc.gimp.org.

Development
-----------

### High Level Overview

-   [Architecture](/Accessibility:_Architecture) of UI Automation on Linux
-   [Project Roadmap](/Accessibility:_Roadmap) (High Level View)
-   [Development Schedule](/Accessibility:_Project_Schedule) (Detailed View)
-   [Phase II Work Breakdown](/Accessibility:_Phase_II_Work_Breakdown)
-   Members of the Novell [UIA Team](/Accessibility:_Team)

### Functional Specifications

-   [Provider](/Accessibility:_Provider_Functional_Specification)
-   [Bridge](/Accessibility:_Bridge_Functional_Specification)
-   [Notes](/Accessibility:_Specification_Notes) on the UI Automation specification
-   [Similarities and Differences](/Accessibility:_Similarities_and_Differences)

For Team Members
----------------

### General

-   [Development with Scrum](/Accessibility:_Scrum)
-   [Getting Started With Development](/Accessibility:_Getting_Started_With_Development)

### Developers

-   [Moonlight Main Page](/Accessibility:_Moonlight)
-   Provider: ([Architecture](/Accessibility:_Winforms_Implementation), [Implementation Notes](/Accessibility:_Implementation))

### Quality Assurance

-   [All Open UIAutomation Bugs](https://bugzilla.novell.com/buglist.cgi?query_format=advanced&short_desc_type=allwordssubstr&short_desc=&long_desc_type=fulltext&long_desc=&classification=Mono&product=UI+Automation&bug_file_loc_type=allwordssubstr&bug_file_loc=&status_whiteboard_type=allwordssubstr&status_whiteboard=&keywords_type=anywords&keywords=&deadlinefrom=&deadlineto=&bug_status=NEW&bug_status=ASSIGNED&bug_status=NEEDINFO&bug_status=REOPENED&emailassigned_to1=1&emailtype1=substring&email1=&emailassigned_to2=1&emailreporter2=1&emailqa_contact2=1&emailcc2=1&emailtype2=substring&email2=&bugidtype=include&bug_id=&votes=&chfieldfrom=&chfieldto=Now&chfieldvalue=&cmdtype=doit&order=Reuse+same+sort+as+last+time&field0-0-0=noop&type0-0-0=noop&value0-0-0=)
-   [Development Progress](/Accessibility:_Development_Progress) (Enhancement Bugs by Control)

-   [Product Test Plan](/Accessibility:_Test_Plan)
-   [Test Progress](/Accessibility:_Test_Plan_WinForms_Controls)
-   [Test Coding Standard](/Accessibility:_Test_Coding_Standard)
-   [Test Log](/Accessibility:_Test_Log)
-   [Test Summary](/Accessibility:_Test_Summary)
-   [Bug Specification](/Accessibility:_Bug_Specification)
-   [Testing Howto](/Accessibility:_Testing_Howto)
-   [Strongwind Basics Tutorial](/Accessibility:_Strongwind_Basics)

### Build

-   [Product Build Plan](/Accessibility:_Build_Plan)

Related Material
----------------

### Mono Winforms

-   [WinForms](https://github.com/mono/winforms) code in Mono's mcs project (ViewVC)
-   [UIAutomationWinforms](https://github.com/mono/uia2atk) project for winforms providers (ViewVC)

### Other Organizations

There is a lot of work being done in the area of accessibility and we encourage and participate in as much of that work as possible. The following is a list of organizations you should be aware of if you are interested in contributing to accessibility on Linux.

#### Linux Foundation

-   [Accessibility Working Group](http://www.linux-foundation.org/en/Accessibility)
    -   [Accessibility](https://lists.linux-foundation.org/mailman/listinfo/accessibility) mailing list server
    -   [#a11y](irc://irc.linux-foundation.org/a11y) on irc.linux-foundation.org
-   [ATK/AT-SPI](http://www.linux-foundation.org/en/Accessibility/ATK/AT-SPI) Special Interest Group
    -   [ATK/AT-SPI](https://lists.linux-foundation.org/mailman/listinfo/accessibility-atspi) mailing list server

#### GNOME

-   [GNOME Accessibility Project](http://live.gnome.org/GAP) with links to documentation etc.
-   [GNOME Accessibility-devel](http://mail.gnome.org/mailman/listinfo/gnome-accessibility-devel) list - Technical discussions and patches for at-spi, gail, and ATs
-   [GNOME Accessibility](http://mail.gnome.org/mailman/listinfo/gnome-accessibility-list) list - Accessibility development discussion
-   [#a11y](irc://irc.gimp.org/a11y) on irc.gimp.org
-   [Python Powered Accessibility](http://live.gnome.org/Accessibility/PythonPoweredAccessibility)
-   [GNOME Accessibility QA](http://developer.gnome.org/projects/gap/testing/index.html)
-   [GNOME Accessibility slide intro](http://developer.gnome.org/projects/gap/presentations/GUAD3C/keynote/start.html)

#### Others

-   [Accessibility Interoperability Alliance](http://accessinteropalliance.org) (AIA) - The body maintaining the UIA specification
-   [openSUSE Accessibility](http://en.opensuse.org/Accessibility)

Project Origins
---------------

On November 8, 2007 Novell [announced](http://www.novell.com/news/press/microsoft-and-novell-celebrate-year-of-interoperability-expand-collaboration-agreement) a collaborative effort with Microsoft to make this happen.

