---
title: Choosing a GUI Toolkit
---

One of the hardest and most important decision to make when starting a new desktop application is which GUI "toolkit" to choose. The toolkit is the set of API's that produce the graphical user interface your users will interact with.

There are a number of factors to consider when choosing the toolkit. Different toolkits support different platforms (Linux, Windows, macOS) and have different features such as accessibility, layout engines, and looks.

The two main toolkits offered by Mono are GTK# and Winforms, however there are several other toolkits offered by the community which may suit your needs. You can see all of them in the [GUI page](/docs/gui/).

Both GTK# and Winforms, while being cross-platform, have clear roots in their original platforms. Gtk+ (the root of GTK#) began life on the Linux platform, and has since been ported to Windows and macOS. Likewise, Winforms started on Windows, and the Mono project has ported it to run on Linux and macOS. If the majority of your users will be on one platform, likely the best choice will be the toolkit native to that platform. Although steps can be taken to make your application blend on all platforms, the native toolkit will probably do the best on each platform, and will feel familiar to the majority of your users. If you do not have a platform preference, your toolkit choice will have to rely on other factors.

Alternative Implementation Approaches
=====================================

If your application is designed to be a long-running application and you have the extra resources to spare you might want to consider creating multiple operating system specific user interfaces, one for each major platform.

The idea is that you must split your application in parts:

-   Core: this contains the hearth of your application, your logic, your business process.
-   Front-end: this contains the UI front-ends for each platform.

You could even take this one step further and in addition to have a front-end per platform, you could even make a Web frontend if the Core is suitable for it.

The downside is that you have to write the code more than once, but the upside is that your application will look native on each platform.

Although some toolkits support themes, theme engines and try to mimic the host operating system, making an application truly operating system specific goes beyond the basic look.

There are a number of examples:

-   The order of buttons in dialog boxes tends to be different between Windows and MacOS/Gnome.
-   Dialog Box Layout: this tends to change across operating systems.
-   Configuration options: these tend to be radically different across different operating systems.

As an example, consider the UI for [Tangerine](https://launchpad.net/tangerine) an application used to stream music over DAAP. Tangerine has a core engine and three user interfaces, one for each major operating system:

On Windows:

[![Tangerine-prefs-win32-new.png](/archived/images/1/17/Tangerine-prefs-win32-new.png)](/archived/images/1/17/Tangerine-prefs-win32-new.png)

On Linux with Gnome:

[![Tangerine-properties.png](/archived/images/e/e3/Tangerine-properties.png)](/archived/images/e/e3/Tangerine-properties.png)

On macOS:

[![Tangerine-preferences-mac.png](/archived/images/a/a6/Tangerine-preferences-mac.png)](/archived/images/a/a6/Tangerine-preferences-mac.png)

