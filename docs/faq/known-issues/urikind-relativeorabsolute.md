---
title: UriKind.RelativeOrAbsolute workaround
---

In .NET `new Uri ("/foo", UriKind.RelativeOrAbsolute)` returns a
relative Uri whereas Mono assumes it is an absolute file path.

Mono diverges from .NET because UNIX
 file paths starting with '/' are absolute file paths.
 
Changing the behavior to match the .NET one is not possible without breaking existing Mono applications that rely on `UriKind.RelativeOrAbsolute` to parse absolute file paths.
Thus we propose some workarounds.

### Current workaround

The current workaround that can be used consists on using `UriKind.Relative` instead of `UriKind.RelativeOrAbsolute` when the uri starts with '/'.

``` csharp
var uri = new Uri (str,(str.StartsWith ("/"))? UriKind.Relative : UriKind.RelativeOrAbsolute)
```

### Mono 4.2 workarounds (to be released)

#### Localized workaround
This workaround consists in defining DotNetRelativeOrAbsolute and using
it instead of UriKind.RelativeOrAbsolute.

DotNetRelativeOrAbsolute should be defined as follows:

``` csharp
static UriKind DotNetRelativeOrAbsolute = (Type.GetType ("Mono.Runtime") == null)? UriKind.RelativeOrAbsolute : (UriKind) 300;
```

Problematic usages of UriKind.RelativeOrAbsolute such as:
``` csharp
var uri = new Uri (str,UriKind.RelativeOrAbsolute)
```
can then be fixed by replacing them with:
``` csharp
var uri = new Uri (str,DotNetRelativeOrAbsolute)
```

#### Global workarounds
It is also possible to change all `uri = new Uri (str,UriKind.RelativeOrAbsolute)` in your app and libraries to behave like in .NET.

**Warning:** The following workarounds fix libraries that are expecting `new Uri ("/foo", UriKind.RelativeOrAbsolute)` to be relative but they will also introduce issues to the libraries that are expecting the uri to be an absolute file path.

**Environment variable workaround:**
```
MONO_URI_DOTNETRELATIVEORABSOLUTE=true mono app.exe
```

**Reflection workaround:**
``` csharp
if (Type.GetType ("Mono.Runtime") != null) {
    var field = typeof (Uri).GetField ("useDotNetRelativeOrAbsolute",
        BindingFlags.Static | BindingFlags.GetField | BindingFlags.NonPublic);
    if (field)
        field.SetValue (null, true);
}
```

