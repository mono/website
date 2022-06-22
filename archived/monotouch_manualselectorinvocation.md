---
title: "MonoTouch ManualSelectorInvocation"
lastmodified: '2009-09-07'
redirect_from:
  - /MonoTouch_ManualSelectorInvocation/
---

MonoTouch ManualSelectorInvocation
==================================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#objective-c-selectors">1 Objective-C Selectors</a>
<ul>
<li><a href="#example">1.1 Example</a></li>
<li><a href="#invoking-a-selector">1.2 Invoking a Selector</a>
<ul>
<li><a href="#selector-targets">1.2.1 Selector Targets</a></li>
<li><a href="#selector-names">1.2.2 Selector Names</a></li>
<li><a href="#calling-objc_msgsend">1.2.3 Calling objc_msgSend()</a></li>
</ul></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Objective-C Selectors
=====================

The Objective-C language is based upon **selectors**. A selector is a message that can be sent to an object or a **class**. MonoTouch maps instance selectors to instance methods, and class selectors to static methods.

Unlike normal C functions (and like C++ member functions), you cannot directly invoke a selector using [P/Invoke](/Interop_with_Native_Libraries). (Aside: in theory you could use P/Invoke for non-virtual C++ member functions, but you'd need to worry about per-compiler name mangling, which is a world of pain better ignored.) Instead, selectors are sent to an Objective-C class or instance using the [objc_msgSend function](http://developer.apple.com/mac/library/documentation/Cocoa/Reference/ObjCRuntimeRef/Reference/reference.html#//apple_ref/c/func/objc_msgSend).

You may find [this helpful guide on Objective-C messaging](http://developer.apple.com/iphone/library/documentation/cocoa/conceptual/ObjCRuntimeGuide/Articles/ocrtHowMessagingWorks.html) useful.

Example
-------

Suppose you want to invoke the [-[NSString sizeWithFont:forWidth:lineBreakMode:](http://developer.apple.com/iphone/library/documentation/UIKit/Reference/NSString_UIKit_Additions/Reference/Reference.html#//apple_ref/occ/instm/NSString/sizeWithFont:forWidth:lineBreakMode:)] selector. The declaration (from Apple's documentation) is:

- (CGSize)sizeWithFont:(UIFont \*)font forWidth:(CGFloat)width lineBreakMode:(UILineBreakMode)lineBreakMode

The return type, GSize, is a [System.Drawing.SizeF](http://docs.go-mono.com/monodoc.ashx?link=T%3aSystem.Drawing.SizeF) in managed code (which is a value type).

The *font* parameter is a [UIFont](http://docs.go-mono.com/monodoc.ashx?link=T%3aMonoTouch.UIKit.UIFont) (and a type (indirectly) derived from [NSObject](http://docs.go-mono.com/monodoc.ashx?link=T%3aMonoTouch.Foundation.NSObject)), and is thus mapped to [System.IntPtr](http://docs.go-mono.com/monodoc.ashx?link=T:System.IntPtr).

The width parameter, a CGFloat, is mapped to [System.Single](http://docs.go-mono.com/monodoc.ashx?link=T%3aSystem.Single).

The lineBreakMode parameter, a UILineBreakMode, has already been bound in MonoTouch as the [UILineBreakMode](http://docs.go-mono.com/monodoc.ashx?link=T%3aMonoTouch.UIKit.UILineBreakMode) enumeration.

Put it all together, and we want an objc_msgSend declaration that matches:

``` csharp
SizeF objc_msgSend(IntPtr target, IntPtr selector, IntPtr font, float width, UILineBreakMode mode);
```

Checking the [MonoTouch.ObjCRuntime.Messaging](http://docs.go-mono.com/monodoc.ashx?link=T%3aMonoTouch.ObjCRuntime.Messaging%2f*) members, we don't see a match for this prototype. Consequently, we will need to declare it ourself:

``` csharp
[DllImport (MonoTouch.Constants.ObjectiveCLibrary)]
static extern SizeF cgsize_objc_msgSend_IntPtr_float_int (
    IntPtr target, IntPtr selector,
    IntPtr font,
    float width,
    UILineBreakMode mode);
```

Once declared, we can invoke it once we have the appropriate parameters:

``` csharp
NSString      target = ...
Selector    selector = new Selector ("sizeWithFont:forWidth:lineBreakMode:");
UIFont          font = ...
float          width = ...
UILineBreakMode mode = ...
 
SizeF size = cgsize_objc_msgSend_IntPtr_float_int(
    target.Handle, selector.Handle,
    font == null ? IntPtr.Zero : font.Handle,
    width,
    mode);
```

Invoking a Selector
-------------------

Invoking a selector has three steps:

1.  Get the selector target.
2.  Get the selector name.
3.  Call objc_msgSend() with the appropriate arguments.

### Selector Targets

A selector target is either an object instance or an Objective-C class. If the target is an instance and came from a bound MonoTouch type, use the [MonoTouch.ObjCRuntime.INativeObject.Handle](http://docs.go-mono.com/monodoc.ashx?link=P%3aMonoTouch.ObjCRuntime.INativeObject.Handle) property.

If the target is a class, use [MonoTouch.ObjCRuntime.Class](http://docs.go-mono.com/monodoc.ashx?link=T%3aMonoTouch.ObjCRuntime.Class) to get a reference to the class instance, then use the [Class.Handle](http://docs.go-mono.com/monodoc.ashx?link=P%3aMonoTouch.ObjCRuntime.Class.Handle) property.

### Selector Names

Selector names are listed within Apple's documentation. For example, the [http://developer.apple.com/iphone/library/documentation/UIKit/Reference/NSString_UIKit_Additions/Reference/Reference.html](http://developer.apple.com/iphone/library/documentation/UIKit/Reference/NSString_UIKit_Additions/Reference/Reference.html) UIKit NSString extension methods] include [sizeWithFont:](http://developer.apple.com/iphone/library/documentation/UIKit/Reference/NSString_UIKit_Additions/Reference/Reference.html#//apple_ref/occ/instm/NSString/sizeWithFont:) and [sizeWithFont:forWidth:lineBreakMode:](http://developer.apple.com/iphone/library/documentation/UIKit/Reference/NSString_UIKit_Additions/Reference/Reference.html#//apple_ref/occ/instm/NSString/sizeWithFont:forWidth:lineBreakMode:). The embedded and trailing colons are important, and are part of the selector name.

Once you have a selector name, you can create a [MonoTouch.ObjCRuntime.Selector](http://docs.go-mono.com/monodoc.ashx?link=T%3aMonoTouch.ObjCRuntime.Selector) instance for it.

### Calling objc_msgSend()

When invoking objc_msgSend(), you must pass the selector target (an instance or class handle), the selector, and any arguments required by the selector. To do so, you use a normal P/Invoke declaration for objc_msgSend(). The instance and selector arguments must be System.IntPtr, and all remaining arguments must match the type the selector expects.

Objective-C types (e.g. NSString, NSDictionary, UIView, anything that has NSObject as an eventual base type) are passed as System.IntPtr.

A set of pre-made objc_msgSend() declarations can be found in [MonoTouch.ObjCRuntime.Messaging](http://docs.go-mono.com/monodoc.ashx?link=T%3aMonoTouch.ObjCRuntime.Messaging%2f*).
