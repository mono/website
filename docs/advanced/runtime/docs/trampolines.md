---
title: Trampolines
redirect_from:
  - /Mono:Runtime:Documentation:Trampolines/
---

 Trampolins são pequenos pedaços de código nativo, escritos à mão, 
usados para executar várias tarefas no ambiente de execução do Mono. 
Eles são gerados em tempo de execução usando as macros de geração de 
código nativo utilizadas pelo JIT. Eles geralmente têm uma 
função C correspondente que pode ser utilizada caso seja necessário 
executar uma tarefa mais complexa. Eles podem ser vistos como formas de 
passar o controle do código jitado de volta para o ambiente de execução. 

O código comum para todas as arquiteturas está em mini-trampolines.c, 
este arquivo contém funções de criação de trampolim mais as 
funções C chamadas pelos trampolins. Os arquivos tramp-\<ARCH\>.c 
contém o código dependente da arquitetura que cria os trampolins em si. 

A maioria dos trampolins, mas não todos, consistem de duas partes: 

- uma parte genérica contendo a maior parte do código. Esta é criada 
pela função mono_arch_create_trampoline_code () em tramp-\<ARCH\>.c. 
Trampolins genéricos podem ser grandes (1kb). 
- uma parte específica cuja a função é chamar a parte genérica, passando um 
parâmetro. O parâmetro para passar e o método pelo qual é passado depende do 
tipo de trampolim. Trampolins específicos são criados pela função 
mono_arch_create_specific_trampoline () em tramp-\<ARCH\>.c. Trampolins 
específicos são necessáriamente pequenos, porque um número enorme deles
é criado em tempo de execução. 

A parte genérica salva o estado da máquina para a pilha, e chama uma 
das funções trampolim em mini-trampolines.c com o estado, o local da
chamada, e o argumento passado para um trampolim específico. Após a 
função C retornar, ou ela retorna normalmente, ou desvia para o endereço 
retornado pela função C, dependendo do tipo de trampolim. 

Os tipos de trampolim são definidos pela enumeração MonoTrampolineType em 
[mini.h](https://github.com/mono/mono/blob/master/mono/mini/mini.h). 

Há dois tipos de funções em mini-trampolines.c: 

- As funções C reais chamadas pelos trampolins. 
- Funções para criar os diferentes tipos de trampolins. 

Funções de criação de trampolim tem a seguinte assinatura: 

``` bash 
gpointer 
mono_arch_create_foo_trampoline (<args>, MonoTrampInfo **info, gboolean aot) 
``` 

A função deve retornar um ponteiro para o trampolim recém-criado, 
alocando memória a do gerenciador de código global, ou 
a partir do gerenciador de código do domínio. Se INFO não for 
NULL, ele é definido como um ponteiro para uma estrutura do tipo 
MonoTrampInfo, que contém informação sobre o trampolim, como o seu 
nome, informação de desempilhamento, etc. Isto é utilizado para duas 
finalidades: 

- Salvar a informação do trampolim em uma imagem AOT em modo 'full-aot'. 
- Salvar a informação de debug sobre o trampolim em modo XDEBUG. 

### Trampolins JIT 

Estes trampolins são utilizados para compilar um método gerenciado para 
código nativo a primeira vez que ele é chamado. Quando o JIT compila 
uma instrução de chamada, ele não compila o método chamado de imediato. 
Ao invés disso, ele cria um trampolim JIT, e emite uma chamada de instrução 
referenciando o trampolim. Quando o trampolim é chamado, ele chama 
mono_magic_trampoline () que compila o método de destino, e retorna um 
endereço do código compilado para o trampolim que desvia para ele. 
Este processo é um pouco lento, então mono_magic_trampoline () tenta 
consertar o código inicialmente gerado pelo JIT, para ele chamar o código compilado 
em vez do trampolim a partir de agora. Isso é feito pelo 
mono_arch_patch_callsite () em tramp-\<ARCH\>.c. 

### Trampolins de Chamadas de Métodos Virtuais

Há um trampolin de chamadas de método virtual para cada entrada na vtable.
O trampolim usa este índice mais o argumento 'this' que é passado num registro 
fixo/pilha pela convenção de chamada gerenciada para obter o método 
virtual que é necessário para compilar. Em seguida, ele corrige a entrada na 
vtable com o endereço do novo método compilado.

\<TODO IMT\> 

### Trampolins de Desvio 

Trampolins de Desvio são muito similares aos trampolins JIT, eles ainda 
usam a mesma função C mono_magic_trampoline (). Eles são usados para 
implementar os códigos das operações LDFTN e JMP IL. 

### Trampolins de Inicialização de Classe

Estes trampolins são usados para implementar a semântica de inicialização de 
tipo da especificação CLI. Eles chamam a função 
C mono_class_init_trampoline () que executa o inicializador da classe 
passada como argumento do trampolim, em seguida, substitui o código 
que chama esse trampolin com NOPs para que ele não seja mais 
executado. 

### Trampolim de Inicialização de Classe Genérica

É semelhante aos trampolins de inicialização de classe, mas é utilizada para 
inicializar classes que são conhecidas somente em tempo de execução, 
em código genérico compartilhado. Ele recebe a classe para ser 
inicializada em um registro em vez de um trampolim específico. Isto 
significa que existe apenas uma instância deste trampolim. 

### Trampolins RGCTX Lazy Fetch 

Estes são usados para buscar valores de um contexto genérico em tempo 
de execução, inicializando tardiamente os valores se eles ainda não 
existem. Há uma instância desse trampolim para cada valor de 
deslocamento. 

### Trampolins AOT 

Estes são semelhantes aos trampolins JIT mas em vez de receber um 
MonoMethod para compilar, eles recebem um par imagem+token. Se o método 
identificado por este par é também compilado de forma AOT (Ahead Of 
Time - antecipadamente), o endereço do seu código compilado pode ser 
obtido sem carregar o metadado para o método. 

### Trampolins AOT PLT 

Estes trampolins manipulam tanto chamadas de código AOT quanto PLT. 

### Trampolins Delegate 

Estes trampolins são usados para manipular a primeira chamada para o 
método Invoke de um delegate. Eles chamam mono_delegate_trampoline () 
que cria uma sequência de chamadas específicas otimizadas para a 
instância delegada antes de chamá-la. Chamadas adicionais passam por 
essa sequência de código otimizado. 

### Trampolins de Aquisição/Liberação de Monitores 

Estes trampolins implementam o fastpath de Monitor.Enter/Exit em algumas 
plataformas. 

\<TODO REMAINING TRAMPOLINE TYPES\> 

