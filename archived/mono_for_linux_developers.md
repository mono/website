---
title: "Mono For Linux Developers"
lastmodified: '2007-05-14'
permalink: /archived/Mono_For_Linux_Developers/
redirect_from:
  - /Mono_For_Linux_Developers/
---

Mono For Linux Developers
=========================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#linux-binary-installation">1 Linux Binary Installation</a></li>
<li><a href="#linux-ides-for-mono">2 Linux IDEs for Mono</a>
<ul>
<li><a href="#monodevelop">2.1 MonoDevelop</a></li>
<li><a href="#basic-text-editors">2.2 Basic Text Editors</a></li>
<li><a href="#eclipse-in-c-mode">2.3 Eclipse in C# Mode</a></li>
</ul></li>
<li><a href="#contributors">3 Contributors</a></li>
</ul></td>
</tr>
</tbody>
</table>

Linux Binary Installation
-------------------------

On Linux, Mono is available in various forms: through the [Red Carpet](ftp://ftp.novell.com/pub/ximian/redcarpet2) installation software, as installers, or as packages that you can install. To learn which way is best for you, consult our [Getting Mono]({{ site.github.url }}/Obtaining_Mono) page.

Linux IDEs for Mono
===================

As you might expect, there are many development tools available to C\# developers, ranging from bare-bones text editors to complex integrated development environments.

MonoDevelop
-----------

[MonoDevelop](http://monodevelop.com) is a project to create an IDE for .NET programming written in C\#, using the Gtk\# platform. It is actively under development, and is useable, though a bit unstable.

Basic Text Editors
------------------

[Emacs](http://www.gnu.org/software/emacs/emacs.html) and [Vim](http://www.vim.org/) are general purpose text editors, not IDEs designed for use with .NET and C\#. However, you can use them to write software in nearly any language. For Emacs, you will want to use the C\# major mode available at [davh.dk](http://davh.dk/script/) or [www.cybercom.net](http://www.cybercom.net/~zbrad/DotNet/Emacs/) to handle syntax coloring and proper indentation. Vim supports syntax highlighting for C\#, but not much else.

Other recommended text editors include: [JEdit](http://www.jedit.org/).

Eclipse in C\# Mode
-------------------

The [Eclipse](http://eclipse.org) project is better known for its Java IDE, and is in fact written in Java. However, it is a full-featured development environment which can be used with plugins for many other languages, including C\#.

To use Eclipse with Mono, you will need to install a Java Runtime Environment from [IBM](http://www-106.ibm.com/developerworks/java/jdk/linux130/?dwzone=java) or [Sun](http://java.sun.com/j2se/1.3/download-linux.html), and you will also need one of the following plugins for editing with C\#:

-   [C\# Plugin from BlackSun](http://black-sun.sourceforge.net/).
-   [Emonic Plugin](http://emonic.sourceforge.net/).
-   [C\# Plugin from Improve Technologies.](http://www.improve-technologies.com/alpha/esharp/)

Once all three pieces are installed, consult the Eclipse C\# plugin documentation for instructions on how to proceed.

Contributors
============

Johannes Roith, Jaime Anguiano Olarra, Hinne Hettema, Martin Willemoes Hansen

