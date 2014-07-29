---
layout: docpage
navgroup: docs
title: GtkSharpNewInVersion2x
redirect_from:
  - /GtkSharpNewInVersion2x/
---

This document describes the new features in Gtk\# 2, the upgrade to Gtk+'s .NET binding.

Gtk\# 2.12 additions
--------------------

#### Memory and Reference Management Improvements

We now use the toggle\_ref API introduced in glib-2.8 to provide more accurate reference management for managed subclasses of GLib.Object. Toggle refs are a special class of reference that lets us determine if we are the sole owner of a native object. This is especially important when dealing with managed subclasses of GLib.Object. As long as unmanaged code holds references to a managed subclass, we have to artificially keep a managed ref around to ensure garbage collection doesn't occur, since the objects likely contain instance data that would be lost if the managed object is finalized.

#### Gtk.Object destruction enhancements

We have simplified and improved the notification and release mechanism for Gtk object destruction, eliminating a substantial number of leakage scenarios.

#### Revamped the GLib.Object finalization mechanism

In the previous implementation, the finalizers invoked GLib.Object.Dispose. GLib.Object.Dispose would queue up the object for a timeout handler to process it. This approach caused problems for subclasses that override Dispose. Basically, any Dispose override would have had to do a similar timeout mechanism to ensure that any GObject operations they performed would not occur on the GC thread.

We now do the timeout in the finalizer itself. It queues up the object for a timeout handler which invokes Dispose on the queued objects. This ensures that all Dispose invocations occur on the "GUI thread" and takes the burden off the subclass author to do the switch in their Dispose overrides.

#### Better exception handling

Exceptions thrown during native to managed callbacks like signal handlers and callback parameters previously caused stack corruption and were nearly impossible to debug. Trunk contains a new GLib.ExceptionManager.UnhandledException event that applications can connect to be notified of any exceptions thrown in these scenarios. The exceptions can not be thrown across the native to managed boundary so this is a mechanism to "catch" those exceptions and deal with them gracefully.

The following code snippet would display an error dialog and terminate the application:

``` csharp
  ...
  UnhandledExceptionHandler h = new UnhandledExceptionHandler (OnException);
  ExceptionManager.UnhandledException += h;
  Gtk.Application.Run ();
  ...
  void OnException (object o, UnhandledExceptionArgs args)
  {
    ShowErrorDialog (args.ExceptionObject, args.IsTerminating);
    args.ExitApplication = true;
  }
```

#### Structure marshaling

Structures passed to callback marshaling delegates in many cases can be NULL pointers. We previously marshaled these parameters as "ref Foo" types, which caused crashes in the runtime marshaling code. The generator has been enhanced to treat these parameters as IntPtr to allow for NULL checking prior to marshaling.

#### GInterface Registration

Registration of GInterface implementations is now supported. Details on how to implement an interface with a tutorial can be found at [ImplementingGInterfaces]({{ site.github.url }}/docs/gui/gtksharp/implementing-ginterfaces/)

#### GObject property registration

Properties with a [GLib.Property ("prop\_name")] attribute will now be registered with the GObject type system. This feature is especially useful when creating custom cell renderers. (since 2.12.2)

Gtk\# 2.6 additions
-------------------

We are also simultaneously releasing bindings for Gtk+ 2.6 and Gnome 2.10 in source form only. Gtk\# 2.6.x is backward compatible with the 2.4.x releases via the new Publisher Policy mechanism. Once you upgrade your application to 2.4.x, you won't have to change anything again during the 2.x series, unless you want to use the new goodies in 2.6/2.8/etc...

The Gtk\# 2.6.x releases expose the following new API elements and more.

### AboutDialog

[![GtkSharpAbout.png]({{ site.github.url }}/archived/images/b/b6/GtkSharpAbout.png)]({{ site.github.url }}/archived/images/b/b6/GtkSharpAbout.png)

The Gnome About dialog has been cleaned up and integrated directly into Gtk.

### New Cell renderer types

Gtk\# 1.0.x came with Cell Renderers for [text](http://docs.go-mono.com/index.aspx?link=T:Gtk.CellRendererText), [images](http://docs.go-mono.com/index.aspx?link=T:Gtk.CellRendererPixbuf), and [checkboxes](http://docs.go-mono.com/index.aspx?link=T:Gtk.CellRendererToggle).

