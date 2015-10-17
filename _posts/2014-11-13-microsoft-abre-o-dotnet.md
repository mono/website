---
layout: blog
title: "A Microsoft abriu o .NET!!! Uhaaa!"
author: Rafael Teixeira
tags: [Mono]
---

Tradução do Post do Miguel
==========================

A Microsoft abre o código do .NET e como isso afeta o Mono
----------------------------------------------------------

Hoje o Scott Guthrie anunciou que a Microsoft está abrindo o código do .NET. Esta é uma ocasião momentosa, e uma que eu tenho advogado por muitos anos.

O .NET está sendo aberto sob a [licença MIT](https://github.com/dotnet/corefx/blob/master/LICENSE). Não somente o código está sendo liberado sob esta licença bastante permissiva, mas a Microsoft está provendo uma [promessa de patentes](https://github.com/dotnet/corefx/blob/master/PATENTS.TXT) para garantir que o .NET tenha a ampla adoção que ele merece.

O código atual está residindo no [repositório github da Fundação .NET](https://github.com/dotnet).

Essa promessa de patentes endereça as preocupações históricas que as comunidades de código aberto, Unix e de software livre levantaram ao longo dos anos.

Componentes liberados do .NET
-----------------------------

Existem 3 componentes sendo abertos: as bibliotecas do Framework .NET clássico, as bibliotecas do novo Framework .NET Core e a VM RyuJit. Mais detalhes abaixo.

### Bibliotecas de Classes do Framework .NET 

Estas são as bibliotecas de classe que implementam o framework .NET que existe no Windows. Aquelas que historicamente o projeto Mono reimplementou em forma de código aberto.

O código está disponível hoje em http://github.com/Microsoft/referencesource. O projeto Mono poderá utilizar o quanto ele quiser deste projeto.

Nós temos um projeto em curso que já está fazendo isso. Nós estamos substituindo pedaços do código do Mono que estavam incompletos, bugados, ou não tão completamente funcionais quando seria desejado com o código da Microsoft.

Nós estaremos atualizando o código no repositório github.com/mono no fim da semana (Eu estou atualmente em Nova Iorque celebrando :-) )

A Microsoft divulgou que eles não tem planos de aceitar patches ou engajar no estilo de comunidade de código aberto neste pacote de fontes, pois os requisitos de compatibilidade retroativa no Windows são extremamente fortes.

### .NET Core

O framework .NET Core é uma versão redesenhada do .NET que é baseado em uma versão simplificada das bibliotecas de classe bem como um projeto que permite incorporar o que for preciso do framework nas aplicações. (nota do tradutor: isso permite instalações lado-a-lado de aplicações com dependências em versões diferentes das bibliotecas do framework.)

Aqueles familiarizados com as assemblies de contrato PCL 2.0 tem uma boa idéia do como essas assemblies se parecerão.

Esse esforço está residindo em https://github.com/dotnet/corefx e é um esforço em que a Microsoft se engajará completamente com a comunidade para evoluir, desenvolver e melhorar as bibliotecas de classes.

Hoje, eles liberaram os primeiros componentes no github; o plano é para o resto dos frameworks reprojetados ser disponibilizado nos próximos meses.

A Xamarin e o projeto Mono estarão contribuindo com o esforço de trazer o .NET para o Mac, Unix, Linux e outras plataformas. Nós iremos fazer isso conforme a Microsoft for abrindo mais peças do .NET Core, incluindo o RyuJIT.

### Próximos Passos

Como nós fizemos no passado com o código .NET que a Microsoft foi liberando, e como nós fizemos com o Roslyn, nós estaremos integrando esse código no Mono e nos produtos da Xamarin.

Mais tarde nesta semana, espere por versões atualizadas do Mapa do Futuro (roadmap) do projeto Mono e uma lista de tarefas que precisarão ser completadas para integrar o código do Framework .NET da Microsoft dentro do Mono.

A mais longo prazo, nós vamos fazer a máquina virtual do Mono suportar o novo modelo de instalação do .NET Core bem como a nova interface entre a VM e as bibliotecas de classe.

Nós estaremos movendo as discussões sobre o .NET Core para os fóruns da Fundação .NET.

Com o projeto Mono, nós trabalhamos por 14 anos para ter uma versão de código aberto do .NET. Tendo a Microsoft liberado o .NET e publicado a promessa de patentes garantirá que todos nós poderemos cooperara em construir uma comunidade .NET maior, mais rica e mais vibrante.

---
Postado em 12 Nov 2014 por Miguel de Icaza
