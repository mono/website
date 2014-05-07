---
layout: obsolete
title: "GtkSharp: Progress Bars"
permalink: /old_site/GtkSharp:_Progress_Bars/
redirect_from:
  - /GtkSharp:_Progress_Bars/
---

GtkSharp: Progress Bars
=======================

Progress bars are used to show the status of an operation. They are pretty easy to use, as you will see with the code below. But first lets start out with the calls to create a new progress bar.

    ProgressBar progressbar1 = new ProgressBar();

Now that the progress bar has been created we can use it.

    progressbar1.Fraction = 0.5;

The value is the amount "completed", meaning the amount the progress bar has been filled from 0-100%. It can be a number form 0 to 1, e.g. 0.55 would be 55%. Gtk\# has functionality that enables it to display its value in different ways, and to inform the user of its current value and its range.

A progress bar may be set to one of a number of orientations using the Orientation property, which can be one of Gtk.Progress.LeftToRight, Gtk.Progress.RightToLeft, Gtk.Progress.BottomToTop, or Gtk.Progress.TopToBottom.

As well as indicating the amount of progress that has occured, the progress bar may be set to just indicate that there is some activity. This can be useful in situations where progress cannot be measured against a value range. The following method indicates that some progress has been made.

    progressbar1.Pulse();

The step size of the activity indicator is set using the following property.

    progressbar1.PulseStep = 0.1;

When not in activity mode, the progress bar can also display a configurable text string within its trough, using the Text property.

Here is an example of the progress bar, updated using timeouts. This code also shows you how to reset the Progress Bar.

[Image:progress.png]

``` csharp
using GLib;
using Gtk;
using System;
 
class ProgressBarSample {
    public struct ProgressData {
        public Gtk.Window window;
        public Gtk.ProgressBar pbar;
        public uint timer;
        public bool activity_mode;
    }
 
    static ProgressData pdata;
 
    /* Update the value of the progress bar so that we get
     * some movement */
    static bool progress_timeout()
    {
        double new_val;
 
        if (pdata.activity_mode)
            pdata.pbar.Pulse();
        else {
            /* Calculate the value of the progress bar using the
             * value range set in the adjustment object */
            new_val = pdata.pbar.Fraction + 0.01;
            if (new_val > 1.0)
                new_val = 0.0;
 
            /* Set the new value */
            pdata.pbar.Fraction = new_val;
        }
 
        /* As this is a timeout function, return TRUE so that it
         * continues to get called */
 
        return true;
    }
 
 
    /* Callback that toggles the text display within the progress bar trough */
    static void toggle_show_text (object obj, EventArgs args)
    {
        if (pdata.pbar.Text == "")
            pdata.pbar.Text = "some text";
        else
            pdata.pbar.Text = "";
    }
 
    /* Callback that toggles the activity mode of the progress bar */
    static void toggle_activity_mode (object obj, EventArgs args)
    {
        pdata.activity_mode = !pdata.activity_mode;
        if (pdata.activity_mode)
            pdata.pbar.Pulse();
        else
            pdata.pbar.Fraction = 0.0;
    }
 
    /* Callback that toggles the orientation of the progress bar */
    static void toggle_orientation (object obj, EventArgs args)
    {
        switch (pdata.pbar.Orientation) {
            case Gtk.ProgressBarOrientation.LeftToRight:
                pdata.pbar.Orientation = Gtk.ProgressBarOrientation.RightToLeft;
                break;
            case Gtk.ProgressBarOrientation.RightToLeft:
                pdata.pbar.Orientation = Gtk.ProgressBarOrientation.LeftToRight;
                break;
            }
    }
 
 
    static void destroy_progress (object obj, DeleteEventArgs args)
    {
        app_quit();
    }
 
    static void button_click (object obj, EventArgs args)
    {
        app_quit();
    }
 
    static void app_quit() {
        GLib.Source.Remove (pdata.timer);
        pdata.timer = 0;
        Application.Quit ();
    }
 
    static void Main()
    {
        Gtk.HSeparator separator;
        Gtk.Table table;
        Gtk.Button button;
        Gtk.CheckButton check;
        Gtk.VBox vbox;
 
        Application.Init ();
 
        /* Allocate memory for the data that is passed to the callbacks*/
        pdata = new ProgressData();
        pdata.activity_mode = false;
        pdata.window = new Gtk.Window(Gtk.WindowType.Toplevel);
        pdata.window.Resizable = true;
 
        pdata.window.DeleteEvent += destroy_progress;
        pdata.window.Title = "GtkProgressBar";
        pdata.window.BorderWidth = 0;
 
        vbox = new Gtk.VBox(false, 5);
        vbox.BorderWidth = 10;
        pdata.window.Add(vbox);
        vbox.Show();
 
        /* Create a centering alignment object */
        Gtk.Alignment align = new Gtk.Alignment( 1, 1, 0, 0);
        vbox.PackStart(align, false, false, 5);
        align.Show();
 
        /* Create the GtkProgressBar */
        pdata.pbar = new Gtk.ProgressBar();
        pdata.pbar.Text = "";
        align.Add(pdata.pbar);
        pdata.pbar.Show();
 
        /* Add a timer callback to update the value of the progress bar*/
        pdata.timer = GLib.Timeout.Add(100, new GLib.TimeoutHandler (progress_timeout) );
 
 
        separator = new Gtk.HSeparator();
        vbox.PackStart(separator, false, false, 0);
        separator.Show();
 
        /* rows, columns, homogeneous */
        table = new Gtk.Table(2, 3, false);
        vbox.PackStart(table, false, true, 0);
        table.Show();
 
        /* Add a check button to select displaying of the trough text*/
        check = new Gtk.CheckButton("Show text");
        table.Attach(check, 0, 1, 0, 1, 
                Gtk.AttachOptions.Expand | Gtk.AttachOptions.Fill, 
                Gtk.AttachOptions.Expand | Gtk.AttachOptions.Fill, 
                5, 5);
        check.Clicked += toggle_show_text;
        check.Show();
 
        /* Add a check button to toggle activity mode */
        check = new Gtk.CheckButton("Activity mode");
        table.Attach(check, 0, 1, 1, 2, 
                Gtk.AttachOptions.Expand | Gtk.AttachOptions.Fill, 
                Gtk.AttachOptions.Expand | Gtk.AttachOptions.Fill, 
                5, 5);
        check.Clicked += toggle_activity_mode;
        check.Show();
 
        /* Add a check button to toggle orientation */
        check = new Gtk.CheckButton("Right to Left");
        table.Attach(check, 0, 1, 2, 3, 
                Gtk.AttachOptions.Expand | Gtk.AttachOptions.Fill, 
                Gtk.AttachOptions.Expand | Gtk.AttachOptions.Fill, 
                5, 5);
        check.Clicked += toggle_orientation;
        check.Show();
 
        /* Add a button to exit the program */
        button = new Gtk.Button("close");
        button.Clicked += button_click;
        vbox.PackStart(button, false, false, 0);
 
        /* This makes it so the button is the default. */
        button.CanDefault = true;
 
        /* This grabs this button to be the default button. Simply hitting
        * the "Enter" key will cause this button to activate. */
        button.GrabDefault();
        button.Show();
 
        pdata.window.ShowAll();
 
        Application.Run ();
    }
}
```

