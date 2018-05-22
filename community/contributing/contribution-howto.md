---
title: Mono Contribution HowTo
redirect_from:
  - /Mono_Contribution_HOWTO/
---

A little help for mono newbie coders
------------------------------------

For those who are new to Mono and are impatient to contribute with code (uhh... you are brave!!) here is the document you should read.

You will see all Mono hackers say the same (great minds have similar way of thinking): First, DO WRITE TESTS!!!. In order to do that:

-   Start with the NUnit Tests Guidelines. In the mono source tree they are located at: mcs/class/doc/NUnitGuideli...

-   But wait, this is a document for impatient people. So EVERYTHING should be here. Well, it is.

The NUnit Tests Guidelines document
-----------------------------------

Mono NUnit Test Guidelines and Best Practices

Authors: Nick Drochak \<ndrochak@gol.com\> Martin Baulig \<martin@gnome.org\> Last Update: 2002-03-02 Rev: 0.3

**Purpose**

This document captures all the good ideas people have had about writing NUnit tests for the mono project. This document will be useful for anyone who writes or maintains unit tests.

**Other resources**

-   mcs/class/README has an explanation of the build process and how it relates to the tests.
-   [http://nunit.sourceforge.net](http://nunit.sourceforge.net) is the place to find out about NUnit

Getting Started
---------------

-   If you are new to writing NUnit tests, there is a template you may use to help get started. The file is: [TemplateTest.cs](https://github.com/mono/mono/blob/master/mcs/class/doc/TemplateTest.cs)

-   Just a reminder to copy/paste this file it in another buffer. And keep reading. You can get it here or at the end of the guidelines in the Testing Tips section)

Save a copy of this file in the appropriate test subdirecty (see below), and replace all the [text] markers with appropriate code. Comments in the template are there to guide you. You should also look at existing tests to see how other people have written them.

The directory that will contain your new file depends on the assembly/namespace of the class for which you are creating the tests. Under mcs/class there is a directory for each assembly. In each assembly there is a Test directory, e.g. mcs/class/corlib/Test. In the Test directory there are sub-directories for each namespace in the assembly, e.g. mcs/class/corlib/Test/Sytem. Put your new test file in the appropriate sub-directory under Test for the class you are testing.

Once your test class is complete, you need to add it to the AllTests.cs file in the same directory as your new test. Add a call to "suite.AddTest()" passing the name of your new test class's suite property as the parameter. You will see examples in the AllTests.cs file, so just copy and paste inside there.

Once all of that is done, you can do a 'make test' from the top mcs directory. Your test class will be automagically included in the build and the tests will be run along with all the others.

Provide an unique error message for Assert()
--------------------------------------------

Include an unique message for each Assert() so that when the assert fails, it is trivial to locate the failing one. Otherwise, it may be difficult to determine which part of the test is failing. A good way to ensure unique messages is to use something like #A01, #A02 etc.

Bad:

    AssertEquals("array match", compare[0], i1[0]);
    AssertEquals("array match", compare[1], i1[1]);
    AssertEquals("array match", compare[2], i1[2]);
    AssertEquals("array match", compare[3], i1[3]);

Good:

    AssertEquals("#A01", compare[0], i1[0]);
    AssertEquals("#A02", compare[1], i1[1]);
    AssertEquals("#A03", compare[2], i1[2]);
    AssertEquals("#A04", compare[3], i1[3]);

Once you used such a number in an Assert(), don't change it later on - people might use it it identify the test in bug reports.

Use AssertEquals() to compare things, not Assert()
--------------------------------------------------

Never compare two values with Assert() - if the test fails, people have no idea what went wrong while AssertEquals() reports the failed value.

Bad:

    Assert ("A01", myTicks[0] == t1.Ticks);

Good:

    AssertEquals ("A01", myTicks[0], t1.Ticks);

Constructors
------------

When writing your testcase, please make sure to provide a constructor which takes no arguments:

``` csharp
public class DateTimeTest : TestCase {
    public DateTimeTest() : base ("[MonoTests.System.DateTimeTest]") {}
 
    public DateTimeTest (string name): base(name) {}
 
    public static ITest Suite {
       get {
           TestSuite suite = new TestSuite ();
           return suite;
       }
    }
}
```

Namespace
---------

Please keep the namespace within each test directory consistent - all tests which are referenced in the same AllTests.cs must be in the same namespace. Of course you can use subnamespaces as you like - especially for subdirectories of your testsuite. For instance, if your AllTests.cs is in namespace "MonoTests" and you have a subdirectory called "System", you can put all the tests in that dir into namespace "MonoTests.System".

Test your test with the microsoft runtime
-----------------------------------------

If possible, try to run your testsuite with the Microsoft runtime on Windows and make sure all tests in it pass. This is especially important if you're writing a totally new testcase - without this check you can never be sure that your testcase contains no bugs

Don't worry if you're writing your test on Linux, other people can test it for you on Windows.

Sometimes you may discover that a test doesn't show the expected result when run with the Microsoft runtime - either because there is a bug in their runtime or something is misleading or wrong in their documentation. In this case, please put a detailed description of the problem to mcs/class/doc/API-notes and do also report it to the list - we'll forward this to the Microsoft people from time to time to help them fix their documentation and runtime.

On Windows, you can simply use "make run-test-ondotnet" to run class libraries tests under Microsoft runtime.

Miscellaneous Tips
------------------

-   If you use Emacs, you might want to use the .emacs file and the package developed by Brad Merrill [mailto:zbrad@cybercom.net](mailto:zbrad@cybercom.net). It will allow you to highlight and indent in C# style in your Emacs editor. (XEmacs will still work but it'll also complain).

-   [MonoDevelop](http://monodevelop.com) is a GPLed IDE developed by IC#Code (SharpDevelop) and ported to Mono/Gtk#.

-   For those who Java: [A comparison of Microsoft's C# programming language to Sun Microsystem's Java Programming language](http://www.25hoursaday.com/CsharpVsJava.html) by Dare Obasanjo is a really good (very complete) text to read.

-   Suggest this point and more, now I can't think of anything more.

Enjoy!!.

*(c) 2002, [Jaime Anguiano Olarra](mailto:jaime@geneura.ugr.es).*

*The parts included in this document are property of their respective authors.*

*Note: The identation of the source code has been changed a bit so it could fit better in the website. Anyway, as nothing more changed, the files should work as expected.*

