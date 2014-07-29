---
layout: obsolete
title: "Talk:Accessibility: Bridge Functional Specification"
lastmodified: '2008-09-09'
permalink: /archived/Talk:Accessibility:_Bridge_Functional_Specification/
redirect_from:
  - /Talk:Accessibility:_Bridge_Functional_Specification/
  - /Talk:Accessibility:_Functional_Specification/
---

Talk:Accessibility: Bridge Functional Specification
===================================================

¿Difference between **dialog** and **window** role? FileChooser is a dialog, so I've put OpenFileDialog to be a dialog as well. But: in MWF this distinction seems to the fact of being a modal, or else that the dialog is an special window whose contents are determined by some custom settings when called, and which cannot be modified at runtime, an example of this is when you use MWF.Form.Show and MWF.Form.ShowDialog, when using Show the Form is independent of the called form, but when you are using the ShowDialog the Form is nested in the called form.

Note as well that it seems there are even specific roles for each dialog, take this code snippet from [gail\_window.c](http://svn.gnome.org/viewvc/gtk%2B/trunk/modules/other/gail/gailwindow.c?view=markup):

     if (GTK_IS_FILE_SELECTION (widget))
       obj->role = ATK_ROLE_FILE_CHOOSER;
     else if (GTK_IS_COLOR_SELECTION_DIALOG (widget))
       obj->role = ATK_ROLE_COLOR_CHOOSER;
     else if (GTK_IS_FONT_SELECTION_DIALOG (widget))
       obj->role = ATK_ROLE_FONT_CHOOSER;
     else if (GTK_IS_MESSAGE_DIALOG (widget))
       obj->role = ATK_ROLE_ALERT;
     else if (GTK_IS_DIALOG (widget))
       obj->role = ATK_ROLE_DIALOG;
     else
       {
         const gchar *name;
         name = gtk_widget_get_name (widget);
         if (name && (!strcmp (name, "gtk-tooltip") ||
                      !strcmp (name, "gtk-tooltips")))
           obj->role = ATK_ROLE_TOOL_TIP;
         else if (GTK_IS_PLUG (widget))
           obj->role = ATK_ROLE_PANEL;
         else if (GTK_WINDOW (widget)->type == GTK_WINDOW_POPUP)
           obj->role = ATK_ROLE_WINDOW;
         else
           obj->role = ATK_ROLE_FRAME;
       }

 Context menus: we need unit tests to know exactly what is happenning with them because the only thing you can notice in accerciser is that a new toplevel item in the app appears as "window", if you try to open it to see it expanded, the menu is not shown anymore and disappears, so you can't.

ContextMenuStrip has ToolStripMenuItems as children. How should we indicate the children-parent hierarchy in this doc?

For a research on Mono.WebBrowser, I've investigated monodoc in accerciser. For the web widget, it has a strange hierarchy layout like this (number of children in parenthesis): Page tab list (1) -\> page tab (1) -\> page tab list (2) -\> [1st child:] page tab (1) -\> scroll pane (1) -\> viewport (1) -\> frame (17). The rest of elements below frame are actually the real contents of the web page (a text role element, some list items, etc.). How should we mimic this? It seems that focusing on a viewport or frame widget is the way to go. Please give feedback.

It looks like we can get the AtkAccessible object directly from Mozilla (if that WebBrowser backend is enabled) with [GetAtkObjectForCurrentDocument](http://mxr.mozilla.org/seamonkey/source/embedding/browser/gtk/src/EmbedPrivate.cpp#936) --[BradTaylor](/index.php?title=User:BradTaylor&action=edit&redlink=1 "User:BradTaylor (page does not exist)") 15:06, 9 Sep 2008 (EDT)

