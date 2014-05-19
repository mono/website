---
layout: obsolete
title: "Gendarme.Rules.Performance"
permalink: /old_site/Gendarme.Rules.Performance/
redirect_from:
  - /Gendarme.Rules.Performance/
---

Gendarme.Rules.Performance
==========================

[Gendarme]({{site.github.url}}/old_site/Gendarme "Gendarme")'s performance rules are located in the **Gendarme.Rules.Performance.dll** assembly. Latest sources are available from [anonymous SVN](http://anonsvn.mono-project.com/viewcvs/trunk/mono-tools/gendarme/rules/Gendarme.Rules.Performance/).

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#rules">1 Rules</a>
<ul>
<li><a href="#avoidlargenumberoflocalvariablesrule">1.1 AvoidLargeNumberOfLocalVariablesRule</a>
<ul>
<li><a href="#maximumvariables">1.1.1 MaximumVariables</a></li>
</ul></li>
<li><a href="#avoidlargestructurerule">1.2 AvoidLargeStructureRule</a>
<ul>
<li><a href="#maxsize">1.2.1 MaxSize</a></li>
</ul></li>
<li><a href="#avoidrepetitivecastsrule">1.3 AvoidRepetitiveCastsRule</a></li>
<li><a href="#avoidreturningarraysonpropertiesrule">1.4 AvoidReturningArraysOnPropertiesRule</a></li>
<li><a href="#avoidtypegettypeforconstantstringsrule">1.5 AvoidTypeGetTypeForConstantStringsRule</a></li>
<li><a href="#avoiduncalledprivatecoderule">1.6 AvoidUncalledPrivateCodeRule</a></li>
<li><a href="#avoiduninstantiatedinternalclassesrule">1.7 AvoidUninstantiatedInternalClassesRule</a></li>
<li><a href="#avoidunneededcallsonstringrule">1.8 AvoidUnneededCallsOnStringRule</a></li>
<li><a href="#avoidunneededfieldinitializationrule">1.9 AvoidUnneededFieldInitializationRule</a></li>
<li><a href="#avoidunneededunboxingrule">1.10 AvoidUnneededUnboxingRule</a></li>
<li><a href="#avoidunsealedconcreteattributesrule">1.11 AvoidUnsealedConcreteAttributesRule</a></li>
<li><a href="#avoidunsealeduninheritedinternaltyperule">1.12 AvoidUnsealedUninheritedInternalTypeRule</a></li>
<li><a href="#avoidunusedparametersrule">1.13 AvoidUnusedParametersRule</a></li>
<li><a href="#avoidunusedprivatefieldsrule">1.14 AvoidUnusedPrivateFieldsRule</a></li>
<li><a href="#comparewithemptystringefficientlyrule">1.15 CompareWithEmptyStringEfficientlyRule</a></li>
<li><a href="#considercustomaccessorsfornonvisibleeventsrule">1.16 ConsiderCustomAccessorsForNonVisibleEventsRule</a></li>
<li><a href="#donotignoremethodresultrule">1.17 DoNotIgnoreMethodResultRule</a></li>
<li><a href="#implementequalstyperule">1.18 ImplementEqualsTypeRule</a></li>
<li><a href="#mathminmaxcandidaterule">1.19 MathMinMaxCandidateRule</a></li>
<li><a href="#overridevaluetypedefaultsrule">1.20 OverrideValueTypeDefaultsRule</a></li>
<li><a href="#prefercharoverloadrule">1.21 PreferCharOverloadRule</a></li>
<li><a href="#preferliteraloverinitonlyfieldsrule">1.22 PreferLiteralOverInitOnlyFieldsRule</a></li>
<li><a href="#removeunneededfinalizerrule">1.23 RemoveUnneededFinalizerRule</a></li>
<li><a href="#removeunusedlocalvariablesrule">1.24 RemoveUnusedLocalVariablesRule</a></li>
<li><a href="#reviewlinqmethodrule">1.25 ReviewLinqMethodRule</a></li>
<li><a href="#useisoperatorrule">1.26 UseIsOperatorRule</a></li>
<li><a href="#usestringemptyrule">1.27 UseStringEmptyRule</a></li>
<li><a href="#usesuppressfinalizeonidisposabletypewithfinalizerrule">1.28 UseSuppressFinalizeOnIDisposableTypeWithFinalizerRule</a></li>
<li><a href="#usetypeemptytypesrule">1.29 UseTypeEmptyTypesRule</a></li>
</ul></li>
<li><a href="#feedback">2 Feedback</a></li>
</ul></td>
</tr>
</tbody>
</table>

