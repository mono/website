---
layout: obsolete
title: "Moonlight2Hacking"
lastmodified: '2009-04-17'
permalink: /old_site/Moonlight2Hacking/
redirect_from:
  - /Moonlight2Hacking/
---

Moonlight2Hacking
=================

For the Moonlight 2.0 hacking, some projects

Developers should install Silverlight 2.0 Beta 2 and its SDK to create samples and test against their implementation.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#sample-programs">1 Sample Programs</a></li>
<li><a href="#project-integrate-silverlight-20">2 Project: Integrate Silverlight 2.0</a></li>
<li><a href="#dependendencyproperty-implementation">3 DependendencyProperty implementation</a></li>
<li><a href="#layout-management">4 Layout Management</a></li>
<li><a href="#general-api-completion">5 General API completion</a></li>
<li><a href="#implementing-input-events">6 Implementing Input Events</a></li>
<li><a href="#new-c-based-widgetry">7 New C++-based widgetry</a></li>
<li><a href="#security">8 Security</a></li>
</ul></td>
</tr>
</tbody>
</table>

Sample Programs
===============

We need a couple of sample programs, we should host those in sldemos (svn+ssh://miguel@mono-cvs.ximian.com/extras/trunk/sldemos).

Need a victim to volunteer to write some trivial apps, we should also check-in binaries as we do not have a full development pipeline for 2.0.

Project: Integrate Silverlight 2.0
==================================

Integrate the source code of the MS-PLed Silverlight 2.0 Beta1 controls into our build system.

We want to keep it in a parallel directory to class, so class/System.Windows contains our code, and class/Microsoft.SilverlightControls contains their controls and we reference in the sources file the ../Microsoft.SiverlightControls/XXXX.

Important: We should probably build the SL controls \*first\* with Beta2 to ensure that we do not end up implementing features that were removed or dropped.

DependendencyProperty implementation
====================================

We need to implement the mechanism for managed code to be able to register their own dependency properties, and to notify the managed code of changes.

Most of the notification stuff should be compatible, as the C++ code already mimics the WPF property notification.

Layout Management
=================

We need to implement the entire Layout management pipeline (SizeRequest/SizeAllocate kind of setup, like Gtk+).

General API completion
======================

Install the \`mono-tools' module, and then run the \`gui-compare' tool to get a listing of our API vs the published API.

Implement code to get the samples running.

Implementing Input Events
=========================

Must implement also the concept of Focus Element/Focusing.

New C++-based widgetry
======================

Grid widget, Text editor (its very simple, limited, only one font, no inlines/runs)

Security
========

The current state of all the Moonlight 2 security work is available at [Security Status]({{ site.github.url }}/old_site/Moonlight/SecurityStatus "Moonlight/SecurityStatus")

