---
title: "GtkSharp: Frames"
redirect_from:
  - /GtkSharp%3A_Frames/
---

Frames can be used to enclose one or a group of widgets with a box which can optionally be labeled. The position of the label and the style of the box can be altered to suit. A Frame can be created with the following constructor:

    Frame frame1 = new Frame("Label");

The label is by default placed in the upper left hand corner of the frame. A value of null for the label argument will result in no label being displayed. The text of the label can be changed using the Label property.

The position of the label can be changed using the SetLabelAlign method:

    frame1.SetLabelAlign(xalign, yalign);

xalign and yalign take values between 0.0 and 1.0. xalign indicates the position of the label along the top horizontal of the frame. yalign is not currently used. The default value of xalign is 0.0 which places the label at the left hand end of the frame.

The ShadowType property alters the style of the box that is used to outline the frame. It can take one of the following values: Gtk.Shadow.None, Gtk.Shadow.In, Gtk.Shadow.Out, Gtk.Shadow.EtchedIn (default), or Gtk.Shadow.EtchedOut.

The following code example illustrates the use of the Frame widget.

[Image:frame.png]

``` csharp
// frame.cs - Gtk# Tutorial example
//
// Author: Johannes Roith >johannes@jroith.de<
//
// (c) 2002 Johannes Roith
 
namespace GtkSharpTutorial {
        using Gtk;
        using System;
        using System.Drawing;
 
 
        public class frame
        {
 
                static void delete_event (object obj, DeleteEventArgs args)
                {
                Application.Quit();
                }
 
                public static void Main( string[] args)
                {
 
                        /* Initialise GTK */
                        Application.Init();
 
                        /* Create a new window */
                        Window window = new Window ("Frame Example");
 
                        /* Here we connect the "destroy" event to a signal handler */
                        window.DeleteEvent += delete_event;
 
                        window.SetSizeRequest(300, 300);
                        /* Sets the border width of the window. */
                        window.BorderWidth= 10;
 
                        /* Create a Frame */
                        Frame frame = new Frame("MyFrame");
                        window.Add(frame);
 
                        /* Set the frame's label */
                        frame.Label = "GTK Frame Widget";
 
                        /* Align the label at the right of the frame */
 
                        frame.SetLabelAlign((float)1.0,(float)0.0);
 
                        /* Set the style of the frame */
                        frame.ShadowType = (ShadowType) 4;
 
                        frame.Show();
 
                        /* Display the window & all widgets*/
                        window.ShowAll();
 
                        /* Enter the event loop */
                        Application.Run();
 
                }
 
        }
 
}
```

