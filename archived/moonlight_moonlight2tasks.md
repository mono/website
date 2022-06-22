---
title: "Moonlight/Moonlight2Tasks"
lastmodified: '2009-02-08'
redirect_from:
  - /Moonlight/Moonlight2Tasks/
---

Moonlight/Moonlight2Tasks
=========================

Moonlight 2 Tasks
=================

There's a lot of stuff in SL2.0, and there are many interconnected dependencies. Let's put a list of all the discrete chunks we can think of, and try to fill in (using whatever terms we feel comfortable with) a list of dependencies for that chunk.

Most importantly - don't worry about formatting the list, or keeping things very consistent. Just dump everything here and we can clean it up. The most important thing is getting everything down.

-   Property "precedence"
    -   Local values [Done]
    -   Bindings [Done]
    -   Styles [Done]

-   DataBinding (owner: alan, jeff)
    -   Parser changes to provide support for {Binding} syntax (owner: jeff)
    -   DependencyObject changes to support looking up databindings by property (is this needed in SL?) [Done]

-   Layout (owner: lewing)
    -   Integrating it into the dirty passes

-   Unit test harness (owner: rolf)
    -   Silverlight Toolkit test harness was MSPL'ed. see if we can roll it in and start using it. [Done]

-   Application.Current
    -   Make Application.Current work with as little code change as possible in our "multiple surfaces per AppDomain" model. [Partially Done]

-   Media changes (fer)
    -   Adaptive Streaming API (managed API to feed media packets)
    -   HTTP/1.1 seeking
        -   MediaStreamSource and this require a major rewrite of the sync portions of our pipeline to be async.
    -   ms-codecs support for WMA 10
    -   Server-Side Playlists (.wsx files)
    -   DRM
    -   MediaElement changes
        -   State changes for DRM
        -   DroppedFramesPerSecond and RenderedFramesPerSecond properties [Done]

-   Controls and related machinery -- it's unclear what's going to be MSPL'ed, and some of these are essentially either done or mostly working.
    -   Border
    -   ComboBox
    -   ContentPresenter
    -   MultiScaleImage (owner: sde)
    -   Grid
    -   PasswordBox **Blocking on textbox**
    -   ProgressBar (owner: sde)
    -   ScrollContentPresenter
    -   TextBox (owner: jeff)

-   VisualStateManager
    -   Check out MSPL'ed release of WPF Toolkit version. we should be able to use it. [Done]

-   Bridge to the plugin (Web APIs)
    -   Done

-   Bitmap Source needs to be rewritten
    -   Done

-   Dispatcher needs to be rewritten in the way that Larry described on the Nov 17th call.
    -   Done

-   System.Windows.Automation
    -   Required for running the SL 2 test suite.

-   Mono Base Class Libraries (BCL) adaptation
    -   Mono Linker (jb)
    -   Additions / changes to the BCL
        -   IsolatedStorage (spouliot)
    -   Unit tests (port existing or new)
    -   Security Review
    -   Security (CoreCLR) Conformance (spouliot)

-   Mono Runtime/JIT integration
    -   Surface Reduction (lupus)
    -   Security Review

-   Networking
    -   Complete sockets and cross-domain permission code.
    -   WCF client side code and support infrastructure
    -   Support the two threading models used by web clients in Silverlight.

Specific things we need for the PDC player
------------------------------------------

[example player url](http://channel9.msdn.com/pdc2008/PC54/)

-   Layout
    -   larry
-   Parser fixes (for VisualStateManager, as well as in the PDC player's case referencing Application using a clr-namespace instead of the \<Application\> tag).
    -   jackson
-   Grid control
-   Border control
-   TextBox control
-   StackPanel control **(vertical stacking done)**
    -   shana
-   ToggleButton control **(should be completely managed. start with b1 controls source drop)**
    -   This is blocked until DataTemplate is implemented
    -   rolf
-   **Slider** control **(should be done)**
    -   inherits from **RangeBase**, depends on **RepeatButton** and **Thumb** primitives
    -   spouliot
-   VisualStateManager, VisualStateGroup, VisualTransition, VisualState **(pull in from WPF Controls Toolkit)**
    -   sde
-   ControlTemplate **(should be done)**
    -   toshok
-   Style/Setter [Done]
    -   alan/jeff
-   StaticResource - used for templates and styles only **(should be done)**
    -   toshok
-   Missing **Control** features (should be done)
