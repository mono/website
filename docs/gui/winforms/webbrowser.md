---
title: WebBrowser
redirect_from:
  - /WebBrowser/
---

Motivation: WebBrowser control for MWF
======================================

One of the most widely use and arguably the most popular control in use in System.Windows.Forms, is the InternetExplorer ActiveX WebBrowser control. Its support in Managed.Windows.Forms is becoming rapidly recessionary to facilitate the bridging of many apps from SWF to MWF.

The natural cross platform alternative to Internet Explorer is the Mozilla project's Gecko engine. Thanks to the efforts of the Mozilla ActiveX control team, many of the features in Internet Explorer now have direct equivalents in the Mozilla embedding API. However the Mozilla ActiveX control is only meant to work on Windows because of the ActiveX dependencies.

The .NET Winforms WebBrowser control exposes an API that allows an application to embed and control a browser rendering engine. It does this on .NET by wrapping the COM interfaces exposed by IE and exposing a subset of the features that those COM interfaces provide, enough to load and manipulate web pages.

The Mono implementation
=======================

[![Webbrowser architecture.png](/archived/images/e/e2/Webbrowser_architecture.png)](/archived/images/e/e2/Webbrowser_architecture.png)

This is an overview of all the components that support both the Gecko and WebKit backends. Each square with a thin border represents a different library.

On top is the System.Windows.Forms class library. It has litle logic in itself for the WebBrowser control, and just uses the interfaces exposed by the next library, Mono.WebBrowser.

