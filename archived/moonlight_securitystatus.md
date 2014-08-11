---
title: "Moonlight/SecurityStatus"
lastmodified: '2010-02-18'
redirect_from:
  - /Moonlight/SecurityStatus/
---

Moonlight/SecurityStatus
========================

This page list the security related **features** of Moonlight. Another [page](/SecurityValidation "SecurityValidation") list the **validations** needed to ensure **both** the [Moonlight](/Moonlight "Moonlight") and Mono security features are working.

**Note:** Simply search for **TODO** or **partial** on this page to see the current restrictions.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#coreclr-security-model">1 CoreCLR Security Model</a></li>
<li><a href="#plugin-sandbox">2 Plugin Sandbox</a>
<ul>
<li><a href="#allowhtmlpopupwindow">2.1 AllowHtmlPopupWindow</a></li>
<li><a href="#enablehtmlaccess">2.2 EnableHtmlAccess</a></li>
<li><a href="#externalcallersfromcrossdomain">2.3 ExternalCallersFromCrossDomain</a></li>
<li><a href="#out-of-browser">2.4 Out Of Browser</a></li>
<li><a href="#elevated-trust">2.5 Elevated Trust</a></li>
<li><a href="#additional-documentation">2.6 Additional documentation</a></li>
</ul></li>
<li><a href="#networking">3 Networking</a>
<ul>
<li><a href="#uri">3.1 Uri</a>
<ul>
<li><a href="#deep-linking">3.1.1 Deep Linking</a></li>
</ul></li>
<li><a href="#web">3.2 Web</a>
<ul>
<li><a href="#managed">3.2.1 Managed</a></li>
<li><a href="#javascript">3.2.2 JavaScript</a></li>
<li><a href="#client-http-stack">3.2.3 Client Http Stack</a></li>
<li><a href="#http-stack-registration">3.2.4 Http Stack Registration</a></li>
<li><a href="#others">3.2.5 Others</a></li>
<li><a href="#security-zones">3.2.6 Security Zones</a></li>
</ul></li>
<li><a href="#sockets">3.3 Sockets</a>
<ul>
<li><a href="#udp-multicast">3.3.1 UDP Multicast</a></li>
<li><a href="#tools">3.3.2 Tools</a></li>
</ul></li>
<li><a href="#xmlxapresolver">3.4 XmlXapResolver</a></li>
</ul></li>
<li><a href="#local-io">4 Local I/O</a>
<ul>
<li><a href="#isolated-storage">4.1 Isolated Storage</a>
<ul>
<li><a href="#quota">4.1.1 Quota</a></li>
<li><a href="#classes">4.1.2 Classes</a></li>
<li><a href="#additional-documentation_2">4.1.3 Additional documentation</a></li>
</ul></li>
<li><a href="#openfiledialog">4.2 OpenFileDialog</a></li>
<li><a href="#savefiledialog">4.3 SaveFileDialog</a></li>
<li><a href="#local-messaging">4.4 Local Messaging</a></li>
</ul></li>
<li><a href="#digital-rights-management">5 Digital Rights Management</a></li>
<li><a href="#others_2">6 Others</a>
<ul>
<li><a href="#regular-expressions">6.1 Regular Expressions</a></li>
<li><a href="#user-initiated-events">6.2 User Initiated Events</a></li>
<li><a href="#assembly-loading">6.3 Assembly Loading</a></li>
<li><a href="#shader-effects">6.4 Shader Effects</a></li>
<li><a href="#surface-reduction">6.5 Surface reduction</a>
<ul>
<li><a href="#mono">6.5.1 Mono</a></li>
<li><a href="#base-class-library-bcl">6.5.2 Base Class Library (BCL)</a></li>
</ul></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

CoreCLR Security Model
======================

