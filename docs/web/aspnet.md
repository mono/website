---
title: ASP.NET
redirect_from:
  - /ASP.NET/
  - /Xsp/
  - /XSP/
---

Mono possui implementações de ASP.NET 2.0, ASP.NET MVC e ASP.NET AJAX.

Recursos rápidos:

-   [ASP.NET FAQ](/docs/faq/aspnet/) para perguntas frequentes sobre ASP.NET.
-   [Hospedagem com servidores Apache](/docs/web/mod_mono/).
-   [Hospedagem com servidores baseados em FastCGI](/docs/web/fastcgi/).
-   [Hospedagem com servidores baseados em CGI](/archived/cgi "CGI").
-   [Hospedagem com Nginx](/docs/web/fastcgi/nginx/).
-   [Portando aplicações ASP.NET](/docs/web/porting-aspnet-applications/).

As implementações ASP.NET do Mono suportam dois tipos de aplicações:

-   Web Forms (infraestrutura para Aplicações Web).
-   [Web Services](/archived/web_services "Serviços Web") (sistema RPC baseado em SOAP).

Status e testes para ASP.NET 2.0 estão disponíveis na nossa página [ASPTests](/archived/asptests "ASPTests").

Executando aplicações ASP.NET
============================

Para executar suas aplicações ASP.NET com Mono, você tem três classes de opções:

-   Hospedagem Apache: use [mod_mono](/docs/web/mod_mono/), um módulo que possibilita ao servidor Apache servir aplicações ASP.NET.
-   Hospedagem FastCGI: use a hospedagem [FastCGI](/docs/web/fastcgi/) se você tem um servidor web que suporta o protocolo FastCGI (por exemplo [Nginx](/docs/web/fastcgi/nginx/)) para estender o servidor. Você também pode usar um servidor web que tem suporte apenas para [CGI](/archived/cgi "CGI") usando **cgi-fcgi**.
-   XSP: esta é uma opção simples para começar, um servidor web leve e simples escrito em C#.

Para implantar aplicações, recomenda-se as opções [mod_mono](/docs/web/mod_mono/) ou [FastCGI](/docs/web/fastcgi/), pois isso te dará todas as opções de configuração e flexibilidade que vem junto com o servidor Apache ou um servidor FastCGI.

Para iniciar rapidamente, e familizar-se com o Mono e ASP.NET, XSP é a solução ideal. Mantenha em mente que XSP é um servidor muito limitado e é util apenas para familiarizar-se com ASP.NET e Mono, ele suporta apenas HTTP 1.0 e não provê muita extensibilidade ou opções de configuração.

Usuários mais avançados podem usar o HttpListener e a hospedagem ASP.NET para criar seus próprios servidores de aplicações ASP.NET.

Hospedagem ASP.NET com Apache
---------------------------

