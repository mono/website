---
title: Creating self-contained applications with MKBundle
---

Mono can turn .NET applications (executable code and its dependencies) into self-contained
executables that do not rely on Mono being installed on the system to simplify deployment
of.NET Applications.

This is done with the `mkbundle` tool, a cross-compiler tool which produces a native executable
for any of the Mono supported platforms from an initial assembly entry point, its .NET dependencies 
and any additional assemblies that your application requires.

# Walkthrough

Imagine that you have a .NET application say, `CacheServer.exe` that you want to distribute
to various operating systems without requiring the Mono runtime to be installed there.   Your
application also has some dependencies like `Ssh.dll`.

You would bundle the application like this:

```bash
$ mkbundle -o CacheServer --simple CacheServer.exe --machine-config /etc/mono/4.5/machine.config
Using runtime: /Library/Frameworks/Mono.framework/Versions/5.8.0/bin/mono
     Assembly: /private/tmp/CacheServer.exe
     Assembly: /private/tmp/Ssh.dll
     Assembly: /Library/Frameworks/Mono.framework/Versions/5.8.0/lib/mono/4.5/mscorlib.dll
     Assembly: /Library/Frameworks/Mono.framework/Versions/5.8.0/lib/mono/4.5/System.Core.dll
     Assembly: /Library/Frameworks/Mono.framework/Versions/5.8.0/lib/mono/4.5/System.dll
     Assembly: /Library/Frameworks/Mono.framework/Versions/5.8.0/lib/mono/4.5/Mono.Security.dll
     Assembly: /Library/Frameworks/Mono.framework/Versions/5.8.0/lib/mono/4.5/System.Configuration.dll
     Assembly: /Library/Frameworks/Mono.framework/Versions/5.8.0/lib/mono/4.5/System.Xml.dll
     Assembly: /Library/Frameworks/Mono.framework/Versions/5.8.0/lib/mono/4.5/System.Security.dll
     Assembly: /Library/Frameworks/Mono.framework/Versions/5.8.0/lib/mono/4.5/Mono.Posix.dll
     Assembly: /Library/Frameworks/Mono.framework/Versions/5.8.0/lib/mono/4.5/I18N.West.dll
     Assembly: /Library/Frameworks/Mono.framework/Versions/5.8.0/lib/mono/4.5/I18N.dll
machineconfig: /etc/mono/4.5/machine.config
Generated CacheServer
```

The above will generate a native executable that has no dependencies on Mono being 
installed on the system and is a native executable:

```bash
$ ls -l CacheServer
-rwxr-xr-x  1 miguel  wheel  16056828 Jan 26 10:23 CacheServer
$ file CacheServer
CacheServer: Mach-O 64-bit executable x86_64
```

This is excellent, we now have an x86-64 binary for MacOS available.   But what
if you wanted to cross-compile the result for another platform, say Ubuntu 
running on AMD64 or the Raspberri Pi?

First, let us check if we have the necessary runtime installed in our machine:

```bash
$ mkbundle --list-targets
	default	- Current System Mono
	4.8.0-linux-libc2.12-amd64.zip
```

It looks like we do not, so we are going to need to get it.

We maintain a collection of Mono runtimes for various platforms that you can 
bundle, to get this list, run:

```bash
$ mkbundle --list-targets
mono-5.8.0-debian-7-arm
[ ... removed lines for brevity ... ]
mono-5.8.0-raspbian-9-arm
mono-5.8.0-ubuntu-16.04-arm64
mono-5.8.0-ubuntu-16.04-x64
mono-5.8.0-ubuntu-16.04-x86
```

On the list above, you would pick the Mono runtime version that you desire,
in our case we want to use `mono-5.8.0-ubuntu-16.04-x64`

So download those cross compiler tools with the `--fetch-target` option:

```bash
$ mkbundle --fetch-target mono-5.8.0-ubuntu-16.04-x64
$
```

The quite response means that the tool succeeded.   Unix tools do not like to 
chat a lot, and `mkbundle` is not about to break this tradition.

Let us check that we have it installed:

```bash
$ mkbundle --local-targets
Available targets locally:
	default	- Current System Mono
	4.8.0-linux-libc2.12-amd64.zip
	mono-5.8.0-ubuntu-16.04-x64
```

Now, cross compile the result, change the invocation of `mkbundle` to use the
`--cross` command line option, it takes as a parameter the name of the target
from above, in our case `mono-5.8.0-ubuntu-16.04-x64`

