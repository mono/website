---
title: "FAQ: Gtk"
redirect_from:
  - /FAQ:_Gtk/
---

General Questions
=================

**How is Gtk\# related to Gtk+?**

Gtk\# is a managed binding for CIL-based languages to the Gtk+ library. The binding features a number of mappings from Gtk+ features into CIL-features like mapping signals to events and allowing developers to use C\# constructs to alter the behavior of C-based widgets (for example, overwriting methods).

GTK+ is a graphical user interface toolkit for Unix and Windows and is written in C while the Gtk\# binding is written in C\#.

**Can I use Gtk\# on Windows?**

Yes, Gtk\# is available for Windows developers.

In addition, when you install Gtk\# for .NET if Visual Studio is installed templates for VB.NET and C\# are installed, so you can create Gtk\# based applications right from Visual Studio.

**What is Glade?**

Glade is a GUI designer for Gtk+ applications that stores your designs in an XML file (the file name ends in ".glade"). User interfaces created with Glade can are dynamically loaded at runtime using the Glade.XML class.

For example, if you have created a dialog box for entering some personal information, you could load it like this:

``` csharp
class PersonalDataDialog {
     [Widget] Entry name;
     [Widget] Entry telephone;
 
     PersonalDataDialog (){
         // This loads the UI from the "mygui.glade" file
         // it loads the "personaldata" dialog from there.
         Glade.XML ui = new Glade.XML ("mygui.glade", "personaldata", null);
 
         // This connects fields and event handlers automatically
         // for example "name" and "telephone" entries that are declared
         // with the [Widget] attribute above are bound to the widgets
         // defined in the UI.
         ui.Autoconnect (this);
 
         // At this point you can read data from "name" and "telephone"
         // widgets.
     }
}
```

**Can I embed Glade files in my executable?**

Yes, just bundle your glade files as resources (using the -resource: option in the compiler) and change your constructor call or use the Glade.XML.FromAssembly () method to create your Glade.XML ui.

Gtk\# widget questions
======================

**Can I use absolute positioning for my dialogs?**

Yes, use the Gtk.Fixed or Gtk.Layout widgets if you need to use absolute positioning for your widgets.

**How do I fill a Gtk.ComboBox?**

``` csharp
    void FillCombo (Gtk.ComboBox cb)
    {
        cb.Clear();
        CellRendererText cell = new CellRendererText();
        cb.PackStart(cell, false);
        cb.AddAttribute(cell, "text", 0);
        ListStore store = new ListStore(typeof (string));
        cb.Model = store;
 
        store.AppendValues ("Hello");
        store.AppendValues ("Gtk");
        store.AppendValues ("ComboBox");
    }
```

**How can I change the colors of a widget?**

You can use the ModifyBase and ModifyText routines which are part of the Widget subclass, like this:

``` csharp
myEntry.ModifyBase(StateType.Normal, new Gdk.Color(255,0,0));
myEntry.ModifyText(StateType.Normal, new Gdk.Color(0,255,0));
```

Custom Widgets
==============

**How do I create a custom widget?**

You can create custom widgets by inheriting from a base class that is appropriate. If you plan to do a custom widget that will display itself, a good starting point is the Gtk.DrawingArea widget.

**Do I need to create a custom widget to respond to events?**

Gtk\# exposes a number of events that allow developers to customize existing widgets without resorting to subclassing. It is possible to attach arbitrary code to be executed by a handler, for example:

``` csharp
    Gtk.Button b = new Button ("Print");
    b.Clicked += delegate {
         document.Print ();
    };
```

**Should I hook up to events, or override methods to create a custom widget?**

Gtk\# supports both models.

There is some overhead in signal emission. You are also relinquishing some control over whether your users see events before your control is updated. There are no guarantees that your event handler will run first even though it is added to the event before any user handlers. That's the nature of .Net events.

For those reasons it is probably best to override the VM instead of connecting to the event. Don't forget to chain to the base method where appropriate.

For example, compare:

``` csharp
class MyWidget : Gtk.DrawingArea {
    public MyWidget ()
    {
          ExposeEvent += new ExposeEventHandler (ExposeHandler);
    }
 
    void ExposeHandler (object obj, ExposeEventArgs args)
    {
        Gdk.Window win = args.Event.Window;
        Gdk.Rectangle area = args.Event.Area;
 
        win.DrawRectangle (Style.BaseGC (StateType.Normal), true, area);
 
        //Important: the next line flags that the event was processed:
        args.RetVal = true;
    }
}
```

The same code using the overwrite mechanism would look like this:

``` csharp
class MyWidget : Gtk.DrawingArea {
    public MyWidget ()
    {
    }
 
    protected override bool OnExposeEvent (Gdk.EventExpose args)
    {
        Gdk.Window win = args.Window;
        Gdk.Rectangle area = args.Area;
 
        win.DrawRectangle (Style.BaseGC (StateType.Normal), true, area);
 
        return true;
    } 
}
```

