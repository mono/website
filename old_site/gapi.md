---
layout: obsolete
title: "GAPI"
permalink: /old_site/GAPI/
redirect_from:
  - /GAPI/
---

GAPI
====

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#GAPI_Overview">1 GAPI Overview</a></li>
<li><a href="#Parsing_the_C_Source_Files">2 Parsing the C Source Files</a></li>
<li><a href="#Generating_Code_from_API_files">3 Generating Code from API files</a></li>
<li><a href="#Fixing_API_issues_and_Adding_Customizations">4 Fixing API issues and Adding Customizations</a>
<ul>
<li><a href="#Altering_and_Extending_the_API_File">4.1 Altering and Extending the API File</a>
<ul>
<li><a href="#Symbols">4.1.1 Symbols</a></li>
<li><a href="#Metadata">4.1.2 Metadata</a>
<ul>
<li><a href="#Adding_nodes">4.1.2.1 Adding nodes</a></li>
<li><a href="#Setting_Attributes">4.1.2.2 Setting Attributes</a></li>
<li><a href="#Moving_Nodes">4.1.2.3 Moving Nodes</a></li>
<li><a href="#Removing_Nodes">4.1.2.4 Removing Nodes</a></li>
</ul></li>
</ul></li>
<li><a href="#.custom_files">4.2 .custom files</a></li>
</ul></li>
<li><a href="#Library_name_mapping">5 Library name mapping</a></li>
<li><a href="#Putting_it_all_together">6 Putting it all together</a></li>
<li><a href="#Extra_Notes_and_Problem_Solving_Tips">7 Extra Notes and Problem Solving Tips</a>
<ul>
<li><a href="#Internal_Tools_and_Perl_Files">7.1 Internal Tools and Perl Files</a></li>
<li><a href="#XML::LibXML">7.2 XML::LibXML</a></li>
<li><a href="#XPath">7.3 XPath</a></li>
<li><a href="#Win32_binding_issues">7.4 Win32 binding issues</a></li>
</ul></li>
<li><a href="#Binding_GInterfaces">8 Binding GInterfaces</a></li>
</ul></td>
</tr>
</tbody>
</table>

GAPI Overview
-------------

