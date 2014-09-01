---
title: Monodoc Contributing
redirect_from:
  - /Monodoc_Contributing/
---

**This article is incomplete, please add to it.**

This article is about contributing to the class library documentation.

Mono-specific API Documentation
===============================

The Documentation of the libraries is not complete and your contribution would be greatly apreciated. For contributing you will need the [Gtk# Documentation Browser](/docs/tools+libraries/tools/monodoc/).

The procedure is easy, browse to the part of the documentation you want to contribute and click on the [Edit] link to start writing the documentation. You can also look for the parts that are listed as *To be added* or as *Documentation for this section has not yet been entered*. You can find information about editing documentation [here](/docs/tools+libraries/tools/monodoc/editing/).

The contributions you are writting will be listed as links at the home page in a red panel called *Contributions*. If you are not happy with a contribution, you can delete it using the *Restore* button when editing it.

Once you are done, you can submit your contributions directly from the [Gtk# Documentation Browser](/docs/tools+libraries/tools/monodoc/). Use the menu File --\> Contributions --\> Upload contributions. If you had never contributed before, you will have to register in our server. The process can be performed inside the program. You will recieve an email with a password the program will remember once you enter it. All the process lasts only a couple of minutes.

Aside from the core libraries, we also have a large body of class libraries that are specific to Mono, for example the documentation for Gtk#.

Gtk# documentation
-------------------

The project goal is to fill in the data with useful information. Feel free to grab liberally information from the Gtk documentation from: [http://developer.gnome.org/doc/API/](http://developer.gnome.org/doc/API/)

Of course, the API does not apply directly. It only applies at a foundational level, so you can not really just copy and paste. Summaries, and remarks sections can probably be lifted with little or no effort. Gtk# uses properties to represent get/set operations in the C API, so you can also use some bits from there. Most of the documentation contains already place holders for text, we use the internationally approved phrase for this purpose, \`To be added'. So the quest is to remove all of the "To be added" strings with information which resembles as closely as possible the toolkit reality.

Words of warning
================

A few words of warning and advice for class documenters:

A well-documented API can ease hours of frustration; as Mono matures, robust and complete class library documentation will become increasingly important. As you write API documentation, whether it is embedded in source files or in external Monodoc XML, please keep the following in mind: Plagiarism, even if it's unintentional, is a Bad Thing(TM). Microsoft's .NET Framework Class Library documentation is an excellent resource for understanding the behavior and properties of a type, and a lot of hard work went in to creating this (copyrighted) resource. Please don't copy from Microsoft's reference when documenting a type.

To avoid this, I ([jbarn@httcb.net](mailto:jbarn@httcb.net)) suggest that you read the complete Microsoft documentation for a type, ponder it for a while, and write the Mono documentation in your own words. While it's certainly okay to refer to the Microsoft documentation to clarify your understanding of behavior or properties, please don't open the Microsoft docs and refer to them for each member you document. The best way of documenting is to read our source code implementation and explain in your own words what our implementation does, and what the user can do with it. There's a lot of domain expertise among the class library contributors; let's put the same personal stamp on the class library documentation that we have on the class libraries themselves.

