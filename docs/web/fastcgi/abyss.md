---
title: Abyss
redirect_from:
  - /FastCGI_Abyss/
---

Informação de como configurar o [FastCGI] (/docs/web/fastcgi/) com suporte ao Abyss Server.

Introdução
------------

O [Abyss Web Server](http://www.aprelium.com/) é um servidor web rico em recursos e fácil de usar. 
Embora de fonte fechado o servidor X1 é *"um software grátis e funcional : sem telas promocionais, 
sem limitação de tempo, sem spyware, e sem propagandas."* 
([Download](http://www.aprelium.com/abyssws/download.php))

Fazendo valer sua fama de "uso fácil", o Abyss foi o servidor mais fácil de configurar até agora. 
Isso devido principalmente ao seu simples e direto centro de controle.
### Configurado e testado em:

-   [OpenSuSE 10.2](http://en.opensuse.org/OpenSUSE_News/10.2-Release) (Abyss X1)
-   *Se você tiver testado alguma configuração adicional, por favor envie-me um email  [brian.nickel@gmail.com](mailto:brian.nickel@gmail.com).*

Alertas Gerais
----------------

Antes de fazer qualquer coisa, você deve ler a seção [Informação Importante](/docs/web/fastcgi/#important-information) na página principal sobre FastCGI.

### Primeiro Passo: Configurar o Interpretador

Ao iniciar o servidor web Abyss, um centro de controle do servidor web será iniciado por padrão no endereço
<http://localhost:9999>. Simplesmente abra seu navegador neste endereço e siga os passos abaixo:

1.  Clique em "Configure" no host que você deseja adicionar suporte a ASP.NET
2.  Clique em "Scripting Parameters".
3.  Clique em "Add" na caixa "Interpreters".
4.  Você está agora na página para adicionar o interpretador ASP.NET. As duas opções que eu poderia recomendar são "FastCGI (Local - Pipes)" e "FastCGI (Remote - TCP/IP sockets)":
    -   **FastCGI (Local - Pipes)** - Abyss vai iniciar o servidor mono automaticamente usando um piped socket. Pipes são a maneira mais rápida de se comunicar e ter o Abyss repassando o seu próprio servidor, o que significa que você não terá que fazer isto manualmente. Esta é possivelmente a opção mais fácil.<br/>
        Se você estiver usando esta opção, Apenas configure o "Interpreter" para "/usr/bin/fastcgi-mono-server" ou "/usr/bin/fastcgi-mono-server2".
    -   **FastCGI (Remote - TCP/IP sockets)** - Abyss vai procurar pelo servidor mono em um endereço IP e porta específicos. Você pode usar isto para rodar o servidor em uma outra máquina e redistribuir a carga entre processadores. O único alerta é que você precisará iniciar o servidor mono manualmente em outro computador, usando um comando como "`fastcgi-mono-server2 /socket=tcp:8002`"<br/>
        Se estiver usando esta opção, simplesmente configure o "Remote server IP Address" para o IP da máquina que você estiver rodando o servidor do Mono, e a porta que você usou na linha de comando. Pela linha de comando que indicamos acima, esta deveria ser 8002.

5.  Desmarque a opção "Check for file existence before execution". Esta opção otimiza a performance mas pode corromper o ASP.NET 2.0 assim como algumas vezes usa caminhos que não necessáriamente existem como WebResource.axd.
6.  Desmarque a opção "Use the associated extensions to automatically update the Script Paths".
7.  Adicione "\*" à "Extensions". Isto não é uma necessidade real, mas será usado para garantir que todas as requisições cheguem ao FastCGI do servidor Mono.
8.  Clique em "OK".
9.  Você deverá ser automaticamente direcionado para "Scripting Parameters". Clique em "Add" na caixa "Script Paths".
10. Entre "/\*" no "Virtual Path".
11. Clique "OK".

### Segundo Passo: Aumentar o Tempo de Vida do Servidor

Ao completar o passo anterior, você deverá ter automaticamente retornado ao "Scripting Parameters". Clique em "Edit..." próximo a "FastCGI Parameters". A opção "FastCGI Processes Timeout" especifica o numero de segundos depois da ultima requisição você vai querer aguardar antes de desligar o Servidor Mono FasCGI(ou qualquer outro). Porque páginas ASP.NET precisam ser recompiladas a AppDomains precisam sere recriados toda a vez que o servidor inicia. Você configura este para um valor arbitrariamente alto. 604800 é um numero de segundos de uma semana e o valor que escolhi para meu servidor. Apenas após ter setado este valor clique em "OK". 


### Terceiro Passo: Desabilitando a Listagem de Diretórios

Ao completar o passo anterior, você deverá ter automaticamente retornado ao "Scripting Parameters". Clique botão "OK" rodapá da página para voltar para a página de configuração do host. Apenas lá, clique em "Directory Listing" e configure "Type" para "Disabled". Se a listagem de diretórios estiver habilitada, os paths não serão automaticamente enviados para o servidor FastCGI Mono.

Usando Extensões
----------------

### Alerta Sobre o Uso de Extensões

**Usar extensões ao invés de caminhos NÃO é recomendado.** por favor consulte [Paths vs Extensions](/docs/web/fastcgi/#paths-vs-extensions) na página principal para uma explicação detalhada. Se você decidir usar esta configuração, por favor tenha em mente que é menos seguro, e sofre desvantegens adicionais quando comparado com o uso de caminhos.

### Extensões - Primeiro Passo: Configurando o Interpretador

Ao iniciar o servidor web Abyss, um centro de controle do servidor web será iniciado por padrão no endereço
<http://localhost:9999>. Simplesmente abra seu navegador neste endereço e siga os passos abaixo:

1.  Clique em "Configure" no host que você deseja adicionar suporte a ASP.NET
2.  Clique em "Scripting Parameters".
3.  Clique em "Add" na caixa "Interpreters".
4.  Você está agora na página para adicionar o interpretador ASP.NET. As duas opções que eu poderia recomendar são "FastCGI (Local - Pipes)" e "FastCGI (Remote - TCP/IP sockets)":
    -   **FastCGI (Local - Pipes)** - Abyss vai iniciar o servidor mono automaticamente usando um piped socket. Pipes são a maneira mais rápida de se comunicar e ter o Abyss repassando o seu próprio servidor, o que significa que você não terá que fazer isto manualmente. Esta é possivelmente a opção mais fácil.<br/>
        Se você estiver usando esta opção, Apenas configure o "Interpreter" para "/usr/bin/fastcgi-mono-server" ou "/usr/bin/fastcgi-mono-server2".
    -   **FastCGI (Remote - TCP/IP sockets)** - Abyss vai procurar pelo servidor mono em um endereço IP e porta específicos. Você pode usar isto para rodar o servidor em uma outra máquinae redistribuir o processo de carga. O único alerta é que você precisará iniciar o servidor mono manualmente em outro computador, usando um comando como "`fastcgi-mono-server2 /socket=tcp:8002`"<br/>
        Se estiver usando esta opção, simplesmente configure o "Remote server IP Address" para o IP da máquina que você estiver rodando o servidor do Mono, e a porta que você usou na linha de comando. Pela linha de comando que indicamos acima, esta deveria ser 8002.

5.  Desmarque a opção "Check for file existence before execution". Esta opão otimiza a performance mas pode corromper o ASP.NET 2.0 assim como algumas vezes usa caminhos que não necessáriamente existem como WebResource.axd.
6.  Adicione as extensões abaixo:
    -   aspx
    -   asmx
    -   ashx
    -   asax
    -   ascx
    -   soap
    -   rem
    -   axd
    -   cs
    -   config
    -   dll

7.  Clique em "OK".

### Extensões - Segundo Passo: Aumentar o Tempo de Vida do Servidor

Ao completar o passo anterior, você deve ter automaticamente retornado ao "Scripting Parameters". Clique em "Edit..." próximo a "FastCGI Parameters". A opção "FastCGI Processes Timeout" especifica o numero de segundos depois da ultima requisição você vai quere aguardar antes de desligar o Servidor Mono FasCGI(ou qualquer outro). Porque páginas ASP.NET precisam ser recompiladas a AppDomains precisam sere recriados toda a vez que o servidor inicia. Você configura este para um valor arbitrariamente alto. 604800 é um numero de segundos de uma semana e o valor que escolhi para meu servidor. Apenas após ter setado este valor clique em "OK". 


### Extensões - Terceiro Passo: Adicionando Páginas Iniciais

Ao completar o passo anterior, você deve automaticamente retornar para "Scripting Parameters". Clique em "OK" no rodapé da página para retornar para a página de configuração do host. Apenas lá, clique em "Index Files" e continue adicionando `index.aspx`, `default.aspx`, e `Default.aspx`. Clique em "OK" e entao em "Reset" para reiniciar o servidor.

Sucesso
-------
Agora você deve estar com o ASP.NET funcionando com o Servidor Web Abyss. Divirta-se!

