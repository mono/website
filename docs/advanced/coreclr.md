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

Por padrão todo o código é *transparent* dentro do modelo CoreCLR

-   O código *Transparent* é limitado. Especificadamente, não pode chamar diretamente o código **critical** (e.g. p/ chamar no código não seguro), mas pode chamar o código **safe-critical** e outros códigos *Transparent*.

-   Como é padrão, não há necessidade de adicionar um atributo `[SecurityTransparent]` em todo lugar.

Safe Critical
-------------

O código crítico é uma **ponte** entre o código *transparent* e o código *critical*. Como tal representa o código mais arriscado (quanto menos melhor) .

-   Todo código que é interposto entre uma API transparent (segura) e código critical (não necessariamente seguro) deve ser anotado com o atributo [SecuritySafeCritical].

-   O código *Safe critical* precisa fazer validações extras (pré e/ou pós) entre o *transparent* e o *critical* afim de merecer o prefixo safe(seguro).

Critical
--------

O código crítico pode fazer qualquer coisa, como chamar um código nativo e ter acesso a tudo fora do da caixa de areia (sandbox). 
O plugin em si (no caso do Silverlight) não conseguiria funcionar sem ter código crítico. 
No entanto as aplicações podem (e devem) funcionar ser ter acesso direto a esse tipo de código.

-   O código crítico, incluindo cada API visível que faz coisas que o código do aplicativo não deve fazer (e.g,  acesso a arquivos), devem ser marcados com um atributo `[SecurityCritical]`.

-   Todo código unsafe e declarações p/invoke são critical (mas ainda assim precisam ser marcados como tal).


Categorias dos Códigos
======================

Para tornar isso ainda mais fácil de entender, de um ponto de vista do aplicativo do desenvolvedor, 
todos os assemblies são divididos em duas categorias: o código da aplicação (ou usuário) e o 
código da plataforma.

Código da Aplicação
-------------------

O código da aplicação é executado com confiança *limitada*. Isso torna possível, juntamente com 
outros recursos, executar com segurança código não confiável dentro do seu navegador. 
O código do aplicativo funciona com seguintes regras:

-   Todo o código da aplicação é **transparent**. Usando atributos para (tentar) mudar isso irá compilar 
mas será ignorado em tempo de execução.

-   Como **transparent** ele pode chamar outro código da aplicação (todo transparent) e o código da 
plataforma que é **transparent** (padrão) ou anotado com o atributo `[ SecuritySafeCritical ]`.

-   O código da aplicação não pode chamar diretamente métodos/tipos decorados com [SecurityCritical].

Código da Plataforma
--------------------

Código da plataforma é um subconjunto do código gerenciado fornecido com o plugin. Este código é 
totalmente confiável. Como tal, não pode expor toda a sua API para o código da aplicação, 
em vez disso, pode expor seus métodos/tipos usando três níveis de segurança diferentes 
(veja a próxima seção).

-   O código de plataforma, por padrão, é **transparent**. Isto significa que a maior parte dele 
pode ser chamado diretamente do código do aplicativo.

-   O código de plataforma contém código **critical** - i.e. o código que pode fazer qualquer coisa 
(como chamar código inseguro). Esse código é implementado com atributos `[SecurityCritical]` e não 
pode ser chamado do código da aplicação.

-   Acesso do código **transparent** para o código **critical** (e.g. usando a segura, e **transparent**, 
implementação de IsolatedStorage que por sua vez código  *critical* da System.IO) é possível através de 
código implementado com o atributo `[SecuritySafeCritical]`.

A lista de assemblies que constam do Código de Plataforma inclui:

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

[1] não contém qualquer atributo [SecurityCritical] ou [SecuritySafeCritical] [2] tem uma chave 
pública diferente do que em outros assemblies.

Ambos [1] e [2] podem ser considerados códigos de plataforma - mas como eles não fazem  uso 
do `[SecurityCritical]` e nem do `[SecuritySafeCritical]`, eles são efetivamente código totalmente 
*transparent* (como o código da aplicação).

Onde? No Windows/Silverlight 2 os arquivos da plataforma podem ser encontrados em:

-   C:\\Program Files\\Microsoft Silverlight\\2.0.31005.0
-   C:\\Program Files\\Microsoft SDKs\\Silverlight\\v2.0\\Reference Assemblies

O último só existe se você tiver o Silverlight 2 SDK instalado.

Lembrete para o Desenvolvedor de Aplicações
===========================================

Apenas lembre-se: sob a CoreCLR uma aplicação pode chamar qualquer coisa 
(i.e. **transparent** ou **safe-critical**), desde que não seja **critical**.

Considerações Especiais
======================

[InternalsVisibleTo]
--------------------

São necessários cuidados especiais com código interno já que a maioria das montagens de plataforma 
inclui atributos `[InternalsVisibleTo ]` - e sim, os "internos" estão abertos para algumas 
montagens não-de-plataforma (i.e. o código da aplicação).

Introspecção (Reflection)
----------

A instrospecção é possível, mas tem algumas limitações.

Reflection.Emit
---------------

Geração de código é possível (e.g. DLR), mas também tem algumas limitações

Políticas
--------

O modelo de segurança *CoreCLR* não lida com políticas - suas decisões são verdadeiras ou falsas, PODE ou NÃO PODE. Enquanto isso funciona para a maioria das peças básicas não resolve os casos em que são necessárias regras de acesso mais elaboradas, como por exemplo:

-   Políticas de downloads.
-   Políticas de soquetes.

É necessário (fora do escopo do *CoreCLR*) ter um cuidado especial para protege-los.

Detalhes da Implementação
======================

Compatibilidade entre Atributos de Segurança
--------------------------------------------

Chamadas do **código da aplicação** para **código de plataforma** (fornecido pelo Moonlight) 
ou funcionam (e.g. chamando o código transparent ou o código `[SecuritySafeCritical]`) ou 
falham (e.g. chamando o código `[SecurityCritical]`)

Como não há distinção entre chamar o código *transparent** ou **safe critical** os usos do 
atributo [SecuritySafeCritical] no Moonlight não precisam corresponder a implementação Silverlight. 
No entanto temos de 'casar' o uso visível do atributo `[SecurityCritical]` na API pública ou protegida.

Referências
===========

-   [Introducing Microsoft Silverlight 1.1 Alpha](http://blogs.msdn.com/bclteam/archive/2007/04/30/introducing-microsoft-silverlight-1-1-alpha-justin-van-patten.aspx) by Justin Van Patten
-   [The Silverlight Security Model](http://blogs.msdn.com/shawnfa/archive/2007/05/09/the-silverlight-security-model.aspx), [Silverlight Security II: What Makes a Method Critical](http://blogs.msdn.com/shawnfa/archive/2007/05/10/silverlight-security-ii-what-makes-a-method-critical.aspx) and [Silverlight Security III: Inheritance](http://blogs.msdn.com/shawnfa/archive/2007/05/11/silverlight-security-iii-inheritance.aspx) by Shawn Farkas
-   [CLR Inside Out: Security In Silverlight2](http://msdn.microsoft.com/en-us/magazine/cc765416.aspx) by Andrew Dai
-   [Security Guidance for Writing and Deploying Silverlight Applications](http://www.microsoft.com/downloads/details.aspx?displaylang=en&FamilyID=7cef15a8-8ae6-48eb-9621-ee35c2547773)


