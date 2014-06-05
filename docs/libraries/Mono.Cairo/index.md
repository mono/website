---
layout: docpage
navgroup: docs
title: Mono.Cairo
permalink: /docs/libraries/Mono.Cairo/
---

Cairo is a low-level 2D vector drawing library. Various rendering backends (XRender, Win32) are already supported and more (ie. glitz -- OpenGL hardware accelerated backend) are on the way. The Mono.Cairo.dll assembly exposes the Cairo API to managed applications. The mapping is a pretty straightforward one, and the programming model is very close to the OpenGL model (although much simpler)

### More Resources

-   [Mono.Cairo Tutorial]({{site.github.url}}/docs/libraries/Mono.Cairo/tutorial/) - An in-depth guide to getting started with Cairo and Mono.
-   [Mono.Cairo Cookbook]({{site.github.url}}/docs/libraries/Mono.Cairo/cookbook) - Some short recipes to help spice up your Cairo usage.

### Using Cairo with Gtk/Gdk

A core class that does all the drawing is the `Cairo.Context` class. `Context` is always attached to a `Surface`. `Surface` can be window on the screen, an off-screen buffer or a static file on the disk.

To use Cairo in Gdk/Gtk applications, a `Context` with a `Gdk.Drawable` target surface is needed. It can be obtained using two methods:

-   Beginning in Gtk\# 2.8, the Gdk.CairoHelper class provides cairo access to Gdk drawables. You can create a cairo context for a given drawable:

<!-- -->

``` csharp
    Cairo.Context context = Gdk.CairoHelper.Create(drawable);
```