Rules
=====

### AvoidLargeNumberOfLocalVariablesRule

This rule warns when the number of local variables exceed a maximum value (default is 64). Having a large amount of local variables makes it hard to generate code that performs well and, likely, makes the code harder to understand.

**Notes**

-   This rule is available since Gendarme 2.0

**Configuration**

Some elements of this rule can be customized to better fit your needs.

#### MaximumVariables

The maximum number of local variables which methods may have without a defect being reported.

### AvoidLargeStructureRule

This rule will fire if a value type (struct in C\#) is larger than a maximum value (16 bytes by default). This is a problem because, unlike reference types, value types are bitwise-copied whenever they are assigned to a variable or passed to a method. If the type cannot be reduced in size then it should be turned into a reference type (class in C\#).

**Bad** example:

``` csharp
public struct BigArgb {
    long a, r, g, b;
}
```

**Good** example:

``` csharp
public sealed class BigArgb {
    long a, r, g, b;
}
```

**Notes**

-   This rule is available since Gendarme 2.0

**Configuration**

Some elements of this rule can be customized to better fit your needs.

#### MaxSize

The maximum size structs may be without a defect.

### AvoidRepetitiveCastsRule

This rule fires if multiple casts are done on the same value, for the same type. Casts are expensive so reducing them, by changing the logic or caching the result, can help performance.

**Bad** example:

``` csharp
foreach (object o in list) {
    // first cast (is)
    if (o is ICollection) {
        // second cast (as) if item implements ICollection
        Process (o as ICollection);
    }
}
```

**Good** example:

``` csharp
foreach (object o in list) {
    // a single cast (as) per item
    ICollection c = (o as ICollection);
    if (c != null) {
        SingleCast (c);
    }
}
```

**Bad** example:

``` csharp
// first cast (is):
if (o is IDictionary) {
    // second cast if item implements IDictionary:
    Process ((IDictionary) o);
    // first cast (is):
    } else if (o is ICollection) {
        // second cast if item implements ICollection:
        Process ((ICollection) o);
    }
```

**Good** example:

``` csharp
// a single cast (as) per item
IDictionary dict;
ICollection col;
if ((dict = o as IDictionary) != null) {
    SingleCast (dict);
    } else if ((col = o as ICollection) != null) {
        SingleCast (col);
    }
```

**Notes**

-   This rule is available since Gendarme 2.0

### AvoidReturningArraysOnPropertiesRule

This rule check for properties which return arrays. This can be a problem because properties are supposed to execute very quickly so it's likely that this property is returning a reference to the internal state of the object. This means that the caller can change the object's internal state via a back-door channel which is usually a very bad thing and it means that the array's contents may change unexpectedly if the caller holds onto the array. The preferred approach is to either return a read-only collection or to change the property to a method and return a copy of the array (it's important to use a method so that callers are not misled about the performance of the property).

**Bad** example:

``` csharp
public byte[] Foo {
    get {
        // return the data inside the instance
        return foo;
    }
}
 
public byte[] Bar {
    get {
        // return a copy of the instance's data
        // (this is bad because users expect properties to execute quickly)
        return (byte[]) bar.Clone ();
    }
}
```

**Good** example:

``` csharp
public byte[] GetFoo ()
{
    return (byte[]) foo.Clone ();
}
 
public byte[] GetFoo ()
{
    return (byte[]) bar.Clone ();
}
```

### AvoidTypeGetTypeForConstantStringsRule

This rule warns when a method use **Type.GetType(string)** with a constant string. Such calls requires reflection in order to return a **Type** instance and, for known types, can be replaced with a much faster **typeof(x)**.

**Bad** example:

``` csharp
booleanType = Type.GetType ("System.Boolean");
```

**Good** example:

