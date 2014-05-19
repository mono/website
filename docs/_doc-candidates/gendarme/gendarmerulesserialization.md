---
layout: obsolete
title: "Gendarme.Rules.Serialization"
permalink: /old_site/Gendarme.Rules.Serialization/
redirect_from:
  - /Gendarme.Rules.Serialization/
---

Gendarme.Rules.Serialization
============================

[Gendarme]({{site.github.url}}/old_site/Gendarme "Gendarme")'s rules that check for serialization issues are located in the **Gendarme.Rules.Serialization.dll** assembly. Latest sources are available from [anonymous SVN](http://anonsvn.mono-project.com/viewcvs/trunk/mono-tools/gendarme/rules/Gendarme.Rules.Serialization/).

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#rules">1 Rules</a>
<ul>
<li><a href="#callbasemethodsoniserializabletypesrule">1.1 CallBaseMethodsOnISerializableTypesRule</a></li>
<li><a href="#deserializeoptionalfieldrule">1.2 DeserializeOptionalFieldRule</a></li>
<li><a href="#implementiserializablecorrectlyrule">1.3 ImplementISerializableCorrectlyRule</a></li>
<li><a href="#markallnonserializablefieldsrule">1.4 MarkAllNonSerializableFieldsRule</a></li>
<li><a href="#markenumerationsasserializablerule">1.5 MarkEnumerationsAsSerializableRule</a></li>
<li><a href="#missingserializableattributeoniserializabletyperule">1.6 MissingSerializableAttributeOnISerializableTypeRule</a></li>
<li><a href="#missingserializationconstructorrule">1.7 MissingSerializationConstructorRule</a></li>
<li><a href="#usecorrectsignatureforserializationmethodsrule">1.8 UseCorrectSignatureForSerializationMethodsRule</a></li>
</ul></li>
<li><a href="#feedback">2 Feedback</a></li>
</ul></td>
</tr>
</tbody>
</table>

Rules
=====

### CallBaseMethodsOnISerializableTypesRule

This rule checks types that implement the **System.ISerializable** interface and fires if either the serialization constructor or the **GetObjectData**method does not call it's **base** type, potentially breaking the serialization process.

**Bad** example:

``` csharp
[Serializable]
public class Base : ISerializable {
    // ...
}
 
[Serializable]
public class Bad : Base {
    int value;
 
    protected BadDerived (SerializationInfo info, StreamingContext context)
    {
        value = info.GetInt32 ("value");
    }
 
    public override void GetObjectData (SerializationInfo info, StreamingContext context)
    {
        info.AddValue ("value", value);
    }
}
```

**Good** example:

``` csharp
[Serializable]
public class Base : ISerializable {
    // ...
}
 
[Serializable]
public class Good : Base {
    int value;
 
    protected BadDerived (SerializationInfo info, StreamingContext context) : base (info, context)
    {
        value = info.GetInt32 ("value");
    }
 
    public override void GetObjectData (SerializationInfo info, StreamingContext context)
    {
        info.AddValue ("value", value);
        base.GetObjectData (info, context);
    }
}
```

**Notes**

-   This rule is available since Gendarme 2.2

### DeserializeOptionalFieldRule

This rule will fire if a type has fields marked with **[OptionalField]**, but does not have methods decorated with the **[OnDeserialized]** or **[OnDeserializing]** attributes. This is a problem because the binary deserializer does not actually construct objects (it uses **System.Runtime.Serialization.FormatterServices.GetUninitializedObject**instead). So, if binary deserialization is used the optional field(s) will be zeroed instead of properly initialized. This rule only applies to assemblies compiled with the .NET framework version 2.0 (or later).

**Bad** example:

``` csharp
[Serializable]
public class ClassWithOptionalField {
    [OptionalField]
    private int optional;
}
```

**Good** example:

``` csharp
[Serializable]
public class ClassWithOptionalField {
    // Normally the (compiler generated) default constructor will
    // initialize this. The default constructor will be called by the
    // XML and Soap deserializers, but not the binary serializer.
    [OptionalField]
    private int optional = 1;
 
    // This will be called immediately after the object is
    // deserialized.
    [OnDeserializing]
    private void OnDeserializing (StreamingContext context)
    {
        optional = 1;
    }
}
```

**Notes**

-   This rule is available since Gendarme 2.0

### ImplementISerializableCorrectlyRule

This rule checks for types that implement **ISerializable**. Such types serialize their data by implementing **GetObjectData**. This rule verifies that every instance field, not decorated with the **[NonSerialized]**attribute is serialized by the **GetObjectData** method. This rule will also warn if the type is unsealed and the **GetObjectData** is not **virtual**.

**Bad** example:

``` csharp
[Serializable]
public class Bad : ISerializable {
    int foo;
    string bar;
 
    protected Bad (SerializationInfo info, StreamingContext context)
    {
        foo = info.GetInt32 ("foo");
    }
 
    // extensibility is limited since GetObjectData is not virtual:
    // any type inheriting won't be able to serialized additional fields
    public void GetObjectData (SerializationInfo info, StreamingContext context)
    {
        info.AddValue ("foo", foo);
        // 'bar' is not serialized, if not needed then the field should
        // be decorated with [NotSerialized]
    }
}
```