```bash
$ mkbundle -o CacheServer --cross mono-5.8.0-ubuntu-16.04-x64 CacheServer.exe --machine-config /etc/mono/4.5/machine.config
From: /Users/miguel/.mono/targets/mono-5.8.0-ubuntu-16.04-x64
Using runtime: /Users/miguel/.mono/targets/mono-5.8.0-ubuntu-16.04-x64/bin/mono
     Assembly: /private/tmp/CacheServer.exe
     Assembly: /private/tmp/Ssh.dll
     Assembly: /Users/miguel/.mono/targets/mono-5.8.0-ubuntu-16.04-x64/lib/mono/4.5/mscorlib.dll
     Assembly: /Users/miguel/.mono/targets/mono-5.8.0-ubuntu-16.04-x64/lib/mono/4.5/System.Core.dll
     Assembly: /Users/miguel/.mono/targets/mono-5.8.0-ubuntu-16.04-x64/lib/mono/4.5/System.dll
     Assembly: /Users/miguel/.mono/targets/mono-5.8.0-ubuntu-16.04-x64/lib/mono/4.5/Mono.Security.dll
     Assembly: /Users/miguel/.mono/targets/mono-5.8.0-ubuntu-16.04-x64/lib/mono/4.5/System.Configuration.dll
     Assembly: /Users/miguel/.mono/targets/mono-5.8.0-ubuntu-16.04-x64/lib/mono/4.5/System.Xml.dll
     Assembly: /Users/miguel/.mono/targets/mono-5.8.0-ubuntu-16.04-x64/lib/mono/4.5/System.Security.dll
     Assembly: /Users/miguel/.mono/targets/mono-5.8.0-ubuntu-16.04-x64/lib/mono/4.5/Mono.Posix.dll
     Assembly: /Users/miguel/.mono/targets/mono-5.8.0-ubuntu-16.04-x64/lib/mono/4.5/I18N.West.dll
     Assembly: /Users/miguel/.mono/targets/mono-5.8.0-ubuntu-16.04-x64/lib/mono/4.5/I18N.dll
machineconfig: /etc/mono/4.5/machine.config
Generated CacheServer
```

That was easy, let us check the results:
```
$ ls -l CacheServer
-rwxr-xr-x  1 miguel  wheel  15790588 Jan 26 10:36 CacheServer
$ file CacheServer
CacheServer: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, BuildID[sha1]=d72d30588d0ecef88a2214d6d4dc3c91c5b4db20, stripped
```

We have an Ubuntu executable.   Now, all we need to do is to copy the resulting
`CacheServer` executable to our Linux machine and we are in business.   No additional
dependencies need to be installed.

# Configuring Your Executable

Some users configure the command line options, and the environment variables that 
impact the Mono runtime at execution time.   You can bake those options into your
executable via a couple of configuration options.

For this, you use the `--options` flag.  For example,
the following disables inlining, by passing  the  "-O=-inline"  command
line option to the embedded executable:

```bash
$ mkbundle -o CacheServer --options -O=-inline --simple CacheServer.exe --machine-config /etc/mono/4.5/machine.config
```

Or say that you want to bake into the executable an environment variable,
`CACHE_SERVER_PORT` set to 9000, you would use the `--env` option like this:

```bash
$ mkbundle -o CacheServer --env CACHE_SERVERPORT=9000 --simple CacheServer.exe --machine-config /etc/mono/4.5/machine.config
```

You can also customize the .NET runtime configuration file `machine.config` that is used by passing a different 
path to the `--machine-config` file.

Mono also supports a global mapping tool to drive how dynamic libraries are resolved (described in more
detail on the `mono-config(5)` man page), you can specify your custom mapping file by using the 
`--config` command line option.

# Distributing Native Libraries

Sometimes your application will need more than pure managed libraries, you will want to distribute 
native shared libraries - those consumed by P/Invoke (`DllImport` libraries).   To bundle those into your
application use the `--library` option, like this:

```bash
$ mkbundle -o CacheServer --simple CacheServer.exe --library fastdecoder,/usr/lib/libfastdecoder.so --machine-config /etc/mono/4.5/machine.config
```

What the above command does it register the P/Invoke target "fastdecoder", which in your source code
would look like this:

```csharp
[DllImport ("fastdecoder")]
extern static void fastdecoder_init ();
```

