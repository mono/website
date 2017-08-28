---
title: "CppSharp / Maintenance & Improvement tasks (Kimon Topouzidis)"
---

Author: Kimon Topouzidis

## Summary

My name is Kimon Topouzidis and I am a student at the IT Department of Alexander Technological Institute Thessaloniki, Greece. This summer of 2017, I was accepted to participate at the [Google Summer of Code](https://summerofcode.withgoogle.com) and more specifically at [CppSharp](https://github.com/mono/CppSharp). August 21, 2017, marks the end of the program. It was a long way, since May the 4th, when the journey began. My task was to fix as many as possible of the issues reported by the community. I will try to briefly present my work here and show the world what I did during the summer.

## Early days

May was a month of preparation. I studied the docs, cloned the project, built the solution and tried to understand the concept of the project. First things first I learned how to use the [TortoiseGit](https://tortoisegit.org/). Since I was about to use Github I had to learn how to properly use Git. In addition, my mentor, [João Matos](https://github.com/tritao), taught me the basics of the project, how it works, what's its purpose etc. etc.

## The way we worked

Working on debugging is quite demanding. You solve an issue here and you open 30 somewhere else. Thats why I had to split and slowly work on an issue to avoid as many problems as possible. After a brief discussion I had with my mentor, we decided to split my work in pieces. I was responsible for an issue that he would assign me and I had to fix it, with his guidance of course. The first issues I took were easy ones and I just had to do minor changes to the code. Later on, I was assigned way more difficult ones, such as wrapping values from [Clang](https://clang.llvm.org), something I never thought I would be able to do so.

Eventually we found a productive way to work together. I spent some time on the issue, tried to understand its nature and what should be fixed, contacted with the author of the issue for further details and explanations if needed and then get to code! System like these are often chaotic and gigantic and you might be digging for hours and hours to find the root of the problem and still be on the surface. I often got confused and lost my way, but I always had the proper help to get back on track.

After dealing with some issues I became way more comfortable and confident. Working on something daily is a very good way to understand it better and become a part of you. This had to be done in order to be in a place where I could understand, not every but a lot, of the upcoming tasks. My work was getting quicker and quicker and I felt proud I could achieve things like that.

In the end, I had just slightly improved CppSharp project, and I have contributed in the Open Source Community for the first time. My changes and work are incomparable with those others do but I am really proud of my code and the things I learned throughout the summer.

## My work

As mentioned, my job this summer was to solve as many issues as possible. You can see my PR's [here](https://github.com/mono/CppSharp/pulls?q=is%3Apr+is%3Aclosed+author%3Aktopouzi). I have worked on several parts of the CppSharp projects and made quite a few changes. Some of them are:

### Extended support for primitive values

One of my first real issues was to extend the support of primitive values. This had to be done in order to support marshaling for the C/C++ primitive types. In that moment there were support for specific primitives, such as `int`, `float` but I had to extend it to support others like `LongDouble` and `Int128`. Before that, I had to make some changes to the C# printer.

I wrapped the width of each Primitive from Clang, and then proceeded with the printing of the primitive. I changed the representation of the primitives,

```csharp

Write($"{access} {retType} {retType.NameSuffix} = {fieldValuePrinted};");

```

and then I proceeded with the implementation of the LongDoubles, Int128 and Half,

```csharp

case PrimitiveType.LongDouble/Int128/Half:
    return new TypePrinterResult { Type = "fixed byte",
    NameSuffix = $"[{Context.TargetInfo.LongDoubleWidth/Int128Width/HalfWidth}]"};
```

### Support for C/C++ structure packing

One of the most difficult task I had to deal with, this summer, was packing. Packing is a very efficient way of layout out the fields of structures. You actually place the members of a class/struct directly one after the other and achieve a way smaller block of memory than the default alignment would create. We had to improve our knowledge of the structure packing and alignment in order to support sequential type P/Invoke declarations in the future, allowing us to support 32 and 64-bit platforms with the same generated code. I am not actually an expert on this, so heres where you can find more about [packing](https://msdn.microsoft.com/en-us/library/2e70t5y1.aspx).

To make this happen, I had to introduce a new variable to keep the maximum alignment of the fields, and in order to be consistent I named it after Clang,

```csharp

public int MaxFieldAlignment { get; set; }

```

After creating the getter/setter for the variable, I had to implement it in the parser and get the value from Clang.

```csharp

if (Decl && D->hasAttrs())
{
    for (auto it = D->attr_begin(); it != D->attr_end(); ++it)
    {
        Attr* Attr = (*it);
        if (Attr->getKind() == clang::attr::Kind::MaxFieldAlignment)
        {
            auto MFA = cast<clang::MaxFieldAlignmentAttr>(Attr);
            Decl->maxFieldAlignment = MFA->getAlignment();
        }
    }
}

```

In order to make sure everything is working perfectly I created my first tests cases. Making tests for my code is something I learned quite fast and always used since then, cause its the best way to avoid bugs.

### Re-factored and extended support for documentation comments

I solved a couple of bug reports related to documentation comment generation and in general improved the representation of them in the code. This is very important as the generated comments help the users of the binding learn and discover the APIs of the bound code.

First of all I had to deal with a problem we had with XML blocks. Clang has a very bad way to actually convert comments (You can see my bug report [here](https://bugs.llvm.org/show_bug.cgi?id=33333)) and I had to deal with this by creating a Pass that would actually manipulate the comment and fix its representation. And thats what I did.

```csharp

public bool VisitParagraphCommand(ParagraphComment comment)
{
    bool tag = false;
    foreach (var item in comment.Content.Where(c => c.Kind == DocumentationCommentKind.TextComment))
    {
        TextComment com = (TextComment) item;
        if (Generators.Helpers.RegexTag.IsMatch(com.Text))
            tag = true;
        else if (tag)
            com.Text = com.Text.Substring(1);

        if (com.Text.StartsWith("<", StringComparison.Ordinal))
            com.Text = $"{com.Text}{">"}";
        else if (com.Text.StartsWith(">", StringComparison.Ordinal))
            com.Text = com.Text.Substring(1);
    }
    return true;
}

```

As you can see with the help of Regex `public static Regex RegexTag = new Regex(@"^(<|</)[a-zA-Z][\w\-]*?>?$");` I was able to detect the false block and re-built it.

Later on I introduced a new way of creating and detecting the comments. I extended the `Section` that is holding comments, to have two more functions.

```csharp

public void NewLine()
{
    lines.Add(CurrentLine.ToString());
    CurrentLine.Clear();
}

public List<string> GetLines()
{
    if (CurrentLine.Length > 0)
    NewLine();
    return lines;
}

```

That way I was able to control the number of lines each `Section` had and append the text of a comment to a new line for comments with more that one line.

Problems kept coming and this time I had to deal with unsupported custom XML tags. [Doxygen](http://www.stack.nl/~dimitri/doxygen/) tags are supported by Clang, but it cannot detect the custom ones. Also I discovered a few other bugs ([1](https://bugs.llvm.org/show_bug.cgi?id=33948),[2](https://bugs.llvm.org/show_bug.cgi?id=33949)) and this time Clang put a stop in my progress and since I couldn't proceed we decided to just print the text of the comment without theirs XML tag.

### Enhancements and fixes

Most of the times, when you are about to fix something, you have to prepare the ground for it. That's also something I did quite a few times. Some of them explained below.

* I had to make `Function` a `DeclarationContext` to match the Clang AST, so that I can set the name-space of each `Parameter` to be its `Function`.

* Also I suggested a [change](https://github.com/mono/CppSharp/issues/850), to actually include some test files to the VS project structure, and I fixed it by editing the Lua script.

```lua

files { testsdir .. "/Native/AST.h", testsdir .. "/Native/ASTExtensions.h", testsdir .. "/Native/Passes.h" }
filter "files:**.h"
    buildaction "None"
filter {}

```

### Results

I was able to fix quite few of issues this summer and I had the chance of learning things such as Lambda expressions and statements, working with Regex and delegates, have a look at the Lua scripting language and get to know with LLVM and Clang. I also learn quite a few things about [Boost](http://www.boost.org/) and some cool technologies like, [IoTivity](https://www.iotivity.org/) and [Android NDK](https://developer.android.com/ndk/index.html).
I have earned experience and knowledge on many fields throughout this summer and I thrilled about it! 🤗 😊

## Special Thanks

I want to thank everyone that mentored me during this summer, cause it was a great and unforgettable experience. I had a great time working and contributing to the Open Source community, as it is something that I have never done before. Special thanks to my mentor, João Matos, for everything he taught me and his guidance through the CppSharp project, Dimitar Dobrev, a maintainer for the CppSharp project who helped a lot establishing here and the fellow student, also accepted in CppSharp, from India, Mohit, with whom I had a very good understanding and we connected immediately.

I can't really express my feelings and how grateful I am for being able to experience this and I want to thank Google for providing that opportunity for young developers like me. It was a GREAT adventure!