``` csharp
booleanType = typeof (bool);
```

**Notes**

-   This rule is available since Gendarme 2.0

### AvoidUncalledPrivateCodeRule

This rule will check for internally visible methods which are never called. The rule will warn you if a private method isn't called in its declaring type or if an internal method doesn't have any callers in the assembly or isn't invoked by the runtime or a delegate.

**Bad** example:

``` csharp
public class MyClass {
    private void MakeSuff ()
    {
        // ...
    }
 
    public void Method ()
    {
        Console.WriteLine ("Foo");
    }
}
```

**Good** example (removing unused code):

``` csharp
public class MyClass {
    public void Method ()
    {
        Console.WriteLine ("Foo");
    }
}
```

**Good** example (use the code):

``` csharp
public class MyClass {
    private void MakeSuff ()
    {
        // ...
    }
 
    public void Method ()
    {
        Console.WriteLine ("Foo");
        MakeSuff ();
    }
}
```

### AvoidUninstantiatedInternalClassesRule

This rule will fire if a type is only visible within its assembly, can be instantiated, but is not instantiated. Such types are often leftover (dead code) or are debugging/testing code and not required. However in some case the types might by needed, e.g. when accessed thru reflection or if the **[InternalsVisibleTo]** attribute is used on the assembly.

**Bad** example:

``` csharp
// defined, but never instantiated
internal class MyInternalClass {
    // ...
}
 
public class MyClass {
    static void Main ()
    {
        // ...
    }
}
```

**Good** example:

``` csharp
internal class MyInternalClass {
    // ...
}
 
public class MyClass {
    static void Main ()
    {
        MyInternalClass c = new MyInternalClass ();
        // ...
    }
}
```

### AvoidUnneededCallsOnStringRule

This rule detects when some methods, like **Clone()**, **Substring(0)**, **ToString()** or **ToString(IFormatProvider)**, are being called on a string instance. Since these calls all return the original string they don't do anything useful and should be carefully reviewed to see if they are working as intended and, if they are, the method call can be removed.

**Bad** example:

``` csharp
public void PrintName (string name)
{
    Console.WriteLine ("Name: {0}", name.ToString ());
}
```

**Good** example:

``` csharp
public void PrintName (string name)
{
    Console.WriteLine ("Name: {0}", name);
}
```

**Notes**

-   Prior to Gendarme 2.0 this rule was more limited and named AvoidToStringOnStringsRule

### AvoidUnneededFieldInitializationRule

This rule looks for constructors that assign fields to their default value (e.g. 0 for an integer, null for an object or a string). Since the CLR zero initializes all values there is no need, under most circumstances, to assign default values. Doing so only adds size to source code and in IL.

**Bad** example:

``` csharp
public class Bad {
    int i;
    string s;
 
    public Bad ()
    {
        i = 0;
        s = null;
    }
}
```

**Good** example:

``` csharp
public class Good {
    int i;
    string s;
 
    public Good ()
    {
        // don't assign 'i' since it's already 0
        // but we might prefer to assign a string to String.Empty
        s = String.Empty;
    }
}
```

**Notes**

-   This rule is available since Gendarme 2.2

### AvoidUnneededUnboxingRule

This rule checks methods which unbox the same value type multiple times (i.e. the value is copied from the heap into the stack). Because the copy is relatively expensive, the code should be rewritten to minimize unboxes. For example, using a local variable of the right value type should remove the need for more than one unbox instruction per variable.

**Bad** example:

``` csharp
public struct Message {
    private int msg;
    private IntPtr hwnd, lParam, wParam, IntPtr result;
 
    public override bool Equals (object o)
    {
        bool result = (this.msg == ((Message) o).msg);
        result &= (this.hwnd == ((Message) o).hwnd);
        result &= (this.lParam == ((Message) o).lParam);
        result &= (this.wParam == ((Message) o).wParam);
        result &= (this.result == ((Message) o).result);
        return result;
    }
}
```

**Good** example:

``` csharp
public struct Message {
    private int msg;
    private IntPtr hwnd, lParam, wParam, IntPtr result;
 
    public override bool Equals (object o)
    {
        Message msg = (Message) o;
        bool result = (this.msg == msg.msg);
        result &= (this.hwnd == msg.hwnd);
        result &= (this.lParam == msg.lParam);
        result &= (this.wParam == msg.wParam);
        result &= (this.result == msg.result);
        return result;
    }
}
```

