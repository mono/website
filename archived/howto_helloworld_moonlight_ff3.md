---
title: "Howto helloWorld Moonlight ff3"
lastmodified: '2009-09-11'
permalink: /archived/Howto_helloWorld_Moonlight_ff3/
redirect_from:
  - /Howto_helloWorld_Moonlight_ff3/
---

Howto helloWorld Moonlight ff3
==============================

 This howto shows how to develop our first hello world Moonlight 1.0 application.

The first thing you will need is the **Silverlight.js** file.

A Moonlight user interface is defined using XAML.XAML is just XML and we are going to use a Canvas that contains a TextBlock:

Create MyCanvas.xaml file:

``` csharp
<Canvas
        xmlns="http://schemas.microsoft.com/client/2007"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        width="640" Height="480"
        Background="White"
        x:Name="PageTextBlock">
        <TextBlock Width="195" Height="42" Canvas.Left="28" Canvas.Top="35"
                   Text="Click Here!!!!" x:Name="entryHello" /> 
 
</Canvas>
```

this XAML contains two components. the Canvas which defines the overall drawing surface and the second component is the TextBlock element which renders the text "Click Here!!!".

Create createMoonlight.js file:

``` csharp
var slControl;
var entryHello;
 
function createSilverlight()
{
        Silverlight.createObjectEx({
                source: "MyCanvas.xaml",
                parentElement: document.getElementById("slControl"),
                id: "slControlObj",
                properties: {
                                width: "100%",
                                height: "100%",
                                version: "1.0"
                            },
                            events: {
                                onLoad: load
                            }
                        });
}
 
function load(control,userContext,rootElement)
{
        slControl = control;
        entryHello = slControl.content.findName("entryHello");
        entryHello.addEventListener("MouseLeftButtonDown","entryOnClick");
}
 
function entryOnClick(sender,args)
{
        entryHello.Text = "Hello World Moonlight!!!!";
}
```

The createSilverlight javascript function creates the object and defines some properties like source,parentElement,id and events. the event onLoad defines a load event handler. the event handler function locates the TextBlock and adds and event listener to its listener collection.

Create helloWorld.htm html file to test Moonlight:

``` csharp
<html>
  <head>
        <script src="Silverlight.js"></script>
        <script src="createMoonlight.js"></script>
        <style>
          .slControl {
                height: 480px;
                width: 640px;
                border: 1px dotted black;
          }
        </style>
        <title>Hello @carlitos castro Moonlight/Silverlight Hello World!!!!</title>    
  </head>
  <body>
    Moonlight/Silverlight Sample:<br>
    <div id="slControl" class="slControl">
        <script>
          createSilverlight();
        </script>
    </div>
  </body>
</html>
```

Open your Web Browser and open your new helloWorld.htm html file, later clic on text.

