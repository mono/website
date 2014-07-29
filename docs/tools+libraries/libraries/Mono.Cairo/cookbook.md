---
layout: docpage
navgroup: docs
title: Mono.Cairo Cookbook
redirect_from:
  - /Mono.Cairo_Cookbook/
---

Some fun recipes to spice up your Cairo based drawing!

C\# version created by Or Dvory.

### Simple Working with a Cairo Context

The following code draws three lines to into a .png image file.

[![Antialias.png]({{ site.github.url }}/old_site/images/3/30/Antialias.png)]({{ site.github.url }}/old_site/images/3/30/Antialias.png)

``` csharp
//    antialias.cs
using System;
using System.Reflection;
using System.Runtime.InteropServices;
using Cairo;
 
public class CairoAntialias
{
    static void Main ()
    {
        // The using statement ensures that potentially heavy objects
        // are disposed immediately.
    using (ImageSurface draw = new ImageSurface (Format.Argb32, 70, 150)){
        using (Context gr = new Context(draw)){
                gr.Antialias = Antialias.Subpixel;    // sets the anti-aliasing method
                gr.LineWidth = 9;          // sets the line width
                gr.Color = new Color (0, 0, 0, 1);   // red, green, blue, alpha
                gr.MoveTo (10, 10);          // sets the Context's start point.
                gr.LineTo (40, 60);          // draws a "virtual" line from 5,5 to 20,30
                gr.Stroke ();          //stroke the line to the image surface
 
                gr.Antialias = Antialias.Gray;
                gr.LineWidth = 8;
                gr.Color = new Color (1, 0, 0, 1);
                gr.LineCap = LineCap.Round;
                gr.MoveTo (10, 50);
                gr.LineTo (40, 100);
                gr.Stroke ();
 
                gr.Antialias = Antialias.None;    //fastest method but low quality
                gr.LineWidth = 7;
                gr.MoveTo (10, 90);
                gr.LineTo (40, 140);
                gr.Stroke ();
 
                draw.WriteToPng ("antialias.png");  //save the image as a png image.
            }
    }
    }
}
```

To compile this sample type in the terminal:

``` bash
mcs antialias.cs -pkg:mono-cairo
```

### Drawing Rounded Rects

The following code draws Rounded Rects on a GTK window.

[![RoundedRectangles.png]({{ site.github.url }}/old_site/images/3/31/RoundedRectangles.png)]({{ site.github.url }}/old_site/images/3/31/RoundedRectangles.png)

``` csharp
//    roundedrects.cs
using System;
using System.Reflection;
using System.Runtime.InteropServices;
using Cairo;
using Gtk;
 
public class GtkCairo
{
    static void Main ()
    {
    Application.Init ();
    Gtk.Window w = new Gtk.Window ("Mono-Cairo Rounded Rectangles");
 
    DrawingArea a = new CairoGraphic ();
 
    Box box = new HBox (true, 0);
    box.Add (a);
    w.Add (box);
    w.Resize (500, 500);
    w.DeleteEvent += close_window;
    w.ShowAll ();
 
    Application.Run ();
    }
 
    static void close_window (object obj, DeleteEventArgs args)
    {
    Application.Quit ();
    }
}
 
public class CairoGraphic : DrawingArea
{
    static double min (params double[] arr)
    {
    int minp = 0;
    for (int i = 1; i < arr.Length; i++)
        if (arr[i] < arr[minp])
        minp = i;
 
    return arr[minp];
    }
 
    static void DrawRoundedRectangle (Cairo.Context gr, double x, double y, double width, double height, double radius)
    {
    gr.Save ();
 
    if ((radius > height / 2) || (radius > width / 2))
        radius = min (height / 2, width / 2);
 
    gr.MoveTo (x, y + radius);
    gr.Arc (x + radius, y + radius, radius, Math.PI, -Math.PI / 2);
    gr.LineTo (x + width - radius, y);
    gr.Arc (x + width - radius, y + radius, radius, -Math.PI / 2, 0);
    gr.LineTo (x + width, y + height - radius);
    gr.Arc (x + width - radius, y + height - radius, radius, 0, Math.PI / 2);
    gr.LineTo (x + radius, y + height);
    gr.Arc (x + radius, y + height - radius, radius, Math.PI / 2, Math.PI);
    gr.ClosePath ();
    gr.Restore ();
    }
 
    static void DrawCurvedRectangle (Cairo.Context gr, double x, double y, double width, double height)
    {
    gr.Save ();
    gr.MoveTo (x, y + height / 2);
    gr.CurveTo (x, y, x, y, x + width / 2, y);
    gr.CurveTo (x + width, y, x + width, y, x + width, y + height / 2);
    gr.CurveTo (x + width, y + height, x + width, y + height, x + width / 2, y + height);
    gr.CurveTo (x, y + height, x, y + height, x, y + height / 2);
    gr.Restore ();
    }
 
    protected override bool OnExposeEvent (Gdk.EventExpose args)
    {
    using (Context g = Gdk.CairoHelper.Create (args.Window)){
        DrawCurvedRectangle (g, 30, 30, 300, 200);
        DrawRoundedRectangle (g, 70, 250, 300, 200, 40);
        g.Color = new Color (0.1, 0.6, 1, 1);
        g.FillPreserve ();
        g.Color = new Color (0.2, 0.8, 1, 1);
        g.LineWidth = 5;
        g.Stroke ();
    }
    return true;
    }
}
```

