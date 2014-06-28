---
layout: obsolete
title: "DB4BOO"
lastmodified: '2005-10-19'
permalink: /old_site/DB4BOO/
redirect_from:
  - /DB4BOO/
---

DB4BOO
======

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#introduction">1 Introduction</a></li>
<li><a href="#boo">2 Boo</a></li>
<li><a href="#lets-boo-first">3 Let's Boo first</a>
<ul>
<li><a href="#what-happened-">3.1 What happened ?</a></li>
</ul></li>
<li><a href="#pilot-class">4 Pilot class</a></li>
</ul></td>
</tr>
</tbody>
</table>

Introduction
------------

Doing some research to build new Mono demos for tradeshows, I decided to research [db4o]({{ site.github.url }}/old_site/DB4O "DB4O"), an open source object database that works with Mono as well as [Boo](http://boo.codehaus.org/), an simple object oriented scripting language for the CLR. Boo's simple syntax is especially attractive to me as I prototype or build little applications. Also, the [Boo](http://boo.codehaus.org/) shell in [Monodevelop]({{ site.github.url }}/old_site/Development_Environments) (or in a Terminal, using *booish*) makes it very easy to try things out quickly.

Through this short tutorial, we'll use a little bit of [Boo](http://boo.codehaus.org/) to create a simplistic little application to test out and explore [db4o]({{ site.github.url }}/old_site/DB4O "DB4O")'s object persistence features.

Boo
---

Boo is a very interesting dynamic scripting language compatible with Mono and the Microsoft .NET CLR. Its simple syntax make it idea for prototyping quickly and much more. Boo is now packaged with Mono and included as an interactive shell and project wizards within [Monodevelop]({{ site.github.url }}/old_site/Development_Environments).

While Boo is statically typed, it's [Type Inference](http://boo.codehaus.org/Type+Inference) feature make it so that you never have to declare the type of "newly declared variables and fields, properties, arrays, for statement variables, overriden methods, method return types and generators".

I'd like to thank Peter Johanson (latexer), for helping me getting acquainted with Boo)

Let's Boo first
---------------

A very simple demo of Boo I like to give is the following:

1.  Start Monodevelop
2.  Make sure the boo shell is displayed (View-\> Boo Shell and then some dragging of the boo shell title bar to the main document dock area)
3.  in the boo shell, type the following (line by line, don't copy/paste, so that you get the full effect. No need to type the commments):

<!-- -->

``` csharp
import Gtk from "gtk-sharp"                                                        // (a)       
 
myWindow = Window ("Mono")                                                         // (b)
myWindow.Show()                                                                    // (c)
myWindow.Title = "Boo"                                                             // (d)
 
myButton = Button ("Click me")                                                     // (e)
myWindow.Add(myButton)                                                             // (f)
myButton.Show()                                                                    // (g)
 
myButton.Clicked += { myButton.Label += "-" }                                      // (h)
```

### What happened ?

a: We're declaring that we'll be using the Gtk assembly which comes from a pkginfo package identified as 'gtk-sharp'

b: Here, I create a new Gtk.Window object. Notice the lack of 'new' keyword as well as the infered type

c: I ask myWindow to display itself which it does

d: Magic begins, I change the Title for the window, interactively. Go look at the window, you'll see the title had changed

e: I create a Gtk.Button

f: Which I add to the myWindow window

g: I then ask MyButton to display itself. Go look at the window again and click on the button. It doesn't do anything yet.

h: I associate a [closure](http://boo.codehaus.org/Closures) (similar to an anonymous method) to the Clicked event for myButton. Each time you click on it, the method will add a '-' to the button Label. Try it !

 Now that you have an idea of what Boo looks like, let's move forward.

Pilot class
-----------

``` csharp
    public class Pilot:
 
        public _name as string
        public _points as int
 
        public def constructor (name as string, points as int):
            _name = name
            _points = points
 
        public Name as string:
            get:
                return _name
 
        public Points as int:
            get:
                return _points
 
        public def  AddPoints(points as int):
 
            _points += points
 
        public def ToString():
 
            /* I could be using 
               return _name + "/" + _points 
               but latexer mentionned that boo's string interpolation is best : */
            return "${_name}/${_points}"
```

