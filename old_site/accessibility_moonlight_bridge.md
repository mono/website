---
layout: obsolete
title: "Accessibility: Moonlight Bridge"
lastmodified: '2009-06-18'
permalink: /old_site/Accessibility:_Moonlight_Bridge/
redirect_from:
  - /Accessibility:_Moonlight_Bridge/
---

Accessibility: Moonlight Bridge
===============================

The A11y bridge for Moonlight will translate UIA technology to Atk infrastructure.

Atk management is done thanks to:

-   [AtkSharp](http://anonsvn.mono-project.com/viewvc/trunk/gtk-sharp/atk/), which depends on:
-   [GLibSharp](http://anonsvn.mono-project.com/viewvc/trunk/gtk-sharp/glib/)

Those 2 assemblies above have to be compiled with smcs, so we have customised their build [patching](http://anonsvn.mono-project.com/viewvc/trunk/uia2atk/MoonAtkBridge/patches/) gtk-sharp upstream (trunk) on the fly.

As GLibSharp (and AtkSharp) require P/Invokes, in order to meet the CoreCLR requirements, the following strategies have been defined:

-   The bridge will be marked as platform-code.
-   The bridge will be only one assembly that will contain GLibSharp and AtkSharp as well, and which will be [tuned](http://anonsvn.mono-project.com/viewvc/trunk/mcs/tools/tuner/) this way:
    -   All public API of the assembly is converted into internal.
    -   All members of the assembly are decorated with SC attributes.

Therefore, the only points of entrance in the assembly (which will be in System.Windows.dll) will be decorated with SSC.

Areas of work which are in progress:

-   We have to prevent the moon tuning process to strip possible API that the bridge needs to use. We have [created](http://anonsvn.mono-project.com/viewvc/trunk/mcs/tools/tuner/Mono.Tuner/MoonlightA11yDescriptorGenerator.cs?view=markup) a linker step that generates linker descriptors but we haven't proposed it yet for the build.
-   GLibSharp also makes heavy use of Marshalling API and non-generic collections which are no longer present in the 2.1 profile, so we need an InternalsVisibleTo attribute in mscorlib for this, as well as another one in System.Windows.dll for the bridge itself to be able to access, examine or hook into UIA structures. For now, these attributes will be included only in the build with an environment variable until they are correctly [audited]({{ site.github.url }}/Moonlight/SecurityStatus#Assembly_Loading).
-   The only scenario supported right now for a11y is having installed moonlight via XPI, and the bridge by the same means. In the future we will consider the rest of the scenarios:
    -   Moon-native + Moon-a11y XPI
    -   Moon-native + Moon-a11y native
    -   Moon XPI + Moon-a11y native


