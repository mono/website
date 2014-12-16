---
title: "Toolkits Gráficos Abandonados"
redirect_from:
  - /Dead_Toolkits/
  - /archived/dead_toolkits/
---

Os seguintes conjuntos de ferramentas não estão mais sendo ativamente desenvolvidos.

Sharp WT
---------------

Homepage: [#Develop](http://sourceforge.net/projects/sharpdevelop)

**ESSE PROJETO FOI DESCONTINUADO. O DESENVOLVIMENTO FOI PARADO POR FALTA DE INTERESSE.**

Esse é um projeto iniciado pelos desenvolvedores do SharpDevelop.

O projeto teve início devido às limitações ao Windows.Forms e da necessidade de portar sua grande aplicação para Linux. Eles pegaram o kit de ferramentas SWT que faz parte do Eclipse e portaram de Java para C #.

SWT usa widgets nativos em cada uma de suas plataformas de destino, portanto parece, e da a sensação de corresponder ao sistema operacional subjacente.

### Prós:

-   Aparência nativa em várias plataformas (Windows, Linux and MacOS).
-   Design limpo.
-   A versão java tem sido usada com sucesso pelo projeto Eclipse.

### Contras:

-   Pequena ou nenhuma documentação.
-   Criação de novos widgets é difícil (devido aos testes em várias plataformas), ou a aparência é única.
-   Ainda está sendo desenvolvido.
-   Problema de mínimo denominador comum na API (acaba sendo um subconjunto muito limitado).

Qt#
---

[![Mahjongg-0.6-window.png](/archived/images/9/91/Mahjongg-0.6-window.png)](/archived/images/9/91/Mahjongg-0.6-window.png)

Homepage: [Qt#](http://qtcsharp.sourceforge.net/)

**ESSE PROJETO FOI DESCONTINUADO. O DESENVOLVIMENTO FOI PARADO POR FALTA DE INTERESSE.**

Este é um conector (binding) para o toolkit Qt,mas o seu desenvolvimento está praticamente parado.

### Prós:

-   Aparência nativa em várias plataformas.


### Contras:

-   O toolkit está sob a licença GPL, e o que compõe o toolkit Qt tem mais limitações de licenciamento. Não é adequado para o desenvolvimento de código proprietário ou não GPL.
-   O conector não está sendo mantido.
-   Atualmente é um conector sobreposto ao conector C, já que o QT está escrito em C++.


wxNet
-----

[![Linux-05.png](/archived/images/c/cf/Linux-05.png)](/archived/images/c/cf/Linux-05.png)

Homepage: [wxNet](http://wxnet.sourceforge.net/)]

O wxNet é um conector para o toolkit multiplataforma wxWindows.

### Prós:

-   Aparência nativa em várias plataformas.
-   A camada inferior (wxWindows) é bem documentada, o conector .NET possui pouca documentação.

### Contras:

-   A conexão com widgets extras não suportados é difícil.
-   Componentes personalizados não terão aparência consistente em todas as plataformas.
-   Problema de mínimo denominador comum na API (acaba sendo um subconjunto muito limitado).


Gaia Ajax Widgets
-----------------

O conjunto de componentes [Gaia Ajax Widgets](http://ajaxwidgets.com/more/about_gaia_ajax_framework/mono_support.aa) foi construído para imitar 100% a lógica do ASP.NET convencional e, basicamente, significa que se você sabe ASP.NET você sabe 
como usar Gaia Ajax Widgets! Os widgets não contém nenhuma propriedade ininteligível ou modelo de código 
que você precisa aprender antes de poder usar o Gaia efetivamente, quase nenhum dos nossos controles usa 
quaisquer outras propriedades diferentes das que vem nos controles nativos do ASP.NET por isso, se você 
sabe resolver um problema com ASP.NET você saberá também com o Gaia! Isso pode ser visto a partir do fato 
de que você não precisa usar WebServices para, por exemplo, carregar o auto completar e do evento que 
recupera os dados de auto completar você pode fazer o que quiser, incluindo, por exemplo, fazer uma 
lista de opções visível ou mostrando uma janela modal.

Gaia Ajax Widgets provê suporte ao Mono.

Qyoto
-----

Homepage: [Qyoto](http://techbase.kde.org/Development/Languages/Qyoto)

O conector Qyoto/Kimono permite usar C# e outras linguagens .NET para escrever programas Qt/KDE.
O conjunto de conectores é autogerado diretamente dos cabeçalhos (headers) do Qt/KDE,
reduzindo enormemente o esforço de manutenção. Os comentários de documentação doxygen do KDE
são automaticamente convertidos para o formato dos comentários xml do C#. 
O substrato é bem documentado e suportado. 
A documentação da versão 4.0 do Qyoto 4.0 pode ser encontrada [aqui](http://api.kde.org/qyoto-api/).

Plataformas: Unix, Windows, OSX

No Debian/Ubuntu, você pode instalar o pacote 'qyoto-dev' para utilizar os conectores.

Qt4Dotnet
---------

Homepage: [Qt4Dotnet](http://code.google.com/p/qt4dotnet/)

Este é um porte dos conectores java QtJambi para o .NET usando IKVM.
