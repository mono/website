---
title: "Lambda support in debugger expression evaluator (Haruka Matsumoto)"
---

Author: Haruka Matsumoto

# Abstract

My project is lambda support in the MonoDevelop debugger's expression evaluator, used in the Immediate pad.

# Code

All of my work is covered by a single pull request: [here](https://github.com/mono/debugger-libs/pull/142#pull)

# Summary of the implementation

![Processing flow chart](/images/gsoc-2017-lambda-support-in-debugger-expression-evaluator.png "Processing flow chart")

*Fig 1. Processing flow chart*

The debugger works using an interface called [Soft Debugger Wire Protocol](/docs/advanced/runtime/docs/soft-debugger-wire-format/) exposed by the Mono runtime. Using this protocol, the debugger controls debuggees and queries information of the debuggees like address of objects, type or methods. The debugger's evaluator usually works as an interpreter, which evaluates every part of expressions immediately. However, lambda support can not be realized in this way. We don't know when the debuggees invoke lambdas. The code of a lambda needs to stay invocable in the debuggees. This is how lambda expressions are different from other ones for the debugger's evaluator.

There are 2 tasks to support lambdas:

* Task 1: Compile lambda expression using [Roslyn](https://github.com/dotnet/roslyn) API
* Task 2: Inject compiled assembly to runtime through the Soft Debugger Protocol

We firstly resolve references outside the lambda like local variables/properties (e.g., `x` in `a => a + x`) in order to reproduce the current context of the debuggee. Then we compile something like the following code with assemblies currently loaded in the debuggee, and get a .dll.

```csharp
public class Injected_
{
    public static [lambda-type] injected_method([local-variables-list])
    {
        return [lambda-expression]
    }
}
```

`lambda-type` in the example above is a type name for lambda (e.g., `Func<int, int>`), `local-variables-list` is comma separated pairs of a type and variable name for local variables (e.g., `int y, int z`), and `lambda-expression` is a lambda inputted by users. (e.g., `x => x + y + z`)

We send the compiled assembly to runtime, and invoke `Assembly.Load` with it in runtime. By calling `injected_method` through reflection APIs, the lambda value becomes accessible from the debugger.

# Difficulties

### Lambda types depends on debuggee's context

Lambda type resolution is delayed in this project as it's not decidable without how it is used.
When users input `(x => x + 5)`, it is undecidable which type is the most plausible out of following types.

* `System.Func<int, int>`
* `System.Func<string, string>`
* `System.Func<short, int>`
* etc...

If your C# code has `Method1(x => x + 5)` and Method1 is defined as `Method1(Func<int, int> f)`, the type of the lambda is determined to be `Func<int, int>`. This means lambda types are determined by not only themselves but also the context. In other words, we have to delay type resolution for lambdas. Lambdas will be compiled and become a value after the type is determined.

Note: in the debugger, types for expressions are usually determined in depth-first order.

We treat the body of a lambda as a black box because of lambda parameters. Even if it's possible to infer an unknown type of `x` in `x => x == 5` for example, it wouldn't be a debugger's business. Also it couldn't be realized in this project.

### Fully Qualify Method names automatically

Users can omit a path to a method (e.g., namespace) when invoking methods inside the lambda. The path will be added automatically like the following cases.

* In the debugger, if the current instance of the class has an instance method, and an user inputs `(x => instanceMethod(x))`, it will be evaluated as `(x => this.InstanceMethod(x))`
* Similarly, a lambda expression `(x => StaticMethod(x))` in static context of `ClassA` will become `(x => ClassA.StaticMethod(x))`

It's not supported invocation of static/instance overloaded methods in an instance context. This is because we have no information of types for expression inside the lambda.
(e.g., Assume that current context has `static Method2 (int x)` and `instance Method2 (string x)`. If lambda expression is `(x => Method2 (x))`, we can not resolve the overload until resolving parameters types.)

# Supported Features

Lambdas satisfying the following three conditions are supported.

1. Lambdas with cast or method invocation.
    * Lambdas with cast
        * `((Action<string>)(x => System.Console.WriteLine (x))`
        * `((Func<int>)(() => 50 * 100)).Invoke ()`
    * Lambdas with method invocation
        * `lst.Find (x => x == "bar")`

2. Public type / local variables access
3. Public `this` or `base` references

# Non-Supported Features

* Private type access
* Lambdas in some kinds of generic methods
    * Invocation of generic methods like `Method3<T> (T x, Func<T> f)` are supported because a generic type `T` can be resolved by the type of first parameter `x`.
    * However, this doesn't work: `Method4<T> (Func<T> f)`
      We have to provide type arguments so far to invoke it.
* Side Effect
    * `((Action<int>)(x => y = x)).Invoke(5)`, let y be one of local variables.
* Async Lambdas
    * MonoDevelop's expression evaluator doesn't support `await` keyword.

# Future Work

### Merge

All of code is covered by a single pull request, which is still open. Hope it'll be merged.

### Private type access

Currently, only public type access is supported. A tentative plan is following.

* when compiling:
    Skip roslyn's visibility check: [source](https://github.com/dotnet/roslyn/issues/15557#issuecomment-263560079)
* when invoking:
    Create a new command in the Soft Debugger Protocol to invoke lambda with skipping visibility: [here?](https://github.com/mono/mono/blob/master/mono/metadata/class-internals.h#L87)

### Detailed error message

* When compiling lambdas fails, we have to show the most appropriate error message, which would be difficult.
* As for methods which have lambda parameters, we make sure which type is the most plausible for each lambdas by compiling them in order to resolve overloaded/overridden. Compilation failure for all of lambdas means:
    1. Lambda body has some invalid expressions and does not compile.
    2. There is no invalid expression inside lambda, but matched method doesnot exist.
    3. Both 1. and 2.
    It's hard to tell which error of aboves only from compile error message.
* Maybe we can get better error messages by compiling code like following.

    ```csharp
    class Test {
        static int RetF (Func<int, int> f) { return 0; }
        static int RetF (Func<int, string> f) { return 1; }
        static int Test () { return RetF (x => x == "hoge"); }
    }
    ```

# Links

* Original project proposal: [here](https://docs.google.com/document/d/1BnTomd6Lgq3FT4MkNHhBkgYGFFpm4uyEDVt0Qabd4G8/edit)
* List of possible lambda features: [here](https://docs.google.com/document/d/1QkdHHI5DgPMPG-T48neOjOix34QKycStEBe0sbRGxgc/edit)
* Past updates per week: [here](https://docs.google.com/document/d/16gUJXAFVfcxCdXm3aw4Rgg268b4ZGOvyRmP0UvBO3gA/edit)
