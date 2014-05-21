---
layout: obsolete
title: "Monodocer"
lastmodified: '2008-01-17'
permalink: /old_site/Monodocer/
redirect_from:
  - /Monodocer/
---

Monodocer
=========

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#overview">1 Overview</a></li>
<li><a href="#generating-documentation">2 Generating Documentation</a>
<ul>
<li><a href="#example-assembly">2.1 Example Assembly</a></li>
<li><a href="#generating-documentation-stubs">2.2 Generating Documentation Stubs</a></li>
</ul></li>
<li><a href="#importing-documentation">3 Importing Documentation</a>
<ul>
<li><a href="#importing-xml-documentation">3.1 Importing XML Documentation</a></li>
</ul></li>
<li><a href="#updating-documentation">4 Updating Documentation</a></li>
<li><a href="#documentation-stub-format">5 Documentation Stub Format</a></li>
<li><a href="#editing-documentation">6 Editing Documentation</a></li>
<li><a href="#installing-documentation">7 Installing Documentation</a></li>
</ul></td>
</tr>
</tbody>
</table>

Overview
========

The `monodocer` tool is used to maintain and update the documentation XML files (ECMA-styled documentation) for your project.

`monodocer` can be used to produce the initial empty stubs for documentation (it will produce stubs for all public and protected members) and can be used to update the documentation as your API evolves.

`monodocer` is a tool for maintaining class library documentation outside of your source code files. This is how the Mono project maintains its own class library documentation. Keeping documentation separate from code has the advantage of not cluttering up source files, especially when the documentation is longer than the code itself, and it makes it easier to write translations.

The Monodocer documentation format has a separate XML file for each class and namespace in an assembly, but within the files there are many similaries with the `/doc` format. The documentation that you will write uses mostly the same [set of XML tags](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/csref/html/vclrfTagsForDocumentationComments.asp) as in the `/doc` format.

With these considerations in mind, Mono is using external XML files for class documentation, rather than documenting the source inline. The XML file format used is inspired by the XML format used to document the ECMA APIs.

Monodocer is part of monodoc.

Generating Documentation
========================

The initial stubs for the documentation are generated with [monodocer]({{site.github.url}}/old_site/Monodocer "Monodocer"). After running it, you will get a bunch of XML files from your public and protected members in a clear directory hierarchy.

Example Assembly
----------------

For example, if we had these two files compiled into the library *example.dll*:

``` csharp
// source file A.cs
namespace A {
    public class SomeAClass {
        public void SomeAmethod () {
 
        }
    }
    public class OtherAClass {
        public int x,y;
    }
}
 
// source file B.cs
namespace B {
    public class ImportantBClass {
        public void BBMethod () {}
    }
    public class AnotherBClass {
        public int x, xx;
    }
    class InternalClass {
        int nothingPublic;
    }
}
```

Generating Documentation Stubs
------------------------------

You next need to create some stub XML files where you will insert your own documentation. Run monodocer like so:

``` bash
$ monodocer --assembly example.dll --path docfiles
Namespace Directory Created: A
New Type: A.SomeAClass
New Namespace File: A
New Type: A.OtherAClass
Namespace Directory Created: B
New Type: B.ImportantBClass
New Namespace File: B
New Type: B.AnotherBClass
Members Added: 0, Members Deleted: 0
```

Importing Documentation
=======================

Monodocer supports importing two different documentation formats:

