---
title: GtkSharpNodeViewTutorialExamples
redirect_from:
  - /GtkSharpNodeViewTutorialExamples/
---

Example Programs from the Gtk# NodeView Tutorial
=================================================

This page contains the sample applications and compile instructions for the applications described in the tutorial.

Simple NodeView
---------------

The first example can be compiled with the command:

     mcs -pkg:gtk-sharp-2.0 filename.cs

The source for the program:

``` csharp
namespace NodeViewTutorial {
 
        [Gtk.TreeNode (ListOnly=true)]
        public class MyTreeNode : Gtk.TreeNode {
 
                string song_title;
 
                public MyTreeNode (string artist, string song_title)
                {
                        Artist = artist;
                        this.song_title = song_title;
                }
 
                [Gtk.TreeNodeValue (Column=0)]
                public string Artist;
 
                [Gtk.TreeNodeValue (Column=1)]
                public string SongTitle {get { return song_title; } }
        }
 
        public class NodeViewExample : Gtk.Window {
 
                public NodeViewExample () : base ("NodeView")
                {
                        SetSizeRequest (200,150);
 
                        // Create our TreeView and add it as our child widget
                        Gtk.NodeView view = new Gtk.NodeView (Store);
                        Add (view);
 
                        // Create a column with title Artist and bind its renderer to model column 0
                        view.AppendColumn ("Artist", new Gtk.CellRendererText (), "text", 0);
 
                        // Create a column with title 'Song Title' and bind its renderer to model column 1
                        view.AppendColumn ("Song Title", new Gtk.CellRendererText (), "text", 1);
                        view.ShowAll ();
                }
 
                protected override bool OnDeleteEvent (Gdk.Event ev)
                {
                        Gtk.Application.Quit ();
                        return true;
                }
 
                Gtk.NodeStore store;
                Gtk.NodeStore Store {
                        get {
                                if (store == null) {
                                        store = new Gtk.NodeStore (typeof (MyTreeNode));
                                        store.AddNode (new MyTreeNode ("The Beatles", "Yesterday"));
                                        store.AddNode (new MyTreeNode ("Peter Gabriel", "In Your Eyes"));
                                        store.AddNode (new MyTreeNode ("Rush", "Fly By Night"));
                                }
                                return store;
                        }
                }
 
                public static void Main ()
                {
                        Gtk.Application.Init ();
                        NodeViewExample win = new NodeViewExample ();
                        win.Show ();
                        Gtk.Application.Run ();
                }
 
        }
}
```

Interactive NodeView
--------------------

This example can be compiled with the command:

     mcs -pkg:gtk-sharp-2.0 filename.cs

The source for the program:

``` csharp
namespace NodeViewTutorial {
 
        [Gtk.TreeNode (ListOnly=true)]
        public class MyTreeNode : Gtk.TreeNode {
 
                string song_title;
 
                public MyTreeNode (string artist, string song_title)
                {
                        Artist = artist;
                        this.song_title = song_title;
                }
 
                [Gtk.TreeNodeValue (Column=0)]
                public string Artist;
 
                [Gtk.TreeNodeValue (Column=1)]
                public string SongTitle {get { return song_title; } }
        }
 
        public class NodeViewExample : Gtk.Window {
 
                Gtk.Label label;
 
                public NodeViewExample () : base ("NodeView")
                {
                        SetSizeRequest (300,225);
 
                        Gtk.Box box = new Gtk.VBox (false, 0);
                        Add (box);
 
                        label = new Gtk.Label ("Current Selection: ");
                        box.PackStart (label, false, false, 5);
 
                        Gtk.NodeView view = new Gtk.NodeView (Store);
                        box.PackStart (view, true, true, 5);
 
                        // Create a column with title Artist and bind its renderer to model column 0
                        view.AppendColumn ("Artist", new Gtk.CellRendererText (), "text", 0);
 
                        // Create a column with title 'Song Title' and bind its renderer to model column 1
                        view.AppendColumn ("Song Title", new Gtk.CellRendererText (), "text", 1);
                        view.NodeSelection.Changed += new System.EventHandler (OnSelectionChanged);
                        box.ShowAll ();
                }
                void OnSelectionChanged (object o, System.EventArgs args)
                {
                        Gtk.NodeSelection selection = (Gtk.NodeSelection) o;
                        MyTreeNode node = (MyTreeNode) selection.SelectedNode;
                        label.Text = "Current Selection: \"" + node.SongTitle + "\" by " + node.Artist;
                }
 
                protected override bool OnDeleteEvent (Gdk.Event ev)
                {
                        Gtk.Application.Quit ();
                        return true;
                }
 
                Gtk.NodeStore store;
                Gtk.NodeStore Store {
                        get {
                                if (store == null) {
                                        store = new Gtk.NodeStore (typeof (MyTreeNode));
                                        store.AddNode (new MyTreeNode ("The Beatles", "Yesterday"));
                                        store.AddNode (new MyTreeNode ("Peter Gabriel", "In Your Eyes"));
                                        store.AddNode (new MyTreeNode ("Rush", "Fly By Night"));
                                }
                                return store;
                        }
                }
 
                public static void Main ()
                {
                        Gtk.Application.Init ();
                        NodeViewExample win = new NodeViewExample ();
                        win.Show ();
                        Gtk.Application.Run ();
                }
 
        }
}
```

