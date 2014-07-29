---
layout: docpage
navgroup: docs
title: Monodoc
redirect_from:
  - /Monodoc/
---

Monodoc is a set of libraries and applications for viewing and editing Mono class library documentation. Monodoc is part of the [Mono Documentation Project]({{ site.github.url }}/docs/).

Viewing The Documentation
=========================

The Gtk\# Documentation Browser
-------------------------------

The doc browser is part of the mono-tools package, avaliable from the [Downloads]({{ site.github.url }}/download/) page.

Once installed, you can launch it from the "Programing" section of the Applications menu, as shown in the image below, or by typing *monodoc* in a terminal window.

[![Gnome menu-monodoc-1.png]({{ site.github.url }}/archived/images/1/1d/Gnome_menu-monodoc-1.png)]({{ site.github.url }}/archived/images/1/1d/Gnome_menu-monodoc-1.png)

The browser lets you navigate through different types of documentation installed on your system. Usually, it shows the documentation of:

-   Core Framework API
-   Mono libraries
-   Novell libraries
-   C\# Language Specification
-   Compiler error reference

Depending on the libraries installed on your system it can show additionally:

-   Gnome libraries
-   Mozilla library
-   Monkeyguide (Mono guide)

Of course, more documentation sources can be added from installed libraries or from your own generated documentation as explained in [Generating Documentation]({{ site.github.url }}/docs/tools+libraries/tools/monodoc/generating-documentation/). Also, from inside the browser, you can [contribute]({{ site.github.url }}/docs/tools+libraries/tools/monodoc/contributing/) to the documentation of the Mono project.

Online Documentation
--------------------

You can view the complete documentation library online (only API documentation) at [http://www.go-mono.com/docs/](http://www.go-mono.com/docs/).

Mod (Command-Line Documentation Viewer)
---------------------------------------

To browse API documentation from a shell terminal, you can use the \`mod' command. Use it to lookup types, or see the members of a type. You get the same information as the Monodoc graphical application, but displayed in a text-only web browser.

To get all the types in a namespace:

``` bash
mod N:System
mod N:Gtk
```

To see the members of a type, run mod like:

``` bash
mod T:System.Collections.ArrayList
```

You can restrict the output to just members by adding `/M`:

``` bash
mod T:System.Collections.ArrayList/M
```

You can also use C, P, F, and E for constructors, properties, fields, and events.

To get one method, copy-and-paste the URL from the output in the above:

``` bash
mod 'M:System.Collections.ArrayList.ToArray(System.Type)'
```

Creating Documentation, Contributing
====================================

-   For information on how to document your own class libraries using monodoc, see [Generating Documentation]({{ site.github.url }}/docs/tools+libraries/tools/monodoc/generating-documentation/).
-   If you would like to contribute to the mono class library documentation (and we would love it if you did!), see [Monodoc Contributing]({{ site.github.url }}/docs/tools+libraries/tools/monodoc/contributing/).

My Documentation in Monodoc
===========================

See the [assembler]({{ site.github.url }}/docs/tools+libraries/tools/mdassembler/) page for a description how to add your documentation to monodoc permanently.

