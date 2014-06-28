---
layout: obsolete
title: "MonoTouch Tutorial MonoDevelop HelloWorld"
lastmodified: '2009-08-07'
permalink: /old_site/MonoTouch_Tutorial_MonoDevelop_HelloWorld/
redirect_from:
  - /MonoTouch_Tutorial_MonoDevelop_HelloWorld/
---

MonoTouch Tutorial MonoDevelop HelloWorld
=========================================

In this tutorial part of the [MonoTouch Tutorials]({{ site.github.url }}/old_site/MonoTouch_Tutorials "MonoTouch Tutorials") we write a very simple application using [MonoDevelop MonoTouch Edition](http://www.monodevelop.com) for OSX and Interface Builder.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#basics-of-monodevelop-and-interface-builder">1 Basics of MonoDevelop and Interface Builder</a></li>
<li><a href="#using-interface-builder-with-monotouch">2 Using Interface Builder with MonoTouch</a></li>
<li><a href="#adding-behavior">3 Adding Behavior</a></li>
<li><a href="#using-actions">4 Using Actions</a></li>
<li><a href="#deploying-to-the-device">5 Deploying to the device</a></li>
<li><a href="#resources">6 Resources</a></li>
</ul></td>
</tr>
</tbody>
</table>

Basics of MonoDevelop and Interface Builder
===========================================

Once you start MonoDevelop, you should be greeted with its startup screen, which looks like this:

[![Md hw iphone5.png]({{ site.github.url }}/old_site/images/7/7b/Md_hw_iphone5.png)]({{ site.github.url }}/old_site/images/7/7b/Md_hw_iphone5.png)

The first step is to create a solution for your project. Your solution will contain your main application. You can later add other components to your solution like libraries that you develop, unit tests, and the web site for your application.

To create the solution, either press Shift-Command-N or select File/New/Solution from the menu:

[![Md hw iphone6.png]({{ site.github.url }}/old_site/images/4/4d/Md_hw_iphone6.png)]({{ site.github.url }}/old_site/images/4/4d/Md_hw_iphone6.png)

In the solution dialog box, select in the C\# category, iPhone projects, and then select "iPhone MonoTouch Project". Give a name to your project and select Forward to complete your solution setup:

[![Md hw iphone8.png]({{ site.github.url }}/old_site/images/1/18/Md_hw_iphone8.png)]({{ site.github.url }}/old_site/images/1/18/Md_hw_iphone8.png)

Once your solution is created, you will see on the left side of your screen your solution pad. If the Solution pad is not visible, select View/Solution from the menubar. Expand the solution and the project to see what your project has:

[![Md hw iphone9.png]({{ site.github.url }}/old_site/images/3/32/Md_hw_iphone9.png)]({{ site.github.url }}/old_site/images/3/32/Md_hw_iphone9.png)

There are a number of important pieces in this list that are worth enumerating.

The default template for MonoTouch applications provides a `Main.cs` file that contains your main program, it contains your `Main ()` method that starts your application and starts the application event loop.

As a practice, you should transfer control to `UIApplication.Main()` as soon as you startup. This method will load your user interface from `MainWindow.xib`, create an instance of the `AppDelegate` class and start processing events.

The `AppDelegate` class in the default template inherits from the `MonoTouch.UIApplicationDelegate` class and contains several methods that you can override to respond to operating system events. In the default template we merely override the `FinishedLaunching` method, the method that is called when the startup procedure has completed.

In the solution pane, you will see that below the `MainWindow.xib` file, MonoDevelop has created a C\# file called `MainWindow.xib.designer.cs`. This file is automatically updated every time that you make changes to the XIB file and it mirrors all of the views, controllers, outlets and actions that you add to your user interface and maps those to C\# properties that you can access from your program.

If you run the application right now, it will not do anything interesting. A blank screen will show up in your iPhone simulator. We are going to create a very basic user interface with a button that you can touch, and a label that will update its contents every time you tap on the button.

Using Interface Builder with MonoTouch
======================================

Launch Interface Builder by double-clicking on the `MainWindow.xib` file. Once Interface Builder starts up, you should see a surface (your window) and a Library that contains various components. Your Library should look like the following screenshot. If it is not there, select Library from the Tools menu:

[![Md hw iphone10.png]({{ site.github.url }}/old_site/images/d/d1/Md_hw_iphone10.png)]({{ site.github.url }}/old_site/images/d/d1/Md_hw_iphone10.png)

Select the "Inputs and Values" as shown on the screenshot and drag both a "Round Rect Button" into the surface and a Label into it. Double click on the button to change the text to say "Tap me!" and make sure that the label stretches and is centered. Alignment can be configured in the "Attributes Inspector" (also in the Tools menu).

The result should look more or less like this:

[![Md hw iphone11.png]({{ site.github.url }}/old_site/images/9/95/Md_hw_iphone11.png)]({{ site.github.url }}/old_site/images/9/95/Md_hw_iphone11.png)

Unlike Windows.Forms, Gtk\# or ASP.NET where objects dragged into the design surface have an identifier associated that you can refer immediately from your source code, with Interface Builder a different model is used.

To connect components together you need to define outlets in your classes. These outlets at runtime are mapped into C\# properties that you can access. In our sample we want to access both the label and the button from our C\# code so we will need to define one outlet for each control that we want to access, and then wire up the outlet. We will explain this next.

To let the application delegate access the button and the label, we are going to have to connect these controls with it. Select the "App Delegate" in your Document Window. And then in the Identity Inspector you should see something like the screenshot below. If you do not see this, select "Identity Inspector" from the Tools menu:

[![Md hw iphone12.png]({{ site.github.url }}/old_site/images/b/bb/Md_hw_iphone12.png)]({{ site.github.url }}/old_site/images/b/bb/Md_hw_iphone12.png)

We are going to create two class outlets in the application delegate. Each outlet that we create in the user interface will be reflected as a property in a partial class in the `MainWindow.designer.xib.cs` file.

Create one for the label, and one for the button by clicking on the [+] button in the "Class Outlet" section of that pane. Once you are done, it should look like this:

[![Md hw iphone13.png]({{ site.github.url }}/old_site/images/1/10/Md_hw_iphone13.png)]({{ site.github.url }}/old_site/images/1/10/Md_hw_iphone13.png)

Once these outlets have been defined, you can switch to the "Connections" tab in the Inspector. You will see that the label and button outlets are not wired up to anything yet, it will look like this:

[![Md hw iphone14.png]({{ site.github.url }}/old_site/images/3/31/Md_hw_iphone14.png)]({{ site.github.url }}/old_site/images/3/31/Md_hw_iphone14.png)

The next step is to connect the label and the button to the controls that we added to our surface before. If you hover over the empty circles and then click and drag, a line will be drawn from this outlet to other components on the screen. First connect the label outlet to the Label control on the designer surface, like this:

[![Md hw iphone15.png]({{ site.github.url }}/old_site/images/a/ad/Md_hw_iphone15.png)]({{ site.github.url }}/old_site/images/a/ad/Md_hw_iphone15.png)

Repeat this process, this time with the button:

[![Md hw iphone16.png]({{ site.github.url }}/old_site/images/6/69/Md_hw_iphone16.png)]({{ site.github.url }}/old_site/images/6/69/Md_hw_iphone16.png)

Once you have those two outlets wired up, you should see this:

[![Md hw iphone17.png]({{ site.github.url }}/old_site/images/9/9e/Md_hw_iphone17.png)]({{ site.github.url }}/old_site/images/9/9e/Md_hw_iphone17.png)

Save your file by hitting Command-S and switch back to MonoDevelop.

Adding Behavior
===============

For the sake of demystifying what is happening behind the scenes, double click on the `MainWindow.designer.xib.cs` file you will see that behind the scenes MonoDevelop has generated one property accessor for each outlet:

[File:Md hw iphone18.png](/index.php?title=Special:Upload&wpDestFile=Md_hw_iphone18.png "File:Md hw iphone18.png")

This file is automatically updated every time you modify your XIB file using Interface Builder. Do not make any changes to this file as any changes that you make will be lost the next time you update your XIB file. This is a MonoDevelop generated file, you can completely ignore it while developing.

The properties are stored in a partial class so the compiler will combine your `AppDelegate` in `Main.cs` with these autogenerated properties.

Go back to your `Main.cs` file. We are going to add a little bit of C\# code. In the `AppDelegate` class you can now reference `window`, `label` and `button` as properties of your instance. You can use this to customize the controls or alter their behavior.

Let us attach an event handler for the TouchDown event, an event that is triggered when the user taps on the button. MonoDevelop's code completion will help you navigate the API as you write code:

[![Md hw iphone19.png]({{ site.github.url }}/old_site/images/d/dd/Md_hw_iphone19.png)]({{ site.github.url }}/old_site/images/d/dd/Md_hw_iphone19.png)

You should write something like this:

``` csharp
int ntaps = 0;
 
button.TouchDown += delegate {
    label.Text = "I have been tapped " + (++ntaps) + " times";
};
```

The above uses the C\# 3.0 syntax to attach a piece of code to an event handler and shows how to change the contents of the `MonoTouch.UILabel` that was created. The `ntaps` variable is captured by the compiler and becomes the closure for the event handler, so every time the user taps on the screen, the variable will be updated accordingly.

Build your application using Command-B or select Build/Build and then select Run/Run to deploy your software to the iPhone emulator (or press Alt-Command-Return).

You should see this:

[![Md hw iphone20.png]({{ site.github.url }}/old_site/images/d/d7/Md_hw_iphone20.png)]({{ site.github.url }}/old_site/images/d/d7/Md_hw_iphone20.png)

Using Actions
=============

The style used in the previous section was the C\# 3.0 style and it is suitable for a wide range of applications. The following section is only necessary if you want to use the Objective-C style of hooking up events.

Actions can be defined in Interface Builder in the same tab that we used to define the outlets. As an example of how to use Actions in your code, we are going to add another button to the screen, in my case it looks like this:

[![Md hw iphone21.png]({{ site.github.url }}/old_site/images/4/43/Md_hw_iphone21.png)]({{ site.github.url }}/old_site/images/4/43/Md_hw_iphone21.png)

Then select the App Delegate object in your Document Window, and go to the information pane. This time, instead of adding outlets, we are going to add actions. Add an action named "sampleTap", it should look like this when you are done:

[![Md hw iphone22.png]({{ site.github.url }}/old_site/images/5/5a/Md_hw_iphone22.png)]({{ site.github.url }}/old_site/images/5/5a/Md_hw_iphone22.png)

The next step is to make the button event send the message to our AppDelegate, to do this select the new button on the screen and go to the Connections tab. Now connect the "Touch Down" event to the App Delegate:

[![Md hw iphone23.png]({{ site.github.url }}/old_site/images/b/b4/Md_hw_iphone23.png)]({{ site.github.url }}/old_site/images/b/b4/Md_hw_iphone23.png)

When you select the App Delegate, you will be prompted for the action to invoke in there. In this case it is the "sampleTap" that we defined above. Select it:

[![Md hw iphone24.png]({{ site.github.url }}/old_site/images/6/63/Md_hw_iphone24.png)]({{ site.github.url }}/old_site/images/6/63/Md_hw_iphone24.png)

This is now how your outlets and actions should look like for your AppDelegate:

[![Md hw iphone25.png]({{ site.github.url }}/old_site/images/4/40/Md_hw_iphone25.png)]({{ site.github.url }}/old_site/images/4/40/Md_hw_iphone25.png)

Save your file and go back to MonoDevelop.

When connecting the action to your code, MonoTouch looks for a method decorated with a MonoTouch.Foundation.Export attribute specifying the name of the action. MonoDevelop automatically generates a partial method in the CodeBehind designer class with this attribute applied, for example for sampleTap:

``` csharp
[MonoTouch.Foundation.Export ("sampleTap:")]
partial void sampleTap (MonoTouch.UIKit.UIButton sender);
```

Then in your your `AppDelegate` class, MonoDevelop's code completion can assist in writing the partial method's implementation:

[![Md hw iphone26.png]({{ site.github.url }}/old_site/images/b/b9/Md_hw_iphone26.png)]({{ site.github.url }}/old_site/images/b/b9/Md_hw_iphone26.png)

For example,

``` csharp
partial void sampleTap (UIButton sender)
{
    label.Text = "Second button clicked";
}
```

However, you are free to ignore the partial method definition and instead write the handler signature and its Export attribute manually. The C\# compiler ignores partial methods without implementations.

There is more information on the binding in the [responding to events]({{ site.github.url }}/old_site/MonoTouch_API#responding-to-events "MonoTouch API") section of the API.

Deploying to the device
=======================

MonoDevelop can deploy a MonoTouch application to a correctly provisioned device.

Switch the solution configuration to one of the device configurations, for example "Debug|iPhone".

[![Md hw iphone27.png]({{ site.github.url }}/old_site/images/c/c0/Md_hw_iphone27.png)]({{ site.github.url }}/old_site/images/c/c0/Md_hw_iphone27.png)

When you have built your project for the device configuration, the "Upload to Device" command in the "Run" menu will become enabled.

[![Md hw iphone28.png]({{ site.github.url }}/old_site/images/1/13/Md_hw_iphone28.png)]({{ site.github.url }}/old_site/images/1/13/Md_hw_iphone28.png)

Running this command will then upload the application to the device.

[![Md hw iphone30.png]({{ site.github.url }}/old_site/images/7/71/Md_hw_iphone30.png)]({{ site.github.url }}/old_site/images/7/71/Md_hw_iphone30.png)

In the project options there are also a number of settings for the app bundle, for example specifying the icon, or a specific code signing key.

[![Md hw iphone29.png]({{ site.github.url }}/old_site/images/4/41/Md_hw_iphone29.png)]({{ site.github.url }}/old_site/images/4/41/Md_hw_iphone29.png)

Additionally, if there is an Info.plist file in your project, MonoDevelop will merge the app bundle settings into it without overwriting existing keys. This allows you to use advanced settings that are not exposed by the MonoDevelop GUI.

Resources
=========

Here are some pointers to dig deeper into MonoDevelop and Interface Builder:

-   [MonoTouch]({{ site.github.url }}/old_site/MonoTouch "MonoTouch")
-   [MonoTouch API]({{ site.github.url }}/old_site/MonoTouch_API "MonoTouch API")
-   [MonoTouch Events]({{ site.github.url }}/old_site/MonoTouch_Events "MonoTouch Events")
-   [Interface Builder](http://developer.apple.com/documentation/developertools/Conceptual/IB_UserGuide/ApplicationBasics/ApplicationBasics.html#//apple_ref/doc/uid/TP40005344-CH3-SW1)
-   [Defining Outlets in Interface Builder](http://developer.apple.com/documentation/developertools/Conceptual/IB_UserGuide/CodeIntegration/CodeIntegration.html)
-   [MonoDevelop](http://www.monodevelop.com)
-   [MonoTouch API Design: events and outlets in C\#]({{ site.github.url }}/MonoTouch_API)


