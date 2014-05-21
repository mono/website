---
layout: obsolete
title: "Moonlight Standalone File"
lastmodified: '2007-12-14'
permalink: /old_site/Moonlight_Standalone_File/
redirect_from:
  - /Moonlight_Standalone_File/
---

Moonlight Standalone File
=========================

This file references no external javascript or xaml file. It is completely indepedant. Use this stand alone template to create xaml content that can be rendered in both Silverlight/Windows and Moonlight/Linux.
 This file will be useful if you need to log a bug against Moonlight. For more complex xaml/javascript you will want to expand this into multiple files.

    <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
       <head>
          <title>Moonlight Stand-alone test page</title>
       </head>
          
       <body>      
          <object type="application/x-silverlight" data="data:," id="slControl" width="300" height="300">
             <param name="background" value="#CCCCCC"/>
             <param name="source"     value="#xamlContent"/>
          </object> 
          
          <!--  ADD YOUR XAML CONTENT HERE -->
          <script type="text/xaml" id="xamlContent">
          
             <?xml version="1.0"?>
             <Canvas Width="300" Height="300" xmlns="http://schemas.microsoft.com/client/2007"
                xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" x:Name="rootCanvas" >

                <TextBlock Canvas.Top="50" Canvas.Left="50">Standalone html/xaml file</TextBlock>

             </Canvas> 

          </script>
       </body>
    </html>



