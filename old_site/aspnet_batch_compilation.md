---
layout: obsolete
title: "ASP.NET Batch Compilation"
permalink: /old_site/ASP.NET_Batch_Compilation/
redirect_from:
  - /ASP.NET_Batch_Compilation/
---

ASP.NET Batch Compilation
=========================

**Note: this document applies to Mono from SVN starting from revision 96982 or Mono 2.0 and newer**

What is it?
===========

Mono 1.9 will ship with support for batch compilation of the ASP.NET applications. Batch compilation is a process in which the ASP.NET runtime, when a virtual path of a site is visited, collects several files of the same type into one "batch" and compiles them into a single assembly. This is in contrast to the old, .NET 1.x, way of compiling ASP.NET applications in which every file would be compiled into a separate assembly.

The purpose of this article is to introduce the users to a slight difference between the MS.NET and Mono implementations. The difference lies in the way Mono selects the files for batch compilation. Whenever it builds a list of files to compile, it consults the contents of two Mono-specific AppSettings entries:

 **MonoAspnetBatchCompileIgnorePaths**  
contains a comma-separated list of **virtual** paths of virtual paths which are to be ignored when batch-building.

 **MonoAspnetBatchCompileFromFile**  
contains a virtual path of a file which contains, one per line, a list of virtual paths which are to be ignored when batch-building.

The paths from both sources are merged, duplicate entries are silently ignored.

Why is it useful?
=================

Ability to ignore certain files may be useful when your application contains files that will compile fine on Microsoft .NET but will fail, for some reason, under Mono.

An example of such application is MojoPortal - it contains several user controls (.ascx files) and pages which utilize features not available on Mono/Unix (like WebParts, COM+ bindings). Without support for ignoring the files, batch compile would fail with an error.

Examples
========

An example of a Web.config file which shows how to use the settings:

``` xml
<?xml version="1.0"?>
<configuration>
  <appSettings>
     <add key="MonoAspnetBatchCompileIgnorePaths" value="~/SomeFile.aspx,~/Controls/SomeOtherFile.ascx"/>
     <add key="MonoAspnetBatchCompileFromFile" value="~/ignorePaths.conf"/>
  </appSettings>
</configuration>
```

The `~/ignorePaths.conf` file, located at the root of the aplication, may contain:

    /SomeFileToIgnore.ascx
    ~/SubDir/IgnoreThisFile.aspx

