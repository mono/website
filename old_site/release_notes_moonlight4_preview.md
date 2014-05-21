---
layout: obsolete
title: "Release Notes Moonlight4 Preview"
lastmodified: '2011-02-15'
permalink: /old_site/Release_Notes_Moonlight4_Preview/
redirect_from:
  - /Release_Notes_Moonlight4_Preview/
---

Release Notes Moonlight4 Preview
================================

Moonlight 4 Preview 1 is the first preview of Moonlight that includes support for the Siverlight 3 APIs and partial support for Silverlight 4 APIs. We consider the Silverlight 3 API support to be feature complete while the Silverlight 4 APIs are both partial and might be missing features.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#major-highlights">1 Major Highlights</a>
<ul>
<li><a href="#api-compatibility">1.1 API Compatibility</a></li>
<li><a href="#new-rendering-engine">1.2 New Rendering Engine</a>
<ul>
<li><a href="#gpu-based-acceleration">1.2.1 GPU-based acceleration</a></li>
<li><a href="#3d-transformations">1.2.2 3D Transformations</a></li>
<li><a href="#shaders">1.2.3 Shaders</a></li>
</ul></li>
<li><a href="#new-platform-abstraction-layer">1.3 New Platform Abstraction Layer</a>
<ul>
<li><a href="#windowing-system">1.3.1 Windowing System</a></li>
<li><a href="#network-status">1.3.2 Network Status</a></li>
<li><a href="#capture-service">1.3.3 Capture Service</a></li>
<li><a href="#local-messaging">1.3.4 Local Messaging</a></li>
<li><a href="#oob-application-installation">1.3.5 OOB Application Installation</a></li>
</ul></li>
<li><a href="#out-of-browser-execution">1.4 Out of Browser Execution</a></li>
<li><a href="#video-capture">1.5 Video Capture</a></li>
<li><a href="#developer-tools">1.6 Developer Tools</a></li>
<li><a href="#chrome-support">1.7 Chrome Support</a>
<ul>
<li><a href="#linux-chrome-libjpeg-issue">1.7.1 Linux Chrome libjpeg issue</a></li>
</ul></li>
<li><a href="#new-codecs">1.8 New Codecs</a></li>
<li><a href="#smooth-streaming">1.9 Smooth Streaming</a></li>
<li><a href="#local-connections">1.10 Local Connections</a></li>
</ul></li>
<li><a href="#missing-features">2 Missing Features</a></li>
<li><a href="#obtaining-moonlight-4-preview-1">3 Obtaining Moonlight 4 Preview 1</a></li>
<li><a href="#keeping-up-with-moonlight-4">4 Keeping up with Moonlight 4</a>
<ul>
<li><a href="#nightly-builds">4.1 Nightly Builds</a></li>
<li><a href="#source-code">4.2 Source code</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Major Highlights
================

API Compatibility
-----------------

The major change from Moonlight 2 is that we now implement the Silverlight 3 API as well as parts of the Silverlight 4 API. The actual missing pieces from the API are documented below.

New Rendering Engine
--------------------

Moonlight's rendering engine has been rewritten to support hardware acceleration, 3D transformations and pixel shaders. The engine provides a backend system that makes it easy to implement hardware acceleration support for new platforms. The brilliant [Gallium3D](http://en.wikipedia.org/wiki/Gallium3D) open source project is used as the default software rendering backend on systems that lack sufficient hardware acceleration support.

The following sections describe how this new rendering engine is used.

### GPU-based acceleration

If your system has a GPU with OpenGL 2.0 drivers installed for it, Moonlight can offload the visual tree composition to the GPU and developers can also direct Moonlight to cache images directly into the GPU to accelerate rendering and animations on a case-by-case basis.

Developers can also choose to use GPU acceleration for images by using the CacheMode property and setting it to BitmapCache.

Go to the [OpenGL status page]({{site.github.url}}/old_site/Moonlight4_OpenGL_Status "Moonlight4 OpenGL Status") to find out if your driver is currently supported by Moonlight.

### 3D Transformations

This release of Moonlight supports all of the 3D transformations that were introduced in Silverlight. 3D transformations are typically used to create elements or animations that have perspective in them.

