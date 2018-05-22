---
title: Coding Guidelines
redirect_from:
  - /Coding_Guidelines/
  - /CodingGuildelines/
  - /Guidelines/
---

 This document contains the coding guidelines for the Mono Project. It contains four major sections:

-   [Style Guidelines](#style-guidelines), on how to organize your source code.
-   [Git Workflow Changes](#git-workflow-changes) discusses how our workflow has changed now that Mono is hosted on GitHub.
-   [Source Code Control](#source-code-control) details our source code control use.
-   [Best Practices](#best-practices), used in the project.

Style Guidelines
================

In order to keep the code consistent, please use the following conventions. From here on \`good' and \`bad' are used to attribute things that would make the coding style match, or not match. It is not a judgment call on your coding abilities, but more of a style and look call. Please try to follow these guidelines to ensure prettiness.

You may also wish to read the [.Net Framework Design Guidelines](http://msdn.microsoft.com/en-us/library/ms229042.aspx) as well, however the Mono guidelines below take precedent for Mono code if there is a conflict.

Indentation
-----------

Use tabs (and configure your IDE to show a size of 8 spaces for them) for writing your code (hopefully we can keep this consistent). If you are modifying someone else's code, try to keep the coding style similar.

Since we are using 8-space tabs, you might want to consider the Linus Torvalds trick to reduce code nesting. Many times in a loop, you will find yourself doing a test, and if the test is true, you will nest. Many times this can be changed. Example:

``` csharp
for (i = 0; i < 10; i++) {
    if (something (i)) {
        do_more ();
    }
}
```

This takes precious space, instead write it like this:

``` csharp
for (i = 0; i < 10; i++) {
    if (!something (i))
        continue;
    do_more ();
}
```

 Switch statements have the case at the same indentation as the switch:

``` csharp
switch (x) {
case 'a':
    ...
case 'b':
    ...
}
```

Performance and Readability
---------------------------

It is more important to be correct than to be fast.

It is more important to be maintainable than to be fast.

Fast code that is difficult to maintain is likely going to be looked down upon.

Where to put spaces
-------------------

Use a space before an opening parenthesis when calling functions, or indexing, like this:

``` csharp
method (a);
b [10];
```

Do not put a space after the opening parenthesis and the closing one, ie:

good:

``` csharp
method (a);
array [10];
```

bad:

``` csharp
method ( a );
array[ 10 ];
```

Do not put a space between the generic types, ie:

good:

``` csharp
var list = new List<int> ();
```

bad:

``` csharp
var list = new List <int> ();
```

Where to put braces
-------------------

Inside a code block, put the opening brace on the same line as the statement:

good:

``` csharp
if (a) {
    code ();
    code ();
}
```

bad:

``` csharp
if (a)
{
    code ();
    code ();
}
```

Avoid using unnecessary open/close braces, vertical space is usually limited:

good:

``` csharp
if (a)
    code ();
```

bad:

``` csharp
if (a) {
    code ();
}
```

Unless there are either multiple hierarchical conditions being used or that the condition cannot fit into a single line.

good:﻿

``` csharp
if (a) {
    if (b)
        code ();
}
```

bad:

``` csharp
if (a)
    if (b)
        code ();
```

When defining a method, use the C style for brace placement, that means, use a new line for the brace, like this:

good:

``` csharp
void Method ()
{
}
```

bad:

``` csharp
void Method () {
}
```

Properties and indexers are an exception, keep the brace on the same line as the property declaration.

Rationale: this makes it visually simple to distinguish them.

good:

``` csharp
int Property {
    get {
        return value;
    }
}
```

bad:

``` csharp
int Property
{
    get {
        return value;
    }
}
```

Notice how the accessor "get" also keeps its brace on the same line.

For very small properties, you can compress things:

ok:

``` csharp
int Property {
    get { return value; }
    set { x = value; }
}
```

 Empty methods: They should have the body of code using two lines, in consistency with the rest:

good:

``` csharp
void EmptyMethod ()
{
}
```

bad:

``` csharp
void EmptyMethod () {}
```

``` csharp
void EmptyMethod () {
}
```

``` csharp
void EmptyMethod ()
{}
```

If statements with else clauses are formatted like this:

good:

``` csharp
if (dingus) {
        ...
} else {
        ...
}
```

bad:

``` csharp
if (dingus)
{
        ...
}
else
{
        ...
}
```

bad:

``` csharp
if (dingus) {
        ...
}
else {
        ...
}
```

Classes and namespaces go like if statements, differently than methods:

good:

``` csharp
namespace N {
    class X {
        ...
    }
}
```

bad:

``` csharp
namespace N
{
    class X
    {
        ...
    }
}
```

So, to summarize:

| Statement                   | Brace position |
|-----------------------------|----------------|
| Namespace                   | same line      |
| Type                        | same line      |
| Method (including ctor)     | **new line**   |
| Properties                  | same line      |
| Control blocks (if, for...) | same line      |
| Anonymous types and methods | same line      |

Multiline Parameters
--------------------

When you need to write down parameters in multiple lines, indent the parameters to be below the previous line parameters, like this:

Good:

``` csharp
WriteLine (format, foo,
           bar, baz);
```

If you do not want to have parameters in the same line as the method invocation because you ar running out of space, you can indent the parameters in the next line, like this:

Good:

``` csharp
WriteLine (
       format, moved, too, long);
```

Comma separators go at the end, like a good book, never at the beginning:

Good:

``` csharp
WriteLine (foo,
           bar,
           baz);
```

Atrocious:

``` csharp
WriteLine (foo
           , bar
           , baz);
```

Use whitespace for clarity
--------------------------

Use white space in expressions liberally, except in the presence of parenthesis:

good:

``` csharp
if (a + 5 > method (blah () + 4))
```

bad:

``` csharp
if (a+5>method(blah()+4))
```

File headers
------------

For any new files, please use a descriptive introduction, like this:

``` csharp
//
// System.Comment.cs: Handles comments in System files.
//
// Author:
//   Juan Perez (juan@address.com)
//
// Copyright (C) 2002 Address, Inc (http://www.address.com)
//
```

If you are modyfing someone else's code, and your contribution is significant, please add yourself to the Authors list.

Multiline comments
------------------

For long, multiline comments use either:

``` csharp
/*
 * Blah
 * Blah again
 * and another Blah
 */
```

Or:

``` csharp
//
// Blah
// Blah again
// and another Blah
//
```

Casing
------

Argument names should use the camel casing for identifiers, like this:

good:

``` csharp
void Method (string myArgument)
```

bad:

``` csharp
void Method (string lpstrArgument)
```

``` csharp
void Method (string my_string)
```

(There is an exception to this rule: [Gtk#](/docs/gui/gtksharp/) codebase, in which you should use under_score.)

Instance fields should use underline as a separator:

good:

``` csharp
class X {
     string my_string;
     int    very_important_value;
}
```

passable:

``` csharp
class X {
      string myString;
      int    veryImportantValue;
}
```

bad:

``` csharp
class X {
      int      _intval;
      string   m_string;
}
```

The use of "m\_" and "\_" as prefixes for instance members is highly discouraged.

An exception to this rule is serializable classes. In this case, if we desire to have our serialized data be compatible with Microsoft's, we must use the same field name.

this
----

The use of "this." as a prefix in code is discouraged, it is mostly redundant. In general, since internal variables are lowercase and anything that becomes public starts with an uppercase letter, there is no ambiguity between what the "Foo" and "foo" are. The first is a public property or field, the second is internal property or field.

Good:

``` csharp
class Foo {
    int bar;
 
    void Update (int newValue)
    {
       bar = newValue;
    }
 
    void Clear ()
    {
       Update ();
    }
}
```

Bad:

``` csharp
class Foo {
    int bar;
 
    void Update (int newValue)
    {
       this.bar = newValue;
    }
 
    void Clear ()
    {
       this.Update ();
    }
}
```

An exception is made for "this" when the parameter name is the same as an instance variable, this happens sometimes in constructors or if naming is difficult:

Good:

``` csharp
class Message {
     char text;
 
     public Message (string text)
     {
         this.text = text;
     }
}
```

Line length and alignment
-------------------------

Line length: The line length for C# source code is 180 columns (Used to be 80).

If your function declaration arguments go beyond this point, please align your arguments to match the opening brace. For best results use the same number of tabs used on the first line followed by enough spaces to align the arguments. That ensures that the arguments will remain aligned when viewed with a different tabsize. In the following example, the line that declares argc is indented with 2 tabs and 15 spaces:

``` csharp
namespace N {
    class X {
        void Function (int arg, string argb,
                       int argc)
        {
        }
    }
}
```

When invoking functions, the rule is different, the arguments are not aligned with the previous argument, instead they begin at the tabbed position, like this:

``` csharp
void M ()
{
    MethodCall ("Very long string that will force",
        "Next argument on the 8-tab pos",
        "Just like this one");
}
```

Initializing Instances
----------------------

Use the new C# syntax to initialize newly created objects.

Bad:

``` csharp
     var x = new Foo ();
     x.Label = "This";
     x.Color = Color.Red;
```

Good:

``` csharp
     var x = new Foo () {
         Label = "This",
         Color = Color.Red
     };
```

Baroque Coding
--------------

Baroque coding is discouraged.

We discourage the use of the "private" keyword to flag internal fields or methods since this is the default visibility mode in C#. The keyword exists because of Java. Avoid it, it merely is more line noise for people that are reading your code.

But the same principle applies everywhere else in Mono. Avoid complex code or redundant code for the sake of it. Try to write the minimum amount of text possible.

Warnings
--------

Avoid committing code with warnings to the repository, the use of #pragmas to disable warnings is strongly discouraged, but can be used on unique cases. Please justify the use of the warning ignore clause on a comment.

Do not commit changes to the Makefiles that removes warnings, if anything warnings should be eliminated one at a time, and if not possible, they must be flagged.

Conditional compilation
-----------------------

Ideally we would not need conditional compilation, and the use of #ifdef is strongly discouraged. But due to our support for old C# 1.0 compilers we have to use it in a few places.

Try to avoid negative tests that have an else clause, for example:

``` csharp
            #if !NET_2_0
                CODE_FOR_1_0
            #else
                CODE_FOR_2_0
            #endif
```

Instead use:

``` csharp
            #if NET_2_0
                CODE_FOR_2_0
            #else
                CODE_FOR_1_0
            #endif
```

When a major feature differs across compilation targets, try to factor out the code into a separate class, a helper class or a separate file, and include that in your profile while surrounding that helper file/class with the ifdefs to reduce the amount of ifdefs in the code.

For instance, this is used for some parts of Grasshopper where the code is ifdefed out, when large parts of a file would have been ifdefed out, we moved the code into a MyOtherFile.jvm.cs

For 2.0 classes, this is even simpler as code can be trivially factored out into

    MyHelperClass.cli.cs
    MyHelperClass.jvm.cs

By using partial classes.

Missing Implementation Bits
---------------------------

There are a number of attributes that can be used in the class libraries to flag the specific state of an API, class or field.

The following attributes exist:

MonoDocumentationNote, MonoExtension, MonoInternalNote, MonoLimitation and MonoNotSupported.

If you implement a class and you are missing implementation bits, please use the attribute MonoTODO. This attribute can be used to programatically generate our status web pages:

``` csharp
[MonoTODO ("My Function is not available on Mono")]
int MyFunction ()
{
        throw new NotImplementedException ();
}
```

Ideally, write a human description of the reason why there is a MonoTODO, this will be useful in the future for our automated tools that can assist in developers porting their code.

Do not use MonoTODO attributes for reminding yourself of internal changes that must be done. Use FIXMEs or other kinds of comments in the source code for that purpose, and if the problem requires to be followed up on, [file a bug](/community/bugs/).

NotImplementedException
-----------------------

In the Mono class libraries, if a library is stubbed out, it is customary to insert the following code snippet:

``` csharp
    throw new NotImplementedException ()
```

The NotImplemented exception is used by tools like the [Mono Migration Analyzer](/docs/tools+libraries/tools/moma/) (Moma) to report potential problems for people porting their applications.

Notice that in certain conditions, throwing a NotImplementedException is a pattern used in base virtual methods to force derived classes to implement the functionality. This can lead to incorrect reports from the Moma tool, because the tool has no way of knowing that in practice the virtual base method will never be called (it would be better to have an abstract class in this case, but we have to be source and binary compatible). In these cases, instead of throwing the exception directly, call a helper routine, so that it becomes invisible to Moma:

``` csharp
Exception GetNotImplemented ()
{
     return new NotImplementedException ();
}
 
void SomeMethod ()
{
     throw GetNotImplemented ();
}
```

Remember the rule: NotImplementedExceptions should be exposed in the toplevel method that is exposed to developers for Moma to properly work.

Use of var
----------

Use var on the left-hand side of an assignment when the type name is repeated on the right hand side:

bad:

``` csharp
    NSUuid monkeyUUID = new NSUuid (uuid);
```

good:

``` csharp
    var monkeyUUID = new NSUuid (uuid);
    NSUuid something = RetrieveUUID ();
```

Use Simple Identifiers
----------------------

Use simple identifiers when possible.

passable:

``` csharp
var speechSynthesizer = new AVSpeechSynthesizer ();
var speechUtterance =
  new AVSpeechUtterance ("Shall we play a game?");
speechSynthesizer.SpeakUtterance (speechUtterance);
```

delightful:

``` csharp
var synthesizer = new AVSpeechSynthesizer ();
var utterance = new AVSpeechUtterance ("Shall we play a game?");
synthesizer.SpeakUtterance (utterance);
```

Examples
--------

``` csharp
class X : Y {
    bool Method (int argument_1, int argument_2)
    {
        if (argument_1 == argument_2)
            throw new Exception (Locale.GetText ("They are equal!");
 
        if (argument_1 < argument_2) {
            if (argument_1 * 3 > 4)
                return true;
            else
                return false;
        }
 
        //
        // This sample helps keep your sanity while using 8-spaces for tabs
        //
        VeryLongIdentifierWhichTakesManyArguments (
            Argument1, Argument2, Argument3,
            NestedCallHere (
                MoreNested));
    }
 
    bool MyProperty {
        get {
            return x;
        }
 
        set {
            x = value;
        }
    }
 
    void AnotherMethod ()
    {
        if ((a + 5) != 4) {
        }
 
        while (blah) {
            if (a)
                continue;
            b++;
        }
    }
}
```

Source Code Control
===================

Many of us in the Mono team are still getting used to using Git. Some very useful hints are available in our [GitFAQ](/community/contributing/gitfaq/) that is geared specifically to the Mono team.

Summary Description
-------------------

Include a one-line summary description of your change at the top of your commit message to improve the rendering of the commit history on GitHub.

After the one-line summary description, you should continue to add the detailed description of your change to the commit message, detailing what the change does.

Example:

    [Tag] This is the one line summary of the change

    Here you have a more detailed account of the change, the bug it fixes,
    the rationale for the change and other details that will help a future
    developer understand why this change was made.

The `[Tag]` is optional, but you could try using these for your commits:

-   **Fix** for bug fixes, in the summary include the nature of the fix and the bug #
-   **Performance** for changes that improve performance
-   **Compatibility** changes done for the sake of compatibility
-   **API** for API additions, changes or removals

We will add more tags as time goes by.

-   The commit message is mainly for the other people, so they should be able to understand it now and six months later.
-   Always add a brief description of the commit to the first line of the commit and terminate by two newlines (it will work without the second newline, but that is not nice for the interfaces).
-   First line (the brief description) must only be one sentence and should start with a capital letter unless it starts with a lowercase symbol or identifier. Don't use a trailing period either. Don't exceed 72 characters.
-   You can prefix the first line with one tag, to make it easier to know to which part of the module the commit applies. For example, a commit with "[monodoc] Improve the formatting" in the mono-tools module clearly applies to the monodoc tool.
-   The main description (the body) is normal prose and should use normal punctuation and capital letters where appropriate. This main description can be empty if the change is self-explanatory (eg: "Add DOAP file").

When committing code on behalf of others use the --author option, for example:

``` bash
 git commit --author "Joe Coder <joe@coder.org>".
```

Work Branches
-------------

See the description of [short term branches](/community/contributing/gitfaq/#workflow-2-use-master-as-integration-branch) and [long term branches](/community/contributing/gitfaq/#workflow-3-long-term-projects) in [GitFAQ](/community/contributing/gitfaq/).

RCS and CVS tags
----------------

Some users like to use the special RCS/CVS tags in their source code: \$id\$, \$log\$ and so on.

The use of these is not permitted on the Mono source code repository. This metadata belongs on a ChangeLog or in git metadata.

Backporting Changes
-------------------

If you want to backport an interesting change to a branch, you can follow these steps.

Let us say that you want to backport this change: [https://github.com/mono/mono/commit/778694e1b85416a3abfdac4952dd85c8384e1cf8](https://github.com/mono/mono/commit/778694e1b85416a3abfdac4952dd85c8384e1cf8) into the remote branch monotouch-2-0.

To do this, first you would create a local branch called "monotouch-2-0" that tracks the remote monotouch-2-0 branch:

``` bash
$ git checkout -b monotouch-2-0 -t remotes/origin/monotouch-2-0
Checking out files: 100% (12233/12233), done.
Branch monotouch-2-0 set up to track remote branch monotouch-2-0 from origin.
Switched to a new branch 'monotouch-2-0'
```

The above is only needed if you have never worked on the branch before. But if you had worked on the branch before, you can just use:

``` bash
$ git checkout monotouch-2-0
Switched to branch 'monotouch-2-0'
```

Then to get the patch, use the hash number in the commit above:

``` bash
git cherry-pick 778694e1b85416a3abfdac4952dd85c8384e1cf8
```

You might need to fix any merge issues at this point.

Then **git add** any new files and changed files and then before you commit, use the hash number in your commit to transfer any commit messages, author information and so on, like this:

``` bash
git commit -c 778694e
```

The magic number there are the first seven digits of the large cherry-pick commit version. Alternatively, you can use the full commit version:

``` bash
git commit -c 778694e1b85416a3abfdac4952dd85c8384e1cf8
```

Now that your changes are committed you can push them:

``` bash
git push
```

ChangeLogs
----------

**Update**: ChangeLogs are no longer manually updated, instead just use the ChangeLog message on your commit. At release time, a script merges the commit messages into the proper ChangeLogs that are distributed. For a few examples on how the script operates on commit messages, see [this branch on our public repository](https://github.com/mono/mono/commits/commit-to-changelog-tests).

You would typically commit your message like this:

    One line description

    * Makefile (%-profiles): Go through an intermediate set of rules.
    Move body to ...
    (profiles-do--%): ... this.
    (profiles-do--run-test): Customized rule that usefully runs with 'make -j'
    and 'make -k'.
    (profiles-do--all, profile-do--%--all): Orchestrate the bootstrap process.

    * file.cs (MainForm): Updated version.

From that point on a list of changes in a file-by-file basis, describing what changes were done.

File formats
------------

Historically our repository has used a mix of line-endings, this is a mistake that we are trying hard to fix. We also have several files where each has itself a mix of line-endings.

For existing files, please make sure that you do not convert the file, as that causes us to lose precious history -- by the very nature of the conversion, *every* line in the file would be marked as modified.

For new files that you create, try to ensure that the line endings in your file are uniform -- either all LF, or all CR-LF.

Please verify before commiting that your changes won't lose history, you can do this by examining the output of:

``` bash
git diff
git diff --stat
```

If you feel Git's automatic line-ending normalizer is kicking in inappropriately and changing too many lines, you can add a corresponding entry for that file in a nearby `.gitattributes` file, preferably in the same directory

``` bash
/FileWithCRLF.cs -crlf
```

If you're facing this issue a lot, you might want consider turning off the GIT configuration variable 'core.autocrlf' for mono repositories.

Caveat: We are trying to come up with better Git annotations so that all newly created code files have LF line endings. Git itself seems to be in a transition from one mechanism to another, and there are several edge cases that seem to trip us up. So, this is just an interim suggestion.

Best Practices
==============

Correctness is essential for the Mono class libraries. Because our code is called by many other people, we often must be more pendantic than most people would be when writing code. These items are guidelines of some things you should check for.

The class libraries are grouped together in the assemblies they belong.

Each directory here represents an assembly, and inside each directory we divide the code based on the namespace they implement.

In addition, each assembly directory contains a Test directory that holds the NUnit tests for that assembly.

We use a new build system which is described by various README files in mcs/build

The build process typically builds an assembly, but in some cases it also builds special versions of the assemblies intended to be used\\ for testing.

Documentation
-------------

As you write new features, user visible or developer visible consider that the feature will be invisible to users unless it is documented. If you write new features and there is no accompanying documentation, the feature is for all purposes bloat as only a handful of developers will know about it, but everyone will pay the price by carrying this undocumented code with them.

Tests
-----

When fixing a bug, write a test, so we can make sure that we do not re-introduce bugs in the future accidentally.

When writing new code, write tests to exercise the API.

Write tests when you are exploring an API on Windows, you will have to write test cases anyways to understand how the API works. Instead of writing throw away code, write NUnit tests that will test return values, properties and behavior and then write the new implementation using your tests as a baseline.

Code should never be checked into the repository that breaks the build, or breaks any of the existing tests.

Check all arguments
-------------------

Public functions must check their arguments in exactly the same was as Microsoft's framework. It is important to throw exceptions such as ArgumentNullException rather than NullReferenceException. Adding test to the [Test Suite](/community/contributing/test-suite/) is important for these.

Be careful about freeing memory
-------------------------------

In general, whenever you create a class that is disposeable, you need to use the using {} pattern. This way, resources get disposed. Do *not* rely on finalizers to get run. This can lead to performance problems.

Watch for integer [under|over]flows
-----------------------------------

Integer overflows and underflows are [possible](http://pages.infinit.net/ctech/20050610-0319.html) in managed code. They can lead to ugly problem if your code deals with unsafe code, internal calls or p/invokes. So for every integer parameter you should ask yourself how your code would react to a Int32.MaxValue or a Int32.MinValue (substitute Int32 for your integral type). Unit tests are a nice way to remember that you reviewed your code.

Locking and Threading
---------------------

As humans, we are trained to think about one thing at a time. We, by nature, are not multi-taskers. Thus, when we write code, we tend to think about it as if it was the only thing happening on the operating system. Sadly, this is not the case. In Mono, we are providing a base framework for others to use. This means that our code can often be called from multiple threads. Our code might be running on 8 cpu server with hyperthreading.

### Deadlocks

In managed code, the most common way to deadlock is to have reverse locking order:

``` csharp
object lockA;
object lockB;
 
void Foo () {
   lock (lockA) {
      lock (lockB) {
      }
   }
}
 
void Bar () {
   lock (lockB) {
      lock (lockA) {
      }
   }
}
```

Imagine that one thread is inside Foo and has just acquired lock A, while another thread is in Bar and just acquired lock B. Now, the Foo thread wants lockB, which is owned by Bar. However, in order for Bar to release it, it must acquire lockA. Nobody can make progress and the program deadlocks. In order to avoid this situation, we **must** ensure that our locks get acquired in the same order each time.

One consequence of this is that we generally can not call code outside of our control under a lock. Imagine this code:

``` csharp
// class library
class Blah {
    Hashtable ht;
    void Foo (int zzz, Entry blah) {
       lock (ht) {
           ht.Add (zzz, blah);
       }
    }
 
    void Bar ()
    {
       lock (ht) {
          foreach (Entry e in ht)
             EachBar (e);
       }
    }
 
    virtual void EachBar (Entry e)
    {
    }
}
 
// User
class MyBlah : Blah {
    void DoStuff ()
    {
       lock (this) {
          int i = GetNumber ();
          Entry e = GetEntry ();
 
          Foo (i, e);
       }
    }
 
    override void EachBar (Entry e)
    {
        lock (this) {
           DoSomething (e);
        }
    }
}
```

The same kind of deadlock that happened above happens here because the user acquired another lock inside ours. To avoid this, we must not call user code inside our locks.

### Don't lock on Types and Strings

Code like lock (typeof (T)) is not good. Type objects can be shared across appdomains, which can lead to unexpected behavior. Also, if the type is public, a user could lock on the type and create deadlocks. Strings are interned, and thus the same type of problems can occur. In general, the best practice is to do:

``` csharp
static object lockobj = new object ();
 
...
 
lock (lockobj) {
...
}
```

Git Workflow Changes
====================

One Line Summaries
------------------

Before your full commit message, use a one-line summary of the change as this improves the output of GitHub's rendering of changes done to the project.

After this one line change, you can add the regular, full-documented version of the change.

No more manual ChangeLog editing
--------------------------------

We no longer maintain ChangeLog files by hand. You still must create a commit message that contains a 1-line summary and a detailed description of the changes in your commit.

Remember, this is used by maintainers over the course of the project. Mono is almost 10 years old now, so we need this information for future maintainers to look at.

The ChangeLogs are automatically generated at distribution time from the Git commit messages.

Personal Work Branches
----------------------

See the description of [short term branches](/community/contributing/gitfaq/#workflow-2-use-master-as-integration-branch) and [long term branches](/community/contributing/gitfaq/#workflow-3-long-term-projects) in [GitFAQ](/community/contributing/gitfaq/).

If you publish any feature branches, you should do so on forked repositories, not on the main mono module. Branches on repositories under [https://github.com/mono](https://github.com/mono) should be used for release engineering, bugfixes and integration; not for feature development.

As somewhat of a corollary, you need to fork only when you publish your feature branch. After all, Git treats your local clone as a first-class repository, not just as a mirror of some remote repository. You *don't* need to fork to create local branches.

It is good practice to publish a long-term feature branch early so as to encourage review and collaboration, and to make the integration of your feature go smoothly.

When you are satisfied your feature is ready to be included in the next release of the project, you will need to integrate your feature into the `master` branch. Submit a pull request to the appropriate project or sub-module maintainer: this involves going to the webpage of your fork at github.com, using the "Switch Branch" drop-down-list to select the branch to be released, and clicking on the "Pull Request" button.

If you do have write access to the main mono repository, you might be asked to commit to it directly. At this point you should follow the [GitFAQ](/community/contributing/gitfaq/) suggestions on how to merge branches onto `master`.
