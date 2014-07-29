---
layout: obsolete
title: "Config system.web customErrors"
lastmodified: '2008-06-25'
permalink: /archived/Config_system.web_customErrors/
redirect_from:
  - /Config_system.web_customErrors/
---

Config system.web customErrors
==============================

Use the customErrors attribute to configure how errors must be presented

An example of this [\<system.web\>]({{ site.github.url }}/Config_system.web "Config system.web") section is:

``` xml
<customErrors mode="On|Off|RemoteOnly" defaultRedirect="somepage.aspx">
  <error statusCode="400" redirect="error400.aspx" />
  ...
</customErrors>
```

*mode* specifies if this setting is enabled for every request (On), enabled for remote requests only (RemoteOnly) or disabled.

The default is **RemoteOnly**

*defaultRedirect* is the redirection sent when no explicit \<error\> exists for a given error status code.

