---
layout: docpage
navgroup: docs
title: "GtkSharp: Adjustments"
redirect_from:
  - /GtkSharp:_Adjustments/
---

Gtk\# has various widgets that can be visually adjusted by the user using the mouse or the keyboard, such as the range widgets, described in the Range Widgets section. There are also a few widgets that display some adjustable portion of a larger area of data, such as the text widget and the viewport widget.

Obviously, an application needs to be able to react to changes the user makes in range widgets. One way to do this would be to have each widget emit its own type of signal when its adjustment changes, and either pass the new value to the signal handler, or require it to look inside the widget's data structure in order to ascertain the value. But you may also want to connect the adjustments of several widgets together, so that adjusting one adjusts the others. The most obvious example of this is connecting a scrollbar to a panning viewport or a scrolling text area. If each widget has its own way of setting or getting the adjustment value, then the programmer may have to write their own signal handlers to translate between the output of one widget's signal and the "input" of another's adjustment setting function.

Gtk\# solves this problem using the Adjustment object, which is not a widget but a way for widgets to store and pass adjustment information in an abstract and flexible form. The most obvious use of Adjustment is to store the configuration parameters and values of range widgets, such as scrollbars and scale controls. However, since Adjustments are derived from Object, they have some special powers beyond those of normal data structures. Most importantly, they can emit signals, just like widgets, and these signals can be used not only to allow your program to react to user input on adjustable widgets, but also to propagate adjustment values transparently between adjustable widgets.

You will see how adjustments fit in when you see the other widgets that incorporate them: Progress Bars, Viewports, Scrolled Windows, and others.

Creating Adjustments
====================

Many of the widgets which use adjustment objects do so automatically, but some cases will be shown in later examples where you may need to create one yourself. You create an adjustment using:

``` csharp
Gtk.Object adjustment = new Adjustment( double value,
                               double lower,
                               double upper,
                               double stepIncrement,
                               double pageIncrement,
                               double pageSize );
```

The value argument is the initial value you want to give to the adjustment, usually corresponding to the topmost or leftmost position of an adjustable widget. The lower argument specifies the lowest value which the adjustment can hold. The stepIncrement argument specifies the "smaller" of the two increments by which the user can change the value, while the pageIncrement is the "larger" one. The pageSize argument usually corresponds somehow to the visible area of a panning widget. The upper argument is used to represent the bottom most or right most coordinate in a panning widget's child. Therefore it is not always the largest number that value can take, since the pageSize of such widgets is usually non-zero.

Using Adjustments
=================

The adjustable widgets can be roughly divided into those which use and require specific units for these values and those which treat them as arbitrary numbers.

Specific Unit Adjustments
-------------------------

The other group which treats the values as specific units includes the text widget, the viewport widget, the compound list widget, and the scrolled window widget. All of these widgets use pixel values for their adjustments. These are also all widgets which are typically "adjusted" indirectly using scrollbars. While all widgets which use adjustments can either create their own adjustments or use ones you supply, you'll generally want to let this particular category of widgets create its own adjustments. Usually, they will eventually override all the values except the value itself in whatever adjustments you give them, but the results are, in general, undefined (meaning, you'll have to read the source code to find out, and it may be different from widget to widget).

Now, you're probably thinking, since text widgets and viewports insist on setting everything except the value of their adjustments, while scrollbars will only touch the adjustment's value, if you share an adjustment object between a scrollbar and a text widget, manipulating the scrollbar will automagically adjust the viewport widget? Of course it will! Just like this:

``` csharp
  /* creates its own adjustments */
  Viewport viewport = new Viewport(null, null);
  /* uses the newly-created adjustment for the scrollbar as well */
  VScrollbar vscrollbar = new VScrollbar(viewport.Adjustment);
```

Arbitrary Number Adjustments
----------------------------

The other group includes the range widgets (scrollbars and scales, the progress bar widget, and the spin button widget). These widgets are all the widgets which are typically "adjusted" directly by the user with the mouse or keyboard. They will treat the lower and upper values of an adjustment as a range within which the user can manipulate the adjustment's value. By default, they will only modify the value of an adjustment.

