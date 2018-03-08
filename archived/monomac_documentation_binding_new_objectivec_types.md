---
title: "MonoMac/Documentation/Binding New Objective-C Types"
lastmodified: '2011-05-11'
redirect_from:
  - /MonoMac/Documentation/Binding_New_Objective-C_Types/
---

MonoMac/Documentation/Binding New Objective-C Types
===================================================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#binding-objective-c-types">1 Binding Objective-C Types</a>
<ul>
<li><a href="#binding-an-api">1.1 Binding an API</a></li>
<li><a href="#the-api-definition-file">1.2 The API definition file</a>
<ul>
<li><a href="#binding-methods">1.2.1 Binding Methods</a></li>
<li><a href="#binding-properties">1.2.2 Binding Properties</a></li>
<li><a href="#binding-constructors">1.2.3 Binding Constructors</a></li>
<li><a href="#binding-protocols">1.2.4 Binding Protocols</a></li>
<li><a href="#binding-class-extensions">1.2.5 Binding Class Extensions.</a></li>
<li><a href="#">1.2.6</a></li>
<li><a href="#type-mappings">1.2.7 Type mappings</a></li>
<li><a href="#arrays">1.2.8 Arrays</a></li>
<li><a href="#selectors">1.2.9 Selectors</a></li>
<li><a href="#memory-management-attributes">1.2.10 Memory management attributes</a></li>
<li><a href="#style-guidelines">1.2.11 Style Guidelines</a></li>
<li><a href="#using-internal">1.2.12 Using [Internal]</a></li>
</ul></li>
<li><a href="#event-handlers-and-callbacks">1.3 Event Handlers and Callbacks</a></li>
<li><a href="#enumerations-and-base-types">1.4 Enumerations and Base Types</a></li>
<li><a href="#outref-parameters">1.5 out/ref parameters</a></li>
<li><a href="#binding-objective-c-argument-lists">1.6 Binding Objective-C Argument Lists</a></li>
<li><a href="#binding-fields">1.7 Binding Fields</a></li>
<li><a href="#binding-blocks">1.8 Binding Blocks</a></li>
<li><a href="#linking-the-dependencies">1.9 Linking the Dependencies</a></li>
<li><a href="#assisted-references">1.10 Assisted References</a></li>
<li><a href="#inheriting-protocols">1.11 Inheriting Protocols</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Binding Objective-C Types
=========================

This document describes how to bind Objective-C APIs, if you are binding just C APIs, you should use the standard .NET mechanism for this, [the P/Invoke framework](/Interop_with_Native_Libraries). Details on how to statically link a C library are available on the Linking Native Libraries page.

If you would rather bind the API manually, see the [Binding Details](/MonoMac/Documentation/Binding_New_Objective-C_Types/Binding_Details) page.

Binding an API
--------------

To do a comprehensive binding, you will want to understand the Objective-C API definition and familiarize yourself with the .NET Framework Design Guidelines.

The new **bmac** tool simplifies binding an Objective-C API and does the heavy lifting for you: registering the selectors, taking care of invoking the proper handle for overwritten classes, doing parameter checking and doing some of the common marshaling required for your project.

To bind your library you will typically start with an API definition file. An API definition file is merely a C# source file that contains interfaces that have been annotated with a handful of attributes that help drive the binding.

For example, this is a trivial api file for a library:

``` csharp
using MonoMac.Foundation;
 
namespace Cocos2D {
    [BaseType (typeof (NSObject))]
    interface Camera {
        [Static, Export ("getZEye")]
        float ZEye { get; }
 
        [Export ("restore")]
        void Restore ();
 
        [Export ("locate")]
        void Locate ();
 
        [Export ("setEyeX:eyeY:eyeZ:")]
        void SetEyeXYZ (float x, float y, float z);
 
        [Export ("setMode:")]
        void SetMode (CameraMode mode);
    }
}
```

The above sample defines a class called Cocos2D.Camera that derives from the NSObject base type (this type comes from MonoMac.Foundation.NSObject) and which defines a static property (ZEye), two methods that take no arguments and a method that takes three arguments.

