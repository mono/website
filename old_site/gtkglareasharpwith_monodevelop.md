---
layout: obsolete
title: "GtkGLAreaSharp:With MonoDevelop"
lastmodified: '2007-05-25'
permalink: /old_site/GtkGLAreaSharp:With_MonoDevelop/
redirect_from:
  - /GtkGLAreaSharp:With_MonoDevelop/
---

GtkGLAreaSharp:With MonoDevelop
===============================

There are few steps involved in getting a simple OpenGL project working with MonoDevelop.

### Getting GtkGLAreaSharp

First step is get all the packages. Open a console and go to a folder where you want to download cj's script. Run it with:

``` nowiki
wget http://colliertech.org/svn/openGL/gtkgl-build/build.sh && sh ./build.sh
```

This script will download and compile all the software required into your \$HOME/opt folder. Go to this folder and you will see three folders: include, lib & src.

Inside lib is the libgtkgl-2.0.so.1.0.0 which is the actual system library that GtkGLAreaSharp wraps around to bring GtkGLArea into Mono. At this point we should first check if the library works on your setup. If it does not, then there's no point continuing until this is right. Come out of the lib folder and make your way to \$HOME/opt/src/gtkgl/gtkglarea-1.99.0/examples

Run the simple demo with:

    ./simple

If you get a black and white divided box in a Gtk window, then all is well on that side. If you get nothing but a grey Gtk window, there something wrong with your hardware OpenGL setup. This was the case for me first time around. I restarted X using the vesa driver then again with the nvidia driver and all was fine. Not sure why it fixed itself.

Now to check the mono side. Make your way to \$HOME/opt/src/gtkgl/gtkglarea-sharp-0.0.15/examples/trackball

To build the example use:

    make run

If all is well, you will get a Gtk window with a teapot. If not, you may end with an error such as:

    MONO_PATH=./../util mono --debug TrackballExample.exe

    ** (TrackballExample.exe:26013): WARNING **: The following assembly referenced from /home/wayne/opt/src/gtkgl/gtkglarea-sharp-0.0.15/examples/util/gtkglarea-sharp-util.dll could not be loaded:
         Assembly:   gtkglarea-sharp    (assemblyref_index=0)
         Version:    0.0.3.0
         Public Key: 7df758c0fb49fe62
    The assembly was not found in the Global Assembly Cache, a path listed in the MONO_PATH environment variable, or in the location of the executing assembly (/home/wayne/opt/src/gtkgl/gtkglarea-sharp-0.0.15/examples/util/).


    ** (TrackballExample.exe:26013): WARNING **: The class GtkGL.GLArea could not be loaded, used in /home/wayne/opt/src/gtkgl/gtkglarea-sharp-0.0.15/examples/util/gtkglarea-sharp-util.dll (token 0x01000001)

    ** ERROR **: file class.c: line 2119 (mono_class_setup_parent): should not be reached
    aborting...
    make: *** [run] Aborted

