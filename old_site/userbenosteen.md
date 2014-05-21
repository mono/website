---
layout: obsolete
title: "User:BenOSteen"
lastmodified: '2006-08-22'
permalink: /old_site/User:BenOSteen/
redirect_from:
  - /User:BenOSteen/
---

User:BenOSteen
==============

Hi
--

I'm an Oxford, UK based linux enthusiast, soon to be a Software Engineer for Oxford University Library Services (18th September 2006).

Contact me at monobosteen@maysubdivide.org

Currently working on
--------------------

[A sandbox page to see what reorganising and adding to the MonkeyGuide Desktop Application Development Guide would do. Is this a better structure for a new user? You tell me]({{site.github.url}}/old_site/BosteenMonkey_Guide)

Two pre-existing pages that I have added to, or re-worded: [GtkSharp:\_Widget\_Overview]({{site.github.url}}/old_site/GtkSharp:_Widget_Overview "GtkSharp: Widget Overview") [GtkSharp:\_Widget\_Layout\_and\_Packing]({{site.github.url}}/old_site/GtkSharp:_Widget_Layout_and_Packing "GtkSharp: Widget Layout and Packing")

Tutorial Proposal
-----------------

I am not personally convinced that dealing with the widgets on an individual basis is a good thing. As this is how the API is already structured, newbies will probably need a little more aid.

I propose a series of tutorials, graded in difficultly. The narrative would be written to reflect the process and decisions made to get to the final product. I can write up the first tutorial to reflect what I mean soon. I am not putting this here, demanding submissions, but any help/examples using Gtk.Drawables in C\# and perhaps even Mono.Cairo would be fantastic.

1.  **Basic example, using the following:**
    -   Should this be shown with Monodevelop and Stetic?
    -   hboxes and vboxes for layout
        -   setting properties such as homogenous, width-request, and placement
    -   Label
    -   Button
        -   User defined at first and then replaced by a Stock button as the Better Way(tm)
    -   Text Entry
    -   Functionality should cover basic event handling and application initiation:
        1.  User reads blurb
        2.  Enters text
        3.  Process text using a System.String method to introduce it
        4.  If acceptable, set text entry to non-editable, and display a success message
        5.  If not-acceptable, display a failure message.

2.  **First intermediate example, introducing the following:**
    -   Frames
        -   setting properties such as naming, etc.
    -   TextArea
    -   StringBuilder
    -   Dialog window Run and Dispose
    -   'using' keyword
    -   Glade\# design with Glade or Stetic in MonoDevelop
    -   Scrollbar container
    -   RegExpressions
    -   Functionality:
        1.  TextArea is not appended to directly, but with ToString() on a persistent StringBuilder object.
        2.  Enter and handle text entry.
        3.  RegExp words into other words.
        4.  Dialog reports how many replacements/finds in entered text.
        5.  Maintain TextEntry as a a rolling readout of responses.

3.  **Second intermediate example, introducing the following:**
    -   Tooltips
    -   Progress Bars
    -   Radio/Checkbuttons
    -   Adjustments and Range Widgets
    -   Colour adjustments to widgets
    -   Responsive interface
    -   Functionality:
        1.  Haven't a clue yet... possibly a function plotter.

4.  **Third intermediate example**
    -   Extend the previous example, using Menu Widgets, load and save, and XML...
    -   Sensible time to introduce NUnit testing? Or going even further, Test-Driven Development style of coding?



