---
layout: obsolete
title: "Release Notes Mono 2.4.2.2"
lastmodified: '2009-07-16'
permalink: /old_site/Release_Notes_Mono_2.4.2.2/
redirect_from:
  - /Release_Notes_Mono_2.4.2.2/
---

Release Notes Mono 2.4.2.2
==========================

Mono 2.4.2.2 is a portable and open source implementation of the .NET framework for Unix, Windows, MacOS and other operating systems.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#major-highlights">1 Major Highlights</a></li>
<li><a href="#changes-in-mono-2422">2 Changes in Mono 2.4.2.2</a></li>
<li><a href="#bugs-fixed-since-mono-24">3 Bugs fixed since Mono 2.4</a></li>
<li><a href="#installing-mono-2422">4 Installing Mono 2.4.2.2</a></li>
</ul></td>
</tr>
</tbody>
</table>

Major Highlights
================

Mono 2.4.2.2 is a [security fix]({{site.github.url}}/Vulnerabilities#XML_signature_HMAC_truncation_authentication_bypass) release for Mono 2.4, which is the foundation for Novell's own long-term support Mono-based product.

In addition to the fixes, this release includes the following major changes from 2.4.2:

-   We now ship Microsoft's [ASP.NET MVC](http://www.asp.net/mvc) stack and ASP.NET MVC applications can run with Mono.

Due to an oversight on Mono 2.4.2, the ASP.NET MVC code was not actually distributed. This oversight has been corrected.

Changes in Mono 2.4.2.2
=======================

XSP now has Silverlight mime types registered.

Updated the browser database.

The C\# Shell (csharp) will now accept C\# scripts specified on the command line, like:

``` bash
$ csharp demo.cs
```

A major bug was fixed for multi-threaded applications using XPath, if you are using XPath in a multithreaded application, we strongly recommend that you upgrade to this version.

Bugs fixed since Mono 2.4
=========================

Between Mono 2.4 and Mono 2.4.2, more than 140 bugs were fixed, this is a partial list (since not all bugs had tracking numbers):

-   [315816](https://bugzilla.novell.com/show_bug.cgi?id=315816) - [Regression] One crippled DLL leads to a failure of a complete website
-   [325464](https://bugzilla.novell.com/show_bug.cgi?id=325464) - xsd is unable to generate correct classes from certain input files
-   [328036](https://bugzilla.novell.com/show_bug.cgi?id=328036) - [PATCH]Casting bug with generic collections
-   [342073](https://bugzilla.novell.com/show_bug.cgi?id=342073) - WebServices default WebForm does not work
-   [345448](https://bugzilla.novell.com/show_bug.cgi?id=345448) - Default binding name is wrong, when declared in WebServiceBindingAttribute, but not used.
-   [349688](https://bugzilla.novell.com/show_bug.cgi?id=349688) - SocketFlags.Partial is not implemented correctly in Linux
-   [382589](https://bugzilla.novell.com/show_bug.cgi?id=382589) - Passing either Decimal.Max or Decimal.Min to a SQL Server 2005 stored procedure that takes a decimal(29,0) results in a SqlException
-   [382589](https://bugzilla.novell.com/show_bug.cgi?id=382589) - Passing either Decimal.Max or Decimal.Min to a SQL Server 2005 stored procedure that takes a decimal(29,0) results in a SqlException
-   [409583](https://bugzilla.novell.com/show_bug.cgi?id=409583) - ToString of methods with pointers in their signature is wrong
-   [417398](https://bugzilla.novell.com/show_bug.cgi?id=417398) - [PATCH] System.Data.DataRowComparer.Default doesn't compare by row contents
-   [421827](https://bugzilla.novell.com/show_bug.cgi?id=421827) - [PATCH] CookieContainer.GetCookie skips cookie when domain has no leading dot
-   [424908](https://bugzilla.novell.com/show_bug.cgi?id=424908) - Oracle - stored procedure returning string throws exception - Size must be set
-   [431039](https://bugzilla.novell.com/show_bug.cgi?id=431039) - First Run of IsolatedStorageFile is not threadsafe
-   [436592](https://bugzilla.novell.com/show_bug.cgi?id=436592) - Error in the CustomizableFileSettingsProvider.Reset method
-   [449092](https://bugzilla.novell.com/show_bug.cgi?id=449092) - [Regression] Sockets Novell c\# LDAP api, LdapConnection.Disconnect() throws "The socket is not connected" exception
-   [449683](https://bugzilla.novell.com/show_bug.cgi?id=449683) - MD throws NotImplementedException when parsing DLR project
-   [458916](https://bugzilla.novell.com/show_bug.cgi?id=458916) - Implemetation errors on Copy.cs
-   [459790](https://bugzilla.novell.com/show_bug.cgi?id=459790) - SoapRpcMethod based webservices return HTTP 500 error with Mono 2.0.1 Runtime
-   [462947](https://bugzilla.novell.com/show_bug.cgi?id=462947) - TDS: not enough state reset when executing a query/stored procedure
-   [463011](https://bugzilla.novell.com/show_bug.cgi?id=463011) - [Regression] Pooled connection is no longer reset
-   [465613](https://bugzilla.novell.com/show_bug.cgi?id=465613) - HttpWebRequest.BeginGetRequestStream throws ProtocolViolationException
-   [466031](https://bugzilla.novell.com/show_bug.cgi?id=466031) - Socket.EndReceive buglet
-   [468570](https://bugzilla.novell.com/show_bug.cgi?id=468570) - Arithmatic overflow in System.Diagnostics.Stopwatch causes Elapsed property to return a negative timespan after the 25'th hour of running
-   [469135](https://bugzilla.novell.com/show_bug.cgi?id=469135) - Issues with glue-less gtk-sharp running MonoDevelop
-   [470336](https://bugzilla.novell.com/show_bug.cgi?id=470336) - crash while compiling on SLE\_10/ppc
-   [470336](https://bugzilla.novell.com/show_bug.cgi?id=470336) - crash while compiling on SLE\_10/ppc
-   [471305](https://bugzilla.novell.com/show_bug.cgi?id=471305) - Control lifecycle inconsistency between Mono and MS.NET implementations
-   [471747](https://bugzilla.novell.com/show_bug.cgi?id=471747) - [FreeBSD x86] Failure of pinvoke2 test
-   [471751](https://bugzilla.novell.com/show_bug.cgi?id=471751) - [FreeBSD x86] Failure of winx64structs test
-   [475438](https://bugzilla.novell.com/show_bug.cgi?id=475438) - xbuild dies badly if gmcs not installed
-   [476138](https://bugzilla.novell.com/show_bug.cgi?id=476138) - Win32 Socket behaviour changed.
-   [476289](https://bugzilla.novell.com/show_bug.cgi?id=476289) - mod\_mono report "(13)Permission denied: Failed to attach to existing dashboard"
-   [477383](https://bugzilla.novell.com/show_bug.cgi?id=477383) - MaskedTextBox: Backspace doesn't work
-   [477388](https://bugzilla.novell.com/show_bug.cgi?id=477388) - MaskedTextBox: Delete key deletes masked fields
-   [477395](https://bugzilla.novell.com/show_bug.cgi?id=477395) - MaskedTextBox: Able to overwrite characters with L mask
-   [477408](https://bugzilla.novell.com/show_bug.cgi?id=477408) - MaskedTextBox: Doesn't handle invalid input correctly
-   [480377](https://bugzilla.novell.com/show_bug.cgi?id=480377) - System.Data.OracleClient : DataReader does not support System.TimeSpan
-   [480856](https://bugzilla.novell.com/show_bug.cgi?id=480856) - xbuild don't recognize Multiple DEFINE
-   [481336](https://bugzilla.novell.com/show_bug.cgi?id=481336) - xbuild don't compile IronPython.sln
-   [481622](https://bugzilla.novell.com/show_bug.cgi?id=481622) - Exception when using layout template
-   [481687](https://bugzilla.novell.com/show_bug.cgi?id=481687) - System.Convert.ChangeType(someIConvertibleObject, typeof(Image) Throws exception on mono. .Net difference
-   [483268](https://bugzilla.novell.com/show_bug.cgi?id=483268) - Precompiled application can only be solved from original virtual path
-   [483852](https://bugzilla.novell.com/show_bug.cgi?id=483852) - TypeBuilder should be resolved when used in a generic type instance
-   [484244](https://bugzilla.novell.com/show_bug.cgi?id=484244) - [Regression] nunit-console.exe requires /noshadow
-   [484294](https://bugzilla.novell.com/show_bug.cgi?id=484294) - Type.GetMethod does not find methods with nullable parameters when expected
-   [484294](https://bugzilla.novell.com/show_bug.cgi?id=484294) - Type.GetMethod does not find methods with nullable parameters when expected
-   [484384](https://bugzilla.novell.com/show_bug.cgi?id=484384) - Duplicate key in assembly resolving
-   [484649](https://bugzilla.novell.com/show_bug.cgi?id=484649) - Mono.XBuild.CommandLine.LoggerInfo argument parsing is broken
-   [484773](https://bugzilla.novell.com/show_bug.cgi?id=484773) - WorkingDictionary outside of the project file breaks the build
-   [484795](https://bugzilla.novell.com/show_bug.cgi?id=484795) - [PATCH]WebClient.UploadValues using UTF-8 encoding and "POST" method do not upload accented characters properly
-   [485377](https://bugzilla.novell.com/show_bug.cgi?id=485377) - Regression in Convert.ChangeType()
-   [485377](https://bugzilla.novell.com/show_bug.cgi?id=485377) - Regression in Convert.ChangeType()
-   [485435](https://bugzilla.novell.com/show_bug.cgi?id=485435) - JSON proxy class generator errors out when any webmethod signature takes a GUID parameter
-   [485458](https://bugzilla.novell.com/show_bug.cgi?id=485458) - CustomValidator incorrectly requires ControlToValidate to be set for client side scripting to work.
-   [485557](https://bugzilla.novell.com/show_bug.cgi?id=485557) - Response.ClearHeaders reset HttpCacheability to private
-   [486234](https://bugzilla.novell.com/show_bug.cgi?id=486234) - System.String.LastIndexOf(string, StringComparison) crashes when using StringComparison.Ordinal on empty strings
-   [486303](https://bugzilla.novell.com/show_bug.cgi?id=486303) - Type.IsGenericTypeDefinition crashes for user defined Type
-   [486703](https://bugzilla.novell.com/show_bug.cgi?id=486703) - FtpWebRequest Send PrintWorkingDirectory Command Failed!
-   [486904](https://bugzilla.novell.com/show_bug.cgi?id=486904) - System.Net.NetworkInformation.Ping throws InvalidOperationException "Process has not been started" on OSX
-   [487155](https://bugzilla.novell.com/show_bug.cgi?id=487155) - ILASM does not work with octal values in QSTRINGS
-   [487518](https://bugzilla.novell.com/show_bug.cgi?id=487518) - SIGSEGV in mono\_arch\_emit\_call on amd64; running F\# nunit unit tests
-   [487625](https://bugzilla.novell.com/show_bug.cgi?id=487625) - ExtensionMethodAttribute and CS1685
-   [487659](https://bugzilla.novell.com/show_bug.cgi?id=487659) - VUL-0: Mono sanbox breakout in IsolatedStorage {}
-   [487758](https://bugzilla.novell.com/show_bug.cgi?id=487758) - Marshaling a native function pointer to native function call throws assertion
-   [488630](https://bugzilla.novell.com/show_bug.cgi?id=488630) - mod-mono-server is broken using HTTPS
-   [488670](https://bugzilla.novell.com/show_bug.cgi?id=488670) - Marshal.GetFunctionPtrFromDelegate crashes the runtime if the delegate signature includes an object type.
-   [488960](https://bugzilla.novell.com/show_bug.cgi?id=488960) - Invalid CS0663 error with generics ('overloaded function cannot differ on use of parameter modifiers only')
-   [489019](https://bugzilla.novell.com/show_bug.cgi?id=489019) - mono throwing exception while closing file descriptor 0
-   [489687](https://bugzilla.novell.com/show_bug.cgi?id=489687) - Code render tag not working
-   [490497](https://bugzilla.novell.com/show_bug.cgi?id=490497) - "watch for changes to web.config also in the subdirectories" causes problems
-   [490753](https://bugzilla.novell.com/show_bug.cgi?id=490753) - HtmlInputFile doesn't work on pages with EnableViewState=false
-   [491508](https://bugzilla.novell.com/show_bug.cgi?id=491508) - SessionSQLServerHandler : InitializeConnection -\> NullReferenceException
-   [491531](https://bugzilla.novell.com/show_bug.cgi?id=491531) - Settings in Web.config not being read
-   [491590](https://bugzilla.novell.com/show_bug.cgi?id=491590) - The FTPWebRequest class doesn't properly resume file downloads
-   [491828](https://bugzilla.novell.com/show_bug.cgi?id=491828) - xbuild hides important error information
-   [492252](https://bugzilla.novell.com/show_bug.cgi?id=492252) - error runing an ASP.net page with validators
-   [492329](https://bugzilla.novell.com/show_bug.cgi?id=492329) - gmcs generated invalid IL code for storing a new object in a generic out/ref parameters (regression from 2.2).
-   [492666](https://bugzilla.novell.com/show_bug.cgi?id=492666) - NullReferenceException when binding a list to the ListView
-   [493263](https://bugzilla.novell.com/show_bug.cgi?id=493263) - Using custom resource provider crashes application
-   [493639](https://bugzilla.novell.com/show_bug.cgi?id=493639) - Invalid "Bind invocation wasn't formatted properly" in TemplateControlCompiler
-   [493873](https://bugzilla.novell.com/show_bug.cgi?id=493873) - Multiple assemblies with same type name in precompiled updatable site
-   [493874](https://bugzilla.novell.com/show_bug.cgi?id=493874) - Missing column in BlogEngine.NET
-   [493887](https://bugzilla.novell.com/show_bug.cgi?id=493887) - Switch selects wrong branch when default is not last case
-   [494221](https://bugzilla.novell.com/show_bug.cgi?id=494221) - IL Compiles but generates wrong code
-   [494245](https://bugzilla.novell.com/show_bug.cgi?id=494245) - ASP.NET Pages not accepting base class with generic type
-   [494567](https://bugzilla.novell.com/show_bug.cgi?id=494567) - r131501 breaks compilation of System.Windows.Forms\_test\_net\_1\_1.dll
-   [495011](https://bugzilla.novell.com/show_bug.cgi?id=495011) - Application restarts when touching a folder
-   [495112](https://bugzilla.novell.com/show_bug.cgi?id=495112) - Can't compile cyclic structs with mono-2.4
-   [496758](https://bugzilla.novell.com/show_bug.cgi?id=496758) - Xsp2 hides internal errors making it difficult to debug tricky web service issues
-   [496905](https://bugzilla.novell.com/show_bug.cgi?id=496905) - Using Peek() after a short Read() returns -1 instead of trying to read more.
-   [496951](https://bugzilla.novell.com/show_bug.cgi?id=496951) - The 'NoStore' attribute is not supported by the 'Outputcache' directive.
-   [497174](https://bugzilla.novell.com/show_bug.cgi?id=497174) - ASP.NET 1.1 is broken with the recent changes made to templateParser.cs
-   [497220](https://bugzilla.novell.com/show_bug.cgi?id=497220) - assertion in mono\_local\_regalloc when a local not initialized is used
-   [497715](https://bugzilla.novell.com/show_bug.cgi?id=497715) - SqlParameter not handling SqlDbType.Xml / DbType.Xml ("No mapping exists ...")
-   [497720](https://bugzilla.novell.com/show_bug.cgi?id=497720) - System.Collections.Generic.KeyCollection.CopyTo(TKey [] array, int arrayIndex) behaves different on Mono / .NET
-   [497775](https://bugzilla.novell.com/show_bug.cgi?id=497775) - ASP.NET MVC's Html.TextBox()/etc. do nothing.
-   [497839](https://bugzilla.novell.com/show_bug.cgi?id=497839) - xbuild don't recognize \$(SolutionDir)
-   [498118](https://bugzilla.novell.com/show_bug.cgi?id=498118) - Revision 131768 breaks UserControls added in web.config
-   [498154](https://bugzilla.novell.com/show_bug.cgi?id=498154) - Xbuild does not recognize \*\*-Wildcard
-   [498637](https://bugzilla.novell.com/show_bug.cgi?id=498637) - HTML link tag in ASP.NET MVC render bug
-   [498692](https://bugzilla.novell.com/show_bug.cgi?id=498692) - many problems cross-building with gcc 4.2.x mingw cross
-   [498853](https://bugzilla.novell.com/show_bug.cgi?id=498853) - Cannot configure ConsoleTraceListener to use standard error through configuration
-   [499013](https://bugzilla.novell.com/show_bug.cgi?id=499013) - Appdomain.GetAssemblies() returns assemblies loaded for reflection only, not just for execution. Different behaviour than .NET
-   [499851](https://bugzilla.novell.com/show_bug.cgi?id=499851) - Need notification for UIA when a PopupButton gains focus
-   [499864](https://bugzilla.novell.com/show_bug.cgi?id=499864) - Dispose-Method of Mono.Data.SqliteClient.SqliteConnection doesn't close the connection.
-   [499887](https://bugzilla.novell.com/show_bug.cgi?id=499887) - TabControl.GotFocus event not fired when SelectionIndex is set
-   [500019](https://bugzilla.novell.com/show_bug.cgi?id=500019) - SSE2 used on system without SSE2
-   [500075](https://bugzilla.novell.com/show_bug.cgi?id=500075) - \<%Page%\> Inherits doesn't support C\# syntax
-   [500385](https://bugzilla.novell.com/show_bug.cgi?id=500385) - GetMethod fails to find private methods up the class hierarchy when using BindingFlags.NonPublic
-   [500739](https://bugzilla.novell.com/show_bug.cgi?id=500739) - Error when accessing anything but default route using system.web.routing
-   [501589](https://bugzilla.novell.com/show_bug.cgi?id=501589) - XElement Seems to Break
-   [502029](https://bugzilla.novell.com/show_bug.cgi?id=502029) - DateTimePicker: some children are not accessible by orca
-   [502274](https://bugzilla.novell.com/show_bug.cgi?id=502274) - HttpConnection does not unbind HttpListenerContext when KeepAlive is true
-   [502555](https://bugzilla.novell.com/show_bug.cgi?id=502555) - Routing problems related to default parameters
-   [502866](https://bugzilla.novell.com/show_bug.cgi?id=502866) - UDPClient.Receive does not honor Socket.ReceiveTimeout
-   [503728](https://bugzilla.novell.com/show_bug.cgi?id=503728) - misused Type.GetInterfaceMap() causes runtime crash
-   [504378](https://bugzilla.novell.com/show_bug.cgi?id=504378) - Routes in System.Web.Routing don't handle "Variable Number of Segments" correctly (Catchall)
-   [504391](https://bugzilla.novell.com/show_bug.cgi?id=504391) - WebService.EnableDecompression crash
-   [504411](https://bugzilla.novell.com/show_bug.cgi?id=504411) - Mprotect fails with ENOMEM in GC\_remap
-   [504615](https://bugzilla.novell.com/show_bug.cgi?id=504615) - [PATCH] Global.asax of precompiled sites not loaded
-   [504667](https://bugzilla.novell.com/show_bug.cgi?id=504667) - [gmcs] compilation error when using partial static classes
-   [505375](https://bugzilla.novell.com/show_bug.cgi?id=505375) - JIT does not optimize do-while loop correctly
-   [505678](https://bugzilla.novell.com/show_bug.cgi?id=505678) - mono.bin crashes for System.Xml.XPath.AxisIterator.MoveNextCore
-   [506144](https://bugzilla.novell.com/show_bug.cgi?id=506144) - Structs that contain Mono.Simd.Vector4f fields have broken sequential layout
-   [506757](https://bugzilla.novell.com/show_bug.cgi?id=506757) - CS0507 when overriding public method in class generated by ikvmc
-   [506915](https://bugzilla.novell.com/show_bug.cgi?id=506915) - Use of tertiary operator results in runtime stack trace but equivalent if/else code does not
-   [507003](https://bugzilla.novell.com/show_bug.cgi?id=507003) - Error in Assembly.DoAssemblyResolve
-   [507666](https://bugzilla.novell.com/show_bug.cgi?id=507666) - url-decode failed with encoded shift\_jis query
-   [507836](https://bugzilla.novell.com/show_bug.cgi?id=507836) - ListItem attributes aren't stored in view state
-   [508167](https://bugzilla.novell.com/show_bug.cgi?id=508167) - RegisterHiddenField should not put a "id" in the input field in 1.1 profile
-   [508389](https://bugzilla.novell.com/show_bug.cgi?id=508389) - Mono 2.4 crashes due to accessing freed data structures
-   [508538](https://bugzilla.novell.com/show_bug.cgi?id=508538) - System.Reflection.TargetInvocationException when calling MethodInfo.invoke
-   [508570](https://bugzilla.novell.com/show_bug.cgi?id=508570) - Generic MVC ViewMasterPage does not respect type
-   [508649](https://bugzilla.novell.com/show_bug.cgi?id=508649) - 404 not found errors should be displayed even when custom errors are on (and there is no redirect)
-   [508888](https://bugzilla.novell.com/show_bug.cgi?id=508888) - MonoVS version of mono breaks Graffiti
-   [509069](https://bugzilla.novell.com/show_bug.cgi?id=509069) - Can't set different handlers for subdirectories
-   [509092](https://bugzilla.novell.com/show_bug.cgi?id=509092) - 403 errors should be handled specially as well
-   [509163](https://bugzilla.novell.com/show_bug.cgi?id=509163) - '\*' and ':' are not supported in ASP.NET virtual paths
-   [509450](https://bugzilla.novell.com/show_bug.cgi?id=509450) - Web.config file modification is not detected
-   [509475](https://bugzilla.novell.com/show_bug.cgi?id=509475) - Unclosed when \<customErrors mode="On"/\>
-   [509998](https://bugzilla.novell.com/show_bug.cgi?id=509998) - Web.config changes in subdirectories are not detected
-   [510302](https://bugzilla.novell.com/show_bug.cgi?id=510302) - Theming asp.net application seems not work
-   [510735](https://bugzilla.novell.com/show_bug.cgi?id=510735) - Location path is not verified to be a relative path
-   [511414](https://bugzilla.novell.com/show_bug.cgi?id=511414) - Can't print from winforms
-   [512028](https://bugzilla.novell.com/show_bug.cgi?id=512028) - [Regression] asp.net framework includetest fails on mono-2.4.2 using xsp2
-   [512037](https://bugzilla.novell.com/show_bug.cgi?id=512037) - OutputCache directive Location parameter handling is broken
-   [512485](https://bugzilla.novell.com/show_bug.cgi?id=512485) - [PATCH] deadlock in ReaderWriterLockSlim.EnterWriteLock
-   [512535](https://bugzilla.novell.com/show_bug.cgi?id=512535) - Can't concatenate Item list error when compiling non-standard project with xbuild
-   [513849](https://bugzilla.novell.com/show_bug.cgi?id=513849) - HttpListener does not release the specified port by listener prefixes.
-   [513965](https://bugzilla.novell.com/show_bug.cgi?id=513965) - Please Add IE8.0 to browscap.ini

Installing Mono 2.4.2.2
=======================

**Binary Packages and Source Code Downloads:**

    Source code and pre-compiled packages for Linux, Solaris, 
    MacOS X and Windows is available from our web site from 
    the Downloads section.

**Quick source code installation:**

    If we have no packages for your platform, installing from 
    source code is very simple.   

Compile libgdiplus to support System.Drawing:

``` bash
    $ tar xzf libgdiplus-2.4.2.2.tar.gz
    $ cd libgdiplus-2.4.2.2
    $ ./configure
    $ make
    $ make install
```

Then compile Mono itself:

``` bash
    $ tar xzf mono-2.4.2.2.tar.gz
    $ cd mono-2.4.2.2
    $ ./configure
    $ make
    $ make install
```

