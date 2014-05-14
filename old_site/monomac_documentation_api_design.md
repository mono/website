---
layout: obsolete
title: "MonoMac/Documentation/API Design"
permalink: /old_site/MonoMac/Documentation/API_Design/
redirect_from:
  - /MonoMac/Documentation/API_Design/
---

MonoMac/Documentation/API Design
================================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#api-design">1 API Design</a>
<ul>
<li><a href="#overview">1.1 Overview</a></li>
<li><a href="#design-principles">1.2 Design Principles</a></li>
<li><a href="#unbound-types--members">1.3 Unbound Types &amp; Members</a></li>
<li><a href="#major-namespaces">1.4 Major Namespaces</a>
<ul>
<li><a href="#monomacobjcruntime">1.4.1 MonoMac.ObjCRuntime</a></li>
<li><a href="#monomacfoundation">1.4.2 MonoMac.Foundation</a>
<ul>
<li><a href="#nsobject">1.4.2.1 NSObject</a></li>
<li><a href="#preserveattribute">1.4.2.2 PreserveAttribute</a></li>
</ul></li>
<li><a href="#monomacappkit">1.4.3 MonoMac.AppKit</a></li>
<li><a href="#opengl">1.4.4 OpenGL</a></li>
</ul></li>
<li><a href="#binding-design">1.5 Binding Design</a>
<ul>
<li><a href="#types">1.5.1 Types</a></li>
<li><a href="#inheritance">1.5.2 Inheritance</a></li>
<li><a href="#types-and-interface-builder">1.5.3 Types and Interface Builder</a></li>
<li><a href="#delegates">1.5.4 Delegates</a>
<ul>
<li><a href="#via-events">1.5.4.1 Via Events</a></li>
<li><a href="#via-properties">1.5.4.2 Via Properties</a></li>
<li><a href="#strongly-typed-via-a-delegate-property">1.5.4.3 Strongly typed via a Delegate property</a></li>
<li><a href="#loosely-typed-via-the-weakdelegate-property">1.5.4.4 Loosely typed via the WeakDelegate property</a></li>
<li><a href="#mapping-of-the-objective-c-delegate-pattern-to-c">1.5.4.5 Mapping of the Objective-C delegate pattern to C#</a></li>
</ul></li>
<li><a href="#responding-to-events">1.5.5 Responding to Events</a></li>
<li><a href="#models">1.5.6 Models</a></li>
<li><a href="#interface-builder-outlets-and-c">1.5.7 Interface Builder Outlets and C#</a></li>
<li><a href="#selectors">1.5.8 Selectors</a></li>
<li><a href="#nsobject-constructrors">1.5.9 NSObject Constructrors</a></li>
</ul></li>
<li><a href="#memory-management">1.6 Memory Management</a>
<ul>
<li><a href="#nsobject-and-idisposable">1.6.1 NSObject and IDisposable</a></li>
<li><a href="#when-to-call-dispose">1.6.2 When to call Dispose</a></li>
<li><a href="#when-to-keep-references-to-objects">1.6.3 When to Keep References to Objects</a></li>
</ul></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

API Design
==========

Overview
--------

In addition to the core Base Class Libraries that are part of Mono, [MonoMac]({{site.github.url}}/old_site/MonoMac "MonoMac") ships with bindings for various APIs to allow developers to create native Mac OS X applications with Mono.

At the core of MonoMac there is an interop engine that bridges the C\# world with the Objective-C world as well as bindings for the OSX C-based APIs like CoreGraphics and [OpenGL](#opengl).

The low-level runtime to communicate with Objective-C code is in the [MonoMac.ObjCRuntime](#monomacobjcruntime). On top of this foundation bindings for [Foundation](#monomacfoundation), CoreFoundation and [AppKit](#monomacappkit) are provided.

Design Principles
-----------------

These are some of our design principles for the MonoMac binding:

-   Follow the Framework Design Guidelines
-   Allow developers to subclass Objective-C classes
    -   Subclass should work with C\# standard constructs
        -   Derive from an existing class
        -   Call base constructor to chain
        -   Overriding methods should be done with C\#'s override system
    -   Do not expose developers to Objective-C selectors.
-   Provide a mechanism to call arbitrary Objective-C libraries
-   Make common Objective-C tasks easy, and hard Objective-C tasks possible
-   Expose Objective-C properties as C\# properties
-   Expose a strongly typed API:
    -   Increase type-safety
    -   Minimize runtime errors
    -   Get IDE intellisense on return types
    -   Allows for IDE popup documentation
    -   Encourage in-IDE exploration of the APIs:
-   Native C\# types:
    -   [MonoMac/Documentation/API\_Design/NSString|NSString becomes string]]
    -   Turn int and uint parameters that should have been enums as C\# enumerations and C\# enumerations with [Flags] attributes.
    -   Instead of type-neutral NSArray objects expose arrays as strongly typed arrays.
        -   Example: instead of *NSArray \*getViews*, we expose the strongly typed: *NSView [] Views { get; set; }* which gives MonoDevelop a nicer code completion experience.
