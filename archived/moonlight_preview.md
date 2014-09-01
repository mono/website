---
title: "Moonlight/Preview"
lastmodified: '2010-10-26'
redirect_from:
  - /Moonlight/Preview/
---

Moonlight/Preview
=================

Moonlight 3.0 will be the new version of Novell's Silverlight-compatible plugin, compatible with Silverlight 3.0.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#downloading">1 Downloading</a></li>
<li><a href="#source-code">2 Source code</a></li>
<li><a href="#release-notes">3 Release Notes</a></li>
<li><a href="#preview-1">4 Preview 1</a></li>
<li><a href="#preview-2">5 Preview 2</a></li>
<li><a href="#preview-7">6 Preview 7</a></li>
<li><a href="#preview-9">7 Preview 9</a></li>
</ul></td>
</tr>
</tbody>
</table>

### Downloading

XPI's for both 32 and 64 bit linux platforms, as well as instructions on getting tarballs and source from SVN are available [here](http://go-mono.com/moonlight-preview).

### Source code

While we are not currently providing preview releases as tar files but you can check out the source from svn.

``` bash
 $ svn co svn://anonsvn.mono-project.com/source/branches/moon-2-99-0-3
```

 Notice that this branch contains moonlight as well as mono, mcs, and mono-basic, these releases are required to build this version of Moonlight, it will **not** work with Mono 2.4, and also won't work out of the box with Mono 2.6.

To build the above, you should build the modules in this order:

-   mono
-   mono-basic
-   moon

Follow the instructions in our [Compiling Mono From SVN](/Compiling_Mono_From_SVN "Compiling Mono From SVN") page.

As always, you can get the development source from trunk:

``` bash
 $ svn co svn://anonsvn.mono-project.com/source/trunk/moon
```

### Release Notes

### Preview 1

-   Our platform abstraction layer is in SVN now. Currently the only implementation is for Gtk, but none of the core code has any dependency on windowing systems, and should be much more easily portable to other OS's and windowing system (and UI toolkits).

-   MP4 demuxer. Currently there is no h264 decoder, though, unless you're compiling using ffmpeg.

-   The start of work on UI virtualization. This is a common method for dealing with scrollable lists displaying large datasets.

-   We've fixed the problem that was causing other plugins to register themselves as handling silverlight content. We play much nicer with the rest of the plugin ecosystem, so all you people who had to remove your picasa plugins to use moonlight, rejoice!

-   A multitude of small fixes and additions from 3.0 -- really too many to count -- such as Style.BasedOn, RelativeSource based Bindings, etc).

### Preview 2

-   New NPAPI-based html bridge. We no longer need the bridges for dealing with the page. We're working on removing the need for the bridge for the remaining case (mms urls).

-   Firefox 3.6 and 3.7: We added a Firefox 3.6 specific bridge, and as long as the app doesn't do anything with mms urls, things \*should\* work in Firefox 3.7. For instance, the nbc olympics site works in 3.7, and performance of both the plugin and the browser is improved on multi-cpu systems.

-   Olympics support. This is our first preview to really start working with the NBC Olympics site. We are tracking issues at [Moonlight/OlympicsPlayerIssues](/Moonlight/OlympicsPlayerIssues "Moonlight/OlympicsPlayerIssues")

-   Local Messaging. Demos from last year's MIX, such as Chess Wars and the Bouncing Balls, work.

-   Effects are available now. Our blur effect is a hand coded version, while the DropShadow and all ShaderEffects are implemented by converting to Gallium's shader language. They can cause a big perf hit, but you can disable them by adding "effects=no" to the MOONLIGHT_OVERRIDES environment variable before starting your browser. The Olympics player uses the BlurEffect pretty extensively, so you'll want to use that environment variable if you run into performance problems.

-   Some optimizations making DependencyObject::GetValue a bit speedier, and we also do fewer GetValues in general by caching things locally (particularly when used in loop conditions).

-   Many memory leaks have been fixed, and we've started work on bringing down our per-tick allocation requirements.

### Preview 7

-   Roughly API complete to SL4.0 beta. Next preview will be API compatible with SL 4.0 RTW.

-   video4linux2 capture support, but support for pixel formats is sparse. right now the supported formats are YUYV and YV12/YUV420 (planar).

-   SSE2 fast paths for gradient fills in the embedded pixman/cairo (not pushed upstream yet).

-   Fixes for chrome support and to our curl bridge.

-   Several html bridge fixes.

-   element to element binding.

-   Client HTTP stack

-   cascading (BasedOn) styles are now supported

-   new right-click dialog so we can (finally!) managed isostore usage.

### Preview 9

-   new managed parser for RuntimeVersion=4

-   improved GC support - the GC is now the one-true means of freeing all objects, including c++ peers.


