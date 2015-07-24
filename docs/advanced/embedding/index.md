---
title: Embarcando o Mono
redirect_from:
  - /Embedding_Mono/
---

Este documento descreve como incorporar o runtime do Mono em sua aplicação, e como chamar os métodos gerenciados de código escrito em C, e como chamar chamar o código escrito em C a partir dos métodos gerenciados.

Para entender porque e em que situações você desejaria incorporar o Mono na sua aplicações, veja o artigo [Scripts com Mono](/docs/advanced/embedding/scripting/).

Código Fonte
============

O código fonte e os exemplos de como incorporar o Mono podem ser encontrados no diretório mono/samples/embed.

Como o Processo de Embarcar Funciona
====================================

Tipicamente, você começaria com uma aplicação escrita em C:

[![Existing.png](/archived/images/f/fa/Existing.png)](/archived/images/f/fa/Existing.png)

O processo de incorporação associa o runtime do Mono com sua aplicação, fazendo com que ela tenha um sistema de execução virtual completo rodando lado-a-lado com sua aplicação. Isso é feito associando a 'libmono' com sua aplicação (nós detalharemos como isso é feito mais à frente). Uma vez feita essa associação, as áreas de endereçamento de sua aplicação ficariam da seguinte forma:

[![Linked.png](/archived/images/8/87/Linked.png)](/archived/images/8/87/Linked.png)

A API do Mono incorporada expõe o ambiente de execução (Runtime) do Mono ao código em C. Essa interface exposta pelo Runtime do Mono permite ao desenvolvedor controlar vários aspectos em tempo de execução e também analisar o código que roda no mundo CIL, dentro do Runtime do Mono.

Uma vez que o runtime do Mono é inicializado, a coisa mais interessante a se fazer é carregar algum código CIL/.NET na aplicação. O código pode ser escrito em qualquer uma das [Linguagens Suportadas pelo Mono](/docs/about-mono/languages/), como por exemplo C#, F#, Java, IronPython ou Visual Basic. Isso irá resultar em uma área de endereçamento de sua aplicação conforme segue:

[![Loaded.png](/archived/images/2/2b/Loaded.png)](/archived/images/2/2b/Loaded.png)

O código em C é tipicamente conhecido como código *não gerenciado*, enquanto o código CIL gerado por um [compilador CIL](/docs/about-mono/languages/) é conhecido como *código gerenciado*.

Mas o que torna o sistema mais interessante do que simplesmente carregar algum código gerenciado e tê-lo rodando lado-a-lado com sua aplicação, é fazer com que o código gerenciado faça chamadas ao código em C, e que o código em C possa chamar o código gerenciado.

O código gerenciado pode chamar código não gerenciado de duas formas: utilizando [P/Invoke](/docs/advanced/pinvoke/) ou utilizando a API de baixo nível do Mono embedding.

O resultado é o seguinte:

[Image:exposing.png] 
Agora o seu código em C pode disparar métodos no mundo gerenciado, assim como o mundo gerenciado pode reagir e ser notificado de qualquer evento ou condição de interesse no código em C:

O assembly carregado pode ser tão simples quanto você necessite. Algumas coisas interessantes que os desenvolvedores têm feito são:

-   Carregar uma biblioteca de métodos que estão atreladas à interface do usuário (elementos da GUI) de uma determinada aplicação: caixas de diálogos podem então ser manipuladas pelo mundo gerenciado, enquanto que o processamento da lógica em si (core) continua em C.
-   Carregar código escrito pelo usuário na forma de assemblies, e executá-los através do código em C.
-   Mover parte do desenvolvimento para o mundo gerenciado, obtendo todos os benefícios associados à isso, como (tratamento de exceções, verificação de erros de tipagem em runtime, compilação just-in-time, maior robustez do sistema, bibliotecas que evitam erros de tipagem, etc.) ainda assim mantendo intacto o que foi desenvolvido em C.
-   Um lançador que inicia linhas de execução (threads) no plano de fundo para executar alguma tarefa pertinente à aplicação.
-   Encapsular uma aplicação web ou um serviço de um servidor web dentro da sua aplicação.
-   Utilizar o Mono para hospedar o script da interface de usuário, transformando o Mono e o script em um plugin genérico daquela interface.
-   Integrar os objetos de sistema do Mono com objetos desenvolvidos por outras empresas.

Uma vez que o Mono é reconhecidamente um poderoso framework, praticamente não existem limitações em relação às diferentes aplicações que você pode criar com as configurações acima.

