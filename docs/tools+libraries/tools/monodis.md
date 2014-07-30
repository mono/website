---
title: Dis/Assembling CIL Code
redirect_from:
  - /Dis/Assembling_CIL_Code/
---

IL Code
=======

.NET compilers like mcs or mbas do not compile to native code, but to the Common Intermediate Language (CIL). IL code looks like this:

    // hello world dissassembled with monodis

    .assembly extern mscorlib
    {
      .ver 0:0:0:0
    }
    .assembly 'hello'
    {
      .hash algorithm 0x00008004
      .ver  0:0:0:0
    }
      .class private auto ansi beforefieldinit Hello
            extends [mscorlib]System.Object
      {

        // method line 1
        .method public hidebysig  specialname  rtspecialname
               instance default void .ctor()  cil managed
        {
            // Method begins at RVA 0x20ec
            // Code size 7 (0x7)
            .maxstack 8
            IL_0000: ldarg.0
            IL_0001: call instance void valuetype [corlib]System.Object::.ctor()
            IL_0006: ret
        } // end of method instance default void .ctor()

        // method line 2
        .method public static
               default void Main()  cil managed
        {
            // Method begins at RVA 0x20f4
            .entrypoint
            // Code size 11 (0xb)
            .maxstack 8
            IL_0000: ldstr "Hello Mono World!"
            IL_0005: call void class [corlib]System.Console::WriteLine(string)
            IL_000a: ret
        } // end of method default void Main()

      } // end of type Hello

There are two Mono tools for using IL code:

 ilasm   
The Mono Assembler can be given disassembled text, and it creates an assembly file. This is very important, because many compilers don't create the assembly themselves, and depend on this tool. Of course it can be also seen as a form of a compiler.

 monodis   
The Mono Disassembler extracts code like shown above from an assembly.

The Mono Disassembler
=====================

The monodis program is used to dump the contents of an ECMA CIL image. You can execute it by typing:

``` bash
$ monodis FILE.exe
```

The following options are supported:

 --output=FILENAME   
Write output into FILENAME.

 --mscorlib   
For non-corlib assemblies, use "mscorlib" as the assembly name. This is useful for round-tripping the IL with ilasm.

 --assembly   
Dumps the contents of the assembly table

 --assemblyref   
Dumps the contents of the assemblyref table

 --classlayout   
Dumps the contents of the classlayout table

 --constant   
Dumps the contents of the constant table

 --event   
Dumps the contents of the event table

 --exported   
Dumps the contents of the ExportedTypes table

 --fields   
Dumps the contents of the fields table

 --file   
Dumps the contents of the file table

 --interface   
Dumps the contents of the interface table

 --manifest   
Dumps the contents of the manifest table.

 --memberref   
Dumps the contents of the memberref table

 --method   
Dumps the contents of the method table

 --methodsem   
Dumps the contents of the methodsem table

 --module   
Dumps the contents of the module table

 --moduleref   
Dumps the contents of the moduleref table

 --mresources   
Dumps embedded managed resources

 --param   
Dumps the contents of the param table

 --property   
Dumps the contents of the property table

 --propertymap   
Dumps the contents of the propertymap table

 --typedef   
Dumps the contents of the typedef table

 --typeref   
Dumps the contents of the typeref table If no flags are specified the program dumps the content of the image in a format that can be used to rountrip the code.



