---
layout: obsolete
title: "MonkeyBuilder"
lastmodified: '2010-04-07'
permalink: /archived/MonkeyBuilder/
redirect_from:
  - /MonkeyBuilder/
---

MonkeyBuilder
=============

MonkeyBuilder is an experimental way to build the Mono runtime and class libraries on Windows without cygwin or makefiles.

Requirements:

-   [MonkeyBuilder binary pack](http://jpobst.com/temp/MonkeyBuilder.zip)
-   [.Net Framework 3.5 SP1](http://www.microsoft.com/downloads/details.aspx?FamilyID=AB99342F-5D1A-413D-8319-81DA479AB0D7&displaylang=en)
-   [Visual C++ 2008 Express](http://www.microsoft.com/express/download/#webInstall) (or Visual Studio 2008 with Visual C++ installed)
-   [Mono 2.6](http://www.go-mono.com/mono-downloads/download.html)

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#step-1-set-up-environment">1 Step 1: Set up Environment</a></li>
<li><a href="#step-2-edit-the-configuration-file">2 Step 2: Edit the Configuration File</a></li>
<li><a href="#step-3-build">3 Step 3: Build</a></li>
<li><a href="#step-4-finished">4 Step 4: Finished</a></li>
</ul></td>
</tr>
</tbody>
</table>

Step 1: Set up Environment
--------------------------

-   Create an empty folder, like C:\\monobuild. (Currently, the path cannot contain spaces.)
-   Unzip the MonkeyBuilder binary pack to this location.
-   Check out a copy of /trunk/mono to this location.
-   Check out a copy of /trunk/mcs to this location.

Your finished directory should look like this:

[http://mono-project.com/files/4/48/Filelist.png]({{ site.github.url }}/files/4/48/Filelist.png)

Step 2: Edit the Configuration File
-----------------------------------

Open the MonkeyBuilder.exe.config file and adjust the "installedmono" setting to point to your Mono installation.

Step 3: Build
-------------

-   Run MonkeyBuilder.exe by double-clicking it or running it from the command line.

Step 4: Finished
----------------

-   You should now have a new folder "build" that contains the Mono runtime and the compiled class libraries.

Currently this is experimental. Future releases will allow for more flexibility and fix limitations.

Code for MonkeyBuilder.exe can be found [here](http://anonsvn.mono-project.com/viewvc/trunk/wintools/MonkeyBuilder/).

