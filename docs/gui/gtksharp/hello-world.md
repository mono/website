---
layout: docpage
navgroup: docs
title: "GtkSharp: Hello World"
---

A Hello World program with Gtk\#:

``` csharp
using Gtk;
using System;
 
class Hello {
 
        static void Main()
        {
                Application.Init ();
 
                Window window = new Window ("helloworld");
                window.Show();
 
                Application.Run ();
 
        }
}
```

To compile this code:

``` bash
mcs helloworld.cs -pkg:gtk-sharp-2.0
```

It's a bit longer than console hello world and needs some explanation.

Every Gtk\# application must import the Gtk namespace:

``` csharp
using Gtk;
```

If you don't do so, each class from one of these namespaces will need the namespace mentioned as a prefix.

Now, let's walk through Main().

``` csharp
Application.Init()
```

This initializes GTK and is needed in every Gtk\# application.

Now, create a Window object; the first parameter is the title of the window. To display it, call Show().

``` csharp
Window window = new Window ("helloworld");
window.Show();
```

Now that the window is drawn, run the main appliction loop, which displays everything and waits for events. This loop will run until Quit() is called.

``` csharp
Application.Run()
```

Note that you'll need to exit this program with CTRL-C, as it doesn't have code to handle quitting more elegantly. For how to fix this, read on.

HelloWorld, second try
----------------------

Here's a more elegant version of the above. It knows how to quit elegantly, and we'll use it to introduce *event handling*in Gtk\#.

``` csharp
        using Gtk;
        using System;
 
        class Hello {
 
                static void Main()
                {
                        Application.Init ();
 
                    // Set up a button object.
                        Button btn = new Button ("Hello World");
                        // when this button is clicked, it'll run hello()
                        btn.Clicked += new EventHandler (hello);
 
                        Window window = new Window ("helloworld");
                    // when this window is deleted, it'll run delete_event()
                        window.DeleteEvent += delete_event;
 
                    // Add the button to the window and display everything
                    window.Add (btn);
                        window.ShowAll ();
 
                        Application.Run ();
                }
 
 
            // runs when the user deletes the window using the "close
            // window" widget in the window frame.
                static void delete_event (object obj, DeleteEventArgs args)
                {
                            Application.Quit ();
                }
 
                // runs when the button is clicked.
                static void hello (object obj, EventArgs args)
                {
                        Console.WriteLine("Hello World");
                        Application.Quit ();
                }
        }
```

Gtk\# is an event driven toolkit, which means it will sleep in Application.Run() until an event occurs and control is passed to the appropriate function. Gtk\# can make use of the type "event". When you close the "HelloWorld" window, the window throws an event of type DeleteEvent. To enable your application to react on the DeleteEvent, you must connect it to an event handler.

``` csharp
window.DeleteEvent += delete_event;
```

An event handler gets passed four parameters: an object, the object that fired the event, the window, and an EventArgs object. In this case, the EventArgs have the special type DeleteEventArgs).

``` csharp
                static void delete_event (object obj, DeleteEventArgs args)
                {
                            Application.Quit ();
                }
```

This sample also adds a button to the window and connects the clicked event to "hello".

An example in MonoBasic
-----------------------

The following MonoBasic code is similar to the above, but it has several different buttons. It also illustrates basic window layout using VBox objects.

``` csharp
imports System
imports Gtk
 
Public Module ToggleButtons
 
        Sub OnDeleteEvent ( ByVal obj as object, ByVal args as DeleteEventArgs )
                Application.Quit()
        End Sub
 
        Sub OnExitButtonEvent ( ByVal obj as object, ByVal args as EventArgs )
                Application.Quit()
        End Sub
 
        Public Sub Main ()
                Application.Init()
 
                Dim window as Window = new Window("Toggle Buttons")
                AddHandler window.DeleteEvent, AddressOf OnDeleteEvent
                window.BorderWidth = 0
 
                Dim box1 as VBox = new VBox (false, 10)
                window.Add(box1)
                box1.Show()
 
                Dim box2 as VBox = new VBox (false, 10)
                box2.BorderWidth = 10
                box1.PackStart(box2, true, true, 0)
                box2.Show()
 
                Dim toggleButton as ToggleButton = new ToggleButton ("Button 1")
                box2.PackStart(toggleButton, true, true, 0)
                toggleButton.Show()
 
                Dim toggleButton2 as ToggleButton = new ToggleButton ("Button 2")
                toggleButton2.Active = true
                box2.PackStart(toggleButton2, true, true, 0)
                toggleButton2.Show()
 
                Dim separator as HSeparator = new HSeparator ()
                box1.PackStart(separator, false, true, 0)
                separator.Show()
 
                Dim box3 as VBox = new VBox (false, 10)
                box3.BorderWidth = 10
                box1.PackStart(box3, false, true, 0)
 
                Dim button as Button = new Button("Close")
                AddHandler button.Clicked, AddressOf OnExitButtonEvent
 
                box3.PackStart(button, true, true, 0)
                button.CanDefault = true
                button.GrabDefault()
                button.Show()
 
                window.ShowAll() 
 
                Application.Run()
        End Sub
 
End Module
```

