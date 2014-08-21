---
title: "MoonlightHostingNotes"
lastmodified: '2007-06-14'
redirect_from:
  - /MoonlightHostingNotes/
---

MoonlightHostingNotes
=====================

These are some notes on Silverlight Hosting APIs and how the plugin works / should work. They are likely incorrect

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#moonlight-plugin">1 Moonlight plugin</a>
<ul>
<li><a href="#how-it-works">1.1 How it works</a>
<ul>
<li><a href="#first-step-create-an-object-element-of-type-applicationag-plugin">1.1.1 First step: create an &lt;object&gt; element of type application/ag-plugin.</a></li>
<li><a href="#second-step-bootstrapping-silverlight-control">1.1.2 Second step: bootstrapping Silverlight control</a></li>
</ul></li>
</ul></li>
<li><a href="#hosting-apis">2 Hosting APIs</a>
<ul>
<li><a href="#scriptableobject">2.1 ScriptableObject</a>
<ul>
<li><a href="#how-to-enable-scriptableobject-in-managed-code">2.1.1 How to enable ScriptableObject in managed code</a></li>
<li><a href="#how-to-use-scriptableobject-in-client-javascript">2.1.2 How to use ScriptableObject in client Javascript</a></li>
<li><a href="#hosted-environment">2.1.3 Hosted environment</a></li>
</ul></li>
<li><a href="#scriptableobject-injection">2.2 ScriptableObject injection</a></li>
<li><a href="#error-handling">2.3 Error handling</a></li>
<li><a href="#misc-notes">2.4 Misc notes</a></li>
</ul></li>
<li><a href="#implementation-status-notes">3 Implementation status notes</a></li>
</ul></td>
</tr>
</tbody>
</table>

Moonlight plugin
----------------

### How it works

#### First step: create an \<object\> element of type application/ag-plugin

This is not mandatory unless you run silverlight apps written in Microsoft ways:

-   The web browser loads HTML, which contains "SilverlightControlHost" element.
-   SilverlightControlHost invokes "createSilverlight()" which is defined in the HTML's bound Javascript.
-   createSilverlight() invokes createObjectEx() which is defined in silverlight.js.
-   createObjectEx() either creates an \<object\> element of type application/ag-plugin, or download/support links.
-   \<object\> element of type application/ag-plugin is recognized by the moonlight plugin.

We could just directly include such an \<object\> element in the HTML instead.

#### Second step: bootstrapping Silverlight control

It is done by moonlight plugin.

-   The plugin is triggered by the \<object\> element.
-   It loads the "source" XAML file. If there isn't, then nothing is warned.
-   It looks for the implementation class from "x:class", which looks like : "SilverlightProject1.Page;assembly=ClientBin/SilverlightProject1.dll"
    -   If there isn't, then Javascript warning is raised.
    -   If the referenced type is not an expected type (only Canvas?), then Javascript warning is raised.
-   Create a GTK+ canvas for Silverlight object (indicated by "source")

Hosting APIs
------------

System.Silverlight.dll and Microsoft.Scripting.Silverlight.dll are involved.

Microsoft.Scripting.Silverlight is smaller:

-   ErrorHandler : static aggregated class of error handling which dispatch managed exceptions to browser.
-   HtmlDocumentMemberInjector
-   HtmlElementMemberInjector
-   IDlrNameScope
-   SilverlightPAL
-   SilverlightScriptHost
-   XamlDlrScriptHost

### ScriptableObject

-   it is nothing to do with JavaScriptSerializer (methods and events are ignored in the serializer).
-   For now simple string and primitive types are supported as method parameters. (See below for details.)

#### How to enable ScriptableObject in managed code

-   Add ScriptableAttribute on the class, and property, method and events.
-   Call WebApplication.Current.RegisterScriptableObject(nameOnJS, instance).

#### How to use ScriptableObject in client Javascript

-   registered scriptable objects are accessible via document.getElementById ("SilverlightControl").Content as its properties.
-   Properties are created as Javascript objects.
-   Events are created as event triggers which expects two arguments (sender, eargs).
-   functions are created as functions as they are.
-   Types are strictly limited: bool, string, char, numeric types except for Decimal are OK. No other types are allowed (object, Guid, DateTime, IDictionary\<string,object\>, any custom types). Only In parameters allowed.

