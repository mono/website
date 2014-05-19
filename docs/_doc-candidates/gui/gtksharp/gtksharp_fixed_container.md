---
layout: obsolete
title: "GtkSharp: Fixed Container"
permalink: /old_site/GtkSharp:_Fixed_Container/
redirect_from:
  - /GtkSharp:_Fixed_Container/
---

GtkSharp: Fixed Container
=========================

The Fixed container allows you to place widgets at a fixed position within it's window, relative to it's upper left hand corner. The position of the widgets can be changed dynamically. There are only a few functions associated with the fixed widget:

    Fixed fixed1 = new Fixed();
    fixed1.Put(widget, x, y);
    fixed1.Move(widget, x, y);

Put() places a widget in the container fixed at the position specified by x and y. Move() allows the specified widget to be moved to a new position.

Normally, Fixed widgets don't have their own X window. Since this is different from the behaviour of Fixed widgets in earlier releases of GTK, the property HasWindow allows the creation of Fixed widgets with their own window. It has to be called before realizing the widget.

