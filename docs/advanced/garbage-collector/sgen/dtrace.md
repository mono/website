---
title: SGen DTrace
redirect_from:
  - /SGen_DTrace/
---

O [Coletor Geracional](/docs/advanced/garbage-collector/sgen/) do Mono no MacOS X  é instrumentado com pontas de prova de [DTrace](/docs/debug+profile/profile/dtrace/) que dão uma visão sobre o processo de coleta de lixo, e que podem ajudar a encontrar as causas de problemas de desempenho.

Os Testes
==========

O nome do provedor do DTrace para todos os testes é `monoPID`, onde` PID` é PID do respectivo processo.

``` c
gc-begin (int generation)
gc-end (int generation)
```

As pontas de prova acionados sempre que uma coleta de lixo começa ou termina. O valor da nova geração pode ser `0` para o berçário ou `1` para a geração anterior.

``` c
gc-locked ()
gc-unlocked ()
```

Essas pontas são acionadas quando a trava global do coletor é obtido ou liberado. Isso acontece nas 'bordas'da coleta de lixo e em outras circunstâncias, mas apenas durante as coletas a travas é mantida por um período de tempo prolongado.

``` c
gc-heap-alloc (uintptr_t addr, uintptr_t len)
gc-heap-free (uintptr_t addr, uintptr_t len)
```

Estas pontas são disparadas quando o coletor de lixo aloca ou libera uma seção de memória do sistema operacional para fins de armazenamento de objetos gerenciados. A memória alocada para metadados ou dados do coletor de lixo interno não é relatada através destas pontas de prova.

``` c
gc-nursery-tlab-alloc (uintptr_t addr, uintptr_t len)
```

Esta ponta de prova é disparada quando um buffer de alocação local da linha de excução (TLAB - thread local allocation buffer) é alocado. No momento em que a ponta é disparada, o TLAB está vazio, ou seja, não contém objetos.

``` c
gc-nursery-obj-alloc (uintptr_t addr, uintptr_t size, char *ns_name, char *class_name)
```

É disparado sempre que um objeto é alocados no berçário a partir de código não-gerenciado. A maior parte ds objetos TLABs são alocados no alocador gereciado que não é instrumentado, devido a considerações de desempenho. Para desabilitar o alocador gerenciado ajuste a variáveis de ambiente `MONO_GC_DEBUG` colocando a opção `no-managed-allocator`. Isso fará com que todas as alocações no berçário disparem essa ponta de prova.

``` c
gc-major-obj-alloc-large (uintptr_t addr, uintptr_t size, char *ns_name, char *class_name)
gc-major-obj-alloc-pinned (uintptr_t addr, uintptr_t size, char *ns_name, char *class_name)
gc-major-obj-alloc-degraded (uintptr_t addr, uintptr_t size, char *ns_name, char *class_name)
gc-major-obj-alloc-mature (uintptr_t addr, uintptr_t size, char *ns_name, char *class_name)
```

Acionados quando objetos são alocados diretamente de gerações anteriores. Isso acontece nos seguintes casos.

-   Objetos grandes, significando objetos maiores que 8000 bytes.

-   Objectos especificamente solicitados para serem alocados ja 'imobilizados'.

-   Atribuição degradada. Se o berçário tem um volume enorme de objeto 'imobilizados' que nao permitem a alocação de novos objetos, o coletor geracional(SGen) chaveia para o modo degradado, alocando todos os objetos diretamente do acervo principal. Se quantidades não triviais de alocações degradadas occorem aumente o tamnho do berçário.

-   Objectos que são especificamente solicitados para serem alocados na geração antiga(e vão demorar mais a serem coletados).

``` c
gc-obj-moved (uintptr_t dest, uintptr_t src, int dest_gen, int src_gen, uintptr_t size, char *ns_name, char *class_name)
```

Sempre que um objeto é movido esta ponta de prova é disparada. Movimentações podem ocorrer dentro e entre gerações, especificamente:

-   Dentro do berçário, se os semi-espaços antigos são utilizados.

-   Do berçário para acervo principal, para objetos  que sobreviveram no berçário e que portanto, estão sendo promovidos para uma geração mais antiga.

-   Dentro do acervo principal, em caso de desfragmentação.

<!-- -->

