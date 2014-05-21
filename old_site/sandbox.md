---
layout: obsolete
title: "Sandbox"
lastmodified: '2008-12-03'
permalink: /old_site/Sandbox/
redirect_from:
  - /Sandbox/
---

Sandbox
=======

Compiling Mono
--------------

Note: This describes how to compile and install Mono from its source code. If you are only interested in running Mono, you probably want to install Mono from packages, which have been tested. See the [download page]({{site.github.url}}/old_site/Downloads "Downloads") for packages.

<table>
<col width="33%" />
<col width="33%" />
<col width="33%" />
<tbody>
<tr class="odd">
<td align="left"><table>
<tbody>
<tr class="odd">
<td align="left"><a href="{{site.github.url}}/files/6/6c/Linux.png">http://mono-project.com/files/6/6c/Linux.png</a></td>
<td align="left"><a href="{{site.github.url}}/old_site/Mod_mono" title="Mod mono">Compiling from a Tarball</a> <br /> <em>Guide to compiling Mono from a tarball.</em></td>
</tr>
<tr class="even">
<td align="left"><a href="{{site.github.url}}/files/6/6c/Linux.png">http://mono-project.com/files/6/6c/Linux.png</a></td>
<td align="left"><a href="{{site.github.url}}/old_site/Guide:_Porting_ASP.NET_Applications" title="Guide: Porting ASP.NET Applications">Compiling from SVN</a> <br /> <em>Guide to compiling Mono from SVN.</em></td>
</tr>
<tr class="odd">
<td align="left"><a href="{{site.github.url}}/files/d/d9/Vista.png">http://mono-project.com/files/d/d9/Vista.png</a></td>
<td align="left"><a href="{{site.github.url}}/old_site/Writing_a_WebService" title="Writing a WebService">Compiling for Windows</a> <br /> <em>Guide to compiling Mono on Windows.</em></td>
</tr>
<tr class="even">
<td align="left"><a href="{{site.github.url}}/files/d/d9/Vista.png">http://mono-project.com/files/d/d9/Vista.png</a></td>
<td align="left"><a href="{{site.github.url}}/old_site/Writing_a_WebService" title="Writing a WebService">Cross-compiling for Windows</a> <br /> <em>Guide to compiling Mono on Linux to run on Windows.</em></td>
</tr>
<tr class="odd">
<td align="left"><a href="{{site.github.url}}/files/7/7d/Apple.png">http://mono-project.com/files/7/7d/Apple.png</a></td>
<td align="left"><a href="{{site.github.url}}/old_site/Database_Access" title="Database Access">Compiling for OS X</a> <br /> <em>Guide to compiling Mono on OSX.</em></td>
</tr>
</tbody>
</table></td>
<td align="left"><table>
<tbody>
<tr class="odd">
<td align="left"><a href="{{site.github.url}}/old_site/Mod_mono" title="Mod mono">Supported Advanced Features</a> <br /> <em>Guide for some advanced Mono compile-time features.</em></td>
</tr>
<tr class="even">
<td align="left"><a href="{{site.github.url}}/old_site/Guide:_Porting_ASP.NET_Applications" title="Guide: Porting ASP.NET Applications">Unsupported Advanced Features</a> <br /> <em>Guide for some advanced <strong>unsupported</strong> Mono compile-time features.</em></td>
</tr>
<tr class="odd">
<td align="left"><a href="{{site.github.url}}/old_site/Writing_a_WebService" title="Writing a WebService">Compiling Mono 1.0.x from SVN</a> <br /> <em>Mono 1.0.x had a different build system. Historical guide for building Mono 1.0.x.</em></td>
</tr>
<tr class="even">
<td align="left"><a href="{{site.github.url}}/old_site/Writing_a_WebService" title="Writing a WebService">Compiling Gtk#</a> <br /> <em>Guide to compiling Gtk#.</em></td>
</tr>
</tbody>
</table></td>
<td align="left"></td>
</tr>
</tbody>
</table>

Mono Software Catalog - ASP.Net
-------------------------------

Some software available for download that runs on Mono. These are available on the openSUSE build service, and though we package some of them, **they are not supported by us**.

<table>
<col width="33%" />
<col width="33%" />
<col width="33%" />
<tbody>
<tr class="odd">
<td align="left"><a href="http://www.jpobst.com/mojo.png">http://www.jpobst.com/mojo.png</a></td>
<td align="left"><p><strong>MojoPortal</strong><br /> Homepage: <a href="http://www.mojoportal.com/">http://www.mojoportal.com/</a> <br /><br /> mojoPortal is an open source web site framework and content management system written in C# that runs under ASP.NET on Windows or under Mono on Linux or Mac OS X.</p></td>
<td align="left">openSUSE 10.3:<br /><a href="http://www.jpobst.com/1click.png">http://www.jpobst.com/1click.png</a> <br /><br /><a href="http://download.opensuse.org/repositories/Mono:/Community/">Other Platforms</a></td>
</tr>
</tbody>
</table>

<table>
<col width="33%" />
<col width="33%" />
<col width="33%" />
<tbody>
<tr class="odd">
<td align="left"><a href="http://www.jpobst.com/blog.png">http://www.jpobst.com/blog.png</a></td>
<td align="left"><p><strong>ASP.Net Blog Starter Kit</strong><br /> Homepage: <a href="http://asp.net/downloads/starter-kits/blog-engine/">http://asp.net/downloads/starter-kits/blog-engine/</a> <br /><br /> BlogEngine.NET is a full-featured blogging platform that is a breeze to set up, customize, and use. BlogEngine.NET works with your choice of data source; you may use SQL Server, or you may take the plug’n’play approach using XML files.</p></td>
<td align="left">openSUSE 10.3:<br /><a href="http://www.jpobst.com/1click.png">http://www.jpobst.com/1click.png</a> <br /><br /><a href="http://download.opensuse.org/repositories/Mono:/Community/">Other Platforms</a></td>
</tr>
</tbody>
</table>