To compile this sample type in the terminal:

``` bash
mcs roundedrects.cs -pkg:mono-cairo -pkg:gtk-sharp-2.0
```

### Opening Images (Including SVG)

To view an image file, you first need to load it and then display it.

the following code opens images using GDK. The problem is that the only way to convert a GDK surface into Cairo surface is by saving it as a png file and the reopen it with Cairo.

If the image typed as SVG, Rsvg library will render it for us as a GDK surface.

[![Viewer.png]({{ site.github.url }}/old_site/images/1/12/Viewer.png)]({{ site.github.url }}/old_site/images/1/12/Viewer.png)

``` csharp
//    viewer.cs
using System;
using System.IO;
using System.Reflection;
using System.Runtime.InteropServices;
using Cairo;
using Gtk;
using Gdk;
 
public class GtkCairo
{
    static string GetEmptyPath ()
    {
        string bpath = "temp", path = "temp";
        for (int i = 0; File.Exists (path); i++)
            path = bpath + i.ToString ();
        return path;
    }
 
    static double Max (params double[] arr)
    {
        int minp = 0;
        for (int i = 1; i < arr.Length; i++)
            if (arr[i] > arr[minp])
                minp = i;
        return arr[minp];
    }
 
    static void Main (string[] args)
    {
        if (args.Length != 1) {
            Console.WriteLine ("usage: mono viewer.exe ImageFileName");
            return;
        }
 
        Application.Init ();
        Gdk.Pixbuf display;
 
        if (args[0].ToLower ().EndsWith (".svg"))
            display = Rsvg.Pixbuf.FromFile (args[0]);
        else
            display = new Pixbuf (args[0]);
 
        Gtk.Window w = new Gtk.Window ("Viewer- scale: ");
 
        string tempname = GetEmptyPath ();
 
        double scale = Max (display.Width / 800.0, display.Height / 600.0);
 
        if (scale < 1)
            scale = 1;
 
        display = display.ScaleSimple ((int)(display.Width / scale), (int)(display.Height / scale), InterpType.Bilinear);
        display.Save (tempname, "png");
 
        w.Title += ((int)(100 / scale)).ToString () + "%";
        ImageSurface img = new ImageSurface (tempname);
        File.Delete (tempname);
        w.Resize (img.Width, img.Height);
        DrawingArea a = new CairoGraphic (img);
 
        Box box = new HBox (true, 0);
        box.Add (a);
        w.Add (box);
 
        w.DeleteEvent += close_window;
        w.ShowAll ();
 
        Application.Run ();
    }
 
    static void close_window (object obj, DeleteEventArgs args)
    {
        Application.Quit ();
    }
}
 
public class CairoGraphic : DrawingArea
{
    ImageSurface src;
 
    public CairoGraphic (ImageSurface src)
    {
        this.src = src;
    }
 
    protected override bool OnExposeEvent (Gdk.EventExpose args)
    {
        using (Context g = Gdk.CairoHelper.Create (args.Window)){
        g.Source = new Pattern (src);
        g.Paint ();
    }
        return true;
    }
}
```

To compile this sample type in the terminal:

