---
title: "MonoTouch API"
lastmodified: '2009-08-29'
redirect_from:
  - /MonoTouch_API/
---

MonoTouch API
=============

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#overview">1 Overview</a></li>
<li><a href="#unbound-types--members">2 Unbound Types &amp; Members</a></li>
<li><a href="#major-namespaces">3 Major Namespaces</a>
<ul>
<li><a href="#monotouchobjcruntime">3.1 MonoTouch.ObjCRuntime</a></li>
<li><a href="#monotouchfoundation">3.2 MonoTouch.Foundation</a>
<ul>
<li><a href="#nsobject">3.2.1 NSObject</a></li>
</ul></li>
<li><a href="#monotouchuikit">3.3 MonoTouch.UIKit</a></li>
<li><a href="#opengles">3.4 OpenGLES</a></li>
</ul></li>
<li><a href="#binding-design">4 Binding Design</a>
<ul>
<li><a href="#types">4.1 Types</a></li>
<li><a href="#delegates">4.2 Delegates</a>
<ul>
<li><a href="#via-events">4.2.1 Via Events</a></li>
<li><a href="#strongly-typed-via-a-delegate-property">4.2.2 Strongly typed via a Delegate property</a></li>
<li><a href="#loosely-typed-via-the-weakdelegate-property">4.2.3 Loosely typed via the WeakDelegate property</a></li>
<li><a href="#mapping-of-the-objective-c-delegate-pattern-to-c">4.2.4 Mapping of the Objective-C delegate pattern to C#</a></li>
<li><a href="#mapping-delegates-to-c">4.2.5 Mapping Delegates to C#</a></li>
</ul></li>
<li><a href="#responding-to-events">4.3 Responding to Events</a></li>
<li><a href="#models">4.4 Models</a></li>
<li><a href="#interface-builder-outlets-and-c">4.5 Interface Builder Outlets and C#</a></li>
<li><a href="#selectors">4.6 Selectors</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Overview
========

In addition to the core Base Class Libraries that are part of Mono, [MonoTouch](/MonoTouch "MonoTouch") ships with bindings for various iPhone APIs to allow developers to create native iPhone applications with Mono.

At the core of MonoTouch there is an interop engine that bridges the C\# world with the Objective-C world as well as bindings for the iPhone C-based APIs like CoreGraphics and [OpenGLES](#opengles).

