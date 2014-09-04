---
title: "Gendarme Rules: Design"
redirect_from:
  - /Gendarme.Rules.Design/
---

[Gendarme](/docs/tools+libraries/tools/gendarme/)'s design rules are located in the **Gendarme.Rules.Design.dll** assembly. Latest sources are available from [git](https://github.com/mono/mono-tools/tree/master/gendarme/rules/Gendarme.Rules.Design/).

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#rules">1 Rules</a>
<ul>
<li><a href="#abstracttypesshouldnothavepublicconstructorsrule">1.1 AbstractTypesShouldNotHavePublicConstructorsRule</a></li>
<li><a href="#attributeargumentsshouldhaveaccessorsrule">1.2 AttributeArgumentsShouldHaveAccessorsRule</a></li>
<li><a href="#avoidemptyinterfacerule">1.3 AvoidEmptyInterfaceRule</a></li>
<li><a href="#avoidmultidimensionalindexerrule">1.4 AvoidMultidimensionalIndexerRule</a></li>
<li><a href="#avoidpropertieswithoutgetaccessorrule">1.5 AvoidPropertiesWithoutGetAccessorRule</a></li>
<li><a href="#avoidrefandoutparametersrule">1.6 AvoidRefAndOutParametersRule</a></li>
<li><a href="#avoidsmallnamespacerule">1.7 AvoidSmallNamespaceRule</a>
<ul>
<li><a href="#minimum">1.7.1 Minimum</a></li>
</ul></li>
<li><a href="#avoidvisiblefieldsrule">1.8 AvoidVisibleFieldsRule</a></li>
<li><a href="#avoidvisiblenestedtypesrule">1.9 AvoidVisibleNestedTypesRule</a></li>
<li><a href="#consideraddinginterfacerule">1.10 ConsiderAddingInterfaceRule</a></li>
<li><a href="#considerconvertingfieldtonullablerule">1.11 ConsiderConvertingFieldToNullableRule</a></li>
<li><a href="#considerconvertingmethodtopropertyrule">1.12 ConsiderConvertingMethodToPropertyRule</a></li>
<li><a href="#considerusingstatictyperule">1.13 ConsiderUsingStaticTypeRule</a></li>
<li><a href="#declareeventhandlerscorrectlyrule">1.14 DeclareEventHandlersCorrectlyRule</a></li>
<li><a href="#disposabletypesshouldhavefinalizerrule">1.15 DisposableTypesShouldHaveFinalizerRule</a></li>
<li><a href="#donotdeclareprotectedmembersinsealedtyperule">1.16 DoNotDeclareProtectedMembersInSealedTypeRule</a></li>
<li><a href="#donotdeclarevirtualmethodsinsealedtyperule">1.17 DoNotDeclareVirtualMethodsInSealedTypeRule</a></li>
<li><a href="#ensuresymmetryforoverloadedoperatorsrule">1.18 EnsureSymmetryForOverloadedOperatorsRule</a></li>
<li><a href="#enumsshoulddefineazerovaluerule">1.19 EnumsShouldDefineAZeroValueRule</a></li>
<li><a href="#enumsshoulduseint32rule">1.20 EnumsShouldUseInt32Rule</a></li>
<li><a href="#finalizersshouldbeprotectedrule">1.21 FinalizersShouldBeProtectedRule</a></li>
<li><a href="#flagsshouldnotdefineazerovaluerule">1.22 FlagsShouldNotDefineAZeroValueRule</a></li>
<li><a href="#implementequalsandgethashcodeinpairrule">1.23 ImplementEqualsAndGetHashCodeInPairRule</a></li>
<li><a href="#implementicloneablecorrectlyrule">1.24 ImplementICloneableCorrectlyRule</a></li>
<li><a href="#implementicomparablecorrectlyrule">1.25 ImplementIComparableCorrectlyRule</a></li>
<li><a href="#internalnamespacesshouldnotexposetypesrule">1.26 InternalNamespacesShouldNotExposeTypesRule</a></li>
<li><a href="#mainshouldnotbepublicrule">1.27 MainShouldNotBePublicRule</a></li>
<li><a href="#markassemblywithassemblyversionrule">1.28 MarkAssemblyWithAssemblyVersionRule</a></li>
<li><a href="#markassemblywithclscompliantrule">1.29 MarkAssemblyWithCLSCompliantRule</a></li>
<li><a href="#markassemblywithcomvisiblerule">1.30 MarkAssemblyWithComVisibleRule</a></li>
<li><a href="#missingattributeusageoncustomattributerule">1.31 MissingAttributeUsageOnCustomAttributeRule</a></li>
<li><a href="#operatorequalsshouldbeoverloadedrule">1.32 OperatorEqualsShouldBeOverloadedRule</a></li>
<li><a href="#overrideequalsmethodrule">1.33 OverrideEqualsMethodRule</a></li>
<li><a href="#prefereventsovermethodsrule">1.34 PreferEventsOverMethodsRule</a></li>
<li><a href="#preferintegerorstringforindexersrule">1.35 PreferIntegerOrStringForIndexersRule</a></li>
<li><a href="#preferxmlabstractionsrule">1.36 PreferXmlAbstractionsRule</a></li>
<li><a href="#providealternativenamesforoperatoroverloadsrule">1.37 ProvideAlternativeNamesForOperatorOverloadsRule</a></li>
<li><a href="#typesshouldbeinsidenamespacesrule">1.38 TypesShouldBeInsideNamespacesRule</a></li>
<li><a href="#typeswithdisposablefieldsshouldbedisposablerule">1.39 TypesWithDisposableFieldsShouldBeDisposableRule</a></li>
<li><a href="#typeswithnativefieldsshouldbedisposablerule">1.40 TypesWithNativeFieldsShouldBeDisposableRule</a></li>
<li><a href="#usecorrectdisposesignaturesrule">1.41 UseCorrectDisposeSignaturesRule</a></li>
<li><a href="#useflagsattributerule">1.42 UseFlagsAttributeRule</a></li>
</ul></li>
<li><a href="#feedback">2 Feedback</a></li>
</ul></td>
</tr>
</tbody>
</table>

