---
title: "FAQ: ASP.NET"
redirect_from:
  - /FAQ%3A_ASP.NET/
---

General
-------

### Does Mono support ASP.NET?

Yes. For a more detailed view of what's supported, see the [Compatibility](/docs/about-mono/compatibility/) page.

### Does Mono Support ASP?

No.

Mono does not support the old style ASP pages, it only supports ASP.NET pages; There are some tools that might help you migrate ASP pages to ASP.NET ([netcoole.com](http://netcoole.com)).

Once you have a working ASP.NET application, you could use Mono to run it.

### How can I run ASP.NET-based applications with Mono?

You can read our [Guide to port ASP.NET Applications with Mono](/docs/web/porting-aspnet-applications/).

Additionally, this is a very good guide on porting an ASP.NET MVC WebSite to Mono is a three part series blog that covers how to port an ASP.NET MVC website application to Mono:

-   Part 1: [Installing the Software](http://www.integratedwebsystems.com/2010/01/installing-opensuse-11-2-with-mono-2-6-1-and-apache-using-text-mode-configuration-porting-to-mono-part-1-of-3/)
-   Part 2: [Setting up and Configuring MySQL](http://www.integratedwebsystems.com/2010/02/how-to-setup-and-configure-mysql-membership-provider-6-2-2-porting-to-mono-part-2-of-3/)
-   Part 3: [Walk through porting the ASP.NET MVC website](http://www.integratedwebsystems.com/2010/02/walkthrough-porting-asp-net-mvc-website-to-mono-2-6-1-and-mysql-on-linux-apache-porting-to-mono-part-3-of-3/).

Novell: [From .NET to Linux in 5 Easy Steps](http://www.novell.com/connectionmagazine/2010/02/mono_tools.html)

 You need the Mono runtime and use one of Apache with [mod_mono](/docs/web/mod_mono/), a [CGI](/archived/cgi) or FastCGI-aware web server with Mono's [FastCGI](/docs/web/fastcgi/) support or the [xsp](/docs/web/aspnet/) standalone server (all available from our [downloads](/download/) page).

To run ASP.NET 1.1 applications use mod-mono-server (for Apache), fastcgi-mono-server (for FastCGI servers) or xsp (for testing).

To run ASP.NET 2.0 applications use mod-mono-server2 (for Apache), fastcgi-mono-server2 (for FastCGI servers) or xsp2 (for testing)

### Does Mono support ASP.NET's web services?

Yes, Mono supports ASP.NET-based web services (files ending in .asmx)

### Does Mono have support for WSE?

At this point Mono does not have support for the "Web Services Enhancements" package and there are no plans on supporting it.

See the [WSE](/archived/wse) page for more details about it.

### Does Mono support XHTML and Web standards?

See the long reply on [WebStandards](/archived/webstandards).

### Are there alternatives to ASP.NET?

Some of these are not complete replacements for ASP.NET, but they might be useful for your particular domain:

-   [Jitsu](http://www.jitsu.org/jitsu/) is a framework for building web applications.

-   [Dream](http://doc.opengarden.org/) is a framework for building the backend of web applications by providing a very complete framework for building REST applications.

-   [Spring.NET](http://www.springframework.net/) is a port of the spring framework from Java to C#

-   [Maverick.NET](http://mavnet.sourceforge.net/) a Model-View-Controller framework for building web applications.

The following are built on top of the basic of ASP.NET, so they are more of a complement:

-   [Castle Project](http://www.castleproject.org/) inspired by Ruby on Rail, but this is for .NET languages

Installation and Setup
======================

### Does Mono's ASP.NET run on Linux ?

Yes. And on all the platforms on which mono runs. In Windows you must use XSP as mod_mono does not work with the Windows version of Apache, nor with IIS.

### Should I use mod_mono, FastCGI or XSP?

mod_mono will allow you to integrate Mono and ASP.NET web pages in an existing Apache installation which means that you get all the benefits that Apache has (HTTP 1.1 support, extensive configuration options, extensive documentation and support) and you can mix on a single server many other services.

FastCGI is a lightweight protocol implement by both Apache and many other web servers. It has become a universal protocol for web server extensions so it is supported by many web servers, in particular popular servers like [Nginx](/docs/web/fastcgi/nginx/). Configuring FastCGI is also a bit simpler for people not familiar with Apache configuration. The features are usually determined by the web server that uses FastCGI.

XSP is a very limited web server which is used typically during development or for testing. Although some people use it for production, but this server is not likely going to ever grow to support all the features that Apache or FastCGI servers have.

XSP at this point only implements HTTP 1.0 with a few extensions (keep-alive is the most important one), but no work is currently underway to support HTTP 1.1 and it is also missing features like mime-type configuration and any other features that people expect from a web server.

### How do I restart my Mono applications without restarting Apache?

Enable the control panel in mod_mono, see [mod_mono's Control Panel section](/docs/web/mod_mono/#control-panel) for details on setting it up.

### My Apache Module Is Not Recognized, what to do?

In certain Apache configurations (SUSE 9.0), Apache is configured with large file support. This requires that every apache module has to be compiled with large file support as well.

You have to configure mod_mono as follows:

``` bash
CFLAGS="-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64" ./configure
```

because mod_mono's configure apparently doesn't query the CFLAGS from apxs. I'll fill a bug.

In newer versions of Mono, this is taken care of by the configure script.

### mod_mono and mod_proxy

What are the advantages/disadvantages of using mod_mono with apache versus setting up apache with mod_proxy to proxy an XSP server running on a private port?

The use of mod_proxy is a common practice in the Java world with Tomcat/application serves, what is the reason not to use the same setup with XSP?

The mod_proxy approach is not recommended for Mono for the following reasons:

mod_mono:

-   mod_mono performs better (it uses Unix domain sockets to communicate with the Mono server. The response headers doesn't need to be parsed/rewritten.
-   faster file transfers
-   common URL namespace with Apache (if AddHandler is used)
-   autohosting: [AutoHosting](/docs/web/mod_mono-autoconfiguration/)
-   enabled for mass hosting
-   xsp is only an HTTP 1.0 server, with a few HTTP 1.1 extensions, but not all of them. By using mod_mono your client software is exposed to a full HTTP 1.1 implmenentation.

mod_proxy + mod_proxy_http:

-   ability to run the app server under a different UID (mod_mono is supposed to support this too)
-   the app server process cannot be controlled by Apache
-   difficult mass hosting

### How can I Run mod-mono-server as a different user?

Due to apache's design, there is no straightforward way to start processes from inside of a apache child as a specific user. Apache's SuExec wrapper is targeting CGI and is useless for modules.

Mod_mono provides the MonoRunXSP option. You can set it to "False" and start mod-mono-server manually as the specific user. Some tinkering with the Unix socket's permissions might be necessary, unless MonoListenPort is used, which turns on TCP between mod_mono and mod-mono-server.

Another (very risky) way: use a setuid 'root' wrapper for the mono executable, inspired by the sources of Apache's SuExec.

And finally: drop mod_mono and use mod_proxy + mod_proxy_http + XSP instead. It's slightly easier to configure, especially if you are not used to mod_mono.

From [the mono-devel-list](http://lists.ximian.com/pipermail/mono-devel-list/2006-May/018520.html)

### I get Service Unavailable

If you are getting an error like "Service Temporary Unavailable".

Make sure that your MonoExecutablePath actually points to Mono, or simply delete the file, as it is redundant.

Common Problems
---------------

### What are some common problems when porting applications?

-   Place a "Bin" directory instead of "bin"
-   Not placing all the required DLLs in the bin dierctory (or GAC)
-   Running xsp[2], not configuring the --aplications parameter (or application in the root directory)
-   Running mod-mono, not configuring the MonoApplications directive (more info with man mod_mono)

### Performance is disappointing

Please consult [Mod_mono](/docs/web/mod_mono/) for possible performance improvements. If your site still doesn't perform well, ask on the mono mailing lists for advice.

### Compilation fails with the CS0169 error message

It will happen if you configured the C# compiler in `Web.config` in a way similar to the one shown below:

``` xml
<?xml version="1.0" encoding="iso-8859-1"?>
<configuration>
  <system.web>
    <compilation defaultLanguage="C#">
      <compilers>
        <compiler language="c#;cs;csharp" extension=".cs" compilerOptions="/warnaserror" warningLevel="4"
          type="Microsoft.CSharp.CSharpCodeProvider, System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" />
      </compilers>
    </compilation>
  </system.web>
</configuration>
```

This is result of an incompatibility between the Microsoft .NET C# compiler and the Mono C# compiler. Please read [this article for more information](/archived/aspnet_mono_specific_configuration)

### ProviderException from SqliteMembershipProvider

When porting an ASP.NET app to Mono, you may get an exception similar to the following:

``` bash
    System.Configuration.Provider.ProviderException: Operation aborted due to an exception (see Trace for details).
    at System.Web.Security.SqliteMembershipProvider.ValidateUser (string,string)
    at NerdDinner.Controllers.AccountMembershipService.ValidateUser (string,string)
    at NerdDinner.Controllers.AccountController.ValidateLogOn (string,string)
    at NerdDinner.Controllers.AccountController.LogOn (string,string,bool,string)
    at (wrapper dynamic-method) System.Runtime.CompilerServices.ExecutionScope.lambda_method (System.Runtime.CompilerServices.ExecutionScope,System.Web.Mvc.ControllerBase,object[])
    at System.Web.Mvc.ActionMethodDispatcher.Execute (System.Web.Mvc.ControllerBase,object[])
    at System.Web.Mvc.ReflectedActionDescriptor.Execute (System.Web.Mvc.ControllerContext,System.Collections.Generic.IDictionary`2<string, object>)
    at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod (System.Web.Mvc.ControllerContext,System.Web.Mvc.ActionDescriptor,System.Collections.Generic.IDictionary`2<string, object>)
    at System.Web.Mvc.ControllerActionInvoker/<InvokeActionMethodWithFilters>c__AnonStoreyB.<>m__E ()
    at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethodFilter (System.Web.Mvc.IActionFilter,System.Web.Mvc.ActionExecutingContext,System.Func`1<System.Web.Mvc.ActionExecutedContext>)
```

This is due to ASP.NET 2.0's MembershipProvider support, which requires a backing database in order to store user account information.

The fix is easy: you need to create a `~/App_Data/aspnetdb.sqlite` SQLite database file. You can use the **sqlite3** program and the SQL commands at [Membership/Roles/Profile provider schema](/docs/web/porting-aspnet-applications/#membershiprolesprofile-provider-schema):

``` bash
$ sqlite3 aspnetdb.sqlite
sqlite> CREATE TABLE Users ( -- etc., from above link page );
```

Once you've created the `~/App_Data/apsnetdb.sqlite` file, restart your ASP.NET app and things should Just Work (wrt MembershipProvider, anyway).

Development
-----------

### I would like line numbers in my stack traces

By default xsp and xsp2 run in "release" mode, which means that no debugging information is generated at runtime. If you want line numbers in your stack traces, you must pass the --debug option to Mono, this is done by invoking **xsp** or **xsp2** with the MONO_OPTIONS environment variable, like this:

``` bash
$ MONO_OPTIONS=--debug xsp
Listening on port: 8080 (non-secure)
Listening on address: 0.0.0.0
Root directory: /tmp/us
Hit Return to stop the server.
```

If you are running mod_mono with Apache, you must use the **MonoDebug** directive in your configuration file, like this:

``` bash
MonoDebug true
```

### My application fails if I replace binaries

Current versions of Mono use the actual libraries and dlls that you might have in your bin/ directory of your application.

Although Mono will automatically pick up changes in your source code files and recompile, if you make changes to the libraries or precompiled code on a live system you might get an error as Mono will not notice this change.

This is due for the current lack of support for ShadowCopyFiles.

To work around this issue, its important that before replacing a dll in bin, you remove the file and then copy the file over. Do not copy the file over or it will fail (Unix semantics guarantee that this will work).

For example, this is the proper method of upgrading DLLs in your bin directory:

``` bash
bash$ rm bin/GraphControls.dll
bash$ cp /home/myself/GraphControls.dll bin
```

Alternatively, you can use the "install" command, which has the same effect:

``` bash
 
bash$ install /home/myself/GraphControls.dll bin
```

The compiler takes care of this for you automatically, so you can integrate this directly into your build system:

``` bash
mcs -target:library -output:dll/GraphControls.dll GraphControls.cs
```

### How can I set the encoding of my files?

By default Mono will assume that the files on the file system are encoded with the encoding determined by the LANG environment variable. If you need to change the encoding, you might want to use the globalization configuration element (see ["globalization Element"](http://msdn2.microsoft.com/en-us/library/hy4kkhe0.aspx)).

fileEncoding is the encoding of source files (.aspx, .ascx, ...)

responseEncoding is the encoding of input (posted data)

responseEncoding is the encoding of output (Content-Type: ...; charset)

### Where are the various settings for System.Web documented?

Some documentation is available on this site on [Config_system.web](/archived/config_systemweb), but you might also use the documentation from [[http://msdn2.microsoft.com/en-us/library/b5ysx397.aspx](http://msdn2.microsoft.com/en-us/library/b5ysx397.aspx) MSDN.

Features
--------

### Does Mono support the App_Browsers folder and the .browser files?

Yes, they are supported starting from Mono version 2.0. However, there's one difference to the .NET support. Namely, Mono does not (and cannot) distribute the standard .NET .browser files - you can, however, copy them verbatim from your .NET distribution and drop those you need in the `~/App_Browsers` directory under your application root.

### Does Mono support code-behind in ASP.NET?

Yes, code-behind is supported in Mono's implementation of ASP.NET.

**Be warned** that this has nothing to do with the *CodeBehind* attribute that VS.NET adds to the pages its generates. That attribute is ignored by MS and Mono parsing code and so you need to compile and deploy the codebehind classes to the proper folder.

### How can I reference an assembly in my .aspx pages?

By default, the ASP.NET engine will reference a few *default* assemblies and all the assemblies in the bin directory of your application.

If you want to reference any other assembly that is installed in the GAC, you can do two things, you can either list it at the top of your page:

``` asp
 <%@ Assembly name="Assembly.Name" %>
```

Replacing *Assembly.Name* with your assembly name (i.e., "ByteFX.Data", "Mono.Posix", …).

Or better yet, registering this in your web.config file. If you register this on the web.config file, all the files in the current directory will be compiled with those settings:

``` xml
<configuration>
  <system.web>
    <compilation>
      <assemblies>
        <add assembly="Mono.Posix"/>
      </assemblies>
    </compilation>
  </system.web>
</configuration>
```

For more details, see the Config system.web compilation page or the [docs at Microsoft](http://msdn2.microsoft.com/en-us/library/s10awwz0.aspx)

### How can I reference a library in my .asmx web service?

There are two kinds of libraries you can reference:

-   GAC-installed assemblies
-   private libraries.

To reference private libraries, just place the libraries in the "bin" directory below your application and they will be referenced automatically for you:

``` bash
mkdir bin
mcs -out:bin/library.dll -target:library mylibrary.cs
```

For GAC-installed libraries to be installed, you need to add the assembly to the Web.config file, the file should look like this:

``` xml
<?xml version="1.0"?>
<configuration>
        <system.web>
                <compilation debug="false">
                        <assemblies>
                                <add assembly="MyGacLibrary, Version=1.1.1.2, Culture=neutral, PublicKeyToken=asdfasdfasdfasdf"/>
                        </assemblies>
                </compilation>
        </system.web>
</configuration>
```

### How do I register a tag?

If you have a tag in the file *MyTags.dll*, this file in in bin directory or the GAC, and you want the prefix to be *something*, add the following to the page consuming it:

``` asp
 <%@ Register TagPrefix="something" Namespace="MyTags" assembly="MyTags" %>
```

Now if there's a control in MyTags.dll called *SuperDuper* you can use this in your page:

``` asp
 <something:SuperDuper id="myid" otherattributes="go here" />
```

### OutputCache and VarByParam

The VaryByParam="None" semantics are not implemented in Mono, for example in:

``` asp
<%@ OutputCache Duration="300" Location="Server" VaryByParam="None"%>
```

Use a true parameter name or "\*" instead.

Instead of Location="Server", use "ServerAndClient".

### Does Mono's ASP.NET support SSL/TLS?

If you are using the Apache module, https support is handled directly by Apache and all the variables are available using the System.Web APIs.

If you are using XSP, read the [using client certificates with XSP](/docs/web/using-clientcertificates-with-xsp/) article which details the process.

### I write pages that contain non-ASCII characters, and they appear garbled in the browser. What's wrong?

Check if your aspx/ascx/etc.. files were saved in the Windows-1252 encoding, if possible, so that no further action is needed. If they are in utf-8 (default nowadays in Linux) or any other encoding you will need to tell the compiler for the language your page will be translated into to expect this other encoding. There are two forms:

1 - Change each affected page to add the specific compiler option:

``` asp
<%@Page language="C#" compilerOptions="/codepage:utf8" %>
```

2 - Change things in the machine.config (for the whole installation) or web.config (for specific web apps) files:

``` xml
<configuration>
...
 <system.web>
 ...
  <compilation>
   <compilers>
    <compiler language="cs;c#;csharp" extension=".cs" warningLevel="1"
              compilerOptions="/codepage:utf8"
              type="Microsoft.CSharp.CSharpCodeProvider, System, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" />
    <compiler language="vb;vbs;visualbasic;vbscript" extension=".vb" warningLevel="1"
              compilerOptions="/codepage:utf8"
              type="Microsoft.VisualBasic.VBCodeProvider, System, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" />
   </compilers>
  </compilation>
  ...
  <globalization
    requestEncoding="utf-8"
    responseEncoding="utf-8"
    fileEncoding="utf-8" />
 </system.web>
</configuration>
```

### My Repeater/DataList/DataGrid events aren't firing. What's wrong?

A common error is to **always** databind the content in the PageLoad. If you do so for PostBacks you will be recreating the child controls from the datasource and will lose any ties to the events that are encoded in the request. **Just make DataBinding conditional on the IsPostBack property not being true**. That will preserve the viewstate and so the ties for the encoded event that will be fired later in the page processing.

Example:

``` asp
  public void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
      InitCustomDataBinding(); // or just DataBind(); for design-time configured databinding
  }
```

Portability
-----------

Portability is mostly a problem when moving an existing application from Windows/.NET to Mono on non-Windows platforms.

If you are developing your application from scratch, portability problems will be kept to a minimum if you test the application regularly on both Linux and Windows during the development.

### Do all ASP.NET applications run out of the box on Mono?

Not all applications written for ASP.NET work on Mono, most of the time this is due to file system assumptions that the developers made. In Unix filenames with different case are considered different, so for example it is possible to have both a "Login.aspx" and a "login.aspx" file. If programmers are not consistent in their file naming practices applications will not run.

These are a few common problems:

-   The files on the ASP.NET application are themselves are camel-cased, like "Login.aspx" but the pages on the site are hard coded to reference "login.aspx".

-   The application uses the Registry to store settings (Mono implements a emulated registry on Unix that takes some configuration to setup).

-   The application makes use of a library not provided in Mono (EnterpriseServices for example).

Porting an application typically requires those changes to be made.

### Does \<app\> run on Mono?

Most applications will run on mono without a hassle, but others will need to be audited for the problems stated above in this section.

Some applications already include direct support for Mono, like [nGallery](http://sourceforge.net/projects/ngallery/).

### Does Mono support ASP.NET AJAX?

Yes, Mono versions after 1.9 do support ASP.NET AJAX.

### Are there other AJAX frameworks that could be used with Mono?

There are a few Ajax libraries that developers could consider:

-   [Anthem.NET](http://anthem-dot-net.sourceforge.net/) library.
-   [Magic Ajax.NET](http://www.magicajax.net/).
-   GaiaWidgets

### Is it possible to have different ASP.NET configuration for different operating systems without separate configuration files?

Yes, it is possible with Mono version from git master or 1.2.7 or newer. This is a Mono-specific feature which allows you to change various configuration settings on the application run time without the neeed to ship a separate set of configuration files for each supported operating system. If you plan to run your application on MS.NET/IIS and Mono, then you should configure it for the Windows/MS.NET target and provide configuration settings mappers for other operating systems. For more information see [ASP.NET_Settings_Mapping](/archived/aspnet_settings_mapping)

Extra Languages
---------------

### How can I use F# with ASP.NET on Mono?

Out of the box, ASP.NET only supports pages written in C# and VB.NET. To convince it to use the F# compiler, the following extra steps are required:

-   Install the F# compiler and runtime.

-   Set up mod_mono for apache, clx, or whichever web server you want, set up your ASP.NET page and configure the web-server to find it.

-   Copy the FSharp.Compiler.CodeDom.dll file from the bin directory of your FSharp installation to the bin directory of your ASP.NET page.

-   The web.conf for your page should look something like this to enable the compiling of F# code:

<!-- -->

``` xml
<?xml version="1.0"?>
<configuration>
  <system.web>
    <compilation debug="true">
      <assemblies>
        <add
           assembly="FSharp.Compiler.CodeDom, Version=1.9.3.14,
Culture=neutral,PublicKeyToken=a19089b1c74d0809"/>
      </assemblies>
      <compilers>
        <compiler
           language="F#;f#;fs;fsharp" extension=".fs"
           type="Microsoft.FSharp.Compiler.CodeDom.FSharpAspNetCodeProvider,
FSharp.Compiler.CodeDom, Version=1.9.3.14, Culture=neutral,
PublicKeyToken=a19089b1c74d0809"/>
      </compilers>
    </compilation>
  </system.web>
</configuration>
```

Note that you might have to adjust the version numbers mentioned. There are example files for this in the samples/fsharp/Web/ASP.NET/, but for me they wouldn't work out of the box.

-   Make sure there is a file fsc.exe somewhere in your path that invokes the F# compiler. Since, on Unix, you can not directly run the .exe files, create a shell script named "fcs.exe" with this content:

<!-- -->

``` bash
#!/bin/sh
/usr/bin/mono /path/to/FSharp-1.9.3.14/bin/fsc.exe "$@"
```

Now your ASP.NET page should load.

(thanks to Marijn Haverbeke for the contribution)

Using Mono with Apache
----------------------

### Will you support Apache 1?

Yes, the mod_mono module works on both major versions of Apache (1.x and 2.x)

### Can I run Apache 1 and Apache 2 on the same machine?

You can always keep a copy of Apache 2 running in parallel with your Apache 1.3 (either different port or using a reverse proxy). You can also bind the two servers to different IP addresses on the same physical machine.

### How do I register a new extension to be processed by mod_mono?

Consider for example turning .htm files into files processed as .aspx files.

You need to add to your Apache configuration the following line:

``` csharp
AddType application/x-asp-net .htm
```

And you need to inform the ASP.NET runtime how to handle the pages, add this to your web.config file:

You also need to inform System.Web about the .htm extension being now a page:

web.config, inside system.web and inside httpHandlers:

``` xml
  ..
  <system.web>
     ..
     <httpHandlers>
       <add verb="*" path="*.htm" type="System.Web.UI.PageHandlerFactory,
System.Web, Version=1.0.5000.0, Culture=neutral,
PublicKeyToken=b03f5f7f11d50a3a" />
      ...
     </httpHandlers>
     ...
  </system.web>
```

(thanks to Marijn Haverbeke, for this contribution)

### How do I setup multiple virtual hosts?

Joe Audette has a tutorial [here](http://www.joeaudette.com/settingupapachevirtualhostswithmod_mono.aspx)

Memory Usage
------------

### Why does the memory consumed by the Mono process keep growing?

In the past, Mono used a conservative, non-moving, non-compacting garbage collector. This meant that the heap was not compacted when memory was released.

It now uses a new collector, see the [Generational GC](/docs/advanced/garbage-collector/sgen/) page.

