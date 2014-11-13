---
title: Trampolines
redirect_from:
  - /Mono:Runtime:Documentation:Trampolines/
---

Trampolins são pequenos, pedaços de código assembly escritos à mão usados para executar várias tarefas em tempo de execução do mono. Eles são gerados em tempo de execução usando as macros de geração de código nativas utilizadas pelo JIT. Eles geralmente têm uma função C correspondente que pode ser utilizada caso seja necessário executar uma tarefa mais complexa. Eles podem ser vistos como formas de passar o controle do código JIT de volta para o tempo de execução.

O código comum para todas as arquiteturas está em mini-trampolines.c, este arquivo contém funções de criação de trampolim mais as funções C chamadas pelos trampolins. Os arquivos tramp-\<ARCH\>.c contém o código dependente da arquitetura que cria os próprios trampolins.

A maioria, mas não todos os trampolins consistem de duas partes:

-   uma parte genérica contendo a maior parte do código. Esta é criada pela função mono_arch_create_trampoline_code () em tramp-\<ARCH\>.c. Trampolins genéricos podem ser grandes (1kb).
-   uma parte específica cuja a função é chamar a parte genérica, passando um parâmetro. O parâmetro para passar e o método pelo qual é passado depende do tipo de trampolim. Trampolins específicos são criados pela função mono_arch_create_specific_trampoline () em tramp-\<ARCH\>.c. Trampolins específicos são pequenos, desde que sejam criados vários em tempo de execução.

A parte genérica salva o estado da máquina para a pilha, e chama uma das funções trampolim em mini-trampolines.c com o estado, o site de chamada, e o argumento passado para um trampolim específico. Após a função C retornar, normalmente retorna, ou ramos para o endereço retornado pela função C, dependendo do tipo de trampolim.

Tipos de trampolim são dadas pela enumeração MonoTrampolineType em [mini.h](https://github.com/mono/mono/blob/master/mono/mini/mini.h).

O código específico da plataforma para trampolins está no arquivo tramp-\<ARCH\>.c para cada arquitetura, enquanto o código entre plataformas está em mini-trampolines.c. Há dois tipos de funções em mini-trampolines.c:

-   As funções C reais chamados pelos trampolins.
-   Funções para criar os diferentes tipos de trampolins.

Funções de criação de trampolim tem a seguinte assinatura:

``` bash
gpointer
mono_arch_create_foo_trampoline (<args>, MonoTrampInfo **info, gboolean aot)
```

A função deve retornar um ponteiro para o trampolim recém-criado, alocando memória a partir de qualquer gerenciador de código global, ou a partir de um gerenciador de código de domínio. Se INFO não for NULL, ele é definido como um ponteiro para uma estrutura do tipo MonoTrampInfo, que contém informação sobre o trampolim, como o seu nome, informação genérica, etc. Isto é utilizado para duas finalidades:

-   Salvar a informação do trampolim em uma imagem AOT em modo 'full-aot'.
-   Salvar a informação de debug sobre o trampolim em modo XDEBUG.

### Trampolins JIT

Estes trampolins são utilizados para compilar um método JIT a primeira vez que ele é chamado. Quando o JIT compila uma instrução de chamada, ele não compila o método chamado de imediato. Como alternativa, ele cria um trampolim JIT, e emite uma chamada de instrução referenciando o trampolim. Quando o trampolim é chamado, ele chama mono_magic_trampoline () que compila o método de destino, e retorna um endereço do código compilado para o trampolim que se ramifica a ele. Este processo é um pouco lento, então mono_magic_trampoline () tenta consertar o código gerado pelo JIT assim ele chama o código compilado em vez do trampolim a partir de agora. Isso é feito pelo mono_arch_patch_callsite () em tramp-\<ARCH\>.c.

### Chamadas Virtuais de Trampolins

Há uma chamada virtual de trampolim por índice vtable. O trampolim usa este índice mais o argumento 'this' que é passado num registro fixo/pilha pela convenção de chamada gerenciada para obter o método virtual que é necessário para compilar. Em seguida, ele corrige o conector vtable com o endereço do novo método compilado.

\<TODO IMT\>

### Salto de Trampolins

Salto de trampolins são muito similares aos trampolins JIT, eles ainda usam a mesma função C mono_magic_trampoline (). Eles são usados para implementar os códigos de operação LDFTN e o JMP IL.

### Classe Init Trampolines

Estes trampolins são usados para implementar os tipos de inicialização sematics da especificação CLI. Eles chamam a função C mono_class_init_trampoline () que executa o inicializador da classe passada como argumento do trampolim, em seguida, substitui o código chamadando a classe init trampoline com NOPs para que ele não seja mais executado.

### Generic Class Init Trampoline

This is similar to the class init trampolines, but is used for initalizing classes which are only known at run-time, in generic-shared code. It receives the class to be initialized in a register instead of from a specific trampoline. This means there is only one instance of this trampoline.

### RGCTX Lazy Fetch Trampolines

These are used for fetching values from a runtime generic context, lazily initializing the values if they do not exist yet. There is one instance of this trampoline for each offset value.

### AOT Trampolines

These are similar to the JIT trampolines but instead of receiving a MonoMethod to compile, they receive an image+token pair. If the method identified by this pair is also AOT compiled, the address of its compiled code can be obtained without loading the metadata for the method.

### AOT PLT Trampolines

These trampolines handle calls made from AOT code though the PLT.

### Delegate Trampolines

These trampolines are used to handle the first call made to the delegate though its Invoke method. They call mono_delegate_trampoline () which creates a specialized calling sequence optimized to the delegate instance before calling it. Further calls will go through to this optimized code sequence.

### Monitor Enter/Exit Trampolines

These trampolines implement the fastpath of Monitor.Enter/Exit on some platforms.

\<TODO REMAINING TRAMPOLINE TYPES\>