Rules
=====

### AbstractTypesShouldNotHavePublicConstructorsRule

This rule fires if an **abstract** type has a **public** constructor. This is a bit misleading because the constructor can only be called by the constructor of a derived type. To make the type's semantics clearer make the constructor **protected**.

**Bad** example:

``` csharp
abstract public class MyClass {
    public MyClass ()
    {
    }
}
```

**Good** example:

``` csharp
abstract public class MyClass {
    protected MyClass ()
    {
    }
}
```

### AttributeArgumentsShouldHaveAccessorsRule

This rule fires if a parameter to an **Attribute** constructor is not exposed using a properly cased property. This is a problem because it is generally not useful to set state within an attribute without providing a way to get at that state.

**Bad** example:

``` csharp
[AttributeUsage (AttributeTargets.All)]
public sealed class AttributeWithRequiredProperties : Attribute {
    private int storedFoo;
    private string storedBar;
 
    // we have no corresponding property with the name 'Bar' so the rule will fail
    public AttributeWithRequiredProperties (int foo, string bar)
    {
        storedFoo = foo;
        storedBar = bar;
    }
 
    public int Foo {
        get {
            return storedFoo;
        }
    }
}
```

**Good** example:

``` csharp
[AttributeUsage (AttributeTargets.All)]
public sealed class AttributeWithRequiredProperties : Attribute {
    private int storedFoo;
    private string storedBar;
 
    public AttributeWithRequiredProperties (int foo, string bar)
    {
        storedFoo = foo;
        storedBar = bar;
    }
 
    public int Foo {
        get {
            return storedFoo;
        }
    }
 
    public string Bar {
        get {
            return storedBar;
        }
    }
}
```

### AvoidEmptyInterfaceRule

This rule fires if an interface declares no members. Empty interfaces are generally not useful except as markers to categorize types and attributes are the preferred way to handle that.

**Bad** example:

``` csharp
public interface IMarker {
}
 
public class MyClass : IMarker {
}
```

**Good** example:

``` csharp
[MarkedByAnAttribute]
public class MyClass {
}
```

### AvoidMultidimensionalIndexerRule

This rule checks for externally visible indexer properties which have more than one index argument. These can be confusing to some developers and IDEs with auto-complete don't always handle them as well as methods so it can be hard to know which argument is which.

**Bad** example:

``` csharp
public int this [int x, int y] {
    get {
        return 0;
    }
}
```

**Good** example:

``` csharp
public int Get (int x, int y)
{
    return 0;
}
```

**Notes**

-   This rule is available since Gendarme 2.0

### AvoidPropertiesWithoutGetAccessorRule

This rule fires if an externally visible type contains a property with a setter but not a getter. This is confusing to users and can make it difficult to use shared objects. Instead either add a getter or make the property a method.

**Bad** examples:

``` csharp
public double Seed {
    // no get since there's no use case for it
    set {
        seed = value;
    }
}
 
public sting Password {
    // no get as we don't want to expose the password
    set {
        password = value;
    }
}
```

**Good** examples:

``` csharp
public double Seed {
    get {
        return seed;
    }
    set {
        seed = value;
    }
}
 
public void SetPassword (string value)
{
    password = value;
}
```

### AvoidRefAndOutParametersRule

This rule fires if a method uses **ref** or **out** parameters. These are advanced features that can easily be misunderstood (by the consumer) and misused (by the consumer) and can result in an API that is difficult to use. Avoid them whenever possible or, if needed, provide simpler alternatives for most use cases. An exception is made, i.e. no defect are reported, for the **bool Try\*(X out)** pattern.