**Notes**

-   This rule is available since Gendarme 2.0

### AvoidUnsealedConcreteAttributesRule

This rule fires if an attribute is defined which is both concrete (i.e. not abstract) and unsealed. This is a performance problem because it means that **System.Attribute.GetCustomAttribute** has to search the attribute type hierarchy for derived types. To fix this either seal the type or make it abstract.

**Bad** example:

``` csharp
[AttributeUsage (AttributeTargets.All)]
public class BadAttribute : Attribute {
}
```

**Good** example (sealed):

``` csharp
[AttributeUsage (AttributeTargets.All)]
public sealed class SealedAttribute : Attribute {
}
```

**Good** example (abstract and sealed):

``` csharp
[AttributeUsage (AttributeTargets.All)]
public abstract class AbstractAttribute : Attribute {
}
 
[AttributeUsage (AttributeTargets.All)]
public sealed class ConcreteAttribute : AbstractAttribute {
}
```

**Notes**

-   Before Gendarme 2.0 this rule was named AvoidUnsealedAttributesRule.

### AvoidUnsealedUninheritedInternalTypeRule

This rule will fire for classes which are internal to the assembly and have no derived classes, but are not **sealed**. Sealing the type clarifies the type hierarchy and allows the compiler/JIT to perform optimizations such as eliding virtual method calls.

**Bad** example:

``` csharp
// this one is correct since MyInheritedStuff inherits from this class
internal class MyBaseStuff {
}
 
// this one is bad, since no other class inherit from MyConcreteStuff
internal class MyInheritedStuff : MyBaseStuff {
}
```

**Good** example:

``` csharp
// this one is correct since the class is abstract
internal abstract class MyAbstractStuff {
}
 
// this one is correct since the class is sealed
internal sealed class MyConcreteStuff : MyAbstractStuff {
}
```

**Notes**

-   This rule is available since Gendarme 2.0 and, before 2.2, was named AvoidUnsealedUninheritedInternalClassesRule

### AvoidUnusedParametersRule

This rule is used to ensure that all parameters in a method signature are being used. The rule wont report a defect against the following:

-   Methods that are referenced by a delegate;
-   Methods used as event handlers;
-   Abstract methods;
-   Virtual or overriden methods;
-   External methods (e.g. p/invokes)

 **Bad** example:

``` csharp
public void MethodWithUnusedParameters (IEnumerable enumerable, int x)
{
    foreach (object item in enumerable) {
        Console.WriteLine (item);
    }
}
```

**Good** example:

``` csharp
public void MethodWithUsedParameters (IEnumerable enumerable)
{
    foreach (object item in enumerable) {
        Console.WriteLine (item);
    }
}
```

### AvoidUnusedPrivateFieldsRule

This rule checks all private fields inside each type to see if some of them are not being used. This could be a leftover from debugging or testing code or a more serious typo where a wrong field is being used. In any case this makes the type bigger than it needs to be which can affect performance when a large number of instances exist.

**Bad** example:

``` csharp
public class Bad {
    int level;
    bool b;
 
    public void Indent ()
    {
        level++;
        #if DEBUG
        if (b) Console.WriteLine (level);
        #endif
    }
}
```

**Good** example:

``` csharp
public class Good {
    int level;
    #if DEBUG
    bool b;
    #endif
 
    public void Indent ()
    {
        level++;
        #if DEBUG
        if (b) Console.WriteLine (level);
        #endif
    }
}
```

### CompareWithEmptyStringEfficientlyRule

This rule will fire if a string is compared to **""** or **String.Empty**. Instead use a **String.Length** test which should be a bit faster. Another possibility (with .NET 2.0) is to use the static **String.IsNullOrEmpty** method. **String.IsNullOrEmpty**.

**Bad** example:

``` csharp
public void SimpleMethod (string myString)
{
    if (myString.Equals (String.Empty)) {
    }
}
```

**Good** example:

``` csharp
public void SimpleMethod (string myString)
{
    if (myString.Length == 0) {
    }
}
```

