---
layout: docpage
navgroup: docs
title: Mono Project Roadmap
redirect_from:
  - /Mono_Project_Roadmap/
  - /Roadmap/
---

*Last update: November, 2012*

Per-component [Plans]({{ site.github.url }}/docs/about-mono/plans/) are available, you can also check our [Compatibility]({{ site.github.url }}/docs/about-mono/compatibility/) page that gives an overview of what is supported as of the latest public release of Mono.

Versioning
----------

Mono releases are versioned like this:

    MAJOR.MINOR.SUBRELEASE

-   Even-numbered ***MINOR*** releases are stable releases.
-   Odd-numbered ***MINOR*** releases are unstable releases (development/daily builds).
-   ***SUBRELEASE*** indicates a minor update to a specific release.

Current Releases
----------------

<table>
<col width="50%" />
<col width="50%" />
<tbody>
<tr class="odd">
<td align="left"><strong> Mono 2.12</strong></td>
<td align="left"><strong>Released: October 22nd, 2012</strong></td>
</tr>
<tr class="even">
<td align="left"><ul>
<li>C# 5.0 (Unified for all profiles)</li>
<li>IKVM Reflection or Cecil powered C# compiler</li>
<li>SGen: Precise stack scanning</li>
<li>Tuned Parallel Frameworks</li>
<li>Complete .NET 4.5 core support
<ul>
<li>Async APIs in all core libraries</li>
</ul></li>
<li>Tail call optimizations for F#</li>
<li>Ships Microsoft's open sourced stacks:
<ul>
<li>ASP.NET MVC 4</li>
<li>ASP.NET WebPages</li>
<li>Entity Framework</li>
<li>Razor</li>
<li>System.Json (replaces our own)</li>
</ul></li>
</ul>
<p>Features that have already shipped out of band:</p>
<ul>
<li>MonoMac and MonoMac bundler</li>
<li>IronPython, IronRuby and F# bundled with Mono</li>
</ul></td>
<td align="left"><p><a href="{{ site.github.url }}/docs/about-mono/releases/3.0.0/" title="Release Notes Mono 3.0">Mono 3.0 Release Notes</a></p>
<p><br /></p></td>
</tr>
</tbody>
</table>

<table>
<col width="50%" />
<col width="50%" />
<tbody>
<tr class="odd">
<td align="left"><strong> Mono 2.10</strong></td>
<td align="left"><strong>Released: February 15th, 2011</strong></td>
</tr>
<tr class="even">
<td align="left"><p>Major changes (see release notes for details):</p>
<ul>
<li><a href="{{ site.github.url }}/docs/about-mono/releases/2.10.0#google-native-client-support" title="Release Notes Mono 2.10">Google Native Client Support</a></li>
<li><a href="{{ site.github.url }}/docs/about-mono/releases/2.10.0#new-mono-profiler" title="Release Notes Mono 2.10">New Profiler engine</a></li>
<li><a href="{{ site.github.url }}/docs/about-mono/releases/2.10.0#improved-socket-and-async-stack" title="Release Notes Mono 2.10">Faster socket stack</a></li>
<li><a href="{{ site.github.url }}/docs/about-mono/releases/2.10.0#parallel-framework-updates" title="Release Notes Mono 2.10">Improved Parallel Framework</a></li>
<li><a href="{{ site.github.url }}/docs/about-mono/releases/2.10.0#sgen-garbage-collector" title="Release Notes Mono 2.10">SGen Precise Stack Scanning and Many performance improvements</a>.</li>
<li>Unified MonoTouch/Monodroid runtime support</li>
<li><a href="{{ site.github.url }}/docs/about-mono/releases/2.10.0#cecil2flight" title="Release Notes Mono 2.10">Cecil/Light</a></li>
<li><a href="{{ site.github.url }}/docs/about-mono/releases/2.10.0#new-c23-compiler-backend" title="Release Notes Mono 2.10">New C# Compiler backend</a> (can now use any custom mscorlib)</li>
<li><a href="{{ site.github.url }}/docs/about-mono/releases/2.10.0#vb-compiler" title="Release Notes Mono 2.10">VB Compiler</a> can now compile to both 2.0 and 4.0 profiles.</li>
<li><a href="{{ site.github.url }}/docs/about-mono/releases/2.10.0#aspnet-mvc3-support" title="Release Notes Mono 2.10">Supports ASP.NET MVC3</a>, Razor and new WebPages.</li>
<li>New <a href="#webmatrixdata">WebMatrix.Data</a> database API.</li>
<li><a href="{{ site.github.url }}/docs/about-mono/releases/2.10.0#osx-updates" title="Release Notes Mono 2.10">Improved OSX Mono</a></li>
<li><a href="{{ site.github.url }}/docs/about-mono/releases/2.10.0#languages" title="Release Notes Mono 2.10">F#, IronPython and IronRuby</a></li>
</ul></td>
<td align="left"><p><a href="{{ site.github.url }}/docs/about-mono/releases/2.10.0" title="Release Notes Mono 2.10">Mono 2.10 Release Notes</a></p>
<ul>
<li><strong>Feb 15th, 2011:</strong> First 2.10 release</li>
</ul></td>
</tr>
</tbody>
</table>