**Bad** example:

``` csharp
public bool NextJob (ref int id, out string display)
{
    if (id < 0)
    return false;
    display = String.Format ("Job #{0}", id++);
    return true;
}
```

**Good** example:

``` csharp
private int id = 0;
 
private int GetNextId ()
{
    int id = this.id++;
    return id;
}
 
public string NextJob ()
{
    return String.Format ("Job #{0}", Id);
}
```

**Notes**

-   This rule is available since Gendarme 2.0

### AvoidSmallNamespaceRule

This rule fires if a namespace contains less than five (by default) visible types. Note that this rule enumerates the types in all the assemblies being analyzed instead of simply considering each assembly in turn. The rule exempts:

-   **specialized namespaces** : e.g. **\*.Design**, **\*.Interop** and **\*.Permissions**
-   **internal namespaces** : namespaces without any visible (outside the assemble) types
-   **small assemblies** : that contains a single namespace but less than the minimal number of types (e.g. addins)
-   **assembly entry point** : the namespace of the type being used in an assemble (EXE) entry-point

 **Bad** example:

``` csharp
namespace MyStuff.Special {
    // single type inside a namespace
    public class Helper {
    }
}
```

**Good** example:

``` csharp
namespace MyStuff {
    public class Helper {
    }
    // ... many other types ...
}
```

**Configuration**

Some elements of this rule can be customized to better fit your needs.

#### Minimum

The minimum number of types which must exist within a namespace.

### AvoidVisibleFieldsRule

This rule fires if a type contains externally visible fields. Instead use a property which allows you to change the implementation without breaking binary compatibility with other assemblies.

**Bad** example:

``` csharp
public class Foo {
    public int Value;
}
```

**Good** example:

``` csharp
public class Foo {
    private int v;
    public int Value {
        get {
            return v;
        }
        set {
            v = value;
        }
    }
```

**Notes**

-   Prior to Gendarme 2.2 this rule was named AvoidPublicInstanceFieldsRule.

### AvoidVisibleNestedTypesRule

This rule checks for nested types which are externally visible. Such types are often confused with namespaces which makes them more difficult to document and find by developers. In most cases it is better to make these types private or to scope them within a namespace instead of a type.

**Bad** example:

``` csharp
public class Outer {
    public class Inner {
        // ...
    }
}
```

**Good** example (visibility):

``` csharp
public class Outer {
    internal class Inner {
        // ...
    }
}
```

**Good** example (unnested):

``` csharp
public class Outer {
    // ...
}
 
public class Inner {
    // ...
}
```

**Notes**

-   This rule is available since Gendarme 2.0

### ConsiderAddingInterfaceRule

This rule fires if a type implements members which are declared in an interface, but the type does not implement the interface. Implementing the interface will normally make the type more reuseable and will help clarify the type's semantics.

**Bad** example:

``` csharp
public interface IDoable {
    public void Do ();
}
 
public class MyClass {
    public void Do ()
    {
    }
}
```

**Good** example:

``` csharp
public interface IDoable {
    public void Do ();
}
 
public class MyClass : IDoable {
    public void Do ()
    {
    }
}
```

### ConsiderConvertingFieldToNullableRule

This rule checks for pairs of fields which seem to provide the same functionality as a single nullable field. If the assembly targets version 2.0, or more recent, of the CLR then the rule will fire to let you know that a nullable field can be used instead. The rule will ignore assemblies targeting earlier versions of the CLR.

**Bad** example:

``` csharp
public class Bad {
    bool hasFoo;
    int foo;
}
```

**Good** example:

``` csharp
public class Good {
    int? foo;
}
```

**Notes**

-   This rule is available since Gendarme 2.0

### ConsiderConvertingMethodToPropertyRule

This rule checks for methods whose definition looks similar to a property. For example, methods beginning with **Is**, **Get** or **Set** may be better off as properties. But note that this should not be done if the method takes a non-trivial amount of time to execute.

**Bad** example:

``` csharp
public class Bad {
    int foo;
 
    public int GetFoo ()
    {
        return foo;
    }
}
```

**Good** example:

``` csharp
public class Good {
    int foo;
 
    public int Foo {
        get {
            return foo;
        }
    }
}
```

### ConsiderUsingStaticTypeRule

This rule checks for types that contain only static members and, if the assembly targets the CLR version 2.0 or later, suggests that the type be made **static**. The rule will ignore assemblies targeting earlier versions of the CLR.

**Bad** example:

``` csharp
public class Class {
    public static void Method ()
    {
    }
}
```

**Good** example:

``` csharp
public static class Class {
    public static void Method ()
    {
    }
}
```