### ConsiderCustomAccessorsForNonVisibleEventsRule

This rule looks for non-visible events to see if their add/remove accessors are the default ones. The default, compiler generated, accessor is marked as synchronized which means that the runtime will bracket them between **Monitor.Enter** and **Monitor.Exit** calls. This is the safest approach unless, for non-visible events, you have a performance bottleneck around the events. In this case you should review if your code needs the locks or if you can provide an alternative to them.

**Bad** example:

``` csharp
private event EventHandler<TestEventArgs> TimeCritical;
```

**Good** example:

``` csharp
static object TimeCriticalEvent = new object ();
EventHandlerList events = new EventHandlerList ();
 
private event EventHandler<TestEventArgs> TimeCritical {
    add {
        events.AddHandler (TimeCriticalEvent, value);
    }
    remove {
        events.AddHandler (TimeCriticalEvent, value);
    }
}
```

**Notes**

-   This rule is available since Gendarme 2.0

### DoNotIgnoreMethodResultRule

This rule fires if a method is called that returns a new instance but that instance is not used. This is a performance problem because it is wasteful to create and collect objects which are never actually used. It may also indicate a logic problem. Note that this rule currently only checks methods within a small number of System types.

**Bad** example:

``` csharp
public void GetName ()
{
    string name = Console.ReadLine ();
    // This is a bug: strings are (mostly) immutable so Trim leaves
    // name untouched and returns a new string.
    name.Trim ();
    Console.WriteLine ("Name: {0}", name);
}
```

**Good** example:

``` csharp
public void GetName ()
{
    string name = Console.ReadLine ();
    name = name.Trim ();
    Console.WriteLine ("Name: {0}", name);
}
```

### ImplementEqualsTypeRule

This rule looks for types that override **Object.Equals(object)** but do not provide a **Equals(x)** overload using the type. Such an overload removes the need to cast the object to the correct type. For value types this also removes the costly boxing operations. Assemblies targeting .NET 2.0 (and later) should also implement **System.IEquatable\<T\>**.

**Bad** example:

``` csharp
public class Bad {
    public override bool Equals (object obj)
    {
        return base.Equals (obj);
    }
 
    public override int GetHashCode ()
    {
        return base.GetHashCode ();
    }
}
```

**Good** example:

``` csharp
// IEquatable<T> is only available since
// version 2.0 of the .NET framework
public class Good : IEquatable<Good> {
    public override bool Equals (object obj)
    {
        return (obj as Good);
    }
 
    public bool Equals (Good other)
    {
        return (other != null);
    }
 
    public override int GetHashCode ()
    {
        return base.GetHashCode ();
    }
}
```

**Notes**

-   This rule is available since Gendarme 2.0

### MathMinMaxCandidateRule

This rule checks methods for code which seems to duplicate **Math.Min** or **Math.Max**. The JIT can inline these methods and generate better code for, at least some types, than it can for a custom inline implementation.

**Bad** example:

``` csharp
int max = (a > b) ? a : b;
```

**Good** example:

``` csharp
int max = Math.Max (a, b);
```

**Notes**

-   This rule is available since Gendarme 2.0

### OverrideValueTypeDefaultsRule

This rule checks all value types, except enumerations, to see if they use the default implementation of **Equals(object)** and **GetHashCode()** methods. While **ValueType** implementations work for any value type they do so at the expense of performance (the default implementation uses reflection to access fields). You can easily override both methods with much faster code since you know all meaningful fields inside your structure. At the same time you should also provide, if your language allows it, operator overloads for equality (**op\_Equality**, **==**) and inequality (**op\_Inequality**, **!=**).

**Bad** example:

``` csharp
public struct Coord {
    int X, Y, Z;
}
```

**Good** example:

``` csharp
public struct Coord {
    int X, Y, Z;
 
    public override bool Equals (object obj)
    {
        if (obj == null) {
            return false;
        }
        Coord c = (Coord)obj;
        return ((X == c.X) && (Y == c.Y) && (Z == c.Z));
    }
 
    public override int GetHashCode ()
    {
        return X ^ Y ^ Z;
    }
 
    public static bool operator == (Coord left, Coord right)
    {
        return left.Equals (right);
    }
 
    public static bool operator != (Coord left, Coord right)
    {
        return !left.Equals (right);
    }
}
```

