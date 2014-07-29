---
layout: docpage
navgroup: docs
title: "Gendarme Rules: Exceptions"
redirect_from:
  - /Gendarme.Rules.Exceptions/
---

[Gendarme]({{ site.github.url }}/docs/tools+libraries/tools/gendarme/)'s rules about exceptions are located in the **Gendarme.Rules.Exceptions.dll** assembly. Latest sources are available from [anonymous SVN](http://anonsvn.mono-project.com/viewcvs/trunk/mono-tools/gendarme/rules/Gendarme.Rules.Exceptions/).

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#rules">1 Rules</a>
<ul>
<li><a href="#avoidargumentexceptiondefaultconstructorrule">1.1 AvoidArgumentExceptionDefaultConstructorRule</a></li>
<li><a href="#avoidthrowingbasicexceptionsrule">1.2 AvoidThrowingBasicExceptionsRule</a></li>
<li><a href="#donotdestroystacktracerule">1.3 DoNotDestroyStackTraceRule</a></li>
<li><a href="#donotswallowerrorscatchingnonspecificexceptionsrule">1.4 DoNotSwallowErrorsCatchingNonSpecificExceptionsRule</a></li>
<li><a href="#donotthrowinunexpectedlocationrule">1.5 DoNotThrowInUnexpectedLocationRule</a></li>
<li><a href="#donotthrowreservedexceptionrule">1.6 DoNotThrowReservedExceptionRule</a></li>
<li><a href="#exceptionshouldbevisiblerule">1.7 ExceptionShouldBeVisibleRule</a></li>
<li><a href="#instantiateargumentexceptioncorrectlyrule">1.8 InstantiateArgumentExceptionCorrectlyRule</a></li>
<li><a href="#missingexceptionconstructorsrule">1.9 MissingExceptionConstructorsRule</a></li>
<li><a href="#useobjectdisposedexceptionrule">1.10 UseObjectDisposedExceptionRule</a></li>
</ul></li>
<li><a href="#feedback">2 Feedback</a></li>
</ul></td>
</tr>
</tbody>
</table>

Rules
=====

### AvoidArgumentExceptionDefaultConstructorRule

This rule checks that every **System.ArgumentException**, **System.ArgumentNullException**, **System.ArgumentOutOfRangeException**, or **System.DuplicateWaitObjectException** exception created is provided with some useful information about the exception being thrown, minimally the parameter name.

**Bad** example:

``` csharp
public void Add (object key, object value)
{
    if ((obj == null) || (key == null)) {
        throw new ArgumentNullException ();
    }
    Inner.Add (key, value);
}
```

**Good** example:

``` csharp
public void Add (object key, object value)
{
    if (key == null) {
        throw new ArgumentNullException ("key");
    }
    if (obj == value) {
        throw new ArgumentNullException ("value");
    }
    Inner.Add (key, value);
}
```

**Notes**

-   This rule is available since Gendarme 2.0

### AvoidThrowingBasicExceptionsRule

This rule checks for methods that create basic exceptions like **System.Exception**, **System.ApplicationException** or **System.SystemException**. Those exceptions do not provide enough information about the error to be helpful to the consumer of the library.

**Bad** example:

``` csharp
public void Add (object obj)
{
    if (obj == null) {
        throw new Exception ();
    }
    Inner.Add (obj);
}
```

**Good** example:

``` csharp
public void Add (object obj)
{
    if (obj == null) {
        throw new ArgumentNullException ("obj");
    }
    Inner.Add (obj);
}
```

**Notes**

-   This rule is available since Gendarme 2.0

### DoNotDestroyStackTraceRule

This rule will fire if a catch handler throws the exception it caught. What it should do instead is rethrow the original exception (e.g. use **throw** instead of **throw ex**). This is helpful because rethrow preserves the stacktrace of the original exception.

**Bad** example:

``` csharp
try {
    Int32.Parse ("Broken!");
}
catch (Exception ex) {
    Assert.IsNotNull (ex);
    throw ex;
}
```

**Good** example:

``` csharp
try {
    Int32.Parse ("Broken!");
}
catch (Exception ex) {
    Assert.IsNotNull (ex);
    throw;
}
```

**Notes**

-   Prior to Gendarme 2.0 this rule was named DontDestroyStackTraceRule.

### DoNotSwallowErrorsCatchingNonSpecificExceptionsRule

