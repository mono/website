---
title: "NewClassesForEcma"
lastmodified: '2009-09-02'
redirect_from:
  - /NewClassesForEcma/
---

NewClassesForEcma
=================

New classes that we would like to see in ECMA:

-   System.Array:
    -   Any Array.Get/Set method signatures that we might need to support 64-bit arrays (Mono feature)

-   System.Reflection.Emit:
    -   All of them.

-   System.Data interfaces
    -   All interfaces
-   System.Data.Common typed
    -   The .NET 2.0 "replacement" for the above interfaces

-   System.Linq
    -   Everything LINQ

Changes that we would like to see:
==================================

-   Charset Encoding (UTF8) for P/Invoke
-   Add: System.Runtime.InteropServices/UnmanagedType.Long define that matches sizeof C's (long). This would help with pinvoking API's which use long arguments or struct members, since long is 32 bit on win32/win64, but 64 bit on unix.


