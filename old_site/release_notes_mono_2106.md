---
layout: obsolete
title: "Release Notes Mono 2.10.6"
permalink: /old_site/Release_Notes_Mono_2.10.6/
redirect_from:
  - /Release_Notes_Mono_2.10.6/
---

Release Notes Mono 2.10.6
=========================

Mono is a portable and open source implementation of the .NET framework for Unix, Windows, MacOS and other operating systems.

Mono 2.10.6 is a minor update to [Mono 2.10]({{site.github.url}}/old_site/Release_Notes_Mono_2.10 "Release Notes Mono 2.10"), [Mono 2.10.1]({{site.github.url}}/old_site/Release_Notes_Mono_2.10.1 "Release Notes Mono 2.10.1"), [Mono 2.10.2]({{site.github.url}}/old_site/Release_Notes_Mono_2.10.2 "Release Notes Mono 2.10.2"), [Mono 2.10.3]({{site.github.url}}/old_site/Release_Notes_Mono_2.10.3 "Release Notes Mono 2.10.3"), [2.10.4]({{site.github.url}}/old_site/Release_Notes_Mono_2.10.4 "Release Notes Mono 2.10.4") and [2.10.5]({{site.github.url}}/old_site/Release_Notes_Mono_2.10.5 "Release Notes Mono 2.10.5") based on the mono-2-10 branch of github. Mono 2.10.6 was released to stable on October 14th, 2011.

Bug Fixes
=========

-   Handle threads that die without detaching, this bug prevented debugging from working on setups like MonoDevelop debugging MonoMac apps.

-   System.Data Sql Expression parser has been updated to allow TRIM and SUBSTRING to allow more expression types as well as adding support for null literals as well as removing the internal reduce/reduce conflicts in the grammar (Xamarin \#665).

-   The C\# compiler will now recognize the Lion OSX Terminal as one where it should use colors.

-   Fixed various components of the test suite to run under the MONO\_MOBILE profile.

-   Support roundtrip of the Local timezone (Xamarin \#326)

-   Use a TaskCompletionSource in non-generic ContinueWhenAny case. (Xamarin \#647)

-   If epoll fails, fallback to poll (Novell \#705190)

-   Implement AppDomain.ResourceResolve. (Xamarin \#579)

-   Allow pointers to structures to be passed in pinvoke, MS seems to allow this at least in some cases. Fixes Xamarin \#158.

WCF Fixes
---------

-   WCF, add checks for partDesc (Xamarin \#612)

-   UriTemplate should not be mandatory, make it optional.

-   UriTemplate: When there was no path parameter, it ignored the whole path part.

-   Differentiate GET query parameter binding from another request binding. (Xamarin \#206)

-   ReturnValue in MessageDescription was missing when there was MessageContract.

-   When there is void return, the common message formatter should ignore it.

-   Transport security can now be set for WCF Basic Auth calls. (Xamarin \#380)

-   Implement IXmlLineInfo on XLinq node reader.

SGen Updates
============

-   Optimization: Break tracking weak references as early as possible.

-   Improvements to SGen Bridge support.


