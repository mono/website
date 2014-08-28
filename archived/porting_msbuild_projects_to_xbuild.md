---
title: "Porting MSBuild Projects To XBuild"
lastmodified: '2014-04-18'
redirect_from:
  - /Porting_MSBuild_Projects_To_XBuild/
---

Porting MSBuild Projects To XBuild
==================================

This will be updated as I also figure these things out. There shouldn't be a whole lot of "porting" required, but these tips can make it easier to share the same project files between msbuild and xbuild.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#paths">1 Paths</a></li>
<li><a href="#casing">2 Casing</a></li>
<li><a href="#platform-specific-items">3 Platform specific items</a></li>
<li><a href="#prepostbuildevents">4 Pre/PostBuildEvents</a></li>
</ul></td>
</tr>
</tbody>
</table>

Paths
-----

You should continue to use windows style paths in the msbuild project files. They'll be converted, if required, by xbuild.

Casing
------

Linux has case-sensitive filenames, so, the project files should have the correct case for file and directory names. As a temporary workaround, you could run xbuild with the environment variable "MONO_IOMAP=case"

``` bash
     $ MONO_IOMAP=case xbuild foo.sln
```

This might be problematic in some situations, like the OutputPath for a project says "bin", but the disk has directory called "Bin", then xbuild will use the former.

Platform specific items
-----------------------

Sometimes you'll have items that are platform specific, for example, reference to an assembly that is available only on windows or one that is required only on linux. In such cases, you can make those items/properties/references conditional. Eg.:

``` xml
   <Reference Include="Windows.Specific.dll" Condition=" '$(OS)' != 'Unix' "/>
   <Reference Include="NonWindows.Specific.dll" Condition=" '$(OS)' == 'Unix' "/>
```

The default environment variable 'OS' is set to "Windows_NT" on all currently supported versions on Windows. xbuild sets this to "Unix" on non-Windows platforms, even on MacOS.

Pre/PostBuildEvents
-------------------

These events contain shell commands to be run before or after a build. They are executed using the shell, cmd.exe on Windows and typically sh on Unix. Shell command for Windows won't run on Linux or Mac, but to solve this, you could add more conditional Pre/PostBuildEvents, like:

``` xml
   <PreBuildEvent Condition=" '$(OS)' == 'Unix' ">cp foo.txt $(OutDir)/foo.txt</PreBuildEvent>
   <PreBuildEvent Condition=" '$(OS)' != 'Unix' ">copy foo.txt $(OutDir)\foo.txt</PreBuildEvent>
```

The condition could be based on the Configuration also, for example you could create a new "Unix" configuration.

Another, way of doing this could be to use the Before/AfterBuild targets, with which you can use the built-in tasks, like "Copy", "MakeDir" etc, so no problem with portability. Eg:

``` xml
 <Target Name="BeforeBuild">
          <Copy SourceFiles="foo.txt" DestinationFolder="$(OutDir)" />
 </Target>
```

For commands that have no corresponding tasks available and you don't want to write a custom task for them, you can use the 'Exec' task, which invokes the specified 'Command' using the shell.

``` xml
 <Target Name="AfterBuild">
          <Exec Command="foo.exe arg1 arg2" Condition=" '$(OS)' == 'Windows_NT' " />
 </Target>
```

