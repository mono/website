---
title: "Mono.Zeroconf"
lastmodified: '2011-10-25'
redirect_from:
  - /Mono.Zeroconf/
  - /Mono_Zeroconf/
---

Mono.Zeroconf
=============

Mono.Zeroconf is a cross platform Zero Configuration Networking library for Mono and .NET. It provides a unified API for performing the most common zeroconf operations on a variety of platforms and subsystems: all the operating systems supported by Mono and both the [Avahi](http://avahi.org/) and [Bonjour/mDNSResponder](http://developer.apple.com/networking/bonjour/index.html) transports.

By using Mono.Zeroconf developers can use a single API that will work regardless of the underlying implementation that a particular operating system uses.

Developers can publish services that will be exposed to other computers on the network and also query the local machines on the network for services that could have been exposed.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#whats-included">1 What's Included</a></li>
<li><a href="#where-to-get-it">2 Where to get it</a>
<ul>
<li><a href="#sources-and-windows-binaries">2.1 Sources and Windows Binaries</a></li>
<li><a href="#linux-packages">2.2 Linux Packages</a></li>
<li><a href="#git">2.3 Git</a></li>
</ul></li>
<li><a href="#documentation">3 Documentation</a></li>
<li><a href="#things-a-developer-should-know">4 Things a developer should know</a>
<ul>
<li><a href="#api-stability">4.1 API Stability</a></li>
<li><a href="#api-coverage-of-zeroconf-operations">4.2 API coverage of Zeroconf operations</a></li>
<li><a href="#compatibility-with-net">4.3 Compatibility with .NET</a></li>
<li><a href="#implementation-details">4.4 Implementation Details</a></li>
<li><a href="#known-workarounds">4.5 Known Workarounds</a></li>
<li><a href="#bug-reports-and-support">4.6 Bug Reports and Support</a></li>
</ul></li>
<li><a href="#how-to-use-it">5 How to use it</a>
<ul>
<li><a href="#listen-for-and-resolve-services">5.1 Listen for and resolve services</a></li>
<li><a href="#publish-a-service">5.2 Publish a service</a></li>
</ul></li>
<li><a href="#providers">6 Providers</a></li>
<li><a href="#future">7 Future</a></li>
</ul></td>
</tr>
</tbody>
</table>

What's Included
---------------

Most developers will make use of:

-   A base namespace, `Mono.Zeroconf`. This is the namespace that applications and libraries should use to use zeroconf networking.
-   A command line tool, `mzclient`. This tool can be used to query/browse and publish services from the command line.

In addition, some backend-specific namespaces exist:

-   A provider namespace `Mono.Zeroconf.Providers`. This namespace can be used to implement new zeroconf providers. Most applications and libraries will never need to use this namespace.
-   A provider for mDNSResponder (Bonjour). This provider works on Windows, Mac OS X, and Linux.
-   A provider for Avahi. This provider is preferred on Linux over mDNSResponder. Most Linux distributions ship Avahi these days.

It is important to note that Mono.Zeroconf abstracts away the differences between providers (mDNSResponder/Avahi). Because of this, some of the more detailed, seldom used features of each provider stack are not exposed through Mono.Zeroconf. If you require such specificity from a zeroconf stack, you probably need to use that provider's API directly. Mono.Zeroconf is not for you.

Where to get it
---------------

Mono.Zeroconf is available in both source and binary tarball/zip form as "upstream" sources. It is maintained separately from Mono itself, but will be included as a module in the Mono release suite soon.

### Sources and Windows Binaries

Currently the releases are being managed by the [Banshee Project](http://banshee-project.org), but will soon be moved to the same location as all other [Mono sources](http://go-mono.com/sources-stable/).

-   [Source code for Linux/OS X (tar.bz2)](http://download.banshee-project.org/mono-zeroconf/mono-zeroconf-0.9.0.tar.bz2)
-   [Source code for Windows (zip)](http://download.banshee-project.org/mono-zeroconf/mono-zeroconf-0.9.0.zip) - includes Visual Studio 2005 solution
-   [Windows Binaries](http://download.banshee-project.org/mono-zeroconf/mono-zeroconf-0.9.0-binary.zip)

***Note:** Windows users must install [Apple's Bonjour](http://www.apple.com/support/downloads/bonjourforwindows.html) before using Mono.Zeroconf.*

### Linux Packages

Packages for many Linux distributions are available through the Mono project in the [openSUSE Build Service](http://build.opensuse.org/). Subscribe to any of the repositories below to obtain the latest Mono suite releases, including the latest Mono.Zeroconf:

-   [openSUSE Factory](http://download.opensuse.org/repositories/Mono/openSUSE_Factory)
-   [openSUSE 11.1](http://download.opensuse.org/repositories/Mono/openSUSE_11.1)
-   [openSUSE 11.0](http://download.opensuse.org/repositories/Mono/openSUSE_11.0)
-   [openSUSE 10.3](http://download.opensuse.org/repositories/Mono/openSUSE_10.3)
-   [openSUSE 10.2](http://download.opensuse.org/repositories/Mono/openSUSE_10.2)
-   [SUSE Linux 10.1](http://download.opensuse.org/repositories/Mono/SUSE_Linux_10.1)
-   [SUSE Linux Enterprise 10](http://download.opensuse.org/repositories/Mono/SLE_10)
-   [Fedora 8](http://download.opensuse.org/repositories/Mono/Fedora_8)
-   [Fedora 7](http://download.opensuse.org/repositories/Mono/Fedora_7)
-   [Fedora Core 6](http://download.opensuse.org/repositories/Mono/Fedora_Extras_6)
-   [Debian/Testing](http://packages.debian.org/testing/libmono-zeroconf1.0-cil)
-   [Debian/Unstable](http://packages.debian.org/unstable/libmono-zeroconf1.0-cil)

### Git

Mono.Zeroconf can be checked out from [Mono's github repo](https://github.com/mono/Mono.Zeroconf):

    git clone https://github.com/mono/Mono.Zeroconf.git

Documentation
-------------

-   [View online API documentation](http://download.banshee-project.org/mono-zeroconf/docs/)

Things a developer should know
------------------------------

### API Stability

Mono.Zeroconf has been around for a few years, but has gone largely unnoticed outside a few specific projects (namely, Banshee). The project started specifically to target mDNSResponder. Later, support for other providers was added. The primary Mono.Zeroconf API however caters more towards mDNSResponder, though the Avahi implementation is full featured.

While Mono.Zeroconf is functionally complete and stable, the API is currently subject to change. However, it is not expected to change much, if at all.

When Mono.Zeroconf 1.0 is released, the API will be frozen. This should happen fairly soon.

### API coverage of Zeroconf operations

Today Mono.Zeroconf provides an easy to use API that covers the most common operations for Zeroconf networking (Browsing, Publishing, full TXT record support). It works either against Avahi (via the avahi-sharp bindings) or Bonjour on Linux, Windows, and Mac.

It should be noted that Mono.Zeroconf does not support many of the more advanced Zeroconf features that Avahi in particular exposes. It is an intersection of the most common operations supported by both Bonjour and Avahi.

If your application needs advanced Zeroconf features, you most likely will care about the Zeroconf provider that you actually use. Therefore, we do not expect the functionality of Mono.Zeroconf to expand much and the current API is considered stable and complete. We may however add domain enumeration support in the future if it becomes a requested feature.

### Compatibility with .NET

Mono.Zeroconf references only `System` and `System.Web` assemblies. Therefore, it both builds and runs equally as well on Mono and .NET.

Mono.Zeroconf works out of the box on Windows against Bonjour on both Mono and .NET. All Mono.Zeroconf binaries, compiled either with Mono on Linux or Windows, or on Windows with .NET work on any operating system that runs either Mono or .NET and at least Bonjour.

The Avahi provider works on any platform that provides both a working Avahi daemon and the avahi-sharp bindings. The Bonjour provider works on Linux, Windows, and Mac.

### Implementation Details

All Mono.Zeroconf operations are asynchronous. As such, events are how Mono.Zeroconf communicates with applications. Ensure you connect to any necessary events before starting a Zeroconf operation.

**Bad Example** *(never do this)*

``` csharp
ServiceBrowser browser = new ServiceBrowser ();
browser.Browse ();              // Note the order of these two operations
browser.ServiceAdded += ... ;
```

**Good Example** *(always do this)*

``` csharp
ServiceBrowser browser = new ServiceBrowser ();
browser.ServiceAdded += ... ;   // Note the order of these two operations
browser.Browse ();
```

### Known Workarounds

There is a bug in older Mono.Zeroconf releases (0.8.0 and older) that makes it difficult to register services whose port lies outside the range of the `Int16` data type.

The Mono.Zeroconf API defines Port as:

``` csharp
short IRegisterService.Port { get; set; }
```

If you need to use a port value that is greater than `Int16.MaxValue`, you can do the following:

``` csharp
service.Port = unchecked ((short)my_ushort_port_value);
```

Mono.Zeroconf version 0.9.0 addresses this by adding the following API (the existing Port property cannot be changed for API stability reasons):

``` csharp
ushort IRegisterService.UPort { get; set; }
```

Since both `UInt16` and `Int16` are of the same size, the unchecked cast is legal, and internally the high value port will be passed bit-for-bit to the underlying Zeroconf provider.

### Bug Reports and Support

If you run into any issues with Mono.Zeroconf or would like help getting started, the usual Mono support channels including [IRC](/IRC) or an [appropriate mailing list](/Mailing_Lists).

Additionally, if you think you have found a bug in Mono.Zeroconf, please feel free to file it in [Mono's Bugzilla](https://bugzilla.novell.com/enter_bug.cgi?classification=6841&product=Mono%3A+Class+Libraries+&component=Mono.Zeroconf).

How to use it
-------------

First, it should be noted that `mzclient` is a simple command line tool that consumes all APIs in the `Mono.Zeroconf` namespace. This means that mzclient's source code is an excellent, easy to follow, example of how to use Mono.Zeroconf.

-   [View mzclient source code](http://anonsvn.mono-project.com/viewvc/trunk/Mono.Zeroconf/src/MZClient/ZeroconfClient.cs?view=markup)

### Listen for and resolve services

The following example illustrates how to browse for services available on the network:

``` csharp
using Mono.Zeroconf;
...
ServiceBrowser browser = new ServiceBrowser ();
 
//
// Configure the code that will be called back when the information
// becomes available
//
browser.ServiceAdded += delegate (object o, ServiceBrowseEventArgs args) {
    Console.WriteLine ("Found Service: {0}", args.Service.Name);
    args.Service.Resolved += delegate (object o, ServiceResolvedEventArgs args) {
        IResolvableService s = (IResolvableService)args.Service;
        Console.WriteLine ("Resolved Service: {0} - {1}:{2} ({3} TXT record entries)",
            s.FullName, s.HostEntry.AddressList[0], s.Port, s.TxtRecord.Count);
    };
    args.Service.Resolve ();
};
 
//
// Trigger the request
//
browser.Browse ("_daap._tcp", "local");
```

### Publish a service

``` csharp
using Mono.Zeroconf;
...
RegisterService service = new RegisterService ();
service.Name = "Aaron's DAAP Share";
service.RegType = "_daap._tcp";
service.ReplyDomain = "local.";
service.Port = 3689;
 
// TxtRecords are optional
TxtRecord txt_record = new TxtRecord ();
txt_record.Add ("Password", "false");
service.TxtRecord = txt_record;
 
service.Register ();
```

Providers
---------

Mono.Zeroconf supports the concept of *providers*. The core Mono.Zeroconf API is provided by the `Mono.Zeroconf.dll` assembly which is simply a wrapper layer around interfaces that provider assemblies must implement. This core assembly does not actually perform any Zeroconf operations itself.

Provider assemblies (such as `Mono.Zeroconf.Providers.Bonjour.dll`) implement the Mono.Zeroconf API and actually perform the underlying Zeroconf operations described by the API.

Providers are essentially plugins to Mono.Zeroconf and are resolved at runtime in a number of ways (in the following order):

-   Scan for assemblies in the paths specified by the `MONO_ZEROCONF_PROVIDERS` environment variable. Multiple paths may be specified, separated by the standard ':' character.
-   Scan for assemblies in the same directory as the entry assembly.
-   Scan for assemblies in the Global Assembly Cache (GAC).

It is very important to note that the provider factory will perform the following call against all of the directories resolved in the above three steps in order to locate assemblies which may contain a provider:

``` csharp
Directory.GetFiles (directory, "Mono.Zeroconf.Providers.*.dll")
```

Therefore, in order for a provider assembly to be loaded it **must** satisfy the naming convention *Mono.Zeroconf.Providers.\*.dll*. This is to reduce the overhead of loading unnecessary assemblies.

Also, each provider assembly must provide the assembly level attribute, `Mono.Zeroconf.Providers.ZeroconfProviderAttribute`, which informs the provider factory which type in the assembly contains the actual provider implementation details. For example:

``` csharp
[assembly:Mono.Zeroconf.Providers.ZeroconfProvider (
    typeof (Mono.Zeroconf.Providers.Avahi.ZeroconfProvider))]
 
namespace Mono.Zeroconf.Providers.Avahi
{
    public class ZeroconfProvider : IZeroconfProvider
    {
        // Implement IZeroconfProvider
    }
}
```

Finally, when an assembly is loaded by the provider factory and it contains the `ZeroconfProvider` type as outlined above, the type will be instantiated and its `Initialize` method will be executed. The first provider to *not* throw an exception in this method will be used as the provider throughout the lifetime of the process.

Future
------

Mono.Zeroconf includes support for both mDNSResponder and Avahi, though it is possible to write new providers for Mono.Zeroconf, which are just plugins to the Mono.Zeroconf system.

At this time however, we consider Mono.Zeroconf to be API stable and mostly feature complete. The only feature we may consider adding is support for domain enumeration.

