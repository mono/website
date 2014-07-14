---
layout: docpage
navgroup: docs
title: "GtkSharp: Packing with Boxes"
---

If you've worked a lot with Windows GUI programming, you're probably used to positioning widgets using coordinates. Although this is possible with Gtk\#, the preferred way of aligning widgets is with boxes. Boxes are invisible widget containers. They come in two forms: horizontal (HBox) and vertical (VBox). While this is more difficult for a newcomer, it has some advantages:

-   Independent of screensize
-   Easier Internationalization

HBox and VBox
=============

[HBox](http://docs.go-mono.com/index.aspx?link=T:Gtk.HBox) and [VBox](http://docs.go-mono.com/index.aspx?link=T:Gtk.VBox) objects work similarly to Button objects or any other widget. After you've layed out an HBox or VBox, be sure to call one of the packing methods to set up the box.

For a VBox, PackStart will pack the box starting at the top, and PackEnd will pack it starting at the bottom. For an HBox, PackStart will pack the box from left to right, and PackEnd will pack it right to left.

PackStart and PackEnd tell Gtk\# where you want to place your widgets; the library will handle automatic resizing and other nifty things. There are also a number of options as to how your widgets should be packed; read the API documentation for HBox and VBox for more details. The resulting layout system is significantly more flexible than pixel-by-pixel coordinate layouts.

Using the Boxes
===============

Because the Gtk\# packing system is so flexible, it can be confusing at first. In the end, however, there are basically five different styles of packing.

[Image:packbox.png]

In the image above, each line contains one horizontal box (HBox) with several buttons. The call to Pack() is shorthand for the call to pack each of the buttons into the HBox. Each of the buttons is packed into the HBox the same way (i.e., same arguments to the PackStart() method).

This is the declaration of the PackStart() method.

``` csharp
box1.PackStart(Widget child, bool expand, bool fill, int padding);
```

The first argument is object you want to pack into the box. The objects will all be buttons for now, so we'll be packing buttons into boxes.

The expand argument to PackStart and PackEnd controls whether the widgets are layed out in the box to fill in all the extra space in the box so the box is expanded to fill the area allotted to it (true); or the box is shrunk to just fit the widgets (false). Setting expand to false will allow you to do right and left justification of your widgets. Otherwise, they will all expand to fit into the box.

The fill argument to the Pack functions control whether the extra space is allocated to the objects themselves (true), or as extra padding in the box around these objects (false). It only has an effect if the expand argument is also true.

When creating a new box, the function looks like this:

    HBox hbox1 = new HBox(bool homogeneous, int  spacing);

The homogeneous argument to HBox (and the same for VBox) controls whether each object in the box has the same size (i.e., the same width in an HBox, or the same height in a vbox). If it is set, the Pack routines function essentially as if the expand argument was always turned on.

What's the difference between spacing (set when the box is created) and padding (set when elements are packed)? Spacing is added between objects, and padding is added on either side of an object.

Example
=======

``` csharp
// packingdemo.cs - Gtk# Tutorial example
//
// Author: Alejandro Sánchez Acosta <raciel@es.gnu.org>
//         Cesar Octavio Lopez Nataren <cesar@ciencias.unam.mx>
//
// (c) 2002 Alejandro Sánchez Acosta
//          Cesar Octavio Lopez Nataren
 
namespace GtkSharpTutorial {
 
        using Gtk;
        using Gdk;
        using GLib;
        using System;
        using System.Drawing;
 
        public class fixedcontainer
        {
 
                public int x = 50;
                public int y = 50;
 
                static Gtk.HBox make_box (bool homogeneous, int spacing, bool expand, bool fill, uint padding)
                {
                        HBox box;
                        Box box1;
                        Button button;
                        string padstr;
 
                        box = new HBox (homogeneous, spacing);
                        button = new Button ("gtk_box_pack");
                        box.PackStart (button, expand, fill, padding);
 
                        button.Show();
 
                        button = new Button ("(box,");
 
                        box.PackStart (button, expand, fill, padding);
                        button.Show();
 
                        button = new Button ("button");
                        box.PackStart (button, expand, fill, padding);
                        button.Show();
 
                        if (expand == true)
                                button = new Button ("TRUE");
                        else
                                button = new Button ("FALSE");
                        box.PackStart (button, expand, fill, padding);
                        button.Show();
 
                        button = new Button (fill ? "TRUE," : "FALSE,");
 
                        box.PackStart(button, expand, fill, padding);
                        button.Show();
 
                        padstr=padding.ToString()+");";
 
                        button = new Button (padstr);
                        box.PackStart (button, expand, fill, padding);
                        button.Show();
                        return box;
                }
 
                static void delete_event (object obj, DeleteEventArgs args)
                {
                        Application.Quit();
                }
 
                static void exitbutton_event (object obj, ButtonPressEventArgs args)
                {
                        Application.Quit();
                }
 
                public static int Main (string[] args)
                {
                        Gtk.Window window;
                        Button button;
                        VBox box1;
                        HBox box2;
                        HSeparator separator;
                        Misc misc;
                        Box quitbox;
                        int which;
                        Gtk.Label label;
                        Application.Init();
 
                        if (args.Length !=1) {
                                Console.WriteLine ("Usage: packbox num, where num is 1, 2 o 3");
                                return (1);
                        }
 
                        which = Convert.ToInt32 (args[0]);
 
                        window = new Gtk.Window ("packingdemo");
 
                        window.DeleteEvent += delete_event;
 
                        window.BorderWidth = 10;
 
                        box1 = new VBox (false, 0);
 
                        switch (which) {
                                case 1: 
                                        label=new Gtk.Label("gtk_hbox_new (FALSE, 0);");
 
                                        box2 = new HBox (false, 0);
 
                                        label.SetAlignment (0, 0);
                                        box1.PackStart (label, false, false, 0);
 
                                        label.Show();
 
                                        box2 = make_box (false, 0, false, false, 0);
 
                                        box1.PackStart (box2, false, false, 0);
                                        box2.Show();
 
                                        box2 = make_box (false, 0, true, false, 0);
                                        box1.PackStart (box2, false, false, 0);
                                        box2.Show();
 
                                        box2 = make_box (false, 0, true, true, 0);
                                        box1.PackStart (box2, false, false, 0);
                                        box2.Show();
 
                                        separator = new HSeparator ();
 
                                        box1.PackStart (separator, false, true, 5);
                                        separator.Show();
 
                                        box1 = new VBox (true, 0);
                                        label=new Gtk.Label("gtk_hbox_new (TRUE, 0);");
                                        label.SetAlignment (0, 0);
 
                                        box1.PackStart(label, false, false, 0);
                                        label.Show();
 
                                        box2 = make_box (true, 0, true, true, 0);
 
                                        box1.PackStart (box2, false, false, 0);
                                        box2.Show();
 
                                        box2 = make_box (true, 0, true, true, 0);
                                        box1.PackStart(box2, false, false, 0);
                                        box2.Show();
 
                                        separator = new HSeparator();
 
                                        box1.PackStart (separator, false, true, 5);
                                        separator.Show();
 
                                        break;
 
                                case 2:
                                        box2 = new HBox (false, 10);
                                        label = new Gtk.Label("gtk_hbox_new (FALSE, 10);");
 
                                        label.SetAlignment (0, 0);
                                        box1.PackStart (box2, false, false, 0);
                                        box1.Show();
 
                                        box2 = make_box (false, 10, true, true, 0);
                                        box1.PackStart (box2, false, false, 0);
                                        box2.Show();
 
                                        separator = new HSeparator ();
 
                                        box1.PackStart (separator, false, true, 5);
                                        separator.Show();
 
                                        box2 = new HBox (false, 0);
 
                                        label=new Gtk.Label("gtk_hbox_new (FALSE, 0);");
                                        label.SetAlignment (0, 0);
                                        box1.PackStart (label, false, false, 0);
                                        label.Show();
 
                                        box2 = make_box (false, 0, true, false, 10);
                                        box1.PackStart (box2, false, false, 0);
                                        box2.Show();
 
                                        box2 = make_box (false, 0, true, true, 10);
                                        box1.PackStart (box2, false, false, 0);
                                        box2.Show();
 
                                        separator = new HSeparator ();
                                        box1.PackStart(separator, false, true, 5);
                                        separator.Show();
                                        break;
 
                                case 3:
                                        box2 = make_box (false, 0, false, false, 0);
                                        label = new Label ("end");
                                        box2.PackEnd(label, false, false, 0);
                                        label.Show();
 
                                        box1.PackStart(box2, false, false, 0);
                                        box2.Show();
 
                                        separator = new HSeparator();
                                        separator.SetSizeRequest(400, 5);
                                        box1.PackStart (separator, false, true, 5);
                                        separator.Show();
                                        break;
                        }
                        quitbox = new HBox (false, 0);
 
                        button = new Button ("Quit");
 
                        button.Clicked += ClickedEventHandler;
 
                        quitbox.PackStart(button, true, false, 0);
                        box1.PackStart (quitbox, false, false, 0);
 
                        window.Add(box1);
                        button.Show();
                        quitbox.Show();
 
                        box1.Show();
                        window.Show();
 
                        Application.Run();
                        return 0;
                }
 
                static void ClickedEventHandler(object sender, EventArgs e)
                {
                        Application.Quit();
                }
 
        }
}
```

