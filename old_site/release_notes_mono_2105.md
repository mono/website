---
layout: obsolete
title: "Release Notes Mono 2.10.5"
lastmodified: '2011-08-24'
permalink: /old_site/Release_Notes_Mono_2.10.5/
redirect_from:
  - /Release_Notes_Mono_2.10.5/
---

Release Notes Mono 2.10.5
=========================

Mono is a portable and open source implementation of the .NET framework for Unix, Windows, MacOS and other operating systems.

Mono 2.10.5 is a minor update to [Mono 2.10]({{site.github.url}}/old_site/Release_Notes_Mono_2.10 "Release Notes Mono 2.10"), [Mono 2.10.1]({{site.github.url}}/old_site/Release_Notes_Mono_2.10.1 "Release Notes Mono 2.10.1"), [Mono 2.10.2]({{site.github.url}}/old_site/Release_Notes_Mono_2.10.2 "Release Notes Mono 2.10.2"), [Mono 2.10.3]({{site.github.url}}/old_site/Release_Notes_Mono_2.10.3 "Release Notes Mono 2.10.3") and [2.10.4]({{site.github.url}}/old_site/Release_Notes_Mono_2.10.4 "Release Notes Mono 2.10.4") based on the mono-2-10 branch of github. Mono 2.10.5 was released on August 24th, 2011.

Changes
=======

-   Add support for reference instances of Interlocked.Exchange\<T\> to full-aot, similarly to Interlocked.CompareExchange\<T\>.

-   Added IObserver/IObservable to the MOBILE profile

Bug Fixes
=========

-   Novell \#445855: Timezone will be reflected if the system updates.
-   Xamarin \#12, Novell \#690357 and many other incarnations of the same bug: Fix a threadpool bug that would hang the threadpool activity under no load.
-   Xamarin \#99: Fix in parsing assembly names.
-   Xamarin \#149: Regex.Compiler is a no-op, for WP7 compatibility on the MOBILE profiles
-   Xamarin \#171: LLVM backend fixes.
-   Xamarin \#223: WindowsBase's System.IO.Compression fixed to work on Windows (invalid C calling conventions used)
-   Xamarin \#227: Exit on unhandled exceptions only
-   Xamarin \#263: Fixes debugging deadlock on Lion
-   Xamarin \#280: Removes some LLVM passes that do not work
-   Xamarin \#296: Provide an error message if an instance method is decorated with MonoPInvokeCallback
-   Xamarin \#311: LinkedList.Clear improved
-   Fix the range of Random ().Next
-   Task optimization to avoid creating empty delegates
-   Use 'as' for casting certificate extensions since we already deal with null and malformed extensions will throw, hard to debug, ICE when we just want to ignore them
-   Fix TaskCreationOptions
-   g\_log works under Android
-   Workaround broken Android C library, to make SGen reliable
-   TaskCompletionSource is now thread safe


