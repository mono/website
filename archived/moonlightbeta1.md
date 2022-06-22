---
title: "MoonlightBeta1"
lastmodified: '2008-12-02'
redirect_from:
  - /MoonlightBeta1/
---

MoonlightBeta1
==============

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#requirements">1 Requirements</a></li>
<li><a href="#known-bugs">2 Known Bugs</a></li>
<li><a href="#fully-working-sites">3 Fully Working Sites</a></li>
<li><a href="#firefox-3-issues">4 Firefox 3 Issues</a>
<ul>
<li><a href="#windowless-cursors">4.1 Windowless Cursors</a></li>
<li><a href="#windowless-mouse-event-problems">4.2 Windowless mouse event problems</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Requirements
============

We are passing all of the Microsoft Silverlight 1.0 tests, have been tested with all of the sites listed in the [Fully Working Sites](#fully-working-sites) section, and are able to install the Microsoft Media Pack as hosted on Microsoft.com

Known Bugs
==========

-   [Moonlight 1.0 Beta bugs to be fixed for 1.0 Final](http://bugzilla.novell.com/buglist.cgi?query_format=advanced&classification=Mono&product=Moonlight&target_milestone=1.0.0&bug_status=NEW&bug_status=ASSIGNED&bug_status=NEEDINFO&bug_status=REOPENED&bugidtype=include&chfieldto=Now&cmdtype=doit)

-   [Open Moonlight 1.0 bugs](http://bugzilla.novell.com/buglist.cgi?bug_status=NEW&bug_status=ASSIGNED&bug_status=NEEDINFO&bug_status=REOPENED&chfieldto=Now&classification=Mono&emailassigned_to1=1&emailassigned_to2=1&emailcc2=1&emailqa_contact2=1&emailreporter2=1&field-1-0-0=bug_status&field-1-1-0=classification&field-1-2-0=product&product=Moonlight%20&query_format=advanced&type-1-0-0=anyexact&type-1-1-0=anyexact&type-1-2-0=anyexact&value-1-0-0=NEW%2CASSIGNED%2CNEEDINFO%2CREOPENED&value-1-1-0=Mono&value-1-2-0=Moonlight%20&order=bugs.bug_id%20&query_based_on=Moonlight)

Fully Working Sites
===================

The following sites:

-   [Silverlight Showcase](http://silverlight.net/Showcase)
-   [Vertigo's Video.Show](http://videoshow.vertigo.com) - video playback
-   [Mediapreview TV](http://mediapreview.tv) - video playback

The following Silverlight 1.0 samples:

-   [Silverlight Page Turn](http://silverlight.net/samples/1.0/Page-Turn/default.html)
-   [Sprawl](http://silverlight.net/samples/1.0/Sprawl/default.html)

Firefox 3 Issues
================

Windowless Cursors
------------------

Firefox 3.0 on linux lacks support for windowless cursors. This is a failing of the NPAPI, not of moonlight. We have contributed an experimental patch to support windowless plugin cursors (within the set of CSS defined cursors, which unfortunately does not overlap completely with the set of Silverlight defined cursors). The code is compiled into moonlight, and if the patch is rolled into FireFox, it should all "just work" in a future version of xulrunner.

More information at [Mozilla Bug #430451](https://bugzilla.mozilla.org/show_bug.cgi?id=430451)

Windowless mouse event problems
-------------------------------

Firefox 3.0 shipped with faulty mouse motion compression, which leads to moonlight windowless plugins getting events out of order. It is impossible to diagnose and correct this problem from within moonlight. This has been fixed upstream in Firefox and should be released in xulrunner 1.9.1.

More information is available at [Novell Bug #433687](https://bugzilla.novell.com/show_bug.cgi?id=433687), including a url to 1.9.0 xulrunner packages for SuSE which contain the backported fix.
