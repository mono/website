---
layout: obsolete
title: "MonoMac/Features"
permalink: /old_site/MonoMac/Features/
redirect_from:
  - /MonoMac/Features/
---

MonoMac/Features
================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#Features">1 Features</a>
<ul>
<li><a href="#Automatic_Memory_Management">1.1 Automatic Memory Management</a></li>
<li><a href="#Type_Safety">1.2 Type Safety</a></li>
<li><a href="#C.23_3.0">1.3 C# 3.0</a></li>
<li><a href="#Use_Mac_OS_X_APIs">1.4 Use Mac OS X APIs</a></li>
<li><a href="#Access_to_third_party_iPhone.2FObjective-C_Libraries">1.5 Access to third party iPhone/Objective-C Libraries</a></li>
<li><a href="#MonoDevelop_Integration">1.6 MonoDevelop Integration</a></li>
<li><a href="#Interface_Builder_Integration">1.7 Interface Builder Integration</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Features
========

Automatic Memory Management
---------------------------

Mono comes with a garbage collector that allows developers to focus on their software and let the runtime take care of the bookkeeping required to release objects. This avoids common memory leaks and reduces the amount of code that needs to be written to avoid these leaks.

Type Safety
-----------

The C\# language in combination with the ECMA runtime prevent a whole class of errors from your application. With C\# the common errors of reusing disposed objects accidentally, overflowing a buffer, casting an object into the wrong type (leading to corruption), releasing the memory twice or keeping dangling objects are a thing of the past.

C\# 3.0
-------

The C\# 3.0 language is a rich high-level language that brings many constructs that improve programmer productivity.

In addition to traditional object oriented languages, C\# offers many interesting new constructs: type safe generic types, automatic state machines created with iterators, lambda functions and anonymous methods, built-in properties and built-in event systems as well as the System.Linq namespace that allows developers to create functional programming constructs.

The terse syntax allows configurations of objects in one pass:

``` csharp
var slider = new UISlider (new RectangleF (174f, 12f, 120f, 7f)){
    BackgroundColor = UIColor.Clear,
    MinValue = 0f,
    MaxValue = 100f,
    Continuous = true,
    Value = 50f,
    Tag = kViewTag
};
slider.ValueChanged += delegate {
    Console.WriteLine ("New value {0}", slider.Value);
};
```

Use Mac OS X APIs
-----------------

MonoMac binds the Objective-C APIs that developers use on the Mac into [MonoMac/API C\# APIs](/index.php?title=MonoMac/API_C&action=edit&redlink=1 "MonoMac/API C (page does not exist)") that expose the functionality and map this to any ECMA CIL powered language. Objective-C delegates are exposed to C\# applications [MonoMac/API\#Delegates in a number of ways](/index.php?title=MonoMac/API&action=edit&redlink=1 "MonoMac/API (page does not exist)") giving developers complete control of how to consume and integrate with native APIs.

MonoMac provides a C\#/ECMA binding for:

-   Addressbook and AddressbookUI
-   AudioToolbox
-   AVFoundation
-   CoreAnimation/Quartz
-   CoreGraphics/Quartz
-   CoreLocation
-   CoreMotion
-   EventKit and EventKitUI
-   ExternalAccessory
-   Foundation and CoreFoundation
-   GameKit
-   OpenGL ES 1.1 and OpenGL ES 2.0
-   QuickLook
-   MediaPlayer
-   MessageUI
-   SystemConfiguration

From the pure C\#-based event model to the native Objective-C system, the two mechanisms are supported.

For example, to respond to events, programmers can just connect to the events they are interested in:

``` csharp
var page = new UIPageControl (new RectangleF (120f, 14f, 178f, 20f)){
    BackgroundColor = UIColor.Gray,
    Pages = 10,
    Tag = kViewTag
};
 
page.TouchUpInside += delegate {
    Console.WriteLine ("Current page: {0}", page.CurrentPage);
};
```

Access to third party iPhone/Objective-C Libraries
--------------------------------------------------

MonoMac allows you to access libraries created in the Objective-C language for the Mac easily and to create C\#/.NET bindings to Objective-C libraries.

This process is described in detail in our [MonoMac/Binding\_New\_Objective-C\_Types Binding Objective-C](/index.php?title=MonoMac/Binding_New_Objective-C_Types_Binding_Objective-C&action=edit&redlink=1 "MonoMac/Binding New Objective-C Types Binding Objective-C (page does not exist)") libraries.

MonoDevelop Integration
-----------------------

MonoMac is an SDK that can be used with your favorite editor, be it a full integrated development environment or a simple text editor.

MonoDevelop's code completion helps you quickly explore the API as you write your application: \<img src="[http://monotouch.net/@api/deki/files/19/=Md\_hw\_iphone19.png](http://monotouch.net/@api/deki/files/19/=Md_hw_iphone19.png)" style="width: 644px; height: 267px;" alt="Md\_hw\_iphone19.png" class="internal default" /\>

Our tutorial [MonoMac/Tutorials/MonoDevelop\_HelloWorld walks you through creating your first MonoMac application](/index.php?title=MonoMac/Tutorials/MonoDevelop_HelloWorld_walks_you_through_creating_your_first_MonoMac_application&action=edit&redlink=1 "MonoMac/Tutorials/MonoDevelop HelloWorld walks you through creating your first MonoMac application (page does not exist)").

Interface Builder Integration
-----------------------------

Both MonoDevelop and the MonoMac SDK allow you to use Interface Builder to create and customize your UIs.

We take Interface Builder one step further than XCode does by making MonoMac automatically bind any outlets you define on your interface and any methods that you define in your interface to your C\# code.

You will never have to manually bind any outlets from Interface Builder to your code as MonoMac takes care of this.

