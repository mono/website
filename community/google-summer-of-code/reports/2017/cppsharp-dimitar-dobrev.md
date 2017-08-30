---
title: "CppSharp / Continue Mono/.NET bindings for QtSharp (Dimitar Dobrev)"
---

Author:  [Dimitar Dobrev](https://github.com/ddobrev)

# Summary

This summer was not as successful for QtSharp itself as it was for its underlying generator of CppSharp. There are two main reasons for this.

One is that the very first task for QtSharp, type maps, required support for templates. They proved extremely difficult both to plan and to implement. This requirement was further complicated by the fact that support for templates had to be generalised so that it can enter CppSharp rather than just QtSharp. This way everyone can use them and even if I had hacked it just in QtSharp, sooner or later somebody would have had to double the effort by porting it away.

The second reason is that as I am also the maintainter of CppSharp, I had to spare some of my available time fixing users' issues. CppSharp had reached production status even before the summer had started and many people relied on it for their bindings. It was impossible to constantly ignore them because that would have endangered the trust in the project and eroded its user base and therefore the project itself. And without it, QtSharp would have stopped functioning too.

As a result, of the 5 sub-tasks the first one is half-complete while the rest have yet to be started.

# Work

As explained above, templates are what took most of my time and effort during the summer. I am going to explain the problem they present, the approach I came up with to solve it and the progress of its implementation so far.

## Problem

Templates serve the same purpose as generic classes in .NET but they are very different in implementation. A simple template class looks like this:

```cpp
template <typename T>
class DLL_API DependentValueFields : public Base<T>
{
public:
    class Nested
    {
    };
    DependentValueFields();
    ~DependentValueFields();
    DependentValueFields& returnInjectedClass();
    DependentValueFields returnValue();
    DependentValueFields operator+(const DependentValueFields& other);
    T getDependentValue();
    void setDependentValue(const T& value);
private:
    T field{};
    union {
        int unionField;
    };
};
```

C++ is a compiled language so it lacks a virtual machine to produce the necessary binary code for specialisations of templates. This means that any specialisations must be compiled in advance since an external C++ library cannot "know" what specialisations it's going to need. Therefore when working in C++, specialisations are compiled to where they are used i.e. the programmer's own code. This is obviously impossible in the case of CppSharp because there's no C++ of the user's.

## Approach

Consequently a new approach is required. There were two major routes to take:
1. Manual - consists of implementing each template in the target language. This would work with any type arguments but it is a large amount of work, per template and per binding. In addition, interaction with the bound C++ is impossible because in order to pass such an object to native code, it still has to be properly marshalled and this is simply impossible with random type arguments. For these reasons, I have completely ruled this option out even though it would have worked for just QtSharp rather than CppSharp in general;
2. Automatic - consists of wrapping a subset of the specialisations, most often the ones already used in the wrapped library. This only provides partial support but it's adequate for interacting with the C++ original. Because the place of the support of templates is in CppSharp rather than QtSharp as explained at the beginning, and this approach is universal as CppSharp is, this has been my choice. It has, however, the additional requirement to generate and compile C++ for all used specialisations. The reason is that C++ compilers only emit object code within the external library when specialisations are used for fields as an optimisation technique. In any other cases, such as parameters, specialisations are compiled to the user's C++ which we are here forced to simulate ourselves.

Automatic, however, is too broad a term. There are many ways to automate binding of templates, some of them listed below:
1. Generate a separate class for each specialisation - this involves the syntax for regular rather than generic classes. It is the approach used by SWIG and other generators. I have ruled it out mostly because the resulting API looks and feels different than the original C++ and also forces on users knowledge about templates and their representation which they don't necessarily need or care about. There's one more reason not to use this approach and it is that it lacks polymorphism unless a fake base class is introduced for all specialisations, and even that would only work in some cases. This approach can only be applied to the marshalling structures and I have done so:

```csharp
[StructLayout(LayoutKind.Explicit, Size = 8)]
public unsafe partial struct __Internalc__S_DependentValueFields__b
{
    [FieldOffset(0)]
    internal byte field;

    [FieldOffset(4)]
    internal global::CSharp.DependentValueFields._.__Internal _;
}

[StructLayout(LayoutKind.Explicit, Size = 12)]
public unsafe partial struct __Internalc__S_DependentValueFields____S_IndependentFields__I
{
    [FieldOffset(0)]
    internal global::CSharp.IndependentFields.__Internal field;

    [FieldOffset(8)]
    internal global::CSharp.DependentValueFields._.__Internal _;
}

[StructLayout(LayoutKind.Explicit, Size = 8)]
public unsafe partial struct __Internalc__S_DependentValueFields____S_T1
{
    [FieldOffset(0)]
    internal global::CSharp.T1.__Internal field;

    [FieldOffset(4)]
    internal global::CSharp.DependentValueFields._.__Internal _;
}
```

2. Generate one generic class with no methods in it and place all specialised methods in extensions - this is similar to the above but it has the advantage of providing a more natural syntax. On the other hand, since only the supported specialisations have extensions, the auto-completion would simply not show any members for unsupported ones. Virtual methods can be simulated too by calling regular protected internal methods in the class. That would be a step away from the real API but it's acceptable because they are at least not public. Unfortunately, the approach also has disadvantages, minor (no properties as extensions may only be methods), major (lack of polymorphism just as in the the first approach) and decisive (impossible to implement interface which is crucial in many cases, such as ``IList`` for ``std::vector`` or ``QList``). The last one caused me to rule this approach out too;
3. Generate one generic class with each method containing a switch by type arguments - in each switch case the respective native code for the matched specialisation is called. If the user has provided unsupported type arguments, he gets an exception at run-time which explains in detail what happened. It is quite inconvenient to receive no warning about such an issue at compilation time but such a disadvantage is not as big as the ones the other two approaches have so this is my final choice. It would have worked if "where" constraints for generics could specify multiple conditions chained with a logical "or" but this is unfortunately not supported by C# and .NET:

```csharp
public IndependentFields()
    : this((void*) null)
{
    var __T = typeof(T);
    if (__T.IsAssignableFrom(typeof(int)))
    {
        ...
        global::CSharp.IndependentFields.__Internal.ctorc__S_IndependentFields__I((__Instance + __PointerAdjustment));
        return;
    }
    if (__T.IsAssignableFrom(typeof(bool)))
    {
        ...
        global::CSharp.IndependentFields.__Internal.ctorc__S_IndependentFields__b((__Instance + __PointerAdjustment));
        return;
    }
    if (__T.IsAssignableFrom(typeof(global::CSharp.T1)))
    {
        ...
        global::CSharp.IndependentFields.__Internal.ctorc__S_IndependentFields____S_T1((__Instance + __PointerAdjustment));
        return;
    }
    if (__T.IsAssignableFrom(typeof(string)))
    {
        ...
        global::CSharp.IndependentFields.__Internal.ctorc__S_IndependentFields____N_std_S_basic_string__C___N_std_S_char_traits__C___N_std_S_allocator__C((__Instance + __PointerAdjustment));
        return;
    }
    throw new ArgumentOutOfRangeException("T", string.Join(", ", new[] { typeof(T).FullName }), "global::CSharp.IndependentFields<T> maps a C++ template class and therefore it only supports a limited set of types and their subclasses: <int>, <bool>, <global::CSharp.T1>, <string>.");
}
```

## Implementation

Once I had settled on the way to port them, I started work. For now templates are only supported in the C# generator. There were two major efforts, to make the generator capable of producing the generic syntax and to fix all cases of the various types of members, such as constructors, methods, properties and indexers. There was one problem which unfortunately forced me to partially involve the second automatic approach. I need to explain it with some C++ code:

```cpp
template <typename T>
class HasMethodReturningDependentPointer
{
public:
    const T* returnDependentPointer();
};
```

Now imagine we specialise this using our generated C#:

```csharp
HasMethodReturningDependentPointer<char>
```

In this case ``returnDependentPointer`` would return ``const char*`` in C++. However, ``const char*`` is represented as a string in C#. Since C# does not support pointers to type arguments, the returned ``const T*`` in C++ would be represented as just ``T`` in C#. So the C# wrapper of ``returnDependentPointer`` would return just ``char`` in the case of this specialisation which cannot be cast to string which is what ``const char*`` is represented as. The same goes in the other direction, parameters with a ``const T*`` type. This forces any methods taking or returning a pointer to a type argument to be moved to extension methods, one per specialisation. It might require revision in the future because of interfaces i.e. the very reason I ruled the second automatic approach out:

```csharp
public unsafe static partial class BasicStringExtensions
{
    [StructLayout(LayoutKind.Explicit, Size = 0)]
    public partial struct __Internal
    {
        ...

        [SuppressUnmanagedCodeSecurity]
        [DllImport("Std-symbols", CallingConvention = global::System.Runtime.InteropServices.CallingConvention.Cdecl,
            EntryPoint="?c_str@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAPEBDXZ")]
        internal static extern global::System.IntPtr CStr(global::System.IntPtr instance);
    }

    ...

    public static string CStr(this global::Std.BasicString<char, global::Std.CharTraits<char>, global::Std.Allocator<char>> @this)
    {
        var __arg0 = ReferenceEquals(@this, null) ? global::System.IntPtr.Zero : @this.__Instance;
        var __ret = __Internal.CStr(__arg0);
        return Marshal.PtrToStringAnsi(__ret);
    }
}
```

## Remaining work

Once I overcame the major problems, work was a matter of running QtSharp and then fixing any invalid generated code as needed. Fortunately, each separate case could be fully tested so there are going to be no regressions. There are two major problems remaining:
1. Removal of invalid specialised methods from the generated C++ - bodies of templated functions may include method calls, most often operators, involving type arguments. This cannot always work because a type argument might lack the required members. A simple example is a template list class with an method which finds the index of an object by using comparison. This problem can be solved by using the ``clang::Sema`` class and its ``InstantiateFunctionDefinition``. I would like to insert my special thanks to my mentor Joao Matos who had the brilliant idea of me compiling the offending code with my locally compiled Clang copy in order to see the right function in the stack trace. This function reports errors when the passed declaration cannot be compiled. So I can detect such functions early on and ignore then before they reach code generation. It has, however, yet to be done;
2. Support for type arguments external to the library the template itself is in - I can use Qt as an example. ``QList`` is in ``QtCore``, ``QWidget`` is in ``QtWidgets`` which depends on ``QtCore``. So ``QList<QWidget>`` has to be supported but it cannot directly. If it's simply added to the switch case, the generated code will not compile because of missing internal representations. Therefore I am going to create dictionaries taking a key pointing to the specialisation (such as its Clang USR) and a lambda to call each function, with the functions located in the external library. This is also not completed yet.

Once the issues above are resolved, CppSharp is going to enjoy fully functional support for templates, which means QtSharp and any other binding would get them for free.

# Commits

This is a list of all my commits for the summer:

[https://github.com/mono/CppSharp/commit/f954a072e2049899d9c56e38bc3a70126f179c37](https://github.com/mono/CppSharp/commit/f954a072e2049899d9c56e38bc3a70126f179c37)

[https://github.com/mono/CppSharp/commit/8479ed3735b0e88b9dd816993bf8a0f0028e711f](https://github.com/mono/CppSharp/commit/8479ed3735b0e88b9dd816993bf8a0f0028e711f)

[https://github.com/mono/CppSharp/commit/51fe04b666572f695900aa8e664423b9e5026035](https://github.com/mono/CppSharp/commit/51fe04b666572f695900aa8e664423b9e5026035)

[https://github.com/mono/CppSharp/commit/b77de1a36c226548bbb738cad2b3b8590fcaef32](https://github.com/mono/CppSharp/commit/b77de1a36c226548bbb738cad2b3b8590fcaef32)

[https://github.com/mono/CppSharp/commit/1895ae3b94e795903da7e5fd034c72d6c2f62741](https://github.com/mono/CppSharp/commit/1895ae3b94e795903da7e5fd034c72d6c2f62741)

[https://github.com/mono/CppSharp/commit/3794047cd6bd4b86be9dc72ae5d3cda43a701f93](https://github.com/mono/CppSharp/commit/3794047cd6bd4b86be9dc72ae5d3cda43a701f93)

[https://github.com/mono/CppSharp/commit/a6b25c19413f3cae2b3b0183d385e5ff69daf549](https://github.com/mono/CppSharp/commit/a6b25c19413f3cae2b3b0183d385e5ff69daf549)

[https://github.com/mono/CppSharp/commit/b83d2a504ae58d1f952bcc836f1423b5f8e20fa7](https://github.com/mono/CppSharp/commit/b83d2a504ae58d1f952bcc836f1423b5f8e20fa7)

[https://github.com/mono/CppSharp/commit/49badc5d84c628edb8673fef952df89f13a0331c](https://github.com/mono/CppSharp/commit/49badc5d84c628edb8673fef952df89f13a0331c)

[https://github.com/mono/CppSharp/commit/1f61f51b4ec062aafe0a023b049e4fe7493ee5e3](https://github.com/mono/CppSharp/commit/1f61f51b4ec062aafe0a023b049e4fe7493ee5e3)

[https://github.com/mono/CppSharp/commit/d487088f536ef1c29b0bd658ad10307ac592cd03](https://github.com/mono/CppSharp/commit/d487088f536ef1c29b0bd658ad10307ac592cd03)

[https://github.com/mono/CppSharp/commit/91bcc7c8a2a2f8b7bff06c18e5d647586d378a91](https://github.com/mono/CppSharp/commit/91bcc7c8a2a2f8b7bff06c18e5d647586d378a91)

[https://github.com/mono/CppSharp/commit/762d3803d705877666d5df670cab79e149b8d1d7](https://github.com/mono/CppSharp/commit/762d3803d705877666d5df670cab79e149b8d1d7)

[https://github.com/mono/CppSharp/commit/c740a34dfaa719d72c23fbe01a53bb6bce675820](https://github.com/mono/CppSharp/commit/c740a34dfaa719d72c23fbe01a53bb6bce675820)

[https://github.com/mono/CppSharp/commit/c3f5b596cedf8060af2783bfeb310b7bf40118d9](https://github.com/mono/CppSharp/commit/c3f5b596cedf8060af2783bfeb310b7bf40118d9)

[https://github.com/mono/CppSharp/commit/37adb3efc9f7709d4ddead328db755cf8faaac46](https://github.com/mono/CppSharp/commit/37adb3efc9f7709d4ddead328db755cf8faaac46)

[https://github.com/mono/CppSharp/commit/cfc6da4600d4c6a2fea5255302cca97441055a33](https://github.com/mono/CppSharp/commit/cfc6da4600d4c6a2fea5255302cca97441055a33)

[https://github.com/mono/CppSharp/commit/6c59014d7a0f57ab11ee82a04b59dcb50da6d4ac](https://github.com/mono/CppSharp/commit/6c59014d7a0f57ab11ee82a04b59dcb50da6d4ac)

[https://github.com/mono/CppSharp/commit/f729414ae7318019156eefbd33d022e93a547fa7](https://github.com/mono/CppSharp/commit/f729414ae7318019156eefbd33d022e93a547fa7)

[https://github.com/mono/CppSharp/commit/422b98a0fd85a60544ed8c382d98123ec217ddb8](https://github.com/mono/CppSharp/commit/422b98a0fd85a60544ed8c382d98123ec217ddb8)

[https://github.com/mono/CppSharp/commit/2f99e83b85c79da1fa5067ce2c963f0274cb9248](https://github.com/mono/CppSharp/commit/2f99e83b85c79da1fa5067ce2c963f0274cb9248)

[https://github.com/mono/CppSharp/commit/3d9b8df2e3b881ca5bf1c9b34793af206fbdbf8e](https://github.com/mono/CppSharp/commit/3d9b8df2e3b881ca5bf1c9b34793af206fbdbf8e)

[https://github.com/mono/CppSharp/commit/e04afb8bd572e56f7649b52431a3c0d9482aec0e](https://github.com/mono/CppSharp/commit/e04afb8bd572e56f7649b52431a3c0d9482aec0e)

[https://github.com/mono/CppSharp/commit/d7daed827373e52ab5e365640be4b2770f9acb6f](https://github.com/mono/CppSharp/commit/d7daed827373e52ab5e365640be4b2770f9acb6f)

[https://github.com/mono/CppSharp/commit/f946eea70e8127b09264715fb73595978e56fe9a](https://github.com/mono/CppSharp/commit/f946eea70e8127b09264715fb73595978e56fe9a)

[https://github.com/mono/CppSharp/commit/cbd1e0e53c730bd719d9ede313ef31d6d9d9e0fb](https://github.com/mono/CppSharp/commit/cbd1e0e53c730bd719d9ede313ef31d6d9d9e0fb)

[https://github.com/mono/CppSharp/commit/dc270ef2a8d70cd79f1a33d58c56e48a0c829d31](https://github.com/mono/CppSharp/commit/dc270ef2a8d70cd79f1a33d58c56e48a0c829d31)

[https://github.com/mono/CppSharp/commit/54f3af1459eddfe224022adb5a1b507777d339dc](https://github.com/mono/CppSharp/commit/54f3af1459eddfe224022adb5a1b507777d339dc)

[https://github.com/mono/CppSharp/commit/9f4d501d0be971f7c56e3a746b9a865c33e1b5f8](https://github.com/mono/CppSharp/commit/9f4d501d0be971f7c56e3a746b9a865c33e1b5f8)

[https://github.com/mono/CppSharp/commit/3a3d003eb8e0817f9984afa19c0fa9c7e78416d2](https://github.com/mono/CppSharp/commit/3a3d003eb8e0817f9984afa19c0fa9c7e78416d2)

[https://github.com/mono/CppSharp/commit/d9960538afa99566aaede6e326634645de67818a](https://github.com/mono/CppSharp/commit/d9960538afa99566aaede6e326634645de67818a)

[https://github.com/mono/CppSharp/commit/a7cf9844861d616ed4ee5c41905a9c235ee20584](https://github.com/mono/CppSharp/commit/a7cf9844861d616ed4ee5c41905a9c235ee20584)

[https://github.com/mono/CppSharp/commit/9c0f80f69d505654fce384b8b1214d3af96974ae](https://github.com/mono/CppSharp/commit/9c0f80f69d505654fce384b8b1214d3af96974ae)

[https://github.com/mono/CppSharp/commit/1dc5c34662d3f99467cc484c5d886ae8ed52b733](https://github.com/mono/CppSharp/commit/1dc5c34662d3f99467cc484c5d886ae8ed52b733)

[https://github.com/mono/CppSharp/commit/a15aa8f921a4e59e0b94353f2f1d9014c4cd85bc](https://github.com/mono/CppSharp/commit/a15aa8f921a4e59e0b94353f2f1d9014c4cd85bc)

[https://github.com/mono/CppSharp/commit/898001fecd0db605d1fba4828516dc08c85392bb](https://github.com/mono/CppSharp/commit/898001fecd0db605d1fba4828516dc08c85392bb)

[https://github.com/mono/CppSharp/commit/6a414939e598c17176bac69c761a780bc1cca926](https://github.com/mono/CppSharp/commit/6a414939e598c17176bac69c761a780bc1cca926)

[https://github.com/mono/CppSharp/commit/fa9652aa7251b132b64c431c65c8bb2e2a8f5c20](https://github.com/mono/CppSharp/commit/fa9652aa7251b132b64c431c65c8bb2e2a8f5c20)

[https://github.com/mono/CppSharp/commit/f6466471591306c612dfa36f9607e4be379596cc](https://github.com/mono/CppSharp/commit/f6466471591306c612dfa36f9607e4be379596cc)

[https://github.com/mono/CppSharp/commit/351bae6bb67abae032ff8a434c0b73665b616b15](https://github.com/mono/CppSharp/commit/351bae6bb67abae032ff8a434c0b73665b616b15)

[https://github.com/mono/CppSharp/commit/40e6abbd221db717a52da51ab75b6ba115346c41](https://github.com/mono/CppSharp/commit/40e6abbd221db717a52da51ab75b6ba115346c41)

[https://github.com/mono/CppSharp/commit/f4d925945022d1465a77c7663e20bff4ad794107](https://github.com/mono/CppSharp/commit/f4d925945022d1465a77c7663e20bff4ad794107)

[https://github.com/mono/CppSharp/commit/1084dcc1df92d79f90d2b9589333663550e97f42](https://github.com/mono/CppSharp/commit/1084dcc1df92d79f90d2b9589333663550e97f42)

[https://github.com/mono/CppSharp/commit/6918d9d76906b53a296bb1a858e27a5c3259b766](https://github.com/mono/CppSharp/commit/6918d9d76906b53a296bb1a858e27a5c3259b766)

[https://github.com/mono/CppSharp/commit/617e7c78d81f7bcc47fff6372a8d86353fda0575](https://github.com/mono/CppSharp/commit/617e7c78d81f7bcc47fff6372a8d86353fda0575)

[https://github.com/mono/CppSharp/commit/9b0e0ba6117eef1db5f270010416c902d3154988](https://github.com/mono/CppSharp/commit/9b0e0ba6117eef1db5f270010416c902d3154988)

[https://github.com/mono/CppSharp/commit/3aea79af7f065c1eadd9e9c6498246f6c7527d88](https://github.com/mono/CppSharp/commit/3aea79af7f065c1eadd9e9c6498246f6c7527d88)

[https://github.com/mono/CppSharp/commit/678496acbb42b28f4bf28a1eabaed06495e28cbd](https://github.com/mono/CppSharp/commit/678496acbb42b28f4bf28a1eabaed06495e28cbd)

[https://github.com/mono/CppSharp/commit/081b111dc7a99e5e98f4bd857d58aba700743fd5](https://github.com/mono/CppSharp/commit/081b111dc7a99e5e98f4bd857d58aba700743fd5)

[https://github.com/mono/CppSharp/commit/2002377f27a182476311a070390f1d5e49316ab1](https://github.com/mono/CppSharp/commit/2002377f27a182476311a070390f1d5e49316ab1)

[https://github.com/mono/CppSharp/commit/cece243a06a1d8766870b3ef231bb9d9ecc934b6](https://github.com/mono/CppSharp/commit/cece243a06a1d8766870b3ef231bb9d9ecc934b6)

[https://github.com/mono/CppSharp/commit/e62651a9544b27ff70c83a7f28c7d19673209710](https://github.com/mono/CppSharp/commit/e62651a9544b27ff70c83a7f28c7d19673209710)

[https://github.com/mono/CppSharp/commit/0124c434392d74d932590ed42b9dd134bec3786c](https://github.com/mono/CppSharp/commit/0124c434392d74d932590ed42b9dd134bec3786c)

[https://github.com/mono/CppSharp/commit/49104ee0bff352d5f2874480fbd02ad4ec751514](https://github.com/mono/CppSharp/commit/49104ee0bff352d5f2874480fbd02ad4ec751514)

[https://github.com/mono/CppSharp/commit/cf98ecd36e951f42fa6061e151eb80921366281e](https://github.com/mono/CppSharp/commit/cf98ecd36e951f42fa6061e151eb80921366281e)

[https://github.com/mono/CppSharp/commit/e2e41096313a6eb1882109c23e18b2929926e2ce](https://github.com/mono/CppSharp/commit/e2e41096313a6eb1882109c23e18b2929926e2ce)

[https://github.com/mono/CppSharp/commit/8cb7207df770da1cf57a3e08a3945ecee361129e](https://github.com/mono/CppSharp/commit/8cb7207df770da1cf57a3e08a3945ecee361129e)

[https://github.com/mono/CppSharp/commit/845bf5b7f17c7a6c673b48963622cc704dd2bf2b](https://github.com/mono/CppSharp/commit/845bf5b7f17c7a6c673b48963622cc704dd2bf2b)

[https://github.com/mono/CppSharp/commit/0ecb7fc156948b6dc8447641f332ae84b8ed0475](https://github.com/mono/CppSharp/commit/0ecb7fc156948b6dc8447641f332ae84b8ed0475)

[https://github.com/mono/CppSharp/commit/0c22c4deb7cd0fc2b8699da184cc10ef1cc12cb3](https://github.com/mono/CppSharp/commit/0c22c4deb7cd0fc2b8699da184cc10ef1cc12cb3)

[https://github.com/mono/CppSharp/commit/e0367c56019393091f8f4de624e2328482ab5b8d](https://github.com/mono/CppSharp/commit/e0367c56019393091f8f4de624e2328482ab5b8d)

[https://github.com/mono/CppSharp/commit/d3e8cc51d5f9cf1781b6f4a9ca6c3c2d2392137b](https://github.com/mono/CppSharp/commit/d3e8cc51d5f9cf1781b6f4a9ca6c3c2d2392137b)

[https://github.com/mono/CppSharp/commit/2f2f13f352635c6cb4b02ac6d8f45ee59bc3034d](https://github.com/mono/CppSharp/commit/2f2f13f352635c6cb4b02ac6d8f45ee59bc3034d)

[https://github.com/mono/CppSharp/commit/8b9c3ab89fb00998b4236c5ce65b250087099883](https://github.com/mono/CppSharp/commit/8b9c3ab89fb00998b4236c5ce65b250087099883)

[https://github.com/mono/CppSharp/commit/d2426a7db63f16ccbc39beb13f8e1b13d08f87a2](https://github.com/mono/CppSharp/commit/d2426a7db63f16ccbc39beb13f8e1b13d08f87a2)

[https://github.com/mono/CppSharp/commit/f9a8798b8fd7e7013db28bebbb76d18ec3418ca5](https://github.com/mono/CppSharp/commit/f9a8798b8fd7e7013db28bebbb76d18ec3418ca5)

[https://github.com/mono/CppSharp/commit/4a0167e10ce8bff0cce3f02c4e7ae6512c518034](https://github.com/mono/CppSharp/commit/4a0167e10ce8bff0cce3f02c4e7ae6512c518034)

[https://github.com/mono/CppSharp/commit/b71a37d15457aadb82378c2038ce3c122bcd6e58](https://github.com/mono/CppSharp/commit/b71a37d15457aadb82378c2038ce3c122bcd6e58)

[https://github.com/mono/CppSharp/commit/f16c229f27faf6c61501aa973a4ed1fb07084f9c](https://github.com/mono/CppSharp/commit/f16c229f27faf6c61501aa973a4ed1fb07084f9c)

[https://github.com/mono/CppSharp/commit/46b40bbe054e488af62186265b0408d2b4370bd3](https://github.com/mono/CppSharp/commit/46b40bbe054e488af62186265b0408d2b4370bd3)

[https://github.com/mono/CppSharp/commit/787798f2bdc2670f472719c39b29d7ab50f2dc32](https://github.com/mono/CppSharp/commit/787798f2bdc2670f472719c39b29d7ab50f2dc32)

[https://github.com/mono/CppSharp/commit/47633db649889f9a88a9c0008e658cc3a8e1f1a4](https://github.com/mono/CppSharp/commit/47633db649889f9a88a9c0008e658cc3a8e1f1a4)

[https://github.com/mono/CppSharp/commit/2f0956249d1474c0daf970a3c9fd7b08d8b2736b](https://github.com/mono/CppSharp/commit/2f0956249d1474c0daf970a3c9fd7b08d8b2736b)

[https://github.com/mono/CppSharp/commit/2af1af64046d6a16a8433c4be8fd9df7e8571857](https://github.com/mono/CppSharp/commit/2af1af64046d6a16a8433c4be8fd9df7e8571857)

[https://github.com/mono/CppSharp/commit/225cd5c49b23eae1823f2600647a2b09dc3296c6](https://github.com/mono/CppSharp/commit/225cd5c49b23eae1823f2600647a2b09dc3296c6)

[https://github.com/mono/CppSharp/commit/cd548059e941685916acd6128e4a40d716cb3e5a](https://github.com/mono/CppSharp/commit/cd548059e941685916acd6128e4a40d716cb3e5a)

[https://github.com/mono/CppSharp/commit/38ed4ab472e5b58dac882b9034bf9fa7729abc55](https://github.com/mono/CppSharp/commit/38ed4ab472e5b58dac882b9034bf9fa7729abc55)

[https://github.com/mono/CppSharp/commit/e078968cf264b151dc618969fa9399bbca3f7f7e](https://github.com/mono/CppSharp/commit/e078968cf264b151dc618969fa9399bbca3f7f7e)

[https://github.com/mono/CppSharp/commit/075b2d5078a275f9dc460d545f4d10d4047011c4](https://github.com/mono/CppSharp/commit/075b2d5078a275f9dc460d545f4d10d4047011c4)

[https://github.com/mono/CppSharp/commit/ea90ce745a88d61301180bb3ee8b317fcc8deece](https://github.com/mono/CppSharp/commit/ea90ce745a88d61301180bb3ee8b317fcc8deece)

[https://github.com/mono/CppSharp/commit/8bb567c49e79809c3ccb85146d794c2e61456648](https://github.com/mono/CppSharp/commit/8bb567c49e79809c3ccb85146d794c2e61456648)

[https://github.com/mono/CppSharp/commit/ff1abf360feca8501ce091212ecc5d94d91c9126](https://github.com/mono/CppSharp/commit/ff1abf360feca8501ce091212ecc5d94d91c9126)

[https://github.com/mono/CppSharp/commit/23e7dec1f56a6d1e8597c1dedcf8b34be7503cd0](https://github.com/mono/CppSharp/commit/23e7dec1f56a6d1e8597c1dedcf8b34be7503cd0)

[https://github.com/mono/CppSharp/commit/108bf7505347208bc075a14a9bb3fab5de02f73b](https://github.com/mono/CppSharp/commit/108bf7505347208bc075a14a9bb3fab5de02f73b)

[https://github.com/mono/CppSharp/commit/401e26a63f65a8c7009cb818d128989b3875d0fa](https://github.com/mono/CppSharp/commit/401e26a63f65a8c7009cb818d128989b3875d0fa)

[https://github.com/mono/CppSharp/commit/0e341db99cb10fc9c4da20337822448255ac3c9c](https://github.com/mono/CppSharp/commit/0e341db99cb10fc9c4da20337822448255ac3c9c)

[https://github.com/mono/CppSharp/commit/aab4e6587a1451ec40df4c3a80cf2364984f92f4](https://github.com/mono/CppSharp/commit/aab4e6587a1451ec40df4c3a80cf2364984f92f4)

[https://github.com/mono/CppSharp/commit/9fdb9a3dc212f0796b04278adbc9fff9a4973ebe](https://github.com/mono/CppSharp/commit/9fdb9a3dc212f0796b04278adbc9fff9a4973ebe)

[https://github.com/mono/CppSharp/commit/dd885a7541f529b3f34068d96983c692f8119f99](https://github.com/mono/CppSharp/commit/dd885a7541f529b3f34068d96983c692f8119f99)

[https://github.com/mono/CppSharp/commit/ee174c164960bd015cc3404f842f7822f55e200c](https://github.com/mono/CppSharp/commit/ee174c164960bd015cc3404f842f7822f55e200c)

[https://github.com/mono/CppSharp/commit/e7a34904ddfa1b3eb88a412a7cced2f099437339](https://github.com/mono/CppSharp/commit/e7a34904ddfa1b3eb88a412a7cced2f099437339)

[https://github.com/mono/CppSharp/commit/27acdd262e99e5b9c2cea455a58a3413650f3e09](https://github.com/mono/CppSharp/commit/27acdd262e99e5b9c2cea455a58a3413650f3e09)

[https://github.com/mono/CppSharp/commit/9294ea09783f5c4f448b42925be24468b55084d6](https://github.com/mono/CppSharp/commit/9294ea09783f5c4f448b42925be24468b55084d6)

[https://github.com/mono/CppSharp/commit/95b8405b285c8abff55102d30284f7873a4a8e01](https://github.com/mono/CppSharp/commit/95b8405b285c8abff55102d30284f7873a4a8e01)

[https://github.com/mono/CppSharp/commit/51c5ef8fea86e09548db38b57289ce63a2ed4c81](https://github.com/mono/CppSharp/commit/51c5ef8fea86e09548db38b57289ce63a2ed4c81)

[https://github.com/mono/CppSharp/commit/e0816d9dc62e955c3f8676a83720a7c1574404c4](https://github.com/mono/CppSharp/commit/e0816d9dc62e955c3f8676a83720a7c1574404c4)

[https://github.com/mono/CppSharp/commit/2bff7a3caa6729e7388dd4d684fcf7bb8a522659](https://github.com/mono/CppSharp/commit/2bff7a3caa6729e7388dd4d684fcf7bb8a522659)

[https://github.com/mono/CppSharp/commit/1c81a92061488347be398d8c95d311e7fcc9d052](https://github.com/mono/CppSharp/commit/1c81a92061488347be398d8c95d311e7fcc9d052)

[https://github.com/mono/CppSharp/commit/f81800521cd0841efba7e5024f41fd88f632b58d](https://github.com/mono/CppSharp/commit/f81800521cd0841efba7e5024f41fd88f632b58d)

[https://github.com/mono/CppSharp/commit/94c083833746c55cbb19b8508e02f88a356f933d](https://github.com/mono/CppSharp/commit/94c083833746c55cbb19b8508e02f88a356f933d)

[https://github.com/mono/CppSharp/commit/b955068ad145b63e1326e9cb1d8cb1ab5f97ba18](https://github.com/mono/CppSharp/commit/b955068ad145b63e1326e9cb1d8cb1ab5f97ba18)

[https://github.com/mono/CppSharp/commit/3b863cc6ff2203313e684b47f9a33e397bbd6de6](https://github.com/mono/CppSharp/commit/3b863cc6ff2203313e684b47f9a33e397bbd6de6)

[https://github.com/mono/CppSharp/commit/173c1cd7b722a4201e0af0d7f3becc8092bc55ae](https://github.com/mono/CppSharp/commit/173c1cd7b722a4201e0af0d7f3becc8092bc55ae)

[https://github.com/mono/CppSharp/commit/27481289d6b3e16bc99db1681086c2175f31c8d0](https://github.com/mono/CppSharp/commit/27481289d6b3e16bc99db1681086c2175f31c8d0)

[https://github.com/mono/CppSharp/commit/20fcb1943631d865b467c13be1a11da1cdc19915](https://github.com/mono/CppSharp/commit/20fcb1943631d865b467c13be1a11da1cdc19915)

[https://github.com/mono/CppSharp/commit/4d177b317dbefe7642f66d004b62722e182d7cf7](https://github.com/mono/CppSharp/commit/4d177b317dbefe7642f66d004b62722e182d7cf7)

[https://github.com/mono/CppSharp/commit/a056659d093e3f51d7cc664d90157a3756560fed](https://github.com/mono/CppSharp/commit/a056659d093e3f51d7cc664d90157a3756560fed)

[https://github.com/mono/CppSharp/commit/f33b162f6fdd1d814cfa62a94d3d46b78065ff7d](https://github.com/mono/CppSharp/commit/f33b162f6fdd1d814cfa62a94d3d46b78065ff7d)

[https://github.com/mono/CppSharp/commit/faa9512a84b0af4914efb804a7ca3b58db8a8e15](https://github.com/mono/CppSharp/commit/faa9512a84b0af4914efb804a7ca3b58db8a8e15)

[https://github.com/mono/CppSharp/commit/f17441f371bcc42922617d15bfd8ce1953938306](https://github.com/mono/CppSharp/commit/f17441f371bcc42922617d15bfd8ce1953938306)

[https://github.com/mono/CppSharp/commit/973fdafdfe06d9ed9aca06650263e0c3b0fb08d8](https://github.com/mono/CppSharp/commit/973fdafdfe06d9ed9aca06650263e0c3b0fb08d8)

[https://github.com/mono/CppSharp/commit/2f271207fd5c9a4aa1fe9ccd8e2fc789cb8055ee](https://github.com/mono/CppSharp/commit/2f271207fd5c9a4aa1fe9ccd8e2fc789cb8055ee)

[https://github.com/mono/CppSharp/commit/649df6e5e7167ff4ede1a4c41fe619497ab292f9](https://github.com/mono/CppSharp/commit/649df6e5e7167ff4ede1a4c41fe619497ab292f9)

[https://github.com/mono/CppSharp/commit/9c26b7e6487d82e8e4d91f5421fa7ade7884d666](https://github.com/mono/CppSharp/commit/9c26b7e6487d82e8e4d91f5421fa7ade7884d666)

[https://github.com/mono/CppSharp/commit/16aa74a20b95a32521052608db65b6ac588694f8](https://github.com/mono/CppSharp/commit/16aa74a20b95a32521052608db65b6ac588694f8)

[https://github.com/mono/CppSharp/commit/046c428852b33865a43d101300ce2a6344f1a60a](https://github.com/mono/CppSharp/commit/046c428852b33865a43d101300ce2a6344f1a60a)

[https://github.com/mono/CppSharp/commit/d1461fd10189bb52f0e131570559b9b3608aaa60](https://github.com/mono/CppSharp/commit/d1461fd10189bb52f0e131570559b9b3608aaa60)

[https://github.com/mono/CppSharp/commit/e89c9f98decd290481e75abd04141281eacd3e42](https://github.com/mono/CppSharp/commit/e89c9f98decd290481e75abd04141281eacd3e42)

[https://github.com/mono/CppSharp/commit/5aaa0a035139eff4cffaf7891fa9e2f728e2675d](https://github.com/mono/CppSharp/commit/5aaa0a035139eff4cffaf7891fa9e2f728e2675d)

[https://github.com/mono/CppSharp/commit/6fa97788599d2b8e7b656777c4c4b2b6b9115d6b](https://github.com/mono/CppSharp/commit/6fa97788599d2b8e7b656777c4c4b2b6b9115d6b)