-   A second choice (recommended for older versions of Gtk) is to use a function provided in the [Mono.Cairo samples](http://anonsvn.mono-project.com/viewvc/trunk/mcs/class/Mono.Cairo/Samples/). This will work on all platforms and with older Gdk versions. The code in question resides in [sysdraw.cs](http://anonsvn.mono-project.com/viewvc/trunk/mcs/class/Mono.Cairo/Samples/gtk/sysdraw.cs?view=markup) and you can simply download & use this file in your project.

The best place to create and use the `Context` is the [ExposeEvent](http://www.go-mono.com/docs/monodoc.ashx?tlink=5@ecma%3a1351%23Widget%2fE%2f26) for the given widget. Usually you'll want to use the [Gtk.DrawingArea](http://www.go-mono.com/docs/monodoc.ashx?tlink=5@ecma%3a838%23DrawingArea%2f) for this task. An example implementation of the Expose event method:

``` csharp
void OnDrawingAreaExposed (object o, ExposeEventArgs args)
{
    DrawingArea area = (DrawingArea) o;
    using (Cairo.Context context = Gdk.CairoHelper.Create (area.GdkWindow)) {
 
        // Perform some drawing
 
        ((IDisposable) gr.Target).Dispose ();                               
    }
}
```

Notice that `Context` is manually disposed before we leave the function. This is required for the time being since garbage collecting is not yet supported in Mono.Cairo.

### Drawing simple primitives

Cairo drawing model works very much like a plotting machine. An abstract pen moves around the `Surface` area drawing lines and curves. The basic functions to handle the "plotting" are: [MoveTo](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a15%23Graphics%2fM%2f7), [LineTo](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a15%23Graphics%2fM%2f8), [CurveTo](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a15%23Graphics%2fM%2f9). These functions take [PointD](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a26%23PointD%2f) objects as the arguments. `PointD` is a two-dimensional coordinate where `X` and `Y` are expressed as `double`.

-   `Graphics.MoveTo (PointD coordinate)` will position the cursor/pen at the given coordinate
-   `Graphics.LineTo (PointD coordinate)` will make a straight line from the current pen position to the given coordinate. After calling this function the pen is located at the given coordinate.
-   `Graphics.CurveTo (PointD coordinate1, PointD coordinate2, PointD coordinate3)` draws a curved line from the current pen position to the coordinate3 position. Coordinates 1 & 2 act as control points and affect the shape of the curve (Bezier).

Having this in mind, we can draw a square using the following instructions:

``` csharp
PointD p1,p2,p3,p4;
p1 = new PointD (10,10);
p2 = new PointD (100,10);
p3 = new PointD (100,100);
p4 = new PointD (10,100);
 
// g is a Graphics object               
g.MoveTo (p1);
g.LineTo (p2);
g.LineTo (p3);
g.LineTo (p4);
g.LineTo (p1);
g.ClosePath ();
```

However, our plotter analogy ends here -- **nothing has been drawn to the surface yet**. At this point we only have an outlined path, which we made sure is closed (thanks to `ClosePath`). To actually draw the path we need to call the `Stroke` method (`g.Stroke ()`). To fill the path one would call `g.Fill ()`.

Notice, that the `Stroke` and `Fill` methods don't take any arguments. The color for the stroke/fill, pen width and other interesting parameters are taken from the `Graphics` at the moment of stroking/filling. In other words we can say that `Graphics` class acts like a state machine.

Here is a complete implementation of the `ExposeEvent` that draws a black square with a red border inside a Gtk.DrawingArea:

``` csharp
void OnDrawingAreaExposed (object o, ExposeEventArgs args)
{
    DrawingArea area = (DrawingArea) o;
    Cairo.Graphics g = Graphics.CreateDrawable (area.GdkWindow);
 
    PointD p1,p2,p3,p4;
    p1 = new PointD (10,10);
    p2 = new PointD (100,10);
    p3 = new PointD (100,100);
    p4 = new PointD (10,100);
 
    g.MoveTo (p1);
    g.LineTo (p2);
    g.LineTo (p3);
    g.LineTo (p4);
    g.LineTo (p1);
    g.ClosePath ();
 
    g.Color = new Color (0,0,0);
    g.FillPreserve ();
    g.Color = new Color (1,0,0);
    g.Stroke ();
 
    ((IDisposable) g.Target).Dispose ();                                      
    ((IDisposable) g).Dispose ();
}
```

[![CairoGtk 1.png]({{site.github.url}}/old_site/images/f/f2/CairoGtk_1.png)]({{site.github.url}}/old_site/images/f/f2/CairoGtk_1.png)

I used `FillPreserve` method instead of `Fill` because the latter destroys the current path. If you want to keep the path use `StrokePreserve` and `FillPreserve`.

Take a look at the [Graphics class members](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a15%23Graphics%2f%2a) for other functions used to outline paths (ie. `ArcTo`, `Rectangle`).

### Saving and restoring the Cairo state

As you have already noticed, most of the drawing parameters are controlled in a stated-based manner. Various `Graphics` properties you can set include:

-   [Color](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a15%23Graphics%2fP%2f3) -- to set the stroke/fill color. Color values (Red, Green, Blue, Alpha) are expressed in a 0 - 1 range (as `double`).
-   [LineWidth](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a15%23Graphics%2fP%2f7) -- to control the width of the stroke line.
-   [LineCap](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a15%23Graphics%2fP%2f8) -- controls the line capping (round, square, etc.)

This state-based approach is far more convenient than specifying all drawing parameters in a single function call (like it's done ie. in the low-level [Gdk](/index.php?title=Gdk&action=edit&redlink=1 "Gdk (page does not exist)") drawing methods). However, once you started creating your own custom drawing functions, you'll notice that it's hard to control all the state modifications spanned across multiple methods. In most cases you will not want to care about certain state modifiers assuming they're unset.

Cairo provides us with methods to control the state stack. The respective `Graphics` members are [Save](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a15%23Graphics%2fM%2f2) and [Restore](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a15%23Graphics%2fM%2f3).

`Grahics.Save` will copy the current state and push the copy on the top of the stack. `Graphics.Restore` will pop one state back from the stack. Clearly all the state-altering calls placed inside `Save`/`Restore` parenthesis are local.

It's a good programming practice to place *all* state modifications inside `Save`/`Restore` brackets. This way you can easily control the Cairo state and work on a "clean" (unpolluted) state in higher-level functions.

For example, you might create yourself the following function to draw a triangle:

``` csharp
void DrawTriangle (Cairo.Graphics g, double x, double y, bool fill)
{
    g.Save ();
 
    g.MoveTo (new PointD (x - 10, y + 10));
    g.LineTo (new PointD (x, y - 10));
    g.LineTo (new PointD (x + 10, y + 10));
    g.LineTo (new PointD (x - 10, y + 10));
    g.ClosePath ();
    g.Color = new Color (1,0,0);
 
    if (fill) 
        g.Fill ();
    else
        g.Stroke ();
 
    g.Restore ();
}
```

In this example, the state we have when entering the function remains same when leaving the function. The `Color` modification we perform is local.

### Filling shapes with gradients

In most cases the `Color` property is used as the fill/stroke solid color. You can, however, use a pattern as the fill/stroke pen. `Pattern` can be a gradient, a bitmap or a surface part. To draw using a pattern, you need to set the `Graphics.Pattern` property to a valid `Pattern` object. I will discuss only gradients here.

A handy subclass of the `Pattern` class is the `Gradient` class. Moreover, `Gradient` has two more sub-classes -- `LinearGradient` and `RadialGradient`. Gradients are built using the color-stops -- a concept known from image editing software.

To create a simple black-to-white gradient you might write:

``` csharp
Cairo.Gradient pat = new Cairo.LinearGradient (0, 0, 100, 100);
pat.AddColorStop (0, new Cairo.Color (0,0,0));
pat.AddColorStop (1, new Cairo.Color (1,1,1));
gr.Pattern = pat;
```

The four parameters (double) given to `LinearGradient` constructor specify a gradient vector (x0, y0, x1, y1). The first parameter given to `AddColorStop` is the offset (0 to 1). The point located at x0, y0 will have the color where offset = 0, while point located at x1,y1 will have a color of offset = 1. Other values are interpolated between the two. You can add as many color stops as you need. Bear in mind that colorstops can be used as a method to perform alpha blending (just use the four-params constructor for `Color`).

Here is a sample `ExposeEvent` that draws some smooth shapes.

``` csharp
void OnDrawingAreaExposed (object o, ExposeEventArgs args)
{
        DrawingArea area = (DrawingArea) o;
        Cairo.Graphics gr = CreateDrawable (area.GdkWindow);
 
        // Shape
        gr.MoveTo (new PointD (100,200));
        gr.CurveTo (new PointD (100,100), new PointD (100,100),
                    new PointD (200,100));
        gr.CurveTo (new PointD (200,200), new PointD (200,200),
                    new PointD (100,200));
        gr.ClosePath ();
 
        // Save the state to restore it later. That will NOT save the path
        gr.Save ();
        Cairo.Gradient pat = new Cairo.LinearGradient (100,200, 200, 100);
        pat.AddColorStop (0, new Cairo.Color (0,0,0,1));
        pat.AddColorStop (1, new Cairo.Color (1,0,0,1));
        gr.Pattern = pat;
 
        // Fill the path with pattern
        gr.FillPreserve ();
 
        // We "undo" the pattern setting here
        gr.Restore ();
 
        // Color for the stroke
        gr.Color = new Color (0,0,0);
 
        gr.LineWidth = 3;
        gr.Stroke ();
 
        ((IDisposable) gr.Target).Dispose ();
        ((IDisposable) gr).Dispose ();
}
```

[![CairoGtk 2.png]({{site.github.url}}/old_site/images/d/d2/CairoGtk_2.png)]({{site.github.url}}/old_site/images/d/d2/CairoGtk_2.png)

### Hints

-   Don't try to keep `Graphics` across multiple expose events, this will not work due to double-buffering
-   Don't try to use Cairo in threads other than the main (Gdk) thread.
-   If you need to draw sharp (crisp) 1 pixel lines, add 0.5 to the coordinates. This is related to how the anti-aliasing works. Normally a 1px line is drawn "between" two pixels, which means that two points get 1/2 of the color value (blur)
-   Don't assume Cairo is the ultimate answer to every drawing need. Raw [Gdk](/index.php?title=Gdk&action=edit&redlink=1 "Gdk (page does not exist)") pixbuf blitting is still much faster than Cairo drawing and [Pango](/index.php?title=Pango&action=edit&redlink=1 "Pango (page does not exist)") is a better choice if you need to perform advanced text rendering (wrapping, ellipsizing, etc.) Gdk and Pango routines can be used along with Cairo without any special tricks.
-   Color (and Alpha) values are expressed in a 0-1 range not 0-255 range.
-   Don't forget to manually dispose the `Graphics` and the target `Surface` at the end of the expose event. Automatic garbage collecting is not yet 100% working in Cairo.


