---
title: "Completing2.0Profile"
lastmodified: '2007-11-13'
redirect_from:
  - /Completing2.0Profile/
---

Completing2.0Profile
====================

These are the classes that need work to complete the 2.0 profile. **This doesn't include MonoTODOs** or extra API that we need to conceal, just missing items. I've also ignored any [Obsolete], [DebuggerDisplay], [DebuggerTypeProxy], [ComImport] and [ComVisible] attributes we need to apply, as they are just noise at this time.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#runtime">1 Runtime</a></li>
<li><a href="#mscorlib">2 mscorlib</a></li>
<li><a href="#system">3 System</a></li>
<li><a href="#adonet">4 ADO.NET</a></li>
<li><a href="#aspnet">5 ASP.NET</a></li>
<li><a href="#windowsforms">6 Windows.Forms</a></li>
</ul></td>
</tr>
</tbody>
</table>

Runtime
-------

Important bugs that must be fixed before we are ok with the 2.0 support:

-   [Caching of virtual generic methods](http://bugzilla.ximian.com/show_bug.cgi?id=81806).
-   [runtime should support Covariant / Contravariant generic parameters](http://bugzilla.ximian.com/show_bug.cgi?id=78961)
-   There are quite a few of leaks and memory retention issues in the generics code, all over the place.
-   Provide a generics embedded API.

Would be nice to fix, but are not show-stoppers:

-   [get rid of global generics caches in metadata.c](http://bugzilla.ximian.com/show_bug.cgi?id=77596)
-   [Runtime must check constraints](http://bugzilla.ximian.com/show_bug.cgi?id=77522)
-   [Runtime crashes with P/Invoke to generics signature](http://bugzilla.ximian.com/show_bug.cgi?id=80455)
-   [SafeHandles Limitations](/SafeHandles "SafeHandles"): There are a handful of features that are missing from the SafeHandles implementation that would be nice to have implemented.
-   Critical finalizers and related implementation issues.

Currently no plan to implement:

-   PerformanceCounter and related types in System.Diagnostics.
-   Full Windows-like EventLog support, such as access to non-local machines.
-   System.Security.Cryptography.Pkcs support (actually in System.Security.dll)
-   ACL (System.Security.AccessControl namespace).

mscorlib
--------

[mscorlib status page](http://mono.ximian.com/class-status/mono-HEAD-vs-fx-2/class-status-mscorlib.html)

-   System
    -   ActivationContext (lacks serialization, argument checking).
    -   Activator (CreateInstance methods)
    -   AppDomain (Needs to implement ExecuteAssembly)
    -   AppDomainSetup
    -   Array (need to clean up exposed InternalArray\_\*)
    -   Console
    -   GC (internalize or remove RecordPressure)
    -   MarshalByRefObject
    -   Math (midpoint rounding)
    -   MulticastDelegate
    -   OperatingSystem (missing properties).
    -   DateTime (Missing Serializable). With [Patch](http://bugzilla.ximian.com/show_bug.cgi?id=82400).
-   System.Deployment.Internal
-   System.Globalization
    -   ChineseLunisolarCalendar
    -   CultureInfo
    -   DateTimeFormatInfo
    -   EastAsianLunisolarCalendar
    -   HijriCalendar
    -   JapaneseLunisolarCalendar
    -   KoreanLunisolarCalendar
    -   NumberFormatInfo
    -   RegionInfo (Missing DisplayName)
    -   TaiwanLunisolarCalendar
-   System.Reflection
    -   AssemblyName
-   System.Reflection.Emit
    -   AssemblyBuilder
    -   ConstructorBuilder
    -   DynamicILInfo
    -   DynamicMethod
    -   EnumBuilder
    -   GenericTypeParameterBuilder
    -   MethodBuilder
    -   SignatureHelper
    -   TypeBuilder
    -   AssemblyBuilderAccess
    -   FlowControl
    -   OpCodeType
    -   OperandType
    -   PackingSize
    -   PEFileKinds
    -   StackBehaviour
-   System.Resources
    -   ResourceManager
-   System.Runtime
-   System.Runtime.Remoting
    -   RemotingConfiguration
    -   RemotingServices
-   System.Runtime.Remoting.Messaging
    -   CallContext

System
------

[System status page](http://mono.ximian.com/class-status/mono-HEAD-vs-fx-2/class-status-System.html)

The API (metadata) compatibility work is done (only impossible-to-do things are left) for 2.0 (at pre-3.5 state).

-   System.ComponentModel
    -   IListSource
    -   MultilineStringConverter
    -   NullableConverter
    -   PropertyDescriptor
    -   TypeDescriptor
-   System.ComponentModel.Design
    -   DesignerOptionService
    -   MenuCommand
-   System.ComponentModel.Design.Serialization
    -   SerializationStore
-   System.Configuration
    -   LocalFileSettingsProvider
    -   SettingValueElement
-   System.Diagnostics
    -   Process
    -   TraceListener
-   System.IO.Ports
    -   SerialPort
-   System.Net (Dick)
    -   IWebProxyScript
    -   AuthenticationManager
    -   Authorization
    -   Cookie
    -   CookieCollection
    -   CookieException
    -   CredentialCache
    -   FileWebRequest
    -   FileWebResponse
    -   HttpWebRequest
    -   HttpWebResponse
    -   ProtocolViolationException
    -   ServicePoint
    -   ServicePointManager
    -   WebClient
    -   WebException
    -   WebHeaderCollection
    -   WebProxy
    -   WebRequest
    -   WebRequestMethods
    -   WebResponse
    -   DecompressionMethods
    -   WebExceptionStatus
-   System.Net.Cache
    -   HttpCacheAgeControl
    -   RequestCacheLevel
-   System.Net.Mail
    -   SmtpClient (SMTPS support)

ADO.NET
-------

[System.Data status page](http://mono.ximian.com/class-status/mono-HEAD-vs-fx-2/class-status-System.Data.html)

-   System.Data
    -   DataSetSchemaImporterExtension
    -   DataSet (probably) support for importing and exporting annotated xsd files. The annotation format is not really documented anywhere, so it's a hard task, but a lot of ASP.NET 2.0 applications use xsd files which take advantage of the feature (I believe it is created by the VS2005 designers). A related bug report is [https://bugzilla.novell.com/show\_bug.cgi?id=325464](https://bugzilla.novell.com/show_bug.cgi?id=325464)
-   System.Data.Odbc
    -   OdbcConnectionStringBuilder
    -   OdbcParameterCollection
    -   OdbcTransaction
-   System.Data.OleDb
    -   OleDbCommandBuilder
    -   OleDbConnectionStringBuilder
    -   OleDbParameterCollection
-   System.Data.SqlClient
    -   SqlBulkCopy
    -   SqlParameter (XML)
    -   SqlNotification
    -   SqlConnection (Connection string)
-   System.Data.SqlTypes
    -   Type\*SchemaImporterExtension
-   System.Design
    -   Annotation support for System.Data (this isn't a strictly System.Design feature, it is used to generate actual code on the runtime)

[System.Data.OracleClient status page](http://mono.ximian.com/class-status/mono-HEAD-vs-fx-2/class-status-System.Data.OracleClient.html)

-   System.Data.OracleClient
    -   OracleCommandBuilder
    -   OracleConnectionStringBuilder
    -   Batch processing
    -   OracleParameterCollection
    -   OracleTransaction

ASP.NET
-------

Marek has been using the various reference and Quick start materials from the Microsoft web site and ported a handful of 2.0 applications to ensure that our support is sufficient.

Necessary:

-   Nothing major API-wise that am aware of, other than bug fixes at this point.

Would be nice to have, but is not necessary:

-   .browser format parsing support, to be able to use control adapters (MojoPortal makes a use of those)
-   Support for pre-compiled web sites.
-   Support for precompiling web sites.

Windows.Forms
-------------

What we are still missing in Windows.Forms is tracked at [Winforms 2.0](/Winforms_2.0 "Winforms 2.0").

Additional resources:

-   [WinForms CodeOwners](/WinForms_CodeOwners "WinForms CodeOwners")
-   [Moma Reports](http://primates.ximian.com/~miguel/momareports).


