---
title: "GtkSharp: Widget Colours"
redirect_from:
  - /GtkSharp:_Widget_Colours/
---

Colouring Widgets and Windows
-----------------------------

Colouring widgets and windows (which is itself a widget) alluded me for ages due to my basic knowledge of gtk.

Thanks to a [tiny example](http://lists.ximian.com/pipermail/gtk-sharp-list/2004-September/004820.html) I found by John Bailo on the [gtk\# mailing list](http://lists.ximian.com/pipermail/gtk-sharp-list/) it turns out to not be such a tricky thing after all. I’ve recreated it here.

The following code sets up a gtk.window, a DrawingArea widget on top, colours the window and the drawing area both red, then draws a diagonal line across the page.

``` csharp
using System;
using Gtk;
 
class ColourExample
{
    Window win;
    DrawingArea da;
 
        static void Main (){
                Application.Init ();
                new ColourExample ();
                Application.Run ();
        }
 
        ColourExample(){
                win = new Window ("Colour Example");
                win.SetDefaultSize (400, 300);
                win.DeleteEvent += OnWinDelete;
 
                da = new DrawingArea();
                da.ExposeEvent += OnExposed;
 
        Gdk.Color col = new Gdk.Color();
        Gdk.Color.Parse("red", ref col);
        win.ModifyBg(StateType.Normal, col);
        da.ModifyBg(StateType.Normal, col);
 
                win.Add (da);
                win.ShowAll ();
        }
 
        void OnExposed (object o, ExposeEventArgs args) {
                da.GdkWindow.DrawLine(da.Style.BaseGC(StateType.Normal), 0, 0, 400, 300);
        }
 
        void OnWinDelete (object o, DeleteEventArgs args){
                Application.Quit ();
        }
}
```

The code declares a global Window widget, and a global DrawingArea widget. Then a Gdk.Color object is created. We need to create a Color object so that this can be passed to the .ModifyBg() method of whatever widget is to be coloured. At first, just a blank Gtk.Color object is created.

We still need to tell the object what colour to be. This is done using the Gtk.Color.Parse method. The first parameter is a colour to try and translate. In this example “red” is passed and the method can easily work out what red is. The second parameter is which Gtk.Color object to send the colour to. Of course, this is ‘col’. So in short, declare a Gtk.Color object called ‘col’ and inform it to be a particular colour using Gtk.Color.Parse();

Both widgets are going to be coloured red. I have done this is for two reasons.

One: rarely, does a gtk\# application contain just a Window widget and nothing else alone, so we need to put something practical in there and a drawingarea will do fine.

Two: although you really only need to change the background colour in the drawingarea widget to achieve the desired effect, I have elected to colour the window widget as well so that you don’t get an annoying white/grey flick the moment before the drawingarea object appears on the window when the .Show() method is called.

Finally, I used the expose event of the drawingarea widget to draw a simple line to just give the program some real world practicality.

