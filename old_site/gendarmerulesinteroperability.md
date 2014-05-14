---
layout: obsolete
title: "Gendarme.Rules.Interoperability"
permalink: /old_site/Gendarme.Rules.Interoperability/
redirect_from:
  - /Gendarme.Rules.Interoperability/
---

Gendarme.Rules.Interoperability
===============================

[Gendarme]({{site.github.url}}/old_site/Gendarme "Gendarme")'s interoperability rules are located in the **Gendarme.Rules.Interoperability.dll** assembly. Latest sources are available from [anonymous SVN](http://anonsvn.mono-project.com/viewcvs/trunk/mono-tools/gendarme/rules/Gendarme.Rules.Interoperability/).

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#rules">1 Rules</a>
<ul>
<li><a href="#delegatespassedtonativecodemustincludeexceptionhandlingrule">1.1 DelegatesPassedToNativeCodeMustIncludeExceptionHandlingRule</a></li>
<li><a href="#donotassumeintptrsizerule">1.2 DoNotAssumeIntPtrSizeRule</a></li>
<li><a href="#getlasterrormustbecalledrightafterpinvokerule">1.3 GetLastErrorMustBeCalledRightAfterPInvokeRule</a></li>
<li><a href="#marshalbooleansinpinvokedeclarationsrule">1.4 MarshalBooleansInPInvokeDeclarationsRule</a></li>
<li><a href="#marshalstringsinpinvokedeclarationsrule">1.5 MarshalStringsInPInvokeDeclarationsRule</a></li>
<li><a href="#pinvokeshouldnotbevisiblerule">1.6 PInvokeShouldNotBeVisibleRule</a></li>
<li><a href="#usemanagedalternativestopinvokerule">1.7 UseManagedAlternativesToPInvokeRule</a></li>
</ul></li>
<li><a href="#feedback">2 Feedback</a></li>
</ul></td>
</tr>
</tbody>
</table>

Rules
=====

### DelegatesPassedToNativeCodeMustIncludeExceptionHandlingRule

Every delegate which is passed to native code must include an exception block which spans the entire method and has a catch all handler.

**Bad** example:

``` csharp
public void NativeCallback ()
{
    Console.WriteLine ("{0}", 1);
}
```

**Good** example:

``` csharp
public void NativeCallback ()
{
    try {
        Console.WriteLine ("{0}", 1);
    }
    catch {
    }
}
```

**Notes**

-   This rule is available since Gendarme 2.6

### DoNotAssumeIntPtrSizeRule

This rule checks for code which casts an **IntPtr** or **UIntPtr** into a 32-bit (or smaller) value. It will also check if memory read with the **Marshal.ReadInt32**and **Marshal.ReadInt64** methods is being cast into an **IntPtr** or **UIntPtr**. **IntPtr** is generally used to reference a memory location and downcasting them to 32-bits will make the code fail on 64-bit CPUs.

**Bad** example (cast):

``` csharp
int ptr = dest.ToInt32 ();
for (int i = 0; i < 16; i++) {
    Marshal.StructureToPtr (this, (IntPtr)ptr, false);
    ptr += 4;
}
```

**Bad** example (Marshal.Read\*):

``` csharp
// that won't work on 64 bits platforms
IntPtr p = (IntPtr) Marshal.ReadInt32 (p);
```

**Good** example (cast):

``` csharp
long ptr = dest.ToInt64 ();
for (int i = 0; i < 16; i++) {
    Marshal.StructureToPtr (this, (IntPtr) ptr, false);
    ptr += IntPtr.Size;
}
```

**Good** example (Marshal.Read\*):

``` csharp
IntPtr p = (IntPtr) Marshal.ReadIntPtr (p);
```

**Notes**

-   This rule is available since Gendarme 2.0 but was named DoNotCastIntPtrToInt32Rule before 2.2

### GetLastErrorMustBeCalledRightAfterPInvokeRule

This rule will fire if **Marshal.GetLastWin32Error()** is called, but is not called immediately after a P/Invoke. This is a problem because other methods, even managed methods, may overwrite the error code.

**Bad** example:

``` csharp
public void DestroyError ()
{
    MessageBeep (2);
    Console.WriteLine ("Beep");
    int error = Marshal.GetLastWin32Error ();
}
```

**Good** example:

``` csharp
public void GetError ()
{
    MessageBeep (2);
    int error = Marshal.GetLastWin32Error ();
    Console.WriteLine ("Beep");
}
 
public void DontUseGetLastError ()
{
    MessageBeep (2);
    Console.WriteLine ("Beep");
}
```

### MarshalBooleansInPInvokeDeclarationsRule

This rule warns the developer if a **[MarshalAs]** attribute has not been specified for boolean parameters of a P/Invoke method. The size of boolean types varies across language (e.g. the C++ **bool** type is four bytes on some platforms and one byte on others). By default the CLR will marshal **System.Boolean**as a 32 bit value (**UnmanagedType.Bool**) like the Win32 API **BOOL**uses. But, for clarity, you should always specify the correct value.

**Bad** example:

``` csharp
// bad assuming the last parameter is a single byte being mapped to a bool
[DllImport ("liberty")]
private static extern bool Bad (bool b1, ref bool b2);
```

**Good** example:

``` csharp
[DllImport ("liberty")]
[return: MarshalAs (UnmanagedType.Bool)]
private static extern bool Good ([MarshalAs (UnmanagedType.Bool)] bool b1, [MarshalAs (UnmanagedType.U1)] ref bool b2);
```

### MarshalStringsInPInvokeDeclarationsRule

This rule will fire if a P/Invoke method has System.String or System.Text.StringBuilder arguments, and the DllImportAttribute does not specify the **CharSet**, and the string arguments are not decorated with **[MarshalAs]**. This is important because the defaults are different on the various platforms. On Mono the default is to always use utf-8. On .NET the default is to use the ANSI CharSet which is the native encoding and will typically be some variant of ASCII or something like Shift-JIS. On Compact .NET the default is utf-16.

**Bad** example:

``` csharp
[DllImport ("coredll")]
static extern int SHCreateShortcut (StringBuilder szShortcut, StringBuilder szTarget);
```

**Good** examples:

``` csharp
[DllImport ("coredll", CharSet = CharSet.Auto)]
static extern int SHCreateShortcut (StringBuilder szShortcut, StringBuilder szTarget);
 
[DllImport ("coredll")]
static extern int SHCreateShortcut ([MarshalAs (UnmanagedType.LPTStr)] StringBuilder szShortcut,
[MarshalAs (UnmanagedType.LPTStr)] StringBuilder szTarget);
```

### PInvokeShouldNotBeVisibleRule

This rule checks for PInvoke declaration methods that are visible outside their assembly.

**Bad** example:

``` csharp
[DllImport ("user32.dll")]
public static extern bool MessageBeep (UInt32 beepType);
```

**Good** example:

``` csharp
[DllImport ("user32.dll")]
internal static extern bool MessageBeep (UInt32 beepType);
```

### UseManagedAlternativesToPInvokeRule

This rule will fire if an external (P/Invoke) method is called but a managed alternative is provided by the .NET framework.

**Bad** example:

``` csharp
[DllImport ("kernel32.dll")]
static extern void Sleep (uint dwMilliseconds);
 
public void WaitTwoSeconds ()
{
    Sleep (2000);
}
```

**Good** example:

``` csharp
public void WaitTwoSeconds ()
{
    System.Threading.Thread.Sleep (2000);
}
```

Feedback
========

Please report any documentation errors, typos or suggestions to the [Gendarme Google Group](http://groups.google.com/group/gendarme). Thanks!

