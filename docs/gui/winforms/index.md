---
layout: docpage
navgroup: docs
title: WinForms
redirect_from:
  - /WinForms/
  - /MWF/
  - /SWF/
  - /Windows_Forms/
  - /Winforms/
---

Quick Resources
---------------

-   [Guide: Getting Started]({{ site.github.url }}/docs/gui/winforms/getting-started-guide/)
-   [Guide: Porting Winforms Applications to Mono]({{ site.github.url }}/docs/gui/winforms/porting-winforms-applications/)
-   [Guide: Debugging Winforms Applications with Visual Studio]({{ site.github.url }}/docs/gui/winforms/debugging-with-mwf/)
-   [Tutorial: Using Winforms with Mono/C\#](http://zetcode.com/tutorials/monowinformstutorial/)
-   [Frequently Asked Questions about WinForms]({{ site.github.url }}/docs/faq/winforms/)
-   Bugs [Current](http://bugzilla.novell.com/buglist.cgi?product=Mono%3A+Class+Libraries&component=Windows.Forms&bug_status=NEW&bug_status=ASSIGNED&bug_status=REOPENED&order=bugs.bug_id), [Submit New](http://bugzilla.novell.com/enter_bug.cgi?alias=&assigned_to=&blocked=&bug_file_loc=http%3A%2F%2F&bug_severity=Normal&bug_status=NEW&cf_foundby=---&cf_nts_priority=&cf_nts_support_num=&cf_partnerid=&comment=Description%20of%20Problem%3A%0D%0A%0D%0A%0D%0ASteps%20to%20reproduce%20the%20problem%3A%0D%0A1.%20%0D%0A2.%20%0D%0A%0D%0A%0D%0AActual%20Results%3A%0D%0A%0D%0A%0D%0AExpected%20Results%3A%0D%0A%0D%0A%0D%0AHow%20often%20does%20this%20happen%3F%20%0D%0A%0D%0A%0D%0AAdditional%20Information%3A%0D%0A%0D%0A%0D%0A&component=Windows.Forms&contenttypeentry=&contenttypemethod=autodetect&contenttypeselection=text%2Fplain&data=&deadline=&dependson=&description=&estimated_time=0.0&flag_type-2=X&form_name=enter_bug&keywords=&maketemplate=Remember%20values%20as%20bookmarkable%20template&op_sys=Other&priority=P5%20-%20None&product=Mono%3A%20Class%20Libraries%20&qa_contact=&rep_platform=Other&short_desc=&version=unspecified)
-   Some [Winforms Samples]({{ site.github.url }}/old_site/Winforms_Samples "Winforms Samples")

### Code Status

Support for Windows Forms 2.0 is complete. At this point, we are largely just fixing bugs and polishing our code.

About System.Windows.Forms
--------------------------

System.Windows.Forms (aka Managed.Windows.Forms, MWF, Winforms) is one of the many [GUI Toolkits]({{ site.github.url }}/docs/gui/gui-toolkits/) for use with Mono and is compatible with Microsoft's System.Windows.Forms. Support for Winforms 1.1 and 2.0 has been completed, and is now in a maintenance/bug fixing state.

System.Windows.Forms in Mono is implemented using System.Drawing. All controls are natively drawn through [System.Drawing]({{ site.github.url }}/docs/gui/drawing/). System.Windows.Forms implements its own driver interface to communicate with the host OS windowing system. Currently, we have drivers for X11, Win32, and OSX. These drivers translate the native window messages into WndProc compatible messages, to provide as much compatibility with native .Net as possible.

In terms of integrating visually with the desktop, we currently ship with a classic Win32 theme.

### Contributing

The Winforms effort is being coordinated on the Mono-Winforms-List mailing list. If you would like to contribute, or need help using Winforms, it is suggested that you subscribe to this mailing list. (See [Mailing Lists]({{ site.github.url }}/community/help/mailing-lists/) for details.)

Currently, all of the controls are pretty much complete. We are now mainly fixing bugs in our implementation. See [Bugs]({{ site.github.url }}/community/bugs/).

If you would like to contribute, you can:

-   If you find a bug in one of our methods, you can file a bug with a small test case.
-   You can fix a bug in one of our methods, either that you found or from our bugs page.

Please note there are a few rules for contributing to Winforms:

-   The general rules from [Contributing]({{ site.github.url }}/community/contributing/), especially the Special Notes at the bottom.
-   Controls must be drawn using System.Drawing code.
-   Drawing code must be tied into the theming interface.
-   If your method can be tested by an automated NUnit test, please include a test as well.

If you are working on a large feature, you may wish to post your intent on the mailing list to prevent duplication of effort.

### Drivers

There is a per-windowing system driver which performs the following tasks:

-   Keyboard input
-   Window creation
-   Event translation

Mono's Windows.Forms implementation translates the native system events such as X11 into Win32 WM\_ messages and dispatches them using the WndProc mechanism. This allows applications that depend on overriding WndProc to get some features not exposed by the APIs to still run.

### Accessibility

Currently Windows.Forms does not support accessibility, this is being worked on in a separate project that started in January of 2008. See the [Accessibility]({{ site.github.url }}/old_site/Accessibility) page for details about how this will integrate into the system.

Sample Code
-----------

Sample applications for Mono's Windows.Forms are available in [winforms on github](https://github.com/mono/winforms)

Theming
-------

This section discusses the theming issues in Mono's implementation of Windows Forms as these questions are asked frequently:

### Why Not Use Native Widgets?

It is not feasible to use native widgets on all operating systems. Each OS/Windowing system has different behavior/properties/features for what on the surface looks like the same widget. A RadioButton in Gnome is different from a RadioButton in Win32, which is different from a RadioButton in OS X. To use the native widgets means to reduce the functionality of MWF to the least common denominator of all supported operating systems. If we were designing our own GUI toolkit, this might even be acceptable, however we are implementing an already defined API with defined behavior (and even with application relied-upon side-effects). A RadioButton has to behave exactly like it behaves on Win32 with MS.Net, or else applications written for it may not work properly anymore. And that's the whole point of Winforms: to allow existing .Net SWF apps to run on Mono. For other uses, there are other choices that may be more appropriate, such as [Gtk\#]({{ site.github.url }}/docs/gui/gtksharp/).

### Fitting In

Although we cannot use native widgets, we still would like to make a reasonable effort to achieve a more native "look and feel" on different platforms. To accomplish this, we have created a theming interface with the hope that in the future it will facilitate our controls looking more native. Having a separate theme class from the get-go forces those who are writing the controls to design code where the drawing code is not integrated and intermingled with the control code.

### Maturity of the Theming Interface

Currently, we have the default managed Win32 Classic theme and a native Windows VisualStyles theme. We would like to have native theming on Linux and OSX.

The best option we currently have for theming is the VisualStyles theme. On Windows, this calls the native Windows API and allows it to draw natively for us. Unfortunately, the System.Windows.Forms.VisualStyles namespace is not currently implemented on Linux or OSX. The best way forward would be to implement this namespace on those platforms. (Alternatively, one could port Wine's uxtheme.dll and we could ship Clearlooks and Aqua themes that people have done.)

The VisualStyles namespace allows you to focus simply on drawing one element, like a "selected button" instead of having to try to sift through the theming code to find out how it draws a button.

History
-------

There were two previous attempts to implement System.Windows.Forms in Mono. These initial attempts were done on top of other toolkits: first Gtk, then Wine. Each one had its share of problems, causing it to be abandoned.

The Gtk effort had the following problems:

-   Mapping one toolkit's semantics to another was very hard.
-   It would be very cumbersome to map all events into WndProc events, the messaging system at the core of Windows.Forms.
-   The development effort happened early in the Mono life, with this very sporadic development effort, the code quickly became obsolete or bit-rotted.
-   Using this on other systems required a Gtk+ installation on the target system (OS X and embedded devices would have suffered the most).

The Wine effort could have been a successful approach, however there were several technical obstacles:

-   Multithreading support. Wine has a specific thread setup that is not compatible with Mono. While this was solvable, it would have required larger patches to Wine.
-   Dependencies. To have Mono and Wine interoperate, a glue library was required. This library required to know where Wine was installed to (we had a Wine patch that eased this requirement, but it was not accepted into Wine).
-   Moving target. Key functions in Wine changed often enough that with every Wine release we had to start over making our glue code work again, sometimes becoming incompatible with previous Wine versions.
-   Wine/Gdi+ interactions: The way System.Drawing had to be made compatible with Wine was extremely inefficient. Wine uses the GDI model (raster painting), while our System.Drawing implementation, built on top of Cairo, uses the GDI+ model (compositing model). Making them both talk was extremely inefficient as every transition from one model to the other required the bitmaps to be copied.

The current approach is to implement all controls fully in managed code, and uses an abstract theme interface to paint the widgets. The default theme interfaces renders the widgets using System.Drawing.

Webbrowser Control
------------------

Information about the WebBrowser control can be found on the [WebBrowser]({{ site.github.url }}/docs/gui/winforms/webbrowser/) page.

WinForms Designer
-----------------

For more information [check here]({{ site.github.url }}/old_site/WinForms_Designer "WinForms Designer").

