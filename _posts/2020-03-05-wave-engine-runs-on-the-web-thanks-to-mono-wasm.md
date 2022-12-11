---
layout: blog
title: "Wave Engine runs on the Web thanks to Mono Wasm"
author: Marcos Cobeña Morián
tags: [webassembly, wasm]
---

*Note: This is a guest post by Marcos Cobeña Morián from Plain Concepts, about how Mono Wasm has allowed their 3D cross-platform engine, Wave Engine, to run in the browser.*

# What WebAssembly means for .NET

[WebAssembly](https://webassembly.org/) (Wasm) is the not-so new standard to run high performance code in the browser, in the client side. You can think of it as an optimized Virtual Machine (VM), which translates intermediate code, bytecode, into the target machine architecture, all of it within a secured sandbox. It is not a replacement for JavaScript, it is not the silver bullet, but has allowed us to think of the Web as another desktop target for .NET, in the same way Windows, macOS, Android or iOS, among other ones, already are. 

You can right now run your .NET Core Console app embedded in a HTML file, make web requests, access the File System (FS), draw stuff with WebGL (the Web branch for OpenGL), and a lot of more things, just because it is the .NET runtime being executed in Wasm. There are still steps to be taken in order to make things smoother for  us the Developers but, at the same time, begins to be mature enough for using along projects. 

# What Mono Wasm is & why Wave Engine needs it 

Mono Wasm —as it was named until some weeks ago, now it is .NET too—, provides Mono's .NET Common Language Runtime (CLR), written mostly in C, compiled into Wasm. [Emscripten](https://emscripten.org/), an Open Source project, provides the toolchain needed to turn LLVM backends into Wasm, along with a JavaScript bootstrap to initialize the environment. 

With [Wave Engine](https://waveengine.net/), our cross-platform 3D engine focused on industrial needs, we already tried to target the Web a few years ago, back with [JSIL](http://jsil.org/), but the state of art was simply not ready for us. We paused such attempt until we could gain on performance and easiness to target the low-level drawing APIs. 

Along with the development of Mono Wasm, and parties like [Uno Platform](https://platform.uno/) using such as their underlying technology, we rethought our position and, after studying how WebGL could be achieved, we started enabling the Web as another platform we can, nowadays, target. 

# Your first app with Mono Wasm 

There are currently different paths if you want to target Wasm in .NET: 

- [Blazor](https://dotnet.microsoft.com/apps/aspnet/web-apps/blazor): which “lets you build interactive web UIs using C# instead of JavaScript”, and runs on Mono Wasm underneath; 
- [Uno’s Wasm bootstrap](https://github.com/unoplatform/Uno.Wasm.Bootstrap): which allows Uno Platform to run on top of Wasm, and is built also on top of Mono Wasm NuGets; 
- Mono Wasm NuGets: downloadable through their Jenkins artifacts, are the barebones needed to enable the Wasm scenario in .NET 

There exist some other cool projects to turn Wasm modules into .NET assemblies —like Eric Sink’s [wasm2cil](https://github.com/ericsink/wasm2cil)—, for instance, which empower the community too. 

## Getting the toolchain 

Every .NET Developer is used to specify their target platform/s through CSPROJ files, but this differs a little bit with Wasm nowadays. The infrastructure is still not ready, and the entire toolchain is supplied in the shape of above NuGets: Mono runtime it-self, linker, JavaScript interop SDK, etc. 

In order to push in the direction which would help Microsoft/Mono to build the below mentioned infrastructure, and enjoy the latest bits from the repo, you should: 

1. Navigate to the latest successful build and download the artifacts: 

https://jenkins.mono-project.com/job/test-mono-mainline-wasm/label=ubuntu-1804-amd64/lastSuccessfulBuild/Azure/ 

1. Download the ZIP containing the NuGets: 

mono-wasm-*.zip 

1. Uncompress it and find the NuGets under packages/ 

## Creating the project 

We simply tell .NET compiler to target Wasm through the Project’s SDK attribute and, apart from this, there is no other fundamental difference with any other one: 

```xml
<Project Sdk="Mono.WebAssembly.Sdk/0.2.0"> 
 
 <PropertyGroup> 
  <TargetFramework>netstandard2.0</TargetFramework> 
 </PropertyGroup> 
 
 <ItemGroup> 
  <None Remove="index.html" /> 
 </ItemGroup> 
 
</Project> 
```

*Basic structure of a .csproj file targeting Wasm*

In order to the compiler detect where Mono.WebAssembly.Sdk NuGet is you will need to supply a NuGet.config file, establishing where such is in the hard drive. 

With the goal of simplifying all these steps we have set up a repo which provides everything ready to start writing your code: [WasmApp1](https://github.com/MarcosCobena/WasmApp1); along with an [article](https://marcoscobena.com/?i=wasmapp1) on how to serve the resulting HTML page locally. We though on it as if you could create a new project within Visual Studio, just choosing a Wasm template. 

# Interop-ing with the DOM 

In the same way you update your UI controls from a Xamarin.Forms app, you make the same with the DOM in a web page: you can modify the web UI from .NET and, also, invoke .NET stuff from the UI —like through a button click, for example. 

## From .NET to the DOM 

WasmApp1 template comes with a HTML button which fires some code in the .NET side. Such button is created dynamically when the app starts, and we subscribe to its onclick event just after: 

```csharp
using (var document = (JSObject)Runtime.GetGlobalObject("document")) 
using (var body = (JSObject)document.GetObjectProperty("body")) 
using (var button = (JSObject)document.Invoke("createElement", "button")) 
{ 
  button.SetObjectProperty("innerHTML", "Click me!"); 
  […] 
  body.Invoke("appendChild", button); 
} 
```

*A piece of Program.cs, from WasmApp1*

The Runtime static class, located at WebAssembly namespace, provides some handy methods to get a reference from a JavaScript object and, wrapped through the JSObject facade, interact with it. 

You may ask why document, body and button are scoped with usings: there is actually two references for each one of them running at the same  time in the browser: the one in pure JavaScript, and the one in .NET,  and it is a good practice to not keep the second one alive more time  than it is needed —it is indeed stored at the Emscripten layer, and can be gathered through BINDING.mono_wasm_object_registry at the browser’s Console. The less elements such contains, the better for performance. 

![WasmApp1 running](/images/2020-03-05-wave-engine-runs-on-the-web-thanks-to-mono-wasm/WasmApp1Demo.gif) 

*WasmApp1 running in Firefox* 

Ideally, the community will provide NuGets so JSObject may not be visible at a higher level, as Kenneth Pouncey is already doing with his [wasm-dom](https://github.com/kjpou1/wasm-dom) project —see the samples folder! 

From [Plain Concepts](https://www.plainconcepts.com/) we maintain the low-level WebGL bindings, [WebGL.NET](https://github.com/WaveEngine/WebGL.NET) (really creative naming heh?), thought for Wave Engine, which can be used by just adding the NuGet package to above project. In our case, starting from [Khronos](https://www.khronos.org/)’ IDL files, where WebGL 1.0 and 2.0 versions are defined, we built a [Console tool](https://github.com/WaveEngine/WebGL.NET/tree/master/src/WebIDLToCSharp) which parses such files and outputs a C# backend, abstracting JSObject interop. This way we write WebGL code in a similar flavor as any JavaScript would do but feeling at home with C#. We spent a [talk at past dotNet 2019](https://www.youtube.com/watch?v=dzTMsHH5O1w) where explained more in depth how we reached everything. 

There are multiple options to generate bindings for JavaScript APIs, like  looking for their TypeScript mappings and working though such to obtain  the C# equivalent. Or even simply doing such manually, if the origin  it-self is small enough. 

## From the DOM to .NET 

Following with WasmApp1, when an user clicks the button such happens in the DOM side, as the button triggers its onclick event. As the template showcases, such event is subscribed from .NET: 

```csharp
button.SetObjectProperty( 
  "onclick", 
  new Action<JSObject>(_ => 
  { 
​    using (var window = (JSObject)Runtime.GetGlobalObject()) 
​    { 
​      window.Invoke("alert", "Hello, Wasm!"); 
​    } 
  })); 
```

*The Program.cs portion where the button’s onclick subscription happens*

If we see the signature in JavaScript for a button’s onclick, a [MouseEvent](https://developer.mozilla.org/es/docs/Web/API/MouseEvent) object is sent back, with information related. We wrap such in C# by telling our Action will receive a JSObject, thus WebAssembly.Runtime already handles the cast from JavaScript to that .NET type. In our case, we are not interested in reading its information, but could access its properties by using JSObject methods like GetObjectProperty(), for instance. 

Until here, the communication has been fired from an user interaction with DOM, where a subscription in .NET is already set; however, could we simply invoke .NET code from anywhere in JavaScript?  The answer is yes, and we go back to BINDINGS object, available always during the page execution, which provides a function to call static methods from a well-known assembly: 

```javascript
BINDING.call_static_method("[WasmApp1] WasmApp1.Program:Main", []); 
```

*Init code at index.html to execute our app’s entry point* 

In a syntax of type “[AssemblyName] FullQualifiedClassName:StaticMethodName” we can tell the .NET Runtime to immediately execute such method and wait for its return value. The  second parameter provided is an array to pass arguments. 

# Wave Engine’s glTF viewer 

A few weeks ago, we made public our first experiment with Wave Engine targeting the Web: a 3D models viewer: 

http://gltf.waveengine.net/ 

![glTF viewer showing the flight helmet model](/images/2020-03-05-wave-engine-runs-on-the-web-thanks-to-mono-wasm/FlightHelmetDemoOptimized.gif) 

*Wave Engine’s* *glTF* *viewer showing a loaded model* 

Such supposed a milestone achievement for us, as demoed we are ready to create 3D experiences within the browser though for the industrial needs: CAD tools, 3D viewers, GPU-based computation, etc. Reaching Wasm with our C# existing codebase has meant a tremendous value for us and are sure the same applies for other companies and individuals around the globe. 

If you want to look in depth how we developed this solution please keep reading [here](https://geeks.ms/waveengineteam/2020/02/06/wave-engines-on-line-gltf-viewer/). 

# Looking further 

Although most of the .NET Core 3 API is supported, we have stumbled upon specific scenarios which still have some caveats: 

1. You can consume System.IO namespace, but only through its sync API: it has to do with the underlying Emscripten FS virtualization, but would be great to have some documentation on what users can do nowadays, like best practices 

1. You cannot use multi-threading broadly: there is already support from Emscripten and .NET, but just some browsers support it, as Wasm it-self is maturing too at the same time 

If we could write a love letter to .NET Wasm, it would be like this: 

1. A single toolchain to rule them all: currently there is no chance to get .NET Wasm bits from nuget.org (the same package names are also taken by other users), which frustrates beginners from playing with it. Uno distributes them internally; we, Wave Engine, have a private feed with such uploaded 

1. Better debugging and profiling tools: nowadays there are options to support debugging C# from Chrome’s Developer tools, but we dream with something supported from Visual  Studio it-self, like debugging JavaScript within an ASP.NET Core application. 

Surely because of our nature, driven by Wave Engine, we are obsessed with gaining some CPU cycles in our apps. It would be fantastic to, as an example, open Runtime traces in Xamarin Profiler, and reuse —here I am speaking personal— my existing knowledge while using such for Xamarin apps 

1. Documentation: Blazor is doing a good job in this aspect, but is focused on the ASP.NET point of view from our perspective: we would really like plain, clean, documentation on the WebAssembly Runtime it-self, which will encourage users to think of the Web as a platform per se, from where initiatives like Wave Engine or Uno Platform emerge from ground up 

Mono Wasm, or better said .NET Wasm, as the Wasm module and companion JavaScript file were renamed a few weeks ago, will be part of .NET 5. We would really like this to happen, not only  because of the message it spends, but mainly for the improvements the  toolchain will obtain as part of the process of making it easy for  Developers to consume. 

As being developed in Open Source, you, or your company, can collaborate to make Wasm support better. All the work is made at GitHub under [sdks/wasm](https://github.com/mono/mono/tree/master/sdks/wasm) path. You can start by cloning the repo into a Linux machine —or simply under Windows 10 with [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10) installed. 

Going through its root README.md, enables you with everything needed to build and run the test suite used. Simply reporting bugs —where we have found the WasmApp1 repo [branches](https://github.com/MarcosCobena/WasmApp1/branches) to be a quick path for such— leverage the need of even more attention in this promising, and quite beautiful, platform. 