-   mono
    -   most logic resides inside [security-core-clr.c](http://anonsvn.mono-project.com/viewvc/trunk/mono/mono/metadata/security-core-clr.c?view=markup)
    -   tests are located in [coreclr-security.cs](http://anonsvn.mono-project.com/viewvc/trunk/mono/mono/tests/coreclr-security.cs?view=markup)
    -   status: **complete**
-   moonlight
    -   most logic resides inside [security.c](http://anonsvn.mono-project.com/viewvc/trunk/moon/src/security.c?view=markup), including:
        -   mono initialization of coreclr and the verifier
        -   callback to determine which assemblies are "platform code"
    -   status: **complete**
-   unit tests
    -   location: [/moon/test/2.0/moon-unit/security/\*.cs](http://anonsvn.mono-project.com/viewvc/trunk/moon/test/2.0/moon-unit/security/)
    -   status: **more needed**, in particular for SRE
-   attributes (class libraries)
    -   Added during the *tuning* process
    -   Based on the output of tools located inside [moon/class/tuning/SecurityAttributes/](http://anonsvn.mono-project.com/viewvc/trunk/moon/class/tuning/SecurityAttributes/)
    -   status: **active**
-   Documentation
    -   [CoreCLR security model](/Moonlight2CoreCLR "Moonlight2CoreCLR")
    -   [Moonlight Implementation Details](/MoonlightSecurity "MoonlightSecurity")

Plugin Sandbox
==============

AllowHtmlPopupWindow
--------------------

-   [Plugin property (setter)](http://msdn.microsoft.com/en-us/library/cc974117(VS.95).aspx)
-   [Managed property (getter)](http://msdn.microsoft.com/en-us/library/system.windows.browser.htmlpage.ispopupwindowallowed(VS.95).aspx)
-   status: **complete** (ML 2.1+ and ML 3.0 preview 2+)

EnableHtmlAccess
----------------

Control access from Silverlight managed code to JavaScript and the DOM.

-   Default value is:
    -   **True** for *same-domain* applications; and
    -   **False** for *cross-domain* applications.
-   [Plugin property (setter)](http://msdn.microsoft.com/en-us/library/cc838264(VS.95).aspx)
-   [Managed property (getter)](http://msdn.microsoft.com/en-us/library/system.windows.interop.settings.enablehtmlaccess(VS.95).aspx)
-   status: **complete**
    -   works for same-domain applications
    -   **undocumented** HTML and XAP served on different ports is **not** cross (or even same) domain. It does not show anything on SL2 (and makes a very bad test case)
-   test application available [here](http://anonsvn.mono-project.com/viewvc/trunk/moon/test/2.0/enableHtmlAccess/)

ExternalCallersFromCrossDomain
------------------------------

Control access from JavaScript and the DOM into Silverlight managed code.

-   Documentation
    -   [ExternalCallersFromCrossDomain](http://msdn.microsoft.com/en-us/library/system.windows.deployment.externalcallersfromcrossdomain(VS.95).aspx)
-   status: **complete**

Out Of Browser
--------------

Silverlight 3 feature

-   status: **TODO**

Elevated Trust
--------------

Silverlight 4 feature

-   status: **TODO**

Additional documentation
------------------------

-   [Security Settings in HTML Bridge (MSDN)](http://msdn.microsoft.com/en-us/library/cc645023(VS.95).aspx)

Networking
==========

-   Cross-domain access is possible. Rules vary by content type and how they accessed.
-   Documentation
    -   [HTTP Communication and Security with Silverlight](http://msdn.microsoft.com/en-us/library/cc838250(VS.95).aspx)
    -   [Network Security Access Restrictions in Silverlight 2](http://msdn.microsoft.com/en-us/library/cc645032(VS.95).aspx)

Uri
---

Silverlight [System.Uri](http://msdn.microsoft.com/en-us/library/system.uri(VS.95).aspx) is not 100% identical to the one provided by the desktop framework. This affects a number of classes that are using URI.

-   [Unit tests](http://anonsvn.mono-project.com/viewvc/trunk/moon/test/2.0/moon-unit/System/UriTest.cs?view=markup)
-   [Silverlight 2: Demystifying URI references for app resources](http://nerddawg.blogspot.com/2008/03/silverlight-2-demystifying-uri.html)

### Deep Linking

Silverlight 3 feature

-   Status: **TODO**

Web
---

There are multiple ways to retrieve data from the web.

### Managed

[WebClient](http://msdn.microsoft.com/en-us/library/system.net.webclient(VS.95).aspx) Class

-   Relative URI are combined with the [BaseAddress](http://msdn.microsoft.com/en-us/library/system.net.webclient.baseaddress(VS.95).aspx);
-   [BaseAddress](http://msdn.microsoft.com/en-us/library/system.net.webclient.baseaddress(VS.95).aspx) defaults to the application XAP absolute URI;

[WebRequest](http://msdn.microsoft.com/en-us/library/system.net.webrequest%28VS.95%29.aspx) Class

-   Relative URI are not allowed;
-   Supports **http** and **https** using the web browser. This cannot be overridden by registering the http[s] prefixes;
-   [RegisterPrefix](http://msdn.microsoft.com/en-us/library/system.net.webrequest.registerprefix(VS.95).aspx) works, so custom protocols are, within SL limits, possible;
-   Cookies are disabled by default

Cross-domain access is possible using policy files. Either a *clientaccesspolicy.xml* (Silverlight specific syntax) or a *crossdomain.xml* (Flash subset syntax) can define the rules.

Status: **complete**

### JavaScript

-   [Downloader](http://msdn.microsoft.com/en-us/library/bb979676(VS.95).aspx) (javascript)
-   status: partial, works like 1.0 (no xdomain support)

### Client Http Stack

-   Note: Silverlight 3 feature
-   Extended methods (e.g. HEAD, not just GET and POST)
-   Extended status codes (not just 200 and 404)
-   Cookie support
-   Status: **partial** (mostly an extention to the browser stack at the moment)

### Http Stack Registration

Since Silverlight 3 support two similar HTTP stack there are some ways to select which one you want to use in your application. The default stack is the browser stack.

-   All requests per protocol, e.g. `WebRequest.RegisterPrefix("http://")`. This can only be done/registred once per application execution.
-   For a specific domain, e.g. `WebRequest.RegisterPrefix ("http://www.domain.com")`. This can only be done/registred once per application execution.
-   For a single object, e.g. `WebRequestCreator.Create(uri)`
-   Status: **partial**

Ref: [http://msdn.microsoft.com/en-us/library/dd920295%28VS.95%29.aspx](http://msdn.microsoft.com/en-us/library/dd920295%28VS.95%29.aspx)

### Others

There are different rules for downloading special content, by type:

-   Image and MediaElement classes
-   XAML source files
-   Font files
-   Stream media

Documentation

-   [URL Access Restrictions in Silverlight 2](http://msdn.microsoft.com/en-us/library/cc189008(VS.95).aspx)

### Security Zones

**Cross-zone URL** are an *Internet Explorer* concept and is not supported by Silverlight 2 outside Windows (e.g. [Mac OS X](http://msdn.microsoft.com/en-us/library/cc189008(VS.95).aspx)). This feature is **NOT** supported by Moonlight.

Sockets
-------

-   The plugin is limited to connect on **TCP** ports in the 4502-4534 range. The cross-domain policy can further restrict the ports that can be used;
-   A cross-domain policy is **always** required, even when connecting back to the *site of origin* (unlike web requests);
-   The plugin will query the host (on port **943**) to get its policies and decide if a connect attempt can be made;
-   Documentation
    -   [Socket class](http://msdn.microsoft.com/en-us/library/system.net.sockets.socket(VS.95).aspx) (managed)
    -   [MSDN: Working with Sockets](http://msdn.microsoft.com/en-us/library/cc296248(VS.95).aspx)
    -   [Why does Silverlight have a restricted port range for Sockets?](http://blogs.msdn.com/ncl/archive/2009/06/23/why-does-silverlight-have-a-restricted-port-range-for-sockets.aspx)
-   Status: **complete**

### UDP Multicast

Silverlight 4 (beta) feature

-   Status: **TODO**

### Tools

**sockpol**: A socket policy server [source](http://anonsvn.mono-project.com/viewvc/trunk/moon/tools/sockpol/sockpol.cs?view=markup) that listen to port **943** and serves socket policies. You can use it *as-is* or merge it into your server-based application when developing the server part of a Moonlight application using sockets.

XmlXapResolver
--------------

-   Status: **complete**
-   Documentation: [MSDN](http://msdn.microsoft.com/en-us/library/system.xml.xmlxapresolver(VS.95).aspx)
-   This is the default resolver used on
    -   [XDocument](http://msdn.microsoft.com/en-us/library/system.xml.linq.xdocument(VS.95).aspx);
    -   [XmlReader](http://msdn.microsoft.com/en-us/library/system.xml.xmlreader(VS.95).aspx); and
    -   [XmlReaderSettings](http://msdn.microsoft.com/en-us/library/system.xml.xmlreadersettings(VS.95).aspx)

Local I/O
=========

Silverlight provides limited access to the local files.

Isolated Storage
----------------

In the *classic* framework the isolation was based on the appdomain, assembly, application and evidences. In Silverlight it is based on the site and application URL. Similar in concept but the source code is not.

-   status: **partial**
-   TODO
    -   UI to manage storage (from right-click menu), including a global switch to turn IsolatedStorage on or off
    -   SL3 behavior has changed (for performance reason, looking for a link...)

### Quota

-   The default storage quota is **1 MB** and is shared for all applications on the same site.
    -   Removing (deleting) a storage from the UI reset the quota to 1MB;
    -   Calling [IsolatedStorageFile.Remove](http://msdn.microsoft.com/en-us/library/7ay840d1(VS.95).aspx) from code does not change (i.e. reduce the quota).
-   The default storage quota for *out-of-browser* application is raised to **25 MB** (Silverlight 3) and does not shrink back (if the application is removed from the desktop)

### Classes

-   IsolatedStorageException (mscorlib) [source](http://anonsvn.mono-project.com/viewvc/trunk/mcs/class/corlib/System.IO.IsolatedStorage/IsolatedStorageException.cs?view=markup), [MSDN](http://msdn.microsoft.com/en-us/library/system.io.isolatedstorage.isolatedstorageexception(VS.95).aspx)
-   IsolatedStorageFile (mscorlib) [source](http://anonsvn.mono-project.com/viewvc/trunk/mcs/class/corlib/System.IO.IsolatedStorage/MoonIsolatedStorageFile.cs?view=markup), [MSDN](http://msdn.microsoft.com/en-us/library/system.io.isolatedstorage.isolatedstoragefile(VS.95).aspx)
-   IsolatedStorageFileStream (mscorlib) [source](http://anonsvn.mono-project.com/viewvc/trunk/mcs/class/corlib/System.IO.IsolatedStorage/MoonIsolatedStorageFileStream.cs?view=markup), [MSDN](http://msdn.microsoft.com/en-us/library/system.io.isolatedstorage.isolatedstoragefilestream(VS.95).aspx)
-   IsolatedStorageSettings (System.Windows) [source](http://anonsvn.mono-project.com/viewvc/trunk/moon/class/System.Windows/System.IO.IsolatedStorage/IsolatedStorageSettings.cs?view=markup), [MSDN](http://msdn.microsoft.com/en-us/library/system.io.isolatedstorage.isolatedstoragesettings(VS.95).aspx)

### Additional documentation

-   [CLR Inside Out: Isolated Storage In Silverlight 2](http://msdn.microsoft.com/en-us/magazine/dd458794.aspx)
-   [Silverlight 3: Out of the Browser](http://blogs.msdn.com/jonbox/archive/2009/03/22/silverlight-3-out-of-the-browser.aspx), Mike Harsh @ MIX09 (beta)

OpenFileDialog
--------------

Silverlight 2 provides a **Open File** dialog which let the user select any file on his computer. The application can get access to its name (not the full path, just the filename) and a read-only Stream to it.

-   Source: [OpenFileDialog.cs](http://anonsvn.mono-project.com/viewvc/trunk/moon/class/System.Windows/System.Windows.Controls/OpenFileDialog.cs?view=markup)
-   Documentation: [MSDN](http://msdn.microsoft.com/en-us/library/system.windows.controls.openfiledialog(VS.95).aspx)
-   Status: **complete**
-   Notes
    -   Unit tests are mostly **ignored** due to required user interaction

SaveFileDialog
--------------

Silverlight 3 also provides a **Save File** dialog that works similarly to the OpenFileDialog (present in Silverlight 2).

-   Source: [SaveFileDialog.cs](http://anonsvn.mono-project.com/viewvc/trunk/moon/class/System.Windows/System.Windows.Controls/OpenFileDialog.cs?view=markup)
-   Documentation: [MSDN](http://msdn.microsoft.com/en-us/library/system.windows.controls.savefiledialog(VS.96).aspx)
-   Status: **complete**
-   Notes
    -   Unlike OpenFileDialog it can only be called from a user action (e.g. mouse click) otherwise a `SecurityException` is thrown.
    -   Unit tests are mostly **ignored** due to required user interaction
    -   The dialog warn if we're about to replace an existing file;
    -   It is possible to create a new directory from this dialog;

Local Messaging
---------------

Silverlight 3 feature

-   Status: **TODO**

Digital Rights Management
=========================

Silverlight 2 supports Microsoft *PlayReady* Digital Rights Management (DRM). This is the DRM solution being used by Netflix's “Watch Instantly” service for streaming movies to PC (Windows-only) and Mac computers.

Status: **unsupported**

More information:

-   [MSDN](http://msdn.microsoft.com/en-us/library/cc838192(VS.95).aspx)
-   [Netflix FAQ](http://www.netflix.com/HowItWorks#faq8)

Others
======

Regular Expressions
-------------------

-   Compiled regex are **not** supported by Silverlight
-   Status: **complete**

User Initiated Events
---------------------

In Silverlight some actions can only occurs if they are initiated directly by the user, e.g. a mouse click or a keyboard event. Otherwise the expected action will not occur, e.g.

-   setting [Content.IsFullscreen](http://msdn.microsoft.com/en-us/library/system.windows.interop.content.isfullscreen(vs.95).aspx) to **true** will be ignored;
-   calling [IsolatedFileStorage.IncreaseQuotaTo](http://msdn.microsoft.com/en-us/library/system.io.isolatedstorage.isolatedstoragefile.increasequotato(VS.95).aspx) will return **false** (just like it would if the user denied the request);
-   calling [SaveFileDialog.ShowDialog](http://msdn.microsoft.com/en-us/library/system.windows.controls.savefiledialog.showdialog(VS.96).aspx) will throw a SecurityException (Silverlight 3)
-   calling [HtmlPage.PopupWindow](http://msdn.microsoft.com/en-us/library/system.windows.browser.htmlpage.popupwindow%28VS.95%29.aspx) will return **null** unless it was done by a user-initiated event *and* it can only be called once per user event.

Documentation

-   [User-initiated operations in Silverlight](http://nerddawg.blogspot.com/2009/05/user-initiated-operations-in.html)

Assembly Loading
----------------

-   Remove the Global Assembly Cache (GAC) from the assembly loading strategy
    -   only assemblies from the "platform directory" or the XAP file should be loaded
    -   status: **complete**
-   Special handling of `[InternalsVisibleTo]` wrt platform code
    -   make sure we are not opening our internals to assemblies in the XAP file masquerading (name and public key token) as platform code
    -   see [SecurityValidation](/SecurityValidation "SecurityValidation") for more details
    -   status: **complete**

Shader Effects
--------------

Silverlight 3 feature

-   -   status: **TODO**

Surface reduction
-----------------

Why ? beside the standard *less code, less vulnerabilities* it is also easier and faster, in general, to remove features than to audit them (now and in the future). As a bonus [Moonlight](/Moonlight "Moonlight") gets a smaller download size and the Mono runtime get usable in smaller embedded systems.

### Mono

-   Remove unneeded features (e.g. com support)
    -   status: **not done** for Moonlight 2

### Base Class Library (BCL)

-   Reduce the number of (unneeded) `[SecuritySafeCritical]` code
    -   Goal: Reduce surface and the required security audit time
    -   How: Look at the [lists](http://anonsvn.mono-project.com/viewvc/trunk/moon/class/tuning/SecurityAttributes/automatic/) of *automatic* entries added to Moonlight assemblies (\*.auto.ssc files) and see what can be removed (e.g. drop or re-write small chunk of code)
    -   status: **DONE**

-   Remove unneeded code (i.e. help the linker)
    -   Goal: Reduce surface and the download size of Moonlight
    -   How: Help the linker, with a few well placed `#if NET_2_1`, drop some code that Moonlight does not require
    -   status: **DONE** (more is possible/likely in future Moonlight releases)