#### Hosted environment

-   Every ScriptableObject seems to check its hosting environment. For example, HtmlPage.Document causes an error (NRE at alpha1) outside hosted environment (for example console app).

### ScriptableObject injection

See also: [http://www.silverlight.net/QuickStarts/Dom/ManagedCodeAccess.aspx](http://www.silverlight.net/QuickStarts/Dom/ManagedCodeAccess.aspx)

List for some objects/methods that need interaction from managed code to DOM:

-   ScriptableObject.GetProperty\<T\>(string name)
    -   T must be derived from ScriptableObject. For example, HtmlPage.Document.GetProperty\<object\>("documentElement")
-   ScriptableObject.SetProperty(string,object)
-   HtmlObject.AttachEvent(string name,EventHandler handler)
-   HtmlObject.DetachEvent(string name,EventHandler handler)
-   generic way to invoke methods (e.g. getElementByTagName(), createElement() etc.)

### Error handling

In agclr, System.Windows.ErrorEventHandler and ErrorEventArgs are used to handle errors at managed side.

Microsoft.Scripting.Silverlight.ErrorHandler is (in a sense) the closest API to the browser. It is tied to ErrorEventArgs in agclr and "default\_error\_handler" in silverlight.js, which

-   expects ParserError and RuntimeError as errorType (ParserErrorEventArgs/RuntimeErrorEventArgs in agclr)
-   expects errorCode, errorType and errorMessage (ErrorEventArgs properties)

### Misc notes

-   WebApplication.Current is created and used to serve RegisterScriptableObject().
    -   NPN\_CreateObject() is likely used.
-   I'm not sure if SilverlightScriptHost and SilverlightPAL are created on silverlight apps. ScriptDomainManager.CurrentManager.PAL is not an instance of SilverlightPAL on silverlight apps.
-   static property HtmlPage.Document accesses to the document. It somehow causes NRE on non-silverlight app.

Implementation status notes
---------------------------

Already written as DllImport (note that they are not in moon/plugin yet):

-   WebApplication
    -   InvokeMethodInternal(IntPtr xpp, IntPtr obj, string name,object[] args)
    -   GetPropertyInternal(IntPtr xpp,IntPtr obj, string name)
    -   SetPropertyInternal(IntPtr xpp,IntPtr obj, string name, object value); They are commonized accessors and used by several classes such as HtmlElement.AppendChild().
-   BrowserInformation
    -   LoadBrowserInformation(BrowserInformation)
-   BrowserRuntimeSettings
    -   LoadBrowserRuntimeSettings(BrowserRuntimeSettings)
-   HtmlObject
    -   AttachEvent(IntPtr xpp, IntPtr obj, string name, EventHandler h)
    -   AttachEvent(IntPtr xpp, IntPtr obj, string name, EventHandler\<HtmlEventArgs\> h)
    -   DetachEvent(IntPtr xpp, IntPtr obj, string name, EventHandler h)
    -   DetachEvent(IntPtr xpp, IntPtr obj, string name, EventHandler\<HtmlEventArgs\> h)
-   HtmlPage
    -   Navigate (IntPtr npp, string uri)
    -   Navigate (IntPtr npp, string uri, string target, string features) (returns a handle)
    -   NavigateToBookmark (IntPtr xpp, string bookmark)
    -   Submit (IntPtr xpp, string formId)

Just rough ideas:

-   WebApplication.Current is likely hold a pointer to NPP instance, a pointer to PluginInstance, and so on. Use AppDomain.GetData() to return pointers here.
-   WebApplication.RegisterScriptableObject() has to create a NPObject. Also, access to the members must be reflected to the managed object (and vice versa).
-   WebApplication.StartupArguments. Not sure what should be set here.
-   HtmlTimer. Probably it generates call to setTimeout() and calls Javascript eval(), depending on Enabled and Interval. Not sure where it is used.
-   HtmlPage properties:
    -   Cookies, string
    -   CurrentBookmark, string
    -   Document, IntPtr to NPObject?
    -   DocumentUri, string
    -   QueryString, string or dictionary
    -   Window, IntPtr to PluginInstance-\>window
-   HtmlElement.SetStyleAttribute() and RemoveStyleAttribute() ; not sure how it is done.


