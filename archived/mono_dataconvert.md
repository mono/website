---
title: "Mono DataConvert"
lastmodified: '2010-11-11'
redirect_from:
  - /Mono_DataConvert/
---

Mono DataConvert
================

The DataConvert class is a replacement for System.BitConvert in the .NET class libraries that provides:

-   Host types to native byte arrays, little endian byte arrays and big endian byte arrays.
-   native, little endian, big endian to Host types.
-   Helper routines for Stream I/O.
-   Convenience routines for packing and unpacking data structures.

This class offers three different ways of data conversion to address different usage scenarios:

**Static Methods API** are explicit in their names but can become a bit verbose

**Instance Methods API** if you know in advance that you will be processing all of your data in a specific encoding (host, little endian or big endian) it might be more comfortable to use these APIs.

**Pack/Unpack API** this is an API inspired after the Perl pack and unpack functions. For example:

``` csharp
// The following means:
// Little endian encoding of a Int16, followed by an aligned
// int32 value.
byte [] r = DataConverter.Pack ("_s!i", 0x7b, 0x12345678);
 
// Results in:
// 7b 00 00 00 78 56 34 12
 
// The following means:
// utf8-encoded and null terminated string:
byte [] r = DataConverter.Pack ("z8", "hello");
 
// Result is:
// 68 65 6c 6c 6f 00 00 00 00
```

These are some examples of Unpack:

``` csharp
//
// The following unpacks a GUID stored in memory into its member values:
//
byte [] guid = { 0x25, 0xf7, 0x00, 0xb2,
         0x25, 0xe7, 0x53, 0x4c,
         0xb3, 0x6a, 0x1e, 0xc2,
         0x7a, 0xef, 0x12, 0xef };
foreach (var x in DartaConverter.Unpack ("_issbbbbbbbb", guid, 0)){
    Console.Write ("{0:x2}",x);
    Console.Write ("-");
}
//
// Result is:
// b200f725-e725-4c53-b3-6a-1e-c2-7a-ef-12-ef-
```

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#instance-methods">1 Instance Methods</a>
<ul>
<li><a href="#examples-of-the-instance-api">1.1 Examples of the Instance API</a></li>
</ul></li>
<li><a href="#pack-and-unpack">2 Pack and Unpack</a>
<ul>
<li><a href="#pack-instruction-specification">2.1 Pack Instruction Specification</a></li>
<li><a href="#packunpack-examples">2.2 Pack/Unpack Examples</a></li>
</ul></li>
<li><a href="#static-methods">3 Static Methods</a></li>
<li><a href="#obtaining-monodataconvert">4 Obtaining Mono.DataConvert</a></li>
<li><a href="#problems-with-the-clis-systembitconverter">5 Problems with the CLI's System.BitConverter</a></li>
</ul></td>
</tr>
</tbody>
</table>

Instance Methods
================

The instance methods are useful if you know that all the data processing that you will be doing will be for a specific encoding. To use these methods you obtain an instance of DataConverter from one of the public properties:

``` csharp
        static public DataConverter LittleEndian { get; }
        static public DataConverter BigEndian { get; }
        static public DataConverter Native { get; }
```

Each one of those instances will provide encoding to and from little endian format, big endian format or the native format of the host. Internally you will get an instance of the proper class: if your endianness matches the requested encoding for example, the data is always copied, otherwise it is swapped.

**Storing the data into an existing array**:

The following API is recommended if you want to decode the data directly into an existing array without having to allocate data and copying data. You must pass an array that can contain the proper sized value and an index in the destination array to store it:

``` csharp
        public void PutBytes (byte [] dest, int destIdx, double value);
        public void PutBytes (byte [] dest, int destIdx, short value);
        public void PutBytes (byte [] dest, int destIdx, int value);
        public void PutBytes (byte [] dest, int destIdx, long value);
        public void PutBytes (byte [] dest, int destIdx, float value);
        public void PutBytes (byte [] dest, int destIdx, ushort value);
        public void PutBytes (byte [] dest, int destIdx, uint value);
        public void PutBytes (byte [] dest, int destIdx, ulong value);
```

