---
layout: obsolete
title: "Moonlight/Beta"
lastmodified: '2009-08-26'
permalink: /archived/Moonlight/Beta/
redirect_from:
  - /Moonlight/Beta/
---

Moonlight/Beta
==============

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#moonlight-20-beta">1 Moonlight 2.0 Beta</a>
<ul>
<li><a href="#downloading">1.1 Downloading</a></li>
<li><a href="#source-code">1.2 Source code</a></li>
<li><a href="#release-notes">1.3 Release Notes</a>
<ul>
<li><a href="#beta-2">1.3.1 Beta 2</a></li>
<li><a href="#beta-1">1.3.2 Beta 1</a></li>
</ul></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Moonlight 2.0 Beta
------------------

Moonlight 2.0 will be the new version of Novell's Silverlight-compatible plugin, compatible with Silverlight 2.0 and allowing managed code execution in the browser.

**Beta Release Notice**

This release is feature complete, but as a beta there are various known bugs (mostly minor) and most assuredly unknown ones as well. We still haven't completed the security audit of the source code (mono or moonlight), so you need to be aware that there may be issues.

As such we recommend that you should only use this plugin on trusted sites (e.g. internal or well-known web sites) on non-production computers. This situation will gradually evolve over the beta releases. An up to date overview of Moonlight security features status can be found on [Moonlight Security Status]({{ site.github.url }}/Moonlight/SecurityStatus "Moonlight/SecurityStatus") wiki page.

### Downloading

XPI's for both 32 and 64 bit linux platforms, as well as instructions on getting tarballs and source from SVN are available [here](http://go-mono.com/moonlight-beta).

### Source code

You can download a tarball of the source here or you can check it out from svn.

``` bash
 $ svn co http://anonsvn.mono-project.com/source/tags/moon/1.99.1
```

Notice that this branch contains moonlight as well as mono, mcs, and mono-basic, these releases are required to build this version of Moonlight, it will **not** work with Mono 2.4.

To build the above, you should build the modules in this order:

-   mono
-   mono-basic
-   moon

Follow the instructions in our [Compiling Mono From SVN]({{ site.github.url }}/Compiling_Mono_From_SVN "Compiling Mono From SVN") page.

As always, you can get the development source from trunk:

``` bash
 $ svn co svn://anonsvn.mono-project.com/source/trunk/moon
```

### Release Notes

#### Beta 2

Fix Highlights:

-   ComboBox fixes involving the switching between the various item templates
-   ContentControls will now use the ContentTemplate if ControlTemplate is null
-   Various TemplateBinding fixes
-   Layout fixes dealing with Grid, Shapes, and MediaElements.
-   Animations (particularly when multiple animations target the same DO, as happens in VisualStates)
-   TextBox event ordering/behavior
-   Text layout and word-breaking fixes
-   Font extents are now calculated using the same algorithm as silverlight, so text lines up even better
-   various parser fixes for interesting cases found in the wild
-   a lot of memory leak/corruption fixes
-   lots of improvements in A11y from the UIA team

#### Beta 1

This beta also contains some Silverlight 3.0 features

-   Easing functions
-   SaveFileDialog
-   MultiScaleImage 3.0 API enhancements
-   MediaStreamSource now supports PCM audio data, RGBA and YV12 video data.
-   WriteableBitmap is supported.


