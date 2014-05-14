---
layout: obsolete
title: "Gendarme.Rules.Ui"
permalink: /old_site/Gendarme.Rules.Ui/
redirect_from:
  - /Gendarme.Rules.Ui/
---

Gendarme.Rules.Ui
=================

[Gendarme]({{site.github.url}}/old_site/Gendarme "Gendarme")'s user interface rules are located in the **Gendarme.Rules.Ui.dll** assembly. Latest sources are available from [anonymous SVN](http://anonsvn.mono-project.com/viewcvs/trunk/mono-tools/gendarme/rules/Gendarme.Rules.Ui/).

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#rules">1 Rules</a>
<ul>
<li><a href="#gtksharpexecutabletargetrule">1.1 GtkSharpExecutableTargetRule</a></li>
<li><a href="#systemwindowsformsexecutabletargetrule">1.2 SystemWindowsFormsExecutableTargetRule</a></li>
<li><a href="#usestathreadattributeonswfentrypointsrule">1.3 UseSTAThreadAttributeOnSWFEntryPointsRule</a></li>
</ul></li>
<li><a href="#feedback">2 Feedback</a></li>
</ul></td>
</tr>
</tbody>
</table>

Rules
=====

### GtkSharpExecutableTargetRule

An executable assembly, i.e. an .exe, refers to the gtk-sharp assembly but isn't compiled using **-target:winexe**. A console window will be created and shown under Windows (MS runtime) when the application is executed.

**Bad** example:

    gmcs gtk.cs -pkg:gtk-sharp

**Good** example:

    gmcs gtk.cs -pkg:gtk-sharp -target:winexe

### SystemWindowsFormsExecutableTargetRule

An executable assembly, i.e. an .exe, refers to the System.Windows.Forms assembly but isn't compiled using **-target:winexe**. A console window will be created and shown under Windows (MS runtime) when the application is executed which is probably not desirable for a winforms application.

**Bad** example:

    gmcs swf.cs -pkg:dotnet

**Good** example:

    gmcs swf.cs -pkg:dotnet -target:winexe

### UseSTAThreadAttributeOnSWFEntryPointsRule

This rule checks executable assemblies, i.e. \*.exe's, that reference System.Windows.Forms to ensure that their entry point is decorated with **[System.STAThread]** attribute and is not decorated with **[System.MTAThread]** attribute to ensure that Windows Forms work properly.

**Bad** example \#1 (no attributes):

``` csharp
public class WindowsFormsEntryPoint {
    static void Main ()
    {
    }
}
```

**Bad** example \#2 (MTAThread)

``` csharp
public class WindowsFormsEntryPoint {
    [MTAThread]
    static void Main ()
    {
    }
}
```

**Good** example \#1 (STAThread):

``` csharp
public class WindowsFormsEntryPoint {
    [STAThread]
    static void Main ()
    {
    }
}
```

**Good** example \#2 (not Windows Forms):

``` csharp
public class ConsoleAppEntryPoint {
    static void Main ()
    {
    }
}
```

Feedback
========

Please report any documentation errors, typos or suggestions to the [Gendarme Google Group](http://groups.google.com/group/gendarme). Thanks!