Doubles, longs and ulongs need eight bytes; ints, uints and floats need four bytes and short and ushorts need two bytes.

**Obtaining the byte representation**:

The following family of methods will return newly allocated byte arrays that contain the value encoded in the requested representation:

``` csharp
        public byte [] GetBytes (double value);
        public byte [] GetBytes (short value);
        public byte [] GetBytes (int value);
        public byte [] GetBytes (long value);
        public byte [] GetBytes (float value);
        public byte [] GetBytes (ushort value);
        public byte [] GetBytes (uint value);
        public byte [] GetBytes (ulong value);
```

**Converting bytes into native types**

``` csharp
        public abstract double GetDouble (byte [] data, int index);
        public abstract float  GetFloat  (byte [] data, int index);
        public abstract short  GetInt16  (byte [] data, int index);
        public abstract ushort GetUInt16 (byte [] data, int index);
        public abstract int    GetInt32  (byte [] data, int index);
        public abstract uint   GetUInt32 (byte [] data, int index);
        public abstract long   GetInt64  (byte [] data, int index);
        public abstract ulong  GetUInt64 (byte [] data, int index);
```

Examples of the Instance API
----------------------------

The following saves the value of PI in big endian format into the given file stream:

``` csharp
    void Save (FileStream fs)
    {
         DataConvert enc = DataConvert.BigEndian;
         fs.Write (enc.GetBytes (Math.PI), 0,8);
    }
```

The following loads a double encoded in little endian format from the given file:

``` csharp
    double GetFromFile (FileStream fs)
    {
         byte [] buffer = new byte [8];
         fs.Read (buffer, 0, 8);
         DataConvert enc = DataConvert.LittleEndian;
         return enc.GetDouble (buffer, 0);
    }
```

Pack and Unpack
===============

The DataConvert class offers two helper methods that can be used to reduce the number of code written when dealing with binary data structures. These methods are inspired by Perl's pack and unpack functions.

The C# prototypes are:

``` csharp
static public byte [] Pack (string description, params object [] args);
static public byte [] PackEnumerable (string description, IEnumerable args);
static public IList Unpack (string description, byte [] buffer, int startIndex)
```

For Pack there are two modes of operation: one takes a variable number of arguments (params method) and another one operates on an IEnumerable allowing arrays and other collections to be used as input. The reason they have different names is to avoid ambiguities with types like String that happen to be IEnumerables.

The description string is used to drive the packing and unpacking of the arguments, it controls how each of the arguments that are passed are encoded. Internally the Pack method uses System.Convert to convert each data type to the requested type.

Unpack takes a description, the byte array and the initial position to Unpack from and returns a List of objects in the format specified by the description.

For example, to pack two integers in big endian format, you would use this:

``` csharp
    byte [] data = DataConvert.Pack ("^ii", 1234, 4542);
```

The **\^** character specifies that encoding from that point on will be done in using the big-endian encoder and then one **i** letter for each integer that will be packed.

Pack Instruction Specification
------------------------------

**Pack Control Specifiers**

