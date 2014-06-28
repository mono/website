---
layout: obsolete
title: "Mono For .Net Developers"
lastmodified: '2013-01-19'
permalink: /old_site/Mono_For_.Net_Developers/
redirect_from:
  - /Mono_For_.Net_Developers/
---

Mono For .Net Developers
========================

**This article is incomplete, please add to it.**

Beginning with Mono
-------------------

<table>
<col width="50%" />
<col width="50%" />
<tbody>
<tr class="odd">
<td align="left"><p>You've got a great .Net application, and now you, or your boss, or your customer wants it to run on Linux. That's what Mono can help you do. Mono is a cross-platform implementation of the pieces that make up the .Net framework, like the CLR, C#/VB.Net compilers, and the base class libraries.</p>
<p>Currently, Mono supports just about everything available in .Net 2.0. There are a few notable exceptions, like Windows.Forms' DataGridView and ASP.Net's WebParts. There are also a couple of namespaces that don't really have a Linux equivalent like EnterpriseServices, System.Management, and System.Messaging.</p>
<p>So the first step is to determine how much of your application Mono supports. There is a tool that helps you determine this called the Mono Migration Analyzer (Moma). For now, you don't need to worry about running Mono, just download Moma and run it with .Net. Select the assemblies (.exe's and .dll's) to your application, and Moma will tell you which classes, methods, etc. your application uses that Mono may not fully support. This should give you an idea of how easy or hard it is going to be to get your application running with Mono.</p></td>
<td align="left"><p><strong>Mono Migration Analyzer (Moma)</strong></p>
<p>Moma scans your application for compatibility with Mono, and reports potential issues. It does not require Mono to be installed, so it is a great place to start.</p>
<p><a href="{{ site.github.url }}/old_site/MoMA" title="MoMA">Moma Home Page</a></p></td>
</tr>
</tbody>
</table>

Getting Mono
------------

<table>
<col width="50%" />
<col width="50%" />
<tbody>
<tr class="odd">
<td align="left"><p>Once you've decided to pursue porting your application to Mono, the next step is to download and install Mono. There are several options available for doing this.</p>
<ul>
<li>If you are familiar with Windows, and don't really know much about Linux, you may want to start by downloading Mono for Windows. Starting with Mono on Windows lets you ease into working with Mono, and allows you to fix the issues caused by differences between Mono and the .Net framework before tackling issues caused by differences between Linux and Windows.</li>
</ul>
<ul>
<li>If you have Linux up and running and need Mono, we offer packages for a couple of Linux distributions on our download page. For other distributions, you will need to get packages from your distributor or compile Mono yourself.</li>
</ul>
<ul>
<li>If you need a Linux distribution that is good for working with Mono, we suggest <a href="http://www.opensuse.org/">openSUSE 11.4</a>. Mono will of course work on just about any Linux distribution, but openSUSE might be an easy one to start with because we release and maintain Mono packages for it.</li>
</ul></td>
<td align="left"><p><strong>Mono Download Page</strong></p>
<p>The Mono download page offers the latest version of Mono for Windows, OSX, and several distributions of Linux.</p>
<p><a href="{{ site.github.url }}/old_site/Downloads" title="Downloads">Mono Download Page</a></p></td>
</tr>
</tbody>
</table>

Running Mono
------------

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><p>Regardless of whether you installed Mono on Linux or Windows, using it is pretty much the same.</p>
<p><strong>For Windows - .Net Executables:</strong></p>
<ul>
<li>Find &quot;Mono-X.X Command Prompt&quot; in your start menu and run it. Navigate to the directory containing your application, and run:</li>
</ul>
<pre><code>mono myApp.exe</code></pre>
<p><strong>For Windows - ASP.Net Applications:</strong></p>
<ul>
<li>TODO</li>
</ul>
<p><strong>For Linux - .Net Executables:</strong></p>
<ul>
<li>Copy your compiled executables over to your Linux machine/image. Open a terminal prompt, navigate to the directory containing your application, and run:</li>
</ul>
<pre class="bash" style="font-family:monospace;"><code>mono myApp.exe</code></pre>
<p><strong>For Linux - ASP.Net Applications:</strong></p>
<ul>
<li>TODO</li>
</ul>
<p>With the ability to launch your application with Mono, you can now see how well it works, and what issues you may need to work on to get it fully supported on Mono.</p></td>
</tr>
</tbody>
</table>

Tools
-----

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><p>There are several tools available to make development with Mono easier.</p>
<p><strong>MonoDevelop</strong></p>
<p>MonoDevelop is a full featured IDE for Mono written in Mono that runs on Linux and Mac. It provides all the standard IDE functions like code completion, class management, built-in help, support for many types of projects, and a powerful add-in engine. It has seemless support for opening Visual Studio solution and project files. While it has a great GTK# designer, it does not currently have a Windows.Forms or ASP.Net designer. If you need them, you are probably better off using SharpDevelop or Visual Studio on Windows.</p>
<p><a href="http://www.monodevelop.com/">MonoDevelop homepage</a></p></td>
</tr>
</tbody>
</table>

More Resources
--------------

<table>
<col width="33%" />
<col width="33%" />
<col width="33%" />
<tbody>
<tr class="odd">
<td align="left"><p><strong>Mono Start Page</strong></p>
<p>The Mono start page offers some of the same information available here, as well as links to many in-depth articles and guides that can help you work with Mono.</p>
<p><a href="{{ site.github.url }}/old_site/Start" title="Start">Mono Start Page</a></p></td>
<td align="left"></td>
<td align="left"><p><strong>Mailing Lists</strong></p>
<p>The Mono mailing lists are a great way to get support for any trouble you may run into. There are many experienced people on the lists who can give you tips and help.</p>
<p><a href="{{ site.github.url }}/old_site/Mailing_Lists" title="Mailing Lists">Mono Mailing Lists</a></p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>Mono Bugzilla</strong></p>
<p>If you run into a bug in any part of Mono, please let us know about it so we can fix it.</p>
<p><a href="{{ site.github.url }}/old_site/Bugs" title="Bugs">Mono Bugzilla</a></p></td>
<td align="left"></td>
<td align="left"><p><strong>Chat Rooms</strong></p>
<p>For real time help, there are several IRC chat rooms available that deal with Mono.</p>
<p><a href="{{ site.github.url }}/old_site/IRC" title="IRC">Mono Chat Rooms</a></p></td>
</tr>
</tbody>
</table>



