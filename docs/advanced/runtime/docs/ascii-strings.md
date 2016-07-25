---
title: ASCII Mono
---

## Introduction

This is a proposal for an optimisation to `System.String`.

For historical reasons, `System.String` uses the UCS-2 character encoding, that is, UTF-16 without surrogate pairs.

However, most strings in typical .NET applications consist solely of ASCII characters, leading to wasted space: half of the bytes in a string are likely to be null bytes!

Since strings are immutable, we can scan the character data when the string is constructed, then dynamically select an encoding, thereby saving 50% of string memory in most cases.

## Updating `String`

Strings currently have the following representation:

```
class String {
    int length;
    char firstChar;
}
```

Where `&firstChar` is the starting address of the co-allocated string data. First we can observe that the `length` field is a *signed* 32-bit integer (`System.Int32`). Changing this to an *unsigned* integer (`System.UInt32`) gives us a free bit, which we can use to tell whether the string is normal (UCS-2) or *compact* (ASCII):

```
class String {
    uint taggedLength;
    byte firstByte;
}
```

Here, `(taggedLength & 1) == 0` indicates the non-compact encoding, for which `(char*)&firstByte` is the start of the UCS-2 character data; `(taggedLength & 1) == 1` indicates the compact encoding, for which the ASCII character data starts at `(byte*)&firstByte`.

I use the low-order bit instead of the sign bit because it lets us get the length with a simple shift, regardless of encoding:

```
public int Length {
    get {
        return (int)(taggedLength >> 1);
    }
}
```

## Updating Native Code

Many places in Mono unsafely access `String` data, but they can be updated fairly easily: we can rename the fields, and use accessors that assert that a particular encoding is in use. However, we must be careful to verify that all those paths are covered by the test suite.

## Disabling `fixed` on Strings

Now, every managed method that unsafely accesses `String` character data must be updated to account for whether the `String` is compact. This is tractable within `corlib`, but there is some third-party code that uses strings unsafely.

The `fixed` statement on strings calls a method `get_OffsetToStringData`, which is used to adjust the `fixed` pointer to refer to the character data, rather than the `String` object. In ASCII Mono, we can make this method throw a `NotSupportedException` with a message like

> Unsafe access to string data is not supported by this runtime.

Now we’re sure that only `corlib`-internal methods can access the `String` data, because only those methods have access to the `firstByte` field.

## Adding `UnsafeApply` API

In order to update existing third-party code that uses strings unsafely, we need some kind of `UnsafeApply` API:

```
public unsafe T UnsafeApply<T>
    (Func<BytePtr, T> compact, Func<CharPtr, T> noncompact)
```

This accepts two callbacks, one for the case of the compact encoding, and one for the non-compact encoding. This isn’t ideal, because it’s neither safe nor particularly efficient (involving the allocation of delegates). But, on the bright side, that may discourage people from continuing to use unsafe code.

## Adding `Iterator` API

In order to simplify updating existing `corlib` code, we add a private `Iterator` API that allows iterating over `String` data regardless of encoding, so we can efficiently avoid duplicating the code for `char*` and `byte*`.

The `String.Iterator` interface would provide methods such as:

 * `Iterator Advance (int offset = 1)`
 * `void CopyFrom (Iterator that, int count)`
 * `long Difference (Iterator that)`
 * `char Get (int index = 0)`
 * `void Set (char value, int index = 0)`
 * `int CharSize ()`
 * `IntPtr Pointer ()`

And have two concrete implementations, `CompactIterator` and `NonCompactIterator`, returned by a new `String` method `GetIterator` like so:

```
private static unsafe Iterator GetIterator (IntPtr data, bool compact)
{
    if (compact)
        return new CompactIterator (data);
    return new NonCompactIterator (data);
}
```

This requires the character data pointer be pinned from the outside. This ensures that it’s pinned for the lifetime of the iterator, and that only `corlib` can use this API.

Phrasing the API in this way should let the JIT inline operations on concrete iterator types.

## Updating `StringBuilder`

`StringBuilder` is a linked list of mutable character arrays that can be frozen into a single `String` using the `ToString` method.

We add an additional Boolean to each chunk, indicating whether it’s compact (the default) or non-compact. When inserting non-ASCII characters into an ASCII chunk, the chunk degrades to UCS-2.

If all chunks of a `StringBuilder` are compact, as they are most of the time, then the result of `ToString` is compact.

## Scanning Character Data

At first blush it may seem very costly to scan every string. However, each string should only be scanned at most once, and the longer the string, the bigger the memory savings when it (probably) turns out to be compact-representable.

Moreover, we can avoid scanning strings if we know ahead of time what the encoding should be; for example, concatenating two compact strings always yields a compact string.

Scanning UCS-2 data for compact-representability is as simple as testing every character with the mask `(c & 0xFF80) == 0`, which is trivially unrollable and vectorizable. Likewise, we can scan UTF-8 data with the mask `(c & 0x80) == 0`.

## Real-world Testing

I’ve implemented a fairly stable prototype of this feature in Mono. It includes the stated changes to `String` and `StringBuilder`, as well as a fast vectorized scanner. It can build `corlib` and run the Mono and `corlib` test suites. With some effort, and patches to third-party libraries, it can run Xamarin Studio. For a large project using Roslyn code analysis, this leads to a ~10% savings in memory usage, with a small speed overhead.

## Next Steps

 * Deduplicate code by using the iterator API.
 * Avoid allocating intermediate `char[]` arrays by using the iterator API.
 * Upstream changes to third-party libraries.
 * Get feedback and harden code for correctness, safety, and security.