-   Events and notifications, give users a choice between:
    -   Support the Objective-C delegate pattern:
        -   Strongly typed version is the default\</li\>
        -   Weakly typed version for advance use cases.\</li\>
    -   C\# event system
-   Expose C\# delegates (lambdas, anonymous methods and System.Delegate) to Objective-C APIs as *blocks*.

Unbound Types & Members
-----------------------

At this point in time, not all Cocoa types and members have been bound for use by managed code. Some frameworks consist solely of C code, and thus can be bound via [P/Invoke]({{site.github.url}}/old_site/Interop_with_Native_Libraries). Other frameworks are Objective-C code, and thus require [manual selector invocation]({{site.github.url}}/old_site/MonoMac/Documentation/Binding_New_Objective-C_Types "MonoMac/Documentation/Binding New Objective-C Types").

Major Namespaces
----------------

### MonoMac.ObjCRuntime

The [MonoMac.ObjCRuntime](http://docs.go-mono.com/MonoMac.ObjCRuntime) namespace allows developers to bridge the worlds between C\# and Objective-C.

### MonoMac.Foundation

The [MonoMac.Foundation](http://docs.go-mono.com/MonoMac.Foundation) namespace provides the basic data types designed to interoperate with the Objective-C Foundation framework that is part of Mac OS X and is the base for object oriented programming in Objective-C.

MonoMac mirrors in C\# the hierarchy of classes from Objective-C. For example, the Objective-C base class [NSObject](http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSObject_Class/Reference/Reference.html#//apple_ref/doc/uid/TP40003706) is usable from C\# via [MonoMac.Foundation.NSObject](http://docs.go-mono.com/MonoMac.Foundation.NSObject).

Although this namespace provides bindings for the underlying Objective-C Foundation types, in a few cases we have mapped the underlying types to .NET types. For example:

1.  Instead of dealing with [NSString](http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html#//apple_ref/doc/uid/TP40003744) and [NSArray](http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSArray_Class/NSArray.html#//apple_ref/doc/uid/TP40003620) the runtime instead exposes these as C\# [string](http://www.go-mono.com/docs/index.aspx?link=T:System.String) and strongly typed [" array](http://www.go-mono.com/docs/index.aspx?link=T:System.Array)s throughout the API.
2.  Various helper APIs are exposed here to allow developers to bind third party Objective-C APIs, other OS X APIs or APIs that are not currently bound by MonoMac.

For more details on binding APIs see the [MonoMac Binding Generator]({{site.github.url}}/old_site/MonoMac/Documentation/Binding_New_Objective-C_Types "MonoMac/Documentation/Binding New Objective-C Types") section.

#### NSObject

The [NSObject](http://docs.go-mono.com/MonoMac.Foundation.NSObject) type is the foundation for all the Objective-C bindings. MonoMac types mirror two classes of types from the OS X Cocoa APIs: the C types (typically referred to as CoreFoundation types) and the Objective-C types (these all derive from the NSObject class).

For each type that mirrors an unmanaged type, it is possible to obtain the native object through the [Handle](http://docs.go-mono.com/MonoMac.Foundation.NSObject.Handle)

While Mono will provide garbage collection for all of your objects, we made the *MonoMac.Foundation.NSObject'* implement the [System.IDisposable](http://docs.go-mono.com/System.IDisposable) interface. This means that you can explicitly release the resources of any given NSObject without having to wait for the Garbage Collector to kick-in. This is important when you are using heavy NSObjects, for example, NSImages that might hold pointers to large blocks of data.

If your type needs to perform deterministic finalization, override the [http://docs.go-mono.com/MonoMac.Foundation.NSObject.Dispose%20(bool)](http://docs.go-mono.com/MonoMac.Foundation.NSObject.Dispose%20(bool)) NSObject.Dispose(bool) method]. The parameter to Dispose is *bool disposing*, and if set to *true* it means that your Dispose method is being called because the user explicitly called *Dispose()* on the object. If the value is false, this means that your Dispose(bool disposing) method is being called from the finalizer on the finalizer thread.

#### PreserveAttribute

PreserveAttribute is a custom attribute that is used to tell btouch, the MonoMac deployment tool, to preserve a type, or a member of a type, during the phase the application is processed to reduce its size.

Every member that is not statically linked by the application is subject to be remove. This attribute is hence used to mark members that are not statically referenced, but that are still needed by your application.

For instance, if you instantiate types dynamically, you may want to preserve the default constructor of your types. If you use XML serialization, you may want to preserve the properties of your types.

You can apply this attribute on every member of a type, or on the type itself. If you want to preserve the whole type, you can use the syntax [Preserve (AllMembers = true)] on the type.

### MonoMac.AppKit

The [MonoMac.AppKit](http://docs.go-mono.com/MonoMac.AppKit) namespace contains a one to one mapping to all of the UI components that make up Cocoa in the form of C\# classes. The API has been modified to follow the conventions used in the C\# language.

C\# delegates are provided for common operations. See the [delegates](#delegates) section for more information.

### OpenGL

For OpenGL we use the [MonoMac.OpenGL](http://docs.go-mono.com/MonoMac.OpenGL) namespace, an object-oriented binding to OpenGL based on [OpenTK](http://opentk.org) that has been modified to use CoreGraphics data types and structures as well as only exposing the functionality that is available on Mac OS X.

Binding Design
--------------

MonoMac is not merely a binding to the underlying Objective-C platform. It extends the .NET type system and dispatch system to better blend C\# and Objective-C.

Just like P/Invoke is a useful tool to invoke native libraries on Windows and Linux, or how IJW support can be used for COM interop on Windows, MonoMac extends the runtime to support binding C\# objects to Objective-C objects.

The discussion in the next few sections is not necessary for users that are creating MonoMac applications, but will help developers understand how things are done and will assist them when creating more complicated applications.

### Types

Where it made sense, we exposed C\# types instead of low-level MonoMac.Foundation types to the C\# universe. This means that [the API uses the C\# "string" type instead of NSString]({{site.github.url}}/old_site/MonoMac/Documentation/API_Design/NSString "MonoMac/Documentation/API Design/NSString") and it uses strongly typed C\# arrays instead of exposing NSArray.

Additionally, instead of exposing CGRect, CGPoint and CGSize from the CoreGraphics API, we replaced those with the System.Drawing implementations RectF, PointF and SizeF as they would help developers preserve existing OpenGL code that uses OpenTK.

### Inheritance

The MonoMac API design allows developers to extend native Objective-C types in the same way that they would extend a C\# type, using the "override" keyword on a derived class as well as chaining up to the base implementation using the "base" C\# keyword.

This design allows developers to avoid dealing with Objective-C selectors as part of their development process as the entire Objective-C system is wrapped already by the MonoMac libraries.

### Types and Interface Builder

When you create .NET classes that are instances of types created by Interface Builder, you need to provide a constructor that takes a single IntPtr parameter. This is required to bind the managed object instance with the unmanaged object. The code consists of a single line, like this:

``` csharp
public partial class void MyView : NSView {
   // This is the constructor that you need to add.
 
   public MyView (IntPtr handle) : base (handle) {}
 
}
```

### Delegates

Objective-C and C\# have different meanings for the words delegate in each language.

In the Objective-C world and in the documentation that you will find online about Cocoa, a delegate is typically an instance of a class that will respond to a set of methods. This is very similar to a C\# interface with the difference that the methods are not always mandatory.

These delegates play an important role in UIKit and other Cocoa APIs. They are used for various things:

-   To provide notifications to your code (Similar to event delivery in C\# or Gtk+)
-   To implement models for data visualization controls.
-   To drive the behavior of a control.

The programming pattern was designed to minimize the creation of derived classes to alter behavior for a control. This solution is similar in spirit to what other GUI toolkits have done over the years: Gtk's signals, Qt slots, Winforms events, WPF/Silverlight events and so on. To avoid having hundreds of interfaces (one for each action) or requiring developers to implement too many methods they do not need, Objective-C supports optional method definitions. This is different than C\# interfaces that require all methods to be implemented.

In Objective-C classes, you will see that classes that use this programming pattern expose a property, usually called *delegate* which is required to implement the mandatory parts of the interface and zero or more of the optional parts.

In MonoMac we offer four mutually exclusive mechanisms to bind to these delegates:

-   [Via events](#via-events).
-   [Via properties](#via-properties).
-   [Strongly typed via a *Delegate* property](#strongly-typed-via-a-delegate-property).
-   [[\#Loosely\_typed\_via\_the\_WeakDelegate\_property|Loosely typed via a *WeakDelegate* property.

For example, consider the [WebView](http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/WebKit/Classes/WebView_Class/Reference/Reference.html#//apple_ref/doc/uid/TP40003822) class. This dispatches to a [WebFrameLoadDelegate](http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/WebKit/Protocols/WebFrameLoadDelegate_Protocol/Reference/Reference.html#//apple_ref/doc/uid/TP40003828) instance which is assigned to the [frameLoadDelegate](http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/WebKit/Classes/WebView_Class/Reference/Reference.html#//apple_ref/doc/uid/TP40003822) property.

#### Via Events

For many types, MonoMac will automatically create an appropriate delegate which will forward the e.g. *WebFrameLoadDelegate* calls onto C\# events. For *WebView*:

-   The [webView:didStartProvisionalLoadForFrame:](http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/WebKit/Protocols/WebFrameLoadDelegate_Protocol/Reference/Reference.html#//apple_ref/doc/uid/TP40003828) method is mapped to the [WebView.StartedProvisionalLoad](http://docs.go-mono.com/MonoMac.WebKit.WebView.StartedProvisionalLoad) event.
-   The [webView:didFinishLoadForFrame:](http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/WebKit/Protocols/WebFrameLoadDelegate_Protocol/Reference/Reference.html#//apple_ref/doc/uid/TP40003828) method is mapped to the [WebView.FinishedLoad](http://docs.go-mono.com/MonoMac.WebKit.WebView.FinishedLoad) event.
-   The [webView:didFailLoadWithError:forFrame:](http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/WebKit/Protocols/WebFrameLoadDelegate_Protocol/Reference/Reference.html#//apple_ref/doc/uid/TP40003828) method is mapped to the [WebView.FailedLoadWithError](http://docs.go-mono.com/MonoMac.WebKit.WebView.FailedLoadWithError) event.

For example, this simple program times the time it takes to load a web view:

``` csharp
DateTime startTime, endTime;
var web = new WebView (new RectangleF (0, 0, 200, 200), "frameName", "groupName");
web.StartedProvisionalLoad  += (o, e) =&gt; startTime = DateTime.Now;
web.FinishedLoad            += (o, e) =&gt; end = DateTime.Now;
```

#### Via Properties

Events are useful when there might be more than one subscriber to the event. We also limit events to cases where there is no return value from the code.

For cases where the code is expected to return a value, we opted instead for properties. This means that only one method can be set at a given time in an object.

For example, you can use this mechanism to dismiss the keyboard on the screen on the handler for a NSTextField:

``` csharp
void SetupTextField (NSTextField tf)
{
    tf.TextShouldEndEditing = (control, fieldEditor) =&gt; {
        tf.ResignFirstResponder ();
        return true;
    };
}
```

The NSTextField's TextShouldEndEditing property in this case takes as an argument a delegate that returns a bool value and determines whether the TextField should do something with the Return button being pressed.

#### Strongly typed via a Delegate property

If you would prefer not to use events, you can provide your own [WebFrameLoadDelegate](http://docs.go-mono.com/MonoMac.WebKit.WebFrameLoadDelegate) subclass and assign it to the [WebView.FrameLoadDelegate](http://docs.go-mono.com/MonoMac.WebKit.WebView.FrameLoadDelegate) property. Once *WebView.FrameLoadDelegate* has been assigned, the *WebView* event dispatch mechanism will no longer function, and the WebFrameLoadDelegate methods will be invoked when the corresponding events occur.

For example, this simple type records the time it takes to load a web view:

``` csharp
class Notifier : WebFrameLoadDelegate {
    DateTime startTime, endTime;
 
    public override void StartedProvisionalLoad (WebView sender, WebFrame forFrame)
    {
        startTime = DateTime.Now;
    }
 
    public override void FinishedLoad (WebView sender, WebFrame forFrame)
    {
        endTime = DateTime.Now;
    }
}
```

The above is used in code like this:

``` csharp
var web = new WebView (new RectangleF (0, 0, 200, 200), "frameName", "groupName");
web.frameLoadDelegate = new Notifier ();
```

The above will create a *WebView* and it will instruct it to send messages to an instance of *Notifier*, a class that we created to respond to messages.

This pattern is also used to control behavior for certain controls. *TODO: Example.*

The pattern is also used to provide the data on demand for a few controls. For example the [NSTableView](http://docs.go-mono.com/MonoMac.AppKit.NSTableView) control is a powerful table rendering control and both the look and the contents are driven by an instace of a [NSTableViewDataSource](http://docs.go-mono.com/MonoMac.AppKit.NSTableViewDataSource) set in the [NSTableView.DataSource](http://docs.go-mono.com/MonoMac.AppKit.NSTableView.DataSource) property.

#### Loosely typed via the WeakDelegate property

In addition to the strongly typed property, there is also a weak typed delegate that allows the developer to bind things differently if desired. Everywhere where a strongly typed *Delegate* property is exposed in MonoMac's binding a corresponding *WeakDelegate* property is also exposed.

When using the *WeakDelegate* you are responsible for properly decorating your class using the [ExportAttribute](http://docs.go-mono.com/MonoMac.Foundation.ExportAttribute) attribute to specify the selector. For example:

``` csharp
class Notifier : NSObject {
    DateTime startTime, endTime;
 
        [Export ("webView:didStartProvisionalLoadForFrame:")]
        public void StartedProvisionalLoad (WebView sender, WebFrame forFrame)
    {
        startTime = DateTime.Now;
    }
 
        [Export ("webView:didFinishLoadForFrame:")]
        public void FinishedLoad (WebView sender, WebFrame forFrame)
        {
        endTime = DateTime.Now;
        }
}
 
// ...
var web = new WebView ();
web.WeakDelegate = new Notifier ();
```

Note that once the *WeakDelegate* property has been assigned, the *Delegate* property will not be used. Additionally, if you implement the method in an inherited base class that you wish to [Export] you must make it a public method.

#### Mapping of the Objective-C delegate pattern to C\#

When you see Objective-C samples that look like this:

    foo.delegate = [[SomethingDelegate alloc] init];

This instructs the language to create and construct an instance of the class *SomethingDelegate* and assign the value to the delegate property on the foo variable. This mechanism is supported by MonoMac and C\# the syntax is:

``` csharp
foo.Delegate = new SomethingDelegate ();
```

In MonoMac we have provided strongly-typed classes that map to the Objective-C delegate classes. To use them, you will be subclassing and overriding the methods defined by MonoMac's implementation. For more information on how they work, see the section [Models](#models) below.

### Responding to Events

In Objective-C code sometimes event handlers for multiple controls and provides for information for multiple controls will be hosted in the same class. This is possible because classes respond to messages, and as long as a class responds to that message it is possible to link objects together.

As previously detailed, MonoMac supports both the Objective-C delegate pattern, when you can create a new class that implements the delegate and override the desired methods as well as the C\# event-based programming model.

It is also possible to support Objective-C's pattern where responders for multiple different operations are all hosted in the same instance of a class. To do this though, you will have to use low-level features of the MonoMac binding.

For example, if you wanted your class to respond both to the *NSTextFieldDelegate.control:textShouldEndEditing:* message as well as the *NSWebViewDelegate.webView:didStartProvisionalLoadForFrame:* message in the same instance of a class you would have to use the [Export] attribute declaration. It would look like this:

[Export ("webView:didStartProvisionalLoadForFrame:")]

``` csharp
class MyCallbacks : NSObject {
 
        [Export ("control:textShouldEndEditing:")]
    public bool ShouldEndEditing (NSControl control, NSText textShouldEndEditing)
    {
        return true;
    }
 
        [Export ("webView:didStartProvisionalLoadForFrame:")]
        public void StartedProvisionalLoad (WebView sender, WebFrame forFrame)
    {
        // loading started...
    }
}
```

The C\# names for the methods are not important, all that matters are the strings passed to the [Export] attribute.

When using this style of programming you are responsible for making sure that the C\# parameters match the actual types that the runtime engine will pass.

### Models

In AppKit storage facilities or responders are implemented using helper classes, these are usually referred in the Objective-C code as delegates and they are implemented as protocols.

Objective-C protocols are like interfaces, but they support optional methods, that is, not all of the methods need to be implemented for the protocol to work.

There are two ways of implementing a model, you can either implement it manually or use the existing strongly typed definitions.

The manual mechanism is necessary when you try to implement a class that has not been bound by MonoMac. It is very easy to do, all you have to do is:

-   Flag your class for registration with the runtime\</li\>
-   Apply the [Export] attribute with the actual selector name on each method you want to override\</li\>
-   Instantiate the class, and pass it.\</li\>

For example, the following implement only one of the optional methods in the UIApplicationDelegate protocol definition:

``` csharp
public class MyAppController : NSObject {
    [Export ("applicationDidFinishLaunching:")]
    public void DidFinishLaunching (NSNotification notification)
    {
        SetupWindow ();
    }
}
```

The Objective-C selector name ("applicationDidFinishLaunching:") is declared with the Export attribute and the class is registered with the [Register] attribute.

MonoMac provides already strongly typed declarations ready to use that do not require manual binding. To support this programming model, the MonoMac runtime supports the [Model] attribute on a class declaration. This informs the runtime that it should not wire up all the methods in the class, unless the method is explicitly implemented.

This means that in MonoMac.AppKitKit the classes that represent a protocol with optional methods are written like this:

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
    public override void DidFinishedLaunching (NSNotification notification)
    {
        ...
    }
}
```

The advantage is that there is no need to dig into the Objective-C header files to find the selector, the types of the arguments, the mapping to C\# and that you get intellisense from MonoDevelop and strong types.

### Interface Builder Outlets and C\#

This is a low-level description of how Outlets integrate with C\# and is provided for advanced users of MonoMac. When using MonoDevelop the mapping is done automatically behind the scenes using generated code on the flight for you.

When you design your user interface with Interface Builder, you will only be designing the look of the application and will establish some default connections. If you want to programatically fetch information, alter the behavior of a control at runtime or modify the control at runtime, it is necessary to bind some of the controls to your managed code.

This is done in a few steps:

1.  Add the outlet declaration to your "File's owner".
2.  Connect your control to the "File's owner".
3.  Store the UI plus the connections into your XIB/NIB file.
4.  Load the NIB file at runtime.
5.  Access the outlet variable.

The steps (1) through (3) are covered in Apple's documentation for building interfaces with Interface Builder.

When using MonoMac your application will need to create a class that derives from [NSViewController](http://docs.go-mono.com/MonoMac.AppKit.NSViewController) and implement it like this:

``` csharp
public class MyViewController : NSViewController {
    public MyViewController (string nibName, NSBundle bundle) : base (nibName, bundle)
    {
        // You can have as many arguments as you want, but you need to call
        // the base constructor with the provided nibName and bundle.
    }
}
```

Then to load your ViewController from a NIB file, you do this:

``` csharp
var controller = new MyViewController ("HelloWorld", NSBundle.MainBundle);
```

This loads the user interface from the NIB. Now, to access the outlets, it is necessary to inform the runtime that we want to access them. To do this, the `UIViewController` subclass needs to declare the properties and annotate them with the [Connect] attribute. Like this:

``` csharp
[Connect]
NSTextField UserName {
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

### Selectors

A core concept of Objective-C programming are selectors. You will often come across APIs that require you to pass a selector, or expects your code to respond to a selector.

Creating new selectors in C\# is very easy, you just create a new instance of the [MonoMac.ObjCRuntime.Selector](http://docs.go-mono.com/MonoMac.ObjCRuntime.Selector) class and use the result in any place in the API that requires it. For example:

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

### NSObject Constructrors

Most classes in MonoMac that derive from NSObject will expose constructors specific to the functionality of the object, but they will also expose various constructors that are not immediately obvious.

The constructors are used as follows:

**public Foo (IntPtr handle)**   
This constructor is used to instantiate your class when the runtime needs to map your class to an unmanaged class. This happens when you load a XIB/NIB file. The Objective-C runtime will have at this point created an object in the unmanaged world and this constructor will be called to initialize the managed side.

Typically all you need to do is call the base constructor with the handle parameter and in your body do any initialization that is necessary.

**public Foo ()**   
This is the default constructor for a class, and in MonoTouch provided classes this initializes the MonoTouch.Foundation.NSObject class and all of the classes in between and at the end chains this to Objective's C "init" method on the class.

**public Foo (NSObjectFlag x)**   
This constructor is used to initialize the instance, but prevent the code from calling the Objective-C "init" method at the end. You typically use this when you already have registered for initialization (when you use [Export] on your constructor) or when you have already done your initialization through another mean.

**public Foo (NSCoder coder)**   
This constructor is provided for the cases where the object is being initialized from an NSCoding instance. For more information see Apple's \<a href="[http://developer.apple.com/mac/library/documentation/Cocoa/Conceptual/Archiving/index.html\#//apple\_ref/doc/uid/10000047i](http://developer.apple.com/mac/library/documentation/Cocoa/Conceptual/Archiving/index.html#//apple_ref/doc/uid/10000047i)" title="[http://developer.apple.com/mac/library/documentation/Cocoa/Conceptual/Archiving/index.html\#//apple\_ref/doc/uid/10000047i](http://developer.apple.com/mac/library/documentation/Cocoa/Conceptual/Archiving/index.html#//apple_ref/doc/uid/10000047i)" class="external"\>Archives and Serialization Programming Guide\</a\>.

The MonoMac API design does not raise Objective-C exceptions as C\# exceptions. The design enforces that no garbage be sent to the Objective-C world in the first place and that any exceptions that must be produced are produced by the binding itself before invalid data is ever passed to the Objective-C world.

Memory Management
-----------------

MonoMac has a garbage collector that will take care of releasing resources for you when they are no longer in use. In addition to the garbage collector, all objects that derive from NSObject implement the System.IDisposable interface.

### NSObject and IDisposable

Exposing the IDisposable interface is a convenient way of assisting developers in releasing objects that might encapsulate large blocks of memory (for example an UIImage might look like just an inocent pointer, but could be pointing to a 2 megabyte image) and also to other important and finite resources (like a video decoding buffer).

NSObject implements the IDisposable interface and also the [.NET Dispose pattern](http://msdn.microsoft.com/en-us/library/fs2xkftw.aspx). This allows developers that subclass NSObject to override the Dispose behavior and release their own resources on demand. For example, consider this view controller that keeps around a bunch of images:

``` csharp
class MenuViewController : UIViewController {
    UIImage breakfast, lunch, dinner;
    [...]
    public override void Dispose (bool disposing)
    {
        if (disposing){
             if (breakfast != null) breakfast.Dispose (); breakfast = null;
             if (lunch != null) lunch.Dispose (); lunch = null;
             if (dinner != null) dinner.Dispose (); dinner = null;
        }
        base.Dispose (disposing)
    }
}
```

When a managed object is disposed, it is no longer useful. You might still have a reference to the objects, but the object is for all intents and purposes invalid at this point. Some .NET APIs ensure this by throwing an ObjectDisposedException if you try to access any methods on a disposed object, for example:

``` csharp
var image = UIImage.FromFile ("demo.png");
image.Dispose ();
image.XXX = false;  // this at this point is an invalid operation
```

Even if you can still access the variable "image", it is really an invalid reference and no longer points to the Objective-C object that held the image.

But disposing an object in C\# does not mean that the object will necessarily be destroyed. All you do is release the reference that C\# had to the object. It is possible that the Cocoa environment might have kept a reference around for its own use. For example, if you set a NSImageView's Image property to an image, and then you dispose the image, the underlying UIImageView took its own reference and will keep a reference to this object until it is done using it.

### When to call Dispose

You should call Dispose when you need Mono to get rid of your object. A possible use case is when Mono has no knowledge that your NSObject is actually holding a reference to an important resource like memory, or an information pool. In those cases, you should call Dispose to immediately release the reference to the memory, instead of waiting for Mono to perform a garbage collection cycle.

Internally, when Mono creates [NSString references from C\# strings]({{site.github.url}}/old_site/MonoMac/Documentation/API_Design/NSString "MonoMac/Documentation/API Design/NSString"), it will dispose them immediately to reduce the amount of work that the garbage collector has to do. The fewer objects around to deal with, the faster the GC will run.

### When to Keep References to Objects

One side-effect that automatic memory management has is that the GC will get rid of unused objects as long as there are no references to them. This sometimes can have surprising side effects, for example, if you create a local variable to hold your toplevel view controller, or your toplevel window, and then having those vanish behind your back.

If you do not keep a reference in your static or instance variables to your objects, Mono will happily call the Dispose() method on them, and they will release the reference to the object. Since this might be the only outstanding reference, the Objective-C runtime will destroy the object for you.