``` c
gc-nursery-swept (uintptr_t addr, uintptr_t len)
gc-major-swept (uintptr_t addr, uintptr_t len)
```

Estas pontas seram disparados quando partes do berçário ou acervo principal tiverem seus objetos varridos. Note-se que as regiões varridas podem abranger mais de um objeto morto.

``` c
gc-obj-pinned (uintptr_t addr, uintptr_t size, char *ns_name, char *class_name, int generation)
```

É acionado sempre que um objeto é mobilizado.

Scripts de exemplo
===============

Tempos das coletas de lixo
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

O gráfico `0` mostra os tempos de coleta para o berçário, o gráfico `1` mostra as quantidades de grandes limpezas. Podemos ver aqui que a maioria das coleções do berçário levaram cerca de metade de um milésimo de segundo, com 4 casos anômalos, tendo cerca de 10 ms. Havia três grandes limpezas, duas das quais tiveram em torno de 16 ms e uma terceira quase não tomou tempo algum.

Trava de Coletor de Lixo
-------

Sem contar as coletas de lixo, quantas vezes e por quanto tempo o coletor manteve a trava ativa?

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

O SGen lida com travamentos muito frequentemente, mas além de um caso isolado com cerca de 1 milissegundo, a trava é liberada quase que imediatamente. Uma análise mais aprofundada (não apresentado aqui) mostra que o caso espúrio é resultado da construção da reserva de linha de execuções durante a inicialização, quando alguns objetos são alocados imobilizados, exigindo alocar parte da memória do sistema operacional.

Objetos imobilizados no berçário.
-----------------------------

Quantos objetos e de quais tipos são imobilizados durante as coletas no berçário?

    dtrace -q -c "mono-sgen ipy.exe pystone.py 500000" -n 'mono$target:::gc-obj-pinned /arg4==0/ { @[strjoin(copyinstr(arg2),strjoin(".",copyinstr(arg3)))] = count (); }' | tail -5

Saída:

    Microsoft.Scripting.Actions.DynamicSiteTarget`3                  863
    IronPython.Runtime.Calls.CallTarget1                             864
    System.Object[]                                                 1271
    Microsoft.Scripting.Actions.CallSite`1                          1350
    System.String[]                                                 1440

Aqui vemos a contagem de imobilizaçoes para as 5 classes mais imobilizadas durante as coletas no berçário. Combinando todas as varrições no berçário, por exemplo, 1.440 matrizes de strings estavam imobilizadas.

E se nós quisessemos saber quantos bytes de memória estão imobilizados no berçário durante cada coleta?

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

Isso parece um pouco suspeito. Tivemos cerca de 100 coletas no berçário, portanto de acordo com a contagem de objetos acima, houve uma média de 13 matrizes de objetos e 14 matrizes de strings fixas por coleção no berçário, além de muitos outros objetos. tudo isso equivaleria a apenas cerca de 4 kilobytes de memória. Estamos contando algo errado ou são essas matrizes que são muito curtas? Vamos ver:

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

Aparentemente, essas matrizes são realmente muito curtas. Mas será que a ponta de prova está mentindo para nós sobre o tamanho do objeto? Se nós sabemos sobre o layout interno do objeto no Mono podemos ler o comprimento de matrizes diretamente da memária:

    dtrace -q -c "mono-sgen ipy.exe pystone.py 500000" -n 'mono$target:::gc-obj-pinned /arg4==0 && copyinstr(arg3)=="Object[]"/ { this->l = *(int*)copyin(arg0+12,4); @[arg1] = lquantize(this->l, 0, 8); }'

No Mono em 32-bit o comprimento de uma matriz é no deslocamento 12, assim podemos ler 4 bytes a partir dessa posição e converte-los para um `int`. Podemos então obter gráficos como estes:

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

Cada um deles nos dá a distribuição dos comprimentos de matriz para matriz de objectos de tamanhos específicos. Se tudo estiver certo, em seguida, para cada tamanho de objeto de matriz deve haver apenas um comprimento de matriz, que é exatamente o que temos. Por exemplo, todos os objectos da matriz 481 de tamanho 20 bytes têm um comprimento igual a um.

De fato, os números mostram que os tamanhos que recebemos são exatamente o que devemos esperar dado o layout de objetos no Mono em 32-bits: Matriz para tipos por referência com um determinado comprimento tem um tamanho de 16+4n bytes.

