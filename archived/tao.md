---
title: "Tao"
lastmodified: '2010-09-11'
redirect_from:
  - /Tao/
---

Tao
===

The Tao website is now located at : [http://sourceforge.net/projects/taoframework/](http://sourceforge.net/projects/taoframework/)

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#availability">1 Availability</a>
<ul>
<li><a href="#release-2-nov-2005">1.1 1.2.0 Release (2 Nov 2005)</a></li>
<li><a href="#svn">1.2 SVN</a></li>
<li><a href="#tao--autotools">1.3 Tao + autotools</a></li>
</ul></li>
<li><a href="#building-tao">2 Building Tao</a></li>
<li><a href="#mailing-list">3 Mailing List</a></li>
<li><a href="#the-tao-framework-for-mono-and-net">4 The Tao Framework for Mono and .NET.</a></li>
<li><a href="#developersmaintainers">5 Developers/Maintainers</a></li>
<li><a href="#plans">6 Plans</a>
<ul>
<li><a href="#future-plans">6.1 Future Plans</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Availability
============

1.2.0 Release (2 Nov 2005)
--------------------------

The 1.2.0 release has support for all known OpenGL extensions at this time, as well as extensive improvements to Tao.Sdl and Tao.Ode. The mono and .NET builds are not yet interchangeable; please download a specific build for either the mono runtime or the win32 .NET runtime.

-   [Tao-1.2.0-2-mono.zip](http://www.go-mono.com/tao/1.2.0/Tao-1.2.0-2-mono.zip)
-   [Tao-1.2.0-2-win32.zip](http://www.go-mono.com/tao/1.2.0/Tao-1.2.0-2-win32.zip)
-   [Tao-1.2.0-2-win32-Setup.exe](http://www.go-mono.com/tao/1.2.0/Tao-1.2.0-2-win32-Setup.exe)

Please direct all problems and questions to the [Tao Support](http://sourceforge.net/projects/taoframework/support/)

[Tao mailing list](http://galactus.ximian.com/pipermail/tao-list/).

SVN
---

You can also get the latest code from SVN via [AnonSVN](/SourceCodeRepository) or [browse the sources](http://anonsvn.mono-project.com/viewvc/trunk/tao/).

Tao + autotools
---------------

[Tao autotools](/Tao_autotools) has been superceeded by the addition of autotools build system generation to [Prebuild](/Prebuild). Autotools is one of the build system targets supported by Tao and other Prebuild-based packages.

Building Tao
============

1.  Download the latest copy of Tao from SVN.
2.  Make sure Mono or the .NET Framwork is installed.
3.  If you are using Windows, you must install [Cygwin](http://www.cygwin.com) to get the proper build tools. Make sure the build tools are in your path.
4.  At a command prompt, type "make" to build a non-strong-named set of assemblies.
5.  For a strong-named assembly, type 'make STRONG=1'.
6.  To clean the project, type 'make clean'. You must do this before doing a 'make' or 'make STRONG=1' because some post-processed assemblies require cleanup.
7.  If you have [NDoc](http://ndoc.sourceforge.net) on your path you can type, 'make docs' to create MSDN style documentation.

Mailing List
============

You can [subcribe](http://galactus.ximian.com/mailman/listinfo/tao-list) to the mailing list.

[Archives](http://galactus.ximian.com/pipermail/tao-list/)

[Search the mailing list archives](http://www.google.com/search?hl=en&q=site%3Agalactus.ximian.com+Tao)

The Tao Framework for Mono and .NET
===================================

The Tao Framework is a collection of bindings and libraries to facilitate cross-platform games-related development utilizing the Mono and .NET platforms.

Currently supported are:

-   Cg - [[Cg website](http://developer.nvidia.com/page/cg_main.html)]
-   DevIL - [[DevIl website](http://openil.sourceforge.net)]
-   FreeGLUT - [[FreeGlut website](http://freeglut.sourceforge.net)]
-   GLFW - [[GLFW website](http://glfw.sourceforge.net/)]
-   GLU
-   ODE - [[ODE website](http://www.ode.org/)]
-   OpenAL - [[OpenAL website](http://openal.org/)]
-   OpenGL - [[OpenGL website](http://opengl.org/)]
-   PhysicsFS - [[PhysicsFS website](http://icculus.org/physfs/)]
-   SDL - [[Sdl Website](http://www.libsdl.org)]
-   WGL

 These libraries all run cross-platform and cross-runtime using Microsoft's .NET Runtime on Windows and Mono on Windows and non-Windows platforms.

Other runtimes have not been tested, but will most likely work. The libraries are also CLS-compliant, they can be used by any .NET language, including both C# and Visual Basic .NET, amongst others.

Use our [Anonymous SVN repository](/SourceCodeRepository) to download it. The module name is \`tao'.

You can browse the source at <http://anonsvn.mono-project.com/viewcvs/trunk/tao/>

Developers/Maintainers
======================

-   Randy Ridge (original author, "I'm not dead yet")
-   Vladimir Vukicevic (current maintainer)
-   Dave Hudson (Tao.Sdl)
-   Terry Triplett (Tao.Ode)
-   Rob Loach (Tao.PhysFs)
-   *If you're a maintainer of one of the Tao packages, please add yourself to this list, or send mail to the mailing list so I can add you here!*

Plans
=====

-   [Future Plans](/Tao:FuturePlans) -- notes about upcoming changes to Tao

Future Plans
------------

For the time being Vlad will be maintaining the Tao Framework while I get caught up on work... Fun stuff ahead. -- Ridge

