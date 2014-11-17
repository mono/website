---
title: Mono.Cecil FAQ
redirect_from:
  - /Cecil:FAQ/
---

Agora que eu tenho a biblioteca, como posso usá-la ?
---------------------------------------------

Aqui está um exemplo de um aplicativo de navegação de todos os tipos contidos em um gerenciador de montagem: 

``` csharp
//Creates an AssemblyDefinition from the "MyLibrary.dll" assembly
AssemblyDefinition myLibrary = AssemblyFactory.GetAssembly ("MyLibrary.dll");
 
//Gets all types which are declared in the Main Module of "MyLibrary.dll"
foreach (TypeDefinition type in myLibrary.MainModule.Types) {
    //Writes the full name of a type
    Console.WriteLine (type.FullName);
}
```

Podemos ver o resultado no console de saída:

``` bash
<Module>
MyLibrary.Company
MyLibrary.Employee
MyLibrary.Person
```

Este código cria o Mono.Cecil.AssemblyDefinition que corresponde ao MyLibrary assembly. Você também pode obter um dos ModuleDefinitions (AssemblyDefinition.Modules property) que estão contidos no assembly. Em geral, você tem que trabalhar com o  MainModule (AssemblyDefinition.MainModule property)

Quais são as entidades contidas no assembly que o Cecil fornece para um modelo de objeto?
----------------------------------------------------------------------------------------

Aqui está um diagrama de classes simplificado das principais entidades que o Cecil está lidando e todas as suas relações:

[![CecilMainCD.png](/archived/images/4/47/CecilMainCD.png)](/archived/images/4/47/CecilMainCD.png)

Um AssemblyDefinition é criado por um AssemblyFactory que trabalha com um arquivo de montagem. Cada um deles contém uma coleção ModuleDefinitions. Em geral, você tem que trabalhar com um  ModuleDefinition principal (você pode obtê-lo usando a propriedade MainModule).

A ModuleDefinition contém TypeDefinitions. Cada um deles contém coleções de:

-   MethodDefinition
-   FieldDefinition
-   PropertyDefinition

Você também pode obter tipos de construtores usando a propriedade construtores. Um constructor é um MethodDefinition. A PropertyDefinition possui duas MethodDefinitions que corresponde ao Get e o Set.

Um MethodDefinition contém um MethodBody. Você pode obter todas as instruções CIL de um MethodDefinition usando a propriedade  CilWorker. Além disso, o MethodDefinition contém uma propriedade de instruções.

[![CecilInstrCD.png](/archived/images/1/12/CecilInstrCD.png)](/archived/images/1/12/CecilInstrCD.png)

Eu gostaria de adicionar alguma funcionalidade de rastreamento para um conjunto que não consegue ser depurado, é possivel usar o Cecil?
--------------------------------------------------------------------------------------------------------

Pode sim, Esta técnica é denominada [AOP](http://en.wikipedia.org/wiki/Aspect-oriented_programming). Aqui está um exemplo de como fazê-lo com Cecil. Você vai ter que aprender [CIL](http://en.wikipedia.org/wiki/Common_Intermediate_Language) se você quiser fazer alguma coisa mais avançada.

Tomamos para este exemplo o mesmo assembly MyLibrary como anteriormente. Em vez de escrever o nome de cada tipo, vamos inserir o seguinte código para cada método de cada tipo da assembly:

``` csharp
Console.WriteLine ("Code added in ", method.Name);
```

A primeira coisa a fazer é obter o System.Reflection.MethodInfo que corresponde ao método Console.WriteLine (valor string).

``` csharp
//Gets the MethodInfo of Console.WriteLine() method
MethodInfo writeLineMethod =
    typeof(Console).GetMethod("WriteLine", new Type[]{typeof(string)});
```

Em seguida, você tem que ter todos os métodos de cada tipo do conjunto MyLibrary afim de inserir as instruções MSIL.

``` csharp
//Getting the path of the "MyLibrary.dll" assembly
string pathBin = "../../../MyLibrary/bin/debug/MyLibrary.dll";
 
//Gets the AssemblyDefinition of "MyLibrary"
AssemblyDefinition assembly = AssemblyFactory.GetAssembly(pathBin);
 
//Gets all types of the MainModule of the assembly
foreach(TypeDefinition type in assembly.MainModule.Types)
{
    if(type.Name != "<Module>")
    {
        //Gets all methods of the current type
        foreach(MethodDefinition method in type.Methods)
        {
            //Gets the CilWorker of the method for working with CIL instructions
            CilWorker worker = method.Body.CilWorker;
 
            //Creating a sentence according to the current method
            string sentence;
            sentence = String.Concat("Code added in ", method.Name);
 
            //Import the Console.WriteLine() method
            MethodReference writeLine;
            writeLine = assembly.MainModule.Import(writeLineMethod);
 
            //Creates the MSIL instruction for inserting the sentence
            Instruction insertSentence;
            insertSentence = worker.Create(OpCodes.Ldstr, sentence);
 
            //Creates the CIL instruction for calling the
            //Console.WriteLine(string value) method
            Instruction callWriteLine;
            callWriteLine = worker.Create(OpCodes.Call, writeLine);
 
 
            //Getting the first instruction of the current method
            Instruction ins = method.Body.Instructions[0];
 
            //Inserts the insertSentence instruction before the first //instruction
            method.Body.CilWorker.InsertBefore(ins, insertSentence);
 
            //Inserts the callWriteLineMethod after the //insertSentence instruction
            worker.InsertAfter(insertSentence, callWriteLine);
        }
    }
}
```

A última coisa a fazer é salvar o conjunto que contém os tipos de modificação:

``` csharp
//Save the modified "MyLibrary" assembly
AssemblyFactory.SaveAssembly(assembly, pathBin);
```

Depois de execultar este código, você pode usar o assembly em um novo projeto Console.. Você tem que adicionar uma referência ao assembly.

``` csharp
MyLibrary.Person p = new MyLibrary.Person();
p.Name = "Harry May";
p.Birthday = new DateTime(1982, 01, 26);
int age = p.GetAge();
Console.ReadLine();
```

Este codigo também produz este resultado:

``` bash
set_Name was called
set_Birthday was called
GetAge was called
```

Você pode baixar os exemplos usados neste FAQ [Aqui](http://evain.net/public/cecil_faq_samples.zip)

Autor: Fabien Reinle, f.reinle_at_evaluant.com

