---
title: "GtkSharp: Range Widgets"
redirect_from:
  - /GtkSharp:_Range_Widgets/
---

The category of range widgets includes the ubiquitous [scrollbar](http://docs.go-mono.com/index.aspx?link=T:Gtk.Scrollbar) widget and the less common [scale](http://docs.go-mono.com/index.aspx?link=T:Gtk.Scale) widget. Though these two types of widgets are generally used for different purposes, they are quite similar in function and implementation. All range widgets share a set of common graphic elements, each of which has its own X window and receives events. They all contain a "trough" and a "slider" (what is sometimes called a "thumbwheel" in other GUI environments). Dragging the slider with the pointer moves it back and forth within the trough, while clicking in the trough advances the slider towards the location of the click, either completely, or by a designated amount, depending on which mouse button is used.

As mentioned in Adjustments above, all range widgets are associated with an adjustment object, from which they calculate the length of the slider and its position within the trough. When the user manipulates the slider, the range widget will change the value of the adjustment.

The Range widget class is fairly complicated internally, but, like all the "base class" widgets, most of its complexity is only interesting if you want to hack on it. Also, almost all of the functions and events it defines are only really used in writing derived widgets. There are, however, a few useful methods that are defined for all Range widgets.

Update Policy
=============

The [update policy](http://docs.go-mono.com/index.aspx?link=P:Gtk.Range.UpdatePolicy) of a range widget defines at what points during user interaction it will change the value field of its Adjustment and emit the [Gtk.Adjustment.ValueChanged](http://docs.go-mono.com/index.aspx?link=E:Gtk.Adjustment.ValueChanged) event for this Adjustment. The update policies are held in the [Gtk.UpdateType](http://docs.go-mono.com/index.aspx?link=T:Gtk.UpdateType) enumeration and can have one of three values.

`Gtk.UpdateType.Continuous (default)`<br/>
The ValueChanged event is emitted continuously, i.e., whenever the slider is moved by even the tiniest amount.

`Gtk.UpdateType.Discontinuous`<br/>
The ValueChanged event is only emitted once the slider has stopped moving and the user has released the mouse button.

`Gtk.UpdateType.Delayed`<br/>
The ValueChanged event is emitted when the user releases the mouse button, or if the slider stops moving for a short period of time.

Mouse and Key Handling
======================

All of the range widgets react to mouse clicks in more or less the same way. Clicking button-1 in the trough will cause its adjustment's *pageIncrement* to be added or subtracted from its value, and the slider to be moved accordingly. Clicking mouse button-2 in the trough will jump the slider to the point at which the button was clicked. Clicking button-3 in the trough of a range or any button on a scrollbar's arrows will cause its adjustment's value to change by *step_increment* at a time.

Scrollbars are not focusable; thus, they have no key bindings. The key bindings for the other range widgets (which are, of course, only active when the widget has focus) do not differentiate between horizontal and vertical range widgets.

All range widgets can be operated with the left, right, up and down arrow keys, as well as with the Page Up and Page Down keys. The arrows move the slider up and down by *stepIncrement*, while Page Up and Page Down move it by *pageIncrement*.

The user can also move the slider all the way to one end or the other of the trough using the keyboard. This is done with the Home and End keys.

Example
=======

This example is a somewhat modified version of the "range controls" test from testgtk.c. It basically puts up a window with three range widgets all connected to the same adjustment, and a couple of controls for adjusting some of the parameters mentioned above and in the section on adjustments, so you can see how they affect the way these widgets work for the user.

``` csharp
// checkbuttons.cs - Gtk# Tutorial example
//
// Authors: Alejandro Sanchez Acosta &li;raciel@es.gnu.org>
//          Cesar Octavio Lopez Nataren &li;cesar@ciencias.unam.mx>
//
// (C) 2002 Alejandro Sanchez Acosta &li;raciel@es.gnu.org>
//          Cesar Octavio Lopez Nataren &li;cesar@ciencias.unam.mx>
 
namespace GtkSharpTutorial {
 
 
        using Gtk;
        using System;
        using System.Drawing;
 
 
        public class rangeWidgetsSamples
        {
                static HScale hscale;
                static VScale vscale;
 
                static void cb_pos_menu_select (object obj, PositionType pos)
                {
                        /* Set the value position on both scale widgets */
                        ((Scale) hscale).ValuePos = pos;
                        ((Scale) vscale).ValuePos = pos;
                }
 
 
                static void cb_update_menu_select (object obj, UpdateType policy)
                {
                        /* Set the update policy for both scale widgets */
                        ((Range) hscale).UpdatePolicy = policy;
                        ((Range) vscale).UpdatePolicy = policy;
                }
 
 
                static void cb_digits_scale (Adjustment adj)
                {
                        /* Set the number of decimal places to which adj->value is rounded */
 
                        /* FIXME: this might be wrong */
                        // ((Scale) hscale) = adj.Value;
                        // ((Scale) vscale) = adj.Value;
                }
 
 
                // FIXME
                static void cb_page_size (Adjustment get, Adjustment set)
                {
                        /* Set the page size and page increment size of the sample
                         * adjustment to the value specified by the "Page Size" scale */
                        //set.PageSize = get.Value;
                        //set->page_increment = = get.Value;
 
                        /* This sets the adjustment and makes it emit the "changed" signal to
                           reconfigure all the widgets that are attached to this signal.  */
                        //set.ClampPage (
                }
 
                // FIXME
                static void cb_draw_value (ToggleButton button)
                {
                        /* Turn the value display on the scale widgets off or on depending
                         *  on the state of the checkbutton */
                        //((Scale) hscale).DrawValue  button.Active
                        //((Scale) vscale).DrawValue  button.Active
                }
 
 
                /* Convenience functions */
 
                // FIXME:
                static Widget make_menu_item (string name /*, callback , gpointer */)
                {
                        Widget w = null;
                        return w;
                }
 
 
                static void scale_set_default_values (Scale s)
                {
                        s.UpdatePolicy = UpdateType.Continuous;
                        s.Digits = 1;
                        s.ValuePos = PositionType.Top;
                        s.DrawValue = true;
                }
 
                static void create_range_controls ()
                {
                        Window window;
                        VBox box1, box3;
                        Box box2;
                        Button button;
                        HScrollbar scrollbar;
                        HSeparator separator;
                        Widget item; /* FIXME: find out the exactly widgets */
                        OptionMenu opt;
                        Menu menu;
                        Label label;
                        Scale scale;
                        Adjustment adj1, adj2;
 
                        window = new Window (WindowType.Toplevel);
                        window.Title = "range controls";
 
                        box1 = new VBox (false, 0);
                        window.Add (box1);
                        box1.ShowAll ();
 
                        box2 = new HBox (false, 0);
                        box2.BorderWidth = 10;
                        box1.PackStart (box2, true, true, 0);
                        box2.ShowAll ();
 
                        /* value, lower, upper, step_increment, page_increment, page_size */
                        /* Note that the page_size value only makes a difference for
                         * scrollbar widgets, and the highest value you'll get is actually
                         * (upper - page_size). */
                        adj1 = new Adjustment (0.0, 0.0, 101.0, 0.1, 1.0, 1.0);
 
                        vscale = new VScale ((Adjustment) adj1);
                        scale_set_default_values (vscale);
 
                        box2.PackStart (vscale, true, true, 0);
                        vscale.ShowAll ();
 
                        box3 = new VBox (false, 10);
                        box2.PackStart (box3, true, true, 0);
                        box3.ShowAll ();
 
                        /* Reuse the same adjustment */
                        hscale = new HScale ((Adjustment) adj1);
                        hscale.SetSizeRequest (200, -1);
                        scale_set_default_values (hscale);
 
                        box3.PackStart (hscale, true, true, 0);
                        hscale.ShowAll ();
 
                        /* reuse the same adjustment again */
                        scrollbar = new HScrollbar ((Adjustment) adj1);
 
                        /* Notice how this causes the scales to always be updated
                         * continuously when the scrollbar is moved */
                        scrollbar.UpdatePolicy = UpdateType.Continuous;
 
                        box3.PackStart (scrollbar, true, true, 0);
                        scrollbar.ShowAll ();
 
                        box2 = new HBox (false, 10);
                        box2.BorderWidth = 10;
                        box1.PackStart (box2, true, true, 0);
                        box2.ShowAll ();
 
                        /* A checkbutton to control whether the value is displayed or not */
                        button = new Button ("Display value on scale widgets");
                        box2.PackStart (button, true, true, 0);
                        button.ShowAll ();
 
                        box2 = new HBox (false, 10);
                        box2.BorderWidth = 10;
 
                        /* An option menu to change the position of the value */
                        label = new Label ("Scale Value Position:");
                        box2.PackStart (label, false, false, 0);
                        label.ShowAll ();
 
                        opt = new OptionMenu ();
                        menu = new Menu ();
 
                        //FIXME:
                        item = new MenuItem ();
                        menu.Append (item);
 
                        // item =
                        menu.Append (item);
 
                        // item =
                        menu.Append (item);
 
                        // item =
                        menu.Append (item);
 
                        ((OptionMenu) opt).Menu = menu;
                        box2.PackStart (opt, true, true, 0);
                        opt.ShowAll ();
 
                        box1.PackStart (box2, true, true, 0);
                        box2.ShowAll ();
 
                        box2 = new HBox (false, 10);
                        box2.BorderWidth = 10;
 
                        /* Yet another option menu, this time for the update policy of the
                         * scale widgets */
                        label = new Label ("Scale Update Policy:");
                        box2.PackStart (label, false, false, 0);
                        label.ShowAll ();
 
                        opt = new OptionMenu ();
                        menu = new Menu ();
 
                        // FIXME: continuous
                        item = new MenuItem  ();
                        menu.Append (item);
 
                        // FIXME: discontinuous
                        item = new MenuItem ();
                        menu.Append (item);
 
                        //FIXME: delayed
                        item = new MenuItem ();
                        menu.Append (item);
 
                        opt.Menu = menu;
 
                        box2.PackStart (opt, true, true, 0);
                        opt.ShowAll ();
 
                        box1.PackStart (box2, true, true, 0);
                        box2.ShowAll ();
 
                        box2 = new HBox (false, 10);
                        box2.BorderWidth = 10;
 
                        /* An HScale widget for adjusting the number of digits on the
                         * sample scales. */
                        label = new Label ("Scale Digits:");
                        box2.PackStart (label, false, false, 0);
                        label.ShowAll ();
 
                        adj2 = new Adjustment (1.0, 0.0, 5.0, 1.0, 1.0, 0.0);
                        //FIXME: add a value_changed signal handler
                        scale = new HScale (adj2);
                        scale.Digits = 0;
 
                        box2.PackStart (scale, true, true, 0);
                        scale.ShowAll ();
 
                        box1.PackStart (box2, true, true, 0);
                        box2.ShowAll ();
 
                        box2 = new HBox (false, 10);
                        box2.BorderWidth = 10;
 
                        /* And, one last HScale widget for adjusting the page size of the
                         * scrollbar. */
                        label = new Label ("Scrollbar Page Size:");
                        box2.PackStart (label, false, false, 0);
                        label.ShowAll ();
 
                        adj2 = new Adjustment (1.0, 1.0, 101.0, 1.0, 1.0, 0.0);
                        // FIXME: write a value_changed signal handler
                        scale = new HScale (adj2);
                        scale.Digits = 0;
                        box2.PackStart (scale, true, true, 0);
                        scale.ShowAll ();
 
                        box1.PackStart (box2, true, true, 0);
                        box2.ShowAll ();
 
                        separator = new HSeparator ();
                        box1.PackStart (separator, false, true, 0);
                        separator.ShowAll ();
 
                        box2 = new VBox (false, 10);
                        box2.BorderWidth = 10;
                        box1.PackStart (box2, false, true, 0);
                        box2.ShowAll ();
 
                        button = new Button ("Quit");
                        // FIXME: write a clicked signal handler
                        box2.PackStart (button, true, true, 0);
                        //FIXME: set widget flags
                        //FIXME: grab default
                        button.ShowAll ();
 
                        window.ShowAll ();
                }
 
                public static void Main (string [] args)
                {
                        Application.Init ();
                        create_range_controls ();
                        Application.Run ();
                }
        }
}
```