Embarcando o Ambiente de Execução
=================================

O processo de embarcar o runtime consiste em algumas etapas:

-   Compilar o código e fazer o link com o runtime do Mono
-   Inicializar o runtime do Mono
-   Opcionalmente expor o código C para o universo C#/CIL.

Cada uma dessas etapas são discutidas em detalhes abaixo.

### Compilar o código e fazer o link com o runtime do Mono

Para embarcar o runtime, você precisa 'linkar' o seu código com as bibliotecas runtime do Mono. Para tal, você precisa informar os parâmetros retornados pelo pkg-config para o compilador:

``` bash
pkg-config --cflags --libs mono-2
```

é o comando utilizado para ver os parâmetros do runtime JIT.

Como por exemplo:

``` bash
gcc sample.c `pkg-config --cflags --libs mono-2`
```

Você pode ainda separar os parâmetros de compilação dos parâmetros de link, como por exemplo, utilizando as seguintes macros no seu arquivo makefile:

``` bash
CFLAGS=`pkg-config --cflags mono-2`
LDFLAGS=`pkg-config --libs mono-2`
```

Para quem utiliza o Mono com versões anteriores à 2.8, utilize "**mono**" ao invés de "**mono-2**" nos comandos acima, uma vez que a versão ABI da biblioteca libmono foi alterada.

No Windows você precisa gerar uma biblioteca de importação mono.dll através do seguinte arquivo:

<http://github.com/mono/mono/blob/master/msvc/mono.def>

e gerar o mono.lib com o seguinte comando:

``` bash
lib /nologo /def:mono.def /out:mono.lib /machine:x86
```

, assim atrelando a sua aplicação com o mono.lib.

### Inicializando o runtime do Mono

Para inicializar o runtime do JIT, faça uma chamada ao `mono_jit_init`, como por exemplo:

``` c
#include <glib/glib.h>
#include <mono/jit/jit.h>
#include <mono/metadata/assembly.h>

MonoDomain *domain;

domain = mono_jit_init (domain_name);
```

Os comandos acima irão gerar um MonoDomain no qual o seu código será executado. domain_name é o nome do domínio da aplicação principal (main). Esta chamada irá inicializar a versão padrão do framework, a qual poderá ser 2.0 ou 4.0, dependendo da versão do Mono utilizada. Para especificar uma versão do framework, você pode fazer o seguinte:

``` c
domain = mono_jit_init_version ("myapp", ""v2.0.50727);
```

A primeira coisa que você normalmente vai fazer é carregar o seu assembly e depois executá-lo:

``` c
MonoAssembly *assembly;

assembly = mono_domain_assembly_open (domain, "file.exe");
if (!assembly)
  error ();
```

No exemplo acima, o conteúdo do arquivo 'file.exe' será carregado no domínio. Isto simplesmente carrega o código, mas não irá executar nada. Você pode substituir o arquivo 'file.exe' por algum outro arquivo de transporte, como por exemplo 'file.dll'.

Para executar o código, você precisará chamar um método no assembly, ou então, caso você tenha fornecido um método Main() estático (ou seja, um ponto de entrada no código), você poderá utilizar uma função mais conveniente:

``` c
retval = mono_jit_exec (domain, assembly, argc - 1, argv + 1);
```

Certifique-se de que você sempre forneça um método Main() e execute-o com o `mono_jit_exec()` no início: isso configura algumas informações adicionais no domínio da aplicação, como por exemplo o assembly principal e o caminho base para carregamento. Você continuará podendo executar outros métodos mesmo depois que método Main() retornar.

