---
title: "GtkSharp: Widget Layout and Packing"
redirect_from:
  - /GtkSharp%3A_Widget_Layout_and_Packing/
---

### Multiple widgets in a single window

It would be awkward to design any graphical interface to an application which only used a single widget in a single window. In fact, the benefit of having a graphical interface to your application is to present multiple functionality or views to the user in a single window.

Practically, this means that if you are designing an application that uses a graphical toolkit, you are going to have to consider how multiple widgets are to be laid out in use.

[GTK#](/docs/gui/gtksharp/) has a number of devices to help control the placement of two or more widgets within a window. These are called **container** objects and serve to guide layout and placement within a window or another container.

This technique is different from the common method of positioning items using the System.Windows.Forms toolkit. One major difference between [GTK#](/docs/gui/gtksharp/) and System.Windows.Forms is that applications using [GTK#](/docs/gui/gtksharp/) do not use absolute or fixed coordinates for positioning widgets anywhere as near as much as applications using Windows.Forms. Applications using the GTK toolkit create the right layout for their interface through layout and packing container objects.

### Widget Containers

By far the most common packing widgets are the horizontal and vertical boxes, but you will find on occasion other containers being used, such as the table widget:

-   [Packing with Boxes](/docs/gui/gtksharp/widgets/packing-with-boxes/)
-   [Packing with Tables](/docs/gui/gtksharp/widgets/packing-with-tables/)
-   [Fixed Container](/docs/gui/gtksharp/widgets/fixed-container/)
-   [Layout Container](/docs/gui/gtksharp/widgets/layout-container/)
-   [Frames](/docs/gui/gtksharp/widgets/frames/)
