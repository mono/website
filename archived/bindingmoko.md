---
title: "BindingMoko"
lastmodified: '2007-10-25'
redirect_from:
  - /BindingMoko/
---

BindingMoko
===========

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#howto-create-a-binding-for-a-gobject-based-library">1 HowTo: Create a Binding for a GObject-based Library</a>
<ul>
<li><a href="#parsing-the-sources">1.1 Parsing the Sources</a></li>
<li><a href="#generating-c-sources">1.2 Generating C# sources</a></li>
<li><a href="#building-the-assembly">1.3 Building the assembly</a></li>
<li><a href="#summary">1.4 Summary</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

HowTo: Create a Binding for a GObject-based Library
===================================================

This article is a simple look at how to produce a managed binding for a GObject library written in C. It uses the GAPI toolset to produce a set of C\# source files binding the public API of the library. The target library is libmokoui2 from the openmoko project.

Parsing the Sources
-------------------

Start off by obtaining the sources for the library you wish to bind. For libmokoui2, I checked out the sources from their anonymous svn:

     http://svn.openmoko.org/trunk/src/target/OM-2007.2/libraries/libmokoui2/

The next step is creating a parser input file:

     <gapi-parser-input>
       <api filename="libmokoui2-api.xml">
         <library name="libmokoui2.so.0">
           <namespace name="Moko">
             <dir>../libmokoui</dir>
           </namespace>
         </library>
       </api>
     </gapi-parser-input>

The api filename attribute specifies the output location for the parse. library name indicates the installed name of the library. This value can be overridden by a .dll.config file at runtime on mono. The namespace name attribute indicates the text to strip from the front of all the C symbols. Finally, the dir is a relative path to the source location.

I named this file sources.xml. To run the parser and produce the output api.xml file, execute the following command:

     gapi2-parser sources.xml

Assuming the library adheres closely to GNOME coding standards, you should see output similar to the following:

     <dir ../libmokoui> 
     structs: 8  enums: 1  callbacks: 
     funcs: 0 types: 0  classes: 3
     props: 9 childprops:  signals: 3

Generating C\# sources
----------------------

To produce a set of binding sources, you need to run the api.xml file through the code generator. For the example moko binding, I used the following command:

     gapi2-codegen --generate libmokoui2-api.xml `pkg-config --cflags gtk-sharp-2.0` --assembly-name=moko-sharp --outdir=generated

We pass the api.xml file produced by the parse as the --generate arg. The pkg-config command gets the GAPI api.xml files associated with the gtk-sharp assemblies, because libmokoui2 depends on gtk+. The assembly-name arg specifies the output target assembly without the .dll extension, and outdir specifies a relative path to place the C\# source files. The directory will be created if it doesn't exist.

This command will produce output similar to the following:

     Generation Summary:
       Enums: 1  Structs: 0  Boxed: 0  Opaques: 0  Interfaces: 0  Objects: 4 Callbacks: 0
       Properties: 9  Signals: 3  Methods: 9  Constructors: 5  Throttled: 0
     Total Nodes: 31

Building the assembly
---------------------

All that's left is compiling the assembly:

     mcs -pkg:gtk-sharp-2.0 -out:moko-sharp.dll -target:library *.cs

The sample target depends on the gtk-sharp assemblies.

Summary
-------

This was a very simple example, because the libmokoui2 sources were very clean from a coding standard perspective. With C allowing so much freedom, any library you bind may provide more resistance to the tools. This shows up as console spew during the parse, generate, or compile stage.

Parser warnings can sometimes be worked around by patching the source files to make them more standardized. If the source code seems reasonable, it is entirely reasonable to file bugs against Gtk\# to extend the parser to deal with the code. Generation warnings can identify problems with unexpected parameter types. Most generation warnings just result in unbound API.

Compile errors can occur because of name conflicts in the bound api. Often, C methods with collide with signal names, for example. These sorts of issues can be worked around using gapi2-fixup and a metadata rule file. The fixup tool is a highly flexible way to markup the api.xml file. More information on metadata rules is available on the [GAPI](/GAPI "GAPI") reference wiki page.

The sample files for this example are [available for download](http://downloads.sourceforge.net/gtk-sharp/moko-sharp-0.1.tar.gz).

