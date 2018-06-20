---
title: "CppSharp / Maintenance & Improvement tasks (Mohit Mohta)"
---

Author: Mohit Mohta

## About Me

Hello everyone, I'm [Mohit Mohta](https://www.linkedin.com/in/mohtamohit), a junior year computer science undergraduate from [IIT Indore](https://en.wikipedia.org/wiki/Indian_Institute_of_Technology_Indore), [India](https://en.wikipedia.org/wiki/India). I got the opportunity to work with CppSharp project of Mono organisation under [Google Summer of Code 2017](https://summerofcode.withgoogle.com) and hereby, I present my overall work experience and work accomplished this summer. Happy reading.

## Summary

[Google Summer of Code 2017](https://summerofcode.withgoogle.com) is about to end now, finally! Oh, what better could I've asked for this summer. Contributing to [CppSharp](https://github.com/mono/CppSharp) project, as a student, taught me so many things which I could've learnt no where else at this pace. My project was to fix as many bugs and add as many enhancements as possible during the summer and I, with the help and guidance from my mentors, tried my best to do so!

## The day it began

May 4th. I was overwhelmed to see that I'm selected as a student in the prestigious GSoC programme. But, there was a feeling of nervousness that was triggering some fears into me. CppSharp was actually the hardest of all the projects which I applied for. The codebase for CppSharp was large and it took me a while to get a hold of it. As soon as I got to know about my selection, I shared the news with my mentors, and also the feeling of nervousness. And my mentor assured me that there is nothing to worry about for they'll be helping me throughout. I was little relieved to hear it and I planned of making full use of the month of May and start working straighway to make an early lead, and avoid any shortcomings in the time to follow.

Once I was done with setting up the basics, like generating solution and running tests etc, I started working on a beginner-level issue. I had been using Git from long but I never used it so extensively ever before. So, in the process, I started using [TortoiseGit](https://tortoisegit.org/) (Thanks to  my mentor for introducing me to this) and now I could do things which I didn't even know existed.

## The daily chore

Eat, sleep code repeat. That was something I had heard a lot before from the routine of seniors, but never ever practiced. But now, my day started between 10-11 am in the morning and work would be in action till midnight 12, untill I felt sleepy, in the initial days. Ghosh, and even after giving so much time, output initially wasn't much impressive, I remember. There was a time then when I started feeling demotivated about my capabilities and doubting myself but it was just this "never say die" kinda feeling which kept me up. But, with the ongoing efforts, with time, results started reflecting. Every Merge gave a sense of happiness that is tough to explain in words!

I remember being extremely silly at times, but thanks to my mentors, who took the pain of explaining things to me whenever I was stuck.
My mentors used to assign me an issue to work upon and I'd to try it then. If I get stuck, they'd help me and if not, they'll motivate me to maintain the flow. Those were good days, ofcourse with a set routine!

With time, the speed with which I could handle issues improved significantly. I could do more work in lesser time, but I simultaneously wasn't getting myself proper sleep, and when my mentor came to know about it, he like a guardian adviced me to improve my schedule. I had the kind of discussions that one would have from his care-takers! Like he adviced me to take proper breaks, he even got an "eye-relax" software installed on my machine (which I use it even today) and curated my schedule, relived me from eye-strain. Not only me, many of my friends use these techniques now. Credits to my mentor.

All in all it was fun working this way.

Let me now begin with a description of the accomplished work during the summer.

## Accomplished Tasks

### All of my accepted PR's can be easily viewed [here](https://github.com/mono/CppSharp/commits?author=mohtamohit)

CppSharp has a huge codebase, and my work is like a small brick in this huge building. Besides, the list of the PRs at the link above, I would also like to present some of the outlines of my work here :

### Added support for std::string

This was something that was long due to be added as one of the features of CppSharp. In order to achieve this, we divided it in the following sub-tasks :
Firstly, we added a new project for C++ standard library symbols alongwith the required dependencies by adding the code for that in Lua.
Then, we enabled export of those symbols in the code generator like,

```csharp

var exporting = Context.ParserOptions.IsMicrosoftAbi ? "__declspec(dllexport) " : string.Empty;
WriteLine($"template {exporting}{method.Visit(cppTypePrinter)};");

```

I also had to enable generation of the destructor in C++ standard library class `basic_string`, like

```csharp

case "basic_string":
    foreach (var method in @class.Methods.Where(m => !m.IsDestructor && m.OriginalName != "c_str"))
        method.ExplicitlyIgnore();
    foreach (var specialization in @class.Specializations.Where(s => !s.Ignore))
        {
         foreach (var method in specialization.Methods.Where(m => !m.IsDestructor && m.OriginalName != "c_str"))
              method.ExplicitlyIgnore();
              ...
              ...
        }
break;

```

then I updated CppSharp's Clang parser code as previously it relied on C macros to convert `std::string` to C strings, but now I could remove these macros and use C++ strings directly to take advantage of this support for `std::string`, [here.](https://github.com/mono/CppSharp/commit/369957498340c9cf1501fb110a2799a5b8230afd)
And, lastly we just enabled the tests, and woo-hoo, support was ready!
This way CppSharp was ready for a new release. Felt so good - a release with my work in. :)

### Fixed stack mismatch when bool param passed from C++ to C# #

This initially seemed quite complicated to me because I always found delegates confusing and it had to do something with them. But, as I spent time on this, we broke it into simpler and even simpler code! Before we were doing manual marshaling of bool types to byte when needed, but I changed it to take the advantage of P/Invoke  `MarshalAs(UnmanagedType.I1)` attribute and in `VisitTypeDefNameDecl`, I simply added,

```csharp

if (functionType.ReturnType.Type.Desugar().IsPrimitiveType(PrimitiveType.Bool))
  WriteLine("[return: MarshalAs(UnmanagedType.I1)]");

```

with which we could now fix the bug. See more about this [here.](https://github.com/mono/CppSharp/commit/49e94460a5c2b0540e8486a076796b6981260854)

### Added passage of VS Version selected at config time to build

Well, it was really important and was a cause of a few bugs that our users reported. Basically it was an issue when users had multiple VS versions installed and we did not know which one to use. In order to fix this, I just added the generation of a new file in Premake like,

```csharp

buildconfig = io.open("../BuildConfig.cs", "w+")
io.output(buildconfig)
io.write("namespace CppSharp.Parser", "\n{\n    ")
io.write("public static class BuildConfig", "\n    {\n        ")
io.write("public const string Choice = \"" .. action .. "\";\n")
io.write("    }\n}")
io.close(buildconfig)

```

And, then used this `buildConfig.Choice` in `SetupMSVC`, while setting parser options. This way we could now pass the VS version selected at config time to the build.

### Added some switches / options in ParserOptions

Simple, but very important. Previously we hard-coded some of the language flags in the Clang native parser code instead of in managed code as options. This caused an issue when users needed to switch certain flags like RTTI or language version.

So, I moved processing of Clang arguments to managed code (`ParserOptions.cs`) where they can be more easily changed.
For eg,

```parserOptions.LanguageVersion = LanguageVersion.GNUPlusPlus11;``` and ```parserOptions.EnableRtti = true;```

### Fixed code generation for functions with Typedef function pointers as parameters

Before, we never supported code generation for functions with typedef function pointers as parameters, for instance something like,

```c

typedef int (typedefedFuncPtr)(Foo *a, Bar b);
int DLL_API funcWithTypedefedFuncPtrAsParam(typedefedFuncPtr *func);

```

So, I had to change the dictionary for delegates from a function to a declaration and then create a method that would do the tasks of adding the delegates to the dictionary, mapping the respective decl (be it a method or a parameter) with its delegate definition. And, this way we finally could replace generic delegates with generated delegates as params (wherever needed) in the bindings. For more details one may refer [this.](https://github.com/mono/CppSharp/commit/db522c0295be0a915b17e6215f26245fd881d8b1)

### Unified code for handling named and anonymous delegates

This work served many objectives all together. For instance, we got rid of the anonymous delegate names, also merging common code for delegate generation meant delegate pass could now work for C++/CLI as well. Issues related to access specifiers and calling conventions were also addressed. We also got rid of delegate dictionary as a simple list could do the job now. My mentor Joao and Dimitar helped a lot with this work. Many thanks to them for this. One can see source for this [here.](https://github.com/mono/CppSharp/commit/8a2e81344517bfd9338f67ea4b7711919a45c210)

### Fixed the generated C# when setting a field which is an array of complex objects

Users had reported issues with generated code for the same, for instance something like this,

```csharp

struct ComplexArrayElement
{
    bool BoolField;
    uint32_t IntField;
    float FloatField;
};
#define ARRAY_LENGTH_MACRO 10
struct HasComplexArray
{
    ComplexArrayElement complexArray[ARRAY_LENGTH_MACRO];
};

```

I can recall this was what I attempted in the initial days. And, it involved a lot of debugging and understanding. Though the final solution was sleek, just a change of a line.
Just added the following in `VisitArrayType`,

```csharp

if (@class != null && @class.IsRefType)
{
    supportBefore.WriteLineIndent(
                "*({1}.{2}*) &{0}[i * sizeof({1}.{2})] = *({1}.{2}*){3}[i].{4};",
                    Context.ReturnVarName, array.Type, Helpers.InternalStruct,
                    Context.ArgName, Helpers.InstanceIdentifier);
}

```

Well, those were some glimpses of the accomplished work. However, I'd be glad if you see my accepted work [here](https://github.com/mono/CppSharp/commits?author=mohtamohit) for the complete overview.

## Future Work

I also tried my hands on a few tasks which I couldn't accomplish. For example,
* A user was getting expection with boost::signals2 [here](https://github.com/mono/CppSharp/issues/861). I tried fixing this but with little luck. So, finally I just compiled all my efforts for this issue in a doc and left it as a comment there on the issue. I would like to work on this again in future.
* Publishing the Linux and macOS binaries from Travis to GitHub : I gave this a try in my initial days and this is almost done. Just there were some issues with macOS dylibs which needs to be resolved before I can get this working. But, since this wasn't much high on the priority list then, so I left it for later. And, would try to do it later on.
* [Bind delegates with higher-level managed types](https://github.com/mono/CppSharp/issues/511) : I attempted this one for a while, but  then wasn't confident enough about my knowledge of delegates so I left it and moved on to solve other issues. But, now I since I've already solved few issues that concern delegates, I feel much more confident. I'd love to give this a shot again after the summer. I just hope I get it right this time.
* I'd love to ask the maintainers for more work that I could do and keep learning this way, whenever I get enough time.

## I wish, I had enough words to show my gratitude, but I'll make an attempt anyways

Well, this might sound an extravaganza. But, let me acknowledge this fact that I was once very nervous about this project and now finally I've played my part in a better way than I anticipated. This would have never been possible if I wasn't having my super cool mentor Joao Matos and the extremely helpful, Dimitar Dobrev (he is an active contributer to CppSharp) to help me out. And, of course thank you Kimon (he was working on CppSharp this summer as a fellow student). Kimon helped me with loads of motivation throughout and we became good friends with discussions varying from CppSharp's code to Greek and Indian culture. So, birth to a cross-border friendship.

In the end, I'd like to thank Mono organisation and Google for letting me this opportunity to learn and providing me such a good platform to facilitate the process.

All of it, from top to bottom was a really amazing experience and I'm very happy to be a part of a project as great as CppSharp. What I did for CppSharp, is just a single brick in the huge building but still enough for a beginner like me to cherish!! :)