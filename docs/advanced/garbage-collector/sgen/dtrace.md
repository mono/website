---
title: SGen DTrace
redirect_from:
  - /SGen_DTrace/
---

O [Gerenciador GC](/docs/advanced/garbage-collector/sgen/) do Mono no MacOS X  é instrumentado com vários testes de [DTrace](/docs/debug+profile/profile/dtrace/) que dão uma visão sobre o processo de coleta de lixo, e pode ajudar a encontrar as causas de problemas de desempenho.

Os Testes
==========

O nome do provider do DTrace para todos os testes é `monoPID`, onde` PID` é PID do respectivo processo.

``` c
gc-begin (int generation)
gc-end (int generation)
```

Os testes são acionados sempre que uma coleta de lixo começa ou termina. O valor da nova geração pode ser `0` para o berçário ou `1` para a geração anterior.

``` c
gc-locked ()
gc-unlocked ()
```

É acionado sempre que o bloqueio global do GC é tomado ou liberado. Isso acontece em outras circunstâncias mas geralmente em coletas de lixo, mas apenas durante as coletas os bloqueios devem ser mantidos por um período de tempo prolongado.

``` c
gc-heap-alloc (uintptr_t addr, uintptr_t len)
gc-heap-free (uintptr_t addr, uintptr_t len)
```

Estes acionam quando o coletor de lixo aloca ou libera uma seção de memória do sistema operacional para fins de armazenamento de objetos gerenciados. A memória alocada para metadados ou dados do coletor de lixo interno não é relatada através destes testes.

``` c
gc-nursery-tlab-alloc (uintptr_t addr, uintptr_t len)
```

Este teste são acionados quando um buffer de alocação local de thread (TLAB) é atribuída a uma thread. No momento em que o teste dispara, o TLAB está vazio, ou seja, não contém objetos.

``` c
gc-nursery-obj-alloc (uintptr_t addr, uintptr_t size, char *ns_name, char *class_name)
```

É acionado sempre que um objeto é alocados no berçário do código não gerenciado. A maior parte do tempo os objetos TLABs são alocados no gereciador de locação que não é instrumentado, devido a considerações de desempenho. Para desabilitar o gerenciador de locaçães, ir até as configuraçoes de variáveis de ambiente `MONO_GC_DEBUG` na opção `no-managed-allocator`. Isso fará com que todas as alocações no berçário acionem os testes.

``` c
gc-major-obj-alloc-large (uintptr_t addr, uintptr_t size, char *ns_name, char *class_name)
gc-major-obj-alloc-pinned (uintptr_t addr, uintptr_t size, char *ns_name, char *class_name)
gc-major-obj-alloc-degraded (uintptr_t addr, uintptr_t size, char *ns_name, char *class_name)
gc-major-obj-alloc-mature (uintptr_t addr, uintptr_t size, char *ns_name, char *class_name)
```

Acionados quando objetos são alocados diretamente de gerações anteriores. Isso acontece nos seguintes casos.

-   Grandes objetos, significando objetos maiores que 8000 bytes.

-   Objectos que são especificamente solicitados a atribuições fixas.

-   Atribuições degradadas. Se o berçário é fixado de tal forma que ele não permite alocação de objeto, o SGen muda para o modo degradado, alocando todos os objetos diretamente do acervo principal. Se ocorrer quantidades não triviais de alocações degradadas, o tamanho do berçário é aumentado.

-   Objectos que são especificamente solicitados a atribuir gerações antigas.

``` c
gc-obj-moved (uintptr_t dest, uintptr_t src, int dest_gen, int src_gen, uintptr_t size, char *ns_name, char *class_name)
```

Sempre que um objeto é movido este teste é acionado. Alterações podem ocorrer dentro e entre gerações, especificamente:

-   Dentro do berçário, se os semi-espaços antigos são utilizados.

-   A partir do berçário para acervo principal, para objetos sobreviventes do berçário e, portanto, será promovido.

-   Dentro do acervo principal, em caso de desfragmentação.

