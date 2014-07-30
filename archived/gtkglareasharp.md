---
title: "GtkGLAreaSharp"
lastmodified: '2010-04-01'
permalink: /archived/GtkGLAreaSharp/
redirect_from:
  - /GtkGLAreaSharp/
  - /GtkGLSharp/
---

GtkGLAreaSharp
==============

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#introduction">1 Introduction</a></li>
<li><a href="#installing">2 Installing</a>
<ul>
<li><a href="#tutorial">2.1 Tutorial</a></li>
</ul></li>
<li><a href="#dependencies">3 Dependencies</a></li>
<li><a href="#testing-and-development">4 Testing and Development</a></li>
<li><a href="#monodevelop">5 MonoDevelop</a></li>
<li><a href="#support">6 Support</a></li>
<li><a href="#help-wanted">7 Help Wanted</a></li>
<li><a href="#todo">8 TODO</a></li>
<li><a href="#examples">9 Examples</a></li>
<li><a href="#release-notes">10 Release Notes</a></li>
</ul></td>
</tr>
</tbody>
</table>

Introduction
------------

[![]({{ site.github.url }}/images/8/8a/Gtkglext-sharp1.png)]({{ site.github.url }}/images/8/8a/Gtkglext-sharp1.png)

[![](/skins/common/images/magnify-clip.png)]({{ site.github.url }}/images/8/8a/Gtkglext-sharp1.png "Enlarge")

A view of a 3d Teapot generated using GtkGLAreaSharp

GtkGLAreaSharp is an OpenGL development platform build on the Mono stack.

Our code is hosted in subversion here: [http://anonsvn.mono-project.com/viewvc/trunk/gtkglarea-sharp/](http://anonsvn.mono-project.com/viewvc/trunk/gtkglarea-sharp/)

We also keep stable release tarballs here: [http://www.colliertech.org/downloads/gtkglarea-sharp/](http://www.colliertech.org/downloads/gtkglarea-sharp/)

Installing
----------

### Tutorial

Remy has made a great [GtkGlAreaSharp:Installation]({{ site.github.url }}/GtkGlAreaSharp:Installation "GtkGlAreaSharp:Installation") tutorial.

Dependencies
------------

GtkGLAreaSharp is a wrapper around the C [GtkGLArea]({{ site.github.url }}/GtkGLArea "GtkGLArea") gtk+ widget. Hence, it depends on that library. It is in the GNOME cvs repository as "gtkglarea." C.J. is now maintainer of this package. Future plans include OS platform independence and use of glitz.

The widget doesn't **require** [Tao]({{ site.github.url }}/Tao "Tao"), but it is the most well-maintained C\# wrapper around OpenGL that I have found. Plus, the tao developers hang out in the same places as the gtkglarea-sharp developers. The examples in the repository use Tao as the OpenGL interface.

C.J. has created an autotooled build system for tao and hosted it on his server, listed below. You may read more about it on the [Tao autotools]({{ site.github.url }}/Tao_autotools "Tao autotools") page

[https://www.colliertech.org/downloads/tao/](https://www.colliertech.org/downloads/tao/)

The patch has been applied to the official release, so you no longer need to get it from the above link.

Testing and Development
-----------------------

If you wish to beta test the wrapper, check the code out from subversion here:

[http://anonsvn.mono-project.com/viewvc/trunk/gtkglarea-sharp/](http://anonsvn.mono-project.com/viewvc/trunk/gtkglarea-sharp/)

MonoDevelop
-----------

If you would like to download GtkAreaGLSharp and use it within MonoDevelop, you can see this [rough guide]({{ site.github.url }}/GtkGLAreaSharp:With_MonoDevelop "GtkGLAreaSharp:With MonoDevelop").

Support
-------

For support with GtkGLAreaSharp, catch me on IRC. My nickname is cj on Freenode and GIMPNet. You can catch me on \#mono on GIMPNet or by using my web interface to the \#mono channel:

[http://www.colliertech.org/cgi-bin/cgiirc/irc.cgi](http://www.colliertech.org/cgi-bin/cgiirc/irc.cgi)

I will walk you through the process of getting gtkglarea-sharp installed.

You can also speak with remy on \#mono for support. He's in a different time zone than me.

Help Wanted
-----------

API documentation would be great.

Testing the examples would be useful!

Feedback regarding namespace clarity would be very nice.

TODO
----

-   Get the autotools bits working under cygwin with -no-cygwin
-   Make Alp's managed replacement for gtkglarea work

Examples
--------

I have written a number of examples using the widget and taken screen shots.

With the help of Alp Toker, I created a rotating teapot demo, which is included in the examples/ directory of the distribution:

[http://anonsvn.mono-project.com/viewvc/trunk/gtkglarea-sharp/examples/trackball/](http://anonsvn.mono-project.com/viewvc/trunk/gtkglarea-sharp/examples/trackball/)

 [![Gtkglext-sharp1.png]({{ site.github.url }}/images/8/8a/Gtkglext-sharp1.png)]({{ site.github.url }}/images/8/8a/Gtkglext-sharp1.png) [![Gtkglext-sharp2.png]({{ site.github.url }}/images/b/b7/Gtkglext-sharp2.png)]({{ site.github.url }}/images/b/b7/Gtkglext-sharp2.png)

 This code is poorly documented. However, I used this code to create a partial implementation of [Neon Helium](http://nehe.gamedev.net/)'s OpenGL lessons. You can find the NeHe documentation on the [GtkGLAreaSharp:NeHe]({{ site.github.url }}/GtkGLAreaSharp:NeHe "GtkGLAreaSharp:NeHe") wiki entry.

Release Notes
-------------

-   [GtkGLAreaSharp:0.0.17]({{ site.github.url }}/GtkGLAreaSharp:0.0.17 "GtkGLAreaSharp:0.0.17") - April 2007
-   [GtkGLAreaSharp:0.0.8]({{ site.github.url }}/GtkGLAreaSharp:0.0.8 "GtkGLAreaSharp:0.0.8")


