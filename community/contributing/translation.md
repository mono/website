---
layout: "docpage"
title: Esforço de Tradução
redirect_from:
  - /Contributing/Translation/
navgroup: Brasil
---

Os participantes do curso de [C#](/Brasil) estão 'pagando' ajudando a traduzir este site.

*Mas quem quiser ajudar com a tradução é só se integrar ao time.*

O processo, para quem deseja participar do esforço, é mais ou menos o seguinte:

1. Tudo acontece no [GitHub](https://github.com), então o primeiro passo é você criar a sua conta lá. Como é só para repositórios abertos é sem custo. 
2. Depois você tem criar que um fork seu do [repositório deste site](https://github.com/MonoBrasil/website). É só clicar no botão ```Fork``` no canto superior direito.
3. Existe uma [planilha de controle](https://docs.google.com/spreadsheets/d/1B_iFGvaDhm8jSC0STXHdNgQAX57DRaY8F3wd-7czSjA/edit#gid=1820428232), alocando os trabalhos de tradução e de revisão. Os caminhos na planilha são os caminhos relativos dentro do repositório e a maioria das páginas estão numa [variante da linguagem MarkDown](https://help.github.com/articles/github-flavored-markdown/) com [front-matter](https://help.github.com/articles/using-jekyll-with-pages/#frontmatter-is-required) obrigatória, embora algumas poucas estejam em html.
4. Para páginas pequenas dá para editar diretamente no GitHub, navegando até o arquivo dentro do seu repositório, e clicando no link de edição que é um pequeno ícone de uma canetinha.
5. **Cuidado** para não alterar incorretamente o cabeçalho (front-matter) exigido pelo processador de geração do site (Jekyll). Normalmente o que está no topo entre duas linhas marcadas com --- deve ser preservado, apenas o texto que está após o prefixo title: deve ser traduzido.
6. Cada vez que você salvar as alterações estará fazendo um _commit_ no seu fork.
7. Para trabalhos maiores, é interessante fazer um clone do seu repositório em um ambiente que suporte git (Eclipse, Visual Studio Community, Xamarin Studio, em linha de comando no Linux, GitHub for Windows) para poder fazer as alterações em um editor de texto como o Notepad++, Vim, etc... ou na própria IDE, só que aí tem que fazer em três etapas: [staging](https://www.kernel.org/pub/software/scm/git/docs/git-add.html), [commit local](https://www.kernel.org/pub/software/scm/git/docs/git-commit.html) e [push](https://www.kernel.org/pub/software/scm/git/docs/git-push.html) para o seu fork.
8. Quando quiser enviar o que você realizou até o momento, você deve fazer um ```Pull Request``` (use o link ```Compare``` no topo da página raiz do seu repositório e depois o botão ```Create Pull Request```).
9. Envie um email do seu PR para o revisor correspondente na planilha, com cópia para a lista do [MonoBrasil](monobrasil@googlegroups.com) que você deverá ter previamente se [inscrito](https://groups.google.com/forum/#!forum/monobrasil). 
10. O revisor deverá colocar comentários para a melhoria da tradução no próprio PR (como comentário de linha, de preferência) e ao final marcá-lo com um ```:shipit:```, que nós commiters vamos olhar e comitar a contribuição da dupla. 
11. Para fazer as correções pedidas pelo revisor é melhor usar uma cópia local do seu repositório para fazer um ```git commit -amend``` (que reincorpora as alterações diretamente no PR já aberto). Aí atualizaremos o percentual do seu trabalho na planilha e é só partir para o abraço.
11. Caso o revisor não dê sinal de vida em um prazo de 2 ou 3 dias, você manda um email aqui na lista para olharmos o seu PR e a coisa não estancar.