This rule will fire if a catch block catches **System.Exception** or **System.SystemException** but does not rethrow the original exception. This is problematic because you don't know what went wrong so it's difficult to know that the error was handled correctly. It is better to catch a more specific set of exceptions so that you do know what went wrong and do know that it is handled correctly.

**Bad** example:

``` csharp
try {
    File.Open ("foo.txt", FileMode.Open);
}
catch (Exception) {
    //Ooops  what's failed ??? UnauthorizedException, FileNotFoundException ???
}
```

**Good** example (catch a specific exception):

``` csharp
try {
    File.Open ("foo.txt", FileMode.Open);
}
catch (FileNotFoundException exception) {
    //I know that the system can't find the file.
}
```

**Good** example (catch all and rethrow):

``` csharp
try {
    File.Open ("foo.txt", FileMode.Open);
}
catch {
    Console.WriteLine ("An error has happened.");
    throw;  // You don't swallow the error, because you rethrow the original exception.
}
```

**Notes**

-   Prior to Gendarme 2.0 this rule was named DontSwallowErrorsCatchingNonspecificExceptionsRule.

### DoNotThrowInUnexpectedLocationRule

There are a number of methods which have constraints on the exceptions which they may throw. This rule checks the following methods:

-   Property getters - properties should work very much like fields: they should execute very quickly and, in general, should not throw exceptions. However they may throw System.InvalidOperationException, System.NotSupportedException, or an exception derived from these. Indexed getters may also throw System.ArgumentException or System.Collections.Generic.KeyNotFoundException.
-   Event accessors - in general events should not throw when adding or removing a handler. However they may throw System.InvalidOperationException, System.NotSupportedException, System.ArgumentException, or an exception derived from these.
-   Object.Equals and IEqualityComparer\<T\>.Equals - should not throw. In particular they should do something sensible when passed null arguments or unexpected types.
-   Object.GetHashCode - should not throw or the object will not work properly with dictionaries and hash sets.
-   IEqualityComparer\<T\>.GetHashCode - may throw System.ArgumentException.
-   Object.ToString - these are called by the debugger to display objects and are also often used with printf style debugging so they should not change the object's state and should not throw.
-   static constructors - should very rarely throw. If they do throw then the type will not be useable within that application domain.
-   finalizers - should not throw. If they do (as of .NET 2.0) the process will be torn down.
-   IDisposable.Dispose - should not throw. If they do it's much harder to guarantee that objects clean up properly.
-   Dispose (bool) - should not throw because that makes it very difficult to clean up objects and because they are often called from a finalizer.
-   operator== and operator!= - should not throw. In particular they should do something sensible when passed null arguments or unexpected types.
-   implicit cast operators - should not throw. These methods are called implicitly so it tends to be quite surprising if they throw exceptions.

