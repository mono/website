---
title: Generating Documentation
redirect_from:
  - /Generating_Documentation/
---

Documenting your API is an important component of creating reusable libraries, and Mono provides a few tools for creating class library documentation of your own. This article explains how to generate documentation for your library using [monodoc](/docs/tools+libraries/tools/monodoc/), the Mono documentation framework.

This page is about generating documentation for the first time for a new library. If you are interested in contributing to existing Mono API Documentation, see [Monodoc Contributing](/docs/tools+libraries/tools/monodoc/contributing/).

Methods of Generating Documentation
===================================

There are two ways to create documentation for your libraries:

-   Using a [separate set of tools](#monodoc-documentation) for maintaining documenation files outside of your source code and which produce ECMA-styled documentation.

-   Using [the /doc option of mcs](#inline-xml-documentation), which takes documentation comments from within your source code files and compiles them into a Visual Studio-format XML documentation file.

**Documentation in the Mono project uses the first approach**, as it allows for a clean split between documentation and source code and allows us to provide examples outside of the source code as well as using our collaboration system

The underlying reason is that, while using inline XML tags to document classes is certainly convenient, properly verbose documentation quickly overwhelms the code, making the source quite difficult to read. Furthermore, multilingual documentation makes for significant additional text and the various attempts to address this problem are poor.

Monodoc Documentation
=====================

The process for generating the documentation can be splitted in several parts.

Generate the inital stubs
-------------------------

The initial stubs for the documentation are generated with [monodocer](/docs/tools+libraries/tools/monodocer/) or [mdoc-update](/docs/tools+libraries/tools/mdoc/). After running it, you will get a bunch of XML files from your public and protected members in a clear directory hierarchy.

For example, if we had these two files:

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

compiled in a library *lib.dll*:

``` bash
$ mcs -t:library -out:lib.dll A.cs B.cs
```

running monodocer:

``` bash
$ monodocer -assembly:lib.dll -path:en -pretty
```

or mdoc-update:

``` bash
$ mdoc update -o en lib.dll
```

will give us the following directory content:

    index.xml
    A.xml
    B.xml
    A-
     |- SomeAClass.xml
     |- OtherAClass.xml
    B-
     |- ImportantBClass.xml
     |- AnotherBClass.xml

As the documentation is an [XML format](http://www.go-mono.org/docs/monodoc.ashx?link=man:mdoc(5)), you can edit it directly, though it is easier to use the [Monodoc](/docs/tools+libraries/tools/monodoc/) browser. Just after creating the documentation with [monodocer](/docs/tools+libraries/tools/monodocer/), you can start navigating or [editing](#edit-and-write-documentation) it by typing:

``` bash
$ monodoc --edit docfiles
```

Where *docfiles* is the name of the directory containing the documentation files.

When you are finished editing it, you can create the .zip, .tree and .source file to distribute the documentation as explained [here](/docs/tools+libraries/tools/monodoc/generating-documentation/#assemble-the-generated-documentation).

Edit and write documentation
----------------------------

After starting [Monodoc](/docs/tools+libraries/tools/monodoc/) browser you can navigate to the parts of the documentation to be edited. Those are labeled as *To be added* or as *Documentation for this section has not yet been entered*. Look [here](/docs/tools+libraries/tools/monodoc/editing/) for more information regarding the editing process or the XML format of the documentation.

Synchronize Documentation with source code
------------------------------------------

If your source code changes the documentation should be updated. You only need to run [monodocer](/docs/tools+libraries/tools/monodocer/) or [mdoc-update](/docs/tools+libraries/tools/mdoc/) again and the documentation files will be updated without removing the already written documentation and adding the parts that were not missing from the XML files.

If you remove some classes from your source code a .remove extension will be added to the old documentation files, so you do not lose the already written documentation. Of course, new stubs for your new classes will be created.

In [monodocer](/docs/tools+libraries/tools/monodocer/) 1.1.18 or later or [mdoc](/docs/tools+libraries/tools/mdoc/), you can provide the `-since:SINCE` command-line argument to insert a `<since/>` element for each *added* type and member within the assembly. The `SINCE` text will be inserted as the *version* attribute of the `<since/>` element, thus:

``` bash
$ monodocer -path:en -assembly:lib.dll -since:2.0
# or
$ mdoc update -o en --since=2.0 lib.dll
```

will insert a `<since version="2.0" />` element for *every* type and member that is added to the documentation XML files.

This is useful when you need to distinguish which members were added in later versions of an assembly.

Both [monodocer](/docs/tools+libraries/tools/monodocer/) and [mdoc-update](/docs/tools+libraries/tools/mdoc/) insert the assembly versions that each member was found in, and the list of assembly versions is also displayed within [monodoc](/docs/tools+libraries/tools/monodoc/) and [http://www.go-mono.com/docs](http://www.go-mono.com/docs), for example the **Requirements** section at the [System.Environment documentation](http://www.go-mono.com/docs/monodoc.ashx?link=T:System.Environment).

Assemble the generated Documentation
------------------------------------

For distributing our documentation, it is preferable to assemble all the files, so you don't have to deal with an entire directory. That way we achieve also a better integration with the monodoc browser.

To bundle together all our docs, we should use the [mdassembler](/docs/tools+libraries/tools/mdassembler/) or [mdoc-assemble](/docs/tools+libraries/tools/mdoc/) programs. These programs create .zip and a .tree files which include all our generated documentation. In addition, you will have to create a .sources file to tell the [monodoc browser](/docs/tools+libraries/tools/monodoc/) what kind of documentation you have created.

To create the *.zip* and *.tree* files, we can use [mdassembler](/docs/tools+libraries/tools/mdassembler/):

``` bash
$ mdassembler --ecma en --out lib
```

or [mdoc-assemble](/docs/tools+libraries/tools/mdoc/):

``` bash
$ mdoc assemble -o lib en
```

The above two commands will create the files *lib.tree* and *lib.zip*. Now, we create a *lib.source* file:

``` xml
<?xml version="1.0"?>
<monodoc>
  <node label="My Library Name" name="mydocs-lib" parent="libraries" />
  <source provider="ecma" basefile="lib" path="mydocs-lib"/>
</monodoc>
```

The *provider* attribute tells the browser which kind of documentation is within the *lib.zip* file. When editing library documentation it should always be *ecma*. The *provider* attribute MUST match the format provided to [mdassembler](/docs/tools+libraries/tools/mdassembler/) or [mdoc-assemble](/docs/tools+libraries/tools/mdoc/).

Other documentation formats are supported as well; see [mdoc-assemble(1)](http://www.go-mono.com/docs/monodoc.ashx?link=man:mdoc-assemble(1)) for details.

The *basefile* attribute tells the browser where to find that documentation; it is the base name of your .zip and .tree files.

The *path* attribute is a tag that lets the browser group the different documentation sources in sections (showed in the tree view). If we make two different set of documentations (from two different libraries we have written) they could be grouped together as long as we use the same path. This is, for example, the way used to group the GtkSourceView and Gtk-Sharp documentation together. You can look for more examples in the *sources* directory of monodoc.

The *//node* element(s) allow you to declare paths that can be used by the *//source/@path* attribute. The value of *//source/@path* *must* come from one of two locations: the .source file, or the "global" monodoc.xml file, which only contains the paths *libraries*, *man*, *languages*, *tools*, and *various*. The *//node* element can have an optional *//node/@parent* attribute, which follows the same rules as *//source/@path*. You can nest *//node* elements in order to create additional structure underneath the global nodes.

For example, if you wanted to create a tree structure of *Languages -\> C\# -\> Language Specification* and *Languages -\> C\# -\> Error Reference* (that is, a common "C\#" parent to the Language Specification and Error Reference nodes), you could do:

``` xml
<?xml version="1.0"?>
<monodoc>
  <node label="C#" name="lang-cs" parent="languages">
    <node label="C# Compiler Error Reference" name"cs-errors" />
    <node label="C# Language Specification" name="ecmaspec" />
  </node>
  <source provider="error" basefile="cs-errors" path="cs-errors" />
  <source provider="ecmaspec" basefile="ecma334" path="ecmaspec" />
</monodoc>
```

(This also shows that a single .source file can specify multiple sources.)

The next step is to move the generated documentation files (sources, zip and tree) to the *sources* directory of monodoc. That directory can be found with one of the following commands:

``` bash
$ pkg-config monodoc --variable=sourcesdir
$ monodoc --get-sourcesdir #(deprecated)
```

### Merging assembled documentation changes

The changes you made to your assembled library documentation will be stored in an XML file in `~/.config/monodoc/changeset.xml`. Thus, they are not created directly in the XML documentation files. To bring back those changes to the XML files you will need to merge them:

``` bash
$ monodoc --merge-changes ~/.config/monodoc/changeset.xml docdir
```

where *docdir* is the directory containing the .source file and the directory structure of your documentation. It is important to note that **the changes will be merged to the unassembled xml sources**, so you will have to reassemble the documentation after the process.

However it is recommended to not edit files once being assembled, but when they are in XML form. The reason is that contributions are stored also in the *changeset.xml*, so contributions and your own library changes will be mixed.

Other utilities
---------------

### Generating static HTML Documentation

You can tranform documentation written with [monodocer](/docs/tools+libraries/tools/monodocer/) or [mdoc-update](/docs/tools+libraries/tools/mdoc/) into HTML documentation with the `monodocs2html` or [mdoc-export-html](/docs/tools+libraries/tools/mdoc/) programs:

``` bash
$ monodocs2html --source docfiles --dest htmldocs
 
# -OR-
 
$ mdoc export-html -o htmldocs docfiles
```

These commands will convert the `monodocer`-generated files within `docfiles` into HTML files in the `htmldocs` directory. Open `index.html` in that directory with your web browser to view the documentation.

The layout of the HTML output can be customized by overriding the XSLT stylesheet used by the tool. To do this, first get a copy of the default stylesheet by running:

``` bash
$ monodocs2html --dumptemplate > doctemplate.xsl
 
# -OR-
 
$ mdoc export-html --default-template > doctemplate.xsl
```

That will place the XSLT template in `doctemplate.xsl`. Now modify the template as you like, for instance by changing the CSS styles or the layout. Then, create your HTML documentation by specifying your new template:

``` bash
$ monodocs2html --source docfiles --dest htmldocs --template doctemplate.xsl
 
# -OR-
 
$ mdoc export-html --template doctemplate.xsl -o htmldocs docfiles
```

### Validate Monodoc XML format

There is a tool for validating the correction of the XML format of every XML documenation file of a class. To use it:

``` bash
$ mdvalidater ecma path-to-xml-file
 
# -OR-
 
$ monodoc --validate ecma path-to-xml-file
 
# -OR-
 
$ mdoc validate path-to-xml-file
```

Where *path-to-xml-file* is a path to a documentation file of a class. In the example above could be `doc/A/OtherAClass.xml`

`mdvalidator` and [mdoc-validate](/docs/tools+libraries/tools/mdoc/) also accept directories as arguments, in which case all files underneath the specified directories will be validated.

Inline XML Documentation
========================

The `/doc` option of [mcs](/docs/about-mono/languages/csharp/) provides the same functionality as the `/doc` command of csc, Microsoft's C\# compiler (and it's an option in Visual Studio too). It looks for XML documentation comments within source code (comments that start with three slashes, ///), and puts them all into a single XML file. Here's an example:

``` csharp
namespace MyLibrary {
  public class MyClass {
    /// <summary>This method does something.</summary>
    /// <remarks><para>I can put documentation about
    /// this method in my source code.</para>
    /// <para>That makes it easy to maintain, but some
    /// find it gets in the way.</para></remarks>
    public void DoSomething() {
    }
  }
}
```

Compiling this with:

``` bash
mcs test.cs /doc:doc.xml -t:library
```

Yields a file named "doc.xml" that contains:

    <doc>
        <assembly>
            <name>test</name>
        </assembly>
        <members>
            <member name="M:MyLibrary.MyClass.DoSomething">
                <summary>This method does something.</summary>
                <remarks>
                    <para>I can put documentation about
                this method in my source code.</para>
                    <para>That makes it easy to maintain, but some
                find it gets in the way.</para>
                </remarks></member>
        </members>
    </doc>

Since this feature is modeled after Microsoft's compiler, please refer to [their reference](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/csref/html/vclrfTagsForDocumentationComments.asp) for documentation comments for a list of what XML tags can be used.

Now, what you do with that XML file is up to you. [NDoc](http://ndoc.sourceforge.net/), a project separate from Mono, is an application that will take this XML file and render it in various formats, including CHM, JavaDoc-style HTML, and MSDN-style HTML. (In the past I've had trouble running NDoc under Mono. If you can run it in Windows, NDoc is very nice.)

### Converting Inline XML Documentation to Monodoc format

If you have already some documentation generated from inline XML code and you want to convert it to the format used by Monodoc, you can use [monodocer](/docs/tools+libraries/tools/monodocer/)'s *-importslashdoc* argument:

``` bash
$ monodocer -pretty -importslashdoc:doc.xml -assembly:A.dll -path:A/en
```

or you can use [mdoc-update](/docs/tools+libraries/tools/mdoc/)'s *--import* argument:

``` bash
$ mdoc update -i doc.xml -o A/en A.dll
```

The *A/en* directory will contain documentation for each type within *A.dll* containing the documentation imported from *doc.xml*.

### Converting Monodoc format XML into inline XML documentation

[mdoc-export-msxdoc](/docs/tools+libraries/tools/mdoc/) exports Monodoc XML to Microsoft XML Documentation:

``` bash
$ mdoc export-msxdoc A/en
```

will convert all Monodoc XML within *A/en* into Microsoft XML documentation. The file created is controlled by *A/en/index.xml* -- files will be created with the basenames of **/Overview//Assembly[@Name]]** and the file extension **.xml**.

