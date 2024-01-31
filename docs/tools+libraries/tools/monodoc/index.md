---
title: Monodoc
redirect_from:
  - /Monodoc/
---

Monodoc is a set of libraries and applications for viewing and editing Mono class library documentation. Monodoc is part of the [Mono Documentation Project](/docs/).

## Viewing The Documentation

### Online Documentation

You can view the complete documentation library online (only API documentation) at [<http://docs.go-mono.com/>](http://docs.go-mono.com/).

### Mod (Command-Line Documentation Viewer)

To browse API documentation from a shell terminal, you can use the \`mod' command. Use it to lookup types, or see the members of a type, displayed in a text-only web browser.

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

## Creating Documentation, Contributing

-   For information on how to document your own class libraries using monodoc, see [Generating Documentation](/docs/tools+libraries/tools/monodoc/generating-documentation/).
-   If you would like to contribute to the mono class library documentation (and we would love it if you did!), see [Monodoc Contributing](/docs/tools+libraries/tools/monodoc/contributing/).

## My Documentation in Monodoc

See the [assembler](/docs/tools+libraries/tools/mdassembler/) page for a description how to add your documentation to monodoc permanently.