To reference the specified file, in this case `/usr/lib/libfastdecoder.so`. It does so by including a _renamed_ copy of libfastdecoder.so to match the P/Invoke signature (avoiding the need for a DllMap). This does not account for inclusion of multiple libraries with linker dependencies on each other - for example, if you P/Invoke `fastdecoder` and `fastencoder`, and `libfastencoder.so` has a linker dependency on `libfastdecoder.so`, then multiple calls to `--library` as in the above example will not work. Instead, you need to use simple `--library` calls, and include a DllMap via `--config`. For example:

```xml
<configuration>
  <dllmap dll="fastdecoder" target="libfastdecoder.so"/>
  <dllmap dll="fastencoder" target="libfastencoder.so"/>
</configuration>
```

```bash
$ mkbundle -o CacheServer --simple CacheServer.exe --library /usr/lib/libfastdecoder.so --library /usr/lib/libfastencoder.so --machine-config /etc/mono/4.5/machine.config --config mydllmap.config
```

At its most extreme, this would allow you to bundle an entire GUI framework and its dependencies, to make a bundled application which works on a machine with zero useful dependencies pre-assumed:

```xml
<configuration>
  <dllmap dll="libglib-2.0-0.dll" target="libglib-2.0.so.0"/>
  <dllmap dll="libgobject-2.0-0.dll" target="libgobject-2.0.so.0"/>
  <dllmap dll="libatk-1.0-0.dll" target="libatk-1.0.so.0"/>
  <dllmap dll="libgtk-win32-2.0-0.dll" target="libgtk-x11-2.0.so.0"/>
  <dllmap dll="libgdk-win32-2.0-0.dll" target="libgdk-x11-2.0.so.0"/>
  <dllmap dll="gtksharpglue-2" target="libgtksharpglue-2.so"/>
  <dllmap dll="glibsharpglue-2" target="libglibsharpglue-2.so"/>
  <dllmap dll="libc" target="libc.so.6"/>
  <dllmap dll="libintl" target="libc.so.6"/>
  <dllmap dll="i:libxslt.dll" target="libxslt.so" os="!windows"/>
  <dllmap dll="i:odbc32.dll" target="libodbc.so" os="!windows"/>
  <dllmap dll="i:odbc32.dll" target="libiodbc.dylib" os="osx"/>
  <dllmap dll="oci" target="libclntsh.so" os="!windows"/>
  <dllmap dll="db2cli" target="libdb2_36.so" os="!windows"/>
  <dllmap dll="MonoPosixHelper" target="libMonoPosixHelper.so"/>
  <dllmap dll="libmono-btls-shared" target="libmono-btls-shared.so"/>
  <dllmap dll="i:msvcrt" target="libc.so.6" os="!windows"/>
  <dllmap dll="i:msvcrt.dll" target="libc.so.6" os="!windows"/>
  <dllmap dll="sqlite" target="libsqlite.so.0" os="!windows"/>
  <dllmap dll="sqlite3" target="libsqlite3.so.0" os="!windows"/>
  <dllmap dll="libX11" target="libX11.so.6" os="!windows" />
  <dllmap dll="libgdk-x11-2.0" target="libgdk-x11-2.0.so.0" os="!windows"/>
  <dllmap dll="libgdk_pixbuf-2.0" target="libgdk_pixbuf-2.0.so.0" os="!windows"/>
  <dllmap dll="libgtk-x11-2.0" target="libgtk-x11-2.0.so.0" os="!windows"/>
  <dllmap dll="libglib-2.0" target="libglib-2.0.so.0" os="!windows"/>
  <dllmap dll="libgobject-2.0" target="libgobject-2.0.so.0" os="!windows"/>
  <dllmap dll="libgnomeui-2" target="libgnomeui-2.so.0" os="!windows"/>
  <dllmap dll="librsvg-2" target="librsvg-2.so.2" os="!windows"/>
  <dllmap dll="libXinerama" target="libXinerama.so.1" os="!windows" />
  <dllmap dll="libasound" target="libasound.so.2" os="!windows" />
  <dllmap dll="libcairo-2.dll" target="libcairo.so.2" os="!windows"/>
  <dllmap dll="libcairo-2.dll" target="libcairo.2.dylib" os="osx"/>
  <dllmap dll="libcups" target="libcups.so.2" os="!windows"/>
  <dllmap dll="libcups" target="libcups.dylib" os="osx"/>
  <dllmap dll="i:kernel32.dll">
    <dllentry dll="__Internal" name="CopyMemory" target="mono_win32_compat_CopyMemory"/>
    <dllentry dll="__Internal" name="FillMemory" target="mono_win32_compat_FillMemory"/>
    <dllentry dll="__Internal" name="MoveMemory" target="mono_win32_compat_MoveMemory"/>
    <dllentry dll="__Internal" name="ZeroMemory" target="mono_win32_compat_ZeroMemory"/>
  </dllmap>
  <dllmap dll="gdiplus" target="libgdiplus.so.0" os="!windows"/>
  <dllmap dll="gdiplus.dll" target="libgdiplus.so.0"  os="!windows"/>
  <dllmap dll="gdi32" target="libgdiplus.so.0" os="!windows"/>
  <dllmap dll="gdi32.dll" target="libgdiplus.so.0" os="!windows"/>
</configuration>
```

