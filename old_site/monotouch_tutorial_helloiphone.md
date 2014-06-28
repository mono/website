---
layout: obsolete
title: "MonoTouch Tutorial HelloiPhone"
lastmodified: '2009-08-06'
permalink: /old_site/MonoTouch_Tutorial_HelloiPhone/
redirect_from:
  - /MonoTouch_Tutorial_HelloiPhone/
  - /MonoTouch_Tutorial_HelloiPhone_Hello_iPhone/
---

MonoTouch Tutorial HelloiPhone
==============================

This tutorial explains how to use [MonoTouch]({{ site.github.url }}/old_site/MonoTouch "MonoTouch") and the [MonoTouch API]({{ site.github.url }}/old_site/MonoTouch_API "MonoTouch API") to build applications for the iPhone. The focus of this article is on the underlying framework and not on how to use the IDE for development. For more tutorials see [MonoTouch Tutorials]({{ site.github.url }}/old_site/MonoTouch_Tutorials "MonoTouch Tutorials").

The smallest MonoTouch application that merely starts and shuts down is this:

``` csharp
using System;
using MonoTouch.UIKit;
 
class Hello {
    static void Main (string [] args)
    {
        Console.WriteLine ("Hello");
    }
}
```

Use your favorite text editor to create a file named hello.cs with the contents above. Then you need to compile the above with a C\# compiler, for example:

``` bash
$ /Developer/MonoTouch/usr/bin/smcs hello.cs -r:monotouch.dll
```

At this point, you have two options, one is to run the resulting program on the simulator, and the other is to deploy it to a device. To run on the simulator, all you need to do is have the iPhone SDK installed on your system. Deploying on a device requires you to be an approved Apple developer and have the tools setup to deploy to a device, since that is a more elaborate setup this is covered in a separate document, see the [MonoTouch mtouch]({{ site.github.url }}/old_site/MonoTouch_mtouch "MonoTouch mtouch") document for more information on this.

The iPhone deployment contains not only your program but also data files, configuration files and manifests. To turn your .exe into a package you use the mtouch command, like this:

``` bash
$ /Developer/MonoTouch/usr/bin/mtouch -sim Hello.app hello.exe
```

That will prepare the Hello.app for use in the simulator.

can launch the program in the simulator with the mtouch command. Like this:

``` bash
$ /Developer/MonoTouch/usr/bin/mtouch --launchsim=hello.exe --stdout=output
```

The above will run the application on your iPhone simulator and the standard output of your program will be sent to the file `output`. In this file you will see the message "Hello" which was produced by our Main method.

iPhone applications are GUI applications that use the UIKit framework. Like other GUI frameworks, it is necessary to start the GUI event processing, this is done by calling the `UIApplication.Main` method. This method will perform a number of initialization steps (like loading any UI definitions from a NIB file) and start processing events from the system and dispatch them to your app.

The `UIApplication.Main` method takes three arguments: an array of strings that represents the invocation parameters, the name of your UIApplication class, and the name of your UIApplicationDelegate class as strings.

The names are the names of your C\# classes and they can be `null` if you want to get the default settings. Typically you will just use the default `UIApplication` implementation but you will provide at least the name of your `UIApplicationDelegate` instance.

If you do not specify the parameter for the delegate in `UIApplication.Main` then the name of the class for the delegate is taken from your main XIB file.

`UIApplication.Main` will the instantiate the classes that you provided and connect the instance of the `UIApplicationDelegate` to the `UIApplication.Delegate` property. This UIApplicationDelegate will receive various notifications from the `UIApplication`.

The most important notification is that the application has finished loading and initializing. This is where programmers will prepare the UI of the application. The following example shows how this is done:

``` csharp
public class AppController : UIApplicationDelegate {
    UIWindow window;
 
    public override void FinishedLaunching (UIApplication app)
    {
        var window = new UIWindow (UIScreen.MainScreen.Bounds) {
            new UILabel (new RectangleF (50, 50, 230, 100)) {
                Text = "Hello from MonoTouch"
            }
        };
 
        window.MakeKeyAndVisible ();
    }
}
 
class Demo {
    static void Main (string [] args)
    {
        UIApplication.Main (args, null, "AppController");
    }     
}
```

In the above example we create a subclass of `UIApplicationDelegate` and we register this with the MonoTouch runtime by decorating the class with the [Register] attribute. Then we override the method `FinishedLaunching` to initialize our UI. In this method we use the C\# 3.0 syntax to create in a single statement our toplevel window (using the current screen dimensions) as well as a label that is displayed at position 50, 50 with 230 pixels of width and 100 pixels of height. The label contains the world "Hello from MonoTouch".

The last method call makes the window the key window and shows it on the screen.

