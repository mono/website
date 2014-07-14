---
layout: docpage
navgroup: docs
title: "FAQ: Winforms"
---

#### My forms are sized improperly

This can be caused by AutoScaling. You can try disabling it:

``` bash
export MONO_MWF_SCALING=disable
mono myapp.exe
```

If this fixes it, you can disable it in your application by removing the following line from your form's designer code:

``` bash
this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
```

(This line is added automatically by Visual Studio when it creates a new Form. However, if your forms look bad on Linux because of this, they will also look bad on any Windows computer where the default font has been changed.)

#### My multithreaded application crashes or locks up

Mono's implementation of WinForms does not support Forms or Controls being created on multiple threads. All Forms/Controls must be created on the same thread.

Note this only applies to creation. You can still write multithreaded applications that do work in other threads and modify already created controls using Control.Invoke.

#### How can I keep the terminal window ("dos prompt") from showing when my application runs?

You need to compile you application with -target:winexe, like this:

``` bash
mcs -target:winexe myapp.cs
```

- or -

``` bash
gmcs -target:winexe myapp.cs
```

#### How can I use Visual Styles?

Beginning in Mono 2.2, we have a VisualStyles theme for Windows XP/Vista/7 that uses native Windows rendering.

It is enabled by calling Application.EnableVisualStyles () before calling Application.Run (), just like in .Net.

Visual Styles are not currently supported on Linux/OSX. It is fine to call EnableVisualStyles () on these platforms, it just won't have any effect.

#### How can I make my windows alpha blended? (transparent)

Mono's Winform implementation supports transparency on its windows as long as the underlying windowing system has support for it.

For Unix/X11 users this means that they must have the COMPOSITE extension enabled on their server, and they must be running a compositing manager, like xcompmgr.

The GenToo Linux Wiki has a [good description on how to setup the Xorg server](http://gentoo-wiki.com/TIP_Xorg_X11_and_Transparency) for transparency support.

#### What are you using to implement Windows.Forms?

Windows.Forms is implemented fully in C\# managed code and uses System.Drawing to perform most of its tasks.

For more details see the [Winforms Roadmap]({{ site.github.url }}/docs/gui/winforms/)

A small driver is required for each operating system supported. Currently we have drivers for:

-   X Window System
-   Win32 Window System
-   Mac OSX Window System

#### Will I be able to run my smart clients on systems powered by Mono?

As long as your applications are 100% .NET and do not make use of P/Invoke to call Win32 functions, your smart client applications will run on Mono platforms.

#### Does Winforms run on OSX?

Yes, as of Mono 1.9, Winforms has a native OSX driver that it uses by default.

#### Do you have a comparison chart about the various toolkit offerings?

See [Gui Toolkits]({{ site.github.url }}/docs/gui/gui-toolkits/).

#### GDIPlus Initializer Exception

If you get the following error:

    An exception was thrown by the type initializer for System.Drawing.GDIPlus

This means that you do not have installed libgdiplus in your system, make sure that libgdiplus is installed and that the library can be found.

You might want to use this command line to debug this problem:

``` bash
MONO_LOG_LEVEL="debug" MONO_LOG_MASK="dll" mono winapp.exe
```

#### Missing Method Exception

If you get the following error:

    System.MissingMethodException: Method not found:
    'System.Windows.Forms.TextBoxBase.GetPositionFromCharIndex'.

This means that you are attempting to use a method that has not been implemented yet in Mono (and you compiled with Microsoft's compiler or you would have gotten an error at compile time).

You have three options:

-   Adjust your code to not use this method.
-   Implement the method in Mono.
-   Wait for it to be implemented in Mono.

To see which methods are currently missing from the SVN version of Mono, see the [class status pages]({{ site.github.url }}/docs/about-mono/class-status/).

#### Why not implement System.Windows.Forms on top of Gtk\# or Qt\#?

Compatibility.

Although it is possible to run simple Windows.Forms applications with the Gtk\#-based backend of Windows.Forms, it is very unlikely that the implementation will ever implement everything needed for full compatibility with Windows.Forms. The reason is that Windows.Forms is not a complete toolkit, and to work around this problem some of the underlying Win32 foundation is exposed to the programmer in the form of exposing the Windows message handler (WndProc). Any control can override this method. Also developers often P/Invoke into Win32 to get to functionality that was not wrapped. To achieve full compatibility, we would have to emulate this, and it would take too long. For more details see the [winforms page]({{ site.github.url }}/docs/gui/winforms/).