**Good** example (virtual and not serialized):

``` csharp
[Serializable]
public class Good : ISerializable {
    int foo;
    [NotSerialized]
    string bar;
 
    protected Good (SerializationInfo info, StreamingContext context)
    {
        foo = info.GetInt32 ("foo");
    }
 
    public virtual void GetObjectData (SerializationInfo info, StreamingContext context)
    {
        info.AddValue ("foo", foo);
    }
}
```

**Good** example (sealed type and serialized):

``` csharp
[Serializable]
public sealed class Good : ISerializable {
    int foo;
    string bar;
 
    protected Good (SerializationInfo info, StreamingContext context)
    {
        foo = info.GetInt32 ("foo");
    }
 
    public void GetObjectData (SerializationInfo info, StreamingContext context)
    {
        info.AddValue ("foo", foo);
        info.AddValue ("bar", bar);
    }
}
```

**Notes**

-   This rule is available since Gendarme 2.0

### MarkAllNonSerializableFieldsRule

This rule checks for serializable types, i.e. decorated with the **[Serializable]**attribute, and checks to see if all its fields are serializable as well. If not the rule will fire unless the field is decorated with the **[NonSerialized]** attribute. The rule will also warn if the field type is an interface as it is not possible, before execution time, to know for certain if the type can be serialized or not.

**Bad** example:

``` csharp
class NonSerializableClass {
}
 
[Serializable]
class SerializableClass {
    NonSerializableClass field;
}
```

**Good** example:

``` csharp
class NonSerializableClass {
}
 
[Serializable]
class SerializableClass {
    [NonSerialized]
    NonSerializableClass field;
}
```

**Notes**

-   This rule is available since Gendarme 2.0

### MarkEnumerationsAsSerializableRule

This rule warns when it founds an **enum** that is not decorated with a **[Serializable]** attribute. Enums, even without the attribute, are always serializable. Marking them as such makes the source code more readable.

**Bad** example:

``` csharp
public enum Colors {
    Black,
    White
}
```

**Good** example:

``` csharp
[Serializable]
public enum Colors {
    Black,
    White
}
```

**Notes**

-   This rule is available since Gendarme 2.2

### MissingSerializableAttributeOnISerializableTypeRule

This rule checks for types that implement **System.ISerializable** but are not decorated with the **[Serializable]** attribute. Implementing **System.ISerializable** is not enough to make a class serializable as this interface only gives you more control over the basic serialization process. In order for the runtime to know your type is serializable it must have the **[Serializable]** attribute.

**Bad** example:

``` csharp
// this type cannot be serialized by the runtime
public class Bad : ISerializable {
}
```

**Good** example:

``` csharp
[Serializable]
public class Good : ISerializable {
}
```

**Notes**

-   This rule is available since Gendarme 2.0

### MissingSerializationConstructorRule

This rule checks for types that implement **System.ISerializable** but don't provide a serialization constructor. The constructor is required in order to make the type serializeable but cannot be enforced by the interface. The serialization constructor should be **private** for **sealed** types and **protected** for unsealed types.

**Bad** example:

``` csharp
[Serializable]
public class Bad : ISerializable {
    public void GetObjectData (SerializationInfo info, StreamingContext context)
    {
    }
}
```

**Good** example (sealed):

``` csharp
[Serializable]
public sealed class Good : ISerializable {
    private ClassWithConstructor (SerializationInfo info, StreamingContext context)
    {
    }
 
    public void GetObjectData (SerializationInfo info, StreamingContext context)
    {
    }
}
```

**Good** example:

``` csharp
[Serializable]
public class Good : ISerializable {
    protected ClassWithConstructor (SerializationInfo info, StreamingContext context)
    {
    }
 
    public void GetObjectData (SerializationInfo info, StreamingContext context)
    {
    }
}
```

**Notes**

-   This rule is available since Gendarme 2.0

### UseCorrectSignatureForSerializationMethodsRule

This rule checks for methods which use the serialization attributes: **[OnSerializing, OnDeserializing, OnSerialized, OnDeserialized]**. You must ensure that these methods have the correct signature. They should be **private**, return **void** and have a single parameter of type **StreamingContext**. Failure to have the right signature can, in some circumstances, make your assembly unusable at runtime.

**Bad** example:

``` csharp
[Serializable]
public class Bad {
    [OnSerializing]
    public bool Serializing (StreamingContext context)
    {
    }
}
```

**Good** example:

``` csharp
[Serializable]
public class BadClass {
    [OnSerializing]
    private void Serializing (StreamingContext context)
    {
    }
}
```

**Notes**

-   This rule is available since Gendarme 2.0

Feedback
========

Please report any documentation errors, typos or suggestions to the [Gendarme Google Group](http://groups.google.com/group/gendarme). Thanks!

