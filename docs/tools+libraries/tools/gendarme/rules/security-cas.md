---
title: "Gendarme Rules: Security - CAS"
redirect_from:
  - /Gendarme.Rules.Security.Cas/
---

[Gendarme](/docs/tools+libraries/tools/gendarme/)'s Code Access Security (CAS) rules are located in the **Gendarme.Rules.Security.Cas.dll** assembly. Latest sources are available from [anonymous SVN](http://anonsvn.mono-project.com/viewcvs/trunk/mono-tools/gendarme/rules/Gendarme.Rules.Security.Cas/).

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#rules">1 Rules</a>
<ul>
<li><a href="#addmissingtypeinheritancedemandrule">1.1 AddMissingTypeInheritanceDemandRule</a></li>
<li><a href="#donotexposefieldsinsecuredtyperule">1.2 DoNotExposeFieldsInSecuredTypeRule</a></li>
<li><a href="#donotexposemethodsprotectedbylinkdemandrule">1.3 DoNotExposeMethodsProtectedByLinkDemandRule</a></li>
<li><a href="#donotreducetypesecurityonmethodsrule">1.4 DoNotReduceTypeSecurityOnMethodsRule</a></li>
<li><a href="#reviewsealedtypewithinheritancedemandrule">1.5 ReviewSealedTypeWithInheritanceDemandRule</a></li>
<li><a href="#reviewsuppressunmanagedcodesecurityusagerule">1.6 ReviewSuppressUnmanagedCodeSecurityUsageRule</a></li>
<li><a href="#securegetobjectdataoverridesrule">1.7 SecureGetObjectDataOverridesRule</a></li>
</ul></li>
<li><a href="#feedback">2 Feedback</a></li>
</ul></td>
</tr>
</tbody>
</table>

Rules
=====

### AddMissingTypeInheritanceDemandRule

The rule checks for types that are not **sealed** but have a **LinkDemand**. In this case the type should also have an **InheritanceDemand** for the same permissions. An alternative is to seal the type.

**Bad** example:

``` csharp
[SecurityPermission (SecurityAction.LinkDemand, ControlThread = true)]
public class Bad {
}
```

**Good** example (InheritanceDemand):

``` csharp
[SecurityPermission (SecurityAction.LinkDemand, ControlThread = true)]
[SecurityPermission (SecurityAction.InheritanceDemand, ControlThread = true)]
public class Correct {
}
```

**Good** example (sealed):

``` csharp
[SecurityPermission (SecurityAction.LinkDemand, ControlThread = true)]
public sealed class Correct {
}
```

**Notes**

-   Before Gendarme 2.2 this rule was part of Gendarme.Rules.Security and named TypeLinkDemandRule.

### DoNotExposeFieldsInSecuredTypeRule

The rule checks for types that are secured by **Demand** or **LinkDemand**but also expose visible fields. Access to these fields is not covered by the declarative demands, opening potential security holes.

**Bad** example:

``` csharp
[SecurityPermission (SecurityAction.LinkDemand, ControlThread = true)]
public class Bad {
}
```

**Good** example (InheritanceDemand):

``` csharp
[SecurityPermission (SecurityAction.LinkDemand, ControlThread = true)]
[SecurityPermission (SecurityAction.InheritanceDemand, ControlThread = true)]
public class Correct {
}
```

**Good** example (sealed):

``` csharp
[SecurityPermission (SecurityAction.LinkDemand, ControlThread = true)]
public sealed class Correct {
}
```

**Notes**

-   Before Gendarme 2.2 this rule was part of Gendarme.Rules.Security and named TypeExposeFieldsRule.

### DoNotExposeMethodsProtectedByLinkDemandRule

This rule checks for visible methods that are less protected (i.e. lower security requirements) than the method they call. If the called methods are protected by a **LinkDemand** then the caller can be used to bypass security checks.

**Bad** example:

``` csharp
public class BaseClass {
    [SecurityPermission (SecurityAction.LinkDemand, Unrestricted = true)]
    public virtual void VirtualMethod ()
    {
    }
}
 
public class Class : BaseClass  {
    // bad since a caller with only ControlAppDomain will be able to call the base method
    [SecurityPermission (SecurityAction.LinkDemand, ControlAppDomain = true)]
    public override void VirtualMethod ()
    {
        base.VirtualMethod ();
    }
}
```

