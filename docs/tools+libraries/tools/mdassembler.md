---
title: Assembler
redirect_from:
  - /Assembler/
---

The **assembler** is a tool to merge mdoc/monodocer output into three files. Since [mdoc](/docs/tools+libraries/tools/mdoc/) and [monodocer](/docs/tools+libraries/tools/monodocer/) produces tons of output files this is very unhandy to redistribute. Additionally, the documentation can not be shown in [monodoc](/docs/tools+libraries/tools/monodoc/) by just clicking it's icon you have to type *monodoc mydocs-folder* into your console. The **assembler** can be invoked by using [mdoc-assemble](http://docs.go-mono.com/index.aspx?link=man:mdoc-assemble(1)) or (for older Mono versions) with the **mdassembler** command.

## Usage

**Note:** This example assumes you already have a documentation generated from monodcer in the *mydocs-folder*

    mdoc assemble -o mydocs-lib mydocs-folder
    # or
    mdassembler --ecma mydocs-folder -o mydocs-lib

This command will create a mydocs-lib.tree and mydocs-lib.zip file in your mydocs-folder. Where mydocs-folder is the folder containing your mdoc output and mydocs-lib is the name of your library, which can be chosen at will.

After that a .sources file must be created with the same name as the .tree and .zip files. The .sources file is a simple text file containing the following code of xml:

``` xml
<?xml version="1.0"?>
 <monodoc>
  <node label="My Library Documentation" name="mydocs-lib" parent="libraries"/>
  <source provider="ecma" basefile="mydocs-lib" path="mydocs-lib"/>
 </monodoc>
```

The */monodoc/node* element tells the browser where in the documentation tree the documentation should be shown. See [Generating_Documentation#Assemble_the_generated_Documentation](/docs/tools+libraries/tools/monodoc/generating-documentation/#assemble-the-generated-documentation) for more information.

The */monodoc/source/@provider* attribute tells the browser which kind of documentation is showing. When editing library documentation it should always be *ecma* (writing other types of documentation, like man pages, tutorial, etc. means changing that provider attribute).

The */monodoc/source/@basefile* attribute tells the browser where to find that documentation; it is the name of your .zip and .tree files.

The */monodoc/source/@path* attribute is a tag that lets the browser group the different documentation sources in sections (showed in the tree view). If we make two different set of documentations (from two different libraries we have written) they could be grouped together as long as we use the same path. This is, for example, the way used to group the GtkSourceView and Gtk-Sharp documentation together. You can look for more examples in the *sources* directory of monodoc.

**Note:** Monodoc supports multiple \<source\>-elements in case you want more than one .tree and .zip file appear under the same node in your monodoc browser.

The next step is to move the generated documentation files (sources, zip and tree) to the *sources* directory of monodoc. That directory can be found with one of the following commands:

``` bash
pkg-config monodoc --variable=sourcesdir
monodoc --get-sourcesdir #(deprecated)
```

You can start [Monodoc](/docs/tools+libraries/tools/monodoc/) and a new item named *My Library Documentation* will be shown. You can now navigate or [edit](/docs/tools+libraries/tools/monodoc/generating-documentation/#edit-and-write-documentation) it.