```bash
mkbundle -o gtktest --simple gtktest.exe --library /lib/x86_64-linux-gnu/libglib-2.0.so.0 --library /usr/lib/x86_64-linux-gnu/libffi.so.6 --library /usr/lib/x86_64-linux-gnu/libgobject-2.0.so.0 --library /usr/lib/x86_64-linux-gnu/libdatrie.so.1 --library /usr/lib/x86_64-linux-gnu/libthai.so.0 --library /usr/lib/x86_64-linux-gnu/libpango-1.0.so.0 --library /usr/lib/x86_64-linux-gnu/libatk-1.0.so.0 --library /usr/lib/x86_64-linux-gnu/libpixman-1.so.0 --library /lib/x86_64-linux-gnu/libz.so.1 --library /usr/lib/x86_64-linux-gnu/libpng16.so.16 --library /usr/lib/x86_64-linux-gnu/libfreetype.so.6 --library /lib/x86_64-linux-gnu/libexpat.so.1 --library /usr/lib/x86_64-linux-gnu/libfontconfig.so.1 --library /usr/lib/x86_64-linux-gnu/libXau.so.6 --library /lib/x86_64-linux-gnu/libbsd.so.0 --library /usr/lib/x86_64-linux-gnu/libXdmcp.so.6 --library /usr/lib/x86_64-linux-gnu/libxcb.so.1 --library /usr/lib/x86_64-linux-gnu/libxcb-shm.so.0 --library /usr/lib/x86_64-linux-gnu/libxcb-render.so.0 --library /usr/lib/x86_64-linux-gnu/libX11.so.6 --library /usr/lib/x86_64-linux-gnu/libXrender.so.1 --library /usr/lib/x86_64-linux-gnu/libXext.so.6 --library /usr/lib/x86_64-linux-gnu/libcairo.so.2 --library /usr/lib/x86_64-linux-gnu/libgraphite2.so.3 --library /usr/lib/x86_64-linux-gnu/libharfbuzz.so.0 --library /usr/lib/x86_64-linux-gnu/libpangoft2-1.0.so.0 --library /usr/lib/x86_64-linux-gnu/libpangocairo-1.0.so.0 --library /usr/lib/x86_64-linux-gnu/libgmodule-2.0.so.0 --library /usr/lib/x86_64-linux-gnu/libgio-2.0.so.0 --library /usr/lib/x86_64-linux-gnu/libgdk_pixbuf-2.0.so.0 --library /usr/lib/x86_64-linux-gnu/libXinerama.so.1 --library /usr/lib/x86_64-linux-gnu/libXi.so.6 --library /usr/lib/x86_64-linux-gnu/libXrandr.so.2 --library /usr/lib/x86_64-linux-gnu/libXfixes.so.3 --library /usr/lib/x86_64-linux-gnu/libXcursor.so.1 --library /usr/lib/x86_64-linux-gnu/libXcomposite.so.1 --library /usr/lib/x86_64-linux-gnu/libXdamage.so.1 --library /usr/lib/x86_64-linux-gnu/libgdk-x11-2.0.so.0 --library /usr/lib/x86_64-linux-gnu/libgtk-x11-2.0.so.0 --library /usr/lib/cli/gtk-sharp-2.0/libgtksharpglue-2.so  --library /usr/lib/cli/glib-sharp-2.0/libglibsharpglue-2.so --library /usr/lib/libMonoPosixHelper.so --machine-config /etc/mono/4.5/machine.config --config custom.config 
```

How far overboard you feel the need to go with bundled libraries is largely down to your specific target environment. Most of the custom config comes from /etc/mono/config, which contains entries needed by Gtk# (and you can only specify a single `--config` entry)

# Advanced Scenarios

The `mkbundle` tool supports other options that are not covered in this page, 
like using your own local server for runtimes, C compiler-driven embedding and 
more.  Those are covered in the `mkbundle(1)` man page, please refer to it for
more details.
