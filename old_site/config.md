---
layout: obsolete
title: "Config"
lastmodified: '2007-10-26'
permalink: /old_site/Config/
redirect_from:
  - /Config/
---

Config
======

Mono uses configuration files in a few places, the following sections describe what you can use and where.

Configuration files can appear in two places, as a way of configuring assemblies or when using ASP.NET applications.

To configure assemblies, you create a file with the extension .config containing the configuration elements that you want for your assembly. For example, if you want to configure the program "hello.exe" you would create a "hello.exe.config" file. This is not limited to executables, you can also configure libraries, for example "library.dll" and "library.dll.config".

With ASP.NET applications since there are no assemblies per-se to configure, the configuration lives on the file "web.config" or "Web.config". These configuration files work on a per-directory basis, so you can have different configuration parameters for different parts of your web application.

The configuration file is an XML file whose root element is \<configuration\>.

Subelements:

``` xml
<configuration>
   <system.web>...</system.web>
   <system.net>...</system.net>
</configuration>
```

For more information, see:

-   [Config system.web]({{ site.github.url }}/old_site/Config_system.web "Config system.web").
-   [Config system.net]({{ site.github.url }}/old_site/Config_system.net "Config system.net").

The documentation on this site is not complete, but it documents some Mono-specific configuration options, the following elements can be nested inside the \<configuration\> section:

-   [\<dllmap\>]({{ site.github.url }}/old_site/Config_DllMap "Config DllMap") - Mapping Libraries.

\<compilation\>
---------------

Use the \<compilation\> setting inside the \<configuration\> section to control whether debug information must be generated when invoking the compiler.

For example, you could put this in your web.config file for your ASP.NET pages to get debugging symbols for compiler generated code:

``` xml
<configuration>
      <compilation debug="true" />
</configuration>
```

