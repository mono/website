---
title: "GConfTutorial"
lastmodified: '2005-10-19'
redirect_from:
  - /GConfTutorial/
---

GConfTutorial
=============

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#what-is-gconf">1 What is GConf?</a></li>
<li><a href="#what-is-it-not">2 What is it not?</a></li>
<li><a href="#some-theory">3 Some Theory</a>
<ul>
<li><a href="#theory">3.1 Theory</a></li>
<li><a href="#screenshots">3.2 Screenshots</a>
<ul>
<li><a href="#our-application">3.2.1 Our Application</a></li>
<li><a href="#gconf-editor">3.2.2 GConf-Editor</a></li>
</ul></li>
</ul></li>
<li><a href="#sample-code">4 Sample Code</a></li>
<li><a href="#references">5 References</a></li>
</ul></td>
</tr>
</tbody>
</table>

What is GConf?
==============

[GConf](http://www.gnome.org/projects/gconf/) is the system for storing application preferences in Gnome. It is intended for user preferences.

What makes GConf different than other configuration databases is that GConf is "live" and will notify interested parties of changes in the configuration values. This allows developers to build more modern applications: changes can always be applied immediately and the user will get a chance of preview the visual effects immediately.

What is it not?
===============

[GConf](http://www.gnome.org/projects/gconf/) is not a place to store configuration of something like [Apache](http://www.apache.org/), or arbitrary data storage.

Some Theory
===========

Theory
------

The root motivation for [GConf](http://www.gnome.org/projects/gconf/) is to make application preferences more manageable for system administrators.

Another important motivation for [GConf](http://www.gnome.org/projects/gconf/) is that it's "process transparent." This means that if I change a setting from one application, it instantly updates in all other applications that are interested in that setting. This technology is vital for the snazzy "instant apply" UI of [GNOME 2](http://www.gnome.org/), and vital for writing applications made up of multiple out-of-process components.

[GConf](http://www.gnome.org/projects/gconf/)attempts to leapfrog the registry concept. It's a library which provides a simple configuration data storage interface to applications, and also an architecture that tries to make things easy for system administrators.

Here are some of the features of [GConf](http://www.gnome.org/projects/gconf/):

-   Replaceable backend architecture. [GConf](http://www.gnome.org/projects/gconf/) currently has a single backend that stores configuration data in [XML-format](http://www.w3.org/XML/) text files; however, the architecture allows a Registry-like binary database backend, an [LDAP](http://www.openldap.org/) backend, or even a full-blown SQL database backend. The backend used is configurable by the system administrator. This is a valuable feature for IS deparatments managing large numbers of computers.
-   Configuration key documentation. Applications can install documentation along with their configuration data, explaining the possible settings and the effect of each configuration key. A regedit-style tool can display this documentation, making it much easier to customize applications without breaking them. The [GConf](http://www.gnome.org/projects/gconf/) database also stores useful meta-information such as the application that owns a key, when the key was last changed, etc.
-   Data change notification service. If configuration data is changed, all interested applications are notified. The notification service works across the network, affecting all login sessions for a single user.

This means that programs built from components (where each component may be in a separate process) are much easier to write, because if one component changes a setting the others can discover the change and update themselves. For example, [GNOME's](http://www.gnome.org/) [Nautilus](http://www.gnome.org/projects/nautilus/) file manager is actually a collection of applications, including an embedded web browser, and various navigation components. The components communicate via [CORBA](http://www.omg.org/). However, you want a single preferences dialog located in the top-level "shell" component. Without [GConf](http://www.gnome.org/projects/gconf/), a custom protocol would have to be invented for each preferences setting, to notify embedded components of changes to user preferences.

Notification is also useful if multiple application instances are running. [GNOME](http://www.gnome.org/) uses this feature to let user interface configuration take effect on-the-fly without restarting any applications; if you turn off toolbar icons, for example, toolbar icons will immediately disappear in all running apps.

-   The client API is very abstract, which allows us to change its implementation at a later time without a big headache. Because a good implementation is a complex problem, this is important. I also like to think the API is simple to use.
-   [GConf](http://www.gnome.org/projects/gconf/) does proper locking so that the configuration data doesn't get corrupted when multiple applications try to use it.

Most nontrivial applications will need to store user preferences. Traditionally, on most Unix-like systems user prefs have been stored in so called ["dot files"](http://www.comedia.com/hot/jargon-4.2.3/html/entry/dot-file.html) which don't provide a flexible and convenient way of dealing with settings. GConf tries to clear up the mess of "dot files". It provides a tree-structured repository of keys and corresponding values. Data types supported include integers, floats, strings, boolean values and lists composed of the previous ones. Applications can set and get values and also listen for changes. If some values change, your application will be notified accordingly.

What are we going to do in this tutorial?:

-   Create a [checkbox](http://www.go-mono.com/docs/monodoc.ashx?tlink=6@ecma%3a877%23CheckButton%2f) and an [editbox](http://www.go-mono.com/docs/monodoc.ashx?tlink=6@ecma%3a980%23Entry%2f)
-   Link them with [GConf](http://www.gnome.org/projects/gconf/)
-   Test live notification with [GConf-Editor](http://cvs.gnome.org/viewcvs/gconf-editor/)

Screenshots
-----------

### Our Application

[![Gconftutorial-app.png](/archived/images/a/a1/Gconftutorial-app.png)](/archived/images/a/a1/Gconftutorial-app.png)

### GConf-Editor

[![Gconftutorial-gconf-editor.png](/archived/images/7/7a/Gconftutorial-gconf-editor.png)](/archived/images/7/7a/Gconftutorial-gconf-editor.png)

Sample Code
===========

``` csharp
// GConf.cs
// GConf Tutorial
// mcs GConf.cs -out:GConf.exe -pkg:gtk-sharp -pkg:gconf-sharp
using System;
using Gtk;
using GConf;
 
class GConfTutorial {
    // defining global constants for later use in the program
    GConf.Client client; // gconf client
    // these strings represent our gconf paths
    static string GCONF_APP_PATH = "/apps/gconf-tutorial";
    static string NAME_KEY = GCONF_APP_PATH + "/name";
    static string EMAIL_KEY = GCONF_APP_PATH + "/email";
    static string SN_KEY = GCONF_APP_PATH + "/serialno";
    static string MARRIED_KEY = GCONF_APP_PATH + "/married";
 
    // defines our edit boxes and our checkbox
    Entry name;
    Entry email;
    Entry sn;
    CheckButton married;
 
    public static void Main(string[] args)
    {
        new GConfTutorial ();
    }
 
    public GConfTutorial()
    {
        Application.Init ();
 
        // creates new window with the given title
        Window w = new Window("GConf Tutorial");
        // creates all edit boxes
        name = new Entry();
        email = new Entry();
        sn = new Entry();
        // creates our checkbox
        married = new CheckButton("Married");
        // we create a big vertical box where we will place other widgets
        VBox globvbox = new VBox();
 
        // setting up the box so we look more HIGish
        globvbox.BorderWidth = 12;
        globvbox.Spacing = 6;
 
        // adding the vbox to our window
        w.Add(globvbox);
 
        // we set up our label
        Label info = new Label("<span weight=\"bold\" size=\"large\"> Your Information</span>");
        info.UseMarkup = true;
        // and add it to the vertical box
        globvbox.PackStart(info, false, false, 0);
 
        // creates a new horizontal box
        HBox horz = new HBox();
        horz.Spacing = 6;
 
        // adds the horizontal box the the global vertical
        globvbox.Add(horz);
 
        // creating another vbox which will hold our labels
        VBox lblcnt = new VBox();
        lblcnt.Spacing = 6;
        // adds the vbox to the horizontal one
        horz.PackStart(lblcnt, false, false, 0);
 
        // creates label
        Label lbl = new Label("Name:");
        lbl.Xalign = 0; // aligns it to the left
        lblcnt.PackStart(lbl, true, false, 0);
 
        // creates label
        lbl = new Label("Email:");
        lbl.Xalign = 0; // aligns it to the left
        lblcnt.PackStart(lbl, true, false, 0);
 
        // creates label
        lbl = new Label("Serial Number:");
        lbl.Xalign = 0; // aligns it to the left
        lblcnt.PackStart(lbl, true, false, 0);
 
        // another vbox to hold the edit boxes
        VBox ntrycnt = new VBox();
        ntrycnt.Spacing = 6; // HIGying
        // adds the vbox containing the edit boxes to the horizontal one
        horz.PackStart(ntrycnt, true, true, 0);
 
        // adding all the edit boxes
        ntrycnt.PackStart(name, true, true, 0);
        ntrycnt.PackStart(email, true, true, 0);
        ntrycnt.PackStart(sn, true, true, 0);
        // last, but not least - the check box
        globvbox.PackStart(married, false, false, 0);
 
        // creates our link to gconf
        client = new GConf.Client();
        // tries to grab values from gconf and update the GUI
        UpdateFromGConf();
        // sets the function to be called if some key changes
        client.AddNotify (GCONF_APP_PATH, new NotifyEventHandler (GConf_Changed));
 
        // hooks events
        w.DeleteEvent += on_close_app;
        married.Toggled += on_married_toggled;
        name.Changed += on_name_activate;
        email.Changed += on_email_activate;
        sn.Changed += on_sn_activate;
 
        // shows the window
        w.ShowAll();
 
        // runs the application
        Application.Run ();
    }
 
    // function to grab values from gconf and update the GUI
    void UpdateFromGConf ()
    {
        try {
            name.Text = (string) client.Get (NAME_KEY);
            email.Text = (string) client.Get (EMAIL_KEY);
            sn.Text = (string) client.Get (SN_KEY);
            married.Active = (bool) client.Get (MARRIED_KEY);
        } catch (GConf.NoSuchKeyException e) {
            Console.WriteLine("Error: A key with that name doesn't exist.");
            // add your exception handling here
        } catch (System.InvalidCastException e) {
            Console.WriteLine("Error: Cannot typecast.");
            // add your exception handling here
        }
    }
 
    public void on_married_toggled (object o, EventArgs args)
    {
        // sets the corresponding value in gconf
        client.Set (MARRIED_KEY, married.Active);
    }
 
    public void on_name_activate (object o, EventArgs args)
    {
        // sets the corresponding value in gconf
        client.Set (NAME_KEY, name.Text);
    }
 
    public void on_email_activate (object o, EventArgs args)
    {
        // sets the corresponding value in gconf
        client.Set (EMAIL_KEY, email.Text);
    }
 
    public void on_sn_activate (object o, EventArgs args)
    {
        // sets the corresponding value in gconf
        client.Set (SN_KEY, sn.Text);
    }
 
    public void GConf_Changed (object sender, NotifyEventArgs args)
    {
        // sets the corresponding value in gconf
        UpdateFromGConf();
    }
 
    public void on_close_app(object o, DeleteEventArgs args)
    {
        // quits the application
        Application.Quit();
    }
}
```

-   All the settings are set/retrieved in real-time so any change would affect your application immediatelly
-   Try running the application and GConf-Editor in parallel. Place them so they don't overlap and start typing your name or editing some other checkbox - you'll see that the values in [GConf](http://www.gnome.org/projects/gconf/) change immediatelly. Now try it the other way around - it will immediatelly change your values in your application.

References
==========

-   [GConf Web Site](http://www.gnome.org/projects/gconf/)
-   [GConf\# Documentation](http://www.go-mono.com/docs/index.aspx?link=N:GConf)
-   [GNOME HIG](http://developer.gnome.org/projects/gup/hig/)