<!-- -->

``` c
gc-nursery-swept (uintptr_t addr, uintptr_t len)
gc-major-swept (uintptr_t addr, uintptr_t len)
```

Estes testes seram disparados quando partes do berçário ou acervo principal forem elimidados do objeto. Note-se que as regiões eliminadas podem abranger mais de um objeto(morto).

``` c
gc-obj-pinned (uintptr_t addr, uintptr_t size, char *ns_name, char *class_name, int generation)
```

É acionado sempre que um objeto é fixado.

Scripts de exemplo
===============

Tempos das coleta de lixo
------------------------

Quanto tempo a coleta de lixo leva para uma carga específica de trabalho?

    dtrace -q -c "mono-sgen foo.exe" -n 'mono$target:::gc-begin { self->ts = timestamp; } mono$target:::gc-end { @[arg0] = quantize ((timestamp - self->ts)/1000); }'

Exemplo saída:

         1
    value  ------------- Distribution ------------- count
       16 |                                         0
       32 |@@@@@@@@@@@@@                            1
       64 |                                         0
      128 |                                         0
      256 |                                         0
      512 |                                         0
     1024 |                                         0
     2048 |                                         0
     4096 |                                         0
     8192 |                                         0
    16384 |@@@@@@@@@@@@@@@@@@@@@@@@@@@              2
    32768 |                                         0

         0
    value  ------------- Distribution ------------- count
        4 |                                         0
        8 |                                         1
       16 |                                         0
       32 |                                         1
       64 |                                         1
      128 |                                         0
      256 |                                         0
      512 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    90
     1024 |                                         1
     2048 |                                         0
     4096 |                                         0
     8192 |@                                        3
    16384 |                                         1
    32768 |                                         0

O gráfico `0` mostra os tempos de coleta para o berçário, o gráfico `1` mostra as quantidades de grandes coleções. Podemos ver aqui que a maioria das coleções do berçário levaram cerca de metade de um milésimo de segundo, com 4 casos anómalos, tendo cerca de 10 ms. Havia três grandes coleções, duas das quais tiveram em torno de 16 ms e um terceiro quase não teve tempo algum.

Bloqueio do GC
-------

Sem as coletas de lixo, quantas vezes e por quanto tempo  o  GC realizou um bloqueio?

    dtrace -q -c "mono-sgen ipy.exe pystone.py 500000" -n 'mono*:::gc-locked { self->ts = timestamp; } mono*:::gc-begin { @ = quantize ((timestamp - self->ts)/1000); } mono*:::gc-end { self->ts = timestamp; } mono*:::gc-unlocked { @ = quantize ((timestamp - self->ts)/1000); }'

Saída:

    value  ------------- Distribution ------------- count
        0 |                                         0
        1 |@@@@@@@@@@@@@@@@@@@@@@@@@                5462
        2 |@@@@@@@@@@@@@                            2789
        4 |                                         97
        8 |                                         49
       16 |@                                        192
       32 |                                         12
       64 |                                         2
      128 |                                         0
      256 |                                         0
      512 |                                         0
     1024 |                                         1
     2048 |                                         0

O SGen lida com bloqueios muito frequentemente, mas além de um isolamento de cerca de 1 milissegundo, que é lançado quase que imediatamente. Uma análise mais aprofundada (não apresentado aqui) mostra que o isolamento é resultado da inicialização thread-poll durante a inicialização, quando alguns objetos são fixamente alocados, exigindo alocar parte da memória do sistema operacional.

Objetos fixados no berçário.
-----------------------------

Quantos objetos e de quais tipos são fixos durante as coletas de berçário?

    dtrace -q -c "mono-sgen ipy.exe pystone.py 500000" -n 'mono$target:::gc-obj-pinned /arg4==0/ { @[strjoin(copyinstr(arg2),strjoin(".",copyinstr(arg3)))] = count (); }' | tail -5

