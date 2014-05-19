---
layout: obsolete
title: "Cecil:FAQ"
permalink: /old_site/Cecil:FAQ/
redirect_from:
  - /Cecil:FAQ/
---

Cecil:FAQ
=========

Now that I have the library, how do I use it?
---------------------------------------------

Here is an example of an application browsing all the types contained in a managed assembly:

``` csharp
//Creates an AssemblyDefinition from the "MyLibrary.dll" assembly
AssemblyDefinition myLibrary = AssemblyFactory.GetAssembly ("MyLibrary.dll");
 
//Gets all types which are declared in the Main Module of "MyLibrary.dll"
foreach (TypeDefinition type in myLibrary.MainModule.Types) {
    //Writes the full name of a type
    Console.WriteLine (type.FullName);
}
```

We can see the result on the output console:

``` bash
<Module>
MyLibrary.Company
MyLibrary.Employee
MyLibrary.Person
```

This code creates the Mono.Cecil.AssemblyDefinition which corresponds to the MyLibrary assembly. You can also get one of the ModuleDefinitions (AssemblyDefinition.Modules property) which are contained into an assembly. In general, you have to work with that one named MainModule (AssemblyDefinition.MainModule property)

What are the entities contained in an assembly which Cecil provides an object model for?
----------------------------------------------------------------------------------------

Here is a simplified class diagram of the main entities Cecil is dealing with and their relationships all together:

[![CecilMainCD.png]({{site.github.url}}/old_site/images/4/47/CecilMainCD.png)]({{site.github.url}}/old_site/images/4/47/CecilMainCD.png)

An AssemblyDefinition is created by an AssemblyFactory which works with an assembly file. Each of them contains a ModuleDefinitions collection. In general, you have to work with a main ModuleDefinition (you can get it by using the MainModule property).

A ModuleDefinition contains TypeDefinitions. Each of them contains collections of:

-   MethodDefinition
-   FieldDefinition
-   PropertyDefinition

You can also get the constructors of a type by using the Constructors property. A constructor is a MethodDefinition. A PropertyDefinition owns two MethodDefinitions which corresponds to the Get and the Set.

A MethodDefinition contains a MethodBody. You can get all the CIL instructions of a MethodDefinition by using the CilWorker property. In addition, the MethodDefinition contains an Instructions property.

[![CecilInstrCD.png]({{site.github.url}}/old_site/images/1/12/CecilInstrCD.png)]({{site.github.url}}/old_site/images/1/12/CecilInstrCD.png)

I would like to add some tracing functionality to an assembly I can’t debug, is it possible using Cecil?
--------------------------------------------------------------------------------------------------------

Yes it is. This technique is named [AOP](http://en.wikipedia.org/wiki/Aspect-oriented_programming). Here is a simple example on how to do it with Cecil. You’ll have to learn [CIL](http://en.wikipedia.org/wiki/Common_Intermediate_Language) if you want to make some more advanced stuff.

We take for this example the same assembly MyLibrary as previously. Instead of writing the name of each type, we will insert the following code into each methods of each type of the assembly:

``` csharp
Console.WriteLine ("Code added in ", method.Name);
```

The first thing to do is getting the System.Reflection.MethodInfo which correspond to the Console.WriteLine (string value) method.

``` csharp
//Gets the MethodInfo of Console.WriteLine() method
MethodInfo writeLineMethod = 
    typeof(Console).GetMethod("WriteLine", new Type[]{typeof(string)});
```

Next, you have to get all methods of each type of the MyLibrary assembly in order to insert the MSIL instructions.

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

The last thing to do is saving the assembly which contains the modifying types:

``` csharp
//Save the modified "MyLibrary" assembly
AssemblyFactory.SaveAssembly(assembly, pathBin);
```

After executing this code, you can use the modifying assembly in a new Console project. You have to add a reference to this assembly.

``` csharp
MyLibrary.Person p = new MyLibrary.Person();
p.Name = "Harry May";
p.Birthday = new DateTime(1982, 01, 26);
int age = p.GetAge();
Console.ReadLine();
```

This code produces also this result:

``` bash
set_Name was called
set_Birthday was called
GetAge was called
```

You can download the examples used in this FAQ [here](http://evain.net/public/cecil_faq_samples.zip)

Author: [Fabien Reinle](mailto:f.reinle_at_evaluant.com)

