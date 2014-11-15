---
title: CoreCLR
redirect_from:
- /Moonlight2CoreCLR/
---

Nota: devido à complexidade das definições você vai precisar de algum conhecimento prévio do modelo de segurança CoreCLR **ou** ler duas vezes para entender o sentido ;-)

Os níveis de segurança
===============

O modelo de segurança CoreCLR divide todo o código em três níveis distintos: **transparent**, **safe-critical** e **critical**. Este modelo é muito mais simples de entender (e aplicar) do que [CAS](/docs/advanced/cas/) (e.g, sem stack-walk). Com apenas algumas regras podemos  descrever grande parte dele.

Transparent
-----------

Por padrão todo o código é *transparent* abaixo do modelo CoreCLR

-   O código *Transparent* é limitado. Especificadamente, não pode chamar diretamente o código **critical** (e.g. p/ chamar no código não seguro), mas pode chamar o código **safe-critical** e outros códigos *Transparent*.

-   Como é padrão, não há necessidade de adicionar um atributo `[SecurityTransparent]` em todo lugar.

Safe Critical
-------------

O código crítico é uma **ponte** entre o código *transparent* e o código *critical*. Como tal, é um código mais arriscado (quanto menor melhor) .

-   O código precisa abrir caminho entre a API *transparent* (segura) até (não necessariamente seguro) código *critical* e incrementado com os atributos `[SecuritySafeCritical]`.

-   O código *Safe critical* precisa fazer (antes e/ou depois) validações extras entre o *transparent* e o *critical* afim de fazer a chamada ter seu prefixo **seguro**.

Critical
--------

O código crítico pode fazer qualquer coisa, como chamar um código nativo e ter acesso a tudo fora do navegador host. O plugin somente não poderia trabalhar sem o código crítico . No entanto aplicações podem (e devem) fazer sem acessar diretamente ele.

-   O código crítico, incluindo cada API visível que faz coisas que o código do aplicativo não deve fazer (e.g,  arquivo IO), devem ser marcados com um atributo `[SecurityCritical]`.
-   Todo o código não seguro, p/ chamar declarações **critical** (mas ainda precisa ser marcado como tal).


Categorias dos códigos
===============

Para tornar isso ainda mais fácil de entender, de um ponto de vista do aplicativo do desenvolvedor, todos os assemblies são divididos em duas categorias: o código da aplicação (ou usuário) e o código da plataforma.

Código da aplicação
----------------

O código da aplicatição é executado com confiança limitada. Isso torna possível, juntamente com outros recursos, para executar código não confiável com segurança dentro do seu navegador. O código do aplicativo funciona com seguintes regras:

-   Todo o código da aplicação é **transparent**. Usando atributos para (tentar) mudar isso irá compilar mas será ignorado em tempo de execução.
-   Como **transparent** ele pode chamar outro código da aplicação (tudo transparente) e o código da plataforma que é **transparent** (padrão) ou incrementado com o atributo `[ SecuritySafeCritical ]`.
-   O código da aplicação não pode chamar diretamente o método/tipo `[SecurityCritical]` presente no código da plataforma.

Código da plataforma
-------------

Código da plataforma é um subconjunto do código gerenciado fornecido com o plugin. Este código é totalmente confiável. Como tal, não pode expor toda a sua API para o código da aplicação, em vez disso, expô-los usando três níveis de segurança diferentes (veja a próxima seção).

-   O código de plataforma, por padrão, **transparent**. Isto significa que a maior parte dele pode ser chamado diretamente do código do aplicativo.

-   O código de plataforma contém código **critical** - i.e. o código que fazer qualquer coisa (como chamar código inseguro). Esse código é implementado com atributos `[SecurityCritical]` e não pode ser chamado do código da aplicação.

-   Acesso do código **transparent** para o código **critical** (e.g. usando segurança, e transparente, IsolatedStorage que por si só chama, e *critical*, código System.IO) é possível através de código implementado com o atributo `[SecuritySafeCritical]`.

A plataforma de código assemblies inclui:

