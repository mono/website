---
layout: obsolete
title: "MonoMac/Documentation/Binding New Objective-C Types/Binding Details"
permalink: /old_site/MonoMac/Documentation/Binding_New_Objective-C_Types/Binding_Details/
redirect_from:
  - /MonoMac/Documentation/Binding_New_Objective-C_Types/Binding_Details/
---

MonoMac/Documentation/Binding New Objective-C Types/Binding Details
===================================================================

Binding Details
===============

These are the details of how the binding takes place.

It is possible to use the [[Register](http://docs.go-mono.com/MonoMac.Foundation.RegisterAttribute)] attribute, [[Export](http://docs.go-mono.com/MonoMac.Foundation.ExportAttribute)] attribute, and [manual Objective-C selector invocation](/index.php?title=MonoMac/Documentation/Objective-C_Selectors&action=edit&redlink=1 "MonoMac/Documentation/Objective-C Selectors (page does not exist)") together to manually bind new (previously unbound) Objective-C types.

First, find a type that you wish to bind. For discussion purposes (and simplicity), we'll bind the [NSEnumerator](http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSEnumerator_Class/Reference/Reference.html#//apple_ref/doc/uid/TP40003654) type (which has already been bound in [MonoMac.Foundation.NSEnumerator](http://docs.go-mono.com/MonoMac.Foundation.NSEnumerator); the implementation below is just for example purposes).

Second, we need to create the C\# type. We'll likely want to place this into a namespace; since Objective-C doesn't support namespaces, we'll need to use the [Register] attribute to change the type name that MonoTouch will register with the Objective-C runtime. The C\# type must also inherit from [MonoMac.Foundation.NSObject](http://docs.go-mono.com/MonoMac.Foundation.NSObject):

``` csharp
namespace MonoMac.Example.Binding {
    [Register("NSEnumerator")]
    class NSEnumerator : NSObject
    {
        // see steps 3-5
    }
}
```

Third, review the Objective-C documentation and create [MonoMac.ObjCRuntime.Selector](http://docs.go-mono.com/MonoMac.ObjCRuntime.Selector) instances for each selector you wish to use. Place these within the class body:

``` csharp
static Selector selInit       = new Selector("init");
static Selector selAllObjects = new Selector("allObjects");
static Selector selNextObject = new Selector("nextObject");
```

Fourth, your type will need to provide constructors. You *must* chain your constructor invocation to the base class constructor. The [Export] attributes permit Objective-C code to call the constructors with the specified selector name:

``` csharp
[Export("init")]
public NSEnumerator()
    : base(NSObjectFlag.Empty)
{
    Handle = Messaging.IntPtr_objc_msgSend(this.Handle, selInit.Handle);
}
 
// This constructor must be present so that MonoTouch 
// can create instances of your type from Objective-C code.
public NSEnumerator(IntPtr handle)
    : base(handle)
{
}
```

Fifth, provide methods for each of the Selectors declared in Step 3. These will use objc\_msgSend() to invoke the selector on the native object. Note the use of [Runtime.GetNSObject()](http://docs.go-mono.com/MonoMac.ObjCRuntime.Runtime.GetNSObject%20(System.IntPtr)) to convert an IntPtr into an appropriately typed NSObject (sub-)type. If you want the method to be callable from Objective-C code, the member *must* be **virtual**.

``` csharp
[Export("nextObject")]
public virtual NSObject NextObject()
{
    return Runtime.GetNSObject(
        Messaging.IntPtr_objc_msgSend(this.Handle, selNextObject.Handle));
}
 
// Note that for properties, [Export] goes on the get/set method:
public virtual NSArray AllObjects {
    [Export("allObjects")]
    get {
        return (NSArray) Runtime.GetNSObject(
            Messaging.IntPtr_objc_msgSend(this.Handle, selAllObjects.Handle));
    }
}
```

Putting it all together:

``` csharp
using System;
using MonoTouch.Foundation;
using MonoTouch.ObjCRuntime;
 
namespace MonoTouch.Example.Binding {
    [Register("NSEnumerator")]
    class NSEnumerator : NSObject
    {
        static Selector selInit       = new Selector("init");
        static Selector selAllObjects = new Selector("allObjects");
        static Selector selNextObject = new Selector("nextObject");
 
        [Export("init")]
        public NSEnumerator()
            : base(NSObjectFlag.Empty)
        {
            Handle = Messaging.IntPtr_objc_msgSend(this.Handle,
                selInit.Handle);
        }
 
        public NSEnumerator(IntPtr handle)
            : base(handle)
        {
        }
 
        [Export("nextObject")]
        public virtual NSObject NextObject()
        {
            return Runtime.GetNSObject(
                Messaging.IntPtr_objc_msgSend(this.Handle,
                    selNextObject.Handle));
        }
 
        // Note that for properties, [Export] goes on the get/set method:
        public virtual NSArray AllObjects {
            [Export("allObjects")]
            get {
                return (NSArray) Runtime.GetNSObject(
                    Messaging.IntPtr_objc_msgSend(this.Handle,
                        selAllObjects.Handle));
            }
        }
    }
}
```

