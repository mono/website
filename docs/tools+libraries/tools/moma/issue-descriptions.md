---
title: MoMA - Issue Descriptions
redirect_from:
  - /MoMA_-_Issue_Descriptions/
---

There are 4 types of issues that MoMA will detect and report. Here is a description of each, as well as what to do to resolve each type.

Missing Methods
---------------

This is the most severe type of issue. These methods are methods that are not implemented in Mono is any way, not even as stubs. If you try to compile your application that uses these methods with Mono, you will get an error like:

myfile.cs(22,16): error CS0117: 'xxxxxxxxxxxxxxxxx' does not contain a definition for 'xxxxxxxxxxxxxxx'

If you compile your application with MS's compiler, your application will run on Mono until it tries to use the missing method. It will then exit the whole application with an error like:

System.MissingMethodException: Method not found: xxxxxxxxxxxxxxxxxxx

**What to do:**

These method calls must be worked around and removed from your application before you can compile or run on Mono.

Alternatively, you can implement the function yourself in Mono and submit it for inclusion in future version of Mono.

MonoTodo
--------

Methods marked with [MonoTodo] may or may not cause problems for your application. Sometimes a method may be marked with this to remind a developer that some small part is not implemented or to clean it up later. Other times, the method may not be implemented at all and simply will not perform any function. This is generally done to make an application compile and run, even if it missing some functionality.

The detail report may list a specific reason why the method is marked with [MonoTodo]. Going forward, it has been requested that any developer who uses [MonoTodo] provide a reason that can be used for this report. However, numerous pre-existing tags do not have this reason.

**What to do:**

These can probably be ignored in your initial porting. Your application should still run without crashing, however there may be missing functionality. Missing functionality can be fixed by working around Mono's unfinished method, implementing the method yourself, or waiting until the method is completed in Mono.

NotImplementedException
-----------------------

These can be tricky to determine if they are a problem or not. In many cases the methods are not implemented at all, and simply throw a NotImplementedException as soon as they are called. In other cases, the method may only throw the exception under certain circumstances, while most calls work as expected. We would be very interested in any feedback about these issues. If certain methods provide a lot of false positives, we need to come up with a solution to discount them.

**What to do:**

These are pretty much like MonoTodo's. It's a gamble as to whether they will cause you problems or not. Your application will compile just fine under Mono with these issues, and you will need to test your application to see if you need to work around these calls.

P/Invokes
---------

P/Invokes (platform invokes) are used to call functions that are written in unmanaged languages, often times provided by the platform itself (user32.dll, shell32.dll). However, these can also be calls into your own unmanaged libraries. Mono can handle these calls when the unmanaged library is available for the platform you are using, however many times the whole purpose of using Mono is to run on many platforms.

**What to do:**

The long answer is available here: [Interop_with_Native_Libraries](/docs/advanced/pinvoke/).

The summary:

If you are calling something that is provided by your platform (usually the win32 API), you will have to find a way to accomplish the same functionality on all your target platforms. This could mean replacing your unmanaged call with a managed equivalent, or it can mean detecting what platform you are running on and calling the Win32/\*nix/OSX/etc. equivalent.

