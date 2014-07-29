---
layout: obsolete
title: "Windows MSI"
lastmodified: '2009-10-01'
permalink: /archived/Windows_MSI/
redirect_from:
  - /Windows_MSI/
---

Windows MSI
===========

**NOTE: I make lots of assumptions about things I do not fully understand (C stuff). Please help me figure out what we need and what we don't need.  :) - jpobst**

One of my goals for Mono 2.8 is to have a completely new .msi (the Windows standard) based installer for Windows.

Currently, our Windows installer is not .msi, and is bloated with all kinds of things that don't really make sense to ship on Windows.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#proposed-changes">1 Proposed Changes</a>
<ul>
<li><a href="#use-msvc-instead-of-gcc-to-compile-native-code">1.1 Use MSVC instead of gcc to compile native code</a></li>
<li><a href="#use-eglib-instead-of-glib">1.2 Use eglib instead of glib</a></li>
<li><a href="#do-not-ship-the-10-profile">1.3 Do not ship the 1.0 profile</a></li>
<li><a href="#do-not-ship-gtk">1.4 Do not ship Gtk#</a></li>
<li><a href="#strip-out-things-that-not-many-people-use">1.5 Strip out things that not many people use</a></li>
<li><a href="#what-gnu-ish-stuff-do-we-still-need-to-include">1.6 What GNU-ish(?) stuff do we still need to include?</a></li>
<li><a href="#conclusion">1.7 Conclusion</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Proposed Changes
----------------

### Use MSVC instead of gcc to compile native code

This will require vcproj files for all the native libraries/executables. This will also require redistributing the C runtimes from MS. We can either require admin privileges and install them into the machine side-by-side cache, or install them privately to mono.

[http://msdn.microsoft.com/en-us/library/ms235291(VS.80).aspx](http://msdn.microsoft.com/en-us/library/ms235291(VS.80).aspx)

### Use eglib instead of glib

This is the first step to not requiring cygwin. Also, the code produced by VC++ is likely better tuned for running on Windows.

### Do not ship the 1.0 profile

This is simply a Mono 2.8 change. The 1.0/1.1 profile is no longer supported/shipped after Mono 2.6.

### Do not ship Gtk\#

We should modify our "Gtk\# installer for .Net" to also install to the Mono GAC instead of shipping a second copy with Mono.

Note: There needs to be some work done with regards to ensuring Gtk\# picks up our version of Gtk+ instead of the one installed with Pidgin, Inkscape, Miro, etc. Currently, the first one in PATH is used.

### Strip out things that not many people use

||
|IKVM|Available [here](http://www.ikvm.net/)|
|Boo|Available [here](http://boo.codehaus.org/)|
|NUnit|Available [here](http://www.nunit.org/index.php)|
|IPCE|Available [here](http://www.codeplex.com/IronPython)|
|NAnt|Available [here](http://nant.sourceforge.net/)|
|embedding stuff|I'm not sure what is embedding stuff, and what is just leftovers from the build process. I am thinking stuff like .h, .def, .lib, .a, .la, etc..|
|class library documentation|I don't think monodoc has ever worked on Windows? Developers can use the online documentation. Note that MD for Windows also ships with this documentation for use in MD.|

### What GNU-ish(?) stuff do we still need to include?

I don't know a lot about this, but I guess we need either eglib or custom versions of:

-   pkg-config
-   gettext?

### Conclusion

With these changes, I think we can get a learner, meaner installer that is .msi-based. My current estimation is we can get the installer under 30 MB. Currently, it is 75-80 MB.