O módulo Apache [mod_mono](/docs/web/mod_mono/) é usado para executar aplicações ASP.NET dentro do servidor [Apache](http://httpd.apache.org).

O módulo mod_mono executa junto ao processo Apache e direciona todas as requisições a aplicações ASP.NET para um processo Mono externo que hospeda suas aplicações ASP.NET na verdade. O serviço ASP.NET externo é chamado "mod-mono-server" e é parte do módulo XSP.

Para usá-lo, você precisa baixar e instalar os componentes mod_mono e xsp do Mono. mod_mono contém o módulo Apache em si, e xsp contém o motor de hospedagem ASP.NET, ambos estão disponíveis em nossa [página de download](/download/).

Veja a página [mod_mono](/docs/web/mod_mono/) para detalhes de instalação e configuração.

Hospedagem ASP.NET com Nginx
--------------------------

[Nginx](http://wiki.nginx.org/) é um servidor HTTP de alta performance que suporta executar aplicações ASP.NET e ASP.NET MVC através do protocolo FastCGI. Veja a página [FastCGI Nginx](/FastCGI_Nginx) para detalhes de instalação e configuração.

Hospedagem ASP.NET com XSP
------------------------

XSP é um servidor web independente escrito em C# que pode ser usado para executar aplicações ASP.NET com menos esforço. XSP trabalha tanto na execução do Mono quanto da versão Microsoft. O código está disponível em nossa  [página de download](/download/) (procure por servidor XSP) ou no repositório Git [git](/community/contributing/source-code-repository/) (nome do módulo: xsp).

A forma mais fácil de iniciar o XSP é executá-lo de dentro do diretório raiz da sua aplicação. Ele vai servir requisições no porto 8080. Coloque montagens adicionais no diretório bin. Outras opções do XSP podem ser configuradas pela linha de comando, por exemplo o diretório da aplicação e o porto a ser utilizado.

XSP vem com um conjunto de páginas, controles e serviços web que você pode usar para testar o servidor e ver a aparência do ASP.NET.

Por exemplo, assim que você instalar o XSP, você pode tentar alguns exemplos dessa forma:

``` bash
 $ cd /usr/lib/xsp/test
 $ xsp
 Listening on port: 8080
 Listening on address: 0.0.0.0
 Root directory: /home/cvs/mcs/class/corlib/Microsoft.Win32
 Hit Return to stop the server.
```

Agora você pode acessar <http://localhost:8080> no seu navegador web e ver vários programas de exemplo

### Suporte SSL no XSP

XSP suporta SSL e Certificados Cliente TLS. Para maiores detalhes sobre como configurá-los, veja o documento  [UsingClientCertificatesWithXSP](/docs/web/using-clientcertificates-with-xsp/) document.

### Configuração

Aplicações podem ser configuradas através do arquivo web.config, a documentação completa está disponível na  [MSDN](http://msdn2.microsoft.com/en-us/library/b5ysx397.aspx), além disso uma versão específica para Mono está disponível neste site [aqui](/archived/config_systemweb "Configuração system.web").

Além disso, você pode configurar opções ASP.NET específicas para Mono (para ter aplicações que se comportam de formas diferentes dependendo do sistema operacional em que estão implantadas) usando o motor [Mapeamento de Configurações ASP.NET](/archived/aspnet_settings_mapping "Mapeamento de configurações aSP.NET") .

### Outras extensões

Confira em [Módulos ASP.NET](/archived/aspnet_modules "Módulos asP.NET") para detalhes sobre como suportar codificações deflate/gzip e autenticação.

Depurando
---------

Por padrão xsp e xsp2 executam em modo normal, o que significa que informações de números de linha para depuração não estarão disponíveis nos rastreamentos da pilha quando erros acontecerem.

Para obter os números de linha em rastreamentos da pilha você precisa fazer duas coisas:

1. Habilitar geração de código de depuração na sua página. 
2. Executar o Mono com a opção de linha de comando --debug.

Você precisa habilitar a geração de código de depuração na sua página usando **Debug="true"** no topo da sua página, ou configurando a diretiva ([opção de compilação](/archived/config/#compilation "Configuração")) no Web.config.

Use a opção de linha de comando --debug para o Mono, isso é feito configurando a variável de ambiente MONO_OPTIONS, dessa forma:

``` bash
$ MONO_OPTIONS=--debug xsp2
Listening on port: 8080 (non-secure)
Listening on address: 0.0.0.0
Root directory: /tmp/us
Hit Return to stop the server.
```

Para fazer o mesmo com o módulo Apache mod_mono, use a diretiva **MonoDebug true** no seu arquivo de configuração do apache.

Versões Suportadas
==================

Mono suporta ASP.NET 2.0, ASP.NET AJAX e um punhado de controles 3.5.

Limitações
----------

O ASP.NET do Mono não implementa as seguintes funcionalidades:

-   Web sites pré-compilados atualizáveis.
-   APIs WebParts.

Trabalho em Andamento
=====================

Acesso aos Fontes via Git
----------

Usuários interessados na última versão de mod_mono e xsp podem recuperá-los a partir do nosso repositório [git](/community/contributing/source-code-repository/) publico. Os nomes dos módulos são **mod_mono** e **xsp** respectivamente. Você tambem vai precisar do módulo **mcs** já que as classes System.Web estão em mcs/class/System.Web.

Designer
--------

Há um trabalho em andamento de um [Editor de Páginas ASP.NET](/archived/aspnet_visual_designer) o designer deverá ser integrada à [IDE MonoDevelop](/docs/getting-started/development-environments/).