-   mscorlib
-   Microsoft.VisualBasic [1][2]
-   System
-   System.Core
-   System.Net
-   System.Runtime.Serialization
-   System.ServiceModel [1][2]
-   System.ServiceModel.Web [1]
-   System.Windows
-   System.Windows.Browser
-   System.Xml

[1] não contém qualquer atributo [SecurityCritical] ou [SecuritySafeCritical] [2] tem uma chave pública diferente do que em outros assemblies.

Ambos [1] e [2] podem ser considerados códigos de plataforma - mas desde que eles não o façam (mas, eu acho que, eventualmente, poderia) uso do `[SecurityCritical]` e nem do `[SecuritySafeCritical]`, que estão totalmente transparente (como o código aplicação)

Onde? No Windows/Silverlight 2 os arquivos da plataforma podem ser encontrados em:

-   C:\\Program Files\\Microsoft Silverlight\\2.0.31005.0
-   C:\\Program Files\\Microsoft SDKs\\Silverlight\\v2.0\\Reference Assemblies

O último só existe se você tiver o Silverlight 2 SDK instalado.

Atalhos da aplicação do desenvolvedor
==============================

Apenas lembre-se: sob a CoreCLR uma aplicação pode chamar qualquer coisa (i.e. **transparent** ou **safe-critical**), desde que não seja **critical**.

Considerações especiais
======================

[InternalsVisibleTo]
--------------------

São necessários cuidados especiais com código interno já que a maioria da plataforma assemblies inclui atributos `[InternalsVisibleTo ]` - e sim, os internos estão abertas para alguns assemblies não-plataforma (i.e. o código da aplicação).

Reflection
----------

O Reflection é possível, mas tem algumas limitações.

Reflection.Emit
---------------

Geração de código é possível (e.g. DLR), mas também tem algumas limitações

Políticas
--------

The *CoreCLR* security model does not deal with policies - its decisions are a boolean **CAN** or **CANNOT** do. While this works for the most basic parts it does not solve cases where more elaborate access rules are required, e.g.:
O modelo de segurança *CoreCLR* não lida com políticas - suas decisões são verdadeiras ou falsas, **CAN** ou **CANNOT**. Enquanto isso funciona para a maioria das peças básicas não resolve os casos em que são necessárias regras de acesso mais elaboradas, como por exemplo:

-   Políticas de downloads.
-   Políticas de soquetes.

É necessário (fora do escopo do *CoreCLR*) ter um cuidado especial para protege-los.

Detalhes da implementação
======================

Compatibilidade de atributos de Segurança
---------------------------------

Chamadas do **código da aplicação** para **código de plataforma** (que fornece o Moonlight) com sucesso (e.g. chamando o código transparent ou o código `[SecuritySafeCritical]`) ou com falha (e.g. chamando o código `[SecurityCritical]`)

Como **não** há distinção de chamar o código *transparent** ou **safe critical** nosso atributo (Moonlight) `[SecuritySafeCritical]` não precisam corresponder a implementação Silverlight. No entanto temos de corresponder ao atributo `[SecurityCritical]` visível na (pública ou protegida) API.

Referências
==========

-   [Introducing Microsoft Silverlight 1.1 Alpha](http://blogs.msdn.com/bclteam/archive/2007/04/30/introducing-microsoft-silverlight-1-1-alpha-justin-van-patten.aspx) by Justin Van Patten
-   [The Silverlight Security Model](http://blogs.msdn.com/shawnfa/archive/2007/05/09/the-silverlight-security-model.aspx), [Silverlight Security II: What Makes a Method Critical](http://blogs.msdn.com/shawnfa/archive/2007/05/10/silverlight-security-ii-what-makes-a-method-critical.aspx) and [Silverlight Security III: Inheritance](http://blogs.msdn.com/shawnfa/archive/2007/05/11/silverlight-security-iii-inheritance.aspx) by Shawn Farkas
-   [CLR Inside Out: Security In Silverlight2](http://msdn.microsoft.com/en-us/magazine/cc765416.aspx) by Andrew Dai
-   [Security Guidance for Writing and Deploying Silverlight Applications](http://www.microsoft.com/downloads/details.aspx?displaylang=en&FamilyID=7cef15a8-8ae6-48eb-9621-ee35c2547773)