### DeclareEventHandlersCorrectlyRule

This rule will fire if an event is declared with a signature which does not match the .NET guidelines. The return type of the event should be void (because there is no good way to handle return values if multiple delegates are attached to the event). And the event should take two arguments. The first should be of type **System.Object** and be named 'sender'. The second should be of type **System.EventArgs** (or a subclass) and named 'e'. This helps tools such as visual designers identify the delegates and methods which may be attached to events. Note that .NET 2.0 added a generic **System.EventHandler**type which can be used to easily create events with the correct signature.

**Bad** example:

``` csharp
// the second parameter (which should be System.EventArgs or a derived class) is missing
delegate void MyDelegate (int sender);
 
class Bad {
    public event MyDelegate CustomEvent;
}
```

**Good** example (delegate):

``` csharp
delegate void MyDelegate (int sender, EventArgs e);
 
class Good {
    public event MyDelegate CustomEvent;
}
```

**Good** example (generics):

``` csharp
class Good {
    public event EventHandler<EventArgs> CustomEvent;
}
```

**Notes**

-   This rule is available since Gendarme 2.2

### DisposableTypesShouldHaveFinalizerRule

This rule will fire for types which implement **System.IDisposable**, contain native fields such as **System.IntPtr**, **System.UIntPtr**, and **System.Runtime.InteropServices.HandleRef**, but do not define a finalizer.

**Bad** example:

``` csharp
class NoFinalizer {
    IntPtr field;
}
```

**Good** example:

``` csharp
class HasFinalizer {
    IntPtr field;
 
    ~HasFinalizer ()
    {
        UnmanagedFree (field);
    }
}
```

### DoNotDeclareProtectedMembersInSealedTypeRule