Note that the rule does not complain if a method throws System.NotImplementedException because DoNotForgetNotImplementedMethodsRule will flag them. Also the rule may fire with anonymous types with gmcs versions prior to 2.2, see [[1]](https://bugzilla.novell.com/show_bug.cgi?id=462622) for more details.

**Bad** example:

``` csharp
public override bool Equals (object obj)
{
    if (obj == null) {
        return false;
    }
 
    Customer rhs = (Customer) obj;  // throws if obj is not a Customer
    return name == rhs.name;
}
```

**Good** example:

``` csharp
public override bool Equals (object obj)
{
    Customer rhs = obj as Customer;
    if (rhs == null) {
        return false;
    }
 
    return name == rhs.name;
}
```

**Notes**

-   This rule is available since Gendarme 2.4

### DoNotThrowReservedExceptionRule

This rule will fire if an **System.ExecutionEngineException**, **System.IndexOutOfRangeException**, **NullReferenceException**, or **System.OutOfMemoryException** class is instantiated. These exceptions are for use by the runtime and should not be thrown by user code.

**Bad** example:

``` csharp
public void Add (object obj)
{
    if (obj == null) {
        throw new NullReferenceException ("obj");
    }
    Inner.Add (obj);
}
```

**Good** example:

``` csharp
public void Add (object obj)
{
    if (obj == null) {
        throw new ArgumentNullException ("obj");
    }
    Inner.Add (obj);
}
```

**Notes**

-   This rule is available since Gendarme 2.0

### ExceptionShouldBeVisibleRule

This rule checks for non-visible exceptions which derive directly from the most basic exceptions: **System.Exception**, **System.ApplicationException**or **System.SystemException**. Those basic exceptions, being visible, will be the only information available to the API consumer - but do not contain enough data to be useful.

**Bad** example:

``` csharp
internal class GeneralException : Exception {
}
```

**Good** example (visibility):

``` csharp
public class GeneralException : Exception {
}
```

**Good** example (base class):

``` csharp
internal class GeneralException : ArgumentException {
}
```

**Notes**

-   This rule is available since Gendarme 2.0

### InstantiateArgumentExceptionCorrectlyRule

This rule will fire if the arguments to the **System.ArgumentException**, **System.ArgumentNullException**, **System.ArgumentOutOfRangeException**, and **System.DuplicateWaitObjectException** constructors are used incorrectly. This is a common mistake because the position of the **parameterName** argument is not consistent across these types.

**Bad** example:

``` csharp
public void Show (string s)
{
    if (s == null) {
        // the first argument should be the parameter name
        throw new ArgumentNullException ("string is null", "s");
    }
    if (s.Length == 0) {
        // the second argument should be the parameter name
        return new ArgumentException ("s", "string is empty");
    }
    Console.WriteLine (s);
}
```

**Good** example:

``` csharp
public void Show (string s)
{
    if (s == null) {
        throw new ArgumentNullException ("s", "string is null");
    }
    if (s.Length == 0) {
        return new ArgumentException ("string is empty", "s");
    }
    Console.WriteLine (s);
}
```

**Notes**

-   This rule is available since Gendarme 2.2

### MissingExceptionConstructorsRule

This rule will fire if an exception class is missing one or more of the following constructors:

-   **public E ()** is required for XML serialization. Public access is required in case the assembly uses CAS to prevent reflection on non-public members.
-   **public E (string message)** is a .NET convention.
-   **public E (string message, ..., Exception inner)** is a .NET convention.
-   **(non)public E (SerializationInfo info, StreamingContext context)** is required for binary serialization.

 **Bad** example:

``` csharp
public class GeneralException : Exception {
    // access should be public
    private GeneralException ()
    {
    }
}
```

**Good** example:

``` csharp
public class GeneralException : Exception {
    public GeneralException ()
    {
    }
 
    public GeneralException (string message) : base (message)
    {
    }
 
    public GeneralException (string message, Exception inner) : base (message, inner)
    {
    }
 
    protected GeneralException (SerializationInfo info, StreamingContext context) : base (info, context)
    {
    }
}
```

**Notes**

-   This rule is available since Gendarme 2.0

### UseObjectDisposedExceptionRule

It's usually a very bad idea to attempt to use an object after it has been disposed. Doing so may lead to crashes in native code or any number of other problems. In order to prevent this, and to report the problem in a clear way, classes should throw System.ObjectDisposedException from public methods if the object has been disposed. Note that there are some methods which should not throw ObjectDisposedException. This includes constructors, finalizers, Equals, GetHashCode, ToString, and Dispose.

**Bad** example:

``` csharp
internal sealed class WriteStuff : IDisposable
{
    public WriteStuff (TextWriter writer)
    {
        this.writer = writer;
    }
 
    // Objects are generally not in a useable state after being disposed so
    // their public methods should throw ObjectDisposedException.
    public void Write (string message)
    {
        writer.Write (message);
    }
 
    public void Dispose ()
    {
        if (!disposed) {
            writer.Dispose ();
            disposed = true;
        }
    }
 
    private bool disposed;
    private TextWriter writer;
}
```

**Good** example:

``` csharp
internal sealed class WriteStuff : IDisposable
{
    public WriteStuff (TextWriter writer)
    {
        this.writer = writer;
    }
 
    // In general all public methods should throw ObjectDisposedException
    // if Dispose has been called.
    public void Write (string message)
    {
        if (disposed) {
            throw new ObjectDisposedException (GetType ().Name);
        }
 
        writer.Write (message);
    }
 
    public void Dispose ()
    {
        if (!disposed) {
            writer.Dispose ();
            disposed = true;
        }
    }
 
    private bool disposed;
    private TextWriter writer;
}
```

**Notes**

-   This rule is available since Gendarme 2.6

Feedback
========

Please report any documentation errors, typos or suggestions to the [Gendarme Google Group](http://groups.google.com/group/gendarme). Thanks!