``` bash
mcs viewer.cs -pkg:mono-cairo -pkg:gtk-sharp-2.0 -pkg:rsvg-sharp-2.0
```

### Transformations

With Cairo, you can move,rotate and scale the coordinates.

[![Transform.png]({{ site.github.url }}/old_site/images/4/4a/Transform.png)]({{ site.github.url }}/old_site/images/4/4a/Transform.png)

``` csharp
//    transform.cs
using System;
using System.IO;
using System.Reflection;
using System.Runtime.InteropServices;
using Cairo;
using Gtk;
 
public class GtkCairo
{
    static void Main ()
    {
        Application.Init ();
 
        Gtk.Window w = new Gtk.Window ("Mono-Cairo Transforms");
 
        w.Resize (500, 500);
        DrawingArea a = new CairoGraphic ();
 
        Box box = new HBox (true, 0);
        box.Add (a);
        w.Add (box);
 
        w.DeleteEvent += close_window;
        w.ShowAll ();
 
        Application.Run ();
    }
 
    static void close_window (object obj, DeleteEventArgs args)
    {
        Application.Quit ();
    }
}
 
public class CairoGraphic : DrawingArea
{
    static void DrawRoundedRectangle (Cairo.Context gr, double x, double y, double width, double height, double radius)
    {
        gr.Save ();
 
        if ((radius > height / 2) || (radius > width / 2))
            radius = Min (height / 2, width / 2);
 
        gr.MoveTo (x, y + radius);
        gr.Arc (x + radius, y + radius, radius, Math.PI, -Math.PI / 2);
        gr.LineTo (x + width - radius, y);
        gr.Arc (x + width - radius, y + radius, radius, -Math.PI / 2, 0);
        gr.LineTo (x + width, y + height - radius);
        gr.Arc (x + width - radius, y + height - radius, radius, 0, Math.PI / 2);
        gr.LineTo (x + radius, y + height);
        gr.Arc (x + radius, y + height - radius, radius, Math.PI / 2, Math.PI);
 
        gr.ClosePath ();
        gr.Restore ();
    }
    static double Min (params double[] arr)
    {
        int minp = 0;
 
        for (int i = 1; i < arr.Length; i++)
            if (arr[i] < arr[minp])
                minp = i;
 
        return arr[minp];
    }
 
    protected override bool OnExposeEvent (Gdk.EventExpose args)
    {
    using (Context g = Gdk.CairoHelper.Create (args.Window)){
        g.Translate (250, 250);
        g.Rotate (0.2);
        g.Translate (-250, -250);
 
        DrawRoundedRectangle (g, 40, 40, 140, 140, 80);
        DrawRoundedRectangle (g, 320, 320, 140, 140, 80);
        DrawRoundedRectangle (g, 40, 320, 140, 140, 80);
        DrawRoundedRectangle (g, 320, 40, 140, 140, 80);
        DrawRoundedRectangle (g, 150, 180, 200, 140, 30);
 
        g.Color = new Color (1, 0.6, 0, 1);
        g.FillPreserve ();
        g.Color = new Color (1, 0.8, 0, 1);
        g.LineWidth = 8;
        g.Stroke ();
    }     
        return true;
    }
}
```

### Truchet Tiling

After I saw this plugin in gimp, I wanted to make my own improved one:

[![TruchetTile.png]({{ site.github.url }}/old_site/images/f/f1/TruchetTile.png)]({{ site.github.url }}/old_site/images/f/f1/TruchetTile.png)

