---
title: "CreatingCustomThemedGtkSharpWidgets"
lastmodified: '2009-07-10'
redirect_from:
  - /CreatingCustomThemedGtkSharpWidgets/
  - /User:MatjasMihelic/
---

CreatingCustomThemedGtkSharpWidgets
===================================

This document will try to highlight was is required to implement a custom Gtk\# widget that integrates properly with a Theme Engine.

Gtk\# based applications can be themed based on the user preferences. The themes control how applications look on the screen. Although the core widgets in Gtk\# already follow the guidelines developers that are implementing their own custom widgets need to pay special attention to make sure that their custom widgets render properly across different engines and looks.

For example, something that works like a button, should look like a button.

Writing the Widget
------------------

Here are some steps:

1.  Create one single instance of the widget you want to emulate
2.  Always load style on Expose
3.  Always resolve respective colors from that style

Step 1

As simple as this...

``` csharp
public static class Fakes
{
    private static Button button = null;
    /// <value>
    /// Provides button template
    /// </value>
    public static Button Button {
        get {
            if (button == null)
                button = new Button();
            return (button);
        }
    }
 
    private static Entry entry = null;
    /// <value>
    /// Provides entry template
    /// </value>
    public static Entry Entry {
        get {
            if (entry == null)
                entry = new Entry();
            return (entry);
        }
    }
}
```

With this you get two fake widgets. One for button and one for entry. Initialization should not be done in private part so you delay its initialization to as late as possible. First reason are resources used by application, but second is more important. You need to make sure to delay any widget initialization until Gtk.Application.Init() has been called. And since the only time these will be touched are during expose event of another widget, initialization already happened.

Step 2 and 3

Faking widget to look like normal Gtk+ entry widget. Using expose like that will survive any on the fly theme change and so on.

Example: Faking entry widget

``` csharp
protected override bool OnExposeEvent (Gdk.EventExpose evnt)
{
    // Take into consideration that expose event doesn't redraw whole widget
    // it just redraws region exposed to redraw
    // Whole area can be resolved by using widgets Allocation property
    rect = CALCULATE_MY_RECTANGLE;
    // Resolve widget you want to use, it can also be null
    Gtk.Widget wgd = this;
 
    // Load style based on fake
    Style myStyle = Rc.GetStyle (Fakes.Entry);
    base.OnExposeEvent (evnt);
 
    if (CONDITION_WIDGET_IS_SENSITIVE == false) {
        Gtk.Style.PaintFlatBox (myStyle, aArgs.Drawable, StateType.Insensitive,
                               ShadowType.In, rect, wdg, "entry_bg",
                               rect.X, rect.Y, rect.Width, rect.Height);
        Gtk.Style.PaintShadow(myStyle, aArgs.Drawable, StateType.Insensitive,
                              ShadowType.In, rect, wdg, "entry",
                              rect.X, rect.Y, rect.Width, rect.Height);
    }
    else if (CONDITION_WIDGET_IS_FOCUSED == true) {
        Gtk.Style.PaintFlatBox (myStyle, aArgs.Drawable, State,
                               ShadowType.In, rect, wdg, "entry_bg",
                               rect.X, rect.Y, rect.Width, rect.Height);
        Gtk.Style.PaintFocus (myStyle, aArgs.Drawable, State, clip, wdg, "entry",
                              rect.X, rect.Y, rect.Width, rect.Height);
        Gtk.Style.PaintShadow (myStyle, aArgs.Drawable, State,
                               ShadowType.In, rect, wdg, "entry",
                               rect.X, rect.Y, rect.Width, rect.Height);
    }
    else {
        Gtk.Style.PaintFlatBox (myStyle, aArgs.Drawable, State,
                               ShadowType.In, rect, wdg, "entry_bg",
                               rect.X, rect.Y, rect.Width, rect.Height);
        Gtk.Style.PaintShadow(myStyle, aArgs.Drawable, State,
                              ShadowType.In, rect, wdg, "entry",
                              rect.X, rect.Y, rect.Width, rect.Height);
    }
 
    // Dispose fake style
    myStyle.Dispose();
    myStyle = null;
}
```

**Warning:** It is very important to always resolve colors based on the style you copied (or any other for that matter).

Resolving colors goes like this:

``` csharp
 
Gdk.Color clr = myStyle.Backgrounds[(int) StateType.Normal];
```

