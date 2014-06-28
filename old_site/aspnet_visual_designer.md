---
layout: obsolete
title: "ASP.NET Visual Designer"
lastmodified: '2008-08-22'
permalink: /old_site/ASP.NET_Visual_Designer/
redirect_from:
  - /ASP.NET_Visual_Designer/
  - /AspNetEdit/
---

ASP.NET Visual Designer
=======================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#introduction">1 Introduction</a></li>
<li><a href="#features">2 Features</a></li>
<li><a href="#installation">3 Installation</a></li>
<li><a href="#plans">4 Plans</a></li>
<li><a href="#architecture">5 Architecture</a></li>
<li><a href="#license">6 License</a></li>
<li><a href="#credits">7 Credits</a>
<ul>
<li><a href="#sponsors">7.1 Sponsors</a></li>
<li><a href="#primary-developers">7.2 Primary developers</a></li>
<li><a href="#other-contributors">7.3 Other contributors</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Introduction
------------

The ASP.NET Visual Designer, codenamed AspNetEdit, is a visual design surface for ASP.NET, aiming to provide Mono users with a RAD web design tool on Linux. It allows users to manipulate ASP.NET Web Controls in an HTML designer.

Features
--------

AspNetEdit does not aim to be a complete IDE. After being developed as a proof-of-concept standalone editor, it now has been integrated into [MonoDevelop](http://monodevelop.com), where it is intended to be part of a complete ASP.NET editing solution.

[![]({{ site.github.url }}/old_site/images/3/30/Aspnetedit.png)]({{ site.github.url }}/old_site/images/3/30/Aspnetedit.png)

[![](/skins/common/images/magnify-clip.png)]({{ site.github.url }}/old_site/images/3/30/Aspnetedit.png "Enlarge")

The ASP.NET Visual Designer embedded in MonoDevelop

-   Web Controls can be placed on the design surface from the toolbox, and can be selected, resized and moved around
-   The properties of the selected Web Control can be inspected and modified with the property grid
-   Many of the Mozilla editor's features are exposed: text can be entered directly into the design surface, and made bold, italic, indented and so forth. Tables can also be edited directly on the design surface.
-   ASPX pages can be loaded and saved

Installation
------------

Prospective users are recommended not to install AspNetEdit at this early point in development, but to wait for a release to be made.

Nevertheless, AspNetEdit can be downloaded as part of the MonoDevelop codebase; it is in the extras/AspNetEdit subdirectory. It can be built against the system MonoDevelop installation by using the configure script (./configure; make; make install). Alternatively it can be hooked into the MonoDevelop build by running the top-level MonoDevelop configure script using a profile that contains AspNetEdit.

The standalone editor code is still available from the Mono [SVN]({{ site.github.url }}/old_site/SourceCodeRepository) repository, module *aspeditor*, or can be [viewed online](http://anonsvn.mono-project.com/viewvc/trunk/aspeditor/). Please follow the instructions in the INSTALL file to build and run the program.

Plans
-----

In the short term, there are a few features that need to be completed before the editor is ready for use:

-   Expose HTML controls in the toolbox.
-   Provide a more acceptable runtime environment so that more controls can run.
-   Handle more ASP.NET syntax.
-   Merge the parser with that in MonoDevelop's ASP.NET project support.
-   Expose more Mozilla Editor features: full table, font and image editing.

 In the long term, there is a lot that can be done. A few of the possibilities:

-   Write a Gecko DOM wrapper to provide deeper integration with Mozilla
-   Add support for web controls with HTML and other arbitrary controls inside them
-   Implement more of the .NET designer framework, and use control designers rather than rendering the controls directly
-   Add data binding support
-   XHTML support in Mozilla editor
-   Stop Mozilla editor from rearranging source indentation
-   Semantically-oriented CSS editor (some [thoughts](http://mjhutchinson.com/journal/2005-14-12/asp_net_and_css))
-   Document outline
-   User controls: editing and consuming
-   *(ASP.NET 2)* Master Pages: editing and consuming
-   *(ASP.NET 2)* Designer regions

If you are interested in contributing, please contact [Michael](mailto:m.j.hutchinson@gmail.com).

Architecture
------------

AspNetEdit is based on the Mozilla Editor, which it hosts in a Gecko\# GTK\# widget. A custom Mozilla extension allows it to visualise blocks of HTML emitted by ASP.NET Web Controls as discrete entities, and together with a C++ interop library allows it to be controlled from the C\# host.

The C\# host initatiates and tracks Web Control objects, and provides them with various designer services, using the .NET component model. It is also responsible for parsing and persisting .aspx pages.

More in-depth discussions of AspNetEdit, and updates on the project's status, can be found on Michael Hutchinson's [blog](http://mjhutchinson.com/journal/category/mono)

License
-------

AspNetEdit is licensed under the [MIT X11](http://www.opensource.org/licenses/mit-license.html) license.

Credits
-------

### Sponsors

Many thanks to **Google**, who originally funded the project as part of their [Summer of Code](http://code.google.com/summerofcode.html) programme in 2005, and funded the MonoDevelop integration in 2006.

### Primary developers

**Michael Hutchinson** wrote the C\# host, the designer infrastructure and the Gecko interop code, and integrated it into MonoDevelop.

**Blagovest Dachev** wrote the Mozilla extension, and provided valuable Mozilla editor expertise.

### Other contributors

**Eric Butler** provided the initial GTK\# property grid implementation

