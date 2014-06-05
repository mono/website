---
layout: docpage
navgroup: docs
title: "Gendarme Rules: UI"
permalink: /docs/tools/gendarme/rules/ui/
---

[Gendarme]({{site.github.url}}/old_site/Gendarme "Gendarme")'s user interface rules are located in the **Gendarme.Rules.Ui.dll** assembly. Latest sources are available from [anonymous SVN](http://anonsvn.mono-project.com/viewcvs/trunk/mono-tools/gendarme/rules/Gendarme.Rules.Ui/).

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