You can see some [demos here](http://www.silverlightshow.net/items/Perspective-3D-in-Silverlight-3.aspx).

### Shaders

Moonnlight supports both the pre-defined blur and drop shadow effects on any visual element(exposed by the BlurShadowEffect and the DropShadowEffect classes) it also supports user-specified [pixel shaders](http://msdn.microsoft.com/en-us/library/system.windows.media.effects.pixelshader(VS.95).aspx) that allow developers to apply complex effects to their visual elements.

New Platform Abstraction Layer
------------------------------

In order to ease porting to other operating systems, messaging systems, windowing systems, and hardware configurations, moonlight 4 has been restructured so that all interactions with these systems goes through an abstract layer, called the PAL.

There are several interfaces within each subsection, some of which are listed below:

### Windowing System

-   MoonWindowingSystem
-   MoonWindow
-   MoonWindowless
-   MoonClipboard
-   MoonEvent and various specialized subclasses

### Network Status

-   MoonNetworkService

### Capture Service

-   MoonVideoCaptureService
-   MoonAudioCaptureService

### Local Messaging

-   MoonMessagingService

### OOB Application Installation

-   MoonInstallerService

Out of Browser Execution
------------------------

Moonlight now supports out of browser execution of the websites that support it.

Video Capture
-------------

Moonlight supports capture using [V4L2](http://en.wikipedia.org/wiki/V4L2). The following pixel formats are supported at present.

-   YUYV
-   YUV420

If your camera or tuner card doesn't work, please let us know the model and/or any other info about your hardware setup, and we'll make it work.

Developer Tools
---------------

We are providing certain features for developers that want to improve the performance of their application or want to debug how Moonlight is rendering things. When you right-click on a Silverlight surface, the "Advanced" tab has features that will let you:

-   Display the Frames Per Second counters
-   Track exposed regions
-   Track clipping rectangles
-   Show UIElement bounding boxes
-   Show textbox bounds
-   Enable/disable occlusion culling
-   Emulate the Windows Platform key codes
    -   Some applications have hardcoded Windows platform key codes, this lets those applications run on Moonlight.
-   Allows users to use the Curl bridge over the browser HTTP stack
-   Enable or disable the GPU acceleration stack.

Chrome Support
--------------

In addition to supporting Firefox, the new Moonlight preview ships with Google Chrome packages and works as an out-of-browser plugin.

### Linux Chrome libjpeg issue

Current google-built linux versions of chrome link against the widely deployed libjpeg.so.62. All linux distributions should have this library installed, but some of them (including openSUSE 11.3) install them for legacy purposes only, and link their own libraries against libjpeg.so.8.

It is very easy to end up in a situation where both versions of libjpeg are loaded into the same process, at which time it's also very easy to end up in a situation where code compiled to use libjpeg.so.8 is actually calling through to dynamic symbols exported from libjpeg.so.62. This causes an immediate abort().

For moonlight specifically this happens because the chrome process pulls in libjpeg.so.62, and the gdk-pixbuf jpeg loader pulls in libjpeg.so.8. We have added code (pending for preview 2, in git already if you're tracking it) specifically to check for this situation and disable jpeg loading entirely if we find it to be present. Chrome has plans to move to libjpeg-turbo in the future, so this will eventually not (hopefully) be an issue.

If there are chromium packages as part of your linux distribution, those might fix the problem, as they are more likely to link against the blessed libjpeg.so, whatever version it might be.

Some other chrome issue regarding libjpeg versions are:

-   [chromium issue \#31427](http://code.google.com/p/chromium/issues/detail?id=31427)
-   [chromium issue \#30205](http://code.google.com/p/chromium/issues/detail?id=30205)
-   [chromium issue \#48789 (re: libjpeg-turbo)](http://code.google.com/p/chromium/issues/detail?id=48789)

New Codecs
----------

In addition to the MP3, VC1, WMA, and the various WMV codecs that were supported in Moonlight 2, the Microsoft Media Pack that Moonlight uses also contains the video codec for H.264 and the AAC audio codec.

Smooth Streaming
----------------

Even though Moonlight 2 shipped with support for Smooth Streaming, the underlying pipeline that is used by the Smooth Streaming system has been upgraded.

Local Connections
-----------------

Moonlight supports the System.Windows.Messaging namespace which allows for multiple moonlight plugins on the same web page (or different webpages) to communicate directly, and safely.

Missing Features
================

Some features are presently missing or incomplete:

-   RichTextBox (incomplete)
-   Printing (missing)
-   Elevated Trust (incomplete)
-   WebBrowser (missing)
-   CachedComposition ???
-   TextInput event (missing)
-   Navigation (incomplete)
-   Microphone (missing)
-   WebCam (incomplete ???)
-   UDP sockets
    -   UdpAnySourceMulticastClient (not implemented)
    -   UdpSingleSourceMulticastClient (not implemented)
-   Analytics (missing)
-   Window
    -   ChildWindow (incomplete)
    -   NotificationWindow (not implemented)
-   Seadragon BlurFactor (missing)

Obtaining Moonlight 4 Preview 1
===============================

The current release of Moonlight can be downloaded [here](http://go-mono.com/moonlight/).

Keeping up with Moonlight 4
===========================

Nightly Builds
--------------

You can always download the most recent bleeding edge bits (basically the last successful compile) from [here](http://go-mono.com/moonlight/nightlies.aspx). Be aware these have had no testing done on them at all. They might crash your browser, or worse.

Source code
-----------

Source code for current and previous moonlight releases is available from [our ftp site.](http://ftp.novell.com/pub/mono/sources/moon/)

If you plan on tracking the source it's much easier to use git. The instructions for checking things out can be found [here]({{site.github.url}}/old_site/Moonlight#developing-moonlight "Moonlight").