etc. etc. etc.

Downloads Page Stopgap
----------------------

According to [wikipedia documentation](http://meta.wikimedia.org/wiki/Help:Link#Arrow_icon), we can get rid of the little external link icons by adding the following to our CSS:

    /* this can be used in the content area to switch off
    special external link styling */
    #bodyContent .plainlinks a {
        background: none !important;
        padding: 0 !important;
    }

and then wrapping the links in:

    <span class="plainlinks">

(this won't take them off the rest of the site)

This layout is more compact, and allows the user to click the icon or the link, which will help until we get a custom javascript driven one.

**Source Code**

[http://www.mono-project.com/files/e/e9/Mono\_icon\_source.gif](http://go-mono.com/sources-stable)
 [Source](http://go-mono.com/sources-stable)

**VMWare Virtual Image**
Mono 1.2.5.1 on openSUSE 10.2

[http://www.mono-project.com/files/d/dd/Mono\_icon\_suse.gif](http://anonsvn.mono-project.com/mono1.2.5.1_opensuse10.2_vmware_0.zip.torrent)
 [Torrent](http://anonsvn.mono-project.com/mono1.2.5.1_opensuse10.2_vmware_0.zip.torrent)

[http://www.mono-project.com/files/d/dd/Mono\_icon\_suse.gif](http://anonsvn.mono-project.com/mono1.2.5.1_opensuse10.2_vmware_0.zip)
 [HTTP](http://anonsvn.mono-project.com/mono1.2.5.1_opensuse10.2_vmware_0.zip)

**Windows**
Windows 2000 and above

[http://www.mono-project.com/files/0/00/Mono\_icon\_windows.gif](ftp://www.go-mono.com/archive/1.2.6/windows-installer/4/mono-1.2.6-gtksharp-2.10.2-win32-4.exe)
 [Installer](ftp://www.go-mono.com/archive/1.2.6/windows-installer/4/mono-1.2.6-gtksharp-2.10.2-win32-4.exe)

[http://www.mono-project.com/files/0/00/Mono\_icon\_windows.gif](http://forge.novell.com/modules/xfmod/project/?gtks-inst4win)
 [GTK\# Only](http://forge.novell.com/modules/xfmod/project/?gtks-inst4win)

**Mac OSX**
Tiger (10.4) or Leopard (10.5)

[http://www.mono-project.com/files/b/bf/Mono\_icon\_mac.gif](ftp://www.go-mono.com/archive/1.2.6/macos-10-universal/4/MonoFramework-1.2.6_4.macos10.novell.universal.dmg)
 [Universal Installer](ftp://www.go-mono.com/archive/1.2.6/macos-10-universal/4/MonoFramework-1.2.6_4.macos10.novell.universal.dmg)

**openSUSE 10.3**

[http://www.mono-project.com/files/d/dd/Mono\_icon\_suse.gif](http://www.go-mono.com/download-stable/suse-103-i586)
 [x86](http://www.go-mono.com/download-stable/suse-103-i586)

[http://www.mono-project.com/files/d/dd/Mono\_icon\_suse.gif](http://www.go-mono.com/download-stable/suse-103-x86_64)
 [x86\_64](http://www.go-mono.com/download-stable/suse-103-x86_64)

**SuSE Enterprise Linux 9**

[Torrent](/index.php?title=Special:Upload&wpDestFile=Mono_icon_suse.gif "File:Mono icon suse.gif")
[x86](/index.php?title=X86&action=edit&redlink=1 "X86 (page does not exist)")

[Torrent](/index.php?title=Special:Upload&wpDestFile=Mono_icon_suse.gif "File:Mono icon suse.gif")
[x86\_64](/index.php?title=X86_64&action=edit&redlink=1 "X86 64 (page does not exist)")

[Torrent](/index.php?title=Special:Upload&wpDestFile=Mono_icon_suse.gif "File:Mono icon suse.gif")
[ia64](/index.php?title=Ia64&action=edit&redlink=1 "Ia64 (page does not exist)")

[Torrent](/index.php?title=Special:Upload&wpDestFile=Mono_icon_suse.gif "File:Mono icon suse.gif")
[s390](/index.php?title=S390&action=edit&redlink=1 "S390 (page does not exist)")

[Torrent](/index.php?title=Special:Upload&wpDestFile=Mono_icon_suse.gif "File:Mono icon suse.gif")
[s390x](/index.php?title=S390x&action=edit&redlink=1 "S390x (page does not exist)")

[Torrent](/index.php?title=Special:Upload&wpDestFile=Mono_icon_suse.gif "File:Mono icon suse.gif")
[ppc](/index.php?title=Ppc&action=edit&redlink=1 "Ppc (page does not exist)")

etc...

 [File:Mono icon source.gif](/index.php?title=Special:Upload&wpDestFile=Mono_icon_source.gif "File:Mono icon source.gif")

\<img src="[http://www.go-mono.com/monologue/images/heads/none.png](http://www.go-mono.com/monologue/images/heads/none.png)"\>

[http://www.mono-project.com/files/e/e9/Mono\_icon\_source.gif]({{site.github.url}}/files/e/e9/Mono_icon_source.gif)

index.php?title=Special:Whatlinkshere&target=1.1.7