This rule ensures that **sealed** types (i.e. types that you can't inherit from) do not define family (**protected** in C#) fields or methods. Instead make the member private so that its accessibility is not misleading.

**Bad** example (field):

``` csharp
public sealed class MyClass {
    protected int someValue;
}
```

**Bad** example (method):

``` csharp
public sealed class MyClass {
    protected int GetAnswer ()
    {
        return 42;
    }
}
```

**Good** example (field):

``` csharp
public sealed class MyClass {
    private int someValue;
}
```

**Good** example (method):

``` csharp
public sealed class MyClass {
    private int GetAnswer ()
    {
        return 42;
    }
}
```

**Notes**

-   Prior to Gendarme 2.2 this rule applied only to fields and was named DoNotDeclareProtectedFieldsInSealedClassRule

### DoNotDeclareVirtualMethodsInSealedTypeRule

This rule ensure that **sealed** types (i.e. types that you can't inherit from) do not define new **virtual** methods. Such methods would only be useful in sub-types. Note that some compilers, like C# and VB.NET compilers, do not allow you to define such methods.

**Bad** example:

``` csharp
public sealed class MyClass {
    // note that C# compilers won't allow this to compile
    public virtual int GetAnswer ()
    {
        return 42;
    }
}
```

**Good** example:

``` csharp
public sealed class MyClass {
    public int GetAnswer ()
    {
        return 42;
    }
}
```

### EnsureSymmetryForOverloadedOperatorsRule

This rule checks for operators that are not overloaded in pairs. Some compilers, like the C# compilers, require you to implement some of the pairs, but other languages might not. The following pairs are checked:

 **Bad** example:

``` csharp
class DoesNotOverloadAdd {
    public static int operator - (DoesNotOverloadAdd left, DoesNotOverloadAdd right)
    {
        return 0;
    }
}
```

**Good** example:

``` csharp
class Good {
    public static int operator + (Good right, Good left)
    {
        return 0;
    }
 
    public static int operator - (Good right, Good left)
    {
        return 0;
    }
}
```

### EnumsShouldDefineAZeroValueRule

This rule ensures that every non-flags enumeration contains a **0** value. This is important because if a field is not explicitly initialized .NET will zero-initialize it and, if the enum has no zero value, then it will be initialized to an invalid value.

**Bad** example:

``` csharp
enum Position {
    First = 1,
    Second
}
```

**Good** example:

``` csharp
enum Position {
    First,
    Second
}
```

### EnumsShouldUseInt32Rule

Enumaration types should avoid specifying a non-default storage type for their values unless it is required for interoperability (e.g. with native code). If you do use a non-default type for the enum, and the enum is externally visible, then prefer the CLS-compliant integral types: System.Byte, System.Int16, System.Int32, and System.Int64.

**Bad** examples:

``` csharp
public enum SmallEnum : byte {
    Zero,
    One
}
 
[Flags]
public enum SmallFlag : ushort {
    One = 1,
    // ...
    Sixteen = 1 << 15
}
```

**Good** example:

``` csharp
public enum SmallEnum {
    Zero,
    One
}
 
[Flags]
public enum SmallFlag {
    One = 1,
    // ...
    Sixteen = 1 << 15
}
```

### FinalizersShouldBeProtectedRule

This rule verifies that finalizers are only visible to the type's family (e.g. protected in C#). If they are not family then they can be called from user code which could lead to problems. Note that this restriction is enforced by the C# and VB.NET compilers but other compilers may not do so.

**Bad** example (IL):

``` csharp
.class family auto ansi beforefieldinit BadPublicFinalizer extends
[mscorlib]System.Object
{
    .method public hidebysig instance void Finalize() cil managed
    {
        // ...
    }
}
```

**Good** example (C#):

``` csharp
public class GoodProtectedFinalizer {
    // compiler makes it protected
    ~GoodProtectedFinalizer ()
    {
    }
}
```

**Good** example (IL):

``` csharp
.class family auto ansi beforefieldinit GoodProtectedFinalizer extends
[mscorlib]System.Object
{
    .method family hidebysig instance void Finalize() cil managed
    {
        // ...
    }
}
```

### FlagsShouldNotDefineAZeroValueRule

This rule ensures that enumerations decorated with the [System.Flags] attribute do not contain a 0 value. This value would not be usable with bitwise operators.

**Bad** example (using 0 for a normal value):

``` csharp
[Flags]
[Serializable]
enum Access {
    Read = 0,
    Write = 1
}
```

**Bad** example (using None):

``` csharp
[Flags]
[Serializable]
enum Access {
    // this is less severe since the name of the 0 value helps
    None = 0,
    Read = 1,
    Write = 2
}
```

**Good** example:

``` csharp
[Flags]
[Serializable]
enum Access {
    Read = 1,
    Write = 2
}
```

### ImplementEqualsAndGetHashCodeInPairRule

This rule checks for types that either override the **Equals(object)** method without overriding **GetHashCode()** or override **GetHashCode** without overriding **Equals**. In order to work correctly types should always override these together.

**Bad** example (missing GetHashCode):

``` csharp
public class MissingGetHashCode {
    public override bool Equals (object obj)
    {
        return this == obj;
    }
}
```

**Bad** example (missing Equals):

``` csharp
public class MissingEquals {
    public override int GetHashCode ()
    {
        return 42;
    }
}
```

**Good** example:

``` csharp
public class Good {
    public override bool Equals (object obj)
    {
        return this == obj;
    }
 
    public override int GetHashCode ()
    {
        return 42;
    }
}
```

### ImplementICloneableCorrectlyRule

This rule fires if you implement a **object Clone()** method without implementing the **System.ICloneable** interface. Either change the method so that it returns a better type than System.Object or implement ICloneable.

 **Bad** example:

``` csharp
public class MyClass {
    public object Clone ()
    {
        MyClass myClass = new MyClass ();
        return myClass;
    }
}
```

**Good** example (ICloneable):

``` csharp
public class MyClass : ICloneable {
    public object Clone ()
    {
        MyClass myClass = new MyClass ();
        return myClass;
    }
}
```

**Good** example (not returning System.Object):

``` csharp
public class MyClass {
    public MyClass Clone ()
    {
        MyClass myClass = new MyClass ();
        return myClass;
    }
}
```

**Notes**

-   Prior to Gendarme 2.2 this rule was named UsingCloneWithoutImplementingICloneableRule

### ImplementIComparableCorrectlyRule

This rule checks for types that implement **System.IComparable** and verifies that the type overrides the **Equals(object)** method and overloads the **==**, **!=**, **\<** and **\>** operators.

**Bad** example:

``` csharp
public struct Comparable : IComparable {
 
    private int x;
 
    public int CompareTo (object obj)
    {
        return x.CompareTo (((Comparable)obj).x);
    }
}
```

**Good** example:

``` csharp
public struct Comparable : IComparable {
 
    public int CompareTo (object obj)
    {
        return x.CompareTo (((Comparable)obj).x);
    }
 
    public override bool Equals (object obj)
    {
        return x == ((Comparable) obj).x;
    }
 
    static public bool operator == (Comparable left, Comparable right)
    {
        return (left.x == right.x);
    }
 
    static public bool operator != (Comparable left, Comparable right)
    {
        return (left.x != right.x);
    }
 
    static public bool operator > (Comparable left, Comparable right)
    {
        return (left.x > right.x);
    }
 
    static public bool operator < (Comparable left, Comparable right)
    {
        return (left.x < right.x);
    }
}
```

**Notes**

-   This rule is available since Gendarme 2.0

### InternalNamespacesShouldNotExposeTypesRule

This rule checks for externally visible types that reside inside internal namespaces, i.e. namespaces ending with **Internal** or **Impl**.

**Bad** example:

``` csharp
namespace MyStuff.Internal {
    public class Helper {
    }
}
```

**Good** example (internal type):

``` csharp
namespace MyStuff.Internal {
    internal class Helper {
    }
}
```

**Good** example (non-internal namespace):

``` csharp
namespace MyStuff {
    public class Helper {
    }
}
```

### MainShouldNotBePublicRule

This rule fires if an assembly's entry point (typically named **Main**) is visible to other assemblies. It is better to make this method private so that only the CLR can call the method.

**Bad** example:

``` csharp
public class MainClass {
    public void Main ()
    {
    }
}
```

**Good** example (type is not externally visible):

``` csharp
internal class MainClass {
    public void Main ()
    {
    }
}
```

**Good** example (method is not externally visible):

``` csharp
public class MainClass {
    internal void Main ()
    {
    }
}
```

### MarkAssemblyWithAssemblyVersionRule

This rule fires if an assembly does not contain a **[AssemblyVersion]**attribute. Early and correct versioning of assemblies is easy and crucial for consumers of your assemblies. Note that the **[AssemblyVersion]** should match the **[AssemblyFileVersion]** attribute (if it exists).

**Good** example:

``` csharp
[assembly: AssemblyVersion ("1.0.0.0")]
```

**Notes**

-   This rule is available since Gendarme 2.2

### MarkAssemblyWithCLSCompliantRule

This rule fires if an assembly does not contain a **[CLSCompliant]** attribute. CLS compliant assemblies can be reused by any CLS-compliant language. It is a good practice to declare your global CLS goal at the assembly level and, if needed, mark some types or members that behave differently inside your assembly.

**Good** example:

``` csharp
// by default everything in this assembly is CLS compliant
[assembly: CLSCompliant (true)]
```

**Notes**

-   This rule is available since Gendarme 2.2

### MarkAssemblyWithComVisibleRule

This rule fires if an assembly does not contain a **[ComVisible]** attribute. Unless the assembly is designed with COM interoperability in mind it is better to declare it as non-COM visible, i.e. **[ComVisible (false)]**.

**Good** example:

``` csharp
// by default everything in this assembly is not visible to COM consumers
[assembly: ComVisible (false)]
```

**Notes**

-   This rule is available since Gendarme 2.2

### MissingAttributeUsageOnCustomAttributeRule

This rule verifies that every custom attribute (i.e. types that inherit from **System.Attribute**) is decorated with an **[AttributeUsage]** attribute to specify which kind of code instances of that custom attribute can be applied to.

**Bad** example:

``` csharp
// this applies to everything - but the meaning is not clear
public sealed class SomeAttribute : Attribute {
}
```

**Good** examples:

``` csharp
// this clearly applies to everything
[AttributeUsage (AttributeTargets.All)]
public sealed class AttributeApplyingToAnything : Attribute {
}
 
// while this applies only to fields
[AttributeUsage (AttributeTargets.Field)]
public sealed class AttributeApplyingToFields : Attribute {
}
```

### OperatorEqualsShouldBeOverloadedRule

This rule fires if a type overloads operator add **+**, or overloads operator subtract **-**, or is a value type and overrides **Object.Equals**, but equals **==** is not overloaded.

**Bad** example (add/substract):

``` csharp
class DoesNotOverloadOperatorEquals {
    public static int operator + (DoesNotOverloadOperatorEquals a)
    {
        return 0;
    }
 
    public static int operator - (DoesNotOverloadOperatorEquals a)
    {
        return 0;
    }
}
```

**Bad** example (value type):

``` csharp
struct OverridesEquals {
    public override bool Equals (object obj)
    {
        return base.Equals (obj);
    }
}
```

**Good** example:

``` csharp
struct OverloadsOperatorEquals {
    public static int operator + (OverloadsOperatorEquals a)
    {
        return 0;
    }
 
    public static int operator - (OverloadsOperatorEquals a)
    {
        return 0;
    }
 
    public static bool operator == (OverloadsOperatorEquals a, OverloadsOperatorEquals b)
    {
        return a.Equals (b);
    }
 
    public override bool Equals (object obj)
    {
        return base.Equals (obj);
    }
}
```

### OverrideEqualsMethodRule

This rule warns when a type overloads the equality **==** operator but does not override the **Object.Equals** method.

**Bad** example:

``` csharp
class DoesNotOverrideEquals {
    public static bool operator == (DoesNotOverloadOperatorEquals a, DoesNotOverloadOperatorEquals b)
    {
        return true;
    }
}
```

**Good** example:

``` csharp
class OverridesEquals {
    public static bool operator == (OverridesEquals a, OverridesEquals b)
    {
        return true;
    }
 
    public override bool Equals (object obj)
    {
        OverridesEquals other = (obj as OverridesEquals);
        if (other == null) {
            return false;
        }
        return (this == other);
    }
}
```

### PreferEventsOverMethodsRule

This rule checks for method names that suggest they are providing similar functionality to .NET events. When possible the method(s) should be replaced with a real event. If the methods are not using or providing event-like features then they should be renamed since such names can confuse consumers about what the method is really doing.

**Bad** example:

``` csharp
public delegate void MouseUpCallback (int x, int y, MouseButtons buttons);
 
public class MouseController {
    private MouseUpCallback mouse_up_callback;
 
    public void RaiseMouseUp (Message msg)
    {
        if (mouse_up_callback != null) {
            mouse_up_callback (msg.X, msg.Y, msg.Buttons);
        }
    }
 
    public void ProcessMessage (Message msg)
    {
        switch (msg.Id) {
            case MessageId.MouseUp: {
                RaiseMouseUp (msg);
                break;
            }
            // ... more ...
            default:
            break;
        }
    }
}
```

**Good** example:

``` csharp
public class MouseController {
    public event EventHandler<MessageEvent> MouseUp;
 
    public void ProcessMessage (Message msg)
    {
        switch (msg.Id) {
            case MessageId.MouseUp: {
                EventHandler<MessageEvent> handler = MouseUp;
                if (handler != null) {
                    handler (new MessageEvent (msg));
                }
                break;
            }
            // ... more ...
            default:
            break;
        }
    }
}
```

### PreferIntegerOrStringForIndexersRule

This rule checks for indexer properties which use unusual types as indexes. Recommended types include **Int32**, **Int64** and **String**. Using other types can be OK if the indexer is providing an abstraction onto a logical data store, but this is often not the case.

**Bad** example:

``` csharp
public bool this [DateTime date] {
    get {
        return false;
    }
}
```

**Good** example:

``` csharp
public bool IsSomethingPlanned (DateTime date)
{
    return false;
}
```

**Notes**

-   This rule is available since Gendarme 2.0

### PreferXmlAbstractionsRule

This rule fires if an externally visible method or property uses an **XmlDocument**, **XPathDocument** or **XmlNode** argument. The problem with this is that it ties your API to a specific implementation so it is difficult to change later. Instead use abstract types like **IXPathNavigable**, **XmlReader**, **XmlWriter**, or subtypes of **XmlNode**.

**Bad** example (property):

``` csharp
public class Application {
    public XmlDocument UserData {
        get {
            return userData;
        }
    }
}
```

**Good** example (property):

``` csharp
public class Application {
    public IXPathNavigable UserData {
        get {
            return userData;
        }
    }
}
```

**Bad** example (method parameter):

``` csharp
public class Application {
    public bool IsValidUserData (XmlDocument userData)
    {
        /* implementation */
    }
}
```

**Good** example (method parameter):

``` csharp
public class Application {
    public bool IsValidUserData (XmlReader userData)
    {
        /* implementation */
    }
}
```

**Notes**

-   This rule is available since Gendarme 2.6

### ProvideAlternativeNamesForOperatorOverloadsRule

The rule ensure that all overloaded operators are also accessible using named alternatives because some languages, like VB.NET, cannot use overloaded operators. For those languages named methods should be implemented that provide the same functionality. This rule verifies that a named alternative exists for each overloaded operator.

-   **op_UnaryPlus** : Plus
-   **op_UnaryNegation** : Negate
-   **op_LogicalNot** : LogicalNot
-   **op_OnesComplement** : OnesComplement

-   **op_Increment** : Increment
-   **op_Decrement** : Decrement
-   **op_True** : IsTrue
-   **op_False** : IsFalse

-   **op_Addition** : Add
-   **op_Subtraction** : Subtract
-   **op_Multiply** : Multiply
-   **op_Division** : Divide
-   **op_Modulus** : Modulus

-   **op_BitwiseAnd** : BitwiseAnd
-   **op_BitwiseOr** : BitwiseOr
-   **op_ExclusiveOr** : ExclusiveOr

-   **op_LeftShift** : LeftShift
-   **op_RightShift** : RightShift

-   **op_Equality** : Equals
-   **op_Inequality** : (not) Equals
-   **op_GreaterThan** : Compare
-   **op_LessThan** : Compare
-   **op_GreaterThanOrEqual** : Compare
-   **op_LessThanOrEqual** : Compare

 **Bad** example:

``` csharp
class DoesNotImplementAlternative {
    public static int operator + (DoesNotOverloadOperatorEquals a, DoesNotOverloadOperatorEquals b)
    {
        return 0;
    }
}
```

**Good** example:

``` csharp
class DoesImplementAdd {
    public static int operator + (DoesImplementAdd a, DoesImplementAdd b)
    {
        return 0;
    }
 
    public int Add (DoesImplementAdd a)
    {
        return this + a;
    }
}
```

### TypesShouldBeInsideNamespacesRule

This rule will fire if a type which is visible outside the assembly is not declared within a namespace. Using namespaces greatly reduces the probability of name collisions, allows tools such as auto-complete to operate better, and can make the assemblies API clearer.

**Bad** example:

``` csharp
using System;
 
public class Configuration {
}
```

**Good** example:

``` csharp
using System;
 
namespace My.Stuff {
    public class Configuration {
    }
}
```

### TypesWithDisposableFieldsShouldBeDisposableRule

This rule will fire if a type contains disposable fields but does not implement **System.IDisposable**.

**Bad** examples:

``` csharp
class DoesNotImplementIDisposable {
    IDisposable field;
}
 
class AbstractDispose : IDisposable {
    IDisposable field;
 
    // the field should be disposed in the type that declares it
    public abstract void Dispose ();
}
```

**Good** example:

``` csharp
class Dispose : IDisposable {
    IDisposable field;
 
    public void Dispose ()
    {
        field.Dispose ();
    }
}
```

### TypesWithNativeFieldsShouldBeDisposableRule

This rule will fire if a type contains **IntPtr**, **UIntPtr**, or **HandleRef** fields but does not implement **System.IDisposable**.

**Bad** examples:

``` csharp
public class DoesNotImplementIDisposable {
    IntPtr field;
}
 
abstract public class AbstractDispose : IDisposable {
    IntPtr field;
 
    // the field should be disposed in the type that declares it
    public abstract void Dispose ();
}
```

**Good** example:

``` csharp
public class Dispose : IDisposable {
    IDisposable field;
 
    public void Dispose ()
    {
        UnmanagedFree (field);
    }
}
```

### UseCorrectDisposeSignaturesRule

There is a convention that should be followed when implementing **IDisposable**. Part of this convention is that Dispose methods should have specific signatures. In particular an **IDisposable** type's Dispose methods should either be nullary or unary with a bool argument, **Dispose ()** should not be virtual, **Dispose (bool)** should not be public, and unsealed types should have a **protected virtual Dispose (bool)** method. For more details see: [[1]](http://www.bluebytesoftware.com/blog/2005/04/08/DGUpdateDisposeFinalizationAndResourceManagement.aspx).

**Bad** example:

``` csharp
public class Unsealed : IDisposable
{
    ~Unsealed ()
    {
        Dispose (false);
    }
 
    public void Dispose ()
    {
        Dispose (true);
        GC.SuppressFinalize (this);
    }
 
    // This is not virtual so resources in derived classes cannot be
    // cleaned up in a timely fashion if Unsealed.Dispose () is called.
    protected void Dispose (bool disposing)
    {
        if (!Disposed) {
            // clean up my resources
            Disposed = true;
        }
    }
 
    protected bool Disposed {
        get;
        set;
    }
}
```

**Good** example:

``` csharp
public class Unsealed : IDisposable
{
    // Unsealed classes should have a finalizer even if they do nothing
    // in the Dispose (false) case to ensure derived classes are cleaned
    // up properly.
    ~Unsealed ()
    {
        Dispose (false);
    }
 
    public Unsealed ()
    {
    }
 
    public void Work ()
    {
        // In general all public methods should throw ObjectDisposedException
        // if Dispose has been called.
        if (Disposed) {
            throw new ObjectDisposedException (GetType ().Name);
        }
    }
 
    public void Dispose ()
    {
        Dispose (true);
        GC.SuppressFinalize (this);
    }
 
    protected virtual void Dispose (bool disposing)
    {
        // Multiple Dispose calls should be OK.
        if (!Disposed) {
            if (disposing) {
                // None of our fields have been finalized so it's safe to
                // clean them up here.
            }
 
            // Our fields may have been finalized so we should only
            // touch native fields (e.g. IntPtr or UIntPtr fields) here.
            Disposed = true;
        }
    }
 
    protected bool Disposed {
        get;
        private set;
    }
}
```

**Notes**

-   This rule is available since Gendarme 2.6

### UseFlagsAttributeRule

This rule will fire if an enum's values look like they are intended to be composed together with the bitwise OR operator and the enum is not decorated with **System.FlagsAttribute**. Using **FlagsAttribute** will allow **System.Enum.ToString()** to return a better string when values are ORed together and helps indicate to readers of the code the intended usage of the enum.

**Bad** example:

``` csharp
[Serializable]
enum Options {
    First = 1,
    Second = 2,
    Third = 4,
    All = First | Second | Third,
}
```

**Good** example:

``` csharp
[Flags]
[Serializable]
enum Options {
    First = 1,
    Second = 2,
    Third = 4,
    All = First | Second | Third,
}
```

**Notes**

-   This rule is available since Gendarme 2.6

Feedback
========

Please report any documentation errors, typos or suggestions to the [Gendarme Google Group](http://groups.google.com/group/gendarme). Thanks!

