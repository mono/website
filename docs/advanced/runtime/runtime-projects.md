---
title: Runtime projects
redirect_from:
  - /Runtime_Projects/
---

Projetos correntes para o ambiente de execução do Mono

Trilha de projetos para a equipe VM.

Projetos em Andamento
================

Soft Debugger
-------------

O [Soft Debugger](/docs/advanced/runtime/docs/soft-debugger/) é uma nova tecnologia de depuração, usado principalmente pelo Mono no iPhone.

Compactação do GC
-------------

Trabalha com respeito ao [GC Geracional](/docs/advanced/garbage-collector/sgen/).

Nosso plano atual é:

-   Complete the GC in single-threaded mode.
-   Ativar o novo GC no git.
-   Depurar/corrigir quaisquer problemas com o GC.
-   Implement a multi-threaded version of the major collector.

Liderança: Paolo

LLVM como um Backend de Geração de Código
---------------------------------

Utilizar o código LLVM otimizado como um backend para o JIT do Mono. Para mais informação veja o [Mono LLVM](/docs/advanced/mono-llvm/) page.

Liderança: Zoltan

Correções de Reflexão
----------------

Suporte para tipos definidos pelo usuário (utilizado pelo PostSharp e outras ferramentas similares).

Esta é uma tarefa intensiva que consome muito tempo, pois requer testar todos os pontos de entrada na corlib que levam os tipos System.Type ou System.Reflection.\*.

Continuações
-------------

Suporte para [Continuações](/archived/continuations "Continuations") é suportado nas versões do Mono após 16 de Abril (para estar disponível ao público no Mono 2.6).

Leia mais sobre [Continuações](/archived/continuations "Continuations") aqui.

Correções do Reflection.Emit
---------------------

Corrigir execução do código SRE (utilizado pelo F# e shells Boo interativos e DLR em modo de depuração).

Esta é uma série de pequenas tarefas:

-   Terminar o levantamento das instanciações genéricas para o código gerenciado. Ainda nos falto o método genérico inflado e o método genérico inflado sobre o tipo genérico inflado.

-   Remover a instalação de dois estágios do MonoClass. Esta etapa é um pouco mais complicada e levará à diversas mudanças internas ao código de reflexão no ambiente de execução.

-   Revisar todo o código no ambiente de execução que faz suposições sobre os objetos SRE, isso deve levar a uma série de simplicação e correção de erros de longa data.

Liderança:

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

### Frameless Methods on x86

Em x86 podemos evitar usar o ponteiro e ganhar um registro extra.

Liderança: Mark Probst

### Generics code improvements

Generics IL is a bit different from regular code and the current JIT doesn't properly handle it.

Areas where can can improve:

-   Avoid LDADDR for constrained calls on reference types.
-   Intrinsify and remove boxing for methods on System.Object over primitive types. This is important to make generic collections produce code close to the manually crafted equivalent.

Console Ports
-------------

Work to port and support Mono on the [Mono:Wii](/docs/about-mono/supported-platforms/wii/) and the [Mono:PlayStation3](/docs/about-mono/supported-platforms/playstation3/).

The Wii port is ready; The PlayStation3 port is finished, but requires some work to package and polish the sharp edges.

Innovative Features
-------------------

-   Paolo's Continuation Framework.

### API Changes

As part of Mono 2.8, we will be breaking the embedding API to clean up many issues that have cropped over the years.

You can read more about them in the [Mono_Runtime_API_Changes](/archived/mono_runtime_api_changes "Mono Runtime API Changes") page.

Cross Compilation
-----------------

Support for configuring Mono as a cross-compiler. Initially it is OK to mandate that the host and the target have the same endianess and the same word size.

The most important scenario is MacOS X/Intel host compiling for iPhone/ARM target.

Low Priority Projects
=====================

-   Mono.Simd for NEON (ARM processors) and/or VMX (Cell Processor).
-   C++ bindings without C glue.

Completed Projects
==================

-   [Linear](/docs/advanced/runtime/docs/linear-ir/): An update to the JIT's internal representation (IR).
-   JIT Regalloc: A new register allocation framework.
-   [SafeHandles](/docs/advanced/safehandles/): Support for 2.0 SafeHandles.

