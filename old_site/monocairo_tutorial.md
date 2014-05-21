---
layout: obsolete
title: "Mono.Cairo Tutorial"
lastmodified: '2008-06-07'
permalink: /old_site/Mono.Cairo_Tutorial/
redirect_from:
  - /Mono.Cairo_Tutorial/
---

Mono.Cairo Tutorial
===================

This tutorial is derived from Michael Urman's [cairo tutorial](http://www.tortall.net/mu/wiki/CairoTutorial) for python. The original code snippets have been translated to C\#, the text has only been changed as much as necessary. Translation to C\# done by mgsloan.

Cairo is a powerful 2d graphics library. This document introduces you to how cairo works and many of the functions you will use to create the graphic experience you desire.

In order to follow along on your computer, you need the following things:

1.  Cairo itself. You will need both the library and the development files. [Download it](http://cairographics.org/download/) if you don't have it already.
2.  [Download Mono]({{site.github.url}}/Downloads), if you haven't already - you will need it to compile the C\# code, and for the Mono.Cairo library.

<!-- -->

     If you want to see the code snippets included in this tutorial in
     action, you can try to click on some of the images. You will get a
     small C# program which includes the described drawing code.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#cairos-drawing-model">1 Cairo's Drawing Model</a>
<ul>
<li><a href="#nouns">1.1 Nouns</a>
<ul>
<li><a href="#destination">1.1.1 Destination</a></li>
<li><a href="#source">1.1.2 Source</a></li>
<li><a href="#mask">1.1.3 Mask</a></li>
<li><a href="#path">1.1.4 Path</a></li>
<li><a href="#context">1.1.5 Context</a></li>
</ul></li>
<li><a href="#verbs">1.2 Verbs</a>
<ul>
<li><a href="#stroke">1.2.1 Stroke</a></li>
<li><a href="#fill">1.2.2 Fill</a></li>
<li><a href="#show-text--glyphs">1.2.3 Show Text / Glyphs</a></li>
<li><a href="#paint">1.2.4 Paint</a></li>
<li><a href="#mask_2">1.2.5 Mask</a></li>
</ul></li>
</ul></li>
<li><a href="#drawing-with-cairo">2 Drawing with Cairo</a>
<ul>
<li><a href="#preparing-and-selecting-a-source">2.1 Preparing and Selecting a Source</a></li>
<li><a href="#creating-a-path">2.2 Creating a Path</a>
<ul>
<li><a href="#moving">2.2.1 Moving</a></li>
<li><a href="#straight-lines">2.2.2 Straight Lines</a></li>
<li><a href="#arcs">2.2.3 Arcs</a></li>
<li><a href="#curves">2.2.4 Curves</a></li>
<li><a href="#close-the-path">2.2.5 Close the path</a></li>
<li><a href="#text">2.2.6 Text</a></li>
</ul></li>
</ul></li>
<li><a href="#understanding-text">3 Understanding Text</a></li>
<li><a href="#working-with-transforms">4 Working with Transforms</a></li>
<li><a href="#where-to-go-next">5 Where to Go Next</a></li>
<li><a href="#tips-and-tricks">6 Tips and Tricks</a>
<ul>
<li><a href="#line-width">6.1 Line Width</a></li>
<li><a href="#text-alignment">6.2 Text Alignment</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Cairo's Drawing Model
---------------------

In order to explain the operations used by cairo, we first delve into a model of how cairo models drawing. There are only a few concepts involved, which are then applied over and over by the different methods. First I'll describe the [nouns](#nouns): [destination](#destination), [source](#source), [mask](#mask), [path](#path), and [context](#context). After that I'll describe the [verbs](#verbs) which offer ways to manipulate the nouns and draw the graphics you wish to create.

### Nouns

Cairo's nouns are somewhat abstract. To make them concrete I'm including diagrams that depict how they interact. The first three nouns are the three layers in the diagrams you see in this section. The fourth noun, the path, is drawn on the middle layer when it is relevant. The final noun, the context, isn't shown.

#### Destination

[![Cairo destination.png]({{site.github.url}}/old_site/images/a/a2/Cairo_destination.png)]({{site.github.url}}/old_site/images/a/a2/Cairo_destination.png)

The destination is the [surface](http://go-mono.com/docs/monodoc.ashx?link=T%3aCairo.Surface) on which you're drawing. It may be tied to an array of pixels like in this tutorial, or it might be tied to a SVG or PDF file, or something else. This surface collects the elements of your graphic as you apply them, allowing you to build up a complex work as though painting on a canvas.

#### Source

[![Cairo source.png]({{site.github.url}}/old_site/images/6/63/Cairo_source.png)]({{site.github.url}}/old_site/images/6/63/Cairo_source.png)

The source is the "paint" you're about to work with. I show this as it is—plain black for several examples—but translucent to show lower layers. Unlike real paint, it doesn't have to be a single color; it can be a [pattern](http://go-mono.com/docs/monodoc.ashx?link=T%3aCairo.Pattern) or even a previously created destination [surface](http://go-mono.com/docs/monodoc.ashx?link=T%3aCairo.Surface). Also unlike real paint it can contain transparency information—the Alpha channel.

#### Mask

[![Cairo the-mask.png]({{site.github.url}}/old_site/images/9/9d/Cairo_the-mask.png)]({{site.github.url}}/old_site/images/9/9d/Cairo_the-mask.png)

The mask is the most important piece: it controls where you apply the source to the destination. I will show it as a yellow layer with holes where it lets the source through. When you apply a drawing verb, it's like you stamp the source to the destination. Anywhere the mask allows, the source is copied. Anywhere the mask disallows, nothing happens.

#### Path

The path is somewhere between part of the mask and part of the context. I will show it as thin green lines on the mask layer. It is manipulated by path verbs, then used by drawing verbs.

#### Context

The context keeps track of everything that verbs affect. It tracks one source, one destination, and one mask. It also tracks several helper variables like your line width and style, your font face and size, and more. Most importantly it tracks the path, which is turned into a mask by drawing verbs.

Before you can start to draw something with cairo, you need to create the [Context](http://go-mono.com/docs/monodoc.ashx?link=T%3aCairo.Context). When you create a cairo context, it must be tied to a specific [Surface](http://go-mono.com/docs/monodoc.ashx?link=T%3aCairo.Surface) —for example, an [ImageSurface](http://go-mono.com/docs/monodoc.ashx?link=T%3aCairo.ImageSurface) if you want to create a PNG file. You can initialize your cairo context like this:

``

    ImageSurface surface = new ImageSurface(Format.RGV24, 120, 120);
    Context cr = new Context(surface);

The cairo context in this example is tied to an image surface of dimension 120 x 120 and 32 bits per pixel to store RGB and Alpha information. Surfaces can be created specific to most cairo backends, see the [manual](http://go-mono.com/docs/monodoc.ashx?tlink=0%40N%3aCairo) for details.

### Verbs

The reason you are using cairo in a program is to draw. Cairo internally draws with one fundamental drawing operation: the source and mask are freely placed somewhere over the destination. Then the layers are all pressed together and the paint from the source is transferred to the destination wherever the mask allows it. To that extent the following five drawing verbs, or operations, are all similar. They differ by how they construct the mask.

#### Stroke

[![]({{site.github.url}}/old_site/images/b/b7/Cairo_stroke.png)]({{site.github.url}}/old_site/images/b/b7/Cairo_stroke.png)

[View Source](http://mgsloan.nfshost.com/cairo_tut/stroke.cs)

The [Stroke](http://go-mono.com/docs/monodoc.ashx?link=M%3aCairo.Context.Stroke()) operation takes a virtual pen along the path. It allows the source to transfer through the mask in a thin (or thick) line around the path, according to the pen's [line width](http://go-mono.com/docs/monodoc.ashx?link=P%3aCairo.Context.LineWidth), [line caps](http://go-mono.com/docs/monodoc.ashx?link=P%3aCairo.Context.LineCap), [line join](http://go-mono.com/docs/monodoc.ashx?link=P%3aCairo.Context.LineJoin), and [dash style](http://go-mono.com/docs/monodoc.ashx?link=M%3aCairo.Context.SetDash(System.Double%5b%5d%2cSystem.Double)).

``

    cr.LineWidth = 0.1;
    cr.Color = new Color(0, 0, 0);
    cr.Rectangle(0.25, 0.25, 0.5, 0.5);
    cr.Stroke();

#### Fill

[![]({{site.github.url}}/old_site/images/7/7e/Cairo_fill.png)]({{site.github.url}}/old_site/images/7/7e/Cairo_fill.png)

[View Source](http://mgsloan.nfshost.com/cairo_tut/fill.cs)

The [Fill](http://go-mono.com/docs/monodoc.ashx?link=M%3aCairo.Context.Fill()) operation instead uses the path like the lines of a coloring book, and allows the source through the mask within the hole whose boundaries are the path. For complex paths (paths with multiple closed sub-paths—like a donut—or paths that self-intersect) this is influenced by the [fill rule](http://go-mono.com/docs/monodoc.ashx?link=P%3aCairo.Context.FillRule). Note that while stroking the path transfers the source for half of the line width on each side of the path, filling a path fills directly up to the edge of the path and no further.

``

    cr.Color = new Color(0, 0, 0);
    cr.SetSourceRGB(0, 0, 0);
    cr.Rectangle(0.25, 0.25, 0.5, 0.5);
    cr.Fill();

#### Show Text / Glyphs

[![]({{site.github.url}}/old_site/images/2/2b/Cairo_showtext.png)]({{site.github.url}}/old_site/images/2/2b/Cairo_showtext.png)

[View Source](http://mgsloan.nfshost.com/cairo_tut/showtext.cs)

The [ShowText](http://go-mono.com/docs/monodoc.ashx?link=M%3aCairo.Context.ShowText(System.String)) operation forms the mask from text. It may be easier to think of ShowText as a shortcut for creating a path with [TextPath](http://go-mono.com/docs/monodoc.ashx?link=M%3aCairo.Context.TextPath(System.String)) and then using [Fill](http://go-mono.com/docs/monodoc.ashx?link=M%3aCairo.Context.Fill()) to transfer it. Be aware that ShowText caches glyphs so is much more efficient if you work with a lot of text.

``

    cr.Color = new Color(0, 0, 0);
    cr.SelectFontFace("Georgia", FontSlant.Normal, FontWeight.Bold);
    cr.SetFontSize(1.2);
    TextExtents te = cr.TextExtents("a");
    cr.MoveTo(0.5 - te.Width  / 2 - te.XBearing,
              0.5 - te.Height / 2 - te.YBearing);
    cr.ShowText("a");

#### Paint

[![]({{site.github.url}}/old_site/images/8/83/Cairo_paint.png)]({{site.github.url}}/old_site/images/8/83/Cairo_paint.png)

[View Source](http://mgsloan.nfshost.com/cairo_tut/paint.cs)

The [Paint](http://go-mono.com/docs/monodoc.ashx?link=M%3aCairo.Context.Paint()) operation uses a mask that transfers the entire source to the destination. Some people consider this an infinitely large mask, and others consider it no mask; the result is the same. The related operation [PaintWithAlpha](http://go-mono.com/docs/monodoc.ashx?link=M%3aCairo.Context.PaintWithAlpha(System.Double)) similarly allows transfer of the full source to destination, but it transfers only the provided percentage of the color.

``

    cr.Color = new Color(0, 0, 0);
    cr.PaintWithAlpha(0.5);

#### Mask

[![]({{site.github.url}}/old_site/images/e/ee/Cairo_mask.png)]({{site.github.url}}/old_site/images/e/ee/Cairo_mask.png)

[View Source](http://mgsloan.nfshost.com/cairo_tut/mask.cs)

The [Mask](http://go-mono.com/docs/monodoc.ashx?link=M%3aCairo.Context.Mask(Cairo.Pattern)) and [MaskSurface](http://go-mono.com/docs/monodoc.ashx?link=M%3aCairo.Context.MaskSurface(Cairo.Surface%2cSystem.Double%2cSystem.Double)) operations allow transfer according to the transparency/opacity of a second source pattern or surface. Where the pattern or surface is opaque, the current source is transferred to the destination. Where the pattern or surface is transparent, nothing is transferred.

``

    Gradient linpat = new LinearGradient(0, 0, 1, 1);
    linpat.AddColorStop(0, new Color(0, 0.3, 0.8));
    linpat.AddColorStop(1, new Color(1, 0.8, 0.3));

    Gradient radpat = new RadialGradient(0.5, 0.5, 0.25, 0.5, 0.5, 0.6);
    radpat.AddColorStop(0, new Color(0, 0, 0, 1));
    radpat.AddColorStop(1, new Color(0, 0, 0, 0));

    cr.Source = linpat;
    cr.Mask(radpat);

Drawing with Cairo
------------------

In order to create an image you desire, you have to prepare the [context](http://go-mono.com/docs/monodoc.ashx?link=T%3aCairo.Context) for each of the drawing verbs. To use [Stroke](http://go-mono.com/docs/monodoc.ashx?link=M%3aCairo.Context.Stroke()) or [Fill](http://go-mono.com/docs/monodoc.ashx?link=M%3aCairo.Context.Fill()) you first need a path. To use [ShowText](http://go-mono.com/docs/monodoc.ashx?link=M%3aCairo.Context.ShowText(System.String)) you must position your text by its insertion point. To use [Mask](http://go-mono.com/docs/monodoc.ashx?link=M%3aCairo.Context.Mask(Cairo.Pattern)) you need a second source [pattern](http://go-mono.com/docs/monodoc.ashx?link=T%3aCairo.Pattern) or [surface](http://go-mono.com/docs/monodoc.ashx?link=T%3aCairo.Surface). And to use any of the operations, including [cairo\_paint()](http://go-mono.com/docs/monodoc.ashx?link=M%3aCairo.Context.Paint()), you need a primary source.

### Preparing and Selecting a Source

There are three main kinds of sources in cairo: colors, gradients, and images. Colors are the simplest; they use a uniform hue and opacity for the entire source. You can select these without any preparation by setting the [Color](http://www.go-mono.com/docs/monodoc.ashx?link=P%3aCairo.Context.Color) property.

[![]({{site.github.url}}/old_site/images/c/cb/Cairo_setsourcergba.png)]({{site.github.url}}/old_site/images/c/cb/Cairo_setsourcergba.png)

[[1]](http://mgsloan.nfshost.com/cairo_tut/setsourcergba.cs)

``

    cr.Color = new Color(0, 0, 0);
    cr.MoveTo(0, 0);
    cr.LineTo(1, 1);
    cr.MoveTo(1, 0);
    cr.LineTo(0, 1);
    cr.LineWidth = 0.2;
    cr.Stroke();

    cr.Rectangle(0, 0, 0.5, 0.5);
    cr.Color = new Color(1, 0, 0, 0.80);
    cr.Fill();

    cr.Rectangle(0, 0.5, 0.5, 0.5);
    cr.Color = new Color(0, 1, 0, 0.60);
    cr.Fill();

    cr.Rectangle(0.5, 0, 0.5, 0.5);
    cr.Color = new Color(0, 0, 0, 0.40);
    cr.Fill();

Gradients describe a progression of colors by setting a start and stop reference location and a series of "stops" along the way. [Linear gradients](http://go-mono.com/docs/monodoc.ashx?link=T%3aCairo.LinearGradient) are built from two points which pass through parallel lines to define the start and stop locations. [Radial gradients](http://go-mono.com/docs/monodoc.ashx?link=T%3aCairo.RadialGradient) are also built from two points, but each has an associated radius of the circle on which to define the start and stop locations. Stops are added to the gradient with [AddColorStop](http://go-mono.com/docs/monodoc.ashx?link=M%3aCairo.Gradient.AddColorStop(System.Double%2cCairo.Color)) and [AddColorStopRgb](http://go-mono.com/docs/monodoc.ashx?link=M%3aCairo.Gradient.AddColorStopRgb(System.Double%2cCairo.Color)). These methods take an offset (to indicate where it lies between the reference locations) and color. The colors between adjacent stops are averaged over space to form a smooth blend.

[![]({{site.github.url}}/old_site/images/1/19/Cairo_setsourcegradient.png)]({{site.github.url}}/old_site/images/1/19/Cairo_setsourcegradient.png)

[View Source](http://mgsloan.nfshost.com/cairo_tut/setsourcegradient.cs)

``

    Gradient radpat = new RadialGradient(0.25, 0.25, 0.1, 0.5, 0.5, 0.5);
    radpat.AddColorStop(0, new Color(1.0, 0.8, 0.8));
    radpat.AddColorStop(1, new Color(0.9, 0.0, 0.0));

    for (int i=1; i<10; i++)
        for (int j=1; j<10; j++)
            cr.Rectangle(i/10.0 - 0.04, j/10.0 - 0.04, 0.08, 0.08);
    cr.Source = radpat;
    cr.Fill();

    Gradient linpat = new LinearGradient(0.25, 0.35, 0.75, 0.65);
    linpat.AddColorStop(0.00, new Color(1, 1, 1, 0));
    linpat.AddColorStop(0.25, new Color(0, 1, 0, 0.5));
    linpat.AddColorStop(0.50, new Color(1, 1, 1, 0));
    linpat.AddColorStop(0.75, new Color(0, 0, 1, 0.5));
    linpat.AddColorStop(1.00, new Color(1, 1, 1, 0));

    cr.Rectangle(0.0, 0.0, 1, 1);
    cr.Source = linpat;
    cr.Fill();

Images include both surfaces loaded from existing files with [ImageSurface(filename)](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a22%23ImageSurface%2fC%2f0) and surfaces created from within cairo as an earlier destination. As of cairo 1.2, the easiest way to make and use an earlier destination as a source is with [PushGroup](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a4%23Context%2fM%2fPushGroup) and either [PopGroup](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a4%23Context%2fM%2f61) or [PopGroupToSource](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a4%23Context%2fM%2f62).

Use `PopGroupToSource` to use it just until you select a new source, and `PopGroup` when you want to save it so you can set the Context's Source to it repeatedly.

### Creating a Path

Cairo always has an active path. If you call [Stroke](#stroke) it will draw the path with your line settings. If you call [Fill](#fill) it will fill the inside of the path. But as often as not, the path is empty, and both calls will result in no change to your destination. Why is it empty so often? For one, it starts that way; but more importantly after each [Stroke](#stroke) or [Fill](#fill) it is emptied again to let you start building your next path.

What if you want to do multiple things with the same path? For instance to draw a red rectangle with a black border, you would want to fill the rectangle path with a red source, then stroke the same path with a black source. A rectangle path is easy to create multiple times, but a lot of paths are more complex.

Cairo supports easily reusing paths by having alternate versions of its operations. Both draw the same thing, but the alternate doesn't reset the path. For stroking, alongside [Stroke](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a4%23Context%2fM%2f14) there is [Stroke Preserve](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a4%23Context%2fM%2f28); for filling, [FillPreserve](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a4%23Context%2fM%2f16) joins [Fill](http://www.go-mono.com/docs/index.aspx?tlink=0@ecma%3a4%23Context%2fM%2f15). Even setting the clip has a preserve variant. Apart from choosing when to preserve your path, there are only a couple common operations.

#### Moving

[![Cairo path-moveto.png]({{site.github.url}}/old_site/images/1/1c/Cairo_path-moveto.png)]({{site.github.url}}/old_site/images/1/1c/Cairo_path-moveto.png)

Cairo uses a connect-the-dots style system when creating paths. Start at 1, draw a line to 2, then 3, and so forth. When you start a path, or when you need to start a new sub-path, you want it to be like point 1: it has nothing connecting to it. For this, use [MoveTo](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a4%23Context%2fM%2fMoveTo). This sets the current reference point without making the path connect the previous point to it. There is also a relative coordinate variant, [RelMoveTo](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a4%23Context%2fM%2fRelMoveTo), which sets the new reference a specified distance away from the current reference instead. After setting your first reference point, use the other path operations which both update the reference point and connect to it in some way.

``

    cr.MoveTo(0.25, 0.25);

#### Straight Lines

[![Cairo path-lineto.png]({{site.github.url}}/old_site/images/a/a1/Cairo_path-lineto.png)]({{site.github.url}}/old_site/images/a/a1/Cairo_path-lineto.png)

Whether with absolute coordinates [LineTo](http://www.go-mono.com/docs/index.aspx?tlink=0@ecma%3a4%23Context%2fM%2f15) (extend the path from the reference to this point), or relative coordinates [RelLineTo](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a4%23Context%2fM%2fRelLineTo) (extend the path from the reference this far in this direction), the path connection will be a straight line. The new reference point will be at the other end of the line.

``

    cr.LineTo(0.5, 0.375);
    cr.RelLineTo(0.25, -0.125);

#### Arcs

[![Cairo path-arcto.png]({{site.github.url}}/old_site/images/1/1e/Cairo_path-arcto.png)]({{site.github.url}}/old_site/images/1/1e/Cairo_path-arcto.png)

Arcs are parts of the outside of a circle. Unlike straight lines, the point you directly specify is not on the path. Instead it is the center of the circle that makes up the addition to the path. Both a starting and ending point on the circle must be specified, and these points are connected either clockwise by [Arc](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a4%23Context%2fM%2f10) or counter-clockwise by [ArcNegative](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a4%23Context%2fM%2f11) If the previous reference point is not on this new curve, a straight line is added from it to where the arc begins. The reference point is then updated to where the arc ends. There are only absolute versions.

``

    cr.Arc(0.5, 0.5, 0.25 * Math.Sqrt(2), -0.25 * Math.PI, 0.25 * Math.PI);

#### Curves

[![Cairo path-curveto.png]({{site.github.url}}/old_site/images/c/c4/Cairo_path-curveto.png)]({{site.github.url}}/old_site/images/c/c4/Cairo_path-curveto.png)

Curves in cairo are cubic BÃ©zier splines. They start at the current reference point and smoothly follow the direction of two other points (without going through them) to get to a third specified point. Like lines, there are both absolute ([CurveTo](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a4%23Context%2fM%2fCurveTo)) and relative ([RelCurveTo](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a4%23Context%2fM%2fRelCurveTo)) versions. Note that the relative variant specifies all points relative to the previous reference point, rather than each relative to the preceding control point of the curve.

``

    cr.RelCurveTo(-0.25, -0.125, -0.25, 0.125, -0.5, 0);

#### Close the path

[![]({{site.github.url}}/old_site/images/d/d0/Cairo_path-close.png)]({{site.github.url}}/old_site/images/d/d0/Cairo_path-close.png)

[View Source](http://mgsloan.nfshost.com/cairo_tut/path-close.cs)

Cairo can also close the path by drawing a straight line to the beginning of the current sub-path. This straight line can be useful for the last edge of a polygon, but is not directly useful for curve-based shapes. A closed path is fundamentally different from an open path: it's one continuous path and has no start or end. A closed path has no line caps for there is no place to put them.

``

    cr.ClosePath();

#### Text

Finally text can be turned into a path with [TextPath](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a4%23Context%2fM%2f27). Paths created from text are like any other path, supporting stroke or fill operations. This path is placed anchored to the current reference point, so [MoveTo](#moving) your desired location before turning text into a path. However there are performance concerns to doing this if you are working with a lot of text; when possible you should prefer using the verb [ShowText](#show-text--glyphs) over TextPath and [Fill](http://www.go-mono.com/docs/index.aspx?tlink=0@ecma%3a4%23Context%2fM%2f15).

Understanding Text
------------------

[![]({{site.github.url}}/old_site/images/9/9d/Cairo_textextents.png)]({{site.github.url}}/old_site/images/9/9d/Cairo_textextents.png)

[View Source](http://mgsloan.nfshost.com/cairo_tut/textextents.cs)

To use text effectively you need to know where it will go. The methods [FontExtents](http://www.go-mono.com/docs/monodoc.ashx?link=P%3aCairo.Context.FontExtents) and [TextExtents](http://www.go-mono.com/docs/monodoc.ashx?link=M%3aCairo.Context.TextExtents(System.String)) get you this information. Since this diagram is hard to see so small, I suggest getting its [source](http://mgsloan.nfshost.com/cairo_tut/textextents.cs) and bump the size up to 600. It shows the relation between the reference point (red dot); suggested next reference point (blue dot); bounding box (dashed blue lines); bearing displacement (solid blue line); and height, ascent, baseline, and descent lines (dashed green).

The reference point is always on the baseline. The descent line is below that, and reflects a rough bounding box for all characters in the font. However it is an artistic choice intended to indicate alignment rather than a true bounding box. The same is true for the ascent line above. Next above that is the height line, the artist-recommended spacing between subsequent baselines. All three of these are reported as distances from the baseline, and expected to be positive despite their differing directions.

The bearing is the displacement from the reference point to the upper-left corner of the bounding box. It is often zero or a small positive value for x displacement, but can be negative x for characters like j as shown; it's almost always a negative value for y displacement. The width and height then describe the size of the bounding box. The advance takes you to the suggested reference point for the next letter. Note that bounding boxes for subsequent blocks of text can overlap if the bearing is negative, or the advance is smaller than the width would suggest.

In addition to placement, you also need to specify a face, style, and size. Set the face and style together with [SelectFontFace](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a4%23Context%2fM%2f50), and the size with [SetFontSize](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a4%23Context%2fM%2f51). If you need even finer control, try modifying a [FontOptions struct](http://www.go-mono.com/docs/monodoc.ashx?link=T%3aCairo.FontOptions) with [FontOptions property](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a4%23Context%2fP%2f19).

Working with Transforms
-----------------------

Transforms have three major uses. First they allow you to set up a coordinate system that's easy to think in and work in, yet have the output be of any size. Second they allow you to make helper functions that work at or around a (0, 0) but can be applied anywhere in the output image. Thirdly they let you deform the image, turning a circular arc into an elliptical arc, etc. Transforms are a way of setting up a relation between two coordinate systems. The device-space coordinate system is tied to the surface, and cannot change. The user-space coordinate system matches that space by default, but can be changed for the above reasons. The helper functions [TransformPoint](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a4%23Context%2fM%2f53) and [TransformDistance](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a4%23Context%2fM%2f54) tell you what the device-coordinates are for a user-coordinates position or distance. Correspondingly [InverseTransformPoint](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a4%23Context%2fM%2f55) and [InverseTransformDistance](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a4%23Context%2fM%2f56) tell you user-coordinates for a device-coordinates position or distance. Remember to send positions through the non-distance variant, and relative moves or other distances through the distance variant.

I leverage all of these reasons to draw the diagrams in this document. Whether I'm drawing 120 x 120 or 600 x 600, I use [Scale](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a4%23Context%2fM%2f21) to give me a 1.0 x 1.0 workspace. To place the results along the right column, such as in the discussion of [cairo's drawing model](#drawing-model), I use [Translate](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a4%23Context%2fM%2f22). And to add the perspective view for the overlapping layers, I set up an arbitrary deformation with [Transform](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a4%23Context%2fM%2f52).

To understand your transforms, read them bottom to top, applying them to the point you're drawing. To figure out which transforms to create, think through this process in reverse. For example if I want my 1.0 x 1.0 workspace to be 100 x 100 pixels in the middle of a 120 x 120 pixel surface, I can set it up one of three ways:

1.  `cr.Translate(10, 10); cr.Scale(100, 100); `
2.  `cr.Scale(100, 100); cr.Translate(0.1, 0.1); `
3.  `cr.Transform(Matrix(100, 0, 0, 100, 10, 10)); `

Use the first when relevant because it is often the most readable; use the third when necessary to access additional control not available with the primary functions.

Be careful when trying to draw lines while under transform. Even if you set your line width while the scale factor was 1, the line width setting is always in user-coordinates and isn't modified by setting the scale. While you're operating under a scale, the width of your line is multiplied by that scale. To specify a width of a line in pixels, use [InverseTransformDistance](http://www.go-mono.com/docs/monodoc.ashx?tlink=0@ecma%3a4%23Context%2fM%2f56) to turn a `(1, 1)` device-space distance into, for example, a `(0.01, 0.01)` user-space distance. Note that if your transform deforms the image there isn't necessarily a way to specify a line with a uniform width.

Where to Go Next
----------------

This wraps up the tutorial. It doesn't cover all functions in cairo, so for some "advanced" lesser-used features, you'll need to look elsewhere. More examples of cairo use, in other languages, may be found on \<a href="www.cairographics.org/examples"\>cairographics.org\</a\>. As with everything, there's a large gap between knowing the rules of the tool, and being able to use it well. The final section of this document provides some ideas to help you traverse parts of the gap.

Tips and Tricks
---------------

In the previous sections you should have built up a firm grasp of the operations cairo uses to create images. In this section I've put together a small handful of snippets I've found particularly useful or non-obvious. I'm still new to cairo myself, so there may be other better ways to do these things. If you find a better way, or find a cool way to do something else, let me know and perhaps I can incorporate it into these tips.

### Line Width

When you're working under a uniform scaling transform, you can't just use pixels for the width of your line. However it's easy to translate it with the help of `InverseTransformDistance` (assuming that the pixel width is `1`):

``

    double ux=1, uy=1;
    cr.InverseTransformDistance(ref ux, ref uy);
    cr.LineWidth = Math.Max(ux, uy);

When you're working under a deforming scale, you may wish to still have line widths that are uniform in device space. For this you should return to a uniform scale before you stroke the path. In the image, the arc on the left is stroked under a deformation, while the arc on the right is stroked under a uniform scale.

[![]({{site.github.url}}/old_site/images/5/59/Cairo_tips-ellipse.png)]({{site.github.url}}/old_site/images/5/59/Cairo_tips-ellipse.png)

[View Source](http://mgsloan.nfshost.com/tips-ellipse.cs)

``

    cr.LineWidth = 0.1;

    cr.Save();
    cr.Scale(0.5, 1);
    cr.Arc(0.5, 0.5, 0.40, 0, 2 * Math.PI);
    cr.Stroke();

    cr.Translate(1, 0);
    cr.Arc(0.5, 0.5, 0.40, 0, 2 * Math.PI);
    cr.Restore();
    cr.Stroke();

### Text Alignment

When you try to center text letter by letter at various locations, you have to decide how you want to center it. For example the following code will actually center letters individually, leading to poor results when your letters are of different sizes. (Unlike most examples, here I assume a 26 x 1 workspace.)

[![]({{site.github.url}}/old_site/images/c/ce/Cairo_tips-letter.png)]({{site.github.url}}/old_site/images/c/ce/Cairo_tips-letter.png)

[View Source](http://mgsloan.nfshost.com/tips-letter.cs)

``

    FontExtents fe = cr.FontExtents;
    string alph = "AbCdEfGhIjKlMnOpQrStUvWxYz";
    for(int i = 0; i < alph.Length; i++) {
        string str = alph.Substring(i, 1);
        TextExtents te = cr.TextExtents(str);
        cr.MoveTo(i + 0.5 - te.XBearing - te.Width  / 2,
                      0.5 - te.YBearing + fe.Height / 2);
        cr.ShowText(str);
    }

Instead the vertical centering must be based on the general size of the font, thus keeping your baseline steady. Note that the exact positioning now depends on the metrics provided by the font itself, so the results are not necessarily the same from font to font.

[![]({{site.github.url}}/old_site/images/b/b8/Cairo_tips-font.png)]({{site.github.url}}/old_site/images/b/b8/Cairo_tips-font.png)

[View Source](http://mgsloan.nfshost.com/tips-font.cs)

``

    FontExtents fe = cr.FontExtents;
    string alph = "AbCdEfGhIjKlMnOpQrStUvWxYz";
    for(int i = 0; i < alph.Length; i++) {
        string str = alph.Substring(i, 1);
        TextExtents te = cr.TextExtents(str);
        cr.MoveTo(i + 0.5 - te.XBearing - te.Width  / 2,
                          0.5 - fe.Descent + fe.Height / 2);
        cr.ShowText(str);
    }

