---
layout: obsolete
title: "Config system.web"
lastmodified: '2008-06-25'
permalink: /archived/Config_system.web/
redirect_from:
  - /Config_system.web/
  - /System.Web_configuration/
---

Config system.web
=================

The \<system.web\> section is a component of the [configuration]({{ site.github.url }}/Config "Config") of an application. Usually part of the Web.config application that can be used to configure the various components of the System.Web assembly.

It can appear inside a \<configuration\> section or inside a \<location\> section. If it is found alone, it will apply to all the urls accessed by System.Web:

``` xml
<?xml version="1.0" encoding="utf-8"?>
<configuration>
    <system.web>
    ...............
    </system.web>
</configuration>
```

More than one Web.config can exist for different parts of the application, you can have one per directory. The load order is like this:

-   First, global settings from machine.config are loaded
-   Second, the top-level settings from the application root are loaded, new settings overwrite old settings.
-   For each nested directory, the new settings are loaded for that particular url.

Assuming that your application toplevel virtual directory is /app, this means that /app/index.aspx will get the settings from machine.config plus any settings set in the /app/Web.config file; the file /app/demo/index.aspx will get the settings from machine.config plus any settings that might exist in /app/Web.config and then any settings that might exist in /app/demo/Web.config.

If you want it to apply to only one set of pages, you can nest this inside a \<location\> section. The following example requires that the user is authenticated before they can access the edit.aspx file:

``` xml
<?xml version="1.0" encoding="utf-8"?>
<configuration>
    <location path="edit.aspx">
        <system.web>
            <authorization>
                <deny users="?" />
            </authorization>
        </system.web>
    </location>
</configuration>
```

Child elements
--------------

The following child elements can be used to configure different modules of System.Web:

-   [\<authentication\>]({{ site.github.url }}/Config_system.web_authentication "Config system.web authentication")
-   [\<authorization\>]({{ site.github.url }}/Config_system.web_authorization "Config system.web authorization")
-   [\<customErrors\>]({{ site.github.url }}/Config_system.web_customErrors "Config system.web customErrors")
-   [\<globalization\>]({{ site.github.url }}/Config_system.web_globalization "Config system.web globalization")
-   [\<pages\>]({{ site.github.url }}/Config_system.web_pages "Config system.web pages")

Other settings
==============

When you use the Mono.Http assembly, there is a set of configuration options that can be used. These are part of the \<mono.aspnet\> space, for details see the [ASP.NET Modules]({{ site.github.url }}/ASP.NET_Modules "ASP.NET Modules") page.

