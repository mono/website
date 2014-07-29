---
layout: docpage
navgroup: docs
title: GDB Debugging Support (XDEBUG)
redirect_from:
  - /Mono:Runtime:Documentation:XDEBUG/
---

XDEBUG makes it possible the debugging of managed code using gdb. It works by creating ELF object files containing debug information about managed code, and registering it with gdb using the JIT debug interface in gdb 7.0, or using the 'add-symbol-file' command in earlier gdb versions. The implementation is in the xdebug.c file. It builds on the ELF image writer functionality in image-writer.c, and the DWARF debug info emission functionality in dwarfwriter.c, so it is pretty small.

