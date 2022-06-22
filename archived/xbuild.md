---
title: xbuild
redirect_from:
  - /Microsoft.Build/
  - /Xbuild/
  - /docs/tools+libraries/tools/xbuild/
---

Microsoft Build (msbuild) is a build system developed by Microsoft similar in spirit to Nant (in that it uses XML files for describing the build process) and in the same spirit as **make**.

Projects created in Visual Studio 2005 (except VC++2005) are saved in MSBuild format.

**xbuild** is Mono's implementation of msbuild and it allows projects that have an msbuild file to be compiled natively on Linux. xbuild has been part of the standard Mono distribution for some time now, but it is not 100% complete yet.

xbuild supports C# and VB.NET projects out of the box. It also supports ASP.NET Projects, both WebApplication and WebSite projects. It also supports custom tasks, targets, extension of the build system through Before/After\* hooks (eg. Before/AfterBuild) and \*DependsOn properties (eg. BuildDependsOn).

For a project file to work with xbuild, it should have a target called "Build". xbuild doesn't restrict based on project types. So, if you have custom project types, or projects for a language that xbuild doesn't know about, it can still work as long as you have the relevant targets defined.

You can see some tips for [Porting MSBuild Projects To XBuild](/archived/porting_msbuild_projects_to_xbuild).

TODO List
=========

-   ItemDefinitionGroup
-   Item/PropertyGroups in targets

-   Parallel builds

Limitations
===========

-   COM References in the project files are ignored
-   VC++, Setup and Deployment (.vdproj) projects are not supported

Notes
=====

-   To get the project file generated from a solution file (.sln), set the environment variable *XBUILD_EMIT_SOLUTION*.
-   The **Exec** task, writes the commands to a temporary file, and executes that with "cmd.exe /q /c" on Windows and "sh" on other platforms. This applies to the Pre and PostBuildEvents in the project files.
-   Usually, dependencies for references are also resolved, like assemblies referenced by a reference itself. But incase an assembly gets resolved via pkg-config, then its dependencies are **not** resolved.