Mono.WebBrowser is also a class library, but a private one (i.e., it's in the gac but can't be "discovered" by pkg-config tools since it doesn't ship a .pc file. It can obviously be linked to directly). Winforms depends on it directly, and it exposes interfaces that hide browser engine implementation details. The interfaces are more in line with the DOM spec, but are not as complete, mainly because the .NET Winforms WebBrowser control is not feature-complete in itself.

Internally, the Mono.WebBrowser library has a Mono.Mozilla namespace, which implements the public Mono.WebBrowser interfaces. This is the managed wrapper that manipulates objects that come directly from Gecko. It also uses a separate c/c++ glue library named gluezilla, which initializes and provides helper functions and COM pointers for the managed implementation. Gluezilla links directly to the gecko libraries.

On the WebKit side, the Mono.WebKit namespace also implements Mono.WebBrowser interfaces, but this is done in a separate library that lives in a module called mono-webbrowser. The Mono.WebKit namespace provides a Gtk main loop so that WebKit can run in a Winforms application (which has no gtk main loop, obviously), and uses the webkit-sharp library.

Webkit-sharp is a managed webkit binding, automatically generated from the WebKit headers and sources.

MWF
---

Winforms has five main classes dealing with browser embedding: WebBrowser, HtmlWindow, HtmlDocument, HtmlElement and HtmlHistory. WebBrowser represents the Control, and exposes properties that allow an app to load pages and retrieve instances of the Html\* classes, to access and manipulate page contents.

In Mono's implementation, only the WebBrowser class has any significant logic in it, and even then it just hooks up to the interfaces of the class library that really does all the work: Mono.WebBrowser

Mono.WebBrowser
---------------

The Mono.WebBrowser class library is the essential part of Mono's WebBrowser control implementation. To allow for the possibility of using other browser engines besides Gecko, Mono.WebBrowser exposes a set of public interfaces that the MWF classes use, hiding away the specifics of the browser engine in internal classes. It's a separate library that MWF depends on, to allow for reuse outside the MWF world.

Mono.WebBrowser.Manager is the entry point to this library, initializing one of the supported browser engine backends and associating it to the window handle of the control that is going to be embedding the browser.

Mono.WebBrowser - Gecko support via gluezilla
---------------------------------------------

Gluezilla is a c/c++ glue helper library that does the main job of initializing gecko. The gecko embedding libraries (known as xulrunner or libxul) are not available in LD\_LIBRARY\_PATH, and have to be linked in via a c library. The xulrunner initialization functions track down the location of the embedding libraries and load them dynamically at runtime, making it necessary to have a c library that can link and initialize the engine before the C\# wrappers can take over.

After the initial embedding work was done and we had a embedded browser engine working on MWF, it was time to decide how to expose all the DOM features that MWF supports. Althought the classes that MWF has for DOM support (HtmlElement, HtmlDocument, etc) are small, they allow for a broad use of DOM methods (like getProperty, attachEvent, etc). Since xulrunner is all c++ and has, on a first count, some 85 classes just for basic DOM support, wrapping all of these in C calls that C\# could pinvoke would be complicated.

Fortunately, one feature of gecko is that all classes that it exposes are XPCOM - basically COM classes. At the time when we had to wrap these DOM classes, the COM support on Mono was just about complete, so we decided to try and expose the XPCOM classes as COM classes and wrap the engine this way - with very good results. The gluezilla library was reduced to a set of functions to convert strings (because gecko exposes strings as classes) and to retrieve COM pointers that can be marshalled automatically to C\# COM interfaces. A tool called xpidl2cs was created to parse the IDL files that xulrunner distributes and create C\# COM interfaces from these definitions. With one call to gluezilla to retrieve the top object that represents a browser window and marshalling that to a C\# interface, everything else can be done in C\# with COM calls.

Currently supported browser engine backends
-------------------------------------------

Mono.WebBrowser main engine backend at the moment is Gecko, in the Mono.Mozilla namespace. WebKit support has been added, with most features working and experimental DOM support, in the Mono.WebKit namespace. Webkit support is done via the webkit-sharp and mono-webbrowser libraries. Webkit-sharp is a Webkit-Gtk binding, and mono-webbrowser is the wrapper that uses webkit-sharp and exposes Mono.WebBrowser interfaces. Unlike the gecko wrapper, which is included inside Mono.WebBrowser, the webkit wrapper is on a separate library because it depends on gtk-sharp, and so has to be built after the main class libraries.

Limitations
===========

Not everything that the native IE interfaces support is wrapped on Winforms, which is why every class on the API allows for the app to retrieve a native pointer to the underlying COM object, so that win32 developers can use it directly to access features otherwise unavailable in the Winforms API. The Mono implementation doesn't expose these native interfaces, mainly because it would require mimicking the entire IE feature set, which includes many things that are not supported by other browser engines.

 The Mono Webbrowser currently lacks support for window.external, the bridge that allows Javascript code embedded in the browser to communicate with the managed world using the ObjectForScripting.

Architecture of the IE component stack
======================================

### SHDocVw.dll

This COM dll is the core of the Internet Explorer automation api. It exposes the e embeddable activeX control, as well as all the automation of externally launch instances of IE.

### mshtml.dll

This COM dll is the core of the Microsoft HTML DOM api.

### BrowseUI.dll

This COM dll is the core of the Windowing Toolkit of IE. This feature is not necessary for what we are trying to striving for, however it is referenced in my documents on the subject.

References
----------

Architecture:

[http://msdn.microsoft.com/library/default.asp?url=/workshop/browser/overview/Overview.asp](http://msdn.microsoft.com/library/default.asp?url=/workshop/browser/overview/Overview.asp)

[http://msdn.microsoft.com/library/default.asp?url=/library/en-us/com/html/ae1592b6-2afd-4379-a18e-d46b226bc9e2.asp](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/com/html/ae1592b6-2afd-4379-a18e-d46b226bc9e2.asp)

[http://msdn2.microsoft.com/en-us/library/system.windows.forms.webbrowser(VS.80).aspx](http://msdn2.microsoft.com/en-us/library/system.windows.forms.webbrowser(VS.80).aspx)

[http://msdn2.microsoft.com/en-us/library/system.windows.forms.webbrowserbase(VS.80).aspx](http://msdn2.microsoft.com/en-us/library/system.windows.forms.webbrowserbase(VS.80).aspx)

Implementation Overview
=======================

The WebBrowser implimentation is made up of several parts:

-   libmozembed - The native wrapper that wraps Mozilla. Built to satisfy the requirements of the MWF control, it remains versatile enough to be reusable for other embedding projects that require a simple and static C based interface.
    -   Source: [http://anonsvn.mono-project.com/viewvc/trunk/mozembed/src/](http://anonsvn.mono-project.com/viewvc/trunk/mozembed/src/)

-   **Mono.Mozilla.dll** - This managed code wrapper is the core interface between libmozembed and managed code. It's abstract to all implementations and windowing toolkits.

-   **Mono.Mozilla.WebBrowser.dll** - A System.Windows.Forms/Managed.Windows.Forms control that embeds Mozilla and exposes the root features of libmozembed

-   **Mono.Mozilla.Widget.dll** - A GTK\# Widget that embeds Mozilla and exposes the root features of libmozembed

-   **Interop.SHDocVw.dll** - the managed implementation of the COM wrapper generated by tlb2asm

-   **AxInterop.SHDocVw.dll** - the managed implementation of the ActiveX System.Windows.Forms control generated by tlb2asm

-   **Interop.mshtml.dll** - the managed implementation of the COM wrapper generated by tlb2asm

-   **System.Windows.Forms.WebBrowser\*** - part of System.Windows.Forms 2.0, provides a static wrapper, almost identical to the WebBrowser exposed by SHDocVw in 1.1.
    -   Reference: [http://msdn2.microsoft.com/en-us/library/system.windows.forms.webbrowser(VS.80).aspx](http://msdn2.microsoft.com/en-us/library/system.windows.forms.webbrowser(VS.80).aspx)

-   **Microsoft.IE** - Assembly provided in 2.0, similar to other interfaces provided by SHDocVw
    -   Reference: [http://msdn2.microsoft.com/en-us/library/microsoft.ie(VS.80).aspx](http://msdn2.microsoft.com/en-us/library/microsoft.ie(VS.80).aspx)


