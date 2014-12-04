---
title: SGen DTrace
redirect_from:
  - /SGen_DTrace/
---

O [Gerenciador GC](/docs/advanced/garbage-collector/sgen/) do Mono no MacOS X  é instrumentado com vários testes de [DTrace](/docs/debug+profile/profile/dtrace/) que dão uma visão sobre o processo de coleta de lixo e pode ajudar a encontrar as causas de problemas de desempenho.

Os Testes
==========

O nome do provider do DTrace para todos os testes é `monoPID`, onde` PID` é PID do respectivo processo.

``` c
gc-begin (int generation)
gc-end (int generation)
```

Os testes são acionados sempre que uma (garbage collector)coleta de lixo começa ou termina. O valor para o gerenciador pode ser `0` para o inicio ou` 1` para o gerenciador antigo.

``` c
gc-locked ()
gc-unlocked ()
```

É acionado sempre que o bloqueio global do GC é tomado ou liberado. Isso acontece em outras circunstâncias mas geralmente em (garbage collector)coletas de lixo, mas apenas durante as coletas os bloqueios devem ser mantidos por um período de tempo prolongado.

``` c
gc-heap-alloc (uintptr_t addr, uintptr_t len)
gc-heap-free (uintptr_t addr, uintptr_t len)
```

Estes acionam quando o (garbage collector)coletor de lixo aloca ou libera uma seção de memória do sistema operacional para fins de armazenamento de objetos gerenciados. A memória alocada para metadados ou dados (garbage collector)coletor de lixo interno não é relatada através destes testes.

``` c
gc-nursery-tlab-alloc (uintptr_t addr, uintptr_t len)
```

Este teste é acionado quando um buffer de alocação local de thread (TLAB) é atribuída a uma thread. No momento em que o teste dispara o TLAB está vazio, ou seja, não contém objetos.

``` c
gc-nursery-obj-alloc (uintptr_t addr, uintptr_t size, char *ns_name, char *class_name)
```

É acionado sempre que um objeto é alocados no inicio do código não gerenciado. A maior parte do tempo os objetos TLABs são alocados no gereciador de locação que não é instrumentado devido a considerações de desempenho. Para desabilitar o gerenciador de locação usar nas configuraçoes das variáveis de ambiente `MONO_GC_DEBUG` a opção `no-managed-allocator`. Isso fará com que todas as alocações acionem os testes.

``` c
gc-major-obj-alloc-large (uintptr_t addr, uintptr_t size, char *ns_name, char *class_name)
gc-major-obj-alloc-pinned (uintptr_t addr, uintptr_t size, char *ns_name, char *class_name)
gc-major-obj-alloc-degraded (uintptr_t addr, uintptr_t size, char *ns_name, char *class_name)
gc-major-obj-alloc-mature (uintptr_t addr, uintptr_t size, char *ns_name, char *class_name)
```

Acionados quando objetos são alocados diretamente de gerações anteriores. Isso acontece nos seguintes casos.

-   Grandes objetos, significando objetos maiores que 8000 bytes.

-   Objectos que são especificamente solicitados a atribuições fixas.

-   Atribuições degradadas. Se o gerenciaddor é fixado de tal forma que ela não permite alocação de objeto, o SGen muda para o modo degradado, alocando todos os objetos diretamente do acervo principal. Se ocorrer quantidades não triviais de alocações degradadas, aumentar o tamanho do gerenciador.

-   Objectos que são especificamente solicitados a atribuir antigas

gerações.

``` c
gc-obj-moved (uintptr_t dest, uintptr_t src, int dest_gen, int src_gen, uintptr_t size, char *ns_name, char *class_name)
```

Sempre que um objeto é movido este teste é acionado. Alterações podem ocorrer dentro e entre gerações, especificamente:

-   Dentro do gerenciador, se os semi-espaços antigos são utilizados.

-   A partir do gerenciador para acervo principal, para objetos sobreviventes do gerenciador e, portanto, a ser promovido.

-   Dentro do acervo principal, em caso de desfragmentação.

<!-- -->

