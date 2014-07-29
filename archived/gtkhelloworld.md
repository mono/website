---
layout: obsolete
title: "Gtk:HelloWorld"
lastmodified: '2005-10-19'
permalink: /archived/Gtk:HelloWorld/
redirect_from:
  - /Gtk:HelloWorld/
---

Gtk:HelloWorld
==============

 Here is a basic Gtk\# application, written in C\#.

``` csharp
// helloworld.cs - Gtk# Tutorial example
 
using Gtk;
using GtkSharp;
using System;
using System.Drawing;
 
public class HelloWorld {
    // This is a callback function. The data arguments are ignored
    // in this example. More on callbacks below.
    static void hello (object obj, EventArgs args)
    {
        Console.WriteLine("Hello World");
        Application.Quit ();
    }
 
    static void delete_event (object obj, DeleteEventArgs args)
    {
        // If you return FALSE in the "delete_event" signal handler,
        // GTK will emit the "destroy" signal. Returning TRUE means
        // you don't want the window to be destroyed.
        // This is useful for popping up 'are you sure you want to quit?'
        // type dialogs.
 
            Console.WriteLine ("delete event occurred\n");
            Application.Quit ();
    }
 
    public static void Main(string[] args)
    {
        // This is called in all GTK applications. Arguments are parsed
        // from the command line and are returned to the application. */
        Application.Init ();
 
        // create a new window
        Window window = new Window ("helloworld");
 
        // When the window is given the "delete_event" signal (this is given
        // by the window manager, usually by the "close" option, or on the
        // titlebar), we ask it to call the delete_event () function
        // as defined above. The data passed to the callback
        // function is NULL and is ignored in the callback function.
 
        window.DeleteEvent += new DeleteEventHandler (delete_event);
 
        // Sets the border width of the window.
        window.BorderWidth = 10;
 
        // Creates a new button with the label "Hello World".
        Button btn = new Button ("Hello World");
 
        // When the button receives the "clicked" signal, it will call the
        // function hello() passing it null as its argument.  The hello()
        // function is defined above.
        btn.Clicked += new EventHandler (hello);
 
        // This packs the button into the window (a gtk container).
        window.Add (btn);
 
        // The final step is to display this newly created 
        window.ShowAll ();
 
        // All GTK applications must call the main loop: Application.Run
        // Events are processed and dispatched here.
 
        Application.Run ();
    }
}
```

To compile with Mono, type

``` bash
$ mcs hello.cs
```

This results in a file hello.exe, that you can execute with mono:

``` bash
$ mono hello.exe
```

