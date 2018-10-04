---
title: Test Suite
redirect_from:
  - /Test_Suite/
  - /Testing/
---

Testing
-------

Testing is an important part of the Mono project: every one of its three major components has a test suite tailored for its needs. This is very helpful, because in the course of developing the software it is very common to introduce bugs in existing code. A test suite helps us fix the bugs as soon as they are introduced.

There are various kinds of tests in Mono:

-   **Class Library Unit Tests:** These are used to test the class libraries.

-   **Compiler tests**: Both tests that should pass and tests that should fail are included.

-   **Runtime tests**: Tests for the virtual machine.

-   **Web Services tests**: Web Services client/server tests.

The latest test results are available at [https://jenkins.mono-project.com/](https://jenkins.mono-project.com/) for all major platform run continuously after every commit.

Class Library tests
-------------------

All classes in Mono libraries should have comprehensive unit test suites to go with them. Unit testing is a software engineering methodology that makes it easier to build correct code. Every method in every class should have a set of tests to verify that they work correctly. Mono also needs a testing framework to make it easy to write and run lots of tests.

In some classes, we might also provide standalone tests because of some reasons such as too huge testcases, another downloading and so on. (For example, managed XSLT has a standalone test which downloads and expands several megabytes of the OASIS test suite.)

### Running NUnit/xunit Class Library Tests

To run the NUnit class library tests for a particular class library, go into the directory for the class library, and run make with the `run-test` argument. For example, to run the mscorlib tests do this:

``` bash
cd mcs/class/corlib
make run-test
```

This will run the mscorlib NUnit tests.

To run the xunit class library tests do this:

``` bash
make run-xunit-test
```

If you want to run a single fixture, you can use the convenience parameter FIXTURE like this:

``` bash
cd mcs/class/corlib
make run-test FIXTURE=MonoTests.System.DecimalTest
```

That will run the fixture for MonoTests.System.DecimalTest.

You can pass arbitrary command line options to nunit-console, like this:

``` bash
cd mcs/class/corlib
make run-test TEST_HARNESS_FLAGS=-fixture=MonoTests.System.DateTimeTest
```

If you think you're getting failures related to l10n/i18n of your system, run them with the default language setting:

``` bash
cd mcs/class/corlib
LANG=en make run-test
```

### Other Class Library Tests

In addition to unit tests, some class libraries have standalone tests that can be used to exercise specific features.

Here I list them up as long as I know. If you are going to add another standalone tests, please add one line here. It is also recommended that you add some notes on how to build and run tests.

-   Mono.Data/test/

-   System.Data/Test, and some individual ADO.NET libraries:

there are some standalone tests. See the bottom of [ADO.NET page](/docs/database-access/adonet/) for detail.

-   System.Web/Test/TestMonoWeb : see README

-   System.Web.Services/Test/standalone : see README

-   System.Windows.Forms/SWFTest/

-   System.XML/Test/System.Xml/standalone_tests : see README

-   System.XML/Test/System.Xml.Schema/standalone_tests : see README

-   System.XML/System.Xml.Serialization/standalone_tests/

-   System.XML/Test/System.Xml.Xsl/standalone_tests : see README

-   Commons.Xml.Relaxng/Test/standalone_tests : see README

**Getting started**

If you are new to writing NUnit tests, there is a template you may use to help get started. The file is:

[**mcs/class/doc/TemplateTest.cs**](https://github.com/mono/mono/blob/master/mcs/class/doc/TemplateTest.cs)

Save a copy of this file in the appropriate test sub-directory (see below), and replace all the {text} markers with appropriate code. Comments in the template are there to guide you. You should also look at existing tests to see how other people have written them. [StringTest.cs](https://github.com/mono/mono/blob/master/mcs/class/corlib/Test/System/StringTest.cs) is a good example that might help you get started.

The directory that will contain your new file depends on the assembly/namespace of the class for which you are creating the tests. Under mcs/class there is a directory for each assembly. In each assembly there is a Test directory, e.g. mcs/class/corlib/Test. In the Test directory there are sub-directories for each namespace in the assembly, e.g. mcs/class/corlib/Test/Sytem. Put your new test file in the appropriate sub-directory under Test for the class you are testing.

Once all of that is done, you can do a 'make test' from the top mcs directory. Your test class needs also to be listed in the .sources file at the top of the Test directory.

Tips on writing Unit tests
--------------------------

You should look at the [NUnit documentation](https://nunit.org), as it is a fantastic product, and includes fantastic documentation, but here are some tips for those of you who are already reading this web page.

### Provide an unique error message for Assert()

Include an unique message for each Assert() so that when the assert fails, it is trivial to locate it in the source. Otherwise, it may be difficult to determine which part of the test is failing. A good way to ensure unique messages is to use something like #A01, #A02 etc.

Ok:

     Assert.AreEqual(compare[0], i1[0], "array match");
     Assert.AreEqual(compare[1], i1[1], "array match");
     Assert.AreEqual(compare[2], i1[2], "array match");
     Assert.AreEqual(compare[3], i1[3], "array match");

Excellent:

     Assert.AreEqual(compare[0], i1[0], "#A01");
     Assert.AreEqual(compare[1], i1[1], "#A02");
     Assert.AreEqual(compare[2], i1[2], "#A03");
     Assert.AreEqual(compare[3], i1[3], "#A04");

Once you used such a number in an Assert(), don't change it later on - people might use it it identify the test in bug reports.

### Use Assert.AreEqual() to compare things, not Assert.IsTrue ()

Do not compare two values with Assert.IsTrue() - if the test fails, people have no idea what went wrong while Assert.AreEqual() reports the failed value.

Ok:

     Assert.IsTrue (myTicks[0] == t1.Ticks, "A01");

Excellent:

    Assert.AreEqual (myTicks[0], t1.Ticks, "A01");

### Test your test with the Microsoft runtime

If possible, try to run your testsuite with the Microsoft runtime on .NET on Windows and make sure all tests in it pass. This is especially important if you're writing a totally new testcase - without this check you can never be sure that your testcase contains no bugs ....

Don't worry if you're writing your test on Linux, other people can test it for you on Windows.

Sometimes you may discover that a test doesn't show the expected result when run with the Microsoft runtime - either because there is a bug in their runtime or something is misleading or wrong in their documentation. In this case, please put a detailed description of the problem to mcs/class/doc/API-notes.

### Unit tests

Why do unit testing? It becomes simple to run automated tests for the whole library. Unit tests are a safety net - you can change part of the code and verify that you haven't broken anything. Ideally, tests are written before the actual library code itself. And every time a bug is discovered, a test should be written to demonstrate the bug and its fix. Then, if you ever reintroduce the bug, you will know immediately. For more info, read [JUnit Test Infected: Programmers Love Writing Tests](http://junit.sourceforge.net/doc/testinfected/testing.htm).

### Getting Started

We welcome all contributions to the Class Library Test Suite.

There is information to help you get started in git at mcs/class/doc/NUnitGuidelines.

Compiler tests
--------------

Mono ships with three compilers: C#, VB.NET and JScript. The tests are executed by running the makefile target \`make run-test-local' in the appropriate directory.

The C# compilation tests live in mcs/tests, and the C# error tests live in mcs/errors.

The VB.NET compilation tests live in vbnc/tests in the [mono-basic](https://github.com/mono/mono-basic) repository.

Runtime tests
-------------

These tests verify the virtual machine, to run these tests, do:

    cd mono/mono
    make check

Web Services tests
------------------

The Test directory for the System.Web.Services assembly contains a standalone test suite for testing web services. It tests:

-   Proxy generation using the wsdl tool
-   Access to web services using the generated client proxies
-   Execution of web services in the server

This suite not only tests web services running on XSP, but it can also test services running on other platforms and that are available in internet. This will help track down interoperability issues. To build the test suite, just run:

    cd mcs/class/System.Web.Services/Test/standalone xsp --root server

And from another terminal:

    cd mcs/class/System.Web.Services/Test/standalone make nunit-console testclient.dll

 This will download the wsdl documents, generate the proxies, build a dll with the proxies, and build the nunit tests. Then you can use nunit-console or gnunit to run the tests (the nunit dll is testclient.dll).

Read the README file in mcs/class/System.Web.Services/Test/standalone for more info.
