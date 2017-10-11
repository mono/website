---
title: MDoc
redirect_from:
  - /Mdoc/
---

*mdoc* is a suite of tools much like [svn](http://subversion.apache.org/) or [git](http://git.or.cz) which provides a consistent front-end to the existing [Monodoc](/docs/tools+libraries/tools/monodoc/) related applications.

.NET Download
-------------

For .NET users who wish to use mdoc without installing Mono (e.g. to bundle mdoc specifically with a larger project), you can download from the [latest release from github](https://github.com/mono/api-doc-tools/releases), or otherwise clone and build the source yourself: https://github.com/mono/api-doc-tools/

mdoc Commands
-------------

The following are links to the mdoc man pages:

-   [mdoc(1)](http://www.go-mono.org/docs/monodoc.ashx?link=man:mdoc(1)): Front-end to all other *mdoc* commands. *mdoc assemble* is equivalent to *mdoc-assemble*.
-   [mdoc-assemble(1)](http://www.go-mono.org/docs/monodoc.ashx?link=man:mdoc-assemble(1)): Assembles a directory of [mdoc(5)](http://www.go-mono.org/docs/monodoc.ashx?link=man:mdoc(5))-formated XML documentation into a *.zip* file for display in [monodoc](/docs/tools+libraries/tools/monodoc/).
    -   Equivalent to [Assembler](/docs/tools+libraries/tools/mdassembler/).
-   [mdoc-export-html(1)](http://www.go-mono.org/docs/monodoc.ashx?link=man:mdoc-export-html(1)): Exports [mdoc(5)](http://www.go-mono.org/docs/monodoc.ashx?link=man:mdoc(5)) documentation into a set of static HTML files.
    -   Equivalent to [monodocs2html](/docs/tools+libraries/tools/monodoc/generating-documentation/#generating-static-html-documentation)
-   [mdoc-export-msxdoc(1)](http://www.go-mono.org/docs/monodoc.ashx?link=man:mdoc-export-msxdoc(1)): Exports [mdoc(5)](http://www.go-mono.org/docs/monodoc.ashx?link=man:mdoc(5)) documentation into a single Microsoft XML documentation file for use with Visual Studio and other documentation systems.
-   [mdoc-update(1)](http://www.go-mono.org/docs/monodoc.ashx?link=man:mdoc-update(1)): Updates existing [mdoc(5)](http://www.go-mono.org/docs/monodoc.ashx?link=man:mdoc(5)) documentation to reflect changes within a set of assemblies.
    -   Equivalent to [monodocer](/docs/tools+libraries/tools/monodocer/).
-   [mdoc-validate(1)](http://www.go-mono.org/docs/monodoc.ashx?link=man:mdoc-validate(1)): Validates the [mdoc(5)](http://www.go-mono.org/docs/monodoc.ashx?link=man:mdoc(5)) XML against the *mdoc*(5) schema.
    -   Equivalent to [mdvalidater](/docs/tools+libraries/tools/monodoc/generating-documentation/#validate-monodoc-xml-format).