Upcoming Releases
-----------------

Mono 3.0 will be delivered with incremental updates, as our master branch will remain stable.

For more information see: [http://tirania.org/blog/archive/2011/Oct-14.html](http://tirania.org/blog/archive/2011/Oct-14.html)

<table>
<col width="50%" />
<col width="50%" />
<tbody>
<tr class="odd">
<td align="left"><strong> Mono 3.0</strong></td>
<td align="left"><strong>Planned Release: TBD</strong></td>
</tr>
<tr class="even">
<td align="left"><ul>
<li>New Generational GC becomes the default</li>
</ul></td>
<td align="left"></td>
</tr>
</tbody>
</table>

Subprojects projects
--------------------

Other projects like the [debugger]({{ site.github.url }}/docs/debug+profile/debug/debugger/), the documentation browser, [Java]({{ site.github.url }}/docs/about-mono/languages/java/) integration through IKVM, [Olive]({{ site.github.url }}/archived/Olive "Olive") and [Gtk\#]({{ site.github.url }}/docs/gui/gtksharp/) will remain on their own schedules. This page will be updated to contain that information when it becomes available.

### Mono and Silverlight

See our page on [Moonlight]({{ site.github.url }}/docs/web/moonlight/) for details on the work underway to support Silverlight with Mono.

### Partial Implementations

The following APIs and technologies have partial implementations and are under development.

-   Cardspace/Infocard.

### Unsupported technologies

Some of the .NET technologies have been either deprecated, are too Windows-specific or are very large efforts and our community is unable to produce viable implementations for them.

If someone cares deeply about these APIs and implements them, we would likely bundle them with Mono, but they are not actively being worked on. There might be some code for these on our [SVN]({{ site.github.url }}/community/contributing/source-code-repository/) repository, but the code is not suitable for production use nor do we recommend that developers building cross platform applications depend on it.

Too large stacks:

-   Windows Presentation Foundation

We are not working on any of the following deprecated APIs:

-   System.EnterpriseServices
-   [WSE]({{ site.github.url }}/archived/WSE "WSE") - Extensions to System.Web.Services.
-   Workflow Foundation 3 (WF3)
-   [Code Access Security]({{ site.github.url }}/docs/advanced/cas/) (.NET 1.0).

The following do not map to operating systems other than Windows, and we are unlike going to spend time to support them even on Windows:

-   System.Management

Nobody has shown enough interest in the following:

-   PowerShell

Comments
--------

Feel free to [send us your comments or questions](http://www.go-mono.com/contact/) about the roadmap.

Roadmap History
---------------

For our previous roadmap information, please see [Roadmap History]({{ site.github.url }}/archived/Roadmap_History "Roadmap History").