Saída:

    Microsoft.Scripting.Actions.DynamicSiteTarget`3                  863
    IronPython.Runtime.Calls.CallTarget1                             864
    System.Object[]                                                 1271
    Microsoft.Scripting.Actions.CallSite`1                          1350
    System.String[]                                                 1440

Aqui vemos a contagem de pinos para as 5 classes mais afixadas durante as coletas de berçário. Combinando todas as coleções de berçário, por exemplo, 1.440 matrizes de cadeia estavam fixas.

E se nós quisesemos saber quantos bytes de memória estão fixos no berçário durante cada coleta?

    dtrace -q -c "mono-sgen ipy.exe pystone.py 500000" -n 'mono$target:::gc-begin /arg0==0/ { bytes=0; } mono$target:::gc-obj-pinned /arg4==0/ { bytes += arg1; } mono$target:::gc-end /arg0==0/ { @ = quantize(bytes); }'

    value  ------------- Distribution ------------- count
       32 |                                         0
       64 |                                         1
      128 |@                                        2
      256 |                                         0
      512 |                                         0
     1024 |                                         0
     2048 |                                         0
     4096 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  95
     8192 |                                         0

Isso parece um pouco suspeito. Tivemos cerca de 100 coletas no berçário, isso de acordo com a contagem de objetos acima, houve uma média de 13 matrizes de objetos e 14 matrizes de cadeias fixas por coleção no berçário, além de muitos outros objetos. Todos aqueles que supostamente equivaleria a apenas cerca de 4 kilobytes de memória. Estamos contando algo errado ou são essas matrizes que são muito curtas? Vamos ver:

    dtrace -q -c "mono-sgen ipy.exe pystone.py 500000" -n 'mono$target:::gc-obj-pinned /arg4==0/ { @[strjoin(copyinstr(arg2),strjoin(".",copyinstr(arg3)))] = quantize (arg1); }'

Estas são as partes da saída dando as contagens para as matrizes que nos interessam:

    System.String[]
             value  ------------- Distribution ------------- count
                 8 |                                         0
                16 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    1344
                32 |@@@                                      96
                64 |                                         0

    System.Object[]
             value  ------------- Distribution ------------- count
                 8 |                                         0
                16 |@@@@@@@@@@@@@@@@@@@@@@@@@@@              870
                32 |@@@@@@@@@@@@@                            409
                64 |                                         0

Aparentemente, essas matrizes são realmente muito curtas. Mas será que o teste está mentindo para nós sobre o tamanho do objeto? Se nós sabemos sobre o layout interno do objeto Mono podemos ler o comprimento de matrizes diretamente do monte:

    dtrace -q -c "mono-sgen ipy.exe pystone.py 500000" -n 'mono$target:::gc-obj-pinned /arg4==0 && copyinstr(arg3)=="Object[]"/ { this->l = *(int*)copyin(arg0+12,4); @[arg1] = lquantize(this->l, 0, 8); }'

No Mono 32-bit o comprimento de uma matriz é no deslocamento 12, assim que nós lemos 4 bytes a partir daí será lançado para um `int`. Recebemos alguns gráficos como estes:

        16
    value  ------------- Distribution ------------- count
      < 0 |                                         0
        0 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 96
        1 |                                         0

        28
    value  ------------- Distribution ------------- count
        2 |                                         0
        3 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 2
        4 |                                         0

        20
    value  ------------- Distribution ------------- count
        0 |                                         0
        1 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 481
        2 |                                         0

Cada um deles nos dá a distribuição dos comprimentos de matriz para matriz dos objectos de tamanhos específicos. Se tudo estiver certo, em seguida, para cada tamanho de objeto de matriz deve haver apenas um comprimento de matriz, que é exatamente o que temos. Por exemplo, todos os objectos da matriz 481 de tamanho 20 bytes têm um comprimento igual a um.

De fato, os números mostram que os tamanhos que recebemos são exatamente o que devemos esperar dado o layout do objeto do Mono em 32-bits: A matriz de referência com um determinado comprimento tem um tamanho de 16+4n bytes.

