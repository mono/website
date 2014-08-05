---
title: "Howto Generics"
lastmodified: '2007-10-28'
redirect_from:
  - /Howto_Generics/
---

Howto Generics
==============

This sample shows how to use a parametrized types over a class

``` csharp
//compile with gmcs sample.cs /out:generics.exe
 
using System;
 
public class Generics<T> {
 
    T obj;
 
    public Generics (T o)
    {
         obj = o;
    } 
 
    public T GetObj ()
    {
        return obj;
    } 
 
    public void ShowType ()
    {
        Console.WriteLine("T type is:" + typeof(T));
    }
}
 
public class TestGenerics {
 
    public static void Main(string[] args)
    {
         int integer_value;
         string string_value;
 
         //check for some command line arguments
         if(args.Length == 0) 
             Console.WriteLine("Usage: mono generics.exe integer string");
         else {
 
             //apply to integer argument/type          
             Generics<int> integer_obj = new Generics<int>(int.Parse(args[0]));
             integer_obj.ShowType();
             integer_value = integer_obj.GetObj();
             Console.WriteLine("value:" + integer_value);
 
             Console.WriteLine("----------------------");
 
             //apply to string argument/type
             Generics<string> string_obj = new Generics<string>(args[1]);
             string_obj.ShowType();
             string_value = string_obj.GetObj();
             Console.WriteLine("value:" + string_value); 
         }         
    }
}
```

