---
title: COM Interop
redirect_from:
  - /COM_Interop/
---

Introduction
============

Mono 1.0 and Mono 1.1.xx do not have support for COM, it is a known missing feature of Mono. Initial work has begun on supporting MS COM on Windows. The long term goal is to support a variety of unmanaged component technologies including [MS COM](http://www.microsoft.com/com), [XPCOM](http://www.mozilla.org/projects/xpcom/), and [UNO](http://udk.openoffice.org/).

Roadmap
=======

The first goal is to get COM Interop working on Windows. This can be broken down into two stages, corresponding to the two types of [COM Wrappers](http://msdn2.microsoft.com/en-us/library/5dxz80y2(vs.80).aspx).

1.  Exposing a COM object as a [Runtime Callable Wrapper (RCW)](http://msdn2.microsoft.com/en-us/library/8bwh56xe.aspx) is the first step.
2.  The opposite is next, exposing a managed object as a [COM Callable Wrapper (CCW)](http://msdn2.microsoft.com/en-us/library/f07c8z1c.aspx). Marshalling logic for additional types must be implemented for COM Interop including BSTRs, VARIANTs, SAFEARRAYs, and most importantly interface pointers.

After COM Interop is working on Windows, the next step is to extend the mechanism for other component systems. The current idea is to reuse the COM Interop paradigm, providing extension points to handle the differences in component systems. A current prototype exists for XPCOM.

Progress
========

COM Interop support includes the following:

Creation of COM objects via Runtime Callable Wrappers. \<span id="rcw_creation"/\>

``` csharp
 MyCOMObject com_object_wrapper = new MyCOMObject();
```

where MyCOMObject is a class marked with the [COMImportAttribute](http://msdn2.microsoft.com/en-us/library/system.runtime.interopservices.comimportattribute.aspx) and a [GuidAttribute](http://msdn2.microsoft.com/en-us/library/system.runtime.interopservices.guidattribute.aspx) with the CLSID of the COM class. \<span id="rcw_class_def"/\>

``` csharp
 [ComImport ()]
 [Guid ("00000000-0000-0000-0000-000000000000")]
 class MyCOMObject
 {
 ...
 }
```

COM objects can be marshalled into managed code, and managed objects can be marshalled into unmanaged code using the [MarshalAsAttribute](http://msdn2.microsoft.com/en-us/library/system.runtime.interopservices.marshalasattribute.aspx). Also, VARIANT and BSTR marshalling is supported. \<span id="marshalasattribute"/\>

``` csharp
 [ComImport ()]
 [Guid ("00000000-0000-0000-0000-000000000000")]
 class MyCOMObject
 {
     void GetMeACOMObject([MarshalAs (UnmanagedType.Interface)] out IFoo ifoo);
     void SendToUnmanaged([MarshalAs (UnmanagedType.Interface)] Foo ifoo);
     void SetName([MarshalAs (UnmanagedType.BStr)] string name);
     void SetTag([MarshalAs (UnmanagedType.Struct)] object tag);
 }
```

A large number of methods in the [Marshal Class](http://msdn2.microsoft.com/en-us/library/system.runtime.interopservices.marshal.aspx) related to COM Interop have also been implemented. Methods like: \<span id="marshal_class"/\>

``` csharp
 public class Marshal
 {
     public static int AddRef (IntPtr pUnk);
     public static object CreateWrapperOfType (object o, Type t);
     public static int FinalReleaseComObject (object o);
     public static void FreeBSTR (IntPtr ptr);
     public static IntPtr GetComInterfaceForObject (object o, Type T);
     public static IntPtr GetIDispatchForObject (object o);
     public static IntPtr GetIUnknownForObject (object o);
     public static void GetNativeVariantForObject (object obj, IntPtr pDstNativeVariant);
     public static object GetObjectForIUnknown (IntPtr pUnk);
     public static object GetObjectForNativeVariant (IntPtr pSrcNativeVariant);
     public static object[] GetObjectsForNativeVariants (IntPtr aSrcNativeVariant, int cVars);
     public static object GetTypedObjectForIUnknown (IntPtr pUnk, Type t);
     public static bool IsComObject (object o);
     public static int QueryInterface (IntPtr pUnk, ref Guid iid, out IntPtr ppv);
     public static int Release (IntPtr pUnk);
     public static int ReleaseComObject (object o);
     public static IntPtr StringToBSTR (string s);
     ...
 }
```

Example
=======

I have run a large number of test apps. You should be able to interact with standard COM objects such as IE, Windows Media Player, Office, etc. As for examples, most people interested in this probably already know how to generate COM interop wrapper code using MS tools, but I'll post a hand coded example in the near future. Unfortunately the code can be quite verbose, so I'll try to think of a neat little sample to demonstrate COM Interop in mono.

Non-Windows Platform Support
============================

Note that there is very little that ties COM Interop to Windows. COM is a binary standard, so anyone who follows that standard can use the COM Interop functionality in mono. XPCOM can easily be supported if anyone is interested in putting in a little work to support marshalling strings. This is [MainWin](http://www.mainsoft.com/products/mainwin.aspx) ported COM objects can also use mono COM Interop, with few minor adjustments.

XPCOM Support
-------------

Some developers embed Mozilla's XPCOM in their applications. This is supported by Mono's runtime, all that is required is that you initialize the runtime properly. The following is an example of how you would initialize an embedded version of XPCOM:

``` csharp
// File: NativeMethods.cs
 
using System;
using System.Runtime.InteropServices;
 
public class NativeMethods
{
    private NativeMethods() {}
 
 
    [DllImport("libxpcomglue.so.0d")]
    public static extern int XPCOMGlueStartup(IntPtr xpcomFile);
 
    [DllImport("libxpcomglue.so.0d")]
    public static extern int XPCOMGlueShutdown();
 
    [DllImport ("MyXPCOM.so")]
    public static extern int NS_InitXPCOM2 (
                        [MarshalAs(UnmanagedType.Interface)]out nsIServiceManager result,
                        IntPtr binDirectory, IntPtr appFileLocationProvider);
 
    [DllImport ("MyXPCOM.so")]
    public static extern int NS_ShutdownXPCOM(
                        [MarshalAs(UnmanagedType.Interface)] nsIServiceManager aSvcManager);
}
```

The above references two shared libraries: MyXPCOM.so is the shared library that embeds the XPCOM library and the other one is part of XPCOM (libxpcomglue).

To use it, you can use a method like this:

``` csharp
class XPCOMTester
{
[STAThread]
static int Main (string[] args) {
   int hr = NativeMethods.XPCOMGlueStartup (IntPtr.Zero);
   nsIServiceManager sm;
   hr = NativeMethods.NS_InitXPCOM2 (out sm, IntPtr.Zero, IntPtr.Zero);
 
   nsIComponentRegistrar cr = (nsIComponentRegistrar)sm;
 
   cr.autoRegister(IntPtr.Zero);
 
   Guid kEventQueueServiceCID = new Guid("be761f00-a3b0-11d2-996c-0080c7cb1080");
   IntPtr ptr;
   sm.getService(kEventQueueServiceCID, typeof(nsIEventQueueService).GUID, out ptr);
 
   nsIEventQueueService eqs = (nsIEventQueueService)Marshal.GetObjectForIUnknown(ptr);
   eqs.CreateThreadEventQueue();
 
   nsIEventQueue eq = eqs.GetThreadEventQueue(IntPtr.Zero);
 
   Guid IPC_SERVICE_CID = new Guid("9f12676a-5168-4a08-beb8-edf8a593a1ca");
   sm.getService(IPC_SERVICE_CID, typeof(ipcIService).GUID, out ptr);
   // or
   // sm.getServiceByContractID("@mozilla.org/ipc/service;1", typeof(ipcIService).GUID, out ptr);
 
   // Do more XPCOM stuff here
   //
 
   NativeMethods.NS_ShutdownXPCOM(sm);
   NativeMethods.XPCOMGlueShutdown();
   return 0;
}
```

Interfaces are defined as follows (taking nsIServiceManager as an example):

``` csharp
[Guid("8bb35ed9-e332-462d-9155-4a002ab5c958")]
[InterfaceType (ComInterfaceType.InterfaceIsIUnknown)]
[ComImport()]
public interface nsIServiceManager
{
  [MethodImpl(MethodImplOptions.InternalCall, MethodCodeType=MethodCodeType.Runtime)]
  [PreserveSigAttribute]
  void getService ([MarshalAs (UnmanagedType.LPStruct)] Guid clsid,
     [MarshalAs (UnmanagedType.LPStruct)] Guid iid,
     out IntPtr result);
 
  [MethodImpl(MethodImplOptions.InternalCall, MethodCodeType=MethodCodeType.Runtime)]
  [PreserveSigAttribute]
  void getServiceByContractID ([MarshalAs (UnmanagedType.LPStr)] string contractID,
  [MarshalAs (UnmanagedType.LPStruct)] Guid iid,
  out IntPtr result);
 
  [MethodImpl(MethodImplOptions.InternalCall, MethodCodeType=MethodCodeType.Runtime)]
  [PreserveSigAttribute]
  PRBool isServiceInstantiated ([MarshalAs (UnmanagedType.LPStruct)] Guid clsid,
  [MarshalAs (UnmanagedType.LPStruct)] Guid iid);
 
  [MethodImpl(MethodImplOptions.InternalCall, MethodCodeType=MethodCodeType.Runtime)]
  [PreserveSigAttribute]
  PRBool isServiceInstantiatedByContractID ([MarshalAs (UnmanagedType.LPStr)] string contractID,
  [MarshalAs (UnmanagedType.LPStruct)] Guid iid);
}
```

Tools
=====

There is now a tool, **xpidl2cs**, that creates C# interfaces from idl files. It is available from svn, [[1]](https://github.com/mono/mono/tree/master/mcs/class/Mono.WebBrowser/tools/xpidl2cs).

xpidl2cs generates a C# interface for the given idl file, and then goes up the inheritance tree, generating all parent interfaces. Since .NET interop does not support interface inheritance, whenever an interface derives from another, all the declarations from the parent interface must be included in the child - xpidl2cs recursively includes the body of the parent in the child, inside a region with the parent's name.

xpidl2cs also generates all dependent interfaces, i.e., all the interfaces that are used in the properties and methods of all the touched idl files. To avoid endless loops, it won't try to generate an interface for which there already exists a .cs file, so if you need to regenerate everything, you must delete the interfaces before running the tool.

The tool was designed originally to produce interfaces for Mono.Mozilla from the Mozilla idl files, so it is slightly biased - the namespace is (at the moment) hardcoded to Mono.Mozilla, and, when going up the inheritance tree, it stops when it encounters a parent called nsISupports.

``` bash
Usage: xpidl2cs.pl file.idl [/path/to/idl/]
```

In the future, we will have a tool **xptimport** that will be able to import type libraries from your XPCOM components and generate the necessary C# interface declarations.

TODO
====

1.  [IDispatch](http://msdn2.microsoft.com/en-us/library/ms221608.aspx) support, both for RCWs and for CCWs
2.  [LCIDConversionAttribute](http://msdn2.microsoft.com/en-us/library/system.runtime.interopservices.lcidconversionattribute.aspx) Unfortunately, this nasty little guy is used by Office Interop Assemblies.
3.  Better [aggregation](http://msdn2.microsoft.com/en-us/library/ms686558.aspx) support