Common Questions
================

Some frequently asked questions about [GtkSharp]({{ site.github.url }}/docs/gui/gtksharp/).

For a list of varios pages dealing with Gtk\# on this site see [GtkSharp Articles]({{ site.github.url }}/Category:GtkSharp).

**Common Problems**

**= On Windows, Idle times are not being called**=

Make sure you call GLib.Thread.Init ()

**= My application crashes with threads**=

If your application crashes with a message like this:

``` bash
Xlib: unexpected async reply (sequence 0x146)!
```

It means that you are trying to invoke methods in Gtk\# from a thread that is not the one that has invoked Application.Run (). This is not supported, to fix this you must ensure that all calls to Gtk+ are done from the thread that invoked Application.Run. This is done by either just hooking up to signals, using GLib timers or events and not threads.

This topic is covered in more detail in these two pages: [Best\_Practices]({{ site.github.url }}/archived/best_practices "Best Practices") and [Responsive Applications]({{ site.github.url }}/docs/gui/gtksharp/responsive-applications/) pages for details on how to solve this issue.

Gecko\# and Mozilla
===================

**How do I use Gecko or Mozilla with Gtk\#?**

You can use pkg-config to auto-detect whether the Mozilla development libraries are installed, the pkg-config module name is: gecko-sharp-2.0

To test it, you can write:

``` bash
if pkg-config gecko-sharp-2.0; then
    echo Gecko# is installed
else
    echo Gecko# is not installed
fi
```

To compile your applications to use Gecko\# you should do this:

``` bash
mcs demo.cs -pkg:gecko-sharp-2.0
```

To run the applications, you should set the environment variable, run the application like this:

``` bash
export MOZILLA_HOME="`pkg-config --variable=libdir mozilla-gtkmozembed`"
mono demo.exe
```

Those are usually set on scripts, as recommended on our [Application Deployment Guidelines]({{ site.github.url }}/docs/getting-started/application-deployment/).

 **Mozilla and Plugins**

If you are having trouble embedding Flash content (or any other plugin) into your Gecko\# application, make sure you have set the MOZ\_PLUGIN\_PATH to the directory holding mozilla, like this:

``` bash
export MOZ_PLUGIN_PATH=/usr/lib/mozilla/plugins
```

Alternatively, you can programatically set this variable from C\#:

``` csharp
WebControl.CompPath = "/usr/lib/mozilla-firefox";
```

Migration
=========

**How do I migrate a Gtk\# 1.0 to Gtk\# 2.0 application?**

The steps are described in [Gtk\# Upgrade page]({{ site.github.url }}/docs/gui/gtksharp/upgrade/).

Common Problems
===============

**I can not build Gtk\# on my system**

If you are getting errors like this:

``` bash
generated/PangoHelper.cs(17,55): error CS0039: Cannot convert type `GLib.Object'
 to `Pango.Context' via a built-in conversion
generated/PangoHelper.cs(52,55): error CS0039: Cannot convert type `GLib.Object'
 to `Pango.Context' via a built-in conversion
generated/PangoRenderer.cs(19,47): error CS1502: The best overloaded method 
match for `Pango.Renderer.Renderer(GLib.GType)' has some invalid arguments
generated/PangoRenderer.cs(19,47): error CS1503: Argument 1: Cannot convert from
 `GLib.GType' to `GLib.GType'
generated/PangoRenderer.cs(34,5): error CS1502: The best overloaded method match
 for `GLib.Object.CreateNativeObject(string[], GLib.Value[])' has some invalid 
arguments
generated/PangoRenderer.cs(34,5): error CS1503: Argument 2: Cannot convert from 
`GLib.Value[]' to `GLib.Value[]'
```

Or like this:

``` bash
generated/PangoHelper.cs(17,55): error CS0039: Cannot convert type `GLib.Object'
 to `Pango.Context' via a built-in conversion
generated/PangoHelper.cs(52,55): error CS0039: Cannot convert type `GLib.Object'
 to `Pango.Context' via a built-in conversion
generated/PangoRenderer.cs(19,47): error CS1502: The best overloaded method 
match for `Pango.Renderer.Renderer(GLib.GType)' has some invalid arguments
generated/PangoRenderer.cs(19,47): error CS1503: Argument GLib.GType: Cannot 
conver from equally named types from different assemblies GLib.GType (from 
glib-sharp, Version=2.6.0.0, Culture=neutral, PublicKeyToken=35e10195dab3c99f) 
and GLib.GType (from glib-sharp, Version=2.8.0.0, Culture=neutral, 
PublicKeyToken=35e10195dab3c99f)
```

This is caused because you have a newer version of Gtk\# installed on your system, and you are trying to compile an older version.

This is a limitation of the policy loading code. The only way of solving this is by removing the installed Gtk\# (or the policy directories in the GAC) to build Mono or build the appropriate Gtk\# version.

An upcoming version of Mono will fix this by not loading indirectly referenced policy-versioned libraries.

