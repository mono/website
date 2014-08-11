---
title: "Gendarme Rules: Security"
redirect_from:
  - /Gendarme.Rules.Security/
---

[Gendarme](/docs/tools+libraries/tools/gendarme/)'s security rules are located in the **Gendarme.Rules.Security.dll** assembly. Latest sources are available from [anonymous SVN](http://anonsvn.mono-project.com/viewcvs/trunk/mono-tools/gendarme/rules/Gendarme.Rules.Security/).

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#rules">1 Rules</a>
<ul>
<li><a href="#arrayfieldsshouldnotbereadonlyrule">1.1 ArrayFieldsShouldNotBeReadOnlyRule</a></li>
<li><a href="#donotshortcircuitcertificatecheckrule">1.2 DoNotShortCircuitCertificateCheckRule</a></li>
<li><a href="#nativefieldsshouldnotbevisiblerule">1.3 NativeFieldsShouldNotBeVisibleRule</a></li>
<li><a href="#staticconstructorsshouldbeprivaterule">1.4 StaticConstructorsShouldBePrivateRule</a></li>
</ul></li>
<li><a href="#feedback">2 Feedback</a></li>
</ul></td>
</tr>
</tbody>
</table>

Rules
=====

### ArrayFieldsShouldNotBeReadOnlyRule

This rule warns if a type declares a public **readonly** array field. Marking a field **readonly** only prevents the field from being assigned a different value, the object itself can still be changed. This means, that the elements inside the array can still be changed.

**Bad** example:

``` csharp
class Bad {
    public readonly string[] Array = new string[] { "A", "B" };
}
 
HasPublicReadonlyArray obj = HasPublicReadonlyArray ();
obj.Array[0] = "B"; // valid
```

**Good** example:

``` csharp
class Good {
    private readonly string[] array = new string[] { "A", "B" };
    public string[] GetArray ()
    {
        return (string []) array.Clone();
    }
}
 
string[] obj = new HasPublicReadonlyArray ().GetArray ();
obj [0] = "B"; // valid, but has no effect on other users
```

### DoNotShortCircuitCertificateCheckRule

This rule checks for methods that implements pass-through certificate checks. I.e. methods that override the framework decision about a certificate validity without checking anything specific about the supplied certificate or error code. Protocols like TLS/SSL are only secure if the certificates are used correctly.

**Bad** example (ICertificatePolicy):

``` csharp
public class AcceptEverythingCertificatePolicy : ICertificatePolicy {
    public bool CheckValidationResult (ServicePoint srvPoint, X509Certificate certificate, WebRequest request, int certificateProblem)
    {
        // this accepts everything making it easy for MITM
        // (Man-in-the-middle) attacks
        return true;
    }
}
```

**Good** example (ICertificatePolicy):

``` csharp
public class AllowSpecificCertificatePolicy : ICertificatePolicy {
    public bool CheckValidationResult (ServicePoint srvPoint, X509Certificate certificate, WebRequest request, int certificateProblem)
    {
        // this accept only a specific certificate, even if others would be ok
        return (certificate.GetCertHashString () == "D62F48D013EE7FB58B79074512670D9C5B3A5DA9");
    }
}
```

**Bad** example (RemoteCertificateValidationCallback):

``` csharp
public bool CertificateValidationCallback (object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors)
{
    // this accepts everything making it easy for MITM
    // (Man-in-the-middle) attacks
    return true;
}
 
SslStream ssl = new SslStream (stream, false, new RemoteCertificateValidationCallback (CertificateValidationCallback), null);
```

**Good** example (RemoteCertificateValidationCallback):

``` csharp
public bool CertificateValidationCallback (object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors)
{
    // this accept only a specific certificate, even if others would be ok
    return (certificate.GetCertHashString () == "D62F48D013EE7FB58B79074512670D9C5B3A5DA9");
}
 
SslStream ssl = new SslStream (stream, false, new RemoteCertificateValidationCallback (CertificateValidationCallback), null);
```

**Notes**

-   This rule is available since Gendarme 2.4

### NativeFieldsShouldNotBeVisibleRule

This rule checks if a class exposes native fields. Native fields should not be public because you lose control over their lifetime (other code could free the memory or use it after it has been freed).

**Bad** example:

``` csharp
public class HasPublicNativeField {
    public IntPtr NativeField;
}
```

**Good** example (hide):

``` csharp
class HasPrivateNativeField {
    private IntPtr NativeField;
    public void DoSomethingWithNativeField ();
}
```

**Good** example (read-only):

``` csharp
class HasReadOnlyNativeField {
    public readonly IntPtr NativeField;
}
```

### StaticConstructorsShouldBePrivateRule

This rule will fire if a type's static constructor is not private. This is a problem because the static constructor is meant to be called by the runtime but if it is not private then other code may call it as well which may lead to security vulnerabilities. Note that C\# and VB.NET enforce this rule.

Feedback
========

Please report any documentation errors, typos or suggestions to the [Gendarme Google Group](http://groups.google.com/group/gendarme). Thanks!

