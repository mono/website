---
layout: obsolete
title: "Config system.net"
lastmodified: '2006-12-27'
permalink: /archived/Config_system.net/
redirect_from:
  - /Config_system.net/
---

Config system.net
=================

The \<system.net\> child of \<configuration\> section in machine.config, or the application or assembly .config file is used to configure the System.Net namespace.

Syntax:

``` xml
<configuration>
  <system.net>
     <connectionManagement>
       ...
     </connectionManagement>
  </system.net>
</configuration>
```

\<connectionManagement\>
------------------------

The **connectionManagement** section is used to configure the [http:/monodoc/T:System.Net.ServicePointManager ServicePointManager] class, which is used by [http:/monodoc/T:System.Net.WebClient System.Net.WebClient] to manage its connections.

Inside a connectionManagement section, you can have the following tags:

``` xml
<connectionManagement>
  <add name="address" maxconnection="NN"/>
</connectionManagement>
```

Where the **address** is the host name, or the wildcard "\*" to apply to all connections. And maxconnection is the maximum number of open connections on that host.

Alternatively an application can change that setting by setting the [http:/monodoc/P:System.Net.ServicePointManager.DefaultConnectionLimit DefaultConnectionLimit] value in the [http:/monodoc/T:System.Net.ServicePointManager ServicePointManager].

