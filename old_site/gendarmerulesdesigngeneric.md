---
layout: obsolete
title: "Gendarme.Rules.Design.Generic"
lastmodified: '2009-12-19'
permalink: /old_site/Gendarme.Rules.Design.Generic/
redirect_from:
  - /Gendarme.Rules.Design.Generic/
---

Gendarme.Rules.Design.Generic
=============================

[Gendarme]({{site.github.url}}/old_site/Gendarme "Gendarme")'s rules about generic-related design issues are located in the **Gendarme.Rules.Design.Generic.dll** assembly. Latest sources are available from [anonymous SVN](http://anonsvn.mono-project.com/viewcvs/trunk/mono-tools/gendarme/rules/Gendarme.Rules.Design.Generic/).

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#rules">1 Rules</a>
<ul>
<li><a href="#avoidmethodwithunusedgenerictyperule">1.1 AvoidMethodWithUnusedGenericTypeRule</a></li>
<li><a href="#donotexposenestedgenericsignaturesrule">1.2 DoNotExposeNestedGenericSignaturesRule</a></li>
<li><a href="#implementgenericcollectioninterfacesrule">1.3 ImplementGenericCollectionInterfacesRule</a></li>
<li><a href="#prefergenericsoverrefobjectrule">1.4 PreferGenericsOverRefObjectRule</a></li>
<li><a href="#usegenericeventhandlerrule">1.5 UseGenericEventHandlerRule</a></li>
</ul></li>
<li><a href="#feedback">2 Feedback</a></li>
</ul></td>
</tr>
</tbody>
</table>

Rules
=====

### AvoidMethodWithUnusedGenericTypeRule

This method will fire if a generic method does not use all of its generic type parameters in the formal parameter list. This usually means that either the type parameter is not used at all in which case it should be removed or that it's used only for the return type which is problematic because that prevents the compiler from inferring the generic type when the method is called which is confusing to many developers.

**Bad** example:

``` csharp
public class Bad {
    public string ToString<T> ()
    {
        return typeof (T).ToString ();
    }
 
    static void Main ()
    {
        // the compiler can't infer int so we need to supply it ourselves
        Console.WriteLine (ToString<int> ());
    }
}
```

**Good** example:

``` csharp
public class Good {
    public string ToString<T> (T obj)
    {
        return obj.GetType ().ToString ();
    }
 
    static void Main ()
    {
        Console.WriteLine (ToString (2));
    }
}
```

**Notes**

-   This rule is available since Gendarme 2.2

### DoNotExposeNestedGenericSignaturesRule

This rule will fire if an externally visible method has a parameter or return type whose type is a generic type which contains a generic type. For example, **List\<List\<int\>\>**. Such types are hard to construct and should be avoided because simpler alternatives generally exist. Since some language, like C\#, have direct support for nullable types, i.e. **Nullable\<T\>** this specific case is ignored by the rule.

**Bad** example:

``` csharp
public class Generic<T> {
    public void Process (KeyValuePair<T, ICollection<int>> value)
    {
    }
}
```

**Good** example:

``` csharp
public class Generic<T> {
    public void Process (KeyValuePair<T, int[]> value)
    {
    }
}
```

**Notes**

-   This rule is available since Gendarme 2.4

### ImplementGenericCollectionInterfacesRule

This rule checks for types which implement the non-generic IEnumerable interface but not the IEnumerable\<T\> interface. Implementing the generic version of IEnumerable avoids casts, and possibly boxing, when iterating the collection.

**Bad** example:

``` csharp
public class IntEnumerable : IEnumerable {
    public IEnumerator GetEnumerator ()
    {
    }
}
```

**Good** example:

``` csharp
public class IntEnumerable : IEnumerable<int> {
    public IEnumerator<int> GetEnumerator ()
    {
    }
 
    IEnumerator IEnumerable.GetEnumerator ()
    {
    }
}
```

**Notes**

-   Before Gendarme 2.2 this rule was part of Gendarme.Rules.Design assembly.

### PreferGenericsOverRefObjectRule

This rule fires if a method has a reference argument (**ref** or **out** in C\#) to System.Object. These methods can generally be rewritten in .NET 2.0 using generics which provides type safety, eliminates casts, and makes the API easier to consume.

**Bad** example:

``` csharp
// common before 2.0 but we can do better now
public bool TryGetValue (string key, ref object value)
{
    // ...
}
```

**Good** example:

``` csharp
public bool TryGetValue<T> (string key, ref T value)
{
    // ...
}
```

**Notes**

-   This rule is available since Gendarme 2.2

### UseGenericEventHandlerRule

This rule fires if an assembly targets .NET 2.0 or later and defines a delegate which can be replaced by **System.EventHandler\<TEventArgs\>**.

**Bad** example:

``` csharp
public delegate void AuthenticityHandler (object sender, AuthenticityEventArgs e);
 
public event AuthenticityHandler CheckingAuthenticity;
public event AuthenticityHandler CheckedAuthenticity;
```

**Good** example:

``` csharp
public event EventHandler<AuthenticityEventArgs> CheckingAuthenticity;
public event EventHandler<AuthenticityEventArgs> CheckedAuthenticity;
```

**Notes**

-   This rule is available since Gendarme 2.2

Feedback
========

Please report any documentation errors, typos or suggestions to the [Gendarme Google Group](http://groups.google.com/group/gendarme). Thanks!

