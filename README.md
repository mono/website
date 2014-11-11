Site do MonoBrasil
==================

Este repositório contem os arquivos que geram o site do MonoBrasil http://www.monobrasil.com.br com base na versão do site original do Projeto Mono http://www.mono-project.com.

O site usa a ferramenta Jekyll (http://jekyllrb.com), um gerador de site estático. O GitHub Pages, onde o site está hospeado, suporta nativamente o Jekyll de forma que cada vez que alguém publica um comite neste repositório, o site será reconstruído e atualizado (após alguns segundos a minutos). Para hospedar o site você mesmo, veja [Setting up a local copy of the website](#setting-up-a-local-copy-of-the-website).

Esforço de Tradução
-------------------

Um passo-a-passo simplificado:
- Tudo acontece aqui no GitHub, então o primeiro passo é você criar a sua conta aqui. Como é só para repositório abertos é sem custo.
- Depois você tem criar um fork seu deste repositório https://github.com/MonoBrasil/website. É só clicar no botão fork no canto superior direito.
- Os caminhos na planilha de [planejamento](https://docs.google.com/spreadsheets/d/1B_iFGvaDhm8jSC0STXHdNgQAX57DRaY8F3wd-7czSjA/edit#gid=1820428232) são os caminhos dentro do repositório e a maioria das páginas estão em MarkDown não em html.
- Para páginas pequenas dá para editar diretamente no github, navegue até o arquivo, e clique no link da canetinha.
- Cuidado para não alterar comandos do processador de geração do site (Jekyll) normalmente o que está no topo entre duas linhas marcadas com ---, apenas o texto que está após o prefixo title: na primeira linha deve ser traduzido.
- Cada vez que você salvar as alterações estará fazendo um commit no seu fork.
- Para trabalhos maiores, é interessante fazer um clone do seu repositório em um ambiente que suporte git (Eclipse,Visual Studio, Linux em linha de comando, GitHub for Windows) para poder fazer as alterações em um editor de texto como o Notepad++,Vim,etc... só que aí tem que fazer em duas etapas commit local e pull para o seu fork.
- Quando quiser enviar o que você realizou até o momento, você deve fazer um Pull Request (use o link Compare no topo da página raiz do seu repositório e depois o botão Create Pull Request).
- Envie um email do seu PR para o revisor correspondente na planilha. O revisor deverá colocar comentários para a melhoria da tradução no próprio PR e ao final marcá-lo com um :shipit:, que nós commiters vamos olhar e comitar a contribuição da dupla. 
- Para fazer as correções pedidas pelo revisor é melhor usar uma cópia local do seu repositório para fazer um commit -amend (que reincorpora as alterações diretamente no PR já aberto). Aí atualizaremos o percentual do seu trabalho na planilha e aí **é só partir para o abraço**.
- Caso o revisor não der sinal de vida em um prazo de 2 ou 3 dias, você manda um email na lista do MonoBrasil (monobrasil@googlegroups.com) para olharmos o seu PR e a coisa não estancar.


Contribuindo para o site
---------------------------

**Nota:** Problemas maiores ou pedidos de funcionalidades devem ser preenchidos no [Controle de Problemas](https://github.com/mono/website/issues) primeiramente, para que possamos discutir as implicações.

Se você quer editar uma página, a forma mais fácil é clicar no link ![Edit page on GitHub](https://cloud.githubusercontent.com/assets/1376924/3712375/a6d7bc42-150f-11e4-9ceb-5230cbbfba3f.png) debaixo do título da página.

Isto irá abrir o arquivo fonte no GitHub onde você pode clicar o botão com ícone de um lápis e começar a editar:
![Arrow to pencil](https://cloud.githubusercontent.com/assets/1376924/3712474/1d2fe57a-1517-11e4-86b2-d083dbeaa4ae.png)

O editor do GitHub's mostra tanto o fonte em [Markdown](https://guides.github.com/features/mastering-markdown/) como também um preview da página renderizada:
![Code editor](https://cloud.githubusercontent.com/assets/1376924/3769433/0f0ca2ee-18e1-11e4-97fc-3493683b853d.png)

Depois de terminar as suas mudanças, entre um sumário e uma descrição e clique no botão "Propose file change" para abrir um pull request:
![Propose file change](https://cloud.githubusercontent.com/assets/1376924/3712481/52423448-1517-11e4-8aa8-9c9f9befb6bc.png)

Escrevendo uma postagem para o blog
-----------------------------------

Blogar é muito fácil com o Jekyll. Simplesmente adicione um novo arquivo Markdown no diretório `_posts` seguindo a convenção de nome de arquivo: `ANO-MÊS-DIA-título.md` (ANO/MÊS/DIA em forma numérica com zeros à esquerda)

Tenha cuidado de não incluir caracteres especiais no nome do artigo e use '-' ao invés de espaços. A data de publicação da postagem será automaticamente extraída do nome do arquivo.

Estrutura do repositório
------------------------

 - `_includes` - *pasta especial* contem pedaços reutilizáveis que podem ser incluídos via `{% include file.html %}` em outras páginas
 - `_layouts` - *pasta especial* contem os leiautes compartilhados entre as páginas. Leiautes podem ser herdados, o leiaute raiz é o `base.html`
 - `_posts` - *pasta especial*, contem as páginas fonte da seção de blog, see [Escrevendo uma postagem para o blogt](#writing-a-blog-post)
 - `_site` - a saida gerada pelo Jekyll por default é colocada nesta pasta
 - `archived` - conteúdo que não é mais relevante mas mantido para manter links externos funcionando
 - `community` - contem os fontes das páginas da seção da comunidade no site
 - `css` - contem as folhas de estilo css
 - `docs` - contem os fontes das páginas da seção de documentação 
 - `download` - contem os fontes das páginas da seção de `download`
 - `images` - contem as imagens usadas nas páginas
 - `news` - lista as páginas contidas no diretório `_posts`

Criando uma cópia local do site
-------------------------------

Para mudanças maiores, usar o editor web do GitHub não é muito conveniente. Uma forma melhor é criar uma cópia local para experimentar com ela.

### Dependências

 - [Ruby](https://www.ruby-lang.org/) - Jekyll é escrito em Ruby
 - [Bundler](http://bundler.io/) - um gerenciador de pacotes para Ruby. Instale-o rodando `gem install bundler`

Depois que você clonou o seu fork do repositório, rode os seguintes comandos:
 1. `bundle install` - baixa as bibliotecas necessárias ao Jekyll
 2. `jekyll serve` - constroi o site e roda um servidor local na porta 4000

**Nota:** você pode adicionar a opção `--watch` ao executar `jekyll serve` para que o Jekyll monitore as mudanças de arquivo, o que significa que o site será reconstruido quand um arquivo é modificado.

O site estará rodando localmente:
![website](https://cloud.githubusercontent.com/assets/1376924/3712425/c1ab2e9c-1513-11e4-9df2-6e69d461c3cf.png)


