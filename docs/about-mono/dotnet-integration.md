---
title: Integração dos Fontes Abertos do .NET
---

Com a recente liberação de partes do código do .NET, nós queremos trazer
os melhores pedaços do .NET para o Mono, e contribuir os componentes 
multi-plataforma do Mono para os esforços do .NET.

Este documento descreve as estratégias que nos utilizaremos.

Nós estaremos [acompanhando os esforços no Trello](https://trello.com/b/vRPTMfdz/net-framework-integration-into-mono)

Contexto
========

A Microsoft está abrindo o .NET em duas formas:

* [.NET Core](http://github.com/corefx): é uma versão re-imaginada do .NET
que é capaz de ser instalada integrada a aplicações web e fortemente focada 
em um novo conjunto de assemblies e APIs baseada no perfil PCL 2.0. 
É um projeto completamente open source, com a Microsoft aceitando contribuições 
e desenvolvendo de forma aberta.

* [Partes do Framework .NET](http://github.com/Microsoft/referencesource): 
são partes do framework .NET que vem com o Windows, e a API que o Mono vem 
implementado ao longo de anos. A versão publicada é um instantâneo do fonte 
do Framework .NET. Embora a Microsoft esteja publicando o código fonte, eles 
não estão ativamente desenvolvendo esta árvore em aberto, nem aceitando 
correções.

Considerações
==============

Esta seção lista os cuidados que devemos ter em mente ao incorporar código fonte 
do .NET dentro do Mono, e que não podemos esquecer ao aprimorar o código.

Os itens listados abaixo identificam as restrições que temos ao incorporar 
essa massa de código.

Código Específico de Plataforma do Mono
---------------------------------------

Em muitos casos, o Mono contem código específico de plataforma que atualmente 
inexiste no .NET.  Existe uma grande variedade de funcionalidades desse tipo.  
Alguns exemplos:

* A classe `System.Environment` que provê um conjunto de locais específicos por
plataforma para as aplicações procurarem certos 'locais bem conhecidos' no 
sistema de arquivos.

* A classe `Registry` que provê uma abstração que mapeia para as APIs do Windows 
ou uma implementação baseada em arquivos no Unix.

Classes do Mono com Integração Estreita com o Ambiente de Execução
-------------------------------------------------------------------

Algumas APIs do framework .NET tem extreita dependência com a implementação do 
ambiente de execução. E esse também é o caso da implementação do Mono.

Há casos em que teremos um desafio extra pela frente para fazer a integração com 
o ambiente de execução funcionar (por exemplo, chavear nosso pobre suporte ao tipo 
decimal pela versão da Microsoft seria decididamente um ganho).  Em outros casos, 
o tamanho da tarefa não vale o esforço, como o suporte a `System.Reflection.Emit`.

Perfis do Mono
-------------

O Mono disponibiliza um perfil de API Mobile projetado para expor uma API mais 
leve para utilização em dispositivos móveis, consoles de jogos e no projeto Mono 
for Unreal Engine.

O Perfil Mobile basicamente remove do sistema algumas da dependências .NET mais 
pesadas.  Ele principalmente lida com remover dependências a `System.Configuration` 
das nossas bibliotecas de classes.

Mono Core
---------

No longo prazo, nós queremos adotar uma estratégia similar ao do .NET Core, 
onde nós teremos uma camada fina de APIs específicas da plataforma/VM, e 
permitiremos aos nossos usuários usar o Mono na mesma forma que o .NET core 
pode ser usado, sem grandes bibliotecas/perfis.

As Classes do Mono são Amigáveis ao Linker
------------------------------------------

Algumas das bibliotecas de classe do Mono foram projetadas para manter o seu 
resultado amigável ao linker, um pedaço importante da funcionalidade requerida 
pelas nossas implementações para Android e iOS.

Isto é feito substituindo algumas associações 'fracas', manifestas só em tempo de 
execução, por associações fortes, ou ensinando nosso linker sobre as bibliotecas 
e as conexões entre certas classes e suas exigências. Muitos dessas ligações 
provavelmente existem no .NET também, mas nós precisamos assegurar que não haja 
regressões ao incorporar código do .NET.

Bootstrapping das Bibliotecas Básicas
-------------------------------------

O bootstrapping das bibliotecas fundamentais não é uma coisa divertida. A Microsoft 
incluiu dependências cíclicas em vários grupos de bibliotecas.  Por exemplo, `mscorlib`, 
`System`, `System.Xml`, `System.Configuration` e `System.Core` são compiladas referenciando 
os tipos umas das outras. Outro emaranhado existe na família `System.Web`.

O Mono atualmente tem um processo de compilação em múltiplos estágios para criar essas 
bibliotecas que tem dependência cíclica.  Trazer novo código da Microsoft é possível, mas a
cada classe que for incorporada, podemos ter que ajustar o processo de compilação.

'Recursos' Faltantes
--------------------

O fonte liberado pela Microsoft não incluem os recursos (resources) exigidos por parte do código. Isto se manifesta com referências a uma classe chamada "SR".

Nós teremos que autogerá-los.

Mão de Obra Escassa
-------------------

Nós temos escassez de mão de obra, então ao trazer código do .NET, nós temos que escolher 
nossas batalhas.

Os pedaços do Mono que tem sido bastantes utilizados são de uma melhor qualidade do que os 
pedaços não muito utilizados, ou que estão a muito tempo sem manutenção.

É melhor focar os nossos esforços nos alvos que possam trazer-nos alto-valor nas bibliotecas 
de classe do .NET do que trazer coisas que funcionam bem no Mono e estão bem testadas.

Código .NET Incompleto
----------------------

Parte do código .NET que está sendo disponibilizado pode não estar completo, podem estar 
faltando resources, strings, scripts de compilação e pode não ser trivialmente compilável.   
Portanto é importante que ao submeter um pull request, a alteração compile completamente.

Efeitos Colaterais na Performance/Uso de Memória
------------------------------------------------

Este é provavelmente um problema inexistente, mas nós podemos achar casos em que as 
bibliotecas de classes do Mono foram otimizadas para uso no ambiente de execução do Mono 
de tal forma que incorporar o código equivalente da Microsoft pode regredir a performance 
ou causar a alocação de mais memória.

Alguns casos para ficar de olho:

* **Checagens do Code Access Security**: estas provavelmente estão presentes no código do .NET, 
e elas essencialmente não existem no Mono. São relativamente custosas para executar, e o Mono 
não chegou a implementá-las corretamente. Então nós teriamos que colocar um monte de ifdefs ao 
importar todo código relacionado ao suporte ao CAS.

* **Descarte de Objetos*: O Mono nem sempre implementou fielmente o padrão de descarte de objetos
(Dispose). É um padrão em que objetos que implementam a interface `IDisposable` arremessam um 
exceção do tipo `ObjectDisposedException` sempre que o método Dispose já foi chamado, mas um membro 
dessa instância é executado. Isto requer mais código condicional que o Mono não tem em alguns lugares.
Pode ser que não seja importante, mas devemos prestar alguma atenção a isso.

* **Validação de Enumerações**: O .NET tende a validar os valores de enumerações passados 
a suas funções. O Mono não faz isso, portanto podemos ter um impacto na performance ao importar
esse tipo de código.

As checagens de Code Access Security são provavelmente o que mais nós devemos nos preocupar em 
filtrar, por serem completamente inúteis no Mono.

Definiçoes de Tempo de Compilação
--------------------

O código fonte da Microsoft contém muitos tipos diferentes de definições de tempo de compilação 
(defines) que são usados para compilação condicional.  Sempre que importarmos algum código da 
Microsoft, nós temos que fazer uma auditoria e determinar que funcionalidades são necessárias.

Estratégia
==========

Em geral, nós estaremos integrando código que vem do [Fonte de Referência](https://github.com/Microsoft/referencesource)
liberado, porque este contem a API que é mais próxima da do Mono.

Nós [estaremos acompanhando a atribuição de tarefas](https://trello.com/b/vRPTMfdz/net-framework-integration-into-mono) no Trello.

Mais tarde, quando implementarmos o Mono Core, nós inversamente contribuiremos bits específicos a VM/SO para o .NET Core.

Nós temos que bolar um plano de integração que maximize os benefícios ao Mono e nossos usuários com
o mínimo de esforço de engenharia. Embora em um mundo ideal nós pudessemos trazer até 80-90% do código,
seria um esforço imenso com muitos riscos envolvidos. Nós iremos priorizar o trabalho para focar naquilo que
traga os maiores benefícios de cara para a comunidade Mono, e deixar os pedaços mais complicados/intensivos 
para depois.

Dando um grande impulso ao Mono desde o começo
----------------------------------------------

Ao trazer código para o Mono, nós podemos fazê-lo das seguintes formas:

* Assemblies inteiros
* Classes inteiras
* Trabalho misto
* Membros individuais

### Assemblies Inteiros

Nós podemos portar assemblies inteiros quando nosso assembly 
é reconhecido como sendo muito cheio de bugs, em má forma, ou completamente quebrado.

Candidatos imediatos para isto incluem:

* WCF - quase que imediatamente
* System.Web - quase que imediatamente

Candidatos de médio prazo incluem:

* System.Configuration - possível, mas requer cuidadosa verificação
* System.Linq.Data
* Remoting

Candidatos de longo prazo incluem:

* A pilha XML

### Classes Inteiras

Nós portaremos classes inteiras quando a classe ou família de classes 
é reconhecida como sendo muito cheia de bugs no Mono, mal conservada ou como uma fonte de 
problemas.  Candidatos incluem:

* System.Text.RegularExpressions

### Trabalho Misto

São bibliotecas que tem código de alta qualidade e que as contrapartes no Mono podem
ter limitações, bugs ou problemas. Mas a implementação da Microsoft contem dependências
a bibliotecas nativas que não existem em todas as plataformas. Possíveis candidatos:

* Pilha cliente de HTTP
* `System.Data.*` - A implementação da Microsoft tem muitas dependências a código nativo 
que tem que ser refatoradas para suportar múltiplas plataformas.

### Membros Individuais

Nós encontraremos esse tipo de código em alguns lugares. 
Existem lugares no Mono que embora bons de forma geral, podem ter bugs conhecidos e limitações.
A funcionalidade de `binding` em `System.Reflection` é um exemplo de um método que funciona, 
mas que pode ter bugs e erros nas 'bordas'.

Porte e Regressões
-----------------------

Sempre que trouxermos código .NET para substituir código do Mono, pode haver casos
em que será introduzida uma regressão de algum tipo: funcionalidade, performance ou trazemos
um comportamento que é incompatível com o uso idiomático que os usuários do Mono estão
acostumados a muito tempo.

Em geral, quando portando código para o Mono, nós devemos garantir que a suite de testes do Mono 
continue a passar sem problemas, e que nenhuma regressão seja introduzida. Se uma regressão for introduzida,
nós temos que registrar o bug e atuar na busca da solução do problema específico.
>>>>>>> abdedc04bb366fb61a02a32b388f497cd91a75e8

APIs muito populares, majoritariamente livres de bugs: pule
-----------------------------------------------------------

O núcleo do Mono está em muito boa forma, e muito pouco valor pode ser agregado trazendo 
a implementação do .NET nesses pedaços.  Consumiria um valioso tempo de engenharia para 
substituir código bom por outro pedaço de código bom, ao mesmo tempo que estariamos pagando o preço de
regressões em potencial.

Capacitando Terceiros
---------------------

Existem certos pedaços de código que serão difíceis de processar, mas que se o fizermos, 
poderemos ajudar o esforço de terceiros que não conhecem as internalidades do Mono ou 
nosso processo de compilação para contribuirem.

Lidando com System.Configuration
---------------------------------

Em geral, o processo a seguir ao portar código que envolve o `System.Configuration`
que nós queremos que funcione no perfil completo e no perfil Mobile é aproximadamente: 

* Comentar fora a classe pública derivada de `ConfigurationSection`.
* Manter a classe `SettingsSectionInternal`, pois muito código depende dela.
* Usar ifdef para excluir o construtor que depende em `System.Configuration` dessa classe que usa `System.Configuration`, 
  e substituir por valores fixos obtidos ao rodar o código no .NET (valores default).
* Adicionar o modificador `partial` na classe `SettingsSectionInternal`.
* Prover um construtor na classe parcial do Mono para inserir os valores default.
* Monitorar cada setting, para depois decidirmos se queremos prover uma API C# para mudar esses valores.

Estilo do Código Fonte
----------------------

Ao fazer mudanças, tente manter o estilo do projeto original. Se está mudando o código do .NET, use o estilo deles. Quando fazendo mudanças no Mono, use o nosso estilo.

Nós acreditamos que poderemos fazer poucas mudanças no código de origem e basicamente usar ou blocos `#if`, classes `partial` e dividir algumas coisas para alcançar a portabilidade.

.NET Core e o Mono
==================

Nós queremos contribuir parte do código multi-plataforma do Mono, bem como trechos que nós portarmos do código de referência do Framework .NET ao esforço do .NET Core.

Nós atualizaremos esta página com mais informação conforme o processo de porte de código da Microsoft evolua e nós contribuamos algo do nosso código ou do deles para o esforço.
