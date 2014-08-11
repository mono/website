---
title: GtkSharpNotificationIcon
redirect_from:
  - /GtkSharpNotificationIcon/
---

What is the Status Notification Area?
=====================================

[![TrayIcon.png](/archived/images/8/8c/TrayIcon.png)](/archived/images/8/8c/TrayIcon.png) [![TrayIconPopMenu.png](/archived/images/3/33/TrayIconPopMenu.png)](/archived/images/3/33/TrayIconPopMenu.png) Using the status notification area applications can notify the user of non-critical events (for example, arrival of new email, or a chat 'buddy' having logged on), and expose the status of active system processes (for example, a printing document, or a laptop's battery charging). Keep in mind that the utility of the notification area decreases rapidly when more than about four icons are always present. For this reason, icons that appear only temporarily in response to events are preferable.

Let's write some code!
======================

The Sample here creates an empty GTK-Window with an tray icon. The Application can be hidden, displayed and closed with the help of the tray icon.

``` csharp
using Gtk;
using Gdk;
using System;
 
class Hello {
    // The tray Icon
    private static StatusIcon trayIcon;
    // The Window
    private static Gtk.Window window;
 
    static void Main() {
        // Initialize GTK#
        Application.Init ();
 
        // Create a Window with title
        window = new Gtk.Window ("Hello World");
 
        // Attach to the Delete Event when the window has been closed.
        window.DeleteEvent += delegate { Application.Quit (); };
 
        // Creation of the Icon
        trayIcon = new StatusIcon(new Pixbuf ("theIcon.png"));
        trayIcon.Visible = true;
 
        // Show/Hide the window (even from the Panel/Taskbar) when the TrayIcon has been clicked.
        trayIcon.Activate += delegate { window.Visible = !window.Visible; };
        // Show a pop up menu when the icon has been right clicked.
        trayIcon.PopupMenu += OnTrayIconPopup;
 
        // A Tooltip for the Icon
        trayIcon.Tooltip = "Hello World Icon";
 
        // Show the main window and start the application.
        window.ShowAll ();
        Application.Run ();
    }
 
    // Create the popup menu, on right click.
    static void OnTrayIconPopup (object o, EventArgs args) {
        Menu popupMenu = new Menu();
        ImageMenuItem menuItemQuit = new ImageMenuItem ("Quit");
        Gtk.Image appimg = new Gtk.Image(Stock.Quit, IconSize.Menu);
        menuItemQuit.Image = appimg;
        popupMenu.Add(menuItemQuit);
        // Quit the application when quit has been clicked.
        menuItemQuit.Activated += delegate { Application.Quit(); };
        popupMenu.ShowAll();
        popupMenu.Popup();
    }
}
```

You can compile them with this line:

``` bash
gmcs TrayIcon.cs -pkg:gtk-sharp-2.0
```

And then run it with:

``` bash
mono TrayIcon.exe
```

but please note that there must be an file named "theIcon.png" present in the folder of the application.

References
==========

-   [Todd Berman's Homepage](http://off.net/~tberman/diary/)
-   [System Tray Protocol](http://www.freedesktop.org/wiki/Standards_2fsystemtray_2dspec)
-   [GNOME HIG v2.0](http://developer.gnome.org/projects/gup/hig/)
-   [Use of Notification Area in GNOME](http://developer.gnome.org/projects/gup/hig/2.0/desktop-notification-area.html)

And special thanks to Suco for [the original code sample](http://blog.wikifotos.org/2008/02/14/mono-c-y-los-iconos-en-la-bandeja-del-sistema/).

