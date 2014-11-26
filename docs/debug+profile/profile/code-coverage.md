---
title: Cobertura de Código
redirect_from:
  - /Code_Coverage/
---

A Cobertura de código pode ser usada para controlar quantos dos muitos muitos dos caminhos de código que o programa emprega estão sendo realmente exercitados.

Para mais informações veja [Profile](/docs/debug+profile/profile/).

MonoCov
=======

O MonoCov é composto por dois componentes: Um módulo de cobertura de código e uma GUI (interface gráfica) para fazer a cobertura de código. Isto está disponível como parte do pacote "monocov" (diponível [aqui](http://github.com/mono/monocov)).

Para usá-lo, execute o comando dessa forma:

``` bash
   mono --debug --profile=monocov program.exe
```

A informação de cobertura será a saída para o arquivo program.exe.cov. Agora você pode carregar esse arquivo na GUI com o comando:

``` bash
   monocov program.exe.cov
```

e procurar os namespaces de tipos que você deseja verificar para a cobertura de código. Clicando duas vezes sobre um método, trará uma tela com o arquivo de origem do método com as linhas de código, as linhas não atingidas pela execução estão destacadas em vermelho.

Para limitar a coleta de dados de um conjunto específico, você pode especificá-lo como um argumento para o profiler. Por exemplo, considerar apenas o código em mscorlib, use:

``` bash
   mono --debug --profile=monocov:+[mscorlib] test-suite.exe
```

Para ser capaz de coletar facilmente informações de cobertura dos testes de unidade no diretório mcs do mono, você também pode executar o teste da seguinte forma, por exemplo mcs/class/corlib:

``` bash
   make run-test RUNTIME_FLAGS="--profile=monocov:outfile=corlib.cov,+[mscorlib]"
```

Para usar opções semelhantes durante a execução de testes de unidade diretamente com nunit-console2, especifique MONO_OPTIONS da seguinte forma:

``` bash
   MONO_OPTIONS="--profile=monocov:+[MyAssembly]" nunit-console2 MyTestAssembly.dll
```

O Monocov também pode gerar um conjunto de páginas HTML que mostram os dados da cobertura. [Aqui](http://primates.ximian.com/~lupus/corlib-cov/project.html) são os arquivos gerados durante a execução do conjunto de testes baseados em nunit para a mscorlib do mono com o seguinte comando:

``` bash
    monocov --export-html=/tmp/corlib-cov corlib.cov
```

Esperamos que esta ferramenta ajude os novos colaboradores e os antigos a encontrar facilmente os pontos não testados em nossas bibliotecas e contribuir com testes para eles.

Cobertura de Código Integrada
======================

O modulo integrado de cobertura de código é bastante limitado

O Mono ja vem um módulo integrado de cobertura de código. Este módulo é ativado usando a opção Mono --profile = cov. O formato é:

    --profile=cov[:assembly-name[/namespace]] test-suite.exe

 Por padrão, o código de cobertura estará operando sobre todas as assemblys carregadas, você pode limitar isso especificando o nome da assembly, por exemplo, para realizar a cobertura de código nas rotinas de uso do seu programa, por exemplo, a seguinte linha de comando limita a cobertura de código para rotinas na assembly "demo"

``` bash
        mono --profile=cov:demo demo.exe
```

Observe que o nome da assembly não inclui a extensão.

Você pode restringir ainda mais a saída de cobertura de código, especificando um namespace:

``` bash
        mono --profile=cov:demo/My.Utilities demo.exe
```

Nesse caso só sera realizada a cobertura de código nas classes dentro namespace especificado.

A saída típica se parece com isso:

           Not covered: Class:.ctor ()
           Not covered: Class:A ()
           Not covered: Driver:.ctor ()
           Not covered: Driver:method ()
           Partial coverage: Driver:Main ()
                   offset 0x000a

Os deslocamentos exibidos são deslocamentos IL.
