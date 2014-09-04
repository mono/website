---
title: Caminho a Frente para o Projeto Mono
redirect_from:
  - /Mono_Project_Roadmap/
  - /Roadmap/
---

*Última atualização: Agosto, 2014*

Nós estamos adotando uma nova sistemática de desenvolvimento em que novas funcionalidades são desenvolvidas em ramos (branches) e mesclados no ramo `master` depois de completadas e aprovadas nos testes do controle de qualidade.
O objetivo é reduzir nosso inventário de funcionalidades e bugs pendentes e entregar as correções tão logo elas sejam completadas aos usuários do Mono.
Para maiores informações veja: [http://tirania.org/blog/archive/2011/Oct-14.html](http://tirania.org/blog/archive/2011/Oct-14.html)

Os [Planos](/docs/about-mono/plans/) por componente estão disponíveis, e você pode checar nossa página de [Compatibilidade](/docs/about-mono/compatibility/) para ter uma visão geral do que é suportado na última versão liberada do Mono.

Versionamento
-------------

As versões do Mono seguem a fórmula:

    MAJOR.MINOR.SUBRELEASE

-   Versões com o ***MINOR*** par são liberações estáveis.
-   Versões com o ***MINOR*** ímpar são liberações instáveis (desenvolvimento/compilações diárias).
-   ***SUBRELEASE*** indica uma atualização menor de uma liberação específica.

Liberações Correntes
--------------------

<table>
<col width="50%" />
<col width="50%" />
<tbody>
<tr class="odd">
<td align="left"><strong>Mono 3.6</strong></td>
<td align="left"><strong>Liberada: No início de Agosto de 2014</strong></td>
</tr>
<tr class="even">
<td align="left"><ul>
<li>Contadores de Performance</li>
<li>Nós agora distribuimos `nuget` e `ikdasm`</li>
<li>Ajuste de performance na ponte do Coletor de Lixo (GC bridge)</li>
<li>Depurador suporta colunas e faixas</li>
<li>Depurador examina propriedades descompilando IL, sem ter que desbloquear a execução do código alvo.</li>
<li>Grande reescrita da pilha HTTP e da sua suite de testes</li>
<li>Implementação da System.IO.Compression</li>
<li>Implementação da System.Security.Claims</li>
</ul>
</td>
<td align="left"><p><a href="/docs/about-mono/releases/3.6.0/" title="Notas de Liberação do Mono 3.6.0">Notas de Liberação do Mono 3.6.0</a></p>
<p><br /></p></td>
</tr>
</tbody>
</table>

Liberações Futuras
-----------------

Mono 3.8.0 atualmente disponível em pré-visualização

<table>
<col width="50%" />
<col width="50%" />
<tbody>
<tr class="odd">
<td align="left"><strong> Mono 3.8.0</strong></td>
<td align="left"><strong>Liberação Planejada Para: Ainda Por Definir</strong></td>
</tr>
<tr class="even">
<td align="left"><ul>
</ul></td>
<td align="left"></td>
</tr>
</tbody>
</table>

Subprojetos
-----------

Outros projetos como o [depurador](/docs/debug+profile/debug/debugger/), o navegador de documentação, integração com [Java](/docs/about-mono/languages/java/) via IKVM, [Olive](/archived/olive "Olive") e [Gtk#](/docs/gui/gtksharp/) permanecem com suas próprias agendas. Esta página será atualizada para conter novas informações conforme elam estejam disponível.

### Mono e Silverlight

[Moonlight](/docs/web/moonlight/) a implementação de código aberto do Silverlight em cima do Mono para Linux não está mais sendo desenvolvido.

### Tecnologias não suportadas

Algumas tecnologias .NET technologies ou foram descontinuadas (deprecated), ou são muito específicas do Windows ou seriam esforços muito grandes e nossa comunidade não é capaz de produzir implementações viáveis delas.

Se alguém se importa **muito** com essas APIs e conseguir implementá-las, nós gostariamos de empacotá-las junto com o Mono, mas elas não estão sendo ativamente desenvolvidas. Pode exister código para algumas delas no nosso [repositório git](/community/contributing/source-code-repository/), mas ele não está com qualidade para ser posto em produção e não recomendamos que desenvolvedores construindo aplicações multi-plataforma dependem desse código.

Pilhas demasiado grandes:

- Windows Presentation Foundation

Não estamos trabalhando nestas APIs descontinuadas:

- System.EnterpriseServices
- [WSE](/archived/wse "WSE") - Extensões do System.Web.Services.
- Workflow Foundation 3 (WF3)
- [Code Access Security](/docs/advanced/cas/) (.NET 1.0).

O seguinte não mapeia para sistemas operacionais que não o Windows, e nós não iremos gastar nosso tempo para implementá-las mesmo em Windows:

- System.Management

Uma implementação de terceiros existe para o PowerShell:

- [PASH](https://github.com/Pash-Project/Pash)

Comentários
-----------

Sinta-se livre para [nos enviar seus comentários e questões](http://www.go-mono.com/contact/) sobre este caminho.

Histórico
---------------

Para informação antiga sobre este caminho veja [Histórico do Caminho a Frente](/archived/roadmap_history).

