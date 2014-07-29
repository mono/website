---
layout: docpage
navgroup: docs
title: MonoMac
redirect_from:
  - /MonoMac/
  - /CocoaSharp/
---

MonoMac, a new foundation for building Cocoa applications on OSX using Mono.

MonoMac 1.0 was released on March 17th, 2011.

MonoMac is the result of years of experimentation in blending .NET with Objective-C and is inspired by the same design principles that we used for [MonoTouch](http://monotouch.net).

It is also the result of weekend hacking as our day to day work revolves around Mono's efforts on Linux servers, Linux desktops, Visual Studio integration and our mobile efforts. Luckily, it shares some components with MonoTouch.

As of December 12th 2012, Xamarin now offers a superset of MonoMac called [Xamarin.Mac](http://xamarin.com/mac). It features broader API coverage, a commercial license for Mono's LGPL components, Mono embedding, license to publish to the Mac AppStore and support.

Tutorials
=========

-   [MonoMac packaging, and AppStore distribution]({{ site.github.url }}/archived/MonoMacPackager "MonoMacPackager")
-   [.NET Development for OSX](http://www.satter.org/2010/09/net-development-for-os-x.html)
-   Online blogs/tutorials:
    -   [Getting Started Part 1](http://cocoa-mono.org/archives/22/chapter-1-getting-started-part-1/)
    -   [Getting Started Part 2](http://cocoa-mono.org/archives/80/exploring-cocoa-with-monomac-and-c-chapter-1-%e2%80%93-getting-started-%e2%80%93-part-2/)
    -   [Using Key-Value Coding with MonoMac](http://tirania.org/monomac/archive/2010/Dec-07.html)
    -   [Using KVC and KVO with MonoMac](http://cocoa-mono.org/archives/153/kvc-kvo-and-cocoa-bindings-oh-my-part-1/)
    -   [.NET Timer vs NSTimer on MonoMac](http://cocoa-mono.org/archives/212/net-timer-or-cocoa-nstimer-for-monomac/)
    -   [Using the Animator Proxy](http://cocoa-mono.org/archives/235/using-animator-with-frameorigin/)
    -   [Using Growl with MonoMac](http://cocoa-mono.org/archives/254/growl-my-monomac-application-says/)
    -   [Adding an Application Icon to your MonoMac app](http://cocoa-mono.org/archives/329/adding-an-application-icon-to-your-monomac-application/)
    -   Getting started with OpenGL in MonoMac, posting and samples: [[1]](http://lists.ximian.com/pipermail/mono-osx/2011-April/004267.html)

Samples
=======

MonoMac's source code comes [with more than 56 samples](https://github.com/mono/monomac/tree/master/samples) showing how to use different components of the MacOS X APIs. Each sample comes with a MonoDevelop solution that can be built by loading the IDE, or you can build all the samples in one go using Makefiles.

You can [browse the individual samples online](https://github.com/mono/monomac/tree/master/samples) or [download a packaged](https://github.com/mono/monomac/archives/master) version of them.

The samples cover basic MacOS GUI applications, AppKit applications, creating Document-based applications, Key-value programming, CoreAnimation, QuickTime, OpenGL as well as showing how to use smaller APIs in self-contained samples.

Community
=========

A chat room to discuss MonoMac exists on the IRC server at irc.gnome.org on the channel \#monomac. You can access it on the [web as well](http://wbe02.mibbit.com/index.html?server=irc.gnome.org&channel=%23monomac).

We are using the [mono-osx@lists.ximian.com mailing list](http://lists.ximian.com/mailman/listinfo/mono-osx) to discuss.

Obtaining MonoMac
=================

MonoMac is included in a [MonoDevelop](http://monodevelop.com) addin that can be used to build, run and debug MonoMac apps. The addin requires [MonoDevelop 2.4.2](http://monodevelop.com/Download) on a Mac.

Every once in a while we will update the MonoMac add-in to give users new bindings, fixes and more API love. The procedure for updating the addin is exactly the same as installing it:

1.  Open the **Add-in Manager** from the **Tools-\>Add-in Manager** menu
2.  Click the *Install add-ins* button to open the **Add-in Installation dialog**.
3.  Click "Refresh"
4.  Expand the *Mac development* category, and check the *MonoMac development* addin.
5.  Press the *Forward* button. You will be shown a page confirming that the *MonoMac development* addin will be installed. Press *Forward* again, then when the installation finishes click *Close*.
6.  Restart MonoDevelop

When the MonoMac addin is installed, a *MonoMac Project* template will become available in the **New Solution** dialog.

MonoMac from Source
===================

To build MonoMac from Source, you need to get two modules from our Git respository: [monomac](http://github.com/mono/monomac) and [maccore](http://github.com/mono/maccore)

Background
==========

Many years ago Geoff Norton produced CocoaSharp, the first set of .NET bindings to the Cocoa API. CocoaSharp was a fine first binding at the time and it was a good place to start learning about the challenges of binding Objective-C APIs to be consumed by .NET clients.

Over the years three other frameworks were created to integrate the Objective-C world and the Objective-C APIs with C\# and other .NET languages. Each one of these new frameworks had its pros and cons, and a year ago we made a call for all three competing frameworks to be merged, but sadly nothing came out of it.

When we created MonoTouch, we wanted a binding for the Cocoa APIs that would fit the patterns and idioms used in the C\# and .NET worlds, that would comply with the .NET Framework Design Guidelines and would allow give developers all the tools required to build full Cocoa applications.

We had two main requirements: the binding should just work and the code should be MIT X11 licensed. For the binding to just work, we turned to the .NET Framework Design Guidelines book as it captures years of design decisions, programming idioms and advise that would help C\# and .NET developers. By following the Design Guidelines we:

-   Avoid surprises
-   Blend with other C\# and .NET libraries
-   Reduce the room for errors
-   Increase developer joy
-   Minimizes time for the developer to be productive
-   Every bit of existing .NET knowledge translates

Luckily for us, .NET was designed from the start to be an interoperability framework. A framework that supports the most advanced requirements to make multiple runtimes and frameworks to communicate seamlessly with each other. We used these features to create our bindings.

The above goals turned into the following technical requirements:

-   Developers should be able to consume Cocoa APIs as C\# APIs
-   Allow developers to subclass Objective-C classes
    -   Subclass should work with C\# standard constructs
    -   Derive from an existing class
    -   Call base constructor
    -   Overriding methods should be done with C\#'s override system
    -   Do not expose developers to Objective-C selectors
-   Provide a mechanism to call arbitrary Objective-C libraries
-   Make common Objective-C tasks easy, and hard Objective-C tasks possible
-   Expose Objective-C properties as C\# properties
-   Expose a strongly typed API, for example instead of exposing the generic-container NSArray or individual NSObjects. This means that developers get a few benefits:
    -   MonoDevelop can flag errors as you write the code
    -   MonoDevelop can present documentation popups on types, methods, properties and parameters as you type them.
    -   Minimize runtime errors by catching invalid casts at compile time.
    -   Encourage in-IDE API exploration without rebuilding, and without having to look up the types in the documentation.
-   Turn int and uint parameters that should have been enums as C\# enumerations and C\# enumerations with [Flags] attributes
-   Expose the basic Foundation as C\# native types:
    -   NSString becomes string
    -   NSArray becomes strongly-typed array
-   Events and notifications, give users a choice between:
    -   Support the Objective-C delegate pattern:
        -   Strongly typed version is the default
        -   Weakly typed version for advance use cases
    -   C\# event system
-   Class libraries should be MIT X11 licensed, like the rest of Mono's class libraries.
-   Expose C\# delegates (lambdas, anonymous methods and System.Delegate) to Objective-C APIs as "blocks".
-   Curated APIs: there is no point in binding every UNIX or CoreFoundation C API available, as those are not very useful in practice. Bind only those that are required to build applications or get access to mandatory functionality.

More information about our API can be found here: [http://monotouch.net/Documentation/API\_Design](http://monotouch.net/Documentation/API_Design)

Binding Cocoa Types
===================

We produced a [comprehensive guide](http://monotouch.net/Documentation/Binding_New_Objective-C_Types) to binding Objective-C APIs with MonoTouch that applies directly to MonoMac.

Since a lot of the work of binding an Objective-C API is very repetitive, we have also included a header parser that does most of the heavy lifting in producing the above API from the Objective-C header file. The parser output then needs to be then massaged a bit to produce a binding that satisfies our design requirements. For example, NSArray arguments and return types must be looked up on the documentation and the proper strong typed inserted.

Status
======

These are the APIs that MonoMac binds as of November 24th MonoMac binds:

-   AddressBook (done)
-   AudioToolbox (done)
-   AppKit (About 10% left to be done)
-   AudioToolbox (done)
-   AudioUnit (60%)
-   AVFoundation (done)
-   CoreAnimation (done)
-   CoreFoundation (the parts that are needed, see the design principles)
-   CoreText (done)
-   CoreLocation (done)
-   CoreData (done)
-   CoreGraphics (done)
-   CoreImage (done)
-   CoreMedia (done)
-   CoreText (done)
-   CoreVideo (done)
-   CoreWlan (done)
-   Foundation (the parts that are needed, and helper tools to support the rest)
-   ImageIO (done)
-   ImageKit (done)
-   OpenGL (done, using a modified OpenTK)
-   PdfKit (done)
-   QTKit (done)
-   Security (keychain access done)
-   WebKit (Missing a handful of APIs)

The commercial [Xamarin.Mac](http://xamarin.com/mac) extends this with:

-   New Lion and Mountain Lion APIs for AppKit
-   SceneKit (for loading and displaying 3D scenes)
-   StoreKit
-   EventKit

Third Party Libraries:

-   Growl (bundled with MonoMac)
-   CorePlot (as part of [monotouch-bindings](https://github.com/mono/monotouch-bindings)

The following are missing, but can be invoked manually with P/Invoke:

-   LaunchServices

This list is manually updated and is usually out-of-date with the actual binding that will contain more. For actual details, look at the maccore and monomac modules on [http://github.com/mono/maccore](http://github.com/mono/maccore) and [http://github.com/mono/monomac](http://github.com/mono/monomac)

If you are interested in advancing the state of MonoMac, we are currently looking for contributors to help us bind the other Objective-C frameworks and help us complete AppKit.

Where we are going
==================

MonoMac is merely the library that gives C\# developers access to the underlying APIs on OSX, it does not include the tooling necessary to create a full application bundle.

Luckily, MonoDevelop has already most of the code needed in the form of the MonoTouch plugin. We will update this plugin to also support creating full application bundles for OSX.

A new feature that developers will be interested in is the new "Mono bundler" tool that we are hoping we can include in Mono 2.8. This bundler examines your .NET application and generates an application bundle that contains both your application code and any dependencies that it needs from Mono in a self-contained package.

This is the technology being used by Banshee on OSX today. The tool constructs a self-contained application based on your system installed Mono that you can distribute to your users, without requirement them to install Mono in the first place.

But we need your help. There are many small and medium tasks that developers can help us with that will free our already busy weekends and will allow us to have a full MonoMac experience done in a shorter period of time.

The more help we get, the sooner this will be done.

Contributing
============

We need contributors in the following areas:

-   API binding for the rest of the Frameworks
-   We need samples to be written
-   We need tutorials to be written (like the ones we did for MonoTouch)
-   We need to port existing Cocoa samples to C\#:
    -   To exercise the binding
    -   To serve as reference for new developers
    -   To identify missing frameworks
    -   To prioritize bindings
-   We need to alter MonoDevelop's plugin to produce OSX Application bundles.
-   Providing [one-line "summary" documentation](http://lists.ximian.com/pipermail/mono-osx/2010-October/003178.html)

Please join us on the mono-osx [mailing list]({{ site.github.url }}/community/help/mailing-lists/) to discuss the future of MonoMac.

