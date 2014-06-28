---
layout: obsolete
title: "Moonlight/OlympicsPlayerIssues"
lastmodified: '2010-02-17'
permalink: /old_site/Moonlight/OlympicsPlayerIssues/
redirect_from:
  - /Moonlight/OlympicsPlayerIssues/
---

Moonlight/OlympicsPlayerIssues
==============================

We've worked hard to get an Olympics capable [Moonlight/Preview]({{ site.github.url }}/old_site/Moonlight/Preview "Moonlight/Preview") out the door, but keep in mind that it is still a preview. Here are a list of possible issues you may run into, as well as workarounds for some.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#startup-issues">1 Startup Issues</a></li>
<li><a href="#missing-video">2 Missing Video</a></li>
<li><a href="#performance-issues">3 Performance Issues</a></li>
<li><a href="#ui-issues">4 UI Issues</a></li>
<li><a href="#browser-issues">5 Browser Issues</a></li>
<li><a href="#downloads">6 Downloads</a></li>
</ul></td>
</tr>
</tbody>
</table>

Startup Issues
--------------

Make sure that you have installed the Add-On from [[1]](http://www.go-mono.com/moonlight/prerelease.aspx). Uninstall all previous versions of Moonlight and verify that they are uninstalled by checking about:plugins. Problems have also been reported with other plugins registering as Moonlight. If this appears to be the case please uninstall that plugin as well.

Missing Video
-------------

Some video content from both [[2]](http://nbcolympics.com/) and [[3]](http://ctvolympics.com) is region restricted and will not play outside of the target market. Make sure you are permitted access to the content before reporting a bug.

In addition to region restrictions there is known problem with some particular videos that prevents them from playing properly in Preview 2. This is fixed in SVN and we will be making a new preview very soon. Until then you can work around the problem by visiting about:config in firefox and setting network.http.keep-alive to false.

Performance Issues
------------------

-   The olympics player makes fairly heavy use of Effects such as Blur (and sites using different versions of the player, like universalsports.com and ctvolympics, use DropShadow.). This can have an enormous effect on performance. In order to disable effects, you must make sure the MOONLIGHT\_OVERRIDES environment variable includes "effects=no". You can either set this in whatever desktop startup script you use, or shutdown firefox and run it from the command line like so:

<!-- -->

     $ MOONLIGHT_OVERRIDES=effects=no firefox

UI Issues
---------

-   Photo App
    -   Drag to pan doesn't work. Clicking the \< and \> buttons, as well as using the left and right arrows, does work. This is fixed in SVN

-   Video App
    -   The Expore More Videos button in fullscreen mode can lead to a recursive layout problem. We are actively addressing this and will issue an update when it is resolved.
    -   Some videos will not play correctly see [\#Missing Video](#missing-video).
    -   On the CTV video player the fullscreen and volume buttons render offscreen.

Browser Issues
--------------

-   Firefox 3.7 nightlies are hit and miss. 3.7a1pre seems to work better (wow, performance is GREAT) than 3.7a2pre with the Olympics player. That said, firefox 3.7a1pre has some issues:
    -   the photo app zoom ('+' and '-') buttons don't appear to work. They work in Firefox 3.5.

-   There is no Google Chrome support at this time. Their NPAPI implementation still deadlocks with the way we're making use of it.

Downloads
---------

You can always get the latest preview versions of Moonlight from [[4]](http://www.go-mono.com/moonlight/prerelease.aspx) and the firefox extension should notify you of updates automatically.