**Good** example (InheritanceDemand):

``` csharp
public class BaseClass {
    [SecurityPermission (SecurityAction.LinkDemand, ControlAppDomain = true)]
    public virtual void VirtualMethod ()
    {
    }
}
 
public class Class : BaseClass  {
    // ok since this permission cover the base class permission
    [SecurityPermission (SecurityAction.LinkDemand, Unrestricted = true)]
    public override void VirtualMethod ()
    {
        base.VirtualMethod ();
    }
}
```

**Notes**

-   Before Gendarme 2.2 this rule was part of Gendarme.Rules.Security and named MethodCallWithSubsetLinkDemandRule.

### DoNotReduceTypeSecurityOnMethodsRule

This rule checks for types that have declarative security permission which aren't a subset of the security permission of some of their methods.

**Bad** example:

``` csharp
[SecurityPermission (SecurityAction.Assert, ControlThread = true)]
public class NotSubset {
    [EnvironmentPermission (SecurityAction.Assert, Unrestricted = true)]
    public void Method ()
    {
    }
}
```

**Good** example:

``` csharp
[SecurityPermission (SecurityAction.Assert, ControlThread = true)]
public class Subset {
    [SecurityPermission (SecurityAction.Assert, Unrestricted = true)]
    public void Method ()
    {
    }
}
```

**Notes**

-   Before Gendarme 2.2 this rule was part of Gendarme.Rules.Security and named TypeIsNotSubsetOfMethodSecurityRule.

### ReviewSealedTypeWithInheritanceDemandRule

This rule checks for sealed types that have **InheritanceDemand** declarative security applied to them. Since those types cannot be inherited from the **InheritanceDemand** will never be executed by the runtime. Check if the permission is required and, if so, change the **SecurityAction** to the correct one. Otherwise remove the permission.

**Bad** example:

``` csharp
[SecurityPermission (SecurityAction.InheritanceDemand, Unrestricted = true)]
public sealed class Bad {
}
```

**Good** example (non sealed):

``` csharp
[SecurityPermission (SecurityAction.InheritanceDemand, Unrestricted = true)]
public class Good {
}
```

**Good** example (LinkDemand):

``` csharp
[SecurityPermission (SecurityAction.LinkDemand, Unrestricted = true)]
public sealed class Good {
}
```

**Notes**

-   Before Gendarme 2.2 this rule was part of Gendarme.Rules.Security and named SealedTypeWithInheritanceDemandRule.

### ReviewSuppressUnmanagedCodeSecurityUsageRule

This rule fires if a type or method is decorated with the **[SuppressUnmanagedCodeSecurity]**attribute. This attribute reduces the security checks done when executing unmanaged code and its usage should be reviewed to confirm that no exploitable security holes are present.

Example:

``` csharp
[SuppressUnmanagedCodeSecurity]
public class Safe {
    [DllImport ("User32.dll")]
    static extern Boolean MessageBeep (UInt32 beepType);
}
```

**Notes**

-   This is an Audit rule. As such it does not check for valid or invalid patterns but warns about a specific problem that needs to be reviewed by someone.

### SecureGetObjectDataOverridesRule

This rule fires if a type implements **System.Runtime.Serialization.ISerializable**but the **GetObjectData** method is not protected with a **Demand** or **LinkDemand** for **SerializationFormatter**.

**Bad** example:

``` csharp
public class Bad : ISerializable {
    public override void GetObjectData (SerializationInfo info, StreamingContext context)
    {
    }
}
```

**Good** example:

``` csharp
public class Good : ISerializable {
    [SecurityPermission (SecurityAction.LinkDemand, SerializationFormatter = true)]
    public override void GetObjectData (SerializationInfo info, StreamingContext context)
    {
    }
}
```

**Notes**

-   Before Gendarme 2.2 this rule was part of Gendarme.Rules.Security.

Feedback
========

Please report any documentation errors, typos or suggestions to the [Gendarme Google Group](http://groups.google.com/group/gendarme). Thanks!

