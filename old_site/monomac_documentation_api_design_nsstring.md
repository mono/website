---
layout: obsolete
title: "MonoMac/Documentation/API Design/NSString"
lastmodified: '2011-05-10'
permalink: /old_site/MonoMac/Documentation/API_Design/NSString/
redirect_from:
  - /MonoMac/Documentation/API_Design/NSString/
---

MonoMac/Documentation/API Design/NSString
=========================================

NSString
========

The design of MonoMac calls for the use of the native .NET string type for string manipulation in C\# and other .NET programming languages and to expose *string* as the data type exposed by the API instead of the [NSString](http://docs.go-mono.com/MonoMac.Foundation.NSString) data type.

This means that developers should not have to keep strings that are intended to be used for calling into the MonoMac API in special types, they can keep using Mono's *System.String* for all of the operations, and whenever an API in MonoMac requires a string, our API binding takes care of marshalling the information.

For example, the Objective-C *PlaceholderString* property on a NSTextFieldCell is of type NSString, and is declared like this:\</p\>

    - (NSString *)placeholderString

This is [exposed in MonoMac as](http://docs.go-mono.com/MonoMac.AppKit.NSTextFieldCell.PlaceholderString):

``` csharp
class NSTextFieldCell {
    public string PlacceholderString {get; set;}
}
```

Behind the scenes, the implementation of this property marshals the C\# string into an NSString and calls the objc\_msgSend method in the same way that Objective-C would.

Exceptions to the Rule
----------------------

In MonoMac we have made an exception to this rule. The exception to when we expose strings and when we expose NSStrings is done when the NSString method could be doing a pointer comparison instead of a content comparison.

This could happen when an Objective-C APIs uses a public NSString constant as a token that represents some action instead of comparing the actual contents of the string.

In those cases we have exposed NSString APIs and there are a minority of APIs that have this. You will also notice that we tend to expose NSString properties in some classes. We expose those NSString properties for items like notifications. Those are properties usually look like this:

``` csharp
class Foo {
     public NSString FooNotification { get; }
}
```

Notifications are keys that are used for the NSNotification class, when you want to register for a particular event being broadcast by the runtime.

For keys, you will usually see them like this:

``` csharp
class Foo {
     public NSString FooBarKey { get; }
}
```