Starting in 2.6, we have the popular new [Gtk.CellRendererProgress](http://docs.go-mono.com/index.aspx?link=T:Gtk.CellRendererProgress) and [Gtk.CellRendererCombo](http://docs.go-mono.com/index.aspx?link=T:Gtk.CellRendererCombo] renderers. Use them to expose ProgressBar cells and dropdown ComboBox cells in your TreeViews and NodeViews.

### IconView

A new icon list widget which utilizes the existing List/Tree model.

See the API here: [Gtk.IconView](http://docs.go-mono.com/index.aspx?link=T:Gtk.IconView).

[![GtkSharpIconView.png]({{ site.github.url }}/archived/images/1/12/GtkSharpIconView.png)]({{ site.github.url }}/archived/images/1/12/GtkSharpIconView.png)

New Binding Features
--------------------

The following features provide more complete bindings for Application Developers using the Gtk and GNOME libraries bound by Gtk\# as well as providing more powerful binding capabilities for external Binding Authors.

### Public Field generation for Objects and Opaques

Any fields marked /\*\< public \>\*/ in the sources are now automatically exposed if you provide the glue-related parameters to your generation command. This feature is only available if you build glue with your binding.

### Enhanced Ref handling and Memory Management

The ref management for GLib.Objects has improved significantly, especially for managed subclasses. Opaque types which expose ref, unref, free, and destroy methods are now automatically ref managed as well.

### Callback Lifecycle management

Callback delegates passed to methods are now assumed to persist only for the duration of the method call unless a destroy notification is implied by the method signature. Destroy notified delegates are detected automatically from the method signature and persist until notified. Any delegates which must persist beyond the method invocation but are not destroy notified must now be manually managed by the binding author and released when appropriate to avoid potential crashes. They are no longer ref managed and leaked as they were in 1.0.x.

### String marshaling overhaul

Strings are now manually marshaled so that win32 encodings are performed correctly. Both UTF8 and filename encoded strings are supported. In 1.0.x, we used the automatic string marshaling of PInvoke which resulted in non-UTF8 encoded strings being passed to the Gtk+ libraries on the MS runtime on win32. The mono runtime defaults to UTF8, but the MS runtime does not. We now use System.Text.Encoding to manually marshal the strings to UTF8 and marshal them as IntPtrs to the native side to ensure proper encoding.

### CDecl Calling Convention for Delegates

A huge bug has been squashed in supporting the CDecl calling convention for native to managed callback delegates.

### Automatic null handling for Objects, Opaques, and Interfaces

Gone are the days of adding null\_ok attributes to parameters that can accept NULL. The generator now automatically marshals null to NULL for the ref types.

### Container Child Property generation

Types declaring container child properties now generate API elements to access them.

### 64 bit marshaling support

Support for marshaling of long, ulong, size\_t, etc... properly for ILP32 and LP64 platforms alike.

### List to Array marshaling

We've improved support for automatic marshaling via metadata tags for GList and GSList return values to typed arrays. No more need to customize all those methods.

### Anonymous delegate parameter parsing and generation

For those methods which declare callback delegates inline, we now generate delegate types and the methods which expose them.

Gtk+ 2.4 API Additions
----------------------

Several powerful widgets and objects were added in version 2.4 that are bound by Gtk\# version 2.4.x. The following are some of the highlights.

### Actions and UIManager

Actions are a way of associating a behavior to both menu items and toolbar buttons in your User Interface. The UIManager uses an XML-based UI description format to create menu items and toolbars and associate them with actions.

``` xml
<toolbar name="toolbar">
    <toolitem name="cut" action="cut" />
    <toolitem name="copy" action="copy" />
    <toolitem name="paste" action="paste" />
</toolbar>
```

``` csharp
static ActionEntry[] entries = new ActionEntry[] {
    new ActionEntry ("cut", Stock.Cut, "C_ut", "<control>X",
                     "Cut the selected text to the clipboard",
                     new EventHandler (OnActivate)),
    new ActionEntry ("copy", Stock.Copy, "_Copy", "<control>C",
                     "Copy the selected text to the clipboard",
                     new EventHandler (OnActivate)),
    new ActionEntry ("paste", Stock.Paste, "_Paste", "<control>V",
                     "Paste the text from the clipboard",
                     new EventHandler (OnActivate))
};
 
...
 
group = new ActionGroup ("TestActions");
group.Add (entries);
uim = new UIManager ();
uim.InsertActionGroup (group, 0);  
uim.AddUiFromString (ui_info);
 
...
```

A complete sample application utilizing Actions and the UI manager can be found in the sample/Action.cs file shipped with the Gtk\# source or viewed [on the web](http://anonsvn.mono-project.com/viewcvs/trunk/gtk-sharp/sample/Actions.cs?view=markup).

### ComboBox

[![GtkSharpCombo.png]({{ site.github.url }}/archived/images/0/04/GtkSharpCombo.png)]({{ site.github.url }}/archived/images/0/04/GtkSharpCombo.png)

The old Gtk Combo widget was long a sore point for developers. The new ComboBox widgets utilize the power of the Tree/List Model API and provide a nice clean look.

See the API here: [Gtk.ComboBox](http://docs.go-mono.com/index.aspx?link=T:Gtk.ComboBox).

### FileChooser

[![GtkSharpFileChooser.png]({{ site.github.url }}/archived/images/8/8a/GtkSharpFileChooser.png)]({{ site.github.url }}/archived/images/8/8a/GtkSharpFileChooser.png)

The new FileChooser interface is implemented by FileChooserDialog to provide an attractive and powerful way for your application to interface with the file system.

See the API here: [Gtk.FileChooser](http://docs.go-mono.com/index.aspx?link=T:Gtk.FileChooser).

### Toolbar

[![GtkSharpToolbar.png]({{ site.github.url }}/archived/images/b/b5/GtkSharpToolbar.png)]({{ site.github.url }}/archived/images/b/b5/GtkSharpToolbar.png)

The new Toolbar widget comes complete with all the typical buttons and separators and provides a more attractive API to expose Toolbar User Interface elements either programatically or via the UIManager API.

See the API here: [Gtk.Toolbar](http://docs.go-mono.com/index.aspx?link=T:Gtk.Toolbar).

Newly bound libraries
---------------------

#### Gnome.Vfs

Use the Gnome.Vfs namespace in the new gnome-vfs-sharp.dll assembly for virtual file system operations.

See the API here: [Gnome.Vfs](http://docs.go-mono.com/index.aspx?link=N:Gnome.Vfs).

#### Gnome.PanelApplet

Use the PanelApplet object now exposed by gnome-sharp.dll to implement new Panel applets.

See the API here: [Gnome.PanelApplet](http://docs.go-mono.com/index.aspx?link=T:Gnome.PanelApplet).

A full sample can be seen [here](http://anonsvn.mono-project.com/viewvc/trunk/gnome-sharp/sample/panelapplet/).

New Extensions to the Bindings
------------------------------

### NodeView and NodeSelection

The NodeStore is now interactive with new selection and view objects. Use NodeStore, NodeSelection, and NodeView to simplify the TreeView API with a nice attribute driven C\# friendly syntax.

[![GtkSharpNodeViewSimple.png]({{ site.github.url }}/archived/images/0/04/GtkSharpNodeViewSimple.png)]({{ site.github.url }}/archived/images/0/04/GtkSharpNodeViewSimple.png)

There is a [http:/GtkSharpNodeViewTutorial tutorial article] available showing how to use the NodeView convenience APIs to implement tree and list views like the one above in your application.

### Gtk.Dotnet

Use the new gtk-dotnet.dll assembly to open up the power of System.Drawing to your new application, or to port your existing custom controls to Gtk.

See the API here: [Gtk.DotNet.Graphics](http://docs.go-mono.com/index.aspx?link=T:Gtk.DotNet.Graphics).

You can find a sample with various patterns in the Gtk\# distribution in the samples directory as "DrawingSample.cs"

``` csharp
using System.Drawing;
using Gtk;
 
//
// This is a widget that displays a pretty graphic using System.Drawing
// from Gtk#
//
class PrettyGraphic : DrawingArea {
 
        public PrettyGraphic ()
        {
                SetSizeRequest (200, 200);
        }
 
        protected override bool OnExposeEvent (Gdk.EventExpose args)
        {
                using (Graphics g = Gtk.DotNet.Graphics.FromDrawable (args.Window)){
                        Pen p = new Pen (Color.Blue, 1.0f);
 
                        for (int i = 0; i < 600; i += 60)
                                for (int j = 0; j < 600; j += 60)
                                        g.DrawLine (p, i, 0, 0, j);
                }
                return true;
        }
}
```

### Key Binding Support

With version 2.4.x, it is now possible to create KeyBindings for your Widget subclasses by simply adding attributes to the class declaration.

``` csharp
        [Binding (Gdk.Key.Escape, "HandleBinding", "Escape")]
        [Binding (Gdk.Key.Left, "HandleBinding", "Left")]
        [Binding (Gdk.Key.Right, "HandleBinding", "Right")]
        [Binding (Gdk.Key.Up, "HandleBinding", "Up")]
        [Binding (Gdk.Key.Down, "HandleBinding", "Down")]
        public class MyButton : Gtk.Button {
 
                public MyButton () : base ("I'm a subclassed button") {}
 
                protected override void OnClicked ()
                {
                        Console.WriteLine ("Button::Clicked default handler fired.");
                }
 
                private void HandleBinding (string text)
                {
                        Console.WriteLine ("Got a bound keypress: " + text);
                }
        }
```

### Application.Invoke

It is now simpler to use threads with Gtk\# applications using Gtk.Application.Invoke. This new API call can be used with anonymous methods to simplify writing code that must be executed on the Gtk\# main loop, for example:

``` csharp
public void CountingThread ()
{
    for (int i = 0; i < 100; i++){
          int j = i;
          SlowComputation ();
          Gtk.Application.Invoke (delegate {
             status_label.Text = String.Format ("Iteration {0}", j)
          });
    }
}
```

