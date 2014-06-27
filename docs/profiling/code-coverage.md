---
layout: docpage
navgroup: docs
title: Code Coverage
---

Code Coverage can be used to track how many of the code paths that your program is using are actually exercised.

For more information see [Profile]({{site.github.url}}/old_site/Profile "Profile").

MonoCov
=======

MonoCov is made up of two components: a code coverage module, and a GUI interface for doing code coverage. This is available as part of the package "monocov" (available [here](http://github.com/mono/monocov)).

To use it, run your program like this:

``` bash
   mono --debug --profile=monocov program.exe
```

The coverage information will be output to the program.exe.cov file. Now you can load this file in the GUI with:

``` bash
   monocov program.exe.cov
```

and browse the namespaces for interesting types you want to check code coverage for. Double clicking on a method will bring up a viewer with the source file of the method with the lines of code not reached by execution highlighted in red.

To limit the collection of data to a specific assembly you can specify it as an argument to the profiler. For example, to consider only the code in mscorlib, use:

``` bash
   mono --debug --profile=monocov:+[mscorlib] test-suite.exe
```

To be able to easily collect coverage information from the unit tests in the mono mcs directory you can also run the test suite as follows, for example in mcs/class/corlib:

``` bash
   make run-test RUNTIME_FLAGS="--profile=monocov:outfile=corlib.cov,+[mscorlib]"
```

To use similar options while running unit tests directly with nunit-console2, specify MONO\_OPTIONS as follows:

``` bash
   MONO_OPTIONS="--profile=monocov:+[MyAssembly]" nunit-console2 MyTestAssembly.dll
```

Monocov can also generate a set of HTML pages that display the coverage data. [Here](http://primates.ximian.com/~lupus/corlib-cov/project.html) are the files generated when running the nunit-based test suite for mono's mscorlib with the following command:

``` bash
    monocov --export-html=/tmp/corlib-cov corlib.cov
```

Hopefully this tool will help both new and old contributors to easily find untested spots in our libraries and contribute tests for them.

Built-in Code Coverage
======================

The built-in code coverage module is fairly limited

Mono ships with a code coverage module. This module is activated by using the Mono --profile=cov option. The format is:

    --profile=cov[:assembly-name[/namespace]] test-suite.exe

 By default code coverage will default to all the assemblies loaded, you can limit this by specifying the assembly name, for example to perform code coverage in the routines of your program use, for example the following command line limits the code coverage to routines in the "demo" assembly:

``` bash
        mono --profile=cov:demo demo.exe
```

Notice that the assembly-name does not include the extension.

You can further restrict the code coverage output by specifying a namespace:

``` bash
        mono --profile=cov:demo/My.Utilities demo.exe
```

Which will only perform code coverage in the given assembly and namespace.

Typical output looks like this:

           Not covered: Class:.ctor ()
           Not covered: Class:A ()
           Not covered: Driver:.ctor ()
           Not covered: Driver:method ()
           Partial coverage: Driver:Main ()
                   offset 0x000a

The offsets displayed are IL offsets.
