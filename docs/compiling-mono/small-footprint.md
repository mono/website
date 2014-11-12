---
title: Menos espaço
redirect_from:
  - /Small_footprint/
  - /Small/
---

Como fazer uma instalação menor do Mono
=======================================

A instalação mais básica do mono atualmente ocupa cerca de 3,7 MB de espaço em disco, isso inclui cerca de 1,7 MB para o JIT e 2 MB para o mscorlib.dll.

Os requisitos de memória para execução dependem de quão complexa é a aplicação alvo. Uma aplicação simples vai se satisfazer com 2 MB de memória de escrita para o processo do mono em si e 5 MB de memória compartilhada de apenas leitura para as bibliotecas mmapped e montagens. Até aqui sugere-se que o requisito mínimo de memória de sistema seja 32 MB, embora o mono possa executar com menos memória, o total depende das aplicações que estão executando no sistema.

Há várias coisas que podem ser feitas para reduzir o espaço ocupado pela execução do mono. Seguem algumas dicas e ideias:

-   Removendo recursos desnecessários
-   Removendo informações desnecessárias
-   Dicas de compilação
-   Reduzindo o código nas montagens

Removendo recursos desnecessários
---------------------------------

O Mono pode ser configurado para desabilitar certos recursos. Alguns deles são necessários apenas para ajudar a depurar o mono, ou apenas em alguns sistemas. A diretiva a ser usada é --enable-minimal=list onde list é uma lista de recursos separadas por vírgula, dessa forma: aot, profiler, decimal, pinvoke, debug, reflection_emit, large_code, logging, com, ssa, generics. Então faça algo parecido com isso em seu diretório com o código fonte do mono:

     ./configure --enable-minimal=aot,profiler

para remover o suporte à AOT e profiling da construção.

A opção adicional --enable-small-config vai reduzir mais ainda os requisitos de memória em tempo de execução e limitar algumas capacidades, com o número máximo de threads e o tamanho máximo de código em métodos, etc.

Note que algumas das diretivas não estão implementadas no momento, mas é muito fácil contribuir nessa área: escolha uma diretiva não implementada, modifique o mono com os #ifdefs apropriados, teste a construção com e sem a funcionalidade e envie-nos um patch.

O GC Boehm pode ser construído para suportar melhor heaps menores (normalmente se você quer um mono menor, você também tem restrições no uso da memória RAM). Modifique libgc/configure.in para definir incondicionalmente SMALL_CONFIG adicionando a seguinte linha:

     AC_DEFINE(SMALL_CONFIG)

Removendo informações desnecessárias
----------------------

O mono inclui informações para suportar o gerenciamento de internacionalização e agrupamento. Para reduzir o número de internacionalizações suportadas, entre em tools/locale-builder e digite

     make minimal MINIMAL_LOCALES=en_US
     make install-culture-table

e então execute make no diretório do topo para construir um mono com suporte apenas à internacionalização en_US.

Muitos KBs podem ser poupados removendo dados de agrupamento desnecessários (FIXME: adicione detalhes aqui).

Dicas de compilação
-------------------

Garanta a compilação com otimizações de tamanho, faça isso digitando:

     make CFLAGS=-Os

no diretório topo do mono depois de configurar. Isso pode poupar centenas de kilobytes. Lembre-se também de retirar informações desnecessárias do binário final com o comando strip:

     strip $prefix/bin/mono

para remover informações de depuração e de símbolos não utilizados.

Reduzindo o código nas montagens
---------------------------

Para reduzir o tamanho das montagens gerenciadas, use a ferramenta de ligação no módulo cecil no git.

