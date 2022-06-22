---
title: "ReleaseNotes MonoVS"
lastmodified: '2009-10-21'
redirect_from:
  - /ReleaseNotes_MonoVS/
---

ReleaseNotes MonoVS
===================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#mono-tools-for-visual-studio-release-notes">1 Mono Tools for Visual Studio Release Notes</a>
<ul>
<li><a href="#beta-5-074221">1.1 Beta 5 (0.7.4221)</a></li>
<li><a href="#beta-4-064168">1.2 Beta 4 (0.6.4168)</a></li>
<li><a href="#beta-3-054128">1.3 Beta 3 (0.5.4128)</a></li>
<li><a href="#beta-2-044034">1.4 Beta 2 (0.4.4034)</a></li>
<li><a href="#beta-1-033771">1.5 Beta 1 (0.3.3771)</a></li>
<li><a href="#releasenext">1.6 Release.Next</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Mono Tools for Visual Studio Release Notes
==========================================

Beta 5 (0.7.4221)
-----------------

*Expires: Dec 10, 2009*

**Enhancements:**

-   Added support for building packages to run on the Novell Mono Extension.

**Fixes:**

-   500173 - monovs-server needs to catch and handle SIGINT for proper shutdown during \^C
-   547323 - Change message when copying files to remote host
-   545858 - RPMs build using monovs on SLES w/Mono-X do not pick up mono-addon RPMs as dependencies.

Beta 4 (0.6.4168)
-----------------

*Expires: Nov 15, 2009*

**Fixes:**

-   544832 - Don't auto populate "Virtual Path" in Create Linux Package's General Tab
-   544830 - When done building an RPM, open up an explorer window to the location it was saved to
-   545382 - Exception running MoMA
-   545174 - Cannot scan mojoportal

**Enhancements:**

-   VM switched from SLED to openSUSE.

Beta 3 (0.5.4128)
-----------------

*Expires: Nov 15, 2009*

**Fixes:**

-   541209 - Please add a Setting in monovs-gui-server.exe.config to disable directory deletion
-   513339 - Need to open Linux firewall
-   541207 - Ship a default monovs-gui-server.exe.config to make it easier on the end users to edit
-   543284 - Please add MS-RL as one of the licences in Create Linux Package...
-   543594 - When trying to 'Run Remotely' MonoVS reports no Startup Project even when one is set
-   Prevent crash when trying to run locally with .netmodules.
-   Don't error if the icon in the packaging file does not exist.

**Enhancements:**

-   Attempt to prepopulate some of the packaging fields with default data.

Beta 2 (0.4.4034)
-----------------

*Expires: Oct 31, 2009*

**Fixes:**

-   536820 - Having a Setup project in your solution causes MonoVS functions to fail.
-   540409 - MonoVS crashes when Mono debugger is invoked during native VS debug
-   Show error dialog instead of crashing if a C++ project is the startup project.
-   Don't crash if Ssdp (server browsing) fails to initialize.

**Enhancements:**

-   Improved GUI for SUSE Studio.
-   Create a menu item for adding a packaging file to a project.
-   Store the last 5 packages created for easy access in the Studio GUI.
-   Don't autoclose console window when running app locally (configurable in Tools-\>Options).

Beta 1 (0.3.3771)
-----------------

*Expires: Oct 31, 2009*

Initial Release

Release.Next
------------

(Things fixed in SVN that will be in the next beta release.)
