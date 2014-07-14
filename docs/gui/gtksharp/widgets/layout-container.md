---
layout: docpage
navgroup: docs
title: "GtkSharp: Layout Container"
---

The Layout container is similar to the Fixed container except that it implements an infinite (where infinity is less than 2\^32) scrolling area. The X window system has a limitation where windows can be at most 32767 pixels wide or tall. The Layout container gets around this limitation by doing some exotic stuff using window and bit gravities, so that you can have smooth scrolling even when you have many child widgets in your scrolling area.

A Layout container is created using:

    Layout layout1 = new Layout(hadjustment, vadjustment);

As you can see, you can optionally specify the Adjustment objects that the Layout widget will use for its scrolling.

You can add and move widgets in the Layout container using the following two functions:

    layout1.Put(widget, x, y);
    layout1.Move(widget, x, y);

The size of the Layout container can be set using the next function:

    layout1.Size = new Size(width, height );

