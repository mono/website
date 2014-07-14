---
layout: docpage
navgroup: docs
title: "GtkSharp: Scrollbar Widgets"
---

[http:/monodoc/T:Gtk.Range Range] widgets are your standard, run-of-the-mill scrollbars. These should be used only for scrolling some other widget, such as a list, a text box, or a viewport (and it's generally easier to use the scrolled window widget in most cases). For other purposes, you should use scale widgets, as they are friendlier and more featureful.

There are separate types for horizontal and vertical scrollbars. There really isn't much to say about these. You create them with the following functions:

``` csharp
HScrollbar hscrollbar1 = new HScrollbar( adjustment );
VScrollbar vscrollbar1 = new VScrollbar( adjustment );
```

and that's about it. The adjustment argument can either be a pointer to an existing Adjustment, or NULL, in which case one will be created for you. Specifying `null` might actually be useful in this case, if you wish to pass the newly-created adjustment to the constructor function of some other widget which will configure it for you, such as a text widget.

