---
title: "MonoMac/Documentation/Events"
lastmodified: '2011-05-11'
permalink: /archived/MonoMac/Documentation/Events/
redirect_from:
  - /MonoMac/Documentation/Events/
---

MonoMac/Documentation/Events
============================

Events
======

If you want to intercept events from UIControl, you have a range of options: from using the C\# lambdas and delegate functions to using the low-level Objective-C APIs.

The following shows how you would capture the TouchDown event on a button, depending on how much control you need:

C\# Style
---------

Using the delegate syntax:

``` csharp
NSButton button = MakeTheButton ();
button.Activated += delegate {
    Console.WriteLine ("Touched");
};
```

If you like lambdas instead:

``` csharp
button.Activated += (o, e) => {
   Console.WriteLine ("Touched");
};
```

If you want to have multiple buttons use the same handler to share the same code:

``` csharp
void handler (object sender, EventArgs args)
{
   if (sender == button1)
      Console.WriteLine ("button1");
   else
      Console.WriteLine ("some other button");
}
 
button1.Activated += handler;
button2.Activated += handler;
```