If this is the case you will need to type the following:

    . ~/_devenv.sh (that's DOT SPACE _devenv)

and try again:

    make run

This time you should have the Gtk window and a teapot. You can even click and drag the mouse to rotate the teapot.

### Getting a project started in MonoDevelop

First things first obviously load up MonoDevelop and start a Gtk\# 2.0 project. Bring up the MyWindow.cs file and change the entire contents to the following:

``` csharp
using System;
using Gtk;
using GtkSharp;
using GtkGL;
 
    public class MyWindow
    {
        Gtk.Window win;
        GtkGL.Teapot pot;
        GtkGL.GLWidget glWidget;
 
        public MyWindow ()
        {
            win = new Gtk.Window("My Gtk Window");
            win.DeleteEvent += CloseWindow;
            win.Resize(400, 400);
 
            glWidget = new GtkGL.GLWidget();
            glWidget.GLSetup += GtkGL.GLWidget.EnableLighting;
            pot = new GtkGL.Teapot();
 
            pot.Translate(-0.0, 0.0, 3);
 
            glWidget.AddGLObject(pot);
 
            win.Add(glWidget);          
 
            win.Show();
            glWidget.Show();           
        } 
 
        void CloseWindow(object o, DeleteEventArgs args){
            Application.Quit();
            args.RetVal = true; //this is necessary to stop an error on close.
        }
    }
```

Run the example and you should get errors:

    Cannot find type 'GtkGL.Teapot
    The namespace `GtkGL' can not be found (missing assembly reference?)

Teapot is contained in the shapes.dll assembly which lives in examples/shapes. But Mono does not know about this folder. Mono only knows about the \$HOME/opt/lib/mono folder. Also, GtkGL is contained in the gtkglarea-sharp-util.dll assembly which is found at examples/util. Copy these two dll files to: \$HOME/opt/lib/mono/gtkglarea-sharp

Edit References, and and click on the .NET Assembly tab. Browse to the \$HOME/opt/lib/mono/gtkglarea-sharp folder. Select the gtkglarea-sharp-util.dll first and add that. Then shapes.dll. For some strange reason, adding shapes.dll first might crash mono. Finally, add: gtkglarea-sharp.dll.

When you run the program now, you can expect to receive the following error:

    Unhandled Exception: System.TypeInitializationException: An exception was thrown by the type initializer for GtkGL.GLArea ---> System.DllNotFoundException: libgtkglarea-win32-2.0-0.dll

Two things need to be fixed here.

1. Mono needs a dll name translation

Mono is looking for the native libgtkglarea-win32-2.0-0.dll. We don't have this file on the system. But we do have libgtkgl-2.0.so which is the library that GtkGLAreaSharp wraps around. It's pretty important that Mono can load this file. Therefore we have to add a lookup to the Mono config file. In most installations, this config file is found at /etc/mono/config. You can add a lookup line into this with:

    vi /etc/mono/config

The inserted entry in the config should look something like this:

    <configuration>
        <dllmap dll="libgtkglarea-win32-2.0-0.dll" target="libgtkgl-2.0.so.1" />

        <dllmap dll="cygwin1.dll" target="libc.so.6" />
        <dllmap dll="libc" target="libc.so.6" />
        <dllmap dll="libintl" target="libc.so.6" />
        <dllmap dll="libxslt.dll" target="libxslt.so" />
        <dllmap dll="libmySQL.dll" target="libmysqlclient.so" />
        <dllmap dll="odbc32.dll" target="libodbc.so" />
        <dllmap dll="oci" target="clntsh" />
        <dllmap dll="db2cli" target="libdb2_36.so"/>
        <dllmap dll="msvcrt" target="libc.so.6"/>
        <dllmap dll="MonoPosixHelper" target="libMonoPosixHelper.so"/>

        ..etc etc
    </configuration>

2. linux doesn't know what lib folder libgtkgl-2.0.so.1.0.0 lives in.

The libgtkgl-2.0.so.1.0.0 file was installed to \$HOME/opt/lib so therefore you need to add (for example) /home/wayne/opt/lib to your /etc/ld.so.conf file. Remember to do an ldconfig afterwards so that the path is added to the linux system permanently.

Now run the program and you should get a Gtk\# Window with a GLWidget containing a teapot. To make it more interesting we can add a GLib.Timeout event to trigger some animation:

``` csharp
Lib.Timeout.Add(10, new GLib.TimeoutHandler(Animate) );
```

And our Animate routine:

``` csharp
bool Animate(){
    GtkGL.EulerRotation rot = new GtkGL.EulerRotation(0, 0.02, 0.0);
    GtkGL.Quaternion q = rot.ToQuaternion();
    pot.Rotate(q);
    return true;
}
```

So that the program looks like this:

``` csharp
using System;
using Gtk;
using GtkSharp;
using GtkGL;
 
    public class MyWindow
    {
        Gtk.Window win;
        GtkGL.Teapot pot;
        GtkGL.GLWidget glWidget;
 
        public MyWindow ()
        {
            win = new Gtk.Window("My Gtk Window");
            win.DeleteEvent += CloseWindow;
            win.Resize(400, 400);
 
            glWidget = new GtkGL.GLWidget();
            glWidget.GLSetup += GtkGL.GLWidget.EnableLighting;
            pot = new GtkGL.Teapot();
 
            pot.Translate(-0.0, 0.0, 3);
 
            glWidget.AddGLObject(pot);
 
            win.Add(glWidget);          
 
            GLib.Timeout.Add(10, new GLib.TimeoutHandler(Animate) );
 
            win.Show();
            glWidget.Show();           
 
 
        } 
 
        bool Animate(){
            GtkGL.EulerRotation rot = new GtkGL.EulerRotation(0, 0.02, 0.0);
            GtkGL.Quaternion q = rot.ToQuaternion();
            pot.Rotate(q);
            return true;
        }
 
        void CloseWindow(object o, DeleteEventArgs args){
            Application.Quit();
            args.RetVal = true; //this is necessary to stop an error on close.
        }
    }
```

Now your MonoDevelop work flow should be ready for tinkering.