Se você quiser invocar um método diferente, dê uma olhada na seção [Invocando Métodos no Universo CIL](#invoking-methods-in-the-cil-universe).

Certas características do runtime, como remapeamento de Dll, dependem do arquivo de configuração. Para carregar o arquivo de configuração, simplesmente adicione:

``` c
mono_config_parse (NULL);
```

O que irá carregar o arquivo de configuração do Mono (tipicamente /etc/mono/config), mas caso você queira carregar o seu próprio arquivo de configuração, informe o nome do arquivo como um argumento ao comando `mono_config_parse`:

``` c
mono_config_parse ("my_mappings");
```

#### Configurando o runtime

Quando o Mono é embarcado dentro de uma aplicação, esta necessita conhecer os assemblies runtime e os arquivos de configuração. Por padrão, a aplicação irá utilizar os locais definidos pelo sistema sobre o qual o runtime foi contruido (tipicamente os assemblies ficam em /usr/lib/mono e os arquivos de configuração em /etc/mono). Isso normalmente funciona de maneira transparente.

Mas se você está utilizando um Mono que foi realocado de sua distribuição original, como por exemplo no caso de você distribuir o Mono junto com sua aplicação, você precisa informar para o Mono runtime onde encontrar os assemblies e os arquivos de configuração. Para fazer isso, você precisa chamar a rotina `mono_set_dirs`:

``` c
mono_set_dirs (myapp_lib, myapp_etc);
```

No Windows, isso é bastante comum, uma vez que você irá instalar o Mono em um diretório diferente do padrão, como por exemplo:

``` c
mono_set_dirs("C:\\Mono-2.6.7\\lib","C:\\Mono-2.6.7\\etc");
```

### Desativando o runtime

Para desativar o runtime do Mono, você precisará limpar todos os domínios que foram criados, através da seguinte função:

``` c
mono_jit_cleanup (domain);
```

Note que nas versões atuais do Mono, o Mono runtime pode ser recarregado no mesmo processo, então chame o `mono_jit_cleanup()` somente se você nunca precisar reinicializar o processo.

### Expondo o código C para o universo CIL

The Mono runtime provides two mechanisms to expose C code to the CIL universe: internal calls and native C code. Internal calls are tightly integrated with the runtime, and provide no support for marshalling between runtime types and C types.

For example, passing a C# string will result into a MonoString\* in the C function when using an internal call (that is, it will be a pointer to the managed heap object representing the string). A C# string passed to a P/Invoke C function will result instead in, for example, a utf8 char pointer, depending on the marshalling attributes.

The other option is to use the [Platform Invoke](/docs/advanced/pinvoke/) (P/Invoke) to call C code from the CIL universe, using the standard P/Invoke mechanisms.

To use the P/Invoke system, you have to make your C function public, for example:

``` c
void DoSomething ()
{
  /* ... */
}
```

To make the runtime lookup the symbol in the current executable, use the special library name **__Internal** like this, in your DllImport attribute:

``` csharp
using System.Runtime.InteropServices;

[DllImport ("__Internal", EntryPoint="DoSomething")]
static extern void DoSomething ();
```

The "__Internal" library name will instruct Mono not to look this up in an external library, but to try to satisfy the symbol referenced (DoSomething) in the current executable image.

The P/Invoke framework provides extensive marshalling capabilities (converting strings, converting data types, mapping delegates to function pointers and much more). This is the simplest mechanism to use.

If you want direct access to managed objects you can register C code with the runtime, and later bind to it from managed code.

To register an internal call, use this call in the C code:

``` c
mono_add_internal_call ("Hello::Sample", sample);
```

Now, you need to declare this on the C# side:

``` csharp
using System;
using System.Runtime.CompilerServices;

class Hello {
  [MethodImplAttribute(MethodImplOptions.InternalCall)]
  extern static string Sample ();
}
```

Since this routine returns a string, here is the C definition:

``` c
static MonoString*
Sample ()
{
  return mono_string_new (mono_domain_get (), "Hello!");
}
```

Notice that we have to return a 'MonoString', and we use the 'mono_string_new' API call to obtain this from a string.

### Windows Considerations

On Windows, it is necessary for you to flag any methods that you want to expose through P/Invoke to be flagged with `__dllexport` or `__declspec(dllexport)`.

Updates for Mono version 2.8+
=============================

To support advanced GC implementations, implement a few optimizations and to do a much needed cleanup, the API and ABI exposed by the Mono library starting with version 2.8 has changed. Most of the API remains unchanged, but a few tweaks may be needed in the build setup and in the code. As much as possible the changes needed will allow the code to compile with both API versions.

The first thing to change is to use mono-2 instead of mono in the pkg-config invocations. To get the preprocessor flags to use during compilation, for example, you'll use:

``` bash
pkg-config --cflags mono-2
```

Please also note that mono may not use GLib anymore internally, so if you use it in your program, make sure you also link to it explicitly. No other change to the build setup should be needed.

Now let's list the changes that may be needed to the source code.

-   The glib.h header file is no longer included in the mono header files, so if you use GLib and relied on mono including the header for you, you'll need to explicitly include the glib.h header now.

-   A few functions in the API return a pointer to allocated memory: this memory must be freed with `mono_free()` instead of `g_free()`.

FIXME: provide a list or a small script to allow people to easily grep for them in their code.

-   A few internal headers are not installed anymore. You should simply remove the inclusion on those headers. This includes headers in the mono/utils directory (except mono-logger.h and the newly added mono-publib.h), headers in the mono/io-layer directory and mono/metadata/mempool.h.

-   The MonoType struct is no longer fully visible: if you have code that accesses its fields directly, you need to change it to use the accessors that are already provided also in the 1.0 version of the mono API.

For example, if you accessed the byref flag of the type using:

``` c
type->byref
```

you need to change the code to read:

``` c
mono_type_is_byref (type)
```

-   The MonoMethodSignature struct is no longer fully visible: if you have code that accesses its fields directly, you need to change it to use the accessors that are already provided also in the 1.0 version of the mono API.

For example, if you accessed the return type of the signature using:

``` c
signature->ret
```

you need to change the code to read:

``` c
mono_signature_get_return_type (signature)
```

-   The MonoArray and MonoString structures are no longer visible.

If you accessed the fields directly, you need to change the code to use the macros and functions already part of the API.

-   The MonoAssemblyName struct is no longer fully visible: to access its fields

you need to use the newly-provided accessors. Note also that it can't be allocated on the stack anymore and you'll need to create and destroy it with the following API:

``` c
MonoAssemblyName *aname = mono_assembly_name_new ("mscorlib");
mono_assembly_name_free (aname);
```

-   The MonoMethodHeader object is now transient: you need to free it when you're done to avoid leaking by calling the (already existing and safe to call) function `mono_metadata_free_mh ()`.

-   Array API changes: the integer types that represent arry lengths and array boundaries has changed to `uintptr_t` and `intptr_t`. This allows us to transparently provide a mono build that supports 64 bit indices on 64 bit systems. The affected APIs are:

``` c
mono_array_new ()
mono_array_new_full ()
mono_array_new_specific ()
mono_array_length ()
```

-   Profiler API changes.

Mono can now support multiple profilers running at the same time. The profiler initialization sequence must first install the profiler and only after that install the callbacks and set the event mask.

Also note that objects can move in memory. Use the

``` c
void mono_profiler_install_gc_moves    (MonoProfileGCMoveFunc callback);
```

function to get notifications of the old and new addresses of objects as they are moved.

-   The mono logger API now exposes only the ability to set the trace level and trace mask with the two functions:

``` c
void mono_trace_set_mask_string (const char *value);
void mono_trace_set_level_string (const char *value);
```

-   The following methods and structures (which were really unlikely to be used/useful to anyone outside of the mono internals) are not part of the public API anymore:

``` c
mono_remote_class() MonoRemoteClass
ves_icall_System_Environment_GetOSVersionString()
mono_alloc_special_static_data()/mono_get_special_static_data()
```

Invoking Methods in the CIL universe
====================================

Calling a method in the CIL universe from C requires a number of steps:

-   Obtaining the MonoMethod handle to the method.
-   The method invocation.

To get a MonoMethod there are several ways.

You can get a MonoClass (the structure representing a type) using:

``` c
MonoImage *
mono_assembly_get_image  (MonoAssembly *assembly);

MonoClass *
mono_class_from_name (MonoImage *image, const char* name_space, const char *name);
```

and then loop in the returned class method array until you get the one you're looking for. There are examples of such searches as static functions in several C files in metadata/\*.c: we need to expose one through the API and remove the duplicates.

The other, simpler, way is to use the functions in debug-helpers.h: there are examples of their use in monograph, mint and the jit as well. You basically use a string description of the method, like:

> "System.Object:GetHashCode()"

and create a MonoMethodDesc out of it with:

``` c
#include <mono/metadata/debug-helpers.h>

MonoMethodDesc* mono_method_desc_new (const char *name, gboolean include_namespace);
```

You can then use:

``` c
MonoMethod*     mono_method_desc_search_in_class (MonoMethodDesc *desc, MonoClass *klass);
MonoMethod*     mono_method_desc_search_in_image (MonoMethodDesc *desc, MonoImage *image);
```

and

``` c
#include <mono/metadata/assembly.h>

MonoImage    *mono_assembly_get_image  (MonoAssembly *assembly);
```

to search for the method in a class or in an image. You would typically do this just once at the start of the program and store the result for reuse somewhere.

Invoking a Method
-----------------

You can invoke methods either with [Unmanaged to Managed Thunks](#unmanaged-to-managed-thunks) which create a custom version of an invocation method or by using the `mono_runtime_invoke ()` methods.

The unmanaged to managed thunks are faster because they will create a custom trampoline from unmanaged code to managed code for the particular method signature that you are invoking. The `mono_runtime_invoke` methods can be used with any arguments and any method signatures.

If you are doing a few invocations, `mono_runtime_invoke` will probably suffice, but if you are adding this to a code that in your code that requires the best possible performance, you will want to use the thunks.

There are two functions to call a managed method:

``` c
MonoObject*
mono_runtime_invoke   (MonoMethod *method, void *obj, void **params,
                       MonoObject **exc);
```

and

``` c
MonoObject*
mono_runtime_invoke_array   (MonoMethod *method, void *obj, MonoArray *params,
                             MonoObject **exc);
```

obj is the 'this' pointer, it should be NULL for static methods, a MonoObject\* for object instances and a pointer to the value type for value types.

The params array contains the arguments to the method with the same convention: MonoObject\* pointers for object instances and pointers to the value type otherwise. The _invoke_array variant takes a C# object[] as the params argument (MonoArray \*params): in this case the value types are boxed inside the respective reference representation.

From unmanaged code you'll usually use the `mono_runtime_invoke()` variant.

Note that this function doesn't handle virtual methods for you, it will exec the exact method you pass: we still need to expose a function to lookup the derived class implementation of a virtual method (there are examples of this in the code, though).

You can pass NULL as the exc argument if you don't want to catch exceptions, otherwise, \*exc will be set to the exception thrown, if any. if an exception is thrown, you can't use the MonoObject\* result from the function.

If the method returns a value type, it is boxed in an object.

For example, to invoke the following C# methods:

``` csharp
class MyClass {
  static void Foo (int value) {
    ...
  }

  int Bar (string name) {
    ...
  }
}
```

assuming you got the corresponding MonoMethod\* in `foo_method` and `bar_method` and this_arg is a MonoObject\* of type MyClass, you simply execute:

``` c
/* we execute methods that take one argument */
void *args [1];
int val = 10;
/* Note we put the address of the value type in the args array */
args [0] = &val;

/* execute Foo (10);
 * it's a static method, so use NULL as the second argument.
 */
mono_runtime_invoke (foo_method, NULL, args, NULL);

/* a string is a reference, so we put it directly in the args array */
args [0] = mono_string_new (domain, "Hello");
/* execute my_class_instance.Bar ("Hello");
 * See the Creating Objects section to learn how to get this_arg.
 */
MonoObject *result = mono_runtime_invoke (bar_method, this_arg, args, NULL);
/* we always get a MonoObject* from mono_runtime_invoke (), so to get
 * the integer value we need to unbox (which returns a pointer to
 * the value stored in the object) and dereference.
 */
int int_result = *(int*)mono_object_unbox (result);
```

### Creating objects

Creating an object involves two separate actions: allocating the memory and invoking the constructor.

For constructors that take no arguments this is very simple:

``` c
/* we usually get the class we need during initialization */
MonoImage *image = mono_assembly_get_image (assembly);
MonoClass *my_class = mono_class_from_name (image, "MyNamespace", "MyClass");
...
/* allocate memory for the object */
MonoObject *my_class_instance = mono_object_new (domain, my_class);
/* execute the default argument-less constructor */
mono_runtime_object_init (my_class_instance);
```

For more complex constructors or if you want to have more control of the execution of the constructor, you can use `mono_runtime_invoke()` as explained in the previous section, after getting the MonoMethod\* representing the constructor:

``` c
/* execute my_class_instance = new MyClass ("Mono rocks"); */
MonoObject *my_class_instance = mono_object_new (domain, my_class);
void *args [1];
args [0] = mono_string_new (domain, "Mono rocks");
/* constructor methods return void, so we ignore the return value,
 * the constructed object is my_class_instance.
 */
mono_runtime_invoke (ctor_method, my_class_instance, args, NULL);
```

### Data types

Unlike [PInvoke](/docs/advanced/pinvoke/), there is no intermediate layer that translates the managed types into unmanaged typed or the other way around. With the embedded runtime, when you register an internal call, or when you call a method, you need to use the data types expected by the runtime.

This means that you need to convert your C types into Mono runtime types before you can pass them to Mono, or you must convert those Mono types to C types before you can consume them"

|C Type|Mono Type|C to Mono|Mono to C|
|------|---------|---------|---------|
|strings, char \*|MonoString \*|mono_string_new, mono_string_new_len, mono_string_new_wrapper, mono_string-new_utf16|mono_string_to_utf8, mono_string_to_utf16|
|array of x|MonoArray \*|mono_array_new, mono_array_new_full, mono_array_new_specific||

See the embedded API documentation for more details about these.

### Unmanaged to Managed Thunks

With Mono 2.0 we introduced a new function that can wrap a MonoMethod into a function pointer:

``` c
void* mono_method_get_unmanaged_thunk (MonoMethod *method);
```

You'll be able to store the returned pointer in a function pointer with the proper signature and call that directly from C:

``` c
typedef gint32 (*GetHashCode) (MonoObject *obj);

GetHashCode func = mono_method_get_unmanaged_thunk (System_Object_GetHashCode_method);

gint32 hashvalue = func (myobject);
```

Another approach is calling [Marshal.GetFunctionPointerForDelegate ()](http://msdn.microsoft.com/en-us/library/system.runtime.interopservices.marshal.getfunctionpointerfordelegate.aspx) either from managed code, or using `mono_runtime_invoke ()`.

### C# to C delegate registration

Another common pattern to have C code invoke C# code is to pass C# delegates to C through the [Interop with Native Libraries](/docs/advanced/pinvoke/) support in Mono.

When you pass a C# delegate to C, the Mono runtime will create the thunk automatically for you. The function received on the C side will be a function pointer that points to a thunk that invokes code in the C# world.

The C# side of the code would look like this:

``` csharp
using System.Runtime.InteropServices;

class Demo {
  delegate int MyCallback1 (int a, int b);

  [DllImport ("MyRuntime")]
  extern static void RegisterCallback (MyCallback1 callback1);

  static int Add (int a, int b) { return a + b; }
  static int Sub (int a, int b) { return a - b; }

  void Init ()
  {
    // This one registers the method "Add" to be invoked back by C code
    RegisterCallback (Add);
  }
}
```

Then your C code would look like this:

``` c
typedef int (*callback-t) (int a, int b);
static callback_t my_callback;

void RegisterCallback (my_callback_t cb)
{
  my_callback = cb;
}

int InvokeManagedCode (int a, int b)
{
  if (my_callback == NULL){
    printf ("Managed code has not initialized this library yet");
    abort ();
  }
  return (*my_callback) (a, b);
}
```

Threading issues
----------------

If your application creates threads on its own, and you want them to be able to interact with Mono, you have to register the thread so that the runtime knows about it.

To do so, call the `mono_thread_attach()` function before you execute any other Mono API or before manipulating any managed object.

Signal handling
---------------

Mono consumes a set of signals during execution that your applications will not be able to consume, here is what these are:

-   SIGPWR, SIGXCPU: these are used internally by the GC and pthreads.
-   SIGFPE: caught so we can turn that into an exception
-   SIGQUIT, SIGKILL to produce ExecutionEngineException.
-   SIGSEGV: to produce NullReferenceExceptions

One signal picked at startup time between SIGRTMIN and SIGRTMAX. The signal is picked up by finding a signal in that range which is set to SIG_DFL.

Optionally:

-   SIGUSR2: this is used when --trace=disable is passed on the command line and its used to turn on/off the output of trace.

Currently Mono does not provide a mechanism for signal chaining, but one might be available in the future, see [Bug #75990](http://bugzilla.ximian.com/show_bug.cgi?id=75990) for information on the current status of this feature.

API Documentation
=================

See [here](http://go-mono.com/docs/index.aspx?tlink=root:/embed).

Common Problems
===============

Threads
-------

If your applications has threads that will access Mono, access Mono variables, point to Mono objects, be called back by Mono, these threads must be registered with the Mono runtime using the `mono_thread_attach`.

Missing functionality
---------------------

If the embedding API is missing some functionality, you might be able to work around it by invoking managed code using `mono_runtime_invoke ()`, i.e. for creating delegates you can call `Delegate.CreateDelegate ()` etc.

Chicken/Egg
-----------

If you have a .NET app which P/Invokes to an unmanaged library, which embeds Mono for basically 100% of its logic, bad things can happen:

Under Linux, libmono is statically linked by default. If you p/invoke a library that it turn is linked against libmono, you'll end up with 2 runtime instances.

Even if you link libmono dynamically (there is a 'configure' switch for this), you must take care to initialize the runtime only once. This means that you can't call `mono_jit_init/cleanup` from the SO.

Samples
=======

See the sample programs in [mono/samples/embed](https://github.com/mono/mono/tree/master/samples/embed) for examples of embedding the Mono runtime in your application.

