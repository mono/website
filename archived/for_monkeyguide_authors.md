---
title: "For Monkeyguide Authors"
lastmodified: '2007-05-26'
redirect_from:
  - /For_Monkeyguide_Authors/
---

For Monkeyguide Authors
=======================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#source-code-examples">1 Source Code Examples</a>
<ul>
<li><a href="#csharp">1.1 C#</a></li>
<li><a href="#c">1.2 C</a></li>
<li><a href="#bash">1.3 Bash</a></li>
<li><a href="#xml">1.4 XML</a></li>
</ul></li>
<li><a href="#linking-to-monodoc">2 Linking to Monodoc</a></li>
</ul></td>
</tr>
</tbody>
</table>

Source Code Examples
====================

CSharp
------

Wrap source code in

``` nowiki
<csharp></csharp>
```

tags, e.g.:

     <csharp>
     public static void Main()
     </csharp>

which will produce nice colored syntax output like this:

``` csharp
public static void Main()
```

C
-

    <c>
    void *mono_gc_alloc_fixed      (size_t size, void *descr);
    </c>

for having output like:

``` c
void *mono_gc_alloc_fixed      (size_t size, void *descr);
```

Bash
----

Wrap bash commands in

``` nowiki
<bash></bash>
```

tags, e.g.:

     <bash>
     ls -l
     </bash>

which will produce output like this:

``` bash
  ls -l
```

XML
---

    <xml>
    <tag attribute="value" />
    <tag2>Content</tag2>
    </xml>

will be formatted to:

``` xml
<tag attribute="value" />
<tag2>Content</tag2>
```

*What else is supported?*

Linking to Monodoc
==================

To link to Monodoc class library documentation, give a link like

``` nowiki
[http:/monodoc/T:System.Runtime.InteropServices.DllImportAttribute DllImport]
```

which will appear as [http:/monodoc/T:System.Runtime.InteropServices.DllImportAttribute DllImport]. Or with something like:

``` nowiki
http:/monodoc/N:System.IO
```

    to link to a namespace

``` nowiki
http:/monodoc/T:System.Type
```

    to link to a type

``` nowiki
http:/monodoc/C:System.Text.StringBuilder(string)
```

    to link to a constructor

``` nowiki
http:/monodoc/M:System.String.ToString()
```

    to link to a method

``` nowiki
http:/monodoc/P:System.String.Length
```

    to link to a property, and similarly F for fields and E for events