|Character|Description|
|:--------|:----------|
|\^|Switch to big endian encoding|
|_|Switch to little endian encoding|
|%|Switch to host (native) encoding|
|!|aligns the next data type to its natural boundary, for example for a double that would be 8 bytes, for a 32-bit int, that would be 4 bytes. For strings this is set to 4.|
|N|a number between 1 and 9, indicates a repeat count (process N items with the following datatype|
|[N]|For numbers larger than 9, use brackets, for example [20]|
|\*|Repeat the next data type until the arguments are exhausted|

**Pack Data Encoding**

||Description|
|:--|:----------|
|s|Int16|
|S|UInt16|
|i|Int32|
|I|UInt32|
|l|Int64|
|L|UInt64|
|f|float|
|d|double|
|b|byte|
|c|1-byte signed character|
|C|1-byte unsigned character|
|z8|string encoded as UTF8 with 1-byte null terminator|
|z6|string encoded as UTF16 with 2-byte null terminator|
|z7|string encoded as UTF7 with 1-byte null terminator|
|zb|string encoded as BigEndianUnicode with 2-byte null terminator|
|z3|string encoded as UTF32 with 4-byte null terminator|
|z4|string encoded as UTF32 big endian with 4-byte null terminator|
|\$8|string encoded as UTF8|
|\$6|string encoded as UTF16|
|\$7|string encoded as UTF7|
|\$b|string encoded as BigEndianUnicode|
|\$3|string encoded as UTF32|
|\$4|string encoded as UTF-32 big endian encoding|
|x|null byte|

While packing, if more packing instructions exist than data to be packed, the value packed is null.

Pack/Unpack Examples
--------------------

``` csharp
DataConverter.Pack ("CCCC", 65, 66, 67, 68)
// Result: 4-byte sequence for "ABCD"
 
DataConverter.Pack ("4C", 65, 66, 67, 68)
// Result: 4-byte sequence for "ABCD"
 
DataConverter.Pack ("4C", 65, 66, 67, 68, 69, 70)
// Result: 4-byte sequence for "ABCD"
 
DataConverter.Pack ("^ii", 0x1234abcd, 0x7fadb007)
// Result: 12 34 ab cd 7f ad b0 07
 
// Encode 3 integers as big-endian, but only provides two as arguments,
// this defaults to zero for the last value.
DataConverter.Pack ("^iii", 0x1234abcd, 0x7fadb007)
// Result: 12 34 ab cd 7f ad b0 07 00 00 00 00
 
// Encode as little endian, pack 1 short, align, 1 int
Dump (DataConverter.Pack ("_s!i", 0x7b, 0x12345678));
// Result: 7b 00 00 00 78 56 34 12
 
// Encode a string in utf-8 with a null terminator
Dump (DataConverter.Pack ("z8", "hello"))
// Result: 68 65 6c 6c 6f 00 00 00 00
 
// Little endian encoding, for Int16, followed by an aligned
// Int32
DataConverter.Pack ("_s!i", 0x7b, 0x12345678)
// Result: 7b 00 00 00 78 56 34 12
 
// Unpack a GUID:
IList l = DataConverter.Unpack ("_issbbbbbbbb", guid, 0);
// l [0] contains the 32 bit value
// l [1] contains the first 16 bit value
// l [2] contains the second 16 bit value
// l [3] contains the first 8 bit value
// and so on.
```

Static Methods
==============

**Note:** the static methods are not included by default, if you want to use them you must enable their compilation by defining the MONO_DATACONVERT_STATIC_METHODS define.

The methods to convert from arrays of bytes into native types take the following naming convention: **Type**From**Source**. Where **Type** is one of Double, Float, Int64, UInt64, Int32, UInt32, Int32, UInt32, Int16, UInt16 and **Source** is one of BE, LE or Memory.

The **Memory** variants will convert the byte array into the proper value, the byte array must have the values stored in the same order that the host expects it to be (this is similar to System.BitConverter).

The BE variants will convert from a byte array that contains data in big-endian format to a data type that is suitable for use in the current host.

The LE variants will convert from a byte array that contains data in little-endian format to a data type that is suitable for use in the current host.

``` csharp
        public static double DoubleFromBE     (byte [] data, int index);
        public static double DoubleFromLE     (byte [] data, int index);
        public static double DoubleFromMemory (byte [] data, int index);
        public static float  FloatFromBE      (byte [] data, int index);
        public static float  FloatFromLE      (byte [] data, int index);
        public static float  FloatFromMemory  (byte [] data, int index);
        public static short  Int16FromBE      (byte [] data, int index);
        public static short  Int16FromLE      (byte [] data, int index);
        public static short  Int16FromMemory  (byte [] data, int index);
        public static ushort UInt16FromBE     (byte [] data, int index);
        public static ushort UInt16FromLE     (byte [] data, int index);
        public static ushort UInt16FromMemory (byte [] data, int index);
        public static int    Int32FromBE      (byte [] data, int index);
        public static int    Int32FromLE      (byte [] data, int index);
        public static int    Int32FromMemory  (byte [] data, int index);
        public static uint   UInt32FromBE     (byte [] data, int index);
        public static uint   UInt32FromLE     (byte [] data, int index);
        public static uint   UInt32FromMemory (byte [] data, int index);
        public static long   Int64FromBE      (byte [] data, int index);
        public static long   Int64FromLE      (byte [] data, int index);
        public static long   Int64FromMemory  (byte [] data, int index);
        public static ulong  UInt64FromBE     (byte [] data, int index);
        public static ulong  UInt64FromLE     (byte [] data, int index);
        public static ulong  UInt64FromMemory (byte [] data, int index);
```

``` csharp
        // Encode to the host binary representation
    public static byte[] GetBytesNative (bool value)
    public static byte[] GetBytesNative (char value)
    public static byte[] GetBytesNative (short value)
    public static byte[] GetBytesNative (int value)
    public static byte[] GetBytesNative (long value)
    public static byte[] GetBytesNative (ushort value)
    public static byte[] GetBytesNative (uint value)
    public static byte[] GetBytesNative (ulong value)
    public static byte[] GetBytesNative (float value)
    public static byte[] GetBytesNative (double value)
 
        // To Little Endian
    public static byte[] GetBytesLE (bool value)
    public static byte[] GetBytesLE (char value)
    public static byte[] GetBytesLE (short value)
    public static byte[] GetBytesLE (int value)
    public static byte[] GetBytesLE (long value)
    public static byte[] GetBytesLE (ushort value)
    public static byte[] GetBytesLE (uint value)
    public static byte[] GetBytesLE (ulong value)
    public static byte[] GetBytesLE (float value)
    public static byte[] GetBytesLE (double value)
 
        // To Big Endian
    public static byte[] GetBytesBE (bool value)
    public static byte[] GetBytesBE (char value)
    public static byte[] GetBytesBE (short value)
    public static byte[] GetBytesBE (int value)
    public static byte[] GetBytesBE (long value)
    public static byte[] GetBytesBE (ushort value)
    public static byte[] GetBytesBE (uint value)
    public static byte[] GetBytesBE (ulong value)
    public static byte[] GetBytesBE (float value)
    public static byte[] GetBytesBE (double value)
```

Obtaining Mono.DataConvert
==========================

We encourage developers to use Mono.DataConvert in their applications by copying the source code file into their application.

The Mono.DataConvert class by default is internal, but you can change this by defining the DATACONVERTER_PUBLIC define when compiling the source code. Also, the static methods are not included by default.

**Compilation Options**:

**MONO_DATACONVERTER_PUBLIC**: if set, the class is made public instead of the default setting which is internal.

**MONO_DATACONVERTER_STATIC_METHODS**: if set, this includes the static methods in the build. By default they are not included.

At this point we do not have plans of shipping an independent assembly.

Download the source code from [[1]](https://github.com/mono/mono/raw/main/mcs/class/corlib/Mono/DataConverter.cs).

A full history of this file is available [here](https://github.com/mono/mono/commits/master/mcs/class/corlib/Mono/DataConverter.cs)

Problems with the CLI's System.BitConverter
===========================================

The System.BitConverter class in the .NET framework 1.0 used to be a class that merely did conversions to and from host types into byte arrays. This means that developers had to roll their own routines and check for the endianness of the host system.
