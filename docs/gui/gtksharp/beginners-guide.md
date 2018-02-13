---
title: GtkSharpBeginnersGuide
redirect_from:
  - /GtkSharpBeginnersGuide/
---

Preface
=======

This article is a beginners guide to Gtk# programming. It will help those who have never programmed a Gtk+ GUI before to get started. Programmers familiar with the Gtk+ API from other languages (e.g. C, C++, perl, python) will also find it useful as it explains the basic process under Mono/C#. The article also introduces the use of Glade and libglade as a process for rapidly implementing graphic user interfaces.

What is Gtk#?
--------------

[Gtk#](/docs/gui/gtksharp/) put simply is a wrapper on [gtk+](http://www.gtk.org), a cross platform GUI framework.

Adapted from the [gtk+ website](http://www.gtk.org/): *gtk+ is a multi-platform toolkit for creating graphical user interfaces. Offering a complete set of widgets, gtk+ is suitable for projects ranging from small one-off toys to Enterprise application suites.*

Currently gtk+ works natively on any X server, Direct Framebuffer system and Microsoft Windows NT derivitives. The library originates from Linux where it provides a basis for the popular [GNOME](http://www.gnome.org/) desktop environment. gtk+ is routinely included in most Linux distributions, and has been stable on Windows NT derivitives for quite a while now (probably roughly around 2000, if my memory serves me correctly).

A native port to Mac OSX is planned but needs warm bodies. This is a call for participation.

One common misconception is that GTK# requires Mono to work. This is far from the truth. GTK# will run on any .NET compatible runtime. GTK# is regularly tested on MS.NET and Mono but should run on any fully compliant runtime. This means if you write your applications in GTK# and wished to run on Windows as well, you can choose to deploy with just GTK# and use Microsoft's runtime, or alternately deploy with Mono's runtime for Windows.

Getting Set Up
==============

Download/Install GTK#
----------------------

First thing you will want to do is get your GTK# install up and running.

**Linux, MacOSX, FreeBSD, and others:** See if your distribution has GTK# development packages as well as any Mono packages first. If not, check out [Downloads](/download/stable/) to find a package that works for you. In the worst case, you may be forced to build yourself from source.

**Windows:** If you are using Windows, pick yourself up a copy of the integrated installer from that [Downloads](/download/stable/) page. You might also like to grab a copy of the Gtk# integration package for Visual Studio which will allow you to use GTK# with Microsoft's Visual Studio without installing the rest of Mono.

Inside the GTK# libraries
--------------------------

**Gtk# Components**<br/>
Gtk# is composed of three modules: gtk-sharp, gnome-sharp, and gnome-desktop-sharp.

**Module:**

***gtk-sharp***

[glib-sharp](http://docs.go-mono.com/index.aspx?link=N:GLib)

Portions of the glib 2.x libraries which provide a low-level non-GUI core library for gtk+.

[pango-sharp](http://docs.go-mono.com/index.aspx?link=N:Pango)

The [Pango](http://www.pango.org) international text layout and rendering library.

[atk-sharp](http://docs.go-mono.com/index.aspx?link=N:Atk)

The atk Accessibility framework.

[gdk-sharp](http://docs.go-mono.com/index.aspx?link=N:Gdk)

Drawing Kit using by gtk+.

[gtk-sharp](http://docs.go-mono.com/index.aspx?link=N:Gtk)

The Gtk 2.x toolkit, a cross-platform toolkit for creating graphical user interfaces

[glade-sharp](http://docs.go-mono.com/index.aspx?link=N:Glade)

Supports dynamic loading of [Glade](http://glade.gnome.org) interface builder files.

[gtk-dotnet](http://docs.go-mono.com/index.aspx?link=N:Gtk.DotNet)

Integration of the Gtk# namespace with System.Drawing.

**Module:**

***gnome-sharp***

[art-sharp](http://docs.go-mono.com/index.aspx?link=N:Art)

A vector and rendering library.

[gnome-sharp](http://docs.go-mono.com/index.aspx?link=N:Gnome)**\***

[GNOME](http://www.gnome.org) program initialization, printing, panel access, and assorted widgets.

[gnomevfs-sharp](http://docs.go-mono.com/index.aspx?link=N:GnomeVfs)**\***

File, MIME type, icon, and various GNOME file system interaction functionality.

[gconf-sharp](http://docs.go-mono.com/index.aspx?link=N:GConf)**\***

Configuration storage system on Gnome

**Module:**

***gnome-desktop-sharp***

[gtkhtml-sharp](http://docs.go-mono.com/index.aspx?link=T:Gtk.HTML)**\***

A lightweight HTML widget.

gtksourceview2-sharp**\***

A source code editing and viewing widget library.

nautilusburn-sharp**\***

GNOME CD/DVD burning library.

[rsvg-sharp](http://docs.go-mono.com/index.aspx?link=N:Rsvg)

SVG rendering library.

[vte-sharp](http://docs.go-mono.com/index.aspx?link=N:Vte)**\***

The VTE terminal emulator.

wnck-sharp**\***

Window navigator construction kit library.

**\*** *Not not available on the Windows GTK# package*

Choosing Gtk# or Glade#
-------------------------

When people start out they sometimes get confused on what to use, Gtk# or Glade#. For that you need to understand what Glade# is and what Gtk# is. Gtk# is the core of the windowing and widget system (a widget is like a control in SWF). Glade# inherits Gtk# so its a subset of Gtk# and usually compatible, but it automatically layouts out the widgets with an XML based resource file. The XML to layout your GUI can be generated with the Glade tool, a WYSIWYG GUI designer studio.

For most windows, Glade# is perfect. It saves time by cutting out all the code to generate the UI and makes it very easy to change in the future. The problem is, depending on what you are doing, Glade# can get annoying and sometimes its impossible to do what you want to do sometimes when your window does something special (hide elements, dynamically load new parts, re-parent widgets, etc. ). Only experience can help you understand which is best for each use.

For a quick introduction to Glade# you might wish to take a look at [this screencast](http://nat.org/demos/gtksharp.html) by [Nat Friedman](http://nat.org) in which hey creates a simple graphical application in just a couple of minutes.

Your first GTK# application
============================

Step 1: Get Comfortable
-----------------------

We need to get comfortable. Get a Dr. Pepper and turn on some music. Good, now we are ready.

Step 2: Create our folder and files
-----------------------------------

The first part we need to do is create a new folder for our little project. (Windows users: Lets avoid spaces in the folder name just to take out any headaches).

You will then want to open a shell (if you are on windows, open the Start menu and go to "Programs-\>Mono 1.x.x-\>Mono Command Prompt" and will set up your paths so you don't have to do anything extra). You will want to cd to that directory we just created. We are going to be using this window a lot, so leave it running in the background.

Now go ahead, open up your favorite editor (MonoDevelop, vi, emacs, notepad, etc.) and set up a new blank project (if applicable) and create a new blank file. Go ahead and save this file as "helloworld.cs".

Step 3: Laying it out
---------------------

I'm assuming that you are familiar with C#, so most of this will look normal. We will need to create a new to reference Gtk# and create a new class and entry point for out application. It should look something like this.

``` csharp
 using System;
 using Gtk;
 
 public class GtkHelloWorld {
 
   public static void Main() {
     Console.WriteLine("HelloWorld");
   }
 
 }
```

That should look pretty familiar to you. Just so we can get used to using the command compiler lets go ahead and save this. Then switch back to our shell window and go ahead and run:

    mcs -pkg:gtk-sharp-2.0 helloword.cs

To some of you that have used the csc compiler on windows may notice the "-pkg:" as a little odd. This doesn't exist in csc because Mono comes from the world of Linux. What that does is lookup for a package config file under that name. In the package config folder exists a file name "gtk-sharp-2.0.pc" which contains (amongst other information) on the location of the libraries for that package. That way we don't have to type out "-r:gtk-sharp-2.0.dll -r:atk-sharp-2.0.dll -r:pango-sharp-2.0.dll ...." all by hand.

Step 4: Adding the GUI
----------------------

Now lets jump back to our code. Go ahead and remove the "Console.WriteLine" statement. The first thing we are going to do is create a new window. We do this by adding a new Window statement and an application block (to start the main thread loop). Like so:

``` csharp
 using System;
 using Gtk;
 
 public class GtkHelloWorld {
 
   public static void Main() {
     Application.Init();
 
     //Create the Window
     Window myWin = new Window("My first GTK# Application! ");
     myWin.Resize(200,200);
 
     //Create a label and put some text in it.
     Label myLabel = new Label();
     myLabel.Text = "Hello World!!!!";
 
     //Add the label to the form
     myWin.Add(myLabel);
 
     //Show Everything
     myWin.ShowAll();
 
     Application.Run();
   }
 }
```

Now just compile like we did before and run it using \`mono HelloWorld.exe\` and you should get something like this:

[![HelloWorld.exe running...](/archived/images/9/9d/Screenshot-MyfirstGTKApp.png)](/archived/images/9/9d/Screenshot-MyfirstGTKApp.png "HelloWorld.exe running...")

Pretty easy, isn't it?"

The first thing that you might notice, if you have used System.Windows.Forms is that we didn't add any layout code for our label. For example we didn't say 'myLabel.Left = 100' or 'myLabel.Width = 200' or anything that to add the label to the form, and just simply said 'myWin.Add(...)'. This is because a 'Gtk.Window' is a widget that inherits from a '[Bin](http://www.go-mono.com/docs/index.aspx?link=T%3aGtk.Bin)', or single widget hosting '[Container](http://www.go-mono.com/docs/index.aspx?link=T%3aGtk.Container)'.

The other part you may be interested in is what the "Application.Init()" and "Application.Run()" statements are for. If you have ever used System.Windows.Forms, its similar to "Application.Run()" in many ways. Normally, when the application gets done processing any code on its main thread the application will stop. Since "ShowAll()" doesn't block the code would continue on and shut down. The "Application.Init()" command tells the runtime to listen for any Gtk.Windows launched and when you run the run command it starts a the main loop on those windows. This keeps the application running until all the windows are closed. For more information check out the Monodoc information on the [Application](http://www.go-mono.com/docs/index.aspx?tlink=6@ecma%3a830%23Application%2f) object.

Step 5: Laying out the window
-----------------------------

Now you maybe asking yourself, "How do you then add more then one widget to a window if it can only contain one widget?". Well like before how we said that a Window was a widget with a single widget container, well we have other widgets that have the ability to contain multiple widgets at the same time. Some of those widgets will inherit from a '[Gtk.Box](http://www.go-mono.com/docs/index.aspx?link=T%3aGtk.Box)' container widget or from the container widget directly in some cases. A Bin container widget inherits form the container widget directly as well, just like all other widget containers, but a Bin can only contain one control.

In order to have multiple widgets on our Window (since its a Bin) we need to add one of these widgets that can contain multiple widgets. There are tons of controls that can do this but we will concern ourselves at this point with a few of the basic ones like '[HBox](http://www.go-mono.com/docs/index.aspx?link=T%3aGtk.HBox)', '[VBox](http://www.go-mono.com/docs/index.aspx?link=T%3aGtk.VBox)', and maybe a '[Table](http://www.go-mono.com/docs/index.aspx?link=T%3aGtk.Table)'.

Step 6: Adding Events
---------------------

All the classes that derive from '[Widget](http://www.go-mono.com/docs/index.aspx?link=T%3aGtk.Widget)' provide the following events:

-   [ButtonPressEvent](http://www.go-mono.com/docs/monodoc.ashx?link=E%3aGtk.Widget.ButtonPressEvent)
-   [ButtonReleaseEvent](http://www.go-mono.com/docs/monodoc.ashx?link=E%3aGtk.Widget.ButtonReleaseEvent)
-   [ScrollEvent](http://www.go-mono.com/docs/monodoc.ashx?link=E%3aGtk.Widget.ScrollEvent)
-   [MotionNotifyEvent](http://www.go-mono.com/docs/monodoc.ashx?link=E%3aGtk.Widget.MotionNotifyEvent)
-   [DeleteEvent](http://www.go-mono.com/docs/monodoc.ashx?link=E%3aGtk.Widget.DeleteEvent)
-   [DestroyEvent](http://www.go-mono.com/docs/monodoc.ashx?link=E%3aGtk.Widget.DestroyEvent)
-   [ExposeEvent](http://www.go-mono.com/docs/monodoc.ashx?link=E%3aGtk.Widget.ExposeEvent)
-   [KeyPressEvent](http://www.go-mono.com/docs/monodoc.ashx?link=E%3aGtk.Widget.KeyPressEvent)
-   [KeyReleaseEvent](http://www.go-mono.com/docs/monodoc.ashx?link=E%3aGtk.Widget.KeyReleaseEvent)
-   [EnterNotifyEvent](http://www.go-mono.com/docs/monodoc.ashx?link=E%3aGtk.Widget.EnterNotifyEvent)
-   [LeaveNotifyEvent](http://www.go-mono.com/docs/monodoc.ashx?link=E%3aGtk.Widget.LeaveNotifyEvent)
-   [ConfigureEvent](http://www.go-mono.com/docs/monodoc.ashx?link=E%3aGtk.Widget.ConfigureEvent)
-   [FocusInEvent](http://www.go-mono.com/docs/monodoc.ashx?link=E%3aGtk.Widget.FocusInEvent)
-   [FocusOutEvent](http://www.go-mono.com/docs/monodoc.ashx?link=E%3aGtk.Widget.FocusOutEvent)
-   [MapEvent](http://www.go-mono.com/docs/monodoc.ashx?link=E%3aGtk.Widget.MapEvent)
-   [UnmapEvent](http://www.go-mono.com/docs/monodoc.ashx?link=E%3aGtk.Widget.UnmapEvent)
-   [PropertyNotifyEvent](http://www.go-mono.com/docs/monodoc.ashx?link=E%3aGtk.Widget.PropertyNotifyEvent)
-   [SelectionClearEvent](http://www.go-mono.com/docs/monodoc.ashx?link=E%3aGtk.Widget.SelectionClearEvent)
-   [SelectionRequestEvent](http://www.go-mono.com/docs/monodoc.ashx?link=E%3aGtk.Widget.SelectionRequestEvent)
-   [SelectionNotifyEvent](http://www.go-mono.com/docs/monodoc.ashx?link=E%3aGtk.Widget.SelectionNotifyEvent)
-   [ProximityInEvent](http://www.go-mono.com/docs/monodoc.ashx?link=E%3aGtk.Widget.ProximityInEvent)
-   [ProximityOutEvent](http://www.go-mono.com/docs/monodoc.ashx?link=E%3aGtk.Widget.ProximityOutEvent)
-   [VisibilityNotifyEvent](http://www.go-mono.com/docs/monodoc.ashx?link=E%3aGtk.Widget.VisibilityNotifyEvent)
-   [ClientEvent](http://www.go-mono.com/docs/monodoc.ashx?link=E%3aGtk.Widget.ClientEvent)
-   [NoExposeEvent](http://www.go-mono.com/docs/monodoc.ashx?link=E%3aGtk.Widget.NoExposeEvent)
-   [WindowStateEvent](http://www.go-mono.com/docs/monodoc.ashx?link=E%3aGtk.Widget.WindowStateEvent)

Many of these events can be handled with a standard event handler. For example:

``` csharp
public static void HandlerMethod(object obj, EventArgs args)
```

For example, to handle a button click event:

``` csharp
public static void ButtonPressHandler(object obj, ButtonPressEventArgs args)
```

ButtonPressEventArgs is a class derived from EventArgs. The class ButtonPressEventArgs, like many others in Gtk#, adds the property Gtk.Event (or something derived from Gtk.Event) to EventArgs.

Gdk.Event types are:

-   EventType.Nothing
-   EventType.Delete
-   EventType.Destroy
-   EventType.Expose
-   EventType.MotionNotify
-   EventType.ButtonPress
-   EventType.TwoButtonPress
-   EventType.ThreeButtonPress
-   EventType.ButtonRelease
-   EventType.KeyPress
-   EventType.KeyRelease
-   EventType.EnterNotify
-   EventType.LeaveNotify
-   EventType.FocusChange
-   EventType.Configure
-   EventType.Map
-   EventType.Unmap
-   EventType.PropertyNotify
-   EventType.SelectionClear
-   EventType.SelectionRequest
-   EventType.SelectionNotify
-   EventType.ProximityIn
-   EventType.ProximityOut
-   EventType.DragEnter
-   EventType.DragLeave
-   EventType.DragMotion
-   EventType.DragStatus
-   EventType.DropStart
-   EventType.DropFinished
-   EventType.ClientEvent
-   EventType.VisibilityNotify
-   EventType.NoExpose
-   EventType.Scroll
-   EventType.WindowState
-   EventType.Setting

For example, to use the event Gdk.Event, we could use something like this:

``` csharp
using Gdk;
    ...
    widget.ButtonPressEvent += new ButtonPressEventHandler(ButtonPressHandler);
    ...
    private void ButtonPressHandler(object obj, ButtonPressEventArgs args) {
        // single click
        if (args.Event.Type == EventType.ButtonPress) {
            ...
        }
        // double click
        if (args.Event.Type == EventType.TwoButtonPress) {
            ...
        }
 
        // the left button was used
        if (args.Event.Button == 1) {
            ...
        }
    }
```

In the above example you can see how we can determine whether the mouse was clicked only once or if it was double clicked.

Your First Glade# Application
==============================

Step 1: What is Glade#
-----------------------

Glade# is a libglade binding in C# to allow us to easily design GUI applications using visual tools and save them to in a format which the application can use at run time to create the interface. Two tools exist at the present for generating glade-format files: [Glade](http://glade.gnome.org/) and of course [Stetic](http://mysterion.org/~danw/blog/2005/03/stetic).

### What are glade files?

Files written in an XML format that represent designs for Gtk+ graphical interfaces; saving all its attributes and properties.

### What does a .glade file look like?

file: gui.glade

``` xml
<?xml version="1.0" standalone="no"?> <!--*- mode: xml -*-->
<!DOCTYPE glade-interface SYSTEM "http://glade.gnome.org/glade-2.0.dtd">
 
<glade-interface>
 
<widget class="GtkWindow" id="window1">
  <property name="visible">True</property>
  <property name="title" translatable="yes">Glade Window</property>
  <property name="type">GTK_WINDOW_TOPLEVEL</property>
  <property name="window_position">GTK_WIN_POS_CENTER</property>
  <property name="modal">False</property>
  <property name="default_width">256</property>
  <property name="default_height">256</property>
  <property name="resizable">True</property>
  <property name="destroy_with_parent">False</property>
  <property name="decorated">True</property>
  <property name="skip_taskbar_hint">False</property>
  <property name="skip_pager_hint">False</property>
  <property name="type_hint">GDK_WINDOW_TYPE_HINT_NORMAL</property>
  <property name="gravity">GDK_GRAVITY_NORTH_WEST</property>
  <property name="focus_on_map">True</property>
 
  <child>
    <widget class="GtkScrolledWindow" id="scrolledwindow1">
      <property name="visible">True</property>
      <property name="can_focus">True</property>
      <property name="hscrollbar_policy">GTK_POLICY_ALWAYS</property>
      <property name="vscrollbar_policy">GTK_POLICY_ALWAYS</property>
      <property name="shadow_type">GTK_SHADOW_IN</property>
      <property name="window_placement">GTK_CORNER_TOP_LEFT</property>
 
      <child>
    <widget class="GtkLayout" id="layout1">
      <property name="visible">True</property>
      <property name="width">400</property>
      <property name="height">400</property>
      <property name="hadjustment">0 0 400 10 212.4 236</property>
      <property name="vadjustment">0 0 400 10 212.4 236</property>
 
      <child>
        <widget class="GtkLabel" id="label1">
          <property name="width_request">38</property>
          <property name="height_request">17</property>
          <property name="visible">True</property>
          <property name="label" translatable="yes">label1</property>
          <property name="use_underline">False</property>
          <property name="use_markup">False</property>
          <property name="justify">GTK_JUSTIFY_LEFT</property>
          <property name="wrap">False</property>
          <property name="selectable">False</property>
          <property name="xalign">0.5</property>
          <property name="yalign">0.5</property>
          <property name="xpad">0</property>
          <property name="ypad">0</property>
          <property name="ellipsize">PANGO_ELLIPSIZE_NONE</property>
          <property name="width_chars">-1</property>
          <property name="single_line_mode">False</property>
          <property name="angle">0</property>
        </widget>
        <packing>
          <property name="x">96</property>
          <property name="y">88</property>
        </packing>
      </child>
 
      <child>
        <widget class="GtkButton" id="button1">
          <property name="width_request">60</property>
          <property name="height_request">27</property>
          <property name="visible">True</property>
          <property name="can_focus">True</property>
          <property name="label" translatable="yes">button1</property>
          <property name="use_underline">True</property>
          <property name="relief">GTK_RELIEF_NORMAL</property>
          <property name="focus_on_click">True</property>
        </widget>
        <packing>
          <property name="x">88</property>
          <property name="y">168</property>
        </packing>
      </child>
    </widget>
      </child>
    </widget>
  </child>
</widget>
 
</glade-interface>
```

The .glade file provides all of the information that the libglade library needs to be able to recreate your GUI design.

Step 2: Integrating Glade files with our program
------------------------------------------------

It is assumed that a .glade has already been generated in some way, whether with Glade or with Stetic, a video about Stetic can be seen [here](http://mysterion.org/~danw/blog/2005/03/steticzilla.html).

For purposes of this example we assumed that the GUI was saved to a file called gui.glade, it should contain the definition of a window called *window1*, a button called *button1* and a label called *label1*.

We will need to create a new reference to Gtk# and Glade# and then create a new class and entry point for our application. Something like this:

``` csharp
// file: glade.cs
using System;
using Gtk;
using Glade;
public class GladeApp
{
        public static void Main (string[] args)
        {
                new GladeApp (args);
        }
 
        public GladeApp (string[] args)
        {
                Application.Init();
 
                Glade.XML gxml = new Glade.XML (null, "gui.glade", "window1", null);
                gxml.Autoconnect (this);
                Application.Run();
        }
}
```

### How to compile?

Now we need to compile our source file glade.cs referring to the namespace for glade which is in the glade-sharp DLL, the compilation command is the following:

\$ mcs -pkg:glade-sharp-2.0 -resource:gui.glade glade.cs

With this command we create a program called glade.exe, the *-resource* option embeds our gui.glade file into the executable.

By passing *null* as the first parameter to the Glade.XML constructor we are telling libglade to load the glade file from a resource, alternate uses of the the constructor allow the file to be loaded from the file system, this can be especially useful whilst developing your GUI as it means you don't have to recompile each time you make a change in your .glade file.

If we execute the program our GUI should pop up, however, clicking the button will have no effect as we haven't assigned any events to the widgets defined in the gui.glade file, go to the next section to learn how to do this.

Step 3: How to use Glade# in my code
-------------------------------------

How to refer to widgets defined in gui.glade
--------------------------------------------

To access an object defined in our gui.glade file you should know the name of the object and its type, and then add it to your C# code in the following way, note the

``` nowiki
[Widget]
```

attribute.

``` csharp
[Widget]
Type name;
```

We apply these definitions to our example as follows:

``` csharp
using System;
using Gtk;
using Glade;
public class GladeApp
{
        public static void Main (string[] args)
        {
                new GladeApp (args);
        }
 
        public GladeApp (string[] args)
        {
                Application.Init();
 
                Glade.XML gxml = new Glade.XML (null, "gui.glade", "window1", null);
                gxml.Autoconnect (this);
                Application.Run();
        }
 
       [Widget]
       Button button1;
 
       [Widget]
       Label label1;
}
```

How to Adding Events
--------------------

For adding events you need to follow the same steps for any other event, you can also add events from Glade.

``` csharp
using System;
using Gtk;
using Glade;
public class GladeApp
{
        public static void Main (string[] args)
        {
                new GladeApp (args);
        }
 
        public GladeApp (string[] args)
        {
                Application.Init();
 
                Glade.XML gxml = new Glade.XML (null, "gui.glade", "window1", null);
                gxml.Autoconnect (this);
 
                button1.Clicked += OnPressButtonEvent;
 
                Application.Run();
        }
 
       [Glade.Widget]
       Button button1;
 
       [Glade.Widget]
       Label label1;
 
       public void OnPressButtonEvent( object o, EventArgs e)
        {
           Console.WriteLine("Button press");
           label1.Text = "Mono";
        }
}
```

Subsequently we will see the complete code to use events for defined objects in our gui.glade file. The code above will solve the crashing from the code used more lines above.

### References and Further Reading/Viewing

-   [Gtk# Screencast](http://nat.org/demos/gtksharp.html) - A screencast video by Nat Friedman that clearly demonstrates the use of Glade with C#/Mono
-   [Gtk# website](http://gtk-sharp.sourceforge.net/) - Official website of Gtk#
-   [Glade website](http://glade.gnome.org/) - Official website of Glade
-   [Glade# and Gecko#](http://developer.novell.com/wiki/index.php/Glade-Sharp_and_Gecko-Sharp) - Sample application showing how to make a simple web-browser using Gtk#, Glade# and Gecko#
-   [Steticzilla](http://mysterion.org/~danw/blog/2005/03/steticzilla.html) - Screencast video by [danw](http://mysterion.org/~danw/blog/) showing the construction of a simple Mozilla based browser using Stetic
-   [Glade - Rapid Application Development with Gnome 2](http://www.gotmono.com/docs/gnome/bindings/glade/glade.html) - Another tutorial on Glade#, includes details on how to embed .glade files into your .exe


