---
layout: docpage
navgroup: docs
title: "Gendarme Rules: Portability"
---

[Gendarme]({{ site.github.url }}/docs/tools+libraries/tools/gendarme/)'s portability rules are located in the **Gendarme.Rules.Portability.dll** assembly. Latest sources are available from [anonymous SVN](http://anonsvn.mono-project.com/viewvc/trunk/mono-tools/gendarme/rules/Gendarme.Rules.Portability/).

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#rules">1 Rules</a>
<ul>
<li><a href="#donothardcodepathsrule">1.1 DoNotHardcodePathsRule</a></li>
<li><a href="#exitcodeislimitedonunixrule">1.2 ExitCodeIsLimitedOnUnixRule</a></li>
<li><a href="#featurerequiresrootprivilegeonunixrule">1.3 FeatureRequiresRootPrivilegeOnUnixRule</a></li>
<li><a href="#monocompatibilityreviewrule">1.4 MonoCompatibilityReviewRule</a>
<ul>
<li><a href="#version">1.4.1 Version</a></li>
</ul></li>
<li><a href="#newlineliteralrule">1.5 NewLineLiteralRule</a></li>
</ul></li>
<li><a href="#feedback">2 Feedback</a></li>
</ul></td>
</tr>
</tbody>
</table>

Rules
=====

### DoNotHardcodePathsRule

This rule checks for strings that contain valid paths, either under Unix or Windows file systems. Path literals are often not portable across operating systems (e.g. different path separators). To ensure correct cross-platform functionality they should be replaced by calls to **Path.Combine** and/or **Environment.GetFolderPath**.

**Bad** example:

``` csharp
void ReadConfig ()
{
    using (FileStream fs = File.Open ("~/.local/share/myapp/user.config")) {
        // read configuration
    }
}
```

**Good** example:

``` csharp
void ReadConfig ()
{
    string config_file = Environment.GetFolderPath (SpecialFolder.LocalApplicationData);
    config_file = Path.Combine (Path.Combine (config_file, "myapp"), "user.config");
    using (FileStream fs = File.Open (config_file)) {
        // read configuration
    }
}
```

**Notes**

-   This rule is available since Gendarme 2.0

### ExitCodeIsLimitedOnUnixRule

This rule applies to all executable (i.e. EXE) assemblies. Something that many Windows developers might not be aware of is that on Unix systems, process exit code must be between zero and 255, unlike in Windows where it can be any valid integer value. This rule warns if the returned value might be out of range either by:

-   returning an unknown value from **int Main()**;
-   setting the **Environment.ExitCode** property; or
-   calling **Environment.Exit(exitCode)** method.

An error is reported in case a number which is definitely out of range is returned as an exit code.

**Bad** example:

``` csharp
class MainClass {
    static int Main ()
    {
        Environment.ExitCode = 1000;
        Environment.Exit (512);
        return -1;
    }
}
```

**Good** example:

``` csharp
class MainClass {
    static int Main ()
    {
        Environment.ExitCode = 42;
        Environment.Exit (100);
        return 1;
    }
}
```

**Notes**

-   This rule is available since Gendarme 2.0

### FeatureRequiresRootPrivilegeOnUnixRule

This rule fires if a feature is used which is, by default, restricted under Unix.

-   **System.Net.NetworkInformation.Ping**: This type can only be used by root on Unix systems. As an alternative you can execute the ping command and parse its result.
-   **System.Diagnostics.Process**: The PriorityClass property can only be set to **Normal** by non-root users. To avoid this problem you can do a platform check before assigning a priority.

 **Bad** example:

``` csharp
process.PriorityClass = ProcessPriorityClass.AboveNormal;
process.Start ();
```

**Good** example:

``` csharp
if (Environment.OSVersion.Platform != PlatformID.Unix) {
    process.PriorityClass = ProcessPriorityClass.AboveNormal;
}
process.Start ();
```

### MonoCompatibilityReviewRule

This rule will fire if one of the assemblies being checked contains a call to a .NET method which is either not implemented on Mono or partially implemented. It does this by downloading a MoMA definitions file under **\~/.local/share/Gendarme/** (on UNIX) or **C:\\Documents and Settings\\{username}\\Local Settings\\Application Data\\Gendarme** (on Windows) and checking for calls to the methods therein. The rule will work without MoMA but if it does fire it may be useful to download and run MoMA. By default the rule will use the latest local version available. This can be overriden to use a specific, local, version if you want to review compatibility against a specific Mono version. You can also manually remove them, now and then, to ensure you are using the latest version. Also upgrading Gendarme will try to download a newer version of the definitions files.

**Configuration**

Some elements of this rule can be customized to better fit your needs.

#### Version

The version of Mono against which you wish to review compatibility. You need to have this version of the definitions file downloaded in order to use it. This is useful if you want to upgrade Gendarme but still want to test compatibility against an older version of Mono.

### NewLineLiteralRule

This rule warns if methods, including properties, are using the literal **\\r** and/or **\\n** for new lines. This isn't portable across operating systems. To ensure correct cross-platform functionality they should be replaced by **System.Environment.NewLine**.

**Bad** example:

``` csharp
Console.WriteLine ("Hello,\nYou should be using Gendarme!");
```

**Good** example:

``` csharp
Console.WriteLine ("Hello,{0}You must be using Gendarme!", Environment.NewLine);
```

Feedback
========

Please report any documentation errors, typos or suggestions to the [Gendarme Google Group](http://groups.google.com/group/gendarme). Thanks!

