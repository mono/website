---
title: "ASP.NET and mod mono"
lastmodified: '2006-02-26'
redirect_from:
  - /ASP.NET_and_mod_mono/
---

ASP.NET and mod mono
====================

Using Mono, you can build ASP web applications using Linux or Windows without losing the flexibility and power of Apache. Mono's ASP.NET implementation has two major components:

-   XSP is a simple, standalone webserver written in C# that hosts ASP.NET's System.Web classes.

-   [mod_mono](/Mod_mono) is an Apache 1.3/2.0/2.2 module that integrates Mono's ASP.NET support with the Apache HTTP server.

These tools allow you to build an infrastructure for web applications (code for which the primary interface is pointing and clicking on a webpage) and for [web services](/Web_Services) (SOAP-based RPC systems). They work with many publicly-available .NET applications, and the underlying web services stack is used in several commercial applications.

If you want to write your own webserver, the class libraries will support this, though that is an advanced topic out of the scope of this document.

For more information, see [ASP.NET](/ASP.NET).

