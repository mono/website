---
title: Mono Project Roadmap
redirect_from:
  - /Mono_Project_Roadmap/
  - /Roadmap/
---

*Last update: November, 2014*

We are adopting a new development system where new features are developed in branches and merged into master after they have been completed and they pass our QA tests.<br/>
The goal is to reduce our feature and bug fix inventory and deliver those fixes shortly after they are fixed to Mono users.<br/>
For more information see: [http://tirania.org/blog/archive/2011/Oct-14.html](http://tirania.org/blog/archive/2011/Oct-14.html)

We are now integrating [.NET Open Source code into Mono](/docs/about-mono/dotnet-integration).

Per-component [Plans](/docs/about-mono/plans/) are available, you can also check our [Compatibility](/docs/about-mono/compatibility/) page that gives an overview of what is supported as of the latest public release of Mono.

Versioning
----------

Mono releases are versioned like this:

    MAJOR.MINOR.SUBRELEASE

-   Even-numbered ***MINOR*** releases are stable releases.
-   Odd-numbered ***MINOR*** releases are unstable releases (development/daily builds).
-   ***SUBRELEASE*** indicates a minor update to a specific release.

Releases
--------

Check our [full list of releases](http://www.mono-project.com/docs/about-mono/releases/)

Subprojects projects
--------------------

Other projects like the [debugger](/docs/debug+profile/debug/debugger/), the documentation browser, [Java](/docs/about-mono/languages/java/) integration through IKVM, [Olive](/archived/olive) and [Gtk#](/docs/gui/gtksharp/) will remain on their own schedules. This page will be updated to contain that information when it becomes available.

### Mono and Silverlight

[Moonlight](/docs/web/moonlight/) the open source implementation of Silverlight on top of Mono for Linux is no longer being developed.

### Unsupported technologies

Some of the .NET technologies have been either deprecated, are too Windows-specific or are very large efforts and our community is unable to produce viable implementations for them.

If someone cares deeply about these APIs and implements them, we would likely bundle them with Mono, but they are not actively being worked on. There might be some code for these on our [git](/community/contributing/source-code-repository/) repository, but the code is not suitable for production use nor do we recommend that developers building cross platform applications depend on it.

Too large stacks:

-   Windows Presentation Foundation

We are not working on any of the following deprecated APIs:

-   System.EnterpriseServices
-   [WSE](/archived/wse) - Extensions to System.Web.Services.
-   Workflow Foundation 3 (WF3)
-   [Code Access Security](/docs/advanced/cas/) (.NET 1.0).

The following do not map to operating systems other than Windows, and we are unlikely to spend time to support them even on Windows:

-   System.Management

Comments
--------

Feel free to [send us your comments or questions](/community/) about the roadmap.

Roadmap History
---------------

For our previous roadmap information, please see [Roadmap History](/archived/roadmap_history).
