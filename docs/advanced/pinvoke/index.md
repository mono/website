---
title: Interop with Native Libraries
redirect_from:
  - /Interop_with_Native_Libraries/
  - /Dllimport/
  - /DllImport/
  - /PInvoke/
---

## Introduction

The [Common Language Infrastructure](http://www.ecma-international.org/publications/standards/ecma-335.htm) (CLI) is designed to make it "easy" to interoperate with existing code. In principle, all you need to do is create a [DllImport](http://docs.go-mono.com/index.aspx?link=T:System.Runtime.InteropServices.DllImportAttribute) function declaration for the existing code to invoke, and the runtime will handle the rest. For example:

``` csharp
 [DllImport ("libc.so")]
 private static extern int getpid ();
```

Please note that most of the classes and enumerations mentioned in this document reside in the [System.Runtime.InteropServices](http://docs.go-mono.com/index.aspx?link=N:System.Runtime.InteropServices) namespace.

The above C# function declaration would invoke the POSIX **getpid**(2) system call on platforms that have the `libc.so` library. If `libc.so` exists but doesn't have the **getpid** export, an [EntryPointNotFoundException](http://docs.go-mono.com/index.aspx?link=T:System.EntryPointNotFoundException) exception is thrown. If `libc.so` can't be loaded, a [DllNotFoundException](http://docs.go-mono.com/index.aspx?link=T:System.DllNotFoundException) exception is thrown. Simple. Straightforward. What could be easier?

There are three problems with this:

1.  [Specifying the library in the DllImport statement](#library-handling).
2.  [Determining what function to actually invoke](#invoking-unmanaged-code).
3.  [Passing parameters](#marshaling); most existing code is far more complex. Strings will need to be passed, structures may need to be passed, memory management practices will become involved...

Existing code is a complex beast, and the interop layer needs to support this complexity.

## Library Handling

How does the runtime find the library specified in the **DllImport** attribute? This question is inherently platform specific.

### Windows DLL Search Path

From the MSDN LoadLibrary documentation, the DLLs needed by the program are searched for in the following order:

1.  The directory from which the application loaded.
2.  The current directory
3.  The system directory. Use the [GetSystemDirectory()](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/sysinfo/base/getsystemdirectory.asp) function to get the path of this directory.
4.  The 16-bit system directory.
5.  The Windows directory. Use the [GetWindowsDirectory()](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/sysinfo/base/getsystemdirectory.asp) function to get the path of this directory.
6.  The directories that are listed in the `PATH` environment variable.

Of course, reality isn't quite that simple. In practice, the "system" directory is actually `%WINDIR%\system32`, except on Windows 9x platforms where it's `%WINDIR%\system`. The 16-bit system directory is typically `%WINDIR%\system`, but isn't recognized as a separate search directory on Windows 9x platforms.

Furthermore, on Windows Server 2003 and Windows XP SP1, the registry entry `HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\SafeDllSearchMode` alters the above ordering. If this is `1` (the default), then the current directory is searched after the system and Windows directories. This is a security feature (it prevents a trojan library from being loaded instead of, for example, `OLE32.DLL`), but it turns the above list into: 1, 3, 4, 5, 2, 6.

See also: [LoadLibrary() Documentation at MSDN](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dllproc/base/loadlibrary.asp)

### Linux Shared Library Search Path

From the **dlopen**(3) man page, the necessary shared libraries needed by the program are searched for in the following order:

1.  A colon-separated list of directories in the user's `LD_LIBRARY_PATH` environment variable. This is a frequently-used way to allow native shared libraries to be found by a CLI program.
2.  The list of libraries cached in `/etc/ld.so.cache`. `/etc/ld.so.cache` is created by editing `/etc/ld.so.conf` and running **ldconfig**(8). Editing `/etc/ld.so.conf` is the preferred way to search additional directories, as opposed to using `LD_LIBRARY_PATH`, as this is more secure (it's more difficult to get a trojan library into `/etc/ld.so.cache` than it is to insert it into `LD_LIBRARY_PATH`).
3.  `/lib`, followed by `/usr/lib`.

As a Mono extension, if the library being loaded is `__Internal`, then the main program is searched for method symbols. This is equivalent to calling **dlopen**(3) with a *filename* of `NULL`. This allows you to P/Invoke methods that are within an application that is embedding Mono.

See also: the **dlopen**(3) man page, the **ld.so**(8) man page, [Dissecting shared libraries](http://ibm.com/developerworks/linux/library/l-shlibs.html?ca=dgr-lnxw07SharedLib).

### macOS Framework and .dylib Search Path

The Framework and library search path is:

1.  A colon-separated list of directories in the user's `DYLD_FRAMEWORK_PATH` environment variable.

2.  A colon-separated list of directories in the user's `DYLD_LIBRARY_PATH` environment variable.

3.  A colon-separated list of directories in the user's `DYLD_FALLBACK_FRAMEWORK_PATH` environment variable, which defaults to the directories:

    -   `~/Library/Frameworks`
    -   `/Library/Frameworks`
    -   `/Network/Library/Frameworks`
    -   `/System/Library/Frameworks`

4.  A colon-separated list of directories in the user's `DYLD_FALLBACK_LIBRARY_PATH` environment variable, which defaults to the directories:

    -   `~/lib`
    -   `/usr/local/lib`
    -   `/lib`
    -   `/usr/lib`

Note: Mono uses GLib to load libraries, and GLib has a bug on macOS where it doesn't use a `.dylib` extension, but instead uses the Unix `.so` extension. While this should eventually be fixed, the current workaround is to [write a `.config` file which maps to the `.dylib` file](#library-names), e.g.

``` xml
 <configuration>
   <dllmap dll="mylib" target="mylib.dylib" />
 </configuration>
```

TODO: Will mono support both frameworks and dylibs?

See also: [The Framework as a Library Package at Apple](http://developer.apple.com/documentation/MacOSX/Conceptual/SystemOverview/Frameworks/chapter_7_section_2.html), the [dyld(1) man page](http://www.hmug.org/man/1/dyld.html)

### Library Names

Knowing where to look for the library is only half of the problem. Knowing what library to load is the other half.

Different platforms have different naming conventions. Windows platforms append `.DLL` to the library name, such as `OLE32.DLL`. Linux platforms use a `lib` prefix and a `.so` suffix<sup>(see Note 1)</sup>. macOS platforms have a `lib` prefix and a `.dylib` suffix, unless they're a Framework, in which case they're a directory and things get more complicated.

Note 1: Strictly speaking, Unix shared libraries are typically versioned, and the version number follows the `.so` suffix. For example, `libfreetype.so.6.3.3` is a fully versioned library. Versioning throws a "wrench" into the works, and is best dealt with through Mono's \<dllmap/> mechanism; see below for details.

If you have control over the library name, keep the above naming conventions in mind and don't use a platform-specific library name in the **DllImport** statement. Instead, just use the library name itself, without any prefixes or suffixes, and rely on the runtime to find the appropriate library at runtime. For example:

``` csharp
 [DllImport ("MyLibrary")]
 private static extern void Frobnicate ();
```

Then, you just need to provide `MyLibrary.dll` for Windows platforms, `libMyLibrary.so` for Unix platforms, and `libMyLibrary.dylib` for macOS platforms.

Note: Windows will not automatically append a `.dll` extension to library names that already have a period (.) in their name, such as `libgtk-win32-2.0-0.dll`. If you try to use `libgtk-win32-2.0-0` as the library name, Windows won't automatically append `.dll`, resulting in a **DllNotFoundException**. Consequently you should either avoid periods in library names or always use the full filename (including the `.dll` extension) and rely on Mono's \<dllmap/> mechanism.

What if you don't have the same name across all platforms? For example, the GTK+ library name on Windows is `libgtk-win32-2.0-0.dll`, while the Unix equivalent library is `libgtk-x11-2.0.so`. How do you write portable Platform Invoke (P/Invoke) code that will work cross-platform?

The short answer is that you don't. There is no standard way of specifying platform-specific library names.

However, as an extension, Mono provides a library mapping mechanism. Two places are searched for library mappings: in the `$prefix/etc/mono/config` XML file, and in a per-assembly `.config` file, located in the same directory as the assembly. The .config file must be named like the assembly with ".config" as extension, e.g. `MyAssembly.exe.config` or `MyAssembly.dll.config`. These files contains `<dllmap/>` elements, which map an input library (the library specified in the **DllImport** statement) to the actual platform-specific library to load. For example:

``` xml
 <configuration>
    <dllmap dll="libgtk-win32-2.0-0.dll" target="libgtk-x11-2.0.so" />
 </configuration>
```

Unlike .NET, Mono permits `.DLL` assemblies to have `.config` files, which are *only* used for this library mapping mechanism.

Using this mechanism, the Mono-endorsed way of specifying **DllImport** library names is to always use the Windows library name (as Microsoft .NET has no library mapping mechanism), and then provide a mapping in the per-assembly `.config` file. This is what the Gtk# library does.

This mechanism can also be used to load strongly-versioned libraries on Unix platforms. For example:

``` xml
 <configuration>
   <dllmap dll="gtkhtml-3.0" target="libgtkhtml-3.0.so.4" />
 </configuration>
```

## Invoking Unmanaged Code

As far as managed code is concerned, unmanaged code is invoked merely by invoking a method with an associated **DllImport** attribute. The CLI runtime must do more work to actually invoke the unmanaged code.

In principle, this is a straightforward process. The library specified in the **DllImport** attribute is loaded, as described above. Then, the specified function is looked up (via [GetProcAddress()](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dllproc/base/getprocaddress.asp) or **dlsym**(3)). Finally, the function is invoked.

But what string is used for the function lookup (in `GetProcAddress()` or **dlopen**(3))? By default, the name of the managed code method is used, which is why [getpid() in the above example](#introduction) invokes **getpid**(2) from the C library.

Alternatively, the **DllImport** attribute's [EntryPoint](http://docs.go-mono.com/index.aspx?link=F:System.Runtime.InteropServices.DllImportAttribute.EntryPoint) field can be set, and that string will be used instead.

Either way, the string used is assumed to refer to a C ABI-compatible function exported by the specified library. On some platforms, this may cause a leading underscore to be prefixed to the symbol name. Other platforms generate no mangling.

Note that a C ABI is assumed. This makes it nearly impossible to directly invoke functions that are not C ABI compatible, such as C++ library functions that are not `extern "C"`. Some variation on the C ABI is permitted, such as variation in the function's [CallingConvention](http://docs.go-mono.com/index.aspx?link=T:System.Runtime.InteropServices.CallingConvention). The default CallingConvention is platform-specific. Under Windows, [Winapi](http://docs.go-mono.com/index.aspx?link=F:System.Runtime.InteropServices.CallingConvention.Winapi) is the default, as this is used for most Win32 API functions. (**Winapi** is equivalent to **Stdcall** for Windows 9x and Windows NT.) Under Unix platforms, [Cdecl](http://docs.go-mono.com/index.aspx?link=F:System.Runtime.InteropServices.CallingConvention.Cdecl) is the default.

Calling convention can be specified in C code by using the `__stdcall` and `__cdecl` compiler intrinsics under Microsoft Visual C++, and by using the `__attribute__((stdcall))` and `__attribute__((cdecl))` compiler intrinsics under GCC.

Does having the default CallingConvention vary between platforms cause portability problems? Yes. All the more reason to write as much code as possible as managed code, avoiding the whole P/Invoke/marshaling conundrum in the first place.

If you need to invoke C++ code, you have two choices:

1. make the C++ function `extern "C"`, treat it as a C function, and make sure that it uses a known calling convention
2. don't make the function `extern "C"`, but make sure it uses a known calling convention

If you use option (2), you'll need to set the [DllImport.EntryPoint](http://docs.go-mono.com/index.aspx?link=F:System.Runtime.InteropServices.DllImportAttribute.EntryPoint) field to the C++ mangled function name, such as `_Z6getpidv`.

You can retrieve the mangled name through your compiler's binary tools, such as `OBJDUMP.EXE` or **nm**(1). Note that C++ mangled names are *highly* compiler specific, and will:

1.  make your .NET assembly platform specific (you'll need a different assembly for each different platform);
2.  require updating the .NET assembly every time you change C++ compilers (as the C++ name mangling scheme varies by compiler and can -- and frequently will -- change); and
3.  be really ugly to maintain because of the above. This option is not recommended.

If you have lots of C++ code that needs to be wrapped, you might want to look into [SWIG](http://www.swig.org/), a code generation program that easily wraps existing C and C++ code for use by a multitude of languages, including CLI languages. This makes it easier to invoke C++ code from a CLI application.

In case you call a function that is not present in the native library (or that is not public) you will get an EntryNotFoundException. In order to find out which symbols are available for a library, it's interesting to use the following command (the example used is a shared library from Subversion):

    objdump -T /usr/lib/libsvn_client-1.so.0

### Runtime Exception Propagation

The above section mentioned a key point: P/Invoke assumes that the unmanaged code conforms to the C ABI. C doesn't support exceptions. As such, it is assumed that runtime exceptions will not propagate through unmanaged code.

Furthermore, it's fairly simple for an exception to propagate through unmanaged code whenever unmanaged code invokes managed code. This typically occurs through the use of callbacks -- using a function pointer on the unmanaged side which can invoke a delegate on the managed side. It is very important that the managed code *not* propagate *any* exceptions -- it *must* catch all exceptions, or else the unmanaged code calling the delegate will break.

The problem is, again, C doesn't support exceptions. C++ supports exceptions, BUT, and this is crucial, the C++ exception mechanism will be different from the managed code exception mechanism (with one exception to this rule). Since managed code doesn't know about unmanaged code's exception handling support (C is assumed, and C doesn't support exceptions), unmanaged exception handling support might as well not exist, because it won't be used.

The one exception to this is when you use *both* Microsoft .NET and Microsoft Visual C++ to compile the unmanaged code. .NET uses Windows Structured Exception Handling (SEH) at the P/Invoke layer for its exception handling mechanism, and Microsoft Visual C++ uses SEH to implement C++ exception handling and supports the use of SEH in C as a language extension through the `__try`, `__except`, and `__finally` keywords. SEH is a Microsoft extension; it does not exist outside of Microsoft and .NET, and as such is not portable.

Given the above scenario -- unmanaged code invokes function pointer which generates a managed exception -- what would happen? The managed exception handling mechanism is executed: the stack is searched for an appropriate exception handler, then the stack is unwound, with any `finally` blocks executed during the stack unwind process.

Note two things: Managed code will be walking the stack, requiring that the CPU Stack Pointer and Instruction Pointers be set. Consequently, unmanaged code cannot participate in stack unwinding, as it will never be notified that a stack unwind is occurring.

Think about that for a minute. If alarms are not sounding in your head, you're in deep, deep trouble. Consider this unmanaged C code:

``` c
 typedef void (*Handler) (const char *message);
 
 void InvokeHandler (Handler handler)
 {
   char *message = (char *) malloc (10);
   strcpy (message, "A Message");
   (*handler)(message);
   free (message);
 }
```

If *handler* is a pointer to a managed delegate which may throw an exception, then **free**(3) will *not* be executed, resulting in a memory leak. C++ destructors won't help you either, as destructors still require the execution of *some* code, and that code will never be invoked, as it's not C++ which is unwinding the stack, but managed code, which doesn't know about C++ exception handling.

Obviously, the flip-side of this scenario -- a C++ exception being propagated into managed code -- is equally bad. As long as managed and unmanaged code use different exception handling mechanisms, exceptions *must not* be mixed between them.

The moral of this story: don't let exceptions propagate between managed and unmanaged code. The results won't be pretty.

This is particularly pertinent when wrapping C++ methods. C++ exceptions will need to be mapped into an "out" parameter or a return value, so that managed code can know what error occurred, and (optionally) throw a managed exception to "propagate" the original C++ exception.

See also:

-   [SWIG](http://www.swig.org/), a code generation program that easily wraps existing C and C++ code for use by a multitude of languages, including CLI languages. This makes it easier to invoke C++ code from a CLI application.
-   [Structured Exception Handling Topics at MSDN](http://msdn.microsoft.com/en-us/library/aa269603(v=vs.60).aspx)
-   [The .NET Exception Model](https://devblogs.microsoft.com/cbrumme/the-exception-model/): Another one of Chris Brumme's excellent blog entries. More information than you ever wanted to know about .NET exception handling.

## Marshaling

How does Platform Invoke work? Given a managed call site (the function call), and an unmanaged callee site (the function that's being called), each parameter in the call site is "marshaled" (converted) into an unmanaged equivalent. The marshaled data is in turn placed on the runtime stack (along with other data), and the unmanaged function is invoked.

The complexity is due to the marshaling. For [simple types](#blittable-types), such as integers and floating-point numbers, marshaling is a bitwise-copy ("blitting"), just as would be the case for unmanaged code. In some cases, marshaling can be avoided, such as when passing structures by reference to unmanaged code (a pointer to the structure is copied instead). It's also possible to obtain more control over marshaling, through [custom marshaling](#custom-marshaling) and [manual marshaling](#manual-marshaling).

String types introduce additional complexity, as you need to specify the form of string conversion. The runtime stores strings as UTF-16-encoded strings, and these will likely need to be marshaled to a more appropriate form (ANSI strings, UTF-8 encoded strings, etc.). Strings get some special support.

Default marshaling behavior is controlled through the [DllImport](http://docs.go-mono.com/index.aspx?link=T:System.Runtime.InteropServices.DllImportAttribute) and [MarshalAs](http://docs.go-mono.com/index.aspx?link=T:System.Runtime.InteropServices.MarshalAsAttribute) attributes.

### Memory Boundaries

Managed and unmanaged memory should be considered to be completely separate. Managed memory is typically memory allocated on a garbage-collected heap, while unmanaged memory is anything else: the ANSI C memory pool allocated through **malloc**(3), custom memory pools, and garbage-allocated heaps outside the control of the CLI implementation (such as a LISP or Scheme memory heap).

It is possible to lock a section of the managed heap by using the C# `fixed` statement. This is used so that a section of the managed heap can be passed to unmanaged code without worrying that a future GC will move the memory that the unmanaged code is operating on. However, this is completely under the control of the programmer, and is not how Platform Invoke works.

During a P/Invoke call the runtime doesn't mimic the C# `fixed` statement. Instead, classes and structures (everything of consequence) are marshaled to native code through the following pseudo-process:

1.  The runtime allocates a chunk of unmanaged memory.
2.  The managed class data is copied into the unmanaged memory.
3.  The unmanaged function is invoked, passing it the unmanaged memory information instead of the managed memory information. This must be done so that if a GC occurs, the unmanaged function doesn't need to worry about it. (And yes, you need to worry about GCs, as the unmanaged function could call back into the runtime, ultimately leading to a GC. Multi-threaded code can also cause a GC while unmanaged code is executing.)
4.  The unmanaged memory is copied back into managed memory.

See [Class and Structure Marshaling](#class-and-structure-marshaling) for more detailed information about marshaling classes and structures.

There is one key point to keep in mind: the memory management specified in the above process is implicit, and there is no way to control how the runtime allocates the marshaled memory, or how long it lasts. This is crucial. If the runtime marshals a string (e.g. UTF-16 to Ansi conversion), the marshaled string will only last as long as the call. The unmanaged code *CANNOT* keep a reference to this memory, as it *WILL* be freed after the call ends. Failure to heed this restriction can result in "strange behavior", including memory access violations and process death. This is true for *any* marshaling process where the runtime allocates memory for the marshal process.

The one pseudo-exception to this point is with delegates. The unmanaged function pointer that represents the managed delegate lasts as long as the managed delegate does. When the delegate is collected by the GC, the unmanaged function pointer will also be collected. This is also important: if the delegate is collected and unmanaged memory invokes the function pointer, you're treading on thin ground. Anything could happen, including a process seg-fault. Consequently, you *MUST* ensure that the lifetime of the unmanaged function pointer is a proper subset of the lifetime of the managed delegate instance.

### Blittable Types

Many types require minimal copying into native memory. Blittable types are types that conceptually only require a **memcpy**(3) or can be passed on the run-time stack without translation. These types include:

| C# Type  | C Type                                                                                                                                        | **\<stdint.h>** Type | **\<glib.h>** Type |
|----------|-----------------------------------------------------------------------------------------------------------------------------------------------|----------------------|--------------------|
| `sbyte`  | `char`                                                                                                                                        | `int8_t`             | `gint8`            |
| `byte`   | `unsigned char`                                                                                                                               | `uint8_t`            | `guint8`           |
| `short`  | `short`                                                                                                                                       | `int16_t`            | `gint16`           |
| `ushort` | `unsigned short`                                                                                                                              | `uint16_t`           | `guint16`          |
| `int`    | `int`<br/>`long` *32-bit platforms only*                                                                                                      | `int32_t`            | `gint32`           |
| `uint`   | `unsigned int`<br/>`unsigned long` *32-bit platforms only*                                                                                    | `uint32_t`           | `guint32`          |
| `long`   | `long` *64-bit platforms only*<br/>`__int64` *MSVC*<br/>`long long` *GCC*                                                                     | `int64_t`            | `gint64`           |
| `ulong`  | `unsigned long` *64-bit platforms only*<br/>`unsigned __int64` *MSVC*<br/>`unsigned long long` *GCC*                                          | `uint64_t`           | `guint64`          |
| `char`   | `unsigned short`                                                                                                                              | `uint16_t`           | `guint16`          |
| `float`  | `float`                                                                                                                                       |                      | `gfloat`           |
| `double` | `double`                                                                                                                                      |                      | `gdouble`          |
| `bool`   | [Depends on context](https://file+.vscode-resource.vscode-cdn.net/Users/alexander/dev/website/docs/advanced/pinvoke/index.md#boolean-members) |                      |                    |

### Strings

[String](http://docs.go-mono.com/index.aspx?link=T:System.String)s are special. String marshaling behavior is also highly platform dependent.

String marshaling for a function call can be specified in the function declaration with the **DllImport** attribute, by setting the [CharSet](http://docs.go-mono.com/index.aspx?link=F:System.Runtime.InteropServices.DllImportAttribute.CharSet) field. The default value for this field is [CharSet.Ansi](http://docs.go-mono.com/index.aspx?link=F:System.Runtime.InteropServices.CharSet.Ansi). The [CharSet.Auto](http://docs.go-mono.com/index.aspx?link=F:System.Runtime.InteropServices.CharSet.Auto) value implies "magic."

Some background. The Microsoft Win32 API supports two forms of strings: "ANSI" strings, the native character set, such as ASCII, ISO-8859-1, or a Double Byte Character Set such as Shift-JIS; and Unicode strings, originally UCS-2, and now UTF-16. Windows supports these string formats by appending an "A" for Ansi string APIs and a "W" ("wide") for Unicode string APIs.

Consider this Win32 API description:

``` csharp
 [DllImport ("gdi32.dll", CharSet=CharSet.Auto,
      CallingConvention=CallingConvention.StdCall)]
 private static extern bool TextOut (
      System.IntPtr hdc,
      int nXStart,
      int nYStart,
      string lpString,
      int cbString);
```

When TextOut is called, the "magic" properties of String marshaling become apparent. Due to string marshaling, the runtime doesn't just look for an unmanaged function with the same name as the specified method, as specified in Invoking Unmanaged Code. Other permutations of the function may be searched for, depending on the CLI runtime and the host platform.

There are three functions that may be searched for:

-   TextOutW for Unicode string marshaling
-   TextOutA for Ansi string marshaling
-   TextOut with the platform-default marshaling

For platforms whose default character set is UCS2 or UTF-16 Unicode (all flavors of Windows NT, and Windows XP), the default search path is TextOutW, TextOutA, and TextOut. Unicode marshaling is preferred, as (ideally) the System.String can be passed as-is to the function, as long as the function doesn't modify the string parameter. Windows CE does not look for TextOutA, as it has no Ansi APIs.

For platforms whose default character set is Ansi (Windows 9x, Windows ME), the default search path is TextOutA and TextOut (TextOutW is not looked for). Ansi marshaling will require translating the Unicode string into an 8-bit or DBCS string in the user's locale. Most (all?) of the time, this WILL NOT be UTF-8, so you CAN NOT assume that CharSet.Ansi will generate UTF-8-encoded strings.

Mono on all platforms currently uses UTF-8 encoding for all string marshaling operations.

If you don't want the runtime to search for the alternate unmanaged functions, specify a CharSet value other than CharSet.Auto. This will cause the runtime to look only for the specified function. Note that if you pass a wrongly encoded string (e.g. calling MessageBoxW when the CharSet is CharSet.Ansi, the default), you are crossing into "undefined" territory. The unmanaged function will receive data encoded in ways it wasn't expecting, so you may get such bizarre things as Asian text when displaying "Hello, World".

Perhaps in the future the [CharSet](http://docs.go-mono.com/index.aspx?link=T:System.Runtime.InteropServices.CharSet) enumeration will contain more choices, such as UnicodeLE (little-endian), UnicodeBE (big-endian), Utf7, Utf8, and other common choices. Additionally, making such a change would also likely require changing the UnmanagedType enumeration. However, these would need to go through ECMA, so it won't happen next week. (Unless some time has passed since this was originally written, in which case it may very well be next week. But don't count on it.)

#### More Control

Using the **DllImport** attribute works if you want to control all the strings in a function, but what if you need more control? You would need more control if a string is a member of a structure, or if the function uses multiple different types of strings as parameters.

In these circumstances, the **MarshalAs** attribute can be used, setting the [Value](http://docs.go-mono.com/index.aspx?link=P:System.Runtime.InteropServices.MarshalAsAttribute.Value) property (which is set in the constructor) to a value from the [UnmanagedType](http://docs.go-mono.com/index.aspx?link=T:System.Runtime.InteropServices.UnmanagedType) enumeration. For example:

``` csharp
 [DllImport ("does-not-exist")]
 private static extern void Foo (
      [MarshalAs(UnmanagedType.LPStr)] string ansiString,
      [MarshalAs(UnmanagedType.LPWStr)] string unicodeString,
      [MarshalAs(UnmanagedType.LPTStr)] string platformString);
```

As you can guess by reading the example, [UnmanagedType.LPStr](http://docs.go-mono.com/index.aspx?link=F:System.Runtime.InteropServices.UnmanagedType.LPStr) will marshal the input string into an Ansi string, [UnmanagedType.LPWStr](http://docs.go-mono.com/index.aspx?link=F:System.Runtime.InteropServices.UnmanagedType.LPWStr) will marshal the input string into a Unicode string (effectively doing nothing), and [UnmanagedType.LPTStr](http://docs.go-mono.com/index.aspx?link=F:System.Runtime.InteropServices.UnmanagedType.LPTStr) will convert the string to the platform's default string encoding.

The default platform encoding for all flavors of Windows NT (including Windows NT 3.51 and 4.0, Windows 2000, Windows XP, Windows Server 2003) is Unicode, while for all Windows 9x flavors (Windows 95, 98, ME) the platform default encoding is Ansi.

Mono uses UTF-8 encoding as the default encoding on all platforms.

There are other **UnmangedType** string marshaling options, but they're primarily of interest in COM Interop ([BStr](http://docs.go-mono.com/index.aspx?link=F:System.Runtime.InteropServices.UnmanagedType.BStr), [AnsiBStr](http://docs.go-mono.com/index.aspx?link=F:System.Runtime.InteropServices.UnmanagedType.AnsiBStr), [TBStr](http://docs.go-mono.com/index.aspx?link=F:System.Runtime.InteropServices.UnmanagedType.TBStr)).

If **UnmanagedType** doesn't provide enough flexibility for your string marshaling needs (for example, you're wrapping GTK+ and you need to marshal strings in UTF-8 format), look at the [Custom Marshaling](#custom-marshaling) or [Manual Marshaling](#manual-marshaling) sections.

#### Passing Caller-Modifiable Strings

A common C language idiom is for the caller to provide the callee a buffer to fill. For example, consider **strncpy**(3):

``` c
 char* strncpy (char *dest, const char *src, size_t n);
```

We can't use **System.String** for both parameters, as strings are immutable. This is OK for *src*, but *dest* will be modified, and the caller should be able to see the modification.

The solution is to use a [System.Text.StringBuilder](http://docs.go-mono.com/index.aspx?link=T:System.Text.StringBuilder) , which gets special marshaling support from the runtime. This would allow **strncpy**(3) to be wrapped and used as:

``` csharp
 [DllImport ("libc.so")]
 private static extern void strncpy (StringBuilder dest,
      string src, uint n);
 
 private static void UseStrncpy ()
 {
    StringBuilder sb = new StringBuilder (256);
    strncpy (sb, "this is the source string", sb.Capacity);
    Console.WriteLine (sb.ToString());
 }
```

Some things to note is that the return value of **strncpy**(3) was changed to *void*, as there is no way to specify that the return value will be the same pointer address as the input *dest* string buffer, and thus it doesn't need to be marshaled. If *string* were used instead, Bad Things could happen (the returned string would be freed; see [Strings as Return Values](#strings-as-return-values) ). The **StringBuilder** is allocated with the correct amount of storage as a constructor parameter, and this amount of storage is passed to **strncpy**(3) to prevent buffer overflow. If you use a **StringBuilder** instance multiple times, always call [EnsureCapacity()](http://docs.go-mono.com/index.aspx?link=M:System.Text.StringBuilder.EnsureCapacity(System.Int32)) before passing it into the native method, as the capacity may shrink as a memory optimization over time, leading to unexpectedly truncated results.

TODO: How does StringBuilder interact with the specified CharSet?

#### Strings as Return Values

The **String** type is a class, so [see the section on returning classes from functions](#classes-and-structures-as-return-values). Summary: the runtime will attempt to free the returned pointer. The usual symptom is a runtime crash like this:

    =================================================================
    Got a SIGSEGV while executing native code. This usually indicates
    a fatal error in the mono runtime or one of the native libraries
    used by your application.
    =================================================================

    Stacktrace:

    in <0x4> (wrapper managed-to-native) System.Object:__icall_wrapper_g_free (intptr)
    in <0x6b9d0c> (wrapper managed-to-native) System.Object:__icall_wrapper_g_free (intptr)

If you don't want the runtime to free the returned string, either (a) don't specify the return value ([as was done for the **strncpy**(3) function above](#passing-caller-modifiable-strings)), or (b) return an [IntPtr](http://docs.go-mono.com/index.aspx?link=T:System.IntPtr) and use one of the Marshal.PtrToString\* functions, depending on the type of string returned. For example, use [Marshal.PtrToStringAnsi](http://docs.go-mono.com/index.aspx?link=M:System.Runtime.InteropServices.Marshal.PtrToStringAnsi) to marshal from a Ansi string, and use [Marshal.PtrToStringUni](http://docs.go-mono.com/index.aspx?link=M:System.Runtime.InteropServices.Marshal.PtrToStringUni) to marshal from a Unicode string.

See also:

-   [Default marshaling for Strings at MSDN](http://msdn.microsoft.com/en-us/library/s9ts558h(VS.80).aspx)
-   [An Overview of Managed/Unmanaged Code Interoperability](http://msdn.microsoft.com/netframework/default.aspx?pull=/library/en-us/dndotnet/html/manunmancode.asp)

### Class and Structure Marshaling

The conceptual steps that occur to marshal classes and structures is detailed above, in the [Memory Boundaries](#memory-boundaries) section.

The main difference between class and structure marshaling is which ones, if any, of the conceptual steps actually occur.

#### Class Marshaling

Remember that classes are heap-allocated and garbage-collected in the CLI. As such, you cannot pass classes by value to unmanaged functions, only by reference:

``` c
 /* Unmanaged code declarations */
 struct UnmanagedStruct {
    int a, b, c;
 };
 
 void WRONG (struct UnamangedStruct pass_by_value);
 
 void RIGHT (struct UnmanagedStruct *pass_by_reference);
 void RIGHT2 (struct UnmanagedStruct **pass_by_reference_out_or_ref);
```

This means that you cannot use classes to invoke unmanaged functions that expect pass-by-value variables (such as the *WRONG* function, above).

There are two other issues with classes. First of all, classes by default use [LayoutKind.Auto](http://docs.go-mono.com/index.aspx?link=F:System.Runtime.InteropServices.LayoutKind.Auto) layout. This means that the ordering of class data members is unknown, and won't be determined until runtime. The runtime can rearrange the order of members in any way it chooses, to optimize for access time or data layout space. As such, you *MUST* use the [StructLayout](http://docs.go-mono.com/index.aspx?link=T:System.Runtime.InteropServices.StructLayoutAttribute) attribute and specify a [LayoutKind](http://docs.go-mono.com/index.aspx?link=E:System.Runtime.InteropServices.LayoutKind) value of [LayoutKind.Sequential](http://docs.go-mono.com/index.aspx?link=F:System.Runtime.InteropServices.LayoutKind.Sequential) or [LayoutKind.Explicit](http://docs.go-mono.com/index.aspx?link=F:System.Runtime.InteropServices.LayoutKind.Explicit).

Secondly, classes (again, by default) only have in-bound marshaling. That is, Step 4 (copying the unmanaged memory representation back into managed memory) is ommitted. If you need the unmanaged memory to be copied back into managed memory, you must addorn the **DllImport** function declaration argument with an [Out](http://docs.go-mono.com/index.aspx?link=T:System.Runtime.InteropServices.OutAttribute) attribute. You will also need to use the [In](http://docs.go-mono.com/index.aspx?link=T:System.Runtime.InteropServices.InAttribute) attribute if you want copy-in and copy-out behavior. To summarize:

-   Using `[In]` is equivalent to not specifying any parameter attributes, and will skip Step 4 (copying unmanaged memory into managed memory).
-   Using `[Out]` will skip Step 2 (copying managed memory into unmanaged memory).
-   Use `[In, Out]` to both copy managed memory to unmanaged memory before the unmanaged function call, and then copy unmanaged memory back to managed memory after the function call.

In some circumstances, the marshaled copy can be omitted. The object will simply be pinned in memory and a pointer to the start of the data passed to the unmanaged function.

TODO: When can this actually occur? If this happened for any class with **Sequential** layout, you wouldn't need to specify the **Out** attribute, as the unmanaged code would see the actual object. Is there a specific set of circumstances for when this can occur? This appears to happen with **StringBuilder** (my tests don't require an `[Out]` to see changes made to the **StringBuilder** by unmanaged code), but this is the only example I can think of.

See Also:

-   [Directional Attributes (MSDN)](http://msdn.microsoft.com/en-us/library/77e6taeh(v=vs.110).aspx)

#### Structure Marshaling

There are two primary differences between classes and structures. First, structures do not need to be allocated on the heap; they can be allocated on the runtime stack. Secondly, they are **LayoutKind.Sequential** by default, so structure declarations do not need any additional attributes to use them with unmanaged code (assuming that the default sequential layout rules are correct for the unmanaged structure).

These differences permit structures to be passed by-value to unmanaged functions, unlike classes. Additionally, if (a) the structure is located on the stack, and (b) the structure contains only blittable types, then if you pass a structure to an unmanaged function by-reference, the structure will be passed directly to the unmanaged function, without an intermediate unmanaged memory copy. This means that you may not need to specify the **Out** attribute to see changes made by unmanaged code.

Note that as soon as the structure contains a non-blittable type (such as System.Boolean, System.String, or an array), this optimization is no longer possible and a copy of the structure must be made as part of the marshaling process.

#### Classes and Structures as Return Values

The differences in allocation behavior between classes and structures also affect how they're handled as return values from functions.

Classes can be used as the return value of a function when the unmanaged function returns a pointer to an unmanaged structure. Classes cannot be used for by-value return types.

Structures can be used when the unmanaged function returns the structure by-value. It is not possible to return structures with "ref" or "out", so if an unmanaged function returns a pointer to a structure, **IntPtr** must be used for "safe" code, or a pointer to the structure can be used for "unsafe" code. If **IntPtr** is used as the return type, [Marshal.PtrToStructure](http://docs.go-mono.com/index.aspx?link=M:System.Runtime.InteropServices.Marshal.PtrToStructure) can be used to convert the unmanaged pointer into a managed structure.

Memory management is also heavily involved.

#### Memory Management

It's easy to skim over memory management for most of Platform Invoke and marshaling, but for return values the CLI implements some default handling which must be considered.

The CLI runtime assumes that, under certain circumstances, the CLI runtime is responsible for freeing memory allocated by unmanaged code. Return values are one of those circumstances, causing the return value to be a memory boundary for control of memory (de)allocation.

The CLI assumes that all memory that is passed between the CLI/unmanaged code boundary is allocated via a common memory allocator. The developer does not get a choice in which memory allocator is used. For managed code, the [Marshal.AllocCoTaskMem](http://docs.go-mono.com/index.aspx?link=M:System.Runtime.InteropServices.Marshal.AllocCoTaskMem) method can be used to allocate memory, [Marshal.FreeCoTaskMem](http://docs.go-mono.com/index.aspx?link=M:System.Runtime.InteropServices.Marshal.FreeCoTaskMem) is used to free the memory allocated by **Marshal.AllocCoTaskMem**, and [Marshal.ReAllocCoTaskMem](http://docs.go-mono.com/index.aspx?link=M:System.Runtime.InteropServices.Marshal.ReAllocCoTaskMem) is used to resize a memory region originally allocated by **Marshal.AllocCoTaskMem**.

Since classes are passed by reference, a pointer is returned, and the runtime assumes that it must free this memory to avoid a memory leak. The chain of events is thus:

1.  Managed code invokes unmanaged function that returns a pointer to an unmanaged structure in unmanaged memory.
2.  An instance of the appropriate managed class is instantiated, and the contents of the unmanaged memory is marshaled into the managed class.
3.  The unmanaged memory is freed by the runtime "as if" by invoking **Marshal.FreeCoTaskMem()**.

How is **Marshal.AllocCoTaskMem**, **Marshal.ReAllocCoTaskMem**, and **Marshal.FreeCoTaskMem** implemented? That's platform-dependent. (So much for portable platform-dependent code.) Under Windows, the COM Task Memory allocator is used (via [CoTaskMemAlloc()](http://msdn.microsoft.com/en-us/library/windows/desktop/ms692727(v=vs.85).aspx), [CoTaskMemReAlloc()](http://msdn.microsoft.com/en-us/library/windows/desktop/ms687280(v=vs.85).aspx), and [CoTaskMemFree()](http://msdn.microsoft.com/en-us/library/windows/desktop/ms680722(v=vs.85).aspx)). Under Unix, the GLib memory functions [g_malloc()](https://developer.gnome.org/glib/2.28/glib-Memory-Allocation.html#g-malloc), [g_realloc()](https://developer.gnome.org/glib/2.28/glib-Memory-Allocation.html#g-realloc), and [g_free()](https://developer.gnome.org/glib/2.28/glib-Memory-Allocation.html#g-free) functions are used. Typically, these correspond to the ANSI C functions **malloc**(3), **realloc**(3), and **free**(3), but this is not necessarily the case as GLib can use different memory allocators; see [g_mem_set_vtable()](https://developer.gnome.org/glib/2.28/glib-Memory-Allocation.html#g-mem-set-vtable) and [g_mem_is_system_malloc()](https://developer.gnome.org/glib/2.28/glib-Memory-Allocation.html#g-mem-is-system-malloc) .

What do you do if you don't want the runtime to free the memory? Don't return a class. Instead, return an IntPtr (the moral equivalent of a C `void*` pointer), and then use the **Marshal** class methods to manipulate that pointer, such as [Marshal.PtrToStructure](http://docs.go-mono.com/index.aspx?link=M:System.Runtime.InteropServices.Marshal.PtrToStructure), which works for both C# **struct** types and **class** types marked `[StructLayout(LayoutKind.Sequential)]`.

#### Choosing between Classes and Structures

So which should be used when wrapping unmanaged code, classes or structures?

Generally, the answer to this question depends upon what the unmanaged code requires. If you require pass-by-value semantics, you must use structures. If you want to return a pointer to an unmanaged type without resorting to "unsafe" or manual code, you must use classes (assuming that the default [memory allocation rules](#memory-management) are appropriate).

For the large intersection of unmanaged code that doesn't have pass-by-value structures or return pointers to structures from functions? Use whichever is more convenient for the end user. Not all languages support passing types by reference (Java, for example), so using classes will permit a larger body of languages to use the wrapper library. Furthermore, Microsoft suggests that structure sizes not exceed 16 bytes.

### Summary

It's always easier to show the code, so... Given the following unmanaged code declarations:

``` c
 /* unmanaged code declarations */
 
 struct UnmanagedStruct {
    int n;
 };
 
 void PassByValue (struct UnmanagedStruct s);
 
 void PassByReferenceIn (struct UnmanagedStruct *s);
 void PassByReferenceOut (struct UnmanagedStruct *s);
 void PassByReferenceInOut (struct UnmanagedStruct *s);
 
 struct UnmanagedStruct ReturnByValue ();
 struct UnmanagedStruct* ReturnByReference ();
 
 void DoubleIndirection (struct UnmanagedStruct **s);
```

The class wrapper could be:

``` csharp
 /* note: sequential layout */
 [StructLayout (LayoutKind.Sequential)]
 class ClassWrapper {
    public int n;
 
    /* cannot wrap function PassByValue */
 
    /* PassByReferenceIn */
    [DllImport ("mylib")]
    public static extern
       void PassByReferenceIn (ClassWrapper s);
 
    /* PassByReferenceOut */
    [DllImport ("mylib")]
    public static extern
       void PassByReferenceOut ([Out] ClassWrapper s);
 
    /* PassByReferenceInOut */
    [DllImport ("mylib")]
    public static extern
       void PassByReferenceInOut ([In, Out] ClassWrapper s);
 
    /* cannot wrap function ReturnByValue */
 
    /* ReturnByReference */
    [DllImport ("mylib")]
    public static extern ClassWrapper ReturnByReference ();
       /* note: this causes returned pointer to be freed
          by runtime */
     /* DoubleIndirection */
    [DllImport ("mylib")]
    public static extern
       void DoubeIndirection (ref ClassWrapper s);
 }
```

While the structure wrapper could be:

``` csharp
 struct StructWrapper {
    public int n;
 
    /* PassByValue */
    [DllImport ("mylib")]
    public static extern void PassByValue (StructWrapper s);
 
    /* PassByReferenceIn */
    [DllImport ("mylib")]
    public static extern void PassByReferenceIn (
       ref StructWrapper s);
 
    /* PassByReferenceOut */
    [DllImport ("mylib")]
    public static extern void PassByReferenceOut (
       out StructWrapper s);
 
    /* PassByReferenceInOut */
    [DllImport ("mylib")]
    public static extern void PassByReferenceInOut (
       ref StructWrapper s);
 
    /* ReturnByValue */
    [DllImport ("mylib")]
    public static extern StructWrapper ReturnByValue ();
 
    /* ReturnByReference: CLS-compliant way */
    [DllImport ("mylib", EntryPoint="ReturnByReference")]
    public static extern IntPtr ReturnByReferenceCLS ();
       /* note: this DOES NOT cause returned pointer to be
          freed by the runtime, so it's not identical to
          ClassWrapper.ReturnByReference.
          Use Marshal.PtrToStructure() to access the
          underlying structure. */
 
    /* ReturnByReference: "unsafe" way */
    [DllImport ("mylib", EntryPoint="ReturnByReference")]
    public static unsafe extern StructWrapper*
       ReturnByReferenceUnsafe ();
       /* note: this DOES NOT cause returned pointer to be
          freed by the runtime, so it's not identical to
          ClassWrapper.ReturnByReference */
 
    /* DoubleIndirection: CLS-compliant way */
    [DllImport ("mylib", EntryPoint="DoubleIndirection")]
    public static extern
       void DoubeIndirectionCLS (ref IntPtr s);
       /* note: this is similar to ReturnByReferenceCLS().
          Pass a `ref IntPtr' to the function, then use
          Marshal.PtrToStructure() to access the
          underlying structure. */
 
    /* DoubleIndirection: "unsafe" way */
    [DllImport ("mylib", EntryPoint="DoubleIndirection")]
    public static unsafe extern
       void DoubeIndirectionUnsafe (StructWrapper **s);
 }
```

### Marshaling Class and Structure Members

Aside from the major differences between classes and structures outlined above, the members of classes and structures are marshaled identically.

The general rule of advice is this: never pass classes or structures containing members of reference type (classes) to unmanaged code. This is because unmanaged code can't do anything safely with the unmanaged reference (pointer), and the CLI runtime doesn't do a "deep marshal" (marshal members of marshaled classes, and their members, ad infinitum).

The immediate net effect of this is that you can't have array members in marshaled classes, and (as we've seen before) handling strings can be "wonky" (as strings are also a reference type).

Furthermore, the default string marshaling is the [platform default](#more-control), though this can be changed by setting the [StructLayoutAttribute.CharSet](http://docs.go-mono.com/index.aspx?link=F:System.Runtime.InteropServices.StructLayoutAttribute.CharSet) field, which defaults to **CharSet.Auto**. Alternatively, you can adorn string members with the **MarshalAs** attribute to specify what kind of string they are.

#### Boolean Members

The [System.Boolean](http://docs.go-mono.com/index.aspx?link=T:System.Boolean) (**bool** in C#) type is special. A `bool` within a structure is marshaled as an `int` (a 4-byte integer), with 0 being `false` and non-zero being `true`; see [UnmanagedType.Bool](http://docs.go-mono.com/index.aspx?link=F:System.Runtime.InteropServices.UnmanagedType.Bool). A `bool` passed as an argument to a function is marshaled as a `short` (a 2-byte integer), with 0 being `false` and -1 being `true` (as all bits are set); see [UnmanagedType.VariantBool](http://docs.go-mono.com/index.aspx?link=F:System.Runtime.InteropServices.UnmanagedType.VariantBool).

You can always explicitly specify the marshaling to use by using the **MarshalAsAttribute** on the boolean member, but there are only three legal UnmanagedType values: **UnmanagedType.Bool**, **UnmanagedType.VariantBool** and [UnmanagedType.U1](http://docs.go-mono.com/index.aspx?link=F:System.Runtime.InteropServices.UnmanagedType.U1). **UnmanagedType.U1**, the only un-discussed type, is a 1-byte integer where 1 represents `true` and 0 represents `false`.

If you need to marshal as another data type, you should overload the method accepting the boolean parameter, and manually convert the boolean to your desired type:

``` c
 // Unmanaged C declaration:
 void DoSomething (int boolean);
```

``` csharp
 // Managed declaration:
 [DllImport ("SomeLibrary")]
 private static extern void DoSomething (int boolean);
 
 public static void DoSomething (bool boolean)
 {
    DoSomething (boolean ? 1 : 0);
 }
```

See also: [Default Marshaling for Boolean Types](http://msdn.microsoft.com/en-us/library/t2t3725f(v=vs.110).aspx)

#### Unions

A C union (in which multiple members share the same offset into a structure) can be simulated by using the [FieldOffset](http://docs.go-mono.com/index.aspx?link=T:System.Runtime.InteropServices.FieldOffsetAttribute) attribute and specifying the same offset for the union members.

#### Longs

The C 'long' type is difficult to marshal as a struct member, since there is no CLR type which matches it, i.e. 'int' is 32 bit, 'long' is 64 bit, while C's 'long' can be 32 bit or 64 bit, dependending on the platform. There are two possible solutions:

-   Using two sets of structures, one for 32 bit and one for 64 bit platforms.
-   Mapping C 'long' to 'IntPtr'. This will work on all 32 bit and 64 bit platforms, \_except\_ 64 bit windows, where sizeof(long)==4 and sizeof(void\*)==8. See [This](http://stackoverflow.com/questions/384502/what-is-the-bit-size-of-long-on-64-bit-windows).

#### Arrays Embedded Within Structures

Inline arrays can be marshaled by using a **MarshalAs** attribute with **UnmanagedType.ByValArray** and specifying the [MarshalAsAttribute.SizeConst](http://docs.go-mono.com/index.aspx?link=F:System.Runtime.InteropServices.MarshalAsAttribute.SizeConst) field to the size of the array to marshal. Inline arrays which contain strings can use **UnmanagedType.ByValTStr** for a string.

However, the runtime doesn't automatically allocate arrays specified as **UnmanagedType.ByValArray**. The programmer is still responsible for allocating the managed array. See the [summary](#summary-2) for more information.

TODO: Bernie Solomon says that for `out` parameters, the runtime will allocate the inline array memory. Check this out.

For example, the unmanaged structure:

``` c
 struct UnmanagedStruct {
    int data[10];
    char name[32];
 };
```

*Can* be represented in C# as:

``` csharp
 struct ManagedStruct_Slow {
    [MarshalAs (UnmanagedType.ByValArray, SizeConst=10)]
    public int[]  data;
    [MarshalAs (UnmanagedType.ByValTStr, SizeConst=32)]
    public string name;
 }
```

Of course, the managed structure can be declared in other ways, with varying performance and usage tradeoffs. The previous declaration is the most straightforward to use, but has the worst performance characteristics. The following structure will marshal faster, but will be more difficult to work with:

``` csharp
 struct ManagedStruct_Fast_1 {
    public int  data_0, data_1, data_2, data_3, data_4,
                data_5, data_6, data_7, data_8, data_9;
    public byte name_00, name_01, name_02, name_03, name_04,
                name_05, name_06, name_07, name_08, name_09,
                name_10, name_11, name_12, name_13, name_14,
                name_15, name_16, name_17, name_18, name_19,
                name_20, name_21, name_22, name_23, name_24,
                name_25, name_26, name_27, name_28, name_29,
                name_30, name_31,
 }
```

Yet another alternative is to directly specify the size of the structure, instead of letting the structure contents dictate the structure size. This is done via the [StructLayout.Size](http://docs.go-mono.com/index.aspx?link=F:System.Runtime.InteropServices.StructLayout.Size) field. This makes the structure terribly annoying to deal with, as pointer arithmetic must be used to deal with the `name` member:

``` csharp
 [StructLayout(LayoutKind.Sequential, Size=72)]
 struct ManagedStruct_Fast_2 {
    public int  data_0, data_1, data_2, data_3, data_4,
                data_5, data_6, data_7, data_8, data_9;
    public byte name; /* first byte of name */
    /* Size property specifies that 31 bytes of nameless
       "space" is placed here. */
 }
```

##### C# 2.0 Functionality

C# 2.0 adds language features to deal with inline arrays, using a **fixed** array syntax. This allows the previous structure to be declard as:

``` csharp
 struct ManagedStruct_v2 {
    public fixed int  data[10];
    public fixed byte name[32];
 }
```

Fixed array syntax is still "unsafe", and requires elevated privilege to execute.

##### Real World Experience

This might be of use. From David Jesk:

> This time I have some PInvoke information to share, so that when someone else runs into this issue they can see what I've done. In my ClearSilver ([www.clearsilver.net](http://www.clearsilver.net), an HTML template system) C# wrapper, I wanted to access this C-struct:
>
> ``` c
>  typedef struct _neo_err
>  {
>    int error;
>    int err_stack;
>    int flags;
>    char desc[256];
>    const char *file;
>    const char *func;
>    int lineno;
>    /* internal use only */
>    struct _neo_err *next;
>  } NEOERR;
> ```
>
> My philosophy of using unsafe struct pointers, and just accessing the struct out in unmanaged memory is great, and it's exactly what I want to do. However, handling "char dest\[256\]" is not straightforward.
>
> In C# arrays are reference types. Using one makes the struct a managed type, and I can't put the array size in. The following is conceptually what I want to do, however, it's obviously invalid:
>
> ``` csharp
>  [StructLayout(LayoutKind.Sequential)]
>  unsafe struct NEOERR {
>    public int error;
>    public int err_stack;
>    public int flags;
>    public byte[256] desc;  // this is invalid,
>                            // can't contain size
>    public const byte *file;
>    public const byte *func;
>    public int lineno;
>
>    /* internal use only */
>    private NEOERR *next;
>  }
> ```
>
> This dosn't work either:
>
> ``` csharp
>  [MarshalAs (UnmanagedType.LPStr, SizeConst=256)]
>  public string desc;
> ```
>
> Because in this case, I don't want to marshal the data. I just want to talk to it in place. The solution I could come up with is this:
>
> ``` csharp
>  [StructLayout(LayoutKind.Explicit)]
>  unsafe struct NEOERR {
>    [FieldOffset(0)] public int error;
>    [FieldOffset(4)] public int err_stack;
>    [FieldOffset(8)] public int flags;
>    // public byte[256] dest;  // not representable
>
>    // use this as an address??
>    [FieldOffset(12)] public byte dest_first_char;
>    [FieldOffset(268)] public byte *file; // const
>    [FieldOffset(272)] public byte *func; // const
>    [FieldOffset(276)] public int lineno;
>  }
> ```
>
> UGH! First, this is obviously annoying. Second, the only way I can figure to get access to "char dest\[256\]" is to use "char\* dest = &nerr->dest_first_char;" and then just use dest as a pointer to the string. I've dug through the documentation, and I can't find any better solution.
>
> Obviously it would be ideal if there were a way to represent a value-type array. I wonder how Managed C++ handles "char foo\[256\];" in a struct.

See also:

-   [Eric Gunnerson's C# Blog: Arrays inside of structures](http://blogs.msdn.com/b/ericgu/archive/2004/08/12/213676.aspx)

#### Summary 2

Again, example native code...

``` c
 /* original code */
 struct UnmanagedInformation {
    int num;
    char* string;
    int array[32];
 
    union {
       int64_t addr;  /* from <stdint.h>, C99 */
       double other;
    } stuff;
 };
```

And the possible corresponding managed code:

``` csharp
 /* managed representation */
 [StructLayout (LayoutKind.Explicit, CharSet=CharSet.Ansi)]
 struct ManagedInformation {
    [FieldOffset (0)] int num;
    [FieldOffset (4)] string str;
    [FieldOffset (8),
       MarshalAs (UnmanagedType.ByValArray, SizeConst=32)]
    int[] array;
 
    /* union members */
    [FieldOffset (136)] long stuff_addr;
    [FieldOffset (136)] double stuff_other;
 }
```

Note that this isn't an exact match to the unmanaged code. This structure must be built in two phases to match the unmanaged representation: (1) create the structure, and (2) allocate memory for ManagedInformation.array. For example:

``` csharp
 ManagedInformation info = new ManagedInformation ();
 info.array = new int[32];
```

#### A Warning about FieldOffset

The **FieldOffset** attribute has one major pitfall: it makes offsets of types explicit. This is liable to break if (when) (1) the class/structure contains a pointer, reference, or array, and (2) you change the bitsize of your processor (move from a 32-bit processor to a 64-bit processor). It is preferable to use **LayoutKind.Sequential** if at all possible, as the runtime will take care of updating the structural offsets when the size of pointers changes.

TODO: include MSDN examples using the more esotoric **MarshalAs** fields, such as **SizeParamIndex**, **ArraySubType**, etc.

See also: \*[Marshaling Data with Platform Invoke at MSDN](http://msdn.microsoft.com/en-us/library/fzhhdwae(v=vs.110).aspx), \*[Arrays Sample at MSDN](http://msdn.microsoft.com/en-us/library/hk9wyw21(v=vs.110).aspx)

#### Marshaling Pointers

Didn't we start using a managed execution environment to *avoid* pointers? But I digress...

Alas, pointers are a fact of life in unmanaged code. As the [Avoiding Marshaling](#avoiding-marshaling) section points out, there are two ways to represent pointers: the "safe" way, using [System.IntPtr](http://docs.go-mono.com/index.aspx?link=T:System.IntPtr) or [System.UIntPtr](http://docs.go-mono.com/index.aspx?link=T:System.UIntPtr) , and the "unsafe" way, by using `unsafe` code and pointers.

##### Marshaling Embedded Strings

*Behold the topic that just won't die!* "Inline" strings -- in which the storage for the string is part of the structure itself -- were covered [previously](#arrays-embedded-within-structures). Obviously, and likely more commonly, strings are not always allocated within the structure; typically a pointer to a null-terminated string is stored.

The typical approach is to map the string as an IntPtr, and use [Marshal.PtrToStringAnsi](http://docs.go-mono.com/index.aspx?link=M:System.Runtime.InteropServices.Marshal.PtrToStringAnsi) and similar functions to manually marshal the string.

Why manually marshal? Because you typically use a custom memory allocator (such as **malloc**(3)), and don't want the runtime incorrectly freeing the memory that the string references. In this case, it's *essential* that you manually marshal the string to avoid memory corruption.

### Custom Marshaling

The [ICustomMarshaler](http://docs.go-mono.com/index.aspx?link=T:System.Runtime.InteropServices.ICustomMarshaler) interface allows the CLI to invoke custom code as part of the P/Invoke call. Normal P/Invoke calls follow the structure:

> Method invocation → CLI P/Invoke Default Marshaler → Unmanaged method call

Custom marshaling allows this to become

> Method invocation → CLI P/Invoke Default Marshaler → custom marshaler → CLI P/Invoke marshaler → Unmanaged method call

In order for the custom marshaler to be invoked,

1.  the custom marshaler must implement the **ICustomMarshaler** interface, and
2.  the custom marshaler must provide a static **GetInstance** method which takes a string and returns a **ICustomMarshaler** instance:

<!-- -->

``` csharp
public static ICustomMarshaler GetInstance (string s);
```

1.  The **DllImport** declaration must have a parameter with a **MarshalAs** attribute specifying [UnmanagedType.CustomMarshaler](http://docs.go-mono.com/index.aspx?link=F:System.Runtime.InteropServices.UnmanagedType.CustomMarshaler) and:
    -   The [MarshalTypeRef](http://docs.go-mono.com/index.aspx?link=F:System.Runtime.InteropServices.MarshalAsAttribute.MarshalTypeRef) or [MarshalType](http://docs.go-mono.com/index.aspx?link=F:System.Runtime.InteropServices.MarshalAsAttribute.MarshalType) fields.
    -   (Optionally) The [MarshalCookie](http://docs.go-mono.com/index.aspx?link=F:System.Runtime.InteropServices.MarshalAsAttribute.MarshalCookie) field. This string is passed to **GetInstance**.

An example custom marshaler can be found in the **Mono.Unix.Native.FileNameMarshaler** ([FileNameMarshaler.cs](https://github.com/mono/mono/blob/main/mcs/class/Mono.Posix/Mono.Unix.Native/FileNameMarshaler.cs)) and in the Mono unit tests ([marshal9.cs](https://github.com/mono/mono/blob/main/mono/tests/marshal9.cs)).

Given all the work involved with custom marshaling, such as the required **ICustomMarshaler** class implementation and **MarshalAs** attributes, what is the advantage of custom marshaling over [manual marshaling](#manual-marshaling)? Maintenance. For only one method, manual marshaling is simpler:

``` csharp
 // Custom Marshaling with Mono.Unix.Native.FileNameMarshaler.cs
 [DllImport(LIB)]
 public static extern int open (
    [MarshalAs (UnmanagedType.CustomMarshaler,
       MarshalTypeRef=typeof(Mono.Unix.Native.FileNameMarshaler))]
    string pathname,
    int flags
 );
```

And the manual marshaler implementation:

``` csharp
 // Use Manual Marshaling
 [DllImport(LIB)]
 private static extern int open (IntPtr pathname, int flags);
 
 public static extern int open (string pathname, int flags)
 {
    IntPtr _pathname = UnixMarshal.StringToHeap (pathname,
          UnixEncoding.Instance);
    try {
       return open (_pathname, flags);
    }
    finally {
       UnixMarshal.FreeHeap (_pathname);
    }
 }
```

However, as the number of methods that require essentially identical marshaling increases, it becomes easier to maintain the custom marshaler than to maintain the *N* separate manual marshal copies that would otherwise be necessary.

See also: \*[ICustomMarshaler Interface at MSDN](http://msdn.microsoft.com/en-us/library/system.runtime.interopservices.icustommarshaler(v=vs.90).aspx)

### Manual Marshaling

What do you do when the default marshaling rules (amid all the variations that the **DllImport** and **MarshalAs** attributes permit) don't allow you to invoke a given function? You do it manually by making extensive use of the [Marshal](http://docs.go-mono.com/index.aspx?link=T:System.Runtime.InteropServices.Marshal) class methods.

TODO: finish.

#### Marshaling char\*\*

The key in the following tutorial is System.Runtime.InteropServices, where we can find the Marshal class. That class is very useful because it bridges created managed objects and unmanaged ones. Its functionalities are very similar to blocks, unsafe, and more. For example, let's say that all pointer types in .NET are saved in an instance of the type IntPtr. With the Marshal class, we can perform any operation like adding a determined number of bytes in order to point to other objects, and converting things that are there in a structure or a chain (other thing is if in that memory direction is something with sense or not).

Using this piece of code, we can see how to put data into an unmanaged structure through a pointer obtained from a function or an external public structure of a native library.

By default C#, establishes the order that is most optimized for the structure fields in memory. Nevertheless, if we want to dump the contents of the unmanaged pointer in our structure correctly, all the fields must maintain their order and size (in bytes). To solve this problem, we apply the attribute StructLayout(LayoutKind.Sequential) on the structure.

``` csharp
 [StructLayout(LayoutKind.Sequential)]
   public class _EcoreEventDndEnter
     {
        public IntPtr win;
        public IntPtr src;
        public IntPtr types;
        public int num_types;
        public _EcoreEventDndEnter()
          {}
     }
```

The structure has two pointers to X windows, a pointer to a character matrix (a string table), and an integer that defines the number of present chains. It seems to be a complex structure, but it isn't.

We want to create a class from that structure. So, we have a constructor with a parameter that points to the unmarshalled structure. Afterwards, we use the Marshal class in order to utilize its basic types. Everything is straight forward except for the matrix that couldn't be converted without producing an error. The Mono.UnixMarshal class solves that problem, which was basically a portability issue:

``` csharp
   public class EcoreEventDndEnter
     {
        public Window win;
        public Window src;
        public string[] types;
        public int num_types;
        public EcoreEventDndEnter()
          {}
 
        public EcoreEventDndEnter(IntPtr EventInfo)
          {
             _EcoreEventDndEnter e = new _EcoreEventDndEnter();
             e = (_EcoreEventDndEnter)Marshal.PtrToStructure(EventInfo, typeof(_EcoreEventDndEnter));
             win = new Window(e.win);
             src = new Window(e.src);
             types = Mono.Unix.UnixMarshal.PtrToStringArray(e.types);
             num_types = e.num_types;
          }
     }
```

The fact that Mono is open-source helped understand that MonoUnix is merely an extension of System.Runtime.InteropServices.Marshal, using the same methods of the Marshal class. This means that we can put the necessary code of UnixMarshal in the project in order to guarantee its portability from Windows Mono or even .NET. Here's the piece of code:

``` csharp
 
   public class Common
     {
        public static string PtrToString (IntPtr p)
          {
             // TODO: deal with character set issues.  Will PtrToStringAnsi always
             // "Do The Right Thing"?
             if (p == IntPtr.Zero)
               return null;
             return Marshal.PtrToStringAnsi (p);
          }
 
 
        public static string[] PtrToStringArray (IntPtr stringArray)
          {
             if (stringArray == IntPtr.Zero)
               return new string[]{};
 
 
             int argc = CountStrings (stringArray);
             return PtrToStringArray (argc, stringArray);
          }
 
        private static int CountStrings (IntPtr stringArray)
          {
             int count = 0;
             while (Marshal.ReadIntPtr (stringArray, count*IntPtr.Size) != IntPtr.Zero)
               ++count;
             return count;
          }
 
 
        public static string[] PtrToStringArray (int count, IntPtr stringArray)
          {
             if (count < 0)
               throw new ArgumentOutOfRangeException ("count", "< 0");
             if (stringArray == IntPtr.Zero)
               return new string[count];
 
 
             string[] members = new string[count];
             for (int i = 0; i < count; ++i) {
                IntPtr s = Marshal.ReadIntPtr (stringArray, i * IntPtr.Size);
                members[i] = PtrToString (s);
             }
 
 
             return members;
          }
     }
```

After the following step, the final class is completely portable:

``` csharp
 public class EcoreEventDndEnter
     {
        public Window win;
        public Window src;
        public string[] types;
        public int num_types;
        public EcoreEventDndEnter()
          {}
 
        public EcoreEventDndEnter(IntPtr EventInfo)
          {
             _EcoreEventDndEnter e = new _EcoreEventDndEnter();
             e = (_EcoreEventDndEnter)Marshal.PtrToStructure(EventInfo, typeof(_EcoreEventDndEnter));
             win = new Window(e.win);
             src = new Window(e.src);
             types = Common.PtrToStringArray(e.types);
             num_types = e.num_types;
          }
     }
```

## Avoiding Marshaling

Marshaling is no panacea, as marshaling implies copying data. Marshaling may be problematic because the data translation is a complex, time-consuming process. Alternatively, it may be problematic because it isn't possible to copy the data, as the data isn't known or is likely to change.

An example of the latter would be the GTK+ libraries. GTK+ is an object-oriented toolkit written in C. As with all object-oriented libraries, there can be an unknown number of derived classes, each of which having a different class size. Furthermore, class instances are typically accessed through pointers. As such, marshaling the entire class between managed and unmanaged memory is not an option, as a copy isn't desired, access to the same instance is.

Another example is when using "opaque" data types; that is, types through which interaction is solely through pointers, and nothing about the internals of the type is public. This describes a large portion of the Win32 API, where HANDLE is used to represent most objects.

There are two ways to handle this in C#: the "type-safe" way, which involves using pointers and the "unsafe" C# language features, and the CLS-compliant way, which uses System.IntPtr to stand in for a void pointer.

In both cases, the separation between managed and unmanaged memory is made explicit. Managed memory remains type-safe, while unmanaged memory is not (since [System.IntPtr](http://docs.go-mono.com/index.aspx?link=T:System.IntPtr) is used to point into unmanaged memory, and there is no way to ensure the actual type of what the System.IntPtr refers to).

Be warned that this may not be safe, if the "unmanaged" memory is itself garbage collected. This may be the case if the unmanaged memory is handled by a different runtime system (Python, Ruby, Lisp, etc.) or a garbage collector is being used (Boehm). If the unmanaged memory is garbage collected, then the System.IntPtr won't be updated when unmanaged memory undergoes a garbage collection, resulting in memory corruption.

For example, given the unmanaged API:

``` c
 typedef void* HANDLE;
 
 bool CreateItem (HANDLE *item);
 void DestroyItem (HANDLE item);
 int GetInfo (HANDLE item);
```

The "type-safe" C# wrapper (using "unsafe" code) is:

``` csharp
 struct Item {
    [DllImport ("library")]
    public static unsafe extern
       bool CreateItem (out Item* item);
 
    [DllImport ("library")]
    public static unsafe extern void DestroyItem (Item* item);
 
    [DllImport ("library")]
    public static unsafe extern int GetInfo (Item* item);
 }
 
 class ExampleUsage {
    public static unsafe void Main ()
    {
       Item* item;
       Item.CreateItem (out item);
       int n = Item.GetInfo (item);
       System.Console.WriteLine ("item count: {0}",
          n.ToString());
       Item.DestroyItem (item);
    }
 }
```

This is "type-safe" in that you can't pass arbitrary memory locations to the static Item functions, you must pass a pointer to an Item structure. This isn't a strict amount of type safety, but it is likely to minimize accidental memory corruption. It's biggest problem is that it uses "unsafe" code, and thus may not be usable from other .NET languages, such as Visual Basic .NET and JavaScript.

The CLS compliant version uses System.IntPtr to refer to unmanaged memory. This is similar to what the [Marshal](http://docs.go-mono.com/index.aspx?link=T:System.Runtime.InteropServices.Marshal) class does to interoperate with unmanaged memory.

``` csharp
 class Item {
    [DllImport ("library")]
    public static extern bool
       CreateItem (out System.IntPtr item);
 
    [DllImport ("library")]
    public static extern void DestroyItem (System.IntPtr item);
 
    [DllImport ("library")]
    public static extern int GetInfo (System.IntPtr item);
 }
 
 class ExampleUsage {
    public static unsafe void Main ()
    {
       System.IntPtr item = null;
       Item.CreateItem (out item);
       int n = Item.GetInfo (item);
       System.Console.WriteLine ("item count: {0}",
          n.ToString());
       Item.DestroyItem (item);
    }
 }
```

This is "unsafe" in that it is easier to accidentally mis-use pointers. For example, if you're using two different libraries and wrapping them using System.IntPtr, it is possible to pass an object allocated from one library to a function exported by the other library, and the CLI Runtime will not catch this error, while the "unsafe" C# code would catch this error.

However, this isn't normally considered a problem, as most managed code shouldn't interact with P/Invoke code, but should instead interact with managed wrappers for the unmanaged code, which can provide a more natural interface to managed clients.

### GC-Safe P/Invoke code

There's one problem with the wrapper code described above: a race-condition between user code and the runtime Garbage Collector (GC).

The GC that .NET uses is not conservative. It knows all types involved, and can distinguish between an integer that looks like a pointer and an actual pointer value. It knows all stack-allocated variables, and what the scope of those variables is. Finally, the GC does not see into unmanaged code.

The result of this is that it's possible the the GC to collect a class instance *while a method of the instance is still executing*.

How is this possible? If the method no longer references class data (instance members), and no other code refers to it, the GC may collect the class. After all, if no instance members are used and no one is using the instance, what's it matter if the instance is collected?

It matters a lot if unmanaged code thinks that the instance is still alive. Or, if the class has a finalizer, which could be executed while native code is executing from within the native method.

Here is an example adapted from Chris Brumme's blog:

``` csharp
 class C {
    // handle into unmanaged memory, for an unmanaged object
    IntPtr _handle;
 
    // performs some operation on h
    [DllImport ("...")]
    static extern void OperateOnHandle (IntPtr h);
 
    // frees resources of h
    [DllImport ("...")]
    static extern void DeleteHandle (IntPtr h);
 
    // Creates Resource
    [DllImport ("...")]
    static extern IntPtr CreateHandle ();
 
    public C()
    {
       _handle = CreateHandle();
    }
 
    ~C()
    {
       DeleteHandle(_handle);
    }
 
    public void m()
    {
       OperateOnHandle(_handle);
       // no further references to _handle
    }
 }
 
 class Other
 {
    void work()
    {
       C c = new C();
       c.m();
       // no further references to c.
       // c is now eligable for collection.
    }
 }
```

Consider this: `Other.work` invokes `C.m`, which invokes the unmanaged code `C.OperateOnHandle`. Note that `Other.work` doesn't use `c` anymore, so `c` is eligible to be collected, and is placed on the GC finalization queue.

This would normally be reasonable, except for the interplay with unmanaged code. The unmanaged code `C.OperateOnHandle` is still using a member held by the instance `c`, but the GC doesn't -- and *can't* -- know this.

This introduces the possibility that, although unlikely, `C.DeleteHandle` will be invoked (from the GC finalization thread) *while* `C.OperateOnHandle` is still operating.

It's fair to assume that the unmanaged code won't appreciate this. It's fair to assume that this could cause major problems for the process, including a segmentation fault.

In fact, a bug very similar to this exists in .NET v1.0, in one of the Registry wrapper classes.

How do you avoid this problem? Don't use raw IntPtrs. With the IntPtr being used, the GC has no way of knowing that the class still needs to hang around. To avoid the bug, we avoid IntPtrs.

Instead of using IntPtr, we use [HandleRef](http://docs.go-mono.com/index.aspx?link=T:System.Runtime.InteropServices.HandleRef). This is a structure which holds both a reference to the containing class, as well as the pointer value.

Next, instead of having the P/Invoke code accept IntPtr parameters, the P/Invoke code accepts HandleRefs. HandleRefs are special to the runtime and GC system, and during a marshal operation they "collapse" into an IntPtr.

This allows us to write the safe code:

``` csharp
 class C {
    // handle into unmanaged memory, for an unmanaged object
    HandleRef _handle;
 
    // performs some operation on h
    [DllImport ("...")]
    static extern void OperateOnHandle (HandleRef h);
 
    // frees resources of h
    [DllImport ("...")]
    static extern void DeleteHandle (HandleRef h);
 
    // Creates Resource
    [DllImport ("...")]
    static extern IntPtr CreateHandle ();
 
    public C()
    {
       IntPtr h = CreateHandle();
       _handle = new HandleRef(this, h);
    }
 
    ~C()
    {
       DeleteHandle(_handle);
    }
 
    public void m ()
    {
       OperateOnHandle(_handle);
       // no further references to _handle
    }
 }
 
 class Other
 {
    void work ()
    {
       // Note: no change to client
       C c = new C();
       c.m();
    }
 }
```

See also: [Chris Brumme's Blog: Lifetime, GC.KeepAlive, handle recycling](http://blogs.msdn.com/cbrumme/archive/2003/04/19/51365.aspx)

#### .NET 2.0 and SafeHandles

In .NET 2.0, a new mechanism for wrapping unmanaged handles was introduced. This new mechanism is exposed by the [SafeHandle](http://docs.go-mono.com/index.aspx?link=T:System.Runtime.InteropServices.SafeHandle) class. SafeHandles encapsulate a handle in the form of an IntPtr, but by exposing it as a subclass of the SafeHandle class (for example [SafeFileHandle](http://docs.go-mono.com/index.aspx?link=T:Microsoft.Win32.SafeFileHandle) or [SafeWaitHandle](http://docs.go-mono.com/index.aspx?link=T:Microsoft.Win32.SafeWaitHandle)) developers gain type safety.

SafeHandles in addition provide a mechanism to avoid inadvertent handle recycling (for references [\[1\]](http://blogs.msdn.com/cbrumme/archive/2004/02/20/77460.aspx) [\[2\]](http://blogs.msdn.com/bclteam/archive/2005/03/15/396335.aspx)).

The runtime treats SafeHandles specially and will automatically provide marshalling of these when used in P/Invoke calls. The behavior depends on its use:

-   On outgoing parameters, the SafeHandle's handle is passed.
-   On return values, a new instance of the concrete SafeHandle class is created, and the handle value is set to the returned IntPtr value.
-   On ref SafeHandles, the outgoing value is ignored (must be zero) and the returned value is turned into a proper SafeHandle.
-   On structure fields, the SafeHandle's handle is passed.

For the actual implementation details in Mono, see the [SafeHandles](/docs/advanced/safehandles/) document.

### Properly Disposing of Resources

When avoiding marshaling, you're referencing unmanaged memory and other resources from managed code. This confers a great deal of responsibility. It also creates a great deal of concern, as more things can "go wrong" in managed code, particularly because of exceptions and related complexity. When any function can throw an exception, ensuring that resources are properly disposed of can be a tricky matter.

As suggested in the [previous section](#gc-safe-pinvoke-code), a simple way to ensure that resources are eventually disposed is to wrap the resource within a class containing a finalizer. The finalizer can then free the resource.

There are two problems with that approach, both of which have to do with the garbage collector:

1.  The garbage collector cannot see into unmanaged memory, it only deals with managed memory. Thus, if you have a large amount of memory in unmanaged memory (such as images or video data), all the GC will see is the **IntPtr**(s) that refer to this data, and not the size of the unmanaged memory "held" by the managed code. Consequently, the GC won't know that a collection should be executed (there won't be any "memory pressure" to cause a collection).

    This is partially fixed in Microsoft's implementation of .NET 2.0 by using the [System.GC.AddMemoryPressure(long)](http://msdn2.microsoft.com/en-us/library/system.gc.addmemorypressure.aspx) method, which can be used to tell the GC how much unmanaged memory a managed object is referencing, which can improve the GC heuristics. However, code needs to be modified to support this approach and does not work with .NET 1.1 code.

    > At the the time of this writing (January 2015), this approach ***will not work on Mono***, as [System.GC.AddMemoryPressure(long)](http://msdn2.microsoft.com/en-us/library/system.gc.addmemorypressure.aspx) and [System.GC.RemoveMemoryPressure(long)](http://msdn2.microsoft.com/en-us/library/system.gc.removememorypressure.aspx) are implemented as no-ops. This means that some existing code that performs normally under Microsoft's CLR will quickly exhaust the unmanaged heap and cause both unmanaged and managed memory allocations to fail.

2.  The .NET garbage collector does not execute an object's finalizer when the object is collected. Instead, the object is promoted a generation, and the object's finalizer is executed the next time that generation is collected.

    For example, if a Generation 0 object with a finalizer is eligible for collection (i.e. no objects reference it), the object is promoted a generation, and placed on the Generation 1 finalization queue. The next time Generation 1 is collected, the object's finalizer will be executed.

Problem 2 is a real killer, as collection frequency is inversely proportional to the generation number. Generation 0 is (typically) collected 10 times as frequently as Generation 1, which in turn is collected 10 times as frequently as Generation 2. Generation 2 is intended to be *rarely*collected, as these should be long-term objects that persist through the life of the application.

Given that the soonest a finalizer is collected is after two collections, one for Generation 0 and one for Generation 1 (which occurs after \~10 Generation 0 collections), it can be a *long time* before a finalizer is executed. Relying on finalizers for resource disposal and collection is a *BAD IDEA*, even before considering that finalizers are not guaranteed to be executed, especially at program shutdown.

Fortunately, there is a simple pattern used throughout the .NET Class Libraries to help ensure that resources are disposed of quickly:

-   Implement the [System.IDisposable](http://docs.go-mono.com/index.aspx?link=T:System.IDisposable) interface.
-   Call [Dispose](http://docs.go-mono.com/index.aspx?link=M:System.IDisposable.Dispose) when finished with the resource. The implementation for **Dispose** does two things:
    1.  dispose of the resource, and
    2.  call [GC.SuppressFinalize](http://docs.go-mono.com/index.aspx?link=M:System.GC.SuppressFinalize) .

**SuppressFinalize** informs the GC that the object's finalizer doesn't need to be invoked, allowing the object to be freed during the first collection, and not after a considerable delay. A sample implementation is:

``` csharp
 // for IntPtr, IDisposable
 using System;
 
 // for HandleRef, DllImport
 using System.Runtime.InteropServices;
 
 sealed class UnmanagedResource : IDisposable
 {
    [DllImport ("...")]
    private static extern IntPtr CreateResource ();
 
    [DllImport ("...")]
    private static extern
       void DeleteResource (HandleRef handle);
 
    // Use a HandleRef to avoid race conditions;
    // see the GC-Safe P/Invoke Code section
    private HandleRef _handle;
 
    public UnmanagedResource ()
    {
       IntPtr h = CreateResource ();
       _handle = new HandleRef (this, h);
    }
 
    // Provide access to 3rd party code
    public HandleRef Handle {
       get {return _handle;}
    }
 
    // Dispose of the resource
    public void Dispose ()
    {
       Cleanup ();
 
       // Prevent the object from being placed on the
       // finalization queue
       System.GC.SuppressFinalize (this);
    }
 
    // Finalizer provided in case Dispose isn't called.
    // This is a fallback mechanism, but shouldn't be
    // relied upon (see previous discussion).
    ~UnmanagedResource ()
    {
       Cleanup ();
    }
 
    // Really dispose of the resource
    private void Cleanup ()
    {
       DeleteResource (Handle);
 
       // Don't permit the handle to be used again.
       _handle = new HandleRef (this, IntPtr.Zero);
    }
 }
```

Frequently **IDisposable** examples will provide a virtual `Dispose(bool)` method, which both **Dispose** and the finalizer delegate to, as opposed to the `Cleanup()` method used above. However, providing both a a virtual function and a non-`sealed` class is advertising the ability/desire to subclass, which is a potentially bad idea.

It's a potentially bad idea, again, because of the garbage collector. When an object is promoted a GC generation, *all* objects it refers to are *also* promoted a generation, recursively. So if your finalizable object contains an **ArrayList** of other objects, both the **ArrayList**, all objects it contains, and all objects *those* objects reference (recursively) will be promoted. This can be a potentially large amount of managed memory which is promoted a generation.

Given the GC promotion rules, it is highly recommended that finalizable classes be "leaf" nodes; that is, objects that don't refer to other objects within the managed memory "tree". For this reason, it is highly suggested that finalizable objects be sealed to prevent subclassing, to minimize the number of managed objects that the finalizable object refers to. Rico Mariani discusses this in "Almost-rule #2: Never have finalizers".

Implementing the **IDisposable** interface isn't a complete solution, as it requires that users remember to invoke the **Dispose** method. The C# *using* block can be used to ensure that **Dispose** is invoked at the end of the block:

``` csharp
 using (UnmanagedResource ur = new UnmanagedResource()) {
    // Use the unmanaged resource.  It will be automatically
    // disposed of at the end of this block.
 }
```

See also:

-   [Rico Mariani's Blog: Two things to avoid for better memory usage](https://docs.microsoft.com/en-us/archive/blogs/ricom/two-things-to-avoid-for-better-memory-usage).

## Miscellaneous Topics

Topics that didn't seem to fit in anywhere else, but might be useful.

### Meaning of "Unsafe"

A "problem" is that "unsafe" is an overloaded term. It can refer to the use of the "unsafe" C# keyword, and it can be used as "anything that isn't safe", which may not require the "unsafe" keyword.

So, "unsafe" can mean (a) C# keyword; (b) violates .NET type system (similar to (a)); (c) may be insecure (reading files from a web client); (d) capable of causing a segfault. There are likely other meanings people can dream up as well. Note that (d) doesn't imply (b), as far as .NET is concerned. The runtime could itself have a bug that generates a segfault, but this doesn't violate the type system.

IntPtr doesn't require a violation of the type system, as you can't get the address of a .NET object (unless you "pin" it, which would require the appropriate Security rights), and is thus principally useful for interacting with unmanaged code, which exists outside of the .NET type system.

Surely, this is pure semantics, but I can see the designers perspective.

### Security

.NET has a highly flexible security system. You can't invoke DllImported functions unless your app has the appropriate security rights -- generally, that the app is running on the local machine. If you're running it from a network share, or from a web site (similar to Java Applets), then your app will get a SecurityException.

You can get lots of security exceptions for various things, actually. Opening files can generate a security exception, for example.

[System.Security.Permissions.SecurityPermission](http://docs.go-mono.com/index.aspx?link=T:System.Security.Permissions.SecurityPermission) is needed with [SecurityPermissionFlag.UnmanagedCode](http://docs.go-mono.com/index.aspx?link=F:System.Security.Permissions.SecurityPermissionFlag.UnmanagedCode) specified in order to perform a P/Invoke.

Programs can't specify this permission; they can only request it (or demand it, and if they can't get it, a SecurityException is thrown).

Administrators are the people who specify what permissions an application actually receives.

That's about the limits of my knowledge -- Security isn't my forte. You might find the following topics interesting.

-   [Requesting Permissions at MSDN](http://msdn.microsoft.com/en-us/library/vstudio/yd267cce(v=vs.100).aspx)
-   [Security Syntax at MSDN](http://msdn.microsoft.com/en-us/library/vstudio/a95batfc(v=vs.100).aspx)
-   [Code Access Security at MSDN](http://msdn.microsoft.com/en-us/library/vstudio/c5tk9z76(v=vs.100).aspx)
-   [Inheritance Demands at MSDN](http://msdn.microsoft.com/en-us/library/x4yx82e6(v=vs.110).aspx)

See also: [Unsafe Code at MSDN](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/csspec/html/vclrfcsharpspec_A_2.asp)

## Troubleshooting

In Unix, sometimes P/Invoking a library can fail due to a number of reasons:

-   The Library being P/Invoked not being in the LD_LIBRARY_PATH
-   The Library being P/Invoked has a different name
-   The library being P/Invoked has different casing (MONO_IOMAP does not apply here)
-   The library could depend on symbols from another library that has not been loaded.

To identify the source of the problem if you get an error in your P/Invoke run Mono like this:

``` bash
bash$ MONO_LOG_LEVEL="debug" MONO_LOG_MASK="dll" mono glue.exe
```

## Commentary

Interesting commentary that doesn't really belong elsewhere, but is still good to know.

### P/Invoke Specification

From Paolo Molaro:

Yes, the P/Invoke specification (or lack thereof) is a mess. It was done by people that didn't \[think\] through the portability issues and this is probably one of the reasons the MS CLR is not really supported on 9x-based platforms. Note: P/Invoke is intrinsically non-portable, the main issue is that P/Invoke is poorly defined in a non-win32 system. Think of Charset: they allow Ansi and Unicode (with Auto meaning one or the other according to the platform), but the world uses also other encodings. At the very least they should have added a Charset.Encoding or something, with the actual encoding specified separately as a string, for example (good luck, though, finding a UCS4 encoding implementation in the base assemblies...).

## Thanks

Portions of this document were generated as a result of a [mono-list discussion](https://lists.dot.net/pipermail/mono-list/2003-July/014886.html) between Jonathan Pryor and David Jeske.

Thanks also to Paolo Molaro, Bernie Solomon, and Marcus for reviews and comments.

## Copyright

To the greatest extent possible, this document is dedicated to the Public Domain. Please properly document [Jonathan Pryor](mailto:jonpryor@vt.edu) as the original author (you don't go quoting Mark Twain without mentioning him even though his works are all Public Domain), but I fully expect that this document can (and will) be massaged for other mediums.

Note that some portions of this document are quotations from others; the original author is mentioned when quotations are made.

## Revision History

August 15, 2005

Added char\*\* marshalling tutorial

April 12, 2005

Moved into the wiki.

February 3, 2005

Revised navigation menu to show 1st and 2nd level links. Documented Mono's \_\_Internal library name extension for importing symbols from within the loading program. Added Marshaling Arrays section, which clarifies array marshaling issues and includes the David Jesk commentary (which shouldn't have been in the "Avoiding Marshaling" section anyway). Added boolean marshaling information. Added Marshaling Embedded Strings information. Minor corrections, additional links to blogs and articles.

June 14, 2004

Added Properly Disposing of Resources section; changed title to clarify document's intent.

June 6, 2004

Mono properly frees the memory of class-typed return values now. Remove comment stating otherwise. (miguel)

May 15, 2004

Added Exception Propogation section, updated Mono's .config file handling; spelling correction: s/marshalling/marshaling/g (this matches MSDN spelling conventions).

March 20, 2004

Added Memory Boundaries section based on suggestions from Marcus; formatting changes.

August-October 2003

Initial Version.
