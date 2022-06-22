---
title: UriKind.RelativeOrAbsolute workaround
---

In .NET `new Uri ("/foo", UriKind.RelativeOrAbsolute)` returns a
relative Uri whereas Mono assumes it is an absolute file path.

Mono diverges from .NET because UNIX
 file paths starting with '/' are absolute file paths.

Changing the behavior to match the .NET one is not possible without breaking existing Mono applications that rely on `UriKind.RelativeOrAbsolute` to parse absolute file paths.
Thus we propose some workarounds.

### Local workarounds (recommended)

#### Manual check for rooted path

The current workaround that can be used consists on using `UriKind.Relative` instead of `UriKind.RelativeOrAbsolute` when the uri starts with '/'.

``` csharp
var uri = new Uri (str, str?.StartsWith ("/") == true ? UriKind.Relative : UriKind.RelativeOrAbsolute);
```

#### Using Mono specific extension value (available since Mono 4.2)

The workaround consists in using Mono specific `300` value instead of `UriKind.RelativeOrAbsolute`.

This approach will work on Mono only and will throw `System.ArgumentException` on .NET due to undefined value. Therefore we recommend to define `DotNetRelativeOrAbsolute` as following

``` csharp
static readonly UriKind DotNetRelativeOrAbsolute = Type.GetType ("Mono.Runtime") == null ? UriKind.RelativeOrAbsolute : (UriKind) 300;
```

Problematic usages of UriKind.RelativeOrAbsolute which should always resolve as relative path

``` csharp
var uri = new Uri (str, UriKind.RelativeOrAbsolute);
```

can then be fixed by using `DotNetRelativeOrAbsolute` value instead

``` csharp
var uri = new Uri (str, DotNetRelativeOrAbsolute);
```

#### Global workarounds

It is possible to change all `uri = new Uri (str, UriKind.RelativeOrAbsolute)` references in your app and libraries to match .NET behaviour.

This approach should be used with care as it changes all code like `new Uri ("/foo", UriKind.RelativeOrAbsolute)` to be relative even in 3rd party libraries which could depend on this behaviour.

#### Using Environment variable (available since Mono 4.2)

``` bash
MONO_URI_DOTNETRELATIVEORABSOLUTE=true mono app.exe
```

#### Using Reflection (available since Mono 4.2)

``` csharp
if (Type.GetType ("Mono.Runtime") != null) {
    var field = typeof (Uri).GetField ("useDotNetRelativeOrAbsolute",
        BindingFlags.Static | BindingFlags.GetField | BindingFlags.NonPublic);
    field?.SetValue (null, true);
}
```
