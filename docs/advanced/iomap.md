---
title: IOMap
redirect_from:
  - /MONO_IOMAP/
  - /IOMap/
---

One of the most common problems that people face when porting applications from Windows to Linux using Mono are paths.

The IOMap feature is available in Mono versions higher than 1.1.18, **but has been deprecated in Mono versions higher than 6.0.0**

## The Problem

Windows developers are used to a case-insensitive file system, which means that they might create a file called "mydata" in one place, and try to access it somewhere else as "MyData" or as "MYDATA". This breaks on most Unix setups because Unix is case sensitive\[1\].

Another problem is that developers sometimes hardcode the directory separator character in their source code ("\\") instead of using Path.DirectorySeparator and using Path.Combine for combining this paths. This is a problem because "\\" is a valid file name components on Unix. This means that if an application hardcodes for example "Logs\\access_log", in Unix this will not store the contents in the "Logs" directory as the file "access_log". Instead, it will store the results in a file called "Logs\\access_log".

Only a few applications cope with drive letters, but they might still pose a problem as the colon is a valid filename in Unix, which means that "A:\\file" is a valid filename in the current directory.

Although .NET provides the tools to write code that is portable, in practice, they do not use these features (the exception is Path.Combine, which some people use, as it is genuinely useful on its own).

## The Usual Solution

When moving applications from Windows to Linux, it is always necessary to run the application, run its test suite, and validate that the application works as intended. With the path problems described above, the process above included a number of iterations to fix the assumptions made by programmers about the file system.

This process could be time consuming, because identifying where the mistakes were made could take some time, the program might fail with FileNotFound exceptions (when referencing files that were not there), data would show up empty (listing contents of a directory that had nothing, as all the data went elsewhere) but it was doable.

This process works as long as you have the source code to all the components that you are porting, but if you were using a third-party library that you had no source code for, you would not be able to fix the problems.

## The New Solution

Mono now has a portability layer into Mono that will address those problems without requiring changes to your code. This will remove a large component of the porting cycle as a whole class of obnoxious problems are gone.

The new portability framework is enabled by setting the environment variable MONO_IOMAP (which we will likely rename to something shorter) to one of the following values:

-   case: makes all file system access case insensitive.
-   drive: strips drive name from pathnames.
-   all: enables both case and drive.

In addition, if any of those options are enabled, the directory separator mapping is also turned on. So this basically means that you have to type this, or include this in your script that launches your application:

``` bash
   $ export MONO_IOMAP=all
    $ mono myapp.exe
```

For ASP.NET applications hosted with mod_mono, you can add the following directive to your Apache configuration file:

``` bash
   MonoSetEnv MONO_IOMAP=all
```

This new feature appeared in Mono 1.1.18 and is available in all new Mono 1.2.x versions as well.

The downside is that Mono will have to do some extra work when coping with your file system, to search for case insensitive file names. So if your application is still a portable application, you will be much better off without this switch.

\[1\] Some Linux file systems are case insensitive, and some folks have used a combination of hacks, including doing loopback CIFS mounts to get case sensitivity issues out of the way; macOS does not have this particular problem, but it still has the others.

### IOMAP reporting utility

Mono 2.7 (trunk as of 21 Dec 2009, to become 2.8) includes a profiler module which aims at helping the developer/porter to find places in code which call .NET I/O routines passing them misformed file/directory paths as well as identify places where those strings are constructed.

The former part is very simple and it merely prints to the console a stack trace leading to the I/O routine call site every time file/directory name mapping is performed. The latter part, however, is a bit more problematic as it has to deal with two separate moments in string's life - its creation and its actual use. The code uses the Mono profiler API to monitor string allocations storing all the strings created in hash tables as well as remembering the stack frame which leads to the string creation site.

The code which does that is pretty fast, so it doesn't impact your application's performance too much even though it collects and stores a large amount of data (mostly pointers and some strings, though). When file name mapping is performed during file I/O, the profiler code looks up the string address and retrieves the stack trace to store it for later use. When the application exits a summary report is printed to the console which includes some statistics on the string, its original (requested) and target (mapped) form as well as a location (if it was possible to determine it) where the string was created. The location is determined using simple heuristics, so it might sometimes point to a location which is near the place where the string was created. The heuristics code walks the stack frames looking for first frame which is in application code - that is it ignores the well-known class library assemblies shipped with Mono (corlib, System\*, some Mono\* assemblies etc) and all the assemblies installed in the GAC. The first frame which doesn't belong in either of the above is considered to be user's code and is reported to be the string allocation location. If the stack trace doesn't contain any such frames, full trace is recorded and shown in the summary.

It is advisable to compile your application with full debugging information, so that source files and line numbers can be reported (otherwise only Namespace.Class.Method will be printed). To enable the utility, make sure the MONO_IOMAP environment variable is present and set to 'all', 'case' or 'drive' and execute your application as follows:

``` bash
   mono --debug --profile=iomap your_application.exe
```

If you're porting an ASP.NET application, use the following command line:

``` bash
   MONO_OPTIONS="--debug --profile=iomap" xsp2
```
