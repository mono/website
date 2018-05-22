---
title: Gtk# 3.0 Porting Guide
redirect_from:
  - /GtkSharp3PortingGuide/
---

There were extensive API removals and changes in Gtk3 which required breaks in the Gtk# API as well. This guide is intended to assist users with transitioning their codebases to the new API. Users are encouraged to contribute their own experiences and we'll try to incorporate them for other's benefit.

### Size Negotiation

The Gtk2 mechanism for size negotiation was the OnSizeRequested virtual method and associated event. In 3.0, size negotiation got more complicated to support Height for Width layout. One easy transformation to get code compiling is to take your existing OnSizeRequested implementation and delegate to it from new overloads of:

      protected virtual void OnGetPreferredHeight (out int min_height, out int natural_height)
      protected virtual void OnGetPreferredWidth (out int min_width, out int natural_width)

### Drawing

The ExposeEvent has been replaced with a Drawn event. If you were overriding OnExposeEvent previously, you will need to override OnDrawn now, which entails a switch to cairo-based drawing, since the sole parameter to OnDrawn is a Cairo.Context. Rewriting Gdk drawing code with Cairo is probably beyond the scope of a document like this. Hopefully we can link to some good tutorials, but in the meantime you can get the gist of the API by taking a look at the CairoSample in the gtk-sharp samples.