1.  Inline XML documentation extracted via 'csc /doc' or 'mcs /doc'.
2.  ECMA documentation, found at the [ECMA-335 page](http://www.ecma-international.org/publications/standards/Ecma-335.htm) within the ECMA-335.zip file.

Inline documentation is imported with '-importslashdoc', while ECMA documentation is imported with '-importecmadoc'.

Importing XML Documentation
---------------------------

If you use inline XML documentation, you'll first need to extract it:

``` bash
gmcs -doc:MyDocs.xml MySources.cs -t:library -out:MyAssembly.dll
```

Next you import 'MyDocs.xml' with monodocer:

``` bash
monodocer -importslashdoc:MyDocs.xml -assembly:MyAssembly.dll -path:en -pretty
```

Updating Documentation
======================

When your assembly changes, run `monodocer` again, just as before, to update your XML documentation files. Any documentation you wrote will be preserved in the files, and new sections for added namespaces, classes, and members are created as needed. Deleted members that you've written documentation for won't be deleted in the XML files unless you provide the `--delete` option.

If you remove some classes from your source code a .remove extension will be added to the old documentation files, so you do not lose the already written documentation.

In [monodocer]({{site.github.url}}/old_site/Monodocer "Monodocer") 1.1.18 or later, you can provide the `-since:SINCE` command-line argument to insert a `<since/>` element for each *added* type and member within the assembly. The `SINCE` text will be inserted as the *version* attribute of the `<since/>` element, thus:

``` bash
$ monodocer -path:en -assembly:lib.dll -since:2.0
```

will insert a `<since version="2.0" />` element for *every* type and member that is added to the documentation XML files.

This is useful when you need to distinguish which members were added in later versions of an assembly.

Documentation Stub Format
=========================

Monodocer will create documentation files in the `docfiles` directory. The `docfiles/index.xml` file lists all of the types and namespaces in the assembly, and provides `<Remarks/>` and `<Copyright/>` elements for assembly-wide documentation. There will also be an XML file and directory for each namespace. In the namespace XML files, you can fill in namespace-specific documentation. Within the namespace directories, there is an XML file for each class in that namespace.

The XML file for *B.ImportantBClass* contains:

    <Type Name="ImportantBClass" FullName="B.ImportantBClass">
      <TypeSignature Language="C#" Value="public class ImportantBClass" />
      <AssemblyInfo>
        <AssemblyName>de</AssemblyName>
        <AssemblyVersion>0.0.0.0</AssemblyVersion>
      </AssemblyInfo>
      <Base>
        <BaseTypeName>System.Object</BaseTypeName>
      </Base>
      <Interfaces />
      <Members>
        <Member MemberName=".ctor">
          <MemberSignature Language="C#" Value="public ImportantBClass ();" />
          <MemberType>Constructor</MemberType>
          <Parameters />
          <Docs>
            <summary>To be added.</summary>
            <remarks>To be added.</remarks>
          </Docs>
        </Member>
        <Member MemberName="BBMethod">
          <MemberSignature Language="C#" Value="public void BBMethod ();" />
          <MemberType>Method</MemberType>
          <ReturnValue>
            <ReturnType>System.Void</ReturnType>
          </ReturnValue>
          <Parameters />
          <Docs>
            <summary>To be added.</summary>
            <remarks>To be added.</remarks>
          </Docs>
        </Member>
      </Members>
      <Docs>
        <summary>To be added.</summary>
        <remarks>To be added.</remarks>
      </Docs>
    </Type>

Every "To be added." is a place where you need to fill in documentation. The other nodes in the document shouldn't be edited. These are used later to render the documentation into other formats (without needing to look-up the information from the compiled assembly).

Editing Documentation
=====================

You can edit these files by hand, or you can use [Monodoc]({{site.github.url}}/old_site/Monodoc "Monodoc"), Mono's documentation browser to edit the files. To edit the files in Monodoc, run:

``` bash
$ monodoc --edit docfiles
```

Your assembly will be listed last. Open up that node in the tree on the left, and you can browse your documentation on the right. Make sure the Editing option is checked in the Edit menu, and you'll see [Edit] links in various places. Clicking an [Edit] link brings up an editor where you can enter the XML documentation for that section. Some buttons for commonly used tags are available.

Changes made in Monodoc are saved immediately to your documentation files.

Installing Documentation
========================

Documentation can be packaged for later installation with the **mdassembler** command. See the [Assembler]({{site.github.url}}/old_site/Assembler "Assembler") page for more information.

