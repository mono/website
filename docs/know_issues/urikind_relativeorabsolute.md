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

### Mono 4.2 workaround (to be released)

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