([http://pinvoke.net](http://pinvoke.net) can sometimes help you find the managed equivalent to Win32 API calls.)

If you are calling into your own native library, then it depends on the cross-platform capabilities of your library. If your native library will work on all your target platforms, then your application should be fine. If not, you can make your native library cross-platform compatible, do the operation in managed code, or work around it by detecting what platform you are running on.

The native library that is being called is listed in the last column on MoMA's detail report.

To find out at runtime which platform your application is running on, see: [FAQ:\_Technical#How\_to\_detect\_the\_execution_platform\_.3F](/docs/faq/technical/)


MoMA - Descrições de Problemas
Existem 4 tipos de problemas que MoMA irá detectar e relatar. Aqui está a descrição de cada um, bem como o que fazer para resolver cada tipo.

Métodos que faltam
------------------

Este é o tipo mais grave de problema. Estes métodos são métodos que não são implementados em Mono de modo algum, nem mesmo como raízes. Se você tentar compilar a aplicação que usa esses métodos com o Mono, você receberá um erro como:
myfile.cs (22,16): error CS0117: 'xxxxxxxxxxxxxxxxx' não contém uma definição para 'xxxxxxxxxxxxxxx'.
Se você compilar a aplicação com o compilador da Microsoft, a aplicação será executada em Mono até que ele tente usar o método que falta. Ele vai em seguida sair da aplicação com um erro como:
System.MissingMethodException: Método não encontrado: 'xxxxxxxxxxxxxxxxxxx'.

**O que fazer:**

Estas chamadas de métodos devem ser contornadas e removidas do sua aplicação antes que você possa compilar ou executar no Mono.
Alternativamente, você pode implementar a função em Mono e apresentá-la para inclusão na futura versão do Mono.

MonoTodo
--------

Métodos marcados com [MonoTodo] pode ou não causar problemas para a sua aplicação. Às vezes, um método pode ser marcado com isto para lembrar o desenvolvedor que uma pequena parte não está implementada ou para limpá-la mais tarde. Outras vezes, o método não pode ser implementado totalmente e simplesmente não executa nenhuma função. Isso geralmente é feito para fazer a compilação da aplicação e executá-la, mesmo se faltar alguma funcionalidade.
O relatório detalhado pode listar a razão específica para o método marcado com o [MonoTodo]. Daqui para frente tem sido solicitado que qualquer desenvolvedor que usa [MonoTodo] justifique o motivo para ser usado tal relatório. No entanto, inúmeras marcas pré-existentes não têm isso.

**O que fazer:**

Estas podem provavelmente ser ignoradas em sua portabilidade inicial. Sua aplicação ainda deve ser executada sem deixar de funcionar, no entanto, pode haver falta de funcionalidade. Falta de funcionalidade pode ser corrigida através do trabalho em torno do método inacabado em Mono, a implementação do método mesmo, ou esperar até que o método esteja concluído em Mono.
NotImplementedException(Exceção não implementada)
Estes podem ser difíceis de determinar se eles são ou não um problema. Em muitos casos, os métodos não são implementados totalmente, e simplesmente lançam um NotImplementedException assim que eles são chamados. Em outros casos, o método somente pode lançar a exceção em certas circunstâncias, enquanto a maioria das chamadas funciona como esperado. Ficaríamos muito interessados em qualquer feedback sobre essas questões. Se certos métodos fornecem uma grande quantidade de falsos positivos, temos de chegar a uma solução para descontá-los.

O que fazer:
Estes são muito bem como [MonoTodo]. É uma aposta para saber se eles vão lhe causar problemas ou não. A aplicação irá compilar muito bem sob Mono com estes problemas, e você vai precisar testar sua aplicação para ver se precisa contornar essas chamadas.

P / Invokes
-----------

P / Invokes (plataforma de chamadas) são usadas para chamar funções que são escritas em linguagens não gerenciadas, muitas vezes fornecidas pela própria plataforma (user32.dll, shell32.dll). No entanto, estas também podem ser chamadas em suas próprias bibliotecas não gerenciadas. O Mono pode lidar com essas chamadas quando a biblioteca não gerenciada está disponível para a plataforma que você está usando, no entanto, muitas vezes o propósito de usar Mono é para ser executado em várias plataformas.

**O que fazer:**

A resposta longa está disponível aqui: Interop_with_Native_Libraries.

O resumo:

Se você está chamando algo que é fornecido por sua plataforma (geralmente a API win32), você vai ter que encontrar uma maneira de fazer a mesma funcionalidade em todas as suas plataformas de destino. Isto poderia significar substituir a sua chamada não gerenciada por uma equivalente gerenciada, ou pode significar a indentificação de qual plataforma você está executando e chamando o Win32 / * nix / OSX / etc. equivalente.

([http://pinvoke.net](http://pinvoke.net) às vezes pode ajudá-lo a encontrar as chamadas equivalentes gerenciadas para a API Win32.)

Se você está chamando em sua própria biblioteca nativa, então, ela depende dos recursos da multi-plataforma de sua biblioteca. Se a sua biblioteca nativa irá trabalhar em todas as suas plataformas de destino, então, sua aplicação deve ser excelente. Se não, você pode fazer a sua biblioteca de multi-plataforma nativa compatível e fazer a operação em código gerenciado, ou trabalhar em torno da plataforma você está executando.

A biblioteca nativa que está sendo chamada é listada na última coluna no relatório de detalhes do MoMA.

Para saber em tempo de execução qual plataforma sua aplicação está sendo executada, consulte: [FAQ:\_Technical#How\_to\_detect\_the\_execution_platform\_.3F](/docs/faq/technical/)

