---
title: "Regras Gendarme: Segurança - CAS"
redirect_from:
  - /Gendarme.Rules.Security.Cas/
---

As regras do [Gendarme](/docs/tools+libraries/tools/gendarme/) para o Code Access Security (CAS) estão localizados na assembly **Gendarme.Rules.Security.Cas.dll**. 
Os fontes correntes estão disponíveis no [git](https://github.com/mono/mono-tools/tree/master/gendarme/rules/Gendarme.Rules.Security.Cas).

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Sumário</h2>
<ul>
<li><a href="#rules">1 Regras</a>
<ul>
<li><a href="#addmissingtypeinheritancedemandrule">1.1 AddMissingTypeInheritanceDemandRule</a></li>
<li><a href="#donotexposefieldsinsecuredtyperule">1.2 DoNotExposeFieldsInSecuredTypeRule</a></li>
<li><a href="#donotexposemethodsprotectedbylinkdemandrule">1.3 DoNotExposeMethodsProtectedByLinkDemandRule</a></li>
<li><a href="#donotreducetypesecurityonmethodsrule">1.4 DoNotReduceTypeSecurityOnMethodsRule</a></li>
<li><a href="#reviewsealedtypewithinheritancedemandrule">1.5 ReviewSealedTypeWithInheritanceDemandRule</a></li>
<li><a href="#reviewsuppressunmanagedcodesecurityusagerule">1.6 ReviewSuppressUnmanagedCodeSecurityUsageRule</a></li>
<li><a href="#securegetobjectdataoverridesrule">1.7 SecureGetObjectDataOverridesRule</a></li>
</ul></li>
<li><a href="#feedback">2 Comentários</a></li>
</ul></td>
</tr>
</tbody>
</table>

Regras
=====

### AddMissingTypeInheritanceDemandRule

Essa regra verifica se há tipos que não são **selados**  (```sealed```) mas tem um **LinkDemand**. Neste caso, o tipo também deve ter um **InheritanceDemand** para as mesmas permissões. Uma alternativa é selar o tipo.

Exemplo **Errado**:

``` csharp
[SecurityPermission (SecurityAction.LinkDemand, ControlThread = true)]
public class Errado{
}
```

Exemplo **Correto** usando (InheritanceDemand):

``` csharp
[SecurityPermission (SecurityAction.LinkDemand, ControlThread = true)]
[SecurityPermission (SecurityAction.InheritanceDemand, ControlThread = true)]
public class Correto {
}
```

Exemplo **Correto** usando (sealed):

``` csharp
[SecurityPermission (SecurityAction.LinkDemand, ControlThread = true)]
public sealed class Correto {
}
```

**Notas**

-   Antes do Gendarme 2.2 essa regra era parte de Gendarme.Rules.Security com o nome de TypeLinkDemandRule.

### DoNotExposeFieldsInSecuredTypeRule

Essa regra verifica os tipos que são protegidos por **Demand** ou **LinkDemand** mas também expõe campos visíveis. O acesso a estes campos não são cobertos pelas exigências declarativas, abrindo brechas de segurança em potencial.

Exemplo **Errado**:

``` csharp
[SecurityPermission (SecurityAction.LinkDemand, ControlThread = true)]
public class Errado {
}
```

Exemplo **Correto** usando (InheritanceDemand):

``` csharp
[SecurityPermission (SecurityAction.LinkDemand, ControlThread = true)]
[SecurityPermission (SecurityAction.InheritanceDemand, ControlThread = true)]
public class Correto {
}
```

Exemplo **Correto** usando (sealed):

``` csharp
[SecurityPermission (SecurityAction.LinkDemand, ControlThread = true)]
public sealed class Correto {
}
```

**Notas**

-   Antes do Gendarme 2.2 essa regra era parte da Gendarme.Rules.Security e da nomenclatura TypeExposeFieldsRule.

### DoNotExposeMethodsProtectedByLinkDemandRule

Esta regra verifica métodos visíveis que são menos protegidos (ou seja, os requisitos de segurança são mais baixas) do que o método que eles chamam. Se os métodos chamados são protegidos por um **LinkDemand** em seguida, o chamador pode ser utilizado para verificações de segurança de bypass.

Exemplo **Errado**:

``` csharp
public class BaseClass {
    [SecurityPermission (SecurityAction.LinkDemand, Unrestricted = true)]
    public virtual void VirtualMethod ()
    {
    }
}
 
public class Class : BaseClass  {
    // Errado, já que um chamador com apenas ControlAppDomain será capaz de chamar o método base
    [SecurityPermission (SecurityAction.LinkDemand, ControlAppDomain = true)]
    public override void VirtualMethod ()
    {
        base.VirtualMethod ();
    }
}
```

Exemplo **Correto** usando (InheritanceDemand):

``` csharp
public class BaseClass {
    [SecurityPermission (SecurityAction.LinkDemand, ControlAppDomain = true)]
    public virtual void VirtualMethod ()
    {
    }
}
 
public class Class : BaseClass  {
    // Correto desde essa permissão cubra a permissão da classe base
    [SecurityPermission (SecurityAction.LinkDemand, Unrestricted = true)]
    public override void VirtualMethod ()
    {
        base.VirtualMethod ();
    }
}
```

**Notas**

-   Antes do Gendarme 2.2 essa regra era parte do Gendarme.Rules.Security com o nome de MethodCallWithSubsetLinkDemandRule.

### DoNotReduceTypeSecurityOnMethodsRule

Esta regra verifica os tipos que têm permissão de segurança declarativa, que não são um subconjunto da permissão de alguns de seus métodos de segurança.

Exemplo **Errado**

``` csharp
[SecurityPermission (SecurityAction.Assert, ControlThread = true)]
public class NotSubset {
    [EnvironmentPermission (SecurityAction.Assert, Unrestricted = true)]
    public void Method ()
    {
    }
}
```

Exemplo **Correto**

``` csharp
[SecurityPermission (SecurityAction.Assert, ControlThread = true)]
public class Subset {
    [SecurityPermission (SecurityAction.Assert, Unrestricted = true)]
    public void Method ()
    {
    }
}
```

**Notas**

-   Antes do Gendarme 2.2 essa regra era parte do Gendarme.Rules.Security a da nomenclatura TypeIsNotSubsetOfMethodSecurityRule.

### ReviewSealedTypeWithInheritanceDemandRule

Esta regra verifica os tipos fechados que têm **InheritanceDemand** segurança declarativa aplicada a eles. Desde que esses tipos não possam ser herdadas do **InheritanceDemand** nunca serão executado pelo tempo de execução. Verifique se a permissão é necessária e, em caso afirmativo, altere o **SecurityAction** para a correta. Caso contrário, remover a permissão.

Exemplo **Errado**:

``` csharp
[SecurityPermission (SecurityAction.InheritanceDemand, Unrestricted = true)]
public sealed class Errado {
}
```

Exemplo **Correto** usando (sem sealed):

``` csharp
[SecurityPermission (SecurityAction.InheritanceDemand, Unrestricted = true)]
public class Correto {
}
```

Exemplo **Correto** usando (LinkDemand):

``` csharp
[SecurityPermission (SecurityAction.LinkDemand, Unrestricted = true)]
public sealed class Correto {
}
```

**Notas**

-   Antes do Gendarme 2.2 essa regra era parte do Gendarme.Rules.Security com o nome de SealedTypeWithInheritanceDemandRule.

### ReviewSuppressUnmanagedCodeSecurityUsageRule

Essa regra dispara, se um tipo ou método é marcado com o atributo **[SuppressUnmanagedCodeSecurity]**. Esse atributo reduz as verificações de segurança feitas durante a execução de código não gerenciado, e seu uso deve ser revisto para confirmar que não há falhas de segurança exploráveis presentes na implementação.

Exemplo:

``` csharp
[SuppressUnmanagedCodeSecurity]
public class Seguro {
    [DllImport ("User32.dll")]
    static extern Boolean MessageBeep (UInt32 beepType);
}
```

**Notas**

-   Essa é uma regra de auditoria. Como tal, ela não verifica padrões válidos ou inválidos, mas adverte sobre um problema específico que precisa ser revisado por alguém.

### SecureGetObjectDataOverridesRule

Esta regra é acionado quando se implementa um tipo **System.Runtime.Serialization.ISerializable** mas o método **GetObjectData** não está protegido com uma **Demand** ou um **LinkDemand** para **SerializationFormatter**.

Exemplo **Errado**:

``` csharp
public class Errodo : ISerializable {
    public override void GetObjectData (SerializationInfo info, StreamingContext context)
    {
    }
}
```

Exemplo **Correto**:

``` csharp
public class Correto : ISerializable {
    [SecurityPermission (SecurityAction.LinkDemand, SerializationFormatter = true)]
    public override void GetObjectData (SerializationInfo info, StreamingContext context)
    {
    }
}
```

**Notas**

-   Antes do Gendarme 2.2 essa regra era parte do Gendarme.Rules.Security.

Comentários
===========

Por favor, reporte qualquer erro na documentação, erros de digitação ou sugestões para o [Grupo de Discussão do Gendarme](http://groups.google.com/group/gendarme) no Google. Obrigado!

