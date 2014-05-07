---
layout: obsolete
title: "AppServer"
permalink: /old_site/AppServer/
redirect_from:
  - /AppServer/
---

AppServer
=========

*This wiki page is still a draft*

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#Mono_AppServer_project">1 Mono AppServer project</a>
<ul>
<li><a href="#Features_of_the_current_AppServer">1.1 Features of the current AppServer</a></li>
<li><a href="#Interesting_and_possible_features">1.2 Interesting and possible features</a></li>
<li><a href="#My_ideas">1.3 My ideas</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Mono AppServer project
----------------------

For quite some time now, there's been a appserver module in SVN. The idea is having a service container, allowing you to host multiple applications inside one process. These individual applications are hosted in separate AppDomains.

Each application can host one or more functionalities. Think of an HTTP server, an FTP server, etc.

The advantage of hosting each application in its own AppDomain, is that each application is independent of each other. So if the HTTP server crashes, the FTP server will still work.

### Features of the current AppServer

The current source, as in SVN today, supports hosting applications in separate AppDomains. This works.

### Interesting and possible features

Interesting features are:

-   Sharing functionality between applications. This means one could implement general logic inside one application and let it be used by other projects. Think of the possibility to split up a huge website into smaller virtual dirs, each hosted in their own appdomain.
-   Creating private communication channels between applications (like a TCP/IP connection). This will allow for easy authentication of one application to the other.

More to come...

### My ideas

I, Matthijs ter Woord, am willing to step up and act as maintainer of the appserver project. I will then import a private project, which implements all the above features, except the private communication channels one. If there is interest for this, please contact me at [[[1]](mailto:matthijsterwoord@gmail.com)]

