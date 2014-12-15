---
title: Runtime projects
redirect_from:
  - /Runtime_Projects/
---

Projetos correntes para o ambiente de execução do Mono

Acompanhamento dos projetos da equipe da VM.

Projetos em Andamento
================

Soft Debugger
-------------

O [Soft Debugger](/docs/advanced/runtime/docs/soft-debugger/) é uma nova tecnologia de depuração, usado principalmente pelo Mono no iPhone.

Compactação do GC
-------------

Trabalho no [Coletor de Lixo Geracional](/docs/advanced/garbage-collector/sgen/).

Nosso plano atual é:

-   Complete the GC in single-threaded mode.
-   Ativar o novo GC no git.
-   Depurar/corrigir quaisquer problemas com o GC.
-   Implementar uma versão multi-thread do coletor principal.

Líder: Paolo

LLVM como um Backend de Geração de Código
---------------------------------

Utilizar o código LLVM otimizado como um backend para o JIT do Mono. Para mais informação veja o [Mono LLVM](/docs/advanced/mono-llvm/) page.

Líder: Zoltan

Correções na Introspecção
----------------

Suporte para tipos definidos pelo usuário (utilizado pelo PostSharp e outras ferramentas similares).

Esta é uma tarefa que consome muito tempo, pois requer testar todos os pontos de entrada na corlib que aceitam os tipos System.Type ou System.Reflection.\*.

Continuações
-------------

Suporte para [Continuações](/archived/continuations) existe nas versões do Mono após a 2.6.

Correções do Reflection.Emit
---------------------

Corrigir execução do código SRE (utilizado pelo F# e shells Boo interativos e DLR em modo de depuração).

Esta é uma série de pequenas tarefas:

-   Terminar o levantamento das instanciações genéricas para o código gerenciado. Ainda nos falto o método genérico inflado e o método genérico inflado sobre o tipo genérico inflado.

-   Remover a instalação de dois estágios do MonoClass. Esta etapa é um pouco mais complicada e levará à diversas mudanças internas ao código de reflexão no ambiente de execução.

-   Revisar todo o código no ambiente de execução que faz suposições sobre os objetos SRE, isso deve levar a uma série de simplicação e correção de erros de longa data.

Líder: ?

Correções do Ambiente de Execução
-------------

Corrigir suporte à chamada de cauda para F#.

Adicionar suporte à variância genérica (requerido pelo C# 4.0). Este é um projeto de baixa prioridade, uma vez que apenas será lançado em 2010.

Segurança: Moonlight
-------------------

-   Validação de metadados.
-   Auditoria do código System.Reflection.Emit.
-   Validação IL.
-   Sistema de segurança CoreCLR.

Performance
-----------

### Métodos sem "quadro de pilha" em x86

Em x86 podemos evitar o uso do ponteiro para quadro de pilha (FP - Frame Pointer) e ganhar um registro extra.

Líder: Mark Probst

### Melhorias no código genérico

O código IL do código genérico é um pouco diferente do código usual e o JIT atual não consegue tratá-lo adequadamente.

Áreas onde pode-se melhorar:

-   Evitar LDADDR para chamadas restritas sobre tipos de referência.
-   Gerar código intrínsico (otimizado) e remover o "envelopamento" (boxing) de métodos em System.Object sobre tipos primitivos. Isso é importante para fazer as coleções genéricas produzirem código muito próximo do escrito manualmente.

Porte para Consoles de Jogos
-------------

Trabalhar para portar e dar suporte do Mono no [Mono:Wii](/docs/about-mono/supported-platforms/wii/) e no [Mono:PlayStation3](/docs/about-mono/supported-platforms/playstation3/).

O porte para Wii está pronto; O porte para PlayStation3 está terminado, porém requer algum trabalho para empacotar e polir as arestas.

Características Inovadoras
-------------------

-   Framework de Continuação do Paolo.

### Mudanças na API

Como parte do Mono 2.8, estaremos quebrando a API embarcada para limpar muitos problemas que surgiram ao longo dos anos.

Você pode ler mais sobre eles na página [Mudanças da API de Tempo de Execução do Mono](/archived/mono_runtime_api_changes).

Compilação entre Plataformas
-----------------

Suporte para configurar o Mono para compilação cruzada. Inicialmente está OK para quando a origem e o destino possuem a mesma ordenação de bits (endianess) e o mesmo tamanho de 'palavra' (32/64 bits).

O cenário mais importante é quando a origem é um MacOS/Intel compilando para um destino iPhone/ARM.

Projetos de Baixa Prioridade
=====================

-   Mono.Simd para NEON (processadores ARM) e/ou VMX (processador de celular).
-   Ligação ao código C++ sem necessitar código intermediário em C.

Projetos Concluídos
==================

-   [Linear](/docs/advanced/runtime/docs/linear-ir/): Uma atualização para a representação interna (RI) do JIT.
-   JIT Regalloc: Um novo framework de alocação de registros.
-   [SafeHandles](/docs/advanced/safehandles/): Suporte para SafeHandles 2.0.