The GAPI tools are distributed with [Gtk\#](http://gtk-sharp.sourceforge.net/). The tools make it easy create and maintain managed bindings to native libraries which utilize [glib](http://developer.gnome.org/doc/API/glib/) and [GObject](http://developer.gnome.org/doc/API/2.0/gobject/). Some examples of libraries currently bound using the GAPI tools include [Gtk](http://www.gtk.org/), [Atk](http://developer.gnome.org/doc/API/2.0/atk/atk.html), [Pango](http://www.pango.org/), [Gdk](http://developer.gnome.org/doc/API/gdk/), [libgnome](http://developer.gnome.org/doc/API/2.0/libgnome/), [libgnomeui](http://developer.gnome.org/doc/API/2.0/libgnomeui/),[libgnomecanvas](http://directory.fsf.org/graphics/misc/libgnomecanvas.html), and [GtkGLArea]({{site.github.url}}/old_site/GtkGLArea "GtkGLArea").

There are 3 primary tools provided by GAPI:

-   gapi2-parser - The parser is a C source and header parser that produces an XML document describing the API.
-   gapi2-fixup - The fixup tool is an alteration engine to manipulate XML API files via a set of transformation rules.
-   gapi2-codegen - The generator takes an XML API file as input and produces C\# source files to implement the specified API.

This article addresses the use of the gapi-2.0 tools, but is mostly usable as an example for the gapi-1.0 toolset with minor exceptions. In most cases, simply changing all "gapi2" references to "gapi" and all "gtk-sharp-2.0" references to "gtk-sharp" will produce the proper commands for gapi version 1.0.

Parsing the C Source Files
--------------------------

The first step in producing a GAPI binding is to run the GAPI parser on the C sources for the bound library. The gapi2-parser tool takes an XML file as input. This file is typically referred to as a .sources file. The simplest .sources file looks like this:

``` xml
 <gapi-parser-input>
  <api filename="a/path/to/an/output/file">
    <library name="libfoo.dll">
      <namespace name="Foo">
        <dir>/a/path/to/the/source/directory</dir>
      </namespace>
    </library>
  </api>
 </gapi-parser-input>
```

General rules of thumb are as follows:

-   All elements inside the gapi-parser-input element can have multiple instances.
-   You should have an \<api\> element for each managed assembly you are going to generate.
-   The api filename is the output file path.
-   The library name is the filename of the bound library. This name is used in the DllImport attributes in the generated source for the binding. If the library exists in Windows and you want your binding to work on the .Net runtime, always use the Windows library name. Mono has magic which will be described later in the article that can map this to an so or dylib name.
-   The namespace name is used to convert symbols like NamespaceFoo into Namespace.Foo during the parse.
-   You can use the \<dir\> element to parse all the files in a directory.
-   The \<file\> element can be used to specify a specific file. This is useful if there are only a few "public" files in a directory. The file element is valid within namespace elements.
-   The \<exclude\> element is used to specify private files in a previously declared \<dir\> element. The exclude element is valid within namespace elements.
-   You can use the new \<directory\> element to specify a directory path with child exclude elements that are relative to the path. This saves some typing on exclude paths and facilitates smoother version upgrading since often the version is in the path.
-   You should specify at a minimum all the public header files and the source files that contain class\_init and get\_type method implementations for all the public GObject and [GBoxed](http://developer.gnome.org/doc/API/2.0/gobject/gobject-Boxed-Types.html) types in the library.

The definitive example of a .sources file is in the gtk-sharp sources directory and can be viewed online [here](http://anonsvn.mono-project.com/viewvc/trunk/gtk-sharp/sources/gtk-sharp-2.12-sources.xml?view=markup).

Once your .sources file is complete, run the parser with the following syntax:

    gapi2-parser my-sources-file

The parser will print to stdout any content that it doesn't know how to handle. This is typically minimal if the library being parsed follows GNOME coding standards. However, if you are seeing source output to the console during the parse, please report it to bugzilla so the parser's regexen can be extended to accommodate your library.

Generating Code from API files
------------------------------

The following is an example of an API file produced by the GAPI parser:

``` xml
 <?xml version="1.0"?>
 <api>
 <!--
 
        This file was automatically generated.
        Please DO NOT MODIFY THIS FILE, modify .metadata files instead.
 
 -->
  <namespace name="GtkSpell" library="libgtkspell.dll">
    <enum name="Error" cname="GtkSpellError" type="enum">
      <member cname="GTKSPELL_ERROR_BACKEND" name="Backend"/>
    </enum>
    <struct name="GtkSpell" cname="GtkSpell" opaque="true">
      <method name="Attach" cname="gtkspell_attach" deprecated="1" shared="true">
        <return-type type="void"/>
        <parameters>
          <parameter type="GtkTextView*" name="view"/>
        </parameters>
      </method>
      <method name="Detach" cname="gtkspell_detach">
        <return-type type="void"/>
      </method>
      <method name="ErrorQuark" cname="gtkspell_error_quark" shared="true">
        <return-type type="GQuark"/>
      </method>
      <method name="GetFromTextView" cname="gtkspell_get_from_text_view" shared="true">
        <return-type type="GtkSpell*"/>
        <parameters>
          <parameter type="GtkTextView*" name="view"/>
        </parameters>
      </method>
      <method name="Init" cname="gtkspell_init" deprecated="1" shared="true">
        <return-type type="int"/>
      </method>
      <constructor cname="gtkspell_new_attach">
        <parameters>
          <parameter type="GtkTextView*" name="view"/>
          <parameter type="const-gchar*" name="lang"/>
          <parameter type="GError**" name="error"/>
        </parameters>
      </constructor>
      <method name="RecheckAll" cname="gtkspell_recheck_all">
        <return-type type="void"/>
      </method>
      <method name="SetLanguage" cname="gtkspell_set_language">
        <return-type type="gboolean"/>
        <parameters>
          <parameter type="const-gchar*" name="lang"/>
          <parameter type="GError**" name="error"/>
        </parameters>
      </method>
    </struct>
  </namespace>
 </api>
```

This file format is the input to the GAPI C\# code generator. If your library is only dependent on libglib/libgobject, you can generate code with the command:

    gapi2-codegen --outdir=generated_dir --generate my-api-file

This will produce a directory at the specified path containing the generated source files which can be compiled with your C\# compiler of choice. The mcs command to produce a managed library would be:

    mcs -pkg:gtk-sharp-2.0 -target:library -o foo-sharp.dll generated_dir/*.cs

Note: It is quite likely that the above command will initially fail with a typical GObject library. Collisions in nomenclature are common, for example, in the signal/method space for GObjects. Signals are a string API in C and therefore are allowed to have the same name as a method which emits the signal. The next section of this article discusses the gapi-fixup mechanism to deal with the typical problems which will need to be resolved to get a successful compilation.

The -pkg option to mcs is a shorthand to include assembly references which are provided by a pkg-config --libs invocation for a given package name. In the above command, -pkg:gtk-sharp-2.0 tells mcs to reference all the gtk-sharp-2.0 assemblies during compilation, which is necessary if your library references any glib symbols like GLib.Object. -o is the output filename for your assembly and -target:library tells mcs your are compiling a library as opposed to a standalone executable program.

If your library references symbols provided by an assembly other than glib-sharp.dll, you will need to provide some "include" options to the command so that the code generator knows how to properly expose the symbols to your library. For example, suppose your library provides some Gtk.Widget subclasses and therefore needs references to gtk-sharp.dll symbols. The necessary include options can be obtained with pkg-config using the --cflags option:

    gapi2-codegen --outdir=generated `pkg-config --cflags gtk-sharp-2.0` --generate my-api-file

Compilation is accomplished by the same mcs command as above.

During generation, any symbols which are unrecognized will cause a warning message to be printed to stdout. These will be cues to tell you if you are potentially missing some include API files, but can also point to problems that occurred during the parse that produced your API file. There are also warnings produced to indicate if potentially harmful/incorrect assumptions have been made by the generator. It is good to make sure you address all the warnings produced during generation, or at least are conscious of the potential issues lurking in your library binding if you choose not to address the warnings right away.

Fixing API issues and Adding Customizations
-------------------------------------------

Unfortunately, it's really not possible for a set of automated tools to perfectly interpret the intent of C source code into a C\# interface. There will be issues that will need to be addressed such as whether a particular pointer parameter to a method represents an out, ref, or array param. There will be portions of the API that make sense from a C programming standpoint, but are better exposed in a different manner under C\#.

GAPI provides some additional tools/mechanisms to make these sorts of changes to your API.

### Altering and Extending the API File

The gapi2-fixup tool is used to alter the API file. It is important to use the fixup tool to alter your API file instead of hand-editing it. At some point in the future, the library you are binding may ship a new version which adds API elements. If you use the fixup tool instead of hand editing the API file, you will be able to rerun the GAPI parser on the new C source files to extract all this new API automatically, and then rerun the fixup tool to apply your edits to the file. If you hand edit the file, you can never go back to the parse step without losing all your subsequent edits.

It is for this reason that in most existing bindings, including Gtk\# itself, the API file produced by the parse step is suffixed with a .raw extension and checked into the source repository for the project. Once a library version has been chosen and a parse completed, there is no need to keep around the C source code as all subsequent edits/customizations occur on the raw XML, which can be replaced/updated by the project maintainer periodically as parser enhancements occur and library version targets change.

The fixup tool uses a couple of different types of input files which are typically referred to as metadata and symbols files. Since the fixup tool updates an API file in place, typically the raw API file is copied to another name first before running the fixup tool. For example:

    cp foo-api.raw foo-api.xml
    gapi2-fixup --api=foo-api.xml --metadata=Foo.metadata --symbols=foo-symbols.xml

#### Symbols

The symbols file is just a shorthand for a group of symbol elements to be appended to the API file. It is also possible to perform the function of the symbols file using metadata and the \<add-node\> element, but symbols support is included for backward compatibility to a kinder, gentler time when add-node didn't exist.

The following is an excerpt from gdk-symbols.xml in Gtk\# and specifies some manually implemented symbols which didn't parse/generate very well because of some union related issues:

``` xml
  <api>
    <symbol type="alias" cname="GdkBitmap" name="GdkPixmap"/>
    <symbol type="marshal" cname="GdkEvent" name="Gdk.Event" marshal_type="IntPtr" call_fmt="{0}.Handle" from_fmt="Gdk.Event.GetEvent ({0})"/>
    <symbol type="marshal" cname="GdkEventAny" name="Gdk.Event" marshal_type="IntPtr" call_fmt="{0}.Handle" from_fmt="Gdk.Event.GetEvent ({0})"/>
    <symbol type="manual" cname="GdkEventButton" name="Gdk.EventButton"/>
    <symbol type="manual" cname="GdkEventClient" name="Gdk.EventClient"/>
    <symbol type="simple" cname="GdkKey" name="Gdk.Key"/>
  </api>
```

The type attribute values currently supported for symbol elements include:

-   alias - maps all cname references to generatable type "name"
-   manual - special case for IntPtr native types which are marshaled with a Handle property and demarshaled with an IntPtr ctor.
-   marshal - allows specification of marshaling/demarshaling Format strings and native type.
-   simple - does a text substitution from cname to name in generated source. Useful for simple mappings where the native and managed types are automatically marshaled by .Net, like int or byte.

#### Metadata

The metadata file is a powerful XPath based mechanism to change, add, hide, or move any element or attribute in the API file. XPath allows you to select a specific node or group of nodes from an XML document. All of the rule elements in the metadata spec include a path attribute to identify the node to which the rule is to be applied. **The rules are applied in the following order, not in the order they are encountered in the file:**

-   add-node - appends a child node to the node specified by the path attribute.
-   attr - sets the value of an attribute of the element specified by the path attribute.
-   move-node - moves the node specified by the path attribute to all nodes matching an XPath value.
-   remove-node - removes nodes matching a specified XPath.

##### Adding nodes

The add-node element is pretty straight-forward. In the following example:

``` xml
  <?xml version="1.0"?>
  <metadata>
    <add-node path="/api/namespace/object[@cname='GtkContainer']"><implements><interface name="IEnumerable" /></implements></add-node>
  </metadata>
```

an implements element is inserted into all "object" elements with a cname attribute of 'GtkContainer'.

This metadata rule allows you to insert any kind of node content you want anywhere in the API document. As indicated in the above section on the symbols file, this rule can be used to render that mechanism obsolete. An add-node rule with a path of "/api" and a \<symbol\> child is equivalent to a symbols file entry.

##### Setting Attributes

The attr element is the workhorse of the metadata format. You can use it to change the value of any existing attribute, or to insert new attributes onto any element in an API file. The \<attr\> element has two attributes, path and name. Use path to identify the elements to be altered, and name to identify the attribute name on the element. The following is a non-exhaustive list of attributes to be manipulated:

-   name - renames an API member
-   type - changes a member type, often used to identify enum parameters lazily exposed as ints in the C API
-   hidden - causes a member to be ignored by the generator
-   new\_flag - inserts a "new" keyword on a member if it exists in a subclass of the type containing it
-   pass\_as - indicates out and ref parameters
-   array - indicates array parameters (this marks GAPI to search and find a another param under the name n\_\<name\> to get the array length)
-   opaque - marks a struct as an opaque type so fields aren't accessible
-   disable\_raw\_ctor - suppresses generation of an IntPtr ctor for a type
-   disable\_gtype\_ctor - suppresses an obsolete constructor overload
-   scope - used to specify the scope of callback parameters, currently supported scopes are call, async, and notified
-   property\_name - used to map ctor parameters to prop\_names for g\_object\_new usage
-   preferred - marks a preferred ctor for conflict resolution when multiple constructor elements have the same signature
-   parent - changes to parent type for a GObject or adds one for an Opaque type
-   shared - indicates if a method is static or instance

Some concrete examples from Gtk.metadata in Gtk\#:

``` xml
  <?xml version="1.0"?>
  <metadata>
    <attr path="/api/namespace/object[@cname='GtkWindow']/signal[@name='ActivateDefault']" name="name">DefaultActivated</attr>
  </metadata>
```

This is a "rename" rule. The signal "activate\_default" on GtkWindow collides with the method gtk\_window\_activate\_default when the parser is done converting the names to StudlyCase. In the above rule, we rename the signal to avoid a compilation error since a type cannot have to member with the same name other than overloaded method signatures.

The following is another frequently used rule:

``` xml
  <?xml version="1.0"?>
  <metadata>
    <attr path="/api/namespace/struct[@cname='GtkTableChild']" name="hidden">1</attr>
  </metadata>
```

This rule sets the "hidden" attribute on an element, effectively making the generator ignore it. This is useful for removing undesired API from the binding. It can also be used to allow an API element to be manually implemented as a customization, which will be discussed in the next section of the article.

More to come.

##### Moving Nodes

The move-node element is used to reparent API elements where necessary. This is unusual, but can happen. In the following example:

``` xml
  <?xml version="1.0"?>
  <metadata>
    <move-node path="/api/namespace/class[@cname='GtkGlobal']/method[@name='PaintVline']">/api/namespace/object[@cname='GtkStyle']</move-node>
  </metadata>
```

a method named PaintVLine on the GtkGlobal class element is moved to a more appropriate type for it, the GtkStyle object.

##### Removing Nodes

The remove-node element is used to completely remove an element and all its children from the API file. This is an alternative to setting the hidden attribute on an element as described in the attr rules above. It results in smaller api files and presumably faster generation.

``` xml
  <?xml version="1.0"?>
  <metadata>
    <remove-node path="/api/namespace/struct[@cname='GnomeVFSFileInfo']" />
  </metadata>
```

### .custom files

The code generator has a --customdir argument where you can specify a path to .custom files containing customizations to your types. The customdir defaults to the current working directory if not specified.

When generating type Foo, if a Foo.custom file exists in the customdir, its contents are appended to the type declaration in the generated source. This allows the binding author to add convenience overloads for existing members, add new extensions, or hand-implement poorly generated methods by hiding them with metadata and providing a manual implementation in the custom file.

Library name mapping
--------------------

Like we said above you should always use the Windows name for the name of the library file. This is because in order to make it work on Windows with MS.NET we must use the filenames as they use it, as the are not able to map dynamically like we can. Mono has the ability to remap the library names to the correct library name in the p\\invoke statement. We do this using a "(library name).config" file.

For example with my gtkspell-sharp libraries, I include a .custom file named "gtkspell-sharp.dll.custom" in the following format:

``` xml
 <configuration>
  <dllmap dll="libglib-2.0-0.dll" target="libglib-2.0.so.0"/>
  <dllmap dll="libgobject-2.0-0.dll" target="libgobject-2.0.so.0"/>
  <dllmap dll="libatk-1.0-0.dll" target="libatk-1.0.so.0"/>
  <dllmap dll="libgtk-win32-2.0-0.dll" target="libgtk-x11-2.0.so.0"/>
  <dllmap dll="libgtkspell.dll" target="libgtkspell.so.0"/>
 </configuration>
```

Putting it all together
-----------------------

The GtkSpell\# package is a good simple working example of all the tools in action. You can check it out from the SVN in the 'gtkspell-sharp' module. You can also view it online here [GtkSpell\# viewvc](http://anonsvn.mono-project.com/viewvc/trunk/gtkspell-sharp/).

Makefiles should be laid out to make this easy to replicate if you plan to distribute.

Most GAPI bound libraries use the following directory layout:

-   foo-sharp/
    -   sources/
        -   foo-sharp.sources
        -   (any source packages)
    -   (library name)/
        -   (library name).raw
        -   generated/
    -   (library name)/
        -   (library name).raw
        -   generated/
    -   ...

Extra Notes and Problem Solving Tips
------------------------------------

### Internal Tools and Perl Files

Internally when you run the gapi parser it will lanuch a few perl scripts under the hood.

-   gapi.pl
-   gapi\_pp.pl
-   gapi2xml.pl

Also a tool called gapi\_format\_xml is included that will reformat the gapi2xml.pl output so its readable.

Sometimes when figuring out what is breaking, its good to know what is going on under the hood.

### XML::LibXML

If you want to run gapi-parser you need to install the XML::LibXML perl package since it will launch those perl scripts. Sometimes this can be a pain for WIN32 users to get running (although its not impossbile with Paco's Win32 CD) so you want to make sure you include the raw xml files when you distribute your sources. I suggest installing any LibXML, LibXML2, and expat libraries from your distro and most of the time this all you need and some distros include the XML::LibXML binding inside those packages. If not, then you can get it from CPAN using something like this:

    $ sudo perl -MCPAN -e shell
    .. (Walk through CPAN setup sometimes) ...
    CPAN> install XML::LibXML

### XPath

XPath is used in the metadata files to do the selection on the nodes you want to work on. I love to use Quick Refrence Cards because I can find print them out and they have all the information you need.

-   [XPath Language Quick Ref](http://www.digilife.be/quickreferences/QRC/XML%20Path%20Language%201.0.pdf)
-   [XPath/XSL Quick Ref](http://www.digilife.be/quickreferences/QRC/XSLT%20and%20XPath%20Quick%20Reference.pdf)

Also the W3C page is a good place to look for specifics [http://www.w3.org/TR/xpath](http://www.w3.org/TR/xpath)

### Win32 binding issues

To produce assemblies which run correctly on win32, some massaging of the IL code is necessary. We include a tool in gtk-sharp called gapi-cdecl-insert which replaces CDeclCallbackAttribute with the IL code necessary for correct native to managed callback delegate invocation. We use this mechanism to support bindings on .Net 1.x since the UnmanagedFunctionPointer attribute was not introduced until 2.0.

You can run this tool on assemblies intended for mono usage if you want to provide a single set of cross-platform assemblies for your binding, though it is not explicitly necessary on mono since it defaults to CDecl calling convention.

Binding GInterfaces
-------------------

[GInterfaces]({{site.github.url}}/old_site/ImplementingGInterfaces "ImplementingGInterfaces") support was added recently (firstly, support for querying them in unmanaged objects from the managed side, and later, being able to use them from a managed object).

But sometimes dealing with them may be tricky, as some non-public (not defined in the binding) unmanaged object may be obtained by a managed method, which supports a GInterface in theory, but in the end is not registered in the Mono object model as implementing the managed GInterface counterpart.

Example:

    Atk.Object atk = new Gtk.Label ().Accessible;

The above expression returns an Atk.Object in the managed side, but in the unmanaged side it indeed returns a GailLabel (which inherits from Atk.Object). As GailLabel type is not mapped (does not exist in the managed assembly of the Gtk or Atk bindings), the following expression does not give you any clue about the GInterfaces it may provide:

    new Gtk.Label ().Accessible.GetType ().GetInterfaces ()

For these cases, you can bind the required GInterface by calling a static method on its adapter class:

    Atk.Text atkText = Atk.TextAdapter.GetObject (new Gtk.Label ().Handle, false);