``` csharp
//    truchet.cs
using System;
using System.Reflection;
using System.Runtime.InteropServices;
using Cairo;
using Gtk;
 
public class GtkCairo
{
    static void Main ()
    {
        Application.Init ();
        Gtk.Window w = new Gtk.Window ("Mono-Cairo Truchet Tile");
 
        DrawingArea a = new CairoGraphic ();
 
        Box box = new HBox (true, 0);
        box.Add (a);
 
        w.Add (box);
        w.Resize (500, 500);
        w.DeleteEvent += close_window;
        w.ShowAll ();
 
        Application.Run ();
    }
 
    static void close_window (object obj, DeleteEventArgs args)
    {
        Application.Quit ();
    }
}
 
public class Truchet
{
    static public enum DrawingMethod
    {
        Curved = 0,
        Rounded,
        Random
    }
 
    delegate void CellDrawing (Cairo.Context gr, int i, int j, double radius, bool rotate);
 
    bool[,] field;
    double Radius;
    static CellDrawing[] DrawingMethods;
    DrawingMethod meth;
    static int qmethods = Enum.GetValues (typeof (DrawingMethod)).Length - 1;
 
    public Truchet (int x, int y, double radius)
    {
        this.field = new bool[x, y];
        this.Radius = radius;
        InitDMethods ();
        meth = DrawingMethod.Curved;
    }
 
    void InitDMethods ()
    {
        DrawingMethods = new CellDrawing[qmethods];
        DrawingMethods[0] = new CellDrawing (CurvedCell);
        DrawingMethods[1] = new CellDrawing (RoundedCell);
    }
 
    public void GenerateMap ()
    {
        Random Rand = new Random ();
        for (int i = 0; i < field.GetLength (0); i++)
            for (int j = 0; j < field.GetLength (1); j++)
                if (Rand.Next (2) == 1)
                    SetCell (i, j, true);
                else
                    SetCell (i, j, false);
    }
 
    public void SetCell (int x, int y, bool rotated)
    {
        field[x, y] = rotated;
    }
 
    public void SetDrawingMethod (DrawingMethod method)
    {
        meth = method;
    }
 
    public void RenderMap (Cairo.Context gr, double x0, double y0)
    {
        if (meth != DrawingMethod.Random) {
            for (int i = 0; i < field.GetLength (0); i++)
                for (int j = 0; j < field.GetLength (1); j++)
                    DrawingMethods[(int)meth] (gr, i, j, Radius, field[i, j]);
        } else {
            Random Rand = new Random ();
            for (int i = 0; i < field.GetLength (0); i++)
                for (int j = 0; j < field.GetLength (1); j++)
                    DrawingMethods[Rand.Next (qmethods)] (gr, i, j, Radius, field[i, j]);
        }
 
    }
 
    public static void CurvedCell (Cairo.Context gr, int i, int j, double radius, bool rotate)
    {
        double cellsize = radius * 2;
        double x = cellsize * i, y = cellsize * j;
        gr.Save ();
 
        if (rotate) {
            gr.MoveTo (x + cellsize, y + radius);
            gr.CurveTo (x + radius, y + radius, x + radius, y + radius, x + radius, y + cellsize);
            gr.MoveTo (x + radius, y);
            gr.CurveTo (x + radius, y + radius, x + radius, y + radius, x, y + radius);
        } else {
            gr.MoveTo (x + radius, y);
            gr.CurveTo (x + radius, y + radius, x + radius, y + radius, x + cellsize, y + radius);
            gr.MoveTo (x, y + radius);
            gr.CurveTo (x + radius, y + radius, x + radius, y + radius, x + radius, y + cellsize);
        }
 
        gr.Restore ();
    }
 
    public static void RoundedCell (Cairo.Context gr, int i, int j, double radius, bool rotate)
    {
        double cellsize = radius * 2;
        double x = cellsize * i, y = cellsize * j;
        gr.Save ();
        if (rotate) {
            gr.MoveTo (x + radius, y);
            gr.Arc (x, y, radius, 0, Math.PI / 2);
            gr.MoveTo (x + cellsize, y + radius);
            gr.ArcNegative (x + cellsize, y + cellsize, radius, -Math.PI / 2, Math.PI);
 
        } else {
            gr.MoveTo (x, y + radius);
            gr.Arc (x, y + cellsize, radius, -Math.PI / 2, 0);
            gr.MoveTo (x + radius, y);
            gr.ArcNegative (x + cellsize, y, radius, Math.PI, Math.PI / 2);
 
 
        }
 
        gr.Restore ();
    }
}
 
public class CairoGraphic : DrawingArea
{
    Truchet tr;
 
    public CairoGraphic ()
    {
        tr = new Truchet (10, 10, 25);
        tr.GenerateMap ();
    }
 
    protected override bool OnExposeEvent (Gdk.EventExpose args)
    {
    using (Context g = Gdk.CairoHelper.Create (args.Window)){
        tr.RenderMap (g, 0, 0);
 
        g.Color = new Color (0.6, 0.9, 0.2, 1);
        g.LineWidth = 6;
        g.Stroke ();
    }
        return true;
    }
}
```

