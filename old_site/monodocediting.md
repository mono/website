---
layout: obsolete
title: "MonodocEditing"
permalink: /old_site/MonodocEditing/
redirect_from:
  - /MonodocEditing/
---

MonodocEditing
==============

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#a-restructuring-plan-for-mono-documentation-production-tools">1 A Restructuring Plan for Mono Documentation Production Tools</a></li>
<li><a href="#milestone-hydrogen">2 Milestone Hydrogen</a></li>
<li><a href="#milestone-helium">3 Milestone Helium</a></li>
<li><a href="#milestone-lithium">4 Milestone Lithium</a></li>
<li><a href="#milestone-beryllium">5 Milestone Beryllium</a></li>
</ul></td>
</tr>
</tbody>
</table>

A Restructuring Plan for Mono Documentation Production Tools
------------------------------------------------------------

The tool set available for stubbing, editing, validating, and assembling Mono documentation catalogs has evolved in a traditional linux style, with standalone tools implementing a focused portion of the process which must be linked together to produce a consumable documentation catalog.

I (Mike Kestner) have commented on the state of the documentation tools as of early 2008 [on the mailing list](http://lists.ximian.com/pipermail/mono-docs-list/2008-January/001868.html), and am embarking on a process to integrate the capabilities into a Graphical WYSISYG editing environment for start-to-finish document catalog maintenance.

The project will be developed as a standalone widget library, named Monodoc.Widgets.dll exposing the Monodoc.Widgets namespace. This is to facilitate the implementation of a standalone browser application to replace the existing monodoc browser, in addition to a new editor application and possibly a plugin for browsing and editing catalogs in MonoDevelop at some point in the future.

This document is intended as a planning tool to describe the milestones and features for the proposed system.

Note: The milestones are not necessarily in order, beyond the first one.

Milestone Hydrogen
------------------

The first milestone is the ability to browse, edit, and assemble an existing documentation tree on disk as produced by monodocer. The primary test case will be the documentation for the new widget library I'll be producing. The existing Gtk\# documentation catalog will serve as a "release-ready" test case.

Specific features of this milestone include:

-   A tree browser to browse through the on-disk catalog hierarchy.
-   A WYSIWYG editing/viewing widget for Catalog, Namespace, Type, and Member nodes.
-   Integrated document validation and binary catalog assembling functions.

Milestone Helium
----------------

Catalog updating capabilities, including dynamic stubbing and versioning. Integration with and refactoring of monodocer will be necessary to avoid duplication of complex updating functionality. Features planned for this milestone include:

-   Identification/Selection of target library assemblies.
-   Dynamic stub generation at assemble-time.
-   Explicit stubbing to disk.
-   Browsing of pre-stubbed API in the catalog tree.
-   Identification of historical API version info and enhanced Since element support.

Milestone Lithium
-----------------

Patch management capabilities. The current tool set is limited from a document review standpoint. This milestone aims to change that with the following features:

-   Integrated difference/patch highlighting
-   off-line documentation review support (eg, pdf generation and printing).
-   Patch contribution support (webservice?).
-   Patch application and approval admin (webservice?).

Milestone Beryllium
-------------------

Enhanced editing capabilities, beefing up the new editor. Potential features include:

-   dynamic lint checking/validation.
-   see cref validation/autocompletion.
-   See Also Support for non-ecma-provider documents.
-   Extending beyond ecma document catalog editing?


