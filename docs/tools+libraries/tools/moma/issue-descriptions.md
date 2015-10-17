---
title: MoMA - Descrição dos Problemas Relatados
redirect_from:
  - /MoMA_-_Issue_Descriptions/
---

Existem 4 tipos de problemas que o MoMA irá detectar e relatar. Aqui está a descrição de cada um, bem como o que fazer para resolver cada tipo.

Métodos Faltantes
-----------------

Este é o tipo mais grave de problema. Estes métodos são métodos que não estão implementados de modo algum no Mono, nem mesmo como protótipos (stubs). 
Se você tentar compilar a aplicação que usa esses métodos com o Mono, você receberá um erro como:

    myfile.cs (22,16): error CS0117: 'xxxxxxxxxxxxxxxxx' does not contain a definition for 'xxxxxxxxxxxxxxx'.

Se você compilar a aplicação com o compilador da Microsoft, a aplicação será executada em Mono até que ele tente usar o método que falta. Ele vai em seguida sair da aplicação com um erro como:

    System.MissingMethodException: Method not found: 'xxxxxxxxxxxxxxxxxxx'.

**O que fazer:**

Estas chamadas de métodos devem ser contornadas e removidas do sua aplicação antes que você possa compilar ou executar no Mono.

Alternativamente, você pode implementar a função em Mono e apresentá-la para inclusão numa futura versão do Mono.

MonoTodo
--------

Métodos marcados com [MonoTodo] podem ou não causar problemas para a sua aplicação. Às vezes, um método pode ser marcado assim para lembrar o desenvolvedor que uma pequena parte não está implementada ou precisa ser limpa mais tarde. Outras vezes, o método não pode ser implementado totalmente e simplesmente não executa nenhuma função. Isso geralmente é feito para permitir a compilação da aplicação e sua execução, mesmo faltando alguma funcionalidade.

O relatório detalhado pode listar a razão específica para o método estar marcado com o [MonoTodo]. Temos solicitado que qualquer desenvolvedor que use a marcação [MonoTodo] justifique o motivo, via campos da marcação, para constar nesse relatório. No entanto, inúmeras marcações mais antigas não têm essa informação.

**O que fazer:**

Estes problemas podem provavelmente ser ignoradas em seu porte inicial. Sua aplicação ainda deve ser executada sem deixar de funcionar, no entanto, pode haver perda de funcionalidade. A perda de funcionalidade pode ser contornada, com uma implementação condicional no seu código ou corrigida contribuindo para a implementação do método inacabado no Mono.


NotImplementedException
-----------------------

Estes podem ser difíceis de determinar se eles são ou não um problema real. Em muitos casos, os métodos não são realmente implementados, e simplesmente lançam uma exceção NotImplementedException assim que eles são chamados. Em outros casos, o método somente lança a exceção em certas circunstâncias, enquanto a maioria das chamadas funciona como esperado. Estamos muito interessados em qualquer feedback sobre essas questões. Se certos métodos fornecem uma grande quantidade de falsos positivos, temos de chegar a uma solução para descontá-los na lógica do MoMA.


**O que fazer:**

Estes são muito parecidos com o [MonoTodo]. É uma incógnita saber se eles vão lhe causar problemas ou não. A aplicação irá compilar corretamente no Mono com estes problemas, e você vai precisar testar sua aplicação para ver se precisa contornar essas chamadas.


P/Invokes
---------

P/Invokes (chamadas nativas) são usadas para chamar funções que são escritas em linguagens não gerenciadas, muitas vezes fornecidas pela própria plataforma (user32.dll, shell32.dll). No entanto, estas também podem ser chamadas em suas próprias bibliotecas nativas. O Mono consegue lidar com essas chamadas quando a biblioteca nativa correta está disponível para a plataforma que você está usando, no entanto, muitas vezes o propósito de se usar o Mono é poder executar uniformente em várias plataformas.

**O que fazer:**

A resposta longa está disponível aqui: [Interoperação com Bibliotecas Nativas](/docs/advanced/pinvoke/).

O resumo:

Se você está chamando algo que é fornecido por sua plataforma (geralmente a API win32), você vai ter que encontrar uma maneira de fazer a mesma funcionalidade em todas as suas plataformas de destino. Isto poderia significar substituir a sua chamada não gerenciada por uma equivalente gerenciada, ou pode significar a identificação de qual plataforma você está executando e chamando o Win32 / * nix / OSX / etc. equivalente.

([http://pinvoke.net](http://pinvoke.net) às vezes pode ajudá-lo a encontrar as chamadas gerenciadas equivalentes para a API Win32.)

Se você está chamando em sua própria biblioteca nativa, então, tudo depende dos recursos de multi-plataforma de sua biblioteca. Se a sua biblioteca nativa irá trabalhar em todas as suas plataformas de destino, então, sua aplicação funcionará corretamente. Se não, você pode fazer a sua biblioteca nativa compatível com as múltiplas plataformas, ou fazer a operação em código gerenciado, ou contornar o uso da biblioteca nativa conforme a plataforma em que você está executando.

A biblioteca nativa que está sendo chamada é listada na última coluna no relatório de detalhes do MoMA.

Para saber em tempo de execução em qual plataforma (SO) sua aplicação está sendo executada, consulte: [FAQ:\_Técnico no item ***Como detectar a plataforma de execução ?***](/docs/faq/technical/#como-detectar-a-plataforma-de-execuo).

