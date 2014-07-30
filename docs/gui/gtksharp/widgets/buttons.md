---
title: "GtkSharp: Buttons"
redirect_from:
  - /GtkSharp:_Buttons/
  - /GtkSharp:_Normal_Buttons/
---

Normal Buttons
==============

There are two ways to create normal [buttons](http://docs.go-mono.com/index.aspx?link=T:Gtk.Button):

``` csharp
Button button1 = new Button("labeltext");
```

or

``` csharp
Button button1 = Button.NewWithMnemonic("Hello World");
```

After creating a button using its argument-less constructor, it's then up to you to pack a label or pixmap into this new button. To do this, create a new box, and then pack your objects into this box using the usual [Gtk.Box.PackStart](http://docs.go-mono.com/index.aspx?link=M:Gtk.Box.PackStart), and then use [Gtk.Container.Add](http://docs.go-mono.com/index.aspx?link=M:Gtk.Container.Add) to pack the button into the box.

Here's an example of creating a button with a image and a label in it. I've broken up the code to create a box from the rest so you can use it in your programs. There are further examples of using images later in the tutorial.

[Image:buttons.png]

``` csharp
// /samples/tutorial/buttons/buttons.cs - Gtk# Tutorial example
//
// Author: Johannes Roith <johannes@jroith.de>
//
// (c) 2002 Johannes Roith
 
namespace GtkSharpTutorial {
 
        using Gtk;
        using System;
        using System.Drawing;
 
 
        public class buttons
        {
 
                /* Create a new hbox with an image and a label packed into it
                 * and return the box. */
 
                static Widget xpm_label_box(string xpm_filename, string label_text )
                {
 
 
                        /* Create box for image and label */
                        HBox box = new HBox(false, 0);
                        box.BorderWidth =  2;
 
                        /* Now on to the image stuff */
                        Gtk.Image image = new Gtk.Image(xpm_filename);
 
                        /* Create a label for the button */
                        Label label = new Label (label_text);
 
                        /* Pack the image and label into the box */
                        box.PackStart (image, false, false, 3);
                        box.PackStart(label, false, false, 3);
 
                        image.Show();
                        label.Show();
 
                        return box;
                }
 
 
                /* Our usual callback function */
                static void callback( object obj, EventArgs args)
                {
                        Console.WriteLine("Hello again - cool button was pressed");
                }
 
                /* another callback */
                static void delete_event (object obj, DeleteEventArgs args)
                {
                        Application.Quit();
                }
 
                public static void Main(string[] args)
                {
 
                        Application.Init();
 
                        /* Create a new window */
                        Window window = new Window ("Pixmap'd Buttons!");
 
                        /* It's a good idea to do this for all windows. */
                        window.DeleteEvent += delete_event;
 
                        /* Sets the border width of the window. */
                        window.BorderWidth = 10;
 
                        /* Create a new button */
                        Button button = new Button();
 
                        /* Connect the "clicked" signal of the button to our callback */
                        button.Clicked += callback;
 
                        /* This calls our box creating function */
                        Widget box = xpm_label_box ("info.xpm", "cool button");
 
                        /* Pack and show all our widgets */
                        box.Show();
 
                        button.Add(box);
 
                        button.Show();
 
                        window.Add(button);
 
                        window.ShowAll();
 
                        /* Rest in gtk_main and wait for the fun to begin! */
                        Application.Run();
                }
        }
}
```

Toggle Buttons
==============

ToggleButtons are similiar to normal buttons, but they keep track of their state--- up or down. When you click on one, it will be pushed down, and when you click again, it will pop back up. Click again, and it will pop back down. When popped down, the button's Active property has the value "true". Toggle buttons are the basis for check buttons and radio buttons; as such, many of the calls used for toggle buttons are inherited by radio and check buttons.

``` csharp
        using Gtk;
        using System;
        using System.Drawing;
 
        public class togglebuttons
        {
 
 
                public static void Main(string[] args)
                {
 
                        Application.Init();   
 
 
                        Window window = new Window("toggle buttons");
 
                        window.DeleteEvent += delete_event;
 
/* Creating a new ToggleButton*/
 
                        ToggleButton togglebutton = new ToggleButton  ("button1");
                        togglebutton.Clicked += clickedCallback;
 
 
                        window.Add(togglebutton);
                        window.ShowAll();
 
                        Application.Run();
 
                }
 
                static void delete_event (object obj, DeleteEventArgs args)
                {
 
                        Application.Quit();
                }
 
                static void clickedCallback (object obj, EventArgs args)
                {
/* Check Active Property */
 
                        if (((ToggleButton) obj).Active)
                                Console.WriteLine ("ToggleButton clicked, I'm activating");
                }
        }
```

Check Buttons
=============

Check buttons inherit many properties and functions from the the toggle buttons above, but look a little different. Rather than being buttons with text inside them, they are small squares with the text to the right of them. These are often used for toggling options on and off in applications.

The creation functions are similar to those of the normal button.

``` csharp
GtkWidget CheckButton1 = new CheckButton();
GtkWidget CheckButton1 = new CheckButtonWithLabel(string label);
GtkWidget CheckButton1 = new CheckButtonWithMnemonic(string label);
```

The CheckButtonWithLabel() function creates a check button with a label beside it. Checking the state of the check button is identical to that of the toggle button.

Radio Buttons
=============

``` csharp
// radiobuttons.cs - Gtk# Tutorial example
//
// Author: Johannes Roith <johannes@jroith.de>
//
// (c) 2002 Johannes Roith
 
namespace GtkSharpTutorial {
 
 
        using Gtk;
        using System;
        using System.Drawing;
 
 
        public class radiobuttons
        {
 
                static GLib.SList group = null;
 
                static void delete_event (object obj, DeleteEventArgs args)
                {
                        Application.Quit();
                }
 
                static void exitbutton_event (object obj, EventArgs args)
                {
                        Application.Quit();
                }
 
                public static void Main(string[] args)
                {
 
                        Application.Init();   
 
 
                        Window window = new Window("radio buttons");
 
                        window.DeleteEvent += delete_event;
 
                        window.BorderWidth = 0;
 
                        VBox box1 = new VBox (false, 0);
                        window.Add(box1);
                        box1.Show();
 
                        VBox box2 = new VBox (false, 10);
                        box2.BorderWidth = 10;
                        box1.PackStart(box2, true, true, 0);
                        box2.Show();
 
                        RadioButton radiobutton = new RadioButton  (null, "button1");
                        box2.PackStart(radiobutton, true, true, 0);
                        radiobutton.Show();
                        group = radiobutton.Group;
                        RadioButton radiobutton2 = new RadioButton(group, "button2");
                        radiobutton2.Active = true;
                        box2.PackStart(radiobutton2, true, true, 0);
                        radiobutton2.Show();
 
                        RadioButton  radiobutton3 = RadioButton.NewWithLabelFromWidget(radiobutton, "button3");
                        box2.PackStart(radiobutton3, true, true, 0);
                        radiobutton3.Show();
 
                        HSeparator separator = new HSeparator ();
                        box1.PackStart (separator,false, true, 0);
                        separator.Show();
 
                        VBox box3 = new VBox(false, 10);
                        box3.BorderWidth = 10;
                        box1.PackStart(box3,false, true, 0);
                        box3.Show();
 
                        Button button = new Button ("close");
                        button.Clicked += exitbutton_event;
 
                        box3.PackStart(button, true, true, 0);
                        button.CanDefault = true;
                        button.GrabDefault();
                        button.Show();
 
                        window.ShowAll();
 
                        Application.Run();
 
                }
        }
}
```

