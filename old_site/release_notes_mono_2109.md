---
layout: obsolete
title: "Release Notes Mono 2.10.9"
lastmodified: '2012-05-02'
permalink: /old_site/Release_Notes_Mono_2.10.9/
redirect_from:
  - /Release_Notes_Mono_2.10.9/
---

Release Notes Mono 2.10.9
=========================

Mono 2.10.9 is a minor update to [Mono 2.10]({{site.github.url}}/old_site/Release_Notes_Mono_2.10 "Release Notes Mono 2.10"), [Mono 2.10.1]({{site.github.url}}/old_site/Release_Notes_Mono_2.10.1 "Release Notes Mono 2.10.1"), [Mono 2.10.2]({{site.github.url}}/old_site/Release_Notes_Mono_2.10.2 "Release Notes Mono 2.10.2"), [Mono 2.10.3]({{site.github.url}}/old_site/Release_Notes_Mono_2.10.3 "Release Notes Mono 2.10.3"), [2.10.4]({{site.github.url}}/old_site/Release_Notes_Mono_2.10.4 "Release Notes Mono 2.10.4"), [2.10.5]({{site.github.url}}/old_site/Release_Notes_Mono_2.10.5 "Release Notes Mono 2.10.5"), [2.10.6]({{site.github.url}}/old_site/Release_Notes_Mono_2.10.6 "Release Notes Mono 2.10.6"), and [2.10.7]({{site.github.url}}/old_site/Release_Notes_Mono_2.10.7 "Release Notes Mono 2.10.7").

Mono 2.10.9 on OSX contains an updated Gtk+ version with many fixes to the UI stack which improve the usability of MonoDevelop and other Gtk+ apps.

Mono 2.10.9 is a Mac-only update.

MacOS Updates
=============

This release bundles the new version of Gtk+ 2 that has been fine tuned for MacOS X and fixes hundreds of problems that have been reported by users of MonoDevelop on Mac. In addition, it adds support for Lion's Smooth Scrolling.

Changes
=======

-   Fix a libgdiplus issue that had forced linking against Apple's X11 stack for text rendering.
-   Fix issue where a native crash causes MonoDevelop to hang and neither Force Quit nor kill -9 would terminate it (Xamarin \#2548).
-   Fix sgen failing with Assertion at sgen-gc.c:2506, condition \`mono\_sgen\_need\_bridge\_processing ()' not met.

See the [Mono 2.10.7 release notes]({{site.github.url}}/old_site/Release_Notes_Mono_2.10.7 "Release Notes Mono 2.10.7") for a full list of Mono changes since the last stable release.

