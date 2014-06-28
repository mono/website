---
layout: obsolete
title: "Pango:Beginners"
lastmodified: '2005-11-25'
permalink: /old_site/Pango:Beginners/
redirect_from:
  - /Pango:Beginners/
---

Pango:Beginners
===============

Quick guide to using Pango\#
----------------------------

I am very much a beginner with mono. Some of what I write may not be entirely correct so please feel free to edit these contents to suit. This guide is just for Gtk\# beginners to learn to use pango. Examples on the web are basically non-existent and not everyone is able to confortably read APIs and C source just to get some text on your widget.

### Objective

To open a standard Gtk\# window, put a drawing area on it, and then some pango text on the drawing area widget. The only other example of pango\# I know of is here [http://taubz.for.net/code/monodocs/gtk-sharp/doc/en/html/Pango/Layout.html](http://taubz.for.net/code/monodocs/gtk-sharp/doc/en/html/Pango/Layout.html) and it demonstrates a gtk class inheriting a drawingarea class and then creating a gtk\# window. In this example however, the window class is inherited and the drawingarea class is created.

### Set up

Start a new Gtk\# 2.0 project using monodevelop. You will see in the References section of the Solution the following references: gdk-sharp, gtk-sharp, glib-sharp, glade-sharp and pango-sharp. So we don't need to make any more references because the project we created did it for us already. For other sorts of projects, you would need to add these yourself - just so you know.

I assume that you know how to create a basic Gtk\# window and that your Main.cs file calls an instance of a Gtk application. See the standard tutorial at: [http://www.mono-project.com/GtkSharpBeginnersGuide]({{ site.github.url }}/GtkSharpBeginnersGuide) first if you don't understand this.

Change the MyWindow.cs file so that it looks like this:

``` csharp
using System;
using Gtk;
 
public class MyWindow : Window
{ 
 
    Pango.Layout layout;
    Gtk.DrawingArea da;
    int width = 400;
    int height = 300;
 
    public MyWindow () : base ("MyWindow")
    {
        this.SetDefaultSize (width, height);
        this.DeleteEvent += new DeleteEventHandler (OnMyWindowDelete);
 
        da = new Gtk.DrawingArea();
        da.SetSizeRequest(width, height);
        da.ExposeEvent += Expose_Event;     
 
        layout = new Pango.Layout(this.PangoContext);
        layout.Width = Pango.Units.FromPixels(width);
        layout.Wrap = Pango.WrapMode.Word;
        layout.Alignment = Pango.Alignment.Left;
        layout.FontDescription = Pango.FontDescription.FromString("Ahafoni CLM Bold 100");
        layout.SetMarkup("<span color=" + (char)34 + "blue" + (char)34 + ">" + "Hello" + "</span>");
 
        this.Add(da);
 
        this.ShowAll ();
    }
 
    void Expose_Event(object obj, ExposeEventArgs args){
        da.GdkWindow.DrawLayout (da.Style.TextGC (StateType.Normal), 5, 5, layout);
    } 
 
    void OnMyWindowDelete (object sender, DeleteEventArgs a)
    {
        Application.Quit ();
        a.RetVal = true;
    }
}
```

The code starts by declaring a pango layout object and a drawing area widget. The layout will be rendered in the drawing area. The drawing area is set to be the same size as the window. The drawing area is given a redraw event using ExposeEvent. Then the layout is defined. To get an idea of what the layouts look like when being generated, have a look at the illustrations here: [http://ruby-gnome2.sourceforge.jp/hiki.cgi?Pango%3A%3ALayout](http://ruby-gnome2.sourceforge.jp/hiki.cgi?Pango%3A%3ALayout)

It's like setting up text in word or writer. You can have indents, sizes, fonts, etc etc. In this example Pango.Layout, the width is set by converting the window width into pango units because layouts are not measured in pixels. The wrap goes hand in hand with width so that any long text will wrap at the set width value. The FontDescription is quite handy. Here you can define your font. Thanks go to TD on the \#mono channel for his tips here. If you want to know the names of available fonts you can enter here, go to gedit and look at the available font names. In the example above, I have the font name of "Ahafoni CLM", the weight of "Bold" and size of 100.

The extra cool thing about layouts is that you can create your text using markup (simple html). So in this example, I've specified the colour of the text using:

``` nowiki
<span color="blue">Hello</span>
```

Very simple. Finally, the drawing object is added to the window widget and we are done.