An in-depth discussion of the format of the API file and the attributes is covered in the [API definition file](#the-api-definition-file) section below.

To produce a complete binding, you will typically deal with three sets of sources:

-   The API definition file.
-   Optional: any enums, types, structs required by the API definition file.
-   Optional: extra sources that might expand the generated binding, or provide a more C# friendly API.

The API Definition file: will only contain namespaces and interface definitions (with any members that an interface can contain) and should not contain classes, enumerations, delegates or structs. The API definition file is merely the contract that will be used to generate the API.

Any extra code that you need like enumerations or supporting classes should be hosted on a separate file, in the example above the "CameraMode" is an enumeration value that does not exist in the .cs file and should be hosted in a separate file, for example "enums.cs":

``` csharp
public enum CameraMode {
    FlyOver, Back, Follow </pre>
}
```

The extra sources file typically contains event definitions, or contains code that is not handled directly by the generator. Each class produced by the generator from the API definition file is a partial class, so you can extend the class with new methods like this:

``` csharp
public partial class Camera {
    // Provide a ToString method
    public override string ToString ()
    {
         return String.Format ("ZEye: {0}", ZEye);
    }
}
```

Now we will build the API into a library that we can use in our solution. From the shell execute the following command:

``` bash
bash$ bmac cocos2d.cs -s:enums.cs extensions.cs
```

The above command will generate the file cocos2d.dll in the current directory, and it will contain the fully bound library that you can use in your project.

Sometimes you might find that you need a few enumeration values, delegate definitions or other types. Do not place those in the API definitions file, as this is merely a contract

The API definition file
-----------------------

The API definition file consists of a number of interfaces. The interfaces in the API definition will be turned into a class declaration and they must be decorated with the [BaseType] attribute to specify the base class for the class.

You might be wondering why we did not use classes instead of interfaces for the contract definition. We picked interfaces because it allowed us to write the contract for a method without having to supply a method body in the API definition file, or having to supply a body that had to throw an exception or return a meaningful value.

But since we are using the interface as a skeleton to generate a class we had to resort to decorating various parts of the contract with attributes to drive the binding.

### Binding Methods

The simplest binding you can do is to bind a method. Just declare a method in the interface with the C# naming conventions and decorate the method with the [Export] attribute. The [Export] attribute is what links your C# name with the Objective-C name in the MonoMac runtime. The parameter of the Export attribute is the name of the Objective-C selector, some examples:

``` csharp
// A method, that takes no arguments
[Export ("refresh")]
void Refresh ();
 
// A method that takes two arguments and return the result
[Export ("add:and:")]
int Add (int a, int b);
 
// A method that takes a string
[Export ("draw:atColumn:andRow:")]
void Draw (string text, int column, int row);
```

The above samples show how you can bind instance methods. To bind static methods, you must use the [Static] attribute, like this:

``` csharp
// A static method, that takes no arguments
[Static, Export ("refresh")]
void Beep ();
```

This is required because the contract is part of an interface, and interfaces have no notion of static vs instance declarations, so it is necessary once again to resort to attributes. If you want to hide a particular method from the binding, you can decorate the method with the [Internal] attribute.

The bmac command will introduce checks for reference parameters to not be null. If you want to allow null values for a particular parameter, use the [NullAllowed] attribute on the parameter, like this:

``` csharp
[Export ("setText:")]
string SetText ([NullAllowed] string text);
```

When exporting a reference type, with the [Export] keyword you can also specify the allocation semantics. This is necessary to ensure that no data is leaked: TODO DOCUMENT.

### Binding Properties

Just like methods, Objective-C properties are bound using the [Export] attribute and map directly to C# properties. Just like methods, properties can be decorated with the [Static] and the [Internal] attributes.

When you use the [Export] attribute on a property under the covers bmac actually binds two methods: the getter and the setter. The name that you provide to export is the basename and the the setter is computed by prepending the word "set", turning the first letter of the basename into upper case and making the selector take an argument. This means that [Export ("label")] applied on a property actually binds the "label" and "setLabel:" Objective-C methods.

Sometimes the Objective-C properties do not follow the pattern described above and the name is manually overwritten. In those cases you can control the way that the binding is generated by using the [Bind] attribute on the getter or setter, for example:

``` csharp
[Export ("menuVisible")]
bool MenuVisible { [Bind ("isMenuVisible")] get; set; }
```

This then binds "isMenuVisible" and "setMenuVisible:".

Just like methods allow some parameters to be flagged with [NullAllowed], you can apply [NullAllowed] to a property to indicate that null is a valid value for the property, for example:

``` csharp
[Export ("text"), NullAllowed]
string Text { get; set; }
```

The [NullAllowed] parameter can also be specified directly on the setter: [Export ("text")] string Text { get; [NullAllowed] set; } \</csharp\>

### Binding Constructors

The **bmac** tool will automatically generate fours constructors in your class, for a given class *Foo*, it generates:

> Foo ()<br/>
> the default constructor (maps to Objective-C's "init" constructor)
>
> Foo (NSCoder)<br/>
> the constructor used during deserialization of NIB files (maps to Objective-C's "initWithCoder:" constructor).
>
> Foo (IntPtr handle)<br/>
> the constructor for handle-based creation, this is invoked by the runtime when the runtime needs to expose a managed object from an unmanaged object.
>
> Foo (NSEmptyFlag)<br/>
> this is used by derived classes to prevent double initialization.
>
For constructors that you define, they need to be declared using the following signature inside the Interface definition: they must return an IntPtr value and the name of the method should be Constructor. For example to bind the initWithFrame: constructor, this is what you would use:

``` csharp
[Export ("initWithFrame:")]
IntPtr Constructor (RectangleF frame);
```

### Binding Protocols

As described in the API design document, in the section [discussing Models and Protocols](/MonoMac/Documentation/API), MonoMac maps the Objective-C protocols into classes that have been flagged with the [Model] attribute. This is typically used when implementing Objective-C delegate classes.

The big difference between a regular bound class and a delegate class is that the delegate class might have one or more optional methods.

For example consider the UIKit class UIAccelerometerDelegate, this is how it is bound in MonoMac:

``` csharp
[BaseType (typeof (NSObject))]
[Model]
public interface NSTextStorageDelegate {
    [Export ("textStorageWillProcessEditing:")]
    void TextStorageWillProcessEditing (NSNotification notification);
 
    [Export ("textStorageDidProcessEditing:")]
    void TextStorageDidProcessEditing (NSNotification notification);
}
```

Since this is an optional method on the definition for *NSTextStorageDelegate* there is nothing else to do. But if there was a required method on the protocol, you should add the [Abstract] attribute to the method. This will force the user of the implementation to actually provide a body for the method.

In general, protocols are used in classes that respond to messages. This is typically done in Objective-C by assigning to the "delegate" property an instance of an object that responds to the methods in the protocol.

The convention in MonoMac is to support both the Objective-C loosely coupled style where any instance of an NSObject can be assigned to the delegate, and to also expose a strongly typed version of it. For this reason, we typically provide both a *Delegate* property that is strongly typed and a *WeakDelegate* that is loosely typed. We usually bind the loosely typed version with Export, and we use the [Wrap] attribute to provide the strongly typed version.

This shows how we bound the NSTextStorage class:

``` csharp
[BaseType (typeof (NSMutableAttributedString))]
public interface NSTextStorage {
 
    [Wrap ("WeakDelegate")]
    NSTextStorageDelegate Delegate { get; set; }
 
    [Export ("delegate")]
    NSObject WeakDelegate { get; set; }
 
    // other members omitted for brevity
}
```

### Binding Class Extensions

In Objective-C it is possible to extend classes with new methods, similar in spirit to C#'s extension methods. When one of these methods is present, you can use the [Target] attribute to flag the first parameter of a method as being the receiver of the Objective-C message.

For example, in MonoMac we bound the extension methods that are defined on NSString when UIKit is imported as methods in the UIView, like this:

``` csharp
[BaseType (typeof (NSObject))]
interface NSImage {
 
    [Bind ("drawInRect:withAttributes:")]
    void DrawInRect ([Target] string str, RectangleF rect, NSDictionary attributes);
 
    // other members omitted for brevity
}
```

###

### Type mappings

The following table shows how you should map types from the Objective-C and CocoaTouch world to the MonoMac world:

> |Objective-C Type Name|MonoMac Type|
> |:--------------------|:-----------|
> |CFTimeInterval|double|
> |NSString|string|
> |GCRect|System.Drawing.RectangleF|
> |CGPoint|System.Drawing.PointF|
> |CGSize|System.Drawing.SizeF|
> |CGFloat|float|
> |CoreFoundation types (CF\*)|[MonoMac.CoreFoundation](http://docs.go-mono.com/?link=N:MonoMac.CoreFoundation).CF\*|
> |Foundation Types (NS\*)|[MonoMac.Foundation](http://docs.go-mono.com/?link=N:MonoMac.Foundation).NS\*|
>

### Arrays

The MonoMac runtime automatically takes care of converting C# arrays to NSArrays and doing the conversion back, so for example the imaginary Objective-C method that returns an NSArray of NSViews:

    - NSArray *getPeerViews ();

Is bound like this:

``` csharp
[Export("getPeerViews")]
UIView [] GetPeerViews ();
```

Although you could always return NSObject [] as the return value, the array would not be strongly typed, and MonoDevelop would not be able to provide code completion for you, and you would have to cast the object to the real object later.

### Selectors

### Memory management attributes

When you use the [Export] attribute and you are passing data that will be retained by the called method, you can specify the argument semantics by passing it as a second parameter, for example:

``` csharp
[Export ("method", ArgumentSemantic.Retain)]
```

The above would flag the value as having the "Retain" semantics. The semantics available are:

> Assign<br/>
> Copy<br/>
> Retain

### Style Guidelines

### Using [Internal]

You can use the [Internal] attribute to hide a method from the public API. You might want to do this in cases where the exposed API is too low-level and you want to provide a high-level implementation in a separate file based on this method.

You can also use this when you run into limitations in the binding generator, for example some advanced scenarios might expose types that are not bound and you want to bind in your own way, and you want to wrap those types yourself in your own way.

Event Handlers and Callbacks
----------------------------

Objective-C classes typically broadcast notifications or request information by sending a message on a delegate class (Objective-C delegate).

This model, while fully supported and surfaced by MonoMac can sometimes be cumbersome. MonoMac exposes the C# event pattern and a method-callback system on the class that can be used in these situations. This allows code like this to run:

``` csharp
button.Clicked += delegate {
    Console.WriteLine ("I was clicked");
};
```

The binding generator is capable of reducing the amount of typing required to map the Objective-C pattern into the C# pattern.

Is is also possible to instruct the generator to produce bindings for a specific Objective-C delegates and expose the delegate as C# events and properties on the host type.

There are two classes involved in this process, the host class which will is the one that currently emits events and sends those into the Delegate or WeakDelegate and the actual delegate class.

Considering the following setup:

``` csharp
[BaseType (typeof (NSObject))]
interface MyClass {
    [Export ("delegate", ArgumentSemantic.Assign)][NullAllowed]
    NSObject WeakDelegate { get; set; }
 
    [Wrap ("WeakDelegate")][NullAllowed]
    MyClassDelegate Delegate { get; set; }
}
 
[BaseType (typeof (NSObject))]
interface MyClassDelegate {
    [Export ("loaded:bytes:")]
    void Loaded (MyClass sender, int bytes);
}
```

To wrap the class you must:

-   In your host class, add to your [BaseType] declaration the type that is acting as its delegate and the C# name that you exposed. In our example above those are "typeof (MyClassDelegate)" and "WeakDelegate" respectively.\</li\>
-   In your delegate class, on each method that has more than two parameters, you need to specify the type that you want to use for the automatically generated EventArgs class.\</li\>

The binding generator is not limited to wrapping only a single event destination, it is possible that some Objective-C classes to emit messages to more than one delegate, so you will have to provide arrays to support this setup. Most setups will not need it, but the generator is ready to support those cases.

The resulting code will be:

``` csharp
[BaseType (typeof (NSObject),
    Delegates=new string [] {"WeakDelegate"},
    Events=new Type [] (typeof (MyClassDelegate)))]
interface MyClass {
    [Export ("delegate", ArgumentSemantic.Assign)][NullAllowed]
    NSObject WeakDelegate { get; set; }
 
    [Wrap ("WeakDelegate")][NullAllowed]
    MyClassDelegate Delegate { get; set; }
}
 
[BaseType (typeof (NSObject))]
interface MyClassDelegate {
    [Export ("loaded:bytes:"), EventArgs ("MyClassLoaded")]
    void Loaded (MyClass sender, int bytes);
}
```

The EventArgs is used to specify the name of the EventArgs class to be generated. You should use one per signature (in this example, the EventArgs will contain a "With" property of type int).

With the definitions above, the generator will produce the following event in the generated MyClass:

``` csharp
public MyClassLoadedEventArgs : EventArgs {
    public MyClassLoadedEventArgs (int bytes);
    public int Bytes { get; set; }
}
 
public event EventHandler&lt;MyClassLoadedEventArgs&gt; Loaded {
    add; remove;
}
```

So you can now use the code like this:

``` csharp
MyClass c = new MyClass ();
c.Loaded += delegate (sender, args){
    Console.WriteLine ("Loaded event with {0} bytes", args.Bytes);
};
```

Callbacks are just like event invocations, the difference is that instead of having multiple potential subscribers (for example, multiple methods can hook into a "Clicked" event or a "Download Finished" event) callbacks can only have a single subscriber.

The process is identical, the only difference is that instead of exposing the name of the EventArgs class that will be generated, the EventArgs actually is used to name the resulting C# delegate name.

If the method in the delegate class returns a value, the binding generator will map this into a delegate method in the parent class instead of an event. In these cases you need to provide the default value that should be returned by the method if the user does not hook up to the delegate. You do this using the [DefaultValue] or [DefaultValueFromArgument] attributes.

DefaultValue will hardcode a return value, while [DefaultValueFromArgument] is used to specify which input argument will be returned.

Enumerations and Base Types
---------------------------

You can also reference enumerations or base types that are not directly supported by the btouch interface definition system. To do this, put your enumerations and core types into a separate file and include this as part of one of the extra files that you provide to btouch.

out/ref parameters
------------------

Some APIs return values in their parameters, or pass parameters by reference. The MonoMac generator have support for binding out/ref parameters that are subclasses of NSObject.

Typically the signature looks like this::

    - (void) someting:(int) foo withError:(NSError **) return
    - (void) someString:(NSObject **)byref

Your binding would look like this:

``` csharp
[Export ("something:withError:")]
void Something (int foo, out NSError error);
[Export ("someString:")]
void SomeString (ref NSObject byref);
```

Binding Objective-C Argument Lists
----------------------------------

Objective-C supports variadic arguments, you can use the following technique described by Zach Gris on [this post](http://forums.monotouch.net/yaf_postst311_SOLVED-Binding-ObjectiveC-Argument-Lists.aspx).

An Objective-C message looks like this:

    - (void) appendWorkers:(XWorker *) firstWorker, ... NS_REQUIRES_NIL_TERMINATION ;

To invoke this method from C# you will want to create a signature like this:

``` csharp
[Export ("appendWorkers"), Internal]
void AppendWorkers (Worker firstWorker, IntPtr workersPtr);
```

This declares the method as internal, hiding the above API from users, but exposing it to the library. Then you can write a method like this:

``` csharp
public void AppendWorkers(params Worker[] workers)
{
    if (workers == null)
         throw new ArgumentNullException ("workers");
 
    var pNativeArr = Marshal.AllocHGlobal(workers.Length * IntPtr.Size);
    for (int i = 1; i &lt; workers.Length; ++i)
        Marshal.WriteIntPtr (pNativeArr, (i - 1) * IntPtr.Size, workers[i].Handle);
 
    // Null termination
    Marshal.WriteIntPtr (pNativeArr, (workers.Length - 1) * IntPtr.Size, IntPtr.Zero);
 
    // the signature for this method has gone from (IntPtr, IntPtr) to (Worker, IntPtr)
    WorkerManager.AppendWorkers(workers[0], pNativeArr);
    Marshal.FreeHGlobal(pNativeArr);
}
```

Binding Fields
--------------

There is also support for binding fields in a declaration. This simplifies the process of accessing a value that is declared in an external library from C#.

Usually these fields contain strings or integers values that must be referenced. They are commonly used as string that represent a specific notification and as keys in dictionaries.

To bind a field, add a read-only property to your interface definition file, and decorate the property with the [Field] attribute. This attribute takes one parameter: the C name of the symbol to lookup. For example:

``` csharp
[Field ("NSSomeEventNotification")]
string NSSomeEventNotification { get; }
```

Binding Blocks
--------------

Blocks are a new construct introduced by Apple to bring the functional equivalent of C# anonymous methods to Objective-C. For example, the NSSet class now exposes this method:

    - (void) enumerateObjectsUsingBlock:(void (^)(id obj, BOOL *stop)) block

The above description declares a method called *enumerateObjectsUsingBlock:* that takes one argument named *block*. This block is similar to a C# anonymous method in that it has support for capturing the current environment (the "this" pointer, access to local variables and parameters). The above method in NSSet invokes the block with two parameters an NSObject (the *id obj* part) and a pointer to a boolean (the *BOOL \*stop*) part.

To bind this kind of API with bmap, you need to first declare the block type signature as a C# delegate and then reference it from an API entry point, like this:

``` csharp
// This declares the callback signature for the block:
delegate void NSSetEnumerator (NSObject obj, ref bool stop)
 
// Later, inside your definition, do this:
[Export ("enumerateObjectUsingBlock:")]
void Enumerate (NSSetEnumerator enum);
</pre>
 
And now your code can call your function from C#:
<csharp>
var myset = new NSMutableSet () { Add (new NSString ("Foo")) };
 
s.Enumerate (delegate (NSObject obj, ref bool stop){
    Console.WriteLine ("The first object is: {0} and stop is: {1}", obj, stop);
});
```

You can also use lambdas if you prefer:

``` csharp
var myset = new NSMutableSet () { Add (new NSString ("Foo")) };
 
s.Enumerate ((obj, stop) =&gt; {
    Console.WriteLine ("The first object is: {0} and stop is: {1}", obj, stop);
});
```

Linking the Dependencies
------------------------

If you are binding APIs that are not part of your application, you need to make sure that your executable is linked against these libraries.

On the project options for your final executable (not the library itself, but the final program) you need to add in "iPhone Build's" Extra argument (these are part of your project options) the "-gcc_flags" option followed by a quoted string that contains all the extra libraries that are required for your program, for example:

    -gcc_flags "-L${ProjectDir} -lMylibrary -force_load -lSystemLibrary -framework CFNetwork -ObjC"

The above example will link *libMyLibrary.a*, *libSystemLibrary.dylib* and the *CFNetwork* framework library into your final executable.

You might be wondering, why do you need "force_load" command, and the reason is that the -ObjC flag although it compiles the code in, it does not preserve the metadata required to support categories (the linker/compiler dead code elimination strips it) which you need at runtime for MonoMac.

Assisted References
-------------------

Some transient objects like action sheets and alert boxes are cumbersome to keep track of for developers and the binding generator can help a little bit here.

For example if you had a class that showed a message and then generated a "Done" event, the traditional way of handling this would be:

``` csharp
class Demo {
    MessageBox box;
 
    void ShowError (string msg)
    {
        box = new MessageBox (msg);
        box.Done += { box = null; ... };
    }
}
```

In the above scenario the developer needs to keep the reference to the object himself and either leak or actively clear the reference for box on his own. While binding code, the generator supports keeping track of the reference for you and clear it when a special method is invoked, the above code would then become:

``` csharp
class Demo {
    void ShowError (string msg)
    {
        var box = new MessageBox (msg);
        box.Done += { ... };
    }
}
```

Notice how it is no longer necessary to keep the variable in an instance, that it works with a local variable and that it is not necessary to clear the reference when the object dies.

To take advantage of this, your class should have a Events property set in the [BaseType] declaration and also the KeepUntilRef variable set to the name of the method that is invoked when the object has completed its work, like this:

``` csharp
[BaseType (typeof (NSObject), KeepUntilRef="Dismiss"), Delegates=new string [] { "WeakDelegate" }, Events=new Type [] { typeof (SomeDelegate) }) ]
class Demo {
    [Export ("show");]
}
```

Inheriting Protocols
--------------------

We support inheriting from protocols that have been marked with the [Model] property. This is useful in certain API patterns, such as in MapKit where the MKOverlay protocol, inherits from the MKAnnotation protocol, and is adopted by a number of classes which inherit from NSObject. Historically we required copying the protocol to every implementation, but in these cases now we can have the MKShape class inherit from the MKOverlay protocol and it will generate all the required methods automatically.

