---
title: "MacOSPackaging"
lastmodified: '2008-10-19'
permalink: /archived/MacOSPackaging/
redirect_from:
  - /MacOSPackaging/
---

MacOSPackaging
==============

Splitting up Mono's DMG for MacOS into a runtime and SDK.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#background">1 Background</a>
<ul>
<li><a href="#mono-runtime">1.1 Mono Runtime</a></li>
<li><a href="#mono-sdk">1.2 Mono SDK</a></li>
</ul></li>
<li><a href="#split">2 Split</a></li>
<li><a href="#things-to-drop">3 Things to drop</a></li>
</ul></td>
</tr>
</tbody>
</table>

Background
----------

### Mono Runtime

Only contains code that is necessary at runtime (including non-obvious dependencies like

### Mono SDK

Contains development tools, static libraries, development commands

Split
=====

Considering the base directory /Library/Frameworks/Mono.framework/Versions/VER, the following are relative files that should not be included in the runtime:

``` bash
bin/al
bin/al1
bin/al2
bin/booc
bin/cilc
bin/gapi2-*
bin/gdk-pixbuf-csource
bin/genxs*
bin/glib-*
bin/gobject-query
bin/gtester
bin/gtester-report
bin/gtk-builder-convert
bin/gtk-demo
bin/gtk-query-immmodules-2.0
bin/gtk-update-icon-cache
bin/ikvmc
bin/ikvmstub
bin/jay
bin/libglade-convert
bin/macpack
bin/mdassembler
bin/mdcs2ecma
bin/mdnormalizer
bin/mdoc
bin/mdoc-assembly
bin/mdoc-export-html
bin/mdoc-export-msxdoc
bin/mdoc-update
bin/mdoc-validate
bin/mdvalidater
bin/mjs
bin/mkbundle*
bin/mod
bin/mono-api-diff
bin/mono-api-info*
bin/mono-find*
bin/monodocer
bin/monodocs2html
bin/monodocs2slashdoc
bin/monograph
bin/monolinker
bin/monop1
bin/msgfmt
bin/msgmerge
bin/nant
bin/nunit-console
bin/nunit-console2
bin/pango-querymodules
bin/pedump
bin/permview
bin/prj2make
bin/resgen*
bin/sgen
bin/smcs
bin/soapsuds
bin/sqlite3
bin/sqlsharp
bin/wsdl*
bin/xbuild
bin/xsd*
include/*
share/aclocal
share/dtds
share/doc
share/gapi-2.0
share/gtk-2.0
share/icon-naming-utils
share/info
share/jay
share/NAnt
share/libgc-mono
share/pkgconfig
share/xml
lib/glib-2.0/include
lib/gtk-2.0/include
lib/gtk-sharp-2.0/gapi-fixup.exe
lib/gtk-sharp-2.0/gapi-parser.exe
lib/gtk-sharp-2.0/gapi2xml.pl
lib/gtk-sharp-2.0/gapi-codegen.exe
lib/gtk-sharh-2.0/gapi_pp.pl
lib/monodoc/*
lib/pkgconfig
lib/xsp/test
lib/xsp/unittests
lib/*a 
lib/mono/2.1
lib/mono/monodoc
```

Plus any executables referenced by the bin/ directories. Plus man pages that refer to bits moved into the SDK.

Things to drop
==============

bin/mjs bin/gtk-demo

