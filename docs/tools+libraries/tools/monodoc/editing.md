---
title: Monodoc Editing
redirect_from:
  - /Monodoc_Editing/
---

Writing XML Documentation
=========================

See the [mdoc(5)](http://docs.go-mono.com/monodoc.ashx?link=man:mdoc(5)) man page for more details about monodoc XML file format and document markup.

The following tags can be used inside the \<summary\> and \<remarks\> sections of your documentation.

    <para> </para>

Used to separate paragraphs.

    <paramref name="param_name"/>

Used to reference a formal parameter to a function.

    <see cref="destination"/>

Use this to create a link in your documentation to the sections for types, namespaces, methods, etc. where destination has one of the following formats:

-   N:MyLibrary (to link to a namespace)
-   T:MyLibrary.MyType (to link to a type)
-   C:MyLibrary.MyType(System.String) (to link to a constructor)
    -   Constructor links may also be written as: M:MyLibrary.MyType.#ctor(System.String)
-   M:MyLibrary.MyType.MethodName(System.String,MyLibray.MyOtherType) (to link to a method; for `ref` and `out` parameters, add an & to the end of the type name)
-   P:MyLibrary.MyType.IsDefined (to link to a property)
-   F:MyLibrary.MyType.COUNTER (to link to a field)
-   E:MyLibrary.MyType.OnChange (to link to an event)

So your links might look like:

    <see cref="M:MyLibrary.MyType.MethodName(System.String,MyLibray.MyOtherType)"/>

    <see langword="keyword"/>

Use this to link to a keyword in the C# language, for example to link to \`true', do:

    <see langword="true"/>

    <example> ... </example>

Use example to insert an example. The example can contain explanatory text and code. The code content should be wrapped in a CDATA element so that it is not parsed by the XML processor:

    <code lang="C#"><![CDATA[ .. ]]></code>

Use this to provide a sample C# program, typically used within the \<example\> tags.

You can link to an example like this:

    <code lang="C#" source="file.cs"> </code>

When the **source** attribute is provided, the contents of the file *file.cs* will be inserted within the \<code/\> element by [monodocer](/docs/tools+libraries/tools/monodocer/) or [mdoc-update](/docs/tools+libraries/tools/mdoc/) the next time they are run. *file.cs* MUST be located in the base directory of the XML documentation, i.e. the [monodoc](/docs/tools+libraries/tools/monodocer/) *-path* or [mdoc-update](/docs/tools+libraries/tools/mdoc/) *--out* directory. *file.cs* may contain relative directory information as well, e.g. **\<code lang="C#" source="examples/file.cs" /\>.**

    <list type="bullet"> </list>

Use this to create lists. Lists contains \<item\> elements which have to contain \<term\> containers.

    <list type="table"> </lits>
    <listheader>
    <term>YOUR FIRST COLUMN</term>
    <description>YOUR DESCRIPTION</description>
    </listheader>

For two-column tables. Inside use:

    <item>
    <term>First</term>
    <description>First description</description>
    </item> <item>
    <term>Second</term> <description>Second descirption</description>
    </item>

To embed images you use the \<img\> tag.There are two different ways to use that tag depending on the name of the attribute you use:

-   If your picture is hosted on an external host, use the `src` attribute like you would normally do in HTML.
-   If you want to bundle your image inside the documentation bundle (i.e. the documentation zipball), simply drop the files in an `_images` folder inside your source documentation tree (that is where the `ns-*.xml` files are). You can then refer to these pictures in the XML by its filename in a `href` attribute (notice how this is not the same attribute as before).

For example, if you want to link the following image `http://www.mono-project.com/files/8/8d/Mono-gorilla-aqua.100px.png`, use `<img src="http://www.mono-project.com/files/8/8d/Mono-gorilla-aqua.100px.png" />`. If you want to link to the `monkey.png` you dropped in your `_images` folder, simply write tt\>\<img href="monkey.png" /\>\</tt\>

Note that bundled images must have unique names at the scope of the documentation bundle, so it may be wise to use a naming scheme that avoids collision, e.g., prepending the namespace to the filename.

Monodoc browser editing
=======================

Editing from inside the [Monodoc](/docs/tools+libraries/tools/monodoc/) browser is simple. You have to navigate through the documentation and find where is the label *To be added* or *Documentation for this section has not yet been entered* and click on the [Edit] link near it (be sure the Editing option in the Edit menu is set or the [Edit] links won't be showed).

After clicking on an [Edit] link, monodoc will show an aspect similar to this one:

[![Monodoc-edit.png](/archived/images/4/41/Monodoc-edit.png)](/archived/images/4/41/Monodoc-edit.png)

Where you can see the window is divided in two panels. The upper panel is where you type the [XML Documentation code](#writing-xml-documentation). Some buttons in the middle will help you with the most important tags. In the lower panel you can see a preview of the documentation as it is being typed. Finally, at the lowest part of the window you can see three buttons, *Close* for canceling the actual editing, *Save* for saving the changes and *Restore* to remove all your changes and restore the node as it was originally.