The low-level runtime to communicate with Objective-C code is in the [MonoTouch.ObjCRuntime](#monotouchobjcruntime). On top of this foundation bindings for [Foundation](#monotouchfoundation), CoreFoundation and [UIKit](#monotouchuikit) are provided.

Unbound Types & Members
=======================

At this point in time, not all CocoaTouch types and members have been bound for use by managed code. Some frameworks consist solely of C code, and thus can be bound via [P/Invoke](/Interop_with_Native_Libraries). Other frameworks are Objective-C code, and thus require [manual selector invocation](/MonoTouch_ManualSelectorInvocation "MonoTouch ManualSelectorInvocation").

Major Namespaces
================

MonoTouch.ObjCRuntime
---------------------

The [MonoTouch.ObjCRuntime](http://www.go-mono.com/docs/index.aspx?tlink=20@N:MonoTouch.ObjCRuntime) namespace allows developers to bridge the worlds between C\# and Objective-C. This is a new binding designed specifically for the iPhone based on the experience from Cocoa\# and Gtk\#.

MonoTouch.Foundation
--------------------

The [MonoTouch.Foundation](http://www.go-mono.com/docs/index.aspx?link=N:MonoTouch.Foundation) namespace provides the basic data types designed to interoperate with the Objective-C Foundation framework that is part of the iPhone and it is the base for object oriented programming in Objective-C.

MonoTouch mirrors in C\# the hierarchy of classes from Objective-C. For example, the Objective-C base class [NSObject](http://developer.apple.com/iphone/library/documentation/Cocoa/Reference/Foundation/Classes/NSObject_Class/Reference/Reference.html) is usable from C\# via [MonoTouch.Foundation.NSObject](http://www.go-mono.com/docs/index.aspx?link=T:MonoTouch.Foundation.NSObject).

Although this namespace provides bindings for the underlying Objective-C Foundation types, in a few cases we have mapped the underlying types to .NET types. For example:

-   Instead of dealing with [NSString](http://developer.apple.com/iphone/library/documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html) and [NSArray](http://developer.apple.com/iphone/library/documentation/Cocoa/Reference/Foundation/Classes/NSArray_Class/Reference/Reference.html) the runtime instead exposes these as C\# [string](http://www.go-mono.com/docs/index.aspx?link=T:System.String)s and strongly typed [array](http://www.go-mono.com/docs/index.aspx?link=T:System.Array)s throughout the API.
-   Various helper APIs are exposed here to allow developers to bind third party Objective-C APIs, other iPhone APIs or APIs that are not currently bound by MonoTouch.

For more details on binding APIs see the MonoTouch Binding Generator section.

### NSObject

The [NSObject](http://www.go-mono.com/docs/index.aspx?link=T:MonoTouch.Foundation.NSObject) type is the foundation for all the Objective-C bindings.

While Mono will provide garbage collection for all of your objects, we made the `MonoTouch.Foundation.NSObject` implement the [http:/monodoc/T:System.IDisposable System.IDisposable] interface. If your type needs to perform deterministic finalization, override the [NSObject.Dispose(bool) method](http://www.go-mono.com/docs/index.aspx?link=M:MonoTouch.Foundation.NSObject.Dispose(System.Boolean)).

MonoTouch.UIKit
---------------

The [MonoTouch.UIKit](http://www.go-mono.com/docs/index.aspx?link=N:MonoTouch.UIKit) namespace contains a 1 to 1 mapping to all of the UI components that make up CocoaTouch in the form of C\# classes. The API has been modified to follow the conventions used in the C\# language.

C\# delegates are provided for common operations. See the [delegates](#delegates) section for more information.

OpenGLES
--------

For OpenGLES we distribute a [modified version](http://www.go-mono.com/docs/index.aspx?link=N:OpenTK) of the [OpenTK](http://www.opentk.com) API, an object-oriented binding to OpenGL that has been modified to use CoreGraphics data types and structures as well as only exposing the functionality that is available on the iPhone.

OpenGLES 1.1 functionality is available through the [ES](http://www.go-mono.com/docs/index.aspx?link=T:OpenTK.Graphics.ES11.ES) type.

OpenGLES 2.0 functionality is available through the [ES](http://www.go-mono.com/docs/index.aspx?link=T:OpenTK.Graphics.ES20.ES) type.

Binding Design
==============

MonoTouch is not merely a binding to the underlying Objective-C platform. It extends the .NET type system and dispatch system to better blend C\# and Objective-C.

Just like P/Invoke is a useful tool to invoke native libraries on Windows and Linux, or how IJW support can be used for COM interop on Windows, MonoTouch extends the runtime to support binding C\# objects to Objective-C objects.

The discussion in the next few sections is not necessary for users that are creating MonoTouch applications, but will help developers understand how things are done and will assist them when creating more complicated applications.

Types
-----

Where it made sense, we exposed C\# types instead of low-level MonoTouch.Foundation types to the C\# universe. This means that the API uses the C\# "string" type instead of NSString and it uses strongly typed C\# arrays instead of exposing NSArray.

Additionally, instead of exposing CGRect, CGPoint and CGSize from the CoreGraphics API, we replaced those with the System.Drawing implementations RectF, PointF and SizeF as they would help developers preserve existing OpenGL code that uses OpenTK.

Delegates
---------

Objective-C and C\# have different meanings for the words delegate in each language.

In the Objective-C world and in the documentation that you will find online about CocoaTouch, a delegate is typically an instance of a class that will respond to a set of methods. This is very similar to a C\# interface with the difference that the methods are not always mandatory.

 These delegates play an important role in UIKit and other CocoaTouch APIs. They are used for various things:

-   To provide notifications to your code (Similar to event delivery in C\# or Gtk+)
-   To implement models for data visualization controls.
-   To drive the behavior of a control.

The programming pattern was designed to minimize the creation of derived classes to alter behavior for a control. This solution is similar in spirit to what other GUI toolkits have done over the years: Gtk's signals, Qt slots, Winforms events, WPF/Silverlight events and so on. To avoid having hundreds of interfaces (one for each action) or requiring developers to implement too many methods they do not need, Objective-C supports optional method definitions. This is different than C\# interfaces that require all methods to be implemented.

In Objective-C classes, you will see that classes that use this programming pattern expose a property, usually called `delegate` which is required to implement the mandatory parts of the interface and zero or more of the optional parts.

In MonoTouch we offer three mutually exclusive mechanisms to bind to these delegates:

1.  [Via events](#events).
2.  [Strongly typed via a `Delegate` property](#strongdelegate).
3.  [Loosely typed via a `WeakDelegate` property](#weakdelegate).

For example, consider the [UIWebView](http://developer.apple.com/iphone/library/documentation/UIKit/Reference/UIWebView_Class/Reference/Reference.html) class. This dispatches to a [UIWebViewDelegate](http://developer.apple.com/iphone/library/documentation/UIKit/Reference/UIWebViewDelegate_Protocol/Reference/Reference.html) instance which is assigned to the [delegate](http://developer.apple.com/iphone/library/documentation/UIKit/Reference/UIWebView_Class/Reference/Reference.html#//apple_ref/occ/instp/UIWebView/delegate) property.

### Via Events

For many types, MonoTouch will automatically create an appropriate delegate which will forward the UIWebViewDelegate calls onto C\# events. For UIWebView:

-   The [webViewDidStartLoad](http://developer.apple.com/iphone/library/documentation/UIKit/Reference/UIWebViewDelegate_Protocol/Reference/Reference.html#//apple_ref/occ/intfm/UIWebViewDelegate/webViewDidStartLoad:) method is mapped to the [UIWebView.LoadStarted](http://www.go-mono.com/docs/index.aspx?link=E:MonoTouch.UIKit.UIWebView.LoadStarted) event.
-   The [webViewDidFinishLoad](http://developer.apple.com/iphone/library/documentation/UIKit/Reference/UIWebViewDelegate_Protocol/Reference/Reference.html#//apple_ref/occ/intfm/UIWebViewDelegate/webViewDidFinishLoad:) method is mapped to the [UIWebView.LoadFinished](http://www.go-mono.com/docs/index.aspx?link=E:MonoTouch.UIKit.UIWebView.LoadFinished) event.
-   The [webView:didFailLoadWithError](http://developer.apple.com/iphone/library/documentation/UIKit/Reference/UIWebViewDelegate_Protocol/Reference/Reference.html#//apple_ref/occ/intfm/UIWebViewDelegate/webView:didFailLoadWithError:) method is mapped to the [UIWebView.LoadError](http://www.go-mono.com/docs/index.aspx?link=E:MonoTouch.UIKit.UIWebView.LoadError) event.

For example, this simple program times the time it takes to load a web view:

``` csharp
DateTime startTime, endTime;
var web = new UIWebView (new CGRect (0, 0, 200, 200));
web.LoadStarted += (o, e) => startTime = DateTime.Now;
web.LoadFinished += (o, e) => endTime = DateTime.Now;
```

### Strongly typed via a Delegate property

If you would prefer not to use events, you can provide your own [UIWebViewDelegate](http://www.go-mono.com/docs/index.aspx?link=T:MonoTouch.UIKit.UIWebViewDelegate) subclass and assign it to the [UIWebView.Delegate](http://www.go-mono.com/docs/index.aspx?link=P:MonoTouch.UIKit.UIWebView.Delegate) property. Once UIWebView.Delegate has been assigned, the UIWebView event dispatch mechanism will no longer function, and the UIWebViewDelegate methods will be invoked when the corresponding events occur.

For example, this simple type records the time it takes to load a web view:

``` csharp
class Notifier : UIWebViewDelegate  {
    DateTime startTime, endTime;
 
    public override LoadStarted (UIWebView webview)
    {
        startTime = DateTime.Now;
    }
 
    public override LoadingFinished (UIWebView webView)
    { 
        endTime= DateTime.Now;
    }
}
```

The above is used in code like this:

``` csharp
     var web = new UIWebView (new CGRect (0, 0, 200, 200));
     web.Delegate = new Notifier ();
```

The above will create a UIWebViewer and it will instruct it to send messages to an instance of Notifier, a class that we created to respond to messages.

This pattern is also used to control behavior for certain controls, for example in the UIWebView case, the [UIWebView.ShouldStartLoad](http://www.go-mono.com/docs/index.aspx?link=P:MonoTouch.UIKit.UIWebView.ShouldStartLoad) property allows the UIWebView instance to control whether the UIWebView will load a page or not.

The pattern is also used to provide the data on demand for a few controls. For example the [UITableView](http://www.go-mono.com/docs/index.aspx?link=T:MonoTouch.UIKit.UITableView) control is a powerful table rendering control and both the look and the contents are driven by an instace of a [UITableViewDataSource](http://www.go-mono.com/docs/index.aspx?link=T:MonoTouch.UIKit.UITableViewDataSource).

### Loosely typed via the WeakDelegate property

In addition to the strongly typed property, there is also a weak typed delegate that allows the developer to bind things differently if desired. Everywhere where a strongly typed `Delegate` property is exposed in MonoTouch's binding a corresponding `WeakDelegate` property is also exposed.

When using the `WeakDelegate` you are responsible for properly decorating your class using the [Export](http://www.go-mono.com/docs/index.aspx?link=T:MonoTouch.Foundation.ExportAttribute) attribute to specify the selector. For example:

``` csharp
class Notifier : NSObject  {
    DateTime startTime, endTime;
 
    [Export ("webViewDidStartLoad:")]
    public void LoadStarted (UIWebView webview)
    {
        startTime = DateTime.Now;
    }
 
    [Export ("webViewDidFinishLoad:")]
    public void LoadingFinished (UIWebView webView)
    { 
        endTime= DateTime.Now;
    }
}
[...]
     var web = new UIWebView (new CGRect (0, 0, 200, 200));
     web.WeakDelegate = new Notifier ();
```

Note that once the `WeakDelegate` property has been assigned, the `Delegate` property will not be used.

### Mapping of the Objective-C delegate pattern to C\#

When you see Objective-C samples that look like this:

``` c
foo.delegate = [[SomethingDelegate] alloc] init]
```

This instructs the language to create and construct an instance of the class "SomethingDelegate" and assign the value to the delegate property on the foo variable. This mechanism is supported by MonoTouch and C\# the syntax is:

``` csharp
    foo.Delegate = new SomethingDelegate ();
```

In MonoTouch we have provided strongly-typed classes that map to the Objective-C delegate classes. To use them, you will be subclassing and overriding the methods defined by MonoTouch's implementation. For more information on how they work, see the section "Models" below.

### Mapping Delegates to C\#

UIKit in general uses Objective-C delegates in two forms.

The first form is to provide an interface to a component's model. For example, as a mechanism to provide data on demand for a view, for example as the data storage facility for a List view. In these cases, you should always create an instance of the proper class and assign the variable.

In the following example, we provide the UIPickerView with an implementation for a model that uses strings:

``` csharp
public class SampleTitleModel : UIPickerViewTitleModel {
 
    public override string TitleForRow (UIPickerView picker, int row, int component) 
    { 
        return String.Format ("At {0} {1}", row, component);
    } 
}
 
[...]
 
pickerView.Model = new MyPickerModel ();
```

The second form is to provide notification for events. In those cases, although we still expose the API in the form outlined above, we also provide C\# events, which should be simpler to use for quick operations and integrated with anonymous delegates and lambda expressions in C\#.

For example, you can subscribe to UIAccelerometer events like this:

``` csharp
   UIAccelerometer.SharedAccelerometer.Acceleration += (sender, args) => {
      UIAcceleration acc = args.Acceleration;
      Console.WriteLine ("Time={0} at {1},{2},{3}", acc.Time, acc.X, acc.Y, acc.Z);
   }
```

The two options are available where they make sense, but as a programmer you must pick one or the other. If you create your own instance of a strongly typed responder/delegate and assign it, the C\# events will not be functional. If you use the C\# events, the methods in your responder/delegate class will never be called.

The previous example that used UIWebView can be written using C\# 3.0 lambdas like this:

``` csharp
var web = new UIWebView (new CGRect (0, 0, 200, 200));
web.LoadStarted += () => { startTime = DateTime.Now; }
web.LoadFinished += () => { endTime = DateTime.Now; }
```

Responding to Events
--------------------

In Objective-C code sometimes event handlers for multiple controls and provides for information for multiple controls will be hosted in the same class. This is possible because classes respond to messages, and as long as a class responds to that message it is possible to link objects together.

As previously detailed, MonoTouch supports both the Objective-C delegate pattern, when you can create a new class that implements the delegate and override the desired methods as well as the C\# event-based programming model.

It is also possible to support Objective-C's pattern where responders for multiple different operations are all hosted in the same instance of a class. To do this though, you will have to use low-level features of the MonoTouch binding.

For example, if you wanted your class to respond both to the `UITextFieldDelegate.textFieldShouldClear:` message as well as the `UIWebViewDelegate.webViewDidStartLoad:` in the same instance of a class you would have to use the [Export] attribute declaration. It would look like this:

``` csharp
public class MyCallbacks : NSObject {
    [Export ("textFieldShouldClear:"]
    public bool should_we_clear (UITextField tf)
    {
        return true;
    }
 
    [Export ("webViewDidStartLoad:")] 
    public void OnWebViewStart (UIWebView view)
    {
        Console.WriteLine ("Loading started");
    }
}
```

The C\# names for the methods are not important, all that matters are the strings passed to the [Export] attribute.

When using this style of programming you are responsible for making sure that the C\# parameters match the actual types that the runtime engine will pass.

Models
------

In UIKit storage facilities or responders are implemented using helper classes, these are usually referred in the Objective-C code as delegates and they are implemented as protocols.

Objective-C protocols are like interfaces, but they support optional methods, that is, not all of the methods need to be implemented for the protocol to work.

There are two ways of implementing a model, you can either implement it manually or use the existing strongly typed definitions.

The manual mechanism is necessary when you try to implement a class that has not been bound by MonoTouch. It is very easy to do, all you have to do is:

-   Flag your class for registration with the runtime
-   Apply the [Export] attribute with the actual selector name on each method you want to override
-   Instantiate the class, and pass it.

For example, the following implement only one of the optional methods in the UIApplicationDelegate protocol definition:

``` csharp
public class MyAppController : NSObject {
        [Export ("applicationDidFinishLaunching:")]
        public void FinishedLaunching (UIApplication app)
        {
                SetupWindow ();
        }
}
```

The Objective-C selector name ("applicationDidFinishLaunching:") is declared with the Export attribute and the class is registered with the [Register] attribute.

MonoTouch provides already strongly typed declarations ready to use that do not require manual binding. To support this programming model, the MonoTouch runtime supports the [Model] attribute on a class declaration. This informs the runtime that it should not wire up all the methods in the class, unless the method is explicitly implemented.

This means that in MonoTouch.UIKit the classes that represent a protocol with optional methods are written like this:

``` csharp
[Model]
public class SomeViewModel : NSObject {
    [Export ("someMethod:")]
    public virtual int SomeMethod (TheView view) {
       throw new ModelNotImplementedException ();
    }
    ...
}
```

When you want to implement a model that only implements some of the methods all you have to do is to override the methods that you are interested in, and ignore the other methods. The runtime will only hook up the overwritten methods, not the original methods to the Objective-C world.

The equivalent to the previous manual sample is:

``` csharp
public class AppController : UIApplicationDelegate {
    public override void FinishedLaunching (UIApplication uia)
    {
     ...
    }
}
```

The advantage is that there is no need to dig into the Objective-C header files to find the selector, the types of the arguments, the mapping to C\# and that you get intellisense from MonoDevelop and strong types.

Interface Builder Outlets and C\#
---------------------------------

This is a low-level description of how Outlets integrate with C\# and is provided for advanced users of MonoTouch. When using MonoDevelop the mapping is done automatically behind the scenes using generated code on the flight for you.

When you design your user interface with Interface Builder, you will only be designing the look of the application and will establish some default connections. If you want to programatically fetch information, alter the behavior of a control at runtime or modify the control at runtime, it is necessary to bind some of the controls to your managed code.

This is done in a few steps:

1.  Add the outlet declaration to your "File's owner".
2.  Connect your control to the "File's owner".
3.  Store the UI plus the connections into your XIB/NIB file.
4.  Load the NIB file at runtime.
5.  Access the outlet variable.

The steps (1) through (3) are covered in Apple's documentation for building interfaces with Interface Builder.

When using MonoTouch your application will need to create a class that derives from UIViewController and implement it like this:

``` csharp
public class MyViewController : UIViewController {
    public MyViewController (string nibName, NSBundle bundle) : base (nibName, bundle)
    {
        // You can have as many arguments as you want, but you need to call
        // the base constructor with the provided nibName and bundle.
    }
}
```

Then to load your ViewController from a NIB file, you do this:

``` csharp
     var controller = new MyViewController ("HelloWorld", NSBundle.MainBundle, this);
```

This loads the user interface from the NIB. Now, to access the outlets, it is necessary to inform the runtime that we want to access them. To do this, the `UIViewController` subclass needs to declare the properties and annotate them with the [Connect] attribute. Like this:

``` csharp
[Connect]
UITextField UserName { 
    get {
        return (UITextField) GetNativeField ("UserName");
    }
    set {
        SetNativeField ("UserName", value);
    }
}
```

The property implementation is the one that actually fetches and stores the value for the actual native type.

You do not need to worry about this when using MonoDevelop and InterfaceBuilder. MonoDevelop automatically mirrors all the declared outlets with code in a partial class that is compiled as part of your project.

Selectors
---------

A core concept of Objective-C programming are selectors. You will often come across APIs that require you to pass a selector, or expects your code to respond to a selector.

Creating new selectors in C\# is very easy, you just create a new instance of the `MonoTouch.ObjCRuntime.Selector` class and use the result in any place in the API that requires it. For example:

``` csharp
    var selector_add = new Selector ("add:plus:");
```

To make a C\# method respond to a selector call, you need to inherit from the NSObject type and decorating your C\# method with the selector name using the [Export] attribute, for example:

``` csharp
public class MyMath : NSObject {
    [Export ("add:plus:")]
    int Add (int first, int second)
    {
         return first + second;
    }
}
```

Note that selector names **must** match exactly, including all intermediate and trailing colons (":") if present.