**Notes**

-   This rule is available since Gendarme 2.0

### PreferCharOverloadRule

This rule looks for calls to **String** methods that use **String**parameters when a **Char** parameter could have been used. Using the **Char** overload is preferred because it will be faster. Note, however, that this may result in subtly different behavior on versions of .NET before 4.0: the string overloads do a culture based comparison using **CultureInfo.CurrentCulture** and the char methods do an ordinal comparison (a simple compare of the character values). This can result in a change of behavior (for example the two can produce different results when precomposed characters are used). If this is important it is best to use an overload that allows StringComparison or CultureInfo to be explicitly specified see [[1]](http://msdn.microsoft.com/en-us/library/ms973919.aspx#stringsinnet20_topic4) for more details. With .NET 4.0 **String'**s behavior will change and the various methods will be made more consistent. In particular the comparison methods will be changed so that they all default to doing an ordinal comparison.

**Bad** example:

``` csharp
if (s.IndexOf (":") == -1) {
    Console.WriteLine ("no separator found");
}
```

**Good** example:

``` csharp
if (s.IndexOf (':') == -1) {
    Console.WriteLine ("no separator found");
}
```

**Notes**

-   This rule is available since Gendarme 2.4

### PreferLiteralOverInitOnlyFieldsRule

This rule looks for **InitOnly** fields (**readonly** in C\#) that could be turned into **Literal** (**const** in C\#) because their value is known at compile time. **Literal** fields don't need to be initialized (i.e. they don't force the compiler to add a static constructor to the type) resulting in less code and the value (not a reference to the field) will be directly used in the IL (which is OK if the field has internal visibility, but is often problematic if the field is visible outside the assembly).

**Bad** example:

``` csharp
public class ClassWithReadOnly {
    static readonly int One = 1;
}
```

**Good** example:

``` csharp
public class ClassWithConst
{
    const int One = 1;
}
```

**Notes**

-   This rule is available since Gendarme 2.2

### RemoveUnneededFinalizerRule

This rule looks for types that have an empty finalizer (a.k.a. destructor in C\# or **Finalize** method). Finalizers that simply set fields to null are considered to be empty because this does not help the garbage collection. You should remove the empty finalizer to alleviate pressure on the garbage collector and finalizer thread.

**Bad** example (empty):

``` csharp
class Bad {
    ~Bad ()
    {
    }
}
```

**Bad** example (only nulls fields):

``` csharp
class Bad {
    object o;
 
    ~Bad ()
    {
        o = null;
    }
}
```

**Good** example:

``` csharp
class Good {
    object o;
}
```

**Notes**

-   Prior to Gendarme 2.2 this rule was named EmptyDestructorRule

### RemoveUnusedLocalVariablesRule

This rule looks for unused local variables inside methods. This can leads to larger code (IL) size and longer JIT time, but note that some optimizing compilers can remove the locals so they won't be reported even if you can still see them in the source code. This could also be a typo in the source were a value is assigned to the wrong variable.

**Bad** example:

``` csharp
bool DualCheck ()
{
    bool b1 = true;
    bool b2 = CheckDetails ();
    if (b2) {
        // typo: a find-replace changed b1 into b2
        b2 = CheckMoreDetails ();
    }
    return b2 && b2;
}
```

**Good** example:

``` csharp
bool DualCheck ()
{
    bool b1 = true;
    bool b2 = CheckDetails ();
    if (b2) {
        b1 = CheckMoreDetails ();
    }
    return b1 && b2;
}
```

**Notes**

-   This rule is available since Gendarme 2.0

### ReviewLinqMethodRule

Linq extension methods operate on sequences of values so they generally have linear time complexity. However you may be able to achieve better than linear time performance if you use a less general method or take advantage of a method provided by an **Sytem.Collections.Generic.IEnumerable\<T\>** subclass.

**Bad** example:

``` csharp
public string FirstOrMissing (IEnumerable<string> sequence, string missing)
{
    // Count () is O(n)
    if (sequence.Count () > 0) {
        return sequence.First ();
    }
    return missing;
}
 
public void Append (List<string> lines, string line)
{
    // Last () is O(n)
    if (lines.Count == 0 || lines.Last () != line) {
        lines.Add (line);
    }
}
```

**Good** example:

``` csharp
public string FirstOrMissing (IEnumerable<string> sequence, string missing)
{
    // We don't need an exact count so we can use the O(1) Any () method.
    if (sequence.Any ()) {
        return sequence.First ();
    }
    return missing;
}
 
public void Append (List<string> lines, string line)
{
    // Lines is a List so we can use the O(1) subscript operator instead of
    // the Last () method.
    if (lines.Count == 0 || lines [lines.Count - 1] != line) {
        lines.Add (line);
    }
}
```

**Notes**

-   This rule is available since Gendarme 2.6

### UseIsOperatorRule

This rule looks for complex cast operations (e.g. a **as**with a **null** check) that can be simplified using the **is** operator (C\# syntax). Note: in some case a compiler, like [g]mcs, can optimize the code and generate IL identical to a **is** operator. In this case the rule will not report an error even if you could see one while looking the at source code.

**Bad** example:

``` csharp
bool is_my_type = (my_instance as MyType) != null;
```

**Good** example:

``` csharp
bool is_my_type = (my_instance is MyType);
```

**Notes**

-   This rule is available since Gendarme 2.0

### UseStringEmptyRule

This rule checks for methods that are using the literal **""** instead of the **String.Empty** field. You'll get slighly better performance by using **String.Empty**. Note that in some cases, e.g. in a **switch/case** statement, you cannot use a field, so **""** must be used instead of **String.Empty**.

**Bad** example:

``` csharp
string s = "";
```

**Good** example:

``` csharp
string s = String.Empty;
```

### UseSuppressFinalizeOnIDisposableTypeWithFinalizerRule

This rule will fire if a type implements **System.IDisposable** and has a finalizer (called a destructor in C\#), but the Dispose method does not call **System.GC.SuppressFinalize**. Failing to do this should not cause properly written code to fail, but it does place a non-trivial amount of extra pressure on the garbage collector and on the finalizer thread.

**Bad** example:

``` csharp
class BadClass : IDisposable {
    ~BadClass ()
    {
        Dispose (false);
    }
 
    public void Dispose ()
    {
        // GC.SuppressFinalize is missing so the finalizer will be called
        // which puts needless extra pressure on the garbage collector.
        Dispose (true);
    }
 
    private void Dispose (bool disposing)
    {
        if (ptr != IntPtr.Zero) {
            Free (ptr);
            ptr = IntPtr.Zero;
        }
    }
 
    [DllImport ("somelib")]
    private static extern void Free (IntPtr ptr);
 
    private IntPtr ptr;
}
```

**Good** example:

``` csharp
class GoodClass : IDisposable {
    ~GoodClass ()
    {
        Dispose (false);
    }
 
    public void Dispose ()
    {
        Dispose (true);
        GC.SuppressFinalize (this);
    }
 
    private void Dispose (bool disposing)
    {
        if (ptr != IntPtr.Zero) {
            Free (ptr);
            ptr = IntPtr.Zero;
        }
    }
 
    [DllImport ("somelib")]
    private static extern void Free (IntPtr ptr);
 
    private IntPtr ptr;
}
```

**Notes**

-   Prior to Gendarme 2.2 this rule was named IDisposableWithDestructorWithoutSuppressFinalizeRule

### UseTypeEmptyTypesRule

This rule fires if a zero length array of **System.Type** is created. This value is so often required by the framework API that the **System.Type** includes an **EmptyTypes** field. Using this field avoids the memory allocation (and GC tracking) of your own array.

**Bad** example:

``` csharp
ConstructorInfo ci = type.GetConstructor (new Type[0]);
```

**Good** example:

``` csharp
ConstructorInfo ci = type.GetConstructor (Type.EmptyTypes);
```

**Notes**

-   This rule is available since Gendarme 2.0

Feedback
========

Please report any documentation errors, typos or suggestions to the [Gendarme Google Group](http://groups.google.com/group/gendarme). Thanks!