``` c
gc-nursery-swept (uintptr_t addr, uintptr_t len)
gc-major-swept (uintptr_t addr, uintptr_t len)
```

Estes testes será disparado quando partes do gerenciador ou acervo principl for elimidada de objetos. Note-se que as regiões eliminadas podem abranger mais de um objeto(morto).

``` c
gc-obj-pinned (uintptr_t addr, uintptr_t size, char *ns_name, char *class_name, int generation)
```

É acionado sempre que um objeto é fixado.

Scripts de exemplo
===============

Tempos de coleta de lixo
------------------------

Quanto tempo a coletas de lixo levar para uma carga específica de trabalho?

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

O gráfico `0` mostra od tempos de coleta para o gerenciador, o gráfico` 1` mostra as quantidades de grandes coleções. We can see here that the majority of nursery collections took about half a millisecond, with 4 outliers taking around 10 ms. There were 3 major collections, two of which took around 16 ms and the third one barely took any time at all.

GC lock
-------

Not counting garbage collections, how often and for how long is the GC lock held?

    dtrace -q -c "mono-sgen ipy.exe pystone.py 500000" -n 'mono*:::gc-locked { self->ts = timestamp; } mono*:::gc-begin { @ = quantize ((timestamp - self->ts)/1000); } mono*:::gc-end { self->ts = timestamp; } mono*:::gc-unlocked { @ = quantize ((timestamp - self->ts)/1000); }'

Output:

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

SGen takes the lock quite often, but apart from one outlier at about 1 millisecond, it's released almost immediately. Further analysis (not presented here) shows that the outlier is a result of thread-pool initialization during startup, when a few objects are allocated pinned, requiring allocating some memory from the operating system.

Objects pinned in the nursery
-----------------------------

How many objects of which types are pinned during nursery collections?

    dtrace -q -c "mono-sgen ipy.exe pystone.py 500000" -n 'mono$target:::gc-obj-pinned /arg4==0/ { @[strjoin(copyinstr(arg2),strjoin(".",copyinstr(arg3)))] = count (); }' | tail -5

Output:

    Microsoft.Scripting.Actions.DynamicSiteTarget`3                  863
    IronPython.Runtime.Calls.CallTarget1                             864
    System.Object[]                                                 1271
    Microsoft.Scripting.Actions.CallSite`1                          1350
    System.String[]                                                 1440

Here we see the pin counts for the 5 most pinned classes during nursery collections. Combining all nursery collections, for example, 1440 string arrays were pinned.

What if we'd like to know how many bytes of memory are pinned in the nursery during each collection?

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

This looks a bit suspicious. We had about 100 nursery collections, so according to the object counts above there were on average 13 object arrays and 14 string arrays pinned per nursery collection, in addition to lots of other objects. All of those supposedly amount to only about 4 kilobytes of memory. Are we counting something wrong or are these very short arrays? Let's see:

    dtrace -q -c "mono-sgen ipy.exe pystone.py 500000" -n 'mono$target:::gc-obj-pinned /arg4==0/ { @[strjoin(copyinstr(arg2),strjoin(".",copyinstr(arg3)))] = quantize (arg1); }'

These are the parts of the output giving the counts for the arrays we're interested in:

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

Apparently those arrays really are very short. But maybe the probe is lying to us about the object size? If we know about Mono's internal object layout we can read out the array length directly from the heap:

    dtrace -q -c "mono-sgen ipy.exe pystone.py 500000" -n 'mono$target:::gc-obj-pinned /arg4==0 && copyinstr(arg3)=="Object[]"/ { this->l = *(int*)copyin(arg0+12,4); @[arg1] = lquantize(this->l, 0, 8); }'

On 32-bit Mono the length of an array is at offset 12, so we read 4 bytes from there and cast it to an `int`. We get a few graphs like these:

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

Each of them gives us the distribution of the array lengths for array objects of specific sizes. If everything is correct then for each array object size there must only be one array length, which is exactly what we get. For example, all 481 array objects of size 20 bytes have a length of one.

In fact, the numbers show that the sizes we get are exactly what we should expect given Mono's object layout on 32-bits: A reference array with a given length has a size of 16+4n bytes.

