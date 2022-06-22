---
title: "ASP.NET Modules"
lastmodified: '2008-06-25'
redirect_from:
  - /ASP.NET_Modules/
---

ASP.NET Modules
===============

Mono provides support for **gzip** encoding and **basic and digest authentication** in *xsp* as modules. These can be used with *mod_mono* too, but as apache already has modules to do that, they are less useful.

The modules are in the Mono.Http.dll assembly distributed with mono.

Enabling gzip compression in xsp
--------------------------------

Add the following inside \<configuration\>...\</configuration\> in your web.config:

``` xml
<!-- This enables parsing the mono.aspnet section that follows -->
<configSections>
  <sectionGroup name="mono.aspnet">
     <section name="acceptEncoding"
              type="Mono.Http.Configuration.AcceptEncodingSectionHandler, Mono.Http, Version=1.0.5000.0, PublicKeyToken=0738eb9f132ed756"/>
  </sectionGroup>
</configSections>
<httpModules>
  <add name="AcceptEncodingModule"
       type="Mono.Http.Modules.AcceptEncodingModule, Mono.Http, Version=1.0.5000.0, PublicKeyToken=0738eb9f132ed756"/>
</httpModules>
 
<mono.aspnet>
  <acceptEncoding>
  <!-- Change disabled to 'no' to enable gzip content encoding
       By default it is disabled. -->
    <add encoding="gzip"
         type="Mono.Http.GZipWriteFilter, Mono.Http, Version=1.0.5000.0, PublicKeyToken=0738eb9f132ed756"
         disabled="no" />
  </acceptEncoding>
</mono.aspnet>
```

And that's it. It will load Mono.Http.dll from the [GAC](/Assemblies_and_the_GAC) and send compressed responses when the client supports it.

Basic and Digest authenticaton
------------------------------

Mono also provides support for [Basic and Digest authentication](http://www.ietf.org/rfc/rfc2617.txt).

Both modules get their user list from a XML file that looks like:

``` xml
<?xml version="1.0" encoding="utf-8"?>
<users>
<user name="gonzalo" password="password">
    <role name="user" />
</user>
</users>
```

They both need to get the file name containing the users and the realm from the configuration. This is configurable using \<appSettings\> in your web.config file. The following example is valid for **basic** authentication. Replace "Basic" with "Digest" and you'll get the equivalent **digest** configuration:

``` xml
<appSettings>
  <add key="Basic.Users" value="/srv/userdata/users.xml" />
  <add key="Basic.Realm" value="My Realm" />
</appSettings>
```

Now we need to enable the corresponding module. This is done by adding the following line inside \<httpModules\>...\</httpModules\> in your web.config file:

``` xml
<add name="BasicAuthenticationModule"
     type="Mono.Http.Modules.BasicAuthenticationModule, Mono.Http, Version=1.0.5000.0, PublicKeyToken=0738eb9f132ed756"/>
```

Again, replace "Basic" with "Digest" and you'll get the configuration for digest authentication.
