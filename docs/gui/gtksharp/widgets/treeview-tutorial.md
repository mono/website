---
layout: docpage
navgroup: docs
title: "GtkSharp TreeView Tutorial"
redirect_from:
  - /GtkSharp_TreeView_Tutorial/
---

Introduction
============

The GTK TreeView widget is used to display data in one of the most basic and intuitive ways possible: a list. Each row in the list can be separated into multiple columns, and rows in the list can contain child rows to create an expandable-list, or tree.

The TreeView can be extremely intimidating at first, but it is extremely powerful - especially when compared to the ListBox and ListView controls from the Windows Forms toolkit.

Model, View, Controller
=======================

The TreeView uses the Model-View-Controller (MVC) design pattern. Components of the TreeView are separated into these three categories: The Model, which stores data to be displayed, the View, which controls how to display the data, and the controller, which controls what data is displayed, how it is sorted, etc.

Model
-----

The TreeView has two basic models: ListStore, which stores a flat set of data, and TreeStore, which stores data that can contain sub-items (used for creating a Tree). All TreeView Models implement the Gtk.TreeModel interface.

View
----

The View is made up of three different parts as well - The column, the cell renderers, and the widget itself.

The TreeView widget is responsible for laying out the columns and rows of data, as well as providing all the basic user-interaction functionality such as selecting items, etc.

Each TreeViewColumn contains at least one CellRenderer. Cell renderers are what actually display the data - items in the model are mapped to cell renderers.

The following cell renderers are available:

-   **CellRendererText** - Used to display text
-   **CellRendererPixbuf** - Used to display images
-   **CellRendererProgress** - Used to display a progress bar
-   **CellRendererCombo** - Used to display a drop-down box
-   **CellRendererToggle** - Used to display a check box

CellRenderers are separate from TreeViewColumns for added flexibility, allowing you to have an extremely fine-tuned treeview tailored to your application. For example you can pack an image and text into the same column, which often makes much more sense than creating a separate column for each.

Controller
----------

Controllers modify how the data in the model is passed off to the View, and let you do things such as sorting and filtering the data.

Your first TreeView
===================

Setting it up
-------------

Here is a basic example of how to use the TreeView and all its related components. In our example, we will show a simple list of song titles and artist names:

``` csharp
#file: TreeViewExample.cs
//mcs -pkg:gtk-sharp TreeViewExample.cs
public class TreeViewExample
{
    public static void Main ()
    {
        Gtk.Application.Init ();
        new TreeViewExample ();
        Gtk.Application.Run ();
    }
 
    public TreeViewExample ()
    {
        // Create a Window
        Gtk.Window window = new Gtk.Window ("TreeView Example");
        window.SetSizeRequest (500,200);
 
        // Create our TreeView
        Gtk.TreeView tree = new Gtk.TreeView ();
 
        // Add our tree to the window
        window.Add (tree);
 
        // Create a column for the artist name
        Gtk.TreeViewColumn artistColumn = new Gtk.TreeViewColumn ();
        artistColumn.Title = "Artist";
 
        // Create a column for the song title
        Gtk.TreeViewColumn songColumn = new Gtk.TreeViewColumn ();
        songColumn.Title = "Song Title";
 
        // Add the columns to the TreeView
        tree.AppendColumn (artistColumn);
        tree.AppendColumn (songColumn);
 
        // Create a model that will hold two strings - Artist Name and Song Title
        Gtk.ListStore musicListStore = new Gtk.ListStore (typeof (string), typeof (string));
 
 
        // Assign the model to the TreeView
        tree.Model = musicListStore;
 
        // Show the window and everything on it
        window.ShowAll ();
    }
}
```

Compile and run the application, and you will end up with this:

[![GtkSharpTreeViewTutorial1.png]({{ site.github.url }}/archived/images/8/8a/GtkSharpTreeViewTutorial1.png)]({{ site.github.url }}/archived/images/8/8a/GtkSharpTreeViewTutorial1.png)

Cool! So we have our TreeView displaying our two desired columns, now lets add some data in there.

Adding some data
----------------

``` csharp
 // Add some data to the store
 musicListStore.AppendValues ("Garbage", "Dog New Tricks");
```

This inserts a new row into the Model. We specify the same number of arguments here as we defined when we constructed the Gtk.ListStore above.

As mentioned in the introduction, the TreeViewCells don't actually render any of your data themselves - they just contain the Cell Renderers that do, so we need to create two Cell Renderers, one for each column:

``` csharp
  // Create the text cell that will display the artist name
  Gtk.CellRendererText artistNameCell = new Gtk.CellRendererText ();
 
  // Add the cell to the column
  artistColumn.PackStart (artistNameCell, true);
 
  // Do the same for the song title column
  Gtk.CellRendererText songTitleCell = new Gtk.CellRendererText ();
  songColumn.PackStart (songTitleCell, true);
```

The TreeView doesn't automatically know which cells are supposed to display which items from the Model, so we need to link it up:

``` csharp
  // Tell the Cell Renderers which items in the model to display
  artistColumn.AddAttribute (artistNameCell, "text", 0);
  songColumn.AddAttribute (songTitleCell, "text", 1);
```

The first argument specifies which Cell Renderer we want to assign something to, the second specifies which of the cell renderer's properties (converted to lowercase) we want to assign something to (CellRendererText.Text in our case), and the third argument specifies the position in the Model that the value should be obtained from. Above when we added a row to the model, we specified the artist first, then the song title, so we use that here. Remember the order of items in the Model is not automatically linked to the order of your columns in the TreeView in any way, so while keeping everything in the same order makes things a lot easier to manage and understand, it is not required.

You are not limited to assigning one property to the store per CellRenderer, you can call AddAttribute for the same CellRenderer as many times as you would like, to control the different properties of the CellRenderer.

WOOHOO! We now have this:

[![GtkSharpTreeViewTutorial2.png]({{ site.github.url }}/archived/images/5/56/GtkSharpTreeViewTutorial2.png)]({{ site.github.url }}/archived/images/5/56/GtkSharpTreeViewTutorial2.png)

Here's the complete code:

``` csharp
public class TreeViewExample
{
    public static void Main ()
    {
        Gtk.Application.Init ();
        new TreeViewExample ();
        Gtk.Application.Run ();
    }
 
    public TreeViewExample ()
    {
        // Create a Window
        Gtk.Window window = new Gtk.Window ("TreeView Example");
        window.SetSizeRequest (500,200);
 
        // Create our TreeView
        Gtk.TreeView tree = new Gtk.TreeView ();
 
        // Add our tree to the window
        window.Add (tree);
 
        // Create a column for the artist name
        Gtk.TreeViewColumn artistColumn = new Gtk.TreeViewColumn ();
        artistColumn.Title = "Artist";
 
        // Create the text cell that will display the artist name
        Gtk.CellRendererText artistNameCell = new Gtk.CellRendererText ();
 
        // Add the cell to the column
        artistColumn.PackStart (artistNameCell, true);
 
        // Create a column for the song title
        Gtk.TreeViewColumn songColumn = new Gtk.TreeViewColumn ();
        songColumn.Title = "Song Title";
 
        // Do the same for the song title column
        Gtk.CellRendererText songTitleCell = new Gtk.CellRendererText ();
        songColumn.PackStart (songTitleCell, true);
 
        // Add the columns to the TreeView
        tree.AppendColumn (artistColumn);
        tree.AppendColumn (songColumn);
 
        // Tell the Cell Renderers which items in the model to display
        artistColumn.AddAttribute (artistNameCell, "text", 0);
        songColumn.AddAttribute (songTitleCell, "text", 1);
 
        // Create a model that will hold two strings - Artist Name and Song Title
        Gtk.ListStore musicListStore = new Gtk.ListStore (typeof (string), typeof (string));
 
        // Add some data to the store
        musicListStore.AppendValues ("Garbage", "Dog New Tricks");
 
        // Assign the model to the TreeView
        tree.Model = musicListStore;
 
        // Show the window and everything on it
        window.ShowAll ();
    }
}
```

Creating a Tree
===============

To create a tree instead of a flat list, we use a Gtk.TreeStore as our model.

``` csharp
Gtk.TreeStore musicListStore = new Gtk.TreeStore (typeof (string), typeof (string));
```

Then, when we add a value into the model we specify the parent iter as the first argument:

``` csharp
Gtk.TreeIter iter = musicListStore.AppendValues ("Dance");
musicListStore.AppendValues (iter, "Fannypack", "Nu Nu (Yeah Yeah) (double j and haze radio edit)");
 
iter = musicListStore.AppendValues ("Hip-hop");
musicListStore.AppendValues (iter, "Nelly", "Country Grammer");
```

And now we end up with this:

[![GtkSharpTreeViewTutorial-Tree1.png]({{ site.github.url }}/archived/images/9/92/GtkSharpTreeViewTutorial-Tree1.png)]({{ site.github.url }}/archived/images/9/92/GtkSharpTreeViewTutorial-Tree1.png)

Here's the complete example:

``` csharp
public class TreeViewExample
{
    public static void Main ()
    {
        Gtk.Application.Init ();
        new TreeViewExample ();
        Gtk.Application.Run ();
    }
 
    public TreeViewExample ()
    {
        Gtk.Window window = new Gtk.Window ("TreeView Example");
        window.SetSizeRequest (500,200);
 
        Gtk.TreeView tree = new Gtk.TreeView ();
        window.Add (tree);
 
        Gtk.TreeViewColumn artistColumn = new Gtk.TreeViewColumn ();
        artistColumn.Title = "Artist";
 
        Gtk.CellRendererText artistNameCell = new Gtk.CellRendererText ();
 
        artistColumn.PackStart (artistNameCell, true);
 
        Gtk.TreeViewColumn songColumn = new Gtk.TreeViewColumn ();
        songColumn.Title = "Song Title";
 
        Gtk.CellRendererText songTitleCell = new Gtk.CellRendererText ();
        songColumn.PackStart (songTitleCell, true);
 
        tree.AppendColumn (artistColumn);
        tree.AppendColumn (songColumn);
 
        artistColumn.AddAttribute (artistNameCell, "text", 0);
        songColumn.AddAttribute (songTitleCell, "text", 1);
 
        Gtk.TreeStore musicListStore = new Gtk.TreeStore (typeof (string), typeof (string));
 
        Gtk.TreeIter iter = musicListStore.AppendValues ("Dance");
        musicListStore.AppendValues (iter, "Fannypack", "Nu Nu (Yeah Yeah) (double j and haze radio edit)");
 
        iter = musicListStore.AppendValues ("Hip-hop");
        musicListStore.AppendValues (iter, "Nelly", "Country Grammer");
 
        tree.Model = musicListStore;
 
        window.ShowAll ();
    }
}
```

Filtering Data
==============

The TreeView makes it very easy to prevent certain rows from being displayed, without having to remove them from the model.

Lets say we are starting out with this set of data:

[![TreeViewExample6.png]({{ site.github.url }}/archived/images/b/b5/TreeViewExample6.png)]({{ site.github.url }}/archived/images/b/b5/TreeViewExample6.png)

We place a TreeModelFilter between the View (TreeView) and the model (ListStore) that filters what data is passed from the model to the view.

``` csharp
// Create the filter and tell it to use the musicListStore as it's base Model
filter = new Gtk.TreeModelFilter (musicListStore, null);
 
 
// Specify the function that determines which rows to filter out and which ones to display
filter.VisibleFunc = new Gtk.TreeModelFilterVisibleFunc (FilterTree);
 
// Assign the filter as our tree's model
tree.Model = filter;
```

We then create the FilterTree method, which determines which rows are visible and which are hidden:

``` csharp
private bool FilterTree (Gtk.TreeModel model, Gtk.TreeIter iter)
{
    string artistName = model.GetValue (iter, 0).ToString ();
    if (artistName == "BT")
        return true;
    else
        return false;
}
```

And now we end up with this:

[![TreeViewExample7.png]({{ site.github.url }}/archived/images/b/b3/TreeViewExample7.png)]({{ site.github.url }}/archived/images/b/b3/TreeViewExample7.png)

Here is a complete example demonstrating how you can use a text entry widget to control the filter.

``` csharp
public class TreeViewExample
{
    public static void Main ()
    {
        Gtk.Application.Init ();
        new TreeViewExample ();
        Gtk.Application.Run ();
    }
 
    Gtk.Entry filterEntry;
 
    Gtk.TreeModelFilter filter;
 
    public TreeViewExample ()
    {
        // Create a Window
        Gtk.Window window = new Gtk.Window ("TreeView Example");
        window.SetSizeRequest (500,200);
 
        // Create an Entry used to filter the tree
        filterEntry = new Gtk.Entry ();
 
        // Fire off an event when the text in the Entry changes
        filterEntry.Changed += OnFilterEntryTextChanged;
 
        // Create a nice label describing the Entry
        Gtk.Label filterLabel = new Gtk.Label ("Artist Search:");
 
        // Put them both into a little box so they show up side by side
        Gtk.HBox filterBox = new Gtk.HBox ();
        filterBox.PackStart (filterLabel, false, false, 5);
        filterBox.PackStart (filterEntry, true, true, 5);
 
        // Create our TreeView
        Gtk.TreeView tree = new Gtk.TreeView ();
 
        // Create a box to hold the Entry and Tree
        Gtk.VBox box = new Gtk.VBox ();
 
        // Add the widgets to the box
        box.PackStart (filterBox, false, false, 5);
        box.PackStart (tree, true, true, 5);
 
        window.Add (box);
 
        // Create a column for the artist name
        Gtk.TreeViewColumn artistColumn = new Gtk.TreeViewColumn ();
        artistColumn.Title = "Artist";
 
        // Create the text cell that will display the artist name
        Gtk.CellRendererText artistNameCell = new Gtk.CellRendererText ();
 
        // Add the cell to the column
        artistColumn.PackStart (artistNameCell, true);
 
        // Create a column for the song title
        Gtk.TreeViewColumn songColumn = new Gtk.TreeViewColumn ();
        songColumn.Title = "Song Title";
 
        // Do the same for the song title column
        Gtk.CellRendererText songTitleCell = new Gtk.CellRendererText ();
        songColumn.PackStart (songTitleCell, true);
 
        // Add the columns to the TreeView
        tree.AppendColumn (artistColumn);
        tree.AppendColumn (songColumn);
 
        // Tell the Cell Renderers which items in the model to display
        artistColumn.AddAttribute (artistNameCell, "text", 0);
        songColumn.AddAttribute (songTitleCell, "text", 1);
 
        // Create a model that will hold two strings - Artist Name and Song Title
        Gtk.ListStore musicListStore = new Gtk.ListStore (typeof (string), typeof (string));
 
        // Add some data to the store
        musicListStore.AppendValues ("BT", "Circles");
        musicListStore.AppendValues ("Daft Punk", "Technologic");
        musicListStore.AppendValues ("Daft Punk", "Digital Love");
        musicListStore.AppendValues ("The Crystal Method", "PHD");
        musicListStore.AppendValues ("The Crystal Method", "Name of the game");
        musicListStore.AppendValues ("The Chemical Brothers", "Galvanize");
 
        // Instead of assigning the ListStore model directly to the TreeStore, we create a TreeModelFilter
        // which sits between the Model (the ListStore) and the View (the TreeView) filtering what the model sees.
        // Some may say that this is a "Controller", even though the name and usage suggests that it is still part of
        // the Model.
        filter = new Gtk.TreeModelFilter (musicListStore, null);
 
        // Specify the function that determines which rows to filter out and which ones to display
        filter.VisibleFunc = new Gtk.TreeModelFilterVisibleFunc (FilterTree);
 
        // Assign the filter as our tree's model
        tree.Model = filter;
 
        // Show the window and everything on it
        window.ShowAll ();
    }
 
    private void OnFilterEntryTextChanged (object o, System.EventArgs args)
    {
        // Since the filter text changed, tell the filter to re-determine which rows to display
        filter.Refilter ();
    }
 
    private bool FilterTree (Gtk.TreeModel model, Gtk.TreeIter iter)
    {
        string artistName = model.GetValue (iter, 0).ToString ();
 
        if (filterEntry.Text == "")
            return true;
 
        if (artistName.IndexOf (filterEntry.Text) > -1)
            return true;
        else
            return false;
    }
}
```

[![GtkSharpTreeViewTutorial8.png]({{ site.github.url }}/archived/images/8/87/GtkSharpTreeViewTutorial8.png)]({{ site.github.url }}/archived/images/8/87/GtkSharpTreeViewTutorial8.png)

Controlling how the model is used
=================================

The TreeView allows you write methods that extract specific data from your Model, and link your CellRenderers to them, rather than directly to the model.

This is one of the extremely useful features of TreeModel because it means you can store a reference any .NET object in the model that contains all the data you want your TreeView to display, instead of storing each piece of data individually as a string, so you don't have to maintain it in two places.

In the preveous examples we inserted both the song and artist into each row of the ListStore. If the TreeView is displaying a large amount of data this can use a lot of memory, and if the backend data changes (song title changes, etc.) the TreeModel doesnt know about it and you have to keep it in-sync manually.

Lets take the following example, and say we want to create a TreeView to display the data:

``` csharp
using System.Collections;
 
public class Song
{
    public Song (string artist, string title)
    {
        this.Artist = artist;
        this.Title = title;
    }
 
    public string Artist;
    public string Title;
}
 
public class TreeViewExample
{
    public static void Main ()
    {
        Gtk.Application.Init ();
        new TreeViewExample ();
        Gtk.Application.Run ();
    }
 
    ArrayList songs;
 
    public TreeViewExample ()
    {
        songs = new ArrayList ();
 
        songs.Add (new Song ("Dancing DJs vs. Roxette", "Fading Like a Flower"));
        songs.Add (new Song ("Xaiver", "Give me the night"));
        songs.Add (new Song ("Daft Punk", "Technologic"));
 
        Gtk.Window window = new Gtk.Window ("TreeView Example");
        window.SetSizeRequest (500,200);
 
        Gtk.TreeView tree = new Gtk.TreeView ();
        window.Add (tree);
 
        Gtk.TreeViewColumn artistColumn = new Gtk.TreeViewColumn ();
        artistColumn.Title = "Artist";
        Gtk.CellRendererText artistNameCell = new Gtk.CellRendererText ();
        artistColumn.PackStart (artistNameCell, true);
 
        Gtk.TreeViewColumn songColumn = new Gtk.TreeViewColumn ();
        songColumn.Title = "Song Title";
        Gtk.CellRendererText songTitleCell = new Gtk.CellRendererText ();
        songColumn.PackStart (songTitleCell, true);
 
        Gtk.ListStore musicListStore = new Gtk.ListStore (typeof (Song));
        foreach (Song song in songs) {
            musicListStore.AppendValues (song);
        }
 
        tree.Model = musicListStore;
 
        tree.AppendColumn (artistColumn);
        tree.AppendColumn (songColumn);
 
        window.ShowAll ();
 
    }
}
```

The TreeView doesnt automatically know how to link up the fields in the Song class to the different CellRenderers, so instead of using AddAttribute as we did in our first example, we use **SetCellDataFunc**:

``` csharp
artistColumn.SetCellDataFunc (artistNameCell, new Gtk.TreeCellDataFunc (RenderArtistName));
songColumn.SetCellDataFunc (songTitleCell, new Gtk.TreeCellDataFunc (RenderSongTitle));
```

We then create two methods, which extract the information that we want from the Song object and set the appropriate property of the CellRenderer, "Text" in our case:

``` csharp
private void RenderArtistName (Gtk.TreeViewColumn column, Gtk.CellRenderer cell, Gtk.TreeModel model, Gtk.TreeIter iter)
{
    Song song = (Song) model.GetValue (iter, 0);
    (cell as Gtk.CellRendererText).Text = song.Artist;
}
 
private void RenderSongTitle (Gtk.TreeViewColumn column, Gtk.CellRenderer cell, Gtk.TreeModel model, Gtk.TreeIter iter)
{
    Song song = (Song) model.GetValue (iter, 0);
    (cell as Gtk.CellRendererText).Text = song.Title;
}
```

We now have only one item per row in the store, but we display two columns in the tree!

[![GtkSharpTreeViewTutorial3.png]({{ site.github.url }}/archived/images/7/72/GtkSharpTreeViewTutorial3.png)]({{ site.github.url }}/archived/images/7/72/GtkSharpTreeViewTutorial3.png)

Both of the example methods above demonstrate how to modify one property of the CellRenderer, but you are certainly not limited to only modifing one.

This example is fairly pointless, but it demonstrates how to modify multiple properties. A more practical use for this would be to change the color based on the state of an object:

``` csharp
private void RenderArtistName (Gtk.TreeViewColumn column, Gtk.CellRenderer cell, Gtk.TreeModel model, Gtk.TreeIter iter)
{
    Song song = (Song) model.GetValue (iter, 0);
    if (song.Artist.StartsWith ("X") == true) {
        (cell as Gtk.CellRendererText).Foreground = "red";
    } else {
        (cell as Gtk.CellRendererText).Foreground = "darkgreen";
    }
    (cell as Gtk.CellRendererText).Text = song.Artist;
}
```

 [![GtkSharpTreeViewTutorial4.png]({{ site.github.url }}/archived/images/0/07/GtkSharpTreeViewTutorial4.png)]({{ site.github.url }}/archived/images/0/07/GtkSharpTreeViewTutorial4.png)

Here is the complete example:

``` csharp
using System.Collections;
 
public class Song
{
    public Song (string artist, string title)
    {
        this.Artist = artist;
        this.Title = title;
    }
 
    public string Artist;
    public string Title;
}
 
public class TreeViewExample
{
    public static void Main ()
    {
        Gtk.Application.Init ();
        new TreeViewExample ();
        Gtk.Application.Run ();
    }
 
    ArrayList songs;
 
    public TreeViewExample ()
    {
        songs = new ArrayList ();
 
        songs.Add (new Song ("Dancing DJs vs. Roxette", "Fading Like a Flower"));
        songs.Add (new Song ("Xaiver", "Give me the night"));
        songs.Add (new Song ("Daft Punk", "Technologic"));
 
        Gtk.Window window = new Gtk.Window ("TreeView Example");
        window.SetSizeRequest (500,200);
 
        Gtk.TreeView tree = new Gtk.TreeView ();
        window.Add (tree);
 
        Gtk.TreeViewColumn artistColumn = new Gtk.TreeViewColumn ();
        artistColumn.Title = "Artist";
        Gtk.CellRendererText artistNameCell = new Gtk.CellRendererText ();
        artistColumn.PackStart (artistNameCell, true);
 
        Gtk.TreeViewColumn songColumn = new Gtk.TreeViewColumn ();
        songColumn.Title = "Song Title";
        Gtk.CellRendererText songTitleCell = new Gtk.CellRendererText ();
        songColumn.PackStart (songTitleCell, true);
 
        Gtk.ListStore musicListStore = new Gtk.ListStore (typeof (Song));
        foreach (Song song in songs) {
            musicListStore.AppendValues (song);
        }
 
        artistColumn.SetCellDataFunc (artistNameCell, new Gtk.TreeCellDataFunc (RenderArtistName));
        songColumn.SetCellDataFunc (songTitleCell, new Gtk.TreeCellDataFunc (RenderSongTitle));
 
        tree.Model = musicListStore;
 
        tree.AppendColumn (artistColumn);
        tree.AppendColumn (songColumn);
 
        window.ShowAll ();
 
    }
 
    private void RenderArtistName (Gtk.TreeViewColumn column, Gtk.CellRenderer cell, Gtk.TreeModel model, Gtk.TreeIter iter)
    {
        Song song = (Song) model.GetValue (iter, 0);
 
        if (song.Artist.StartsWith ("X") == true) {
            (cell as Gtk.CellRendererText).Foreground = "red";
        } else {
            (cell as Gtk.CellRendererText).Foreground = "darkgreen";
        }
 
        (cell as Gtk.CellRendererText).Text = song.Artist;
    }
 
    private void RenderSongTitle (Gtk.TreeViewColumn column, Gtk.CellRenderer cell, Gtk.TreeModel model, Gtk.TreeIter iter)
    {
        Song song = (Song) model.GetValue (iter, 0);
        (cell as Gtk.CellRendererText).Text = song.Title;
    }
 
}
```

Shortcuts - Writing Less Code
=============================

The Gtk TreeView API provides several convinence methods that makes it possible to create a basic tree using much less code than we used above.

Here is the same demo as first example on this page, using these methods, note that it is *significantly* less code:

``` csharp
public class TreeViewExample
{
    public static void Main ()
    {
        Gtk.Application.Init ();
        new TreeViewExample ();
        Gtk.Application.Run ();
    }
 
    public TreeViewExample ()
    {
        Gtk.Window window = new Gtk.Window ("TreeView Example");
        window.SetSizeRequest (500,200);
 
        Gtk.TreeView tree = new Gtk.TreeView ();
        Gtk.ListStore musicListStore = new Gtk.ListStore (typeof (string), typeof (string));
 
        tree.AppendColumn ("Artist", new Gtk.CellRendererText (), "text", 0);
        tree.AppendColumn ("Title", new Gtk.CellRendererText (), "text", 1);
 
        musicListStore.AppendValues ("Garbage", "Dog New Tricks");
 
        tree.Model = musicListStore;
 
        window.Add (tree);
        window.ShowAll ();
    }
}
```

Editable Text Cells
===================

Making an editable text cell (so the user can click on the cell and modify the value) is extremely easy.

First we must mark the cell as editable, and assign a method to handle the Edited event, which fires when the user is done editing:

``` csharp
artistNameCell.Editable = true;
artistNameCell.Edited += artistNameCell_Edited;
```

Our event handler method needs to update the model with the new value that the user entered:

``` csharp
private void artistNameCell_Edited (object o, Gtk.EditedArgs args)
{
    Gtk.TreeIter iter;
    musicListStore.GetIter (out iter, new Gtk.TreePath (args.Path));
 
    Song song = (Song) musicListStore.GetValue (iter, 0);
    song.Artist = args.NewText;
}
```

And that's all there is to it!

[![TreeViewTutorial-Editing1.png]({{ site.github.url }}/archived/images/d/d8/TreeViewTutorial-Editing1.png)]({{ site.github.url }}/archived/images/d/d8/TreeViewTutorial-Editing1.png)

Drawing icons in rows
=====================

For using Pixbuf you need, first to change the ListStore constructor, (notice the Gdk.Pixbuf parameter)

``` csharp
Gtk.ListStore musicListStore = new Gtk.ListStore (typeof (Gdk.Pixbuf), typeof (string),  typeof (string));
```

add the column that will render the pixbuf

``` csharp
tree.AppendColumn ("Icon", new Gtk.CellRendererPixbuf (), "pixbuf", 0);
```

the image to add

[![TreeViewRupertIcon.png]({{ site.github.url }}/archived/images/e/e5/TreeViewRupertIcon.png)]({{ site.github.url }}/archived/images/e/e5/TreeViewRupertIcon.png)

and the AppendValues method with the correct parameters

``` csharp
musicListStore.AppendValues (new Gdk.Pixbuf ("TreeViewRupertIcon.png"), "Rupert", "Yellow bananas");
```

And then

[![TreeViewTutorial-Pixbuf.png]({{ site.github.url }}/archived/images/9/98/TreeViewTutorial-Pixbuf.png)]({{ site.github.url }}/archived/images/9/98/TreeViewTutorial-Pixbuf.png)

Complete sample

``` csharp
public class TreeViewExample
{
    public static void Main ()
    {
        Gtk.Application.Init ();
        new TreeViewExample ();
        Gtk.Application.Run ();
    }
 
    public TreeViewExample ()
    {
        Gtk.Window window = new Gtk.Window ("TreeView Example");
        window.SetSizeRequest (500,200);
 
        Gtk.TreeView tree = new Gtk.TreeView ();
        Gtk.ListStore musicListStore = new Gtk.ListStore (typeof (Gdk.Pixbuf), 
            typeof (string),  typeof (string));
 
        tree.AppendColumn ("Icon", new Gtk.CellRendererPixbuf (), "pixbuf", 0);  
        tree.AppendColumn ("Artist", new Gtk.CellRendererText (), "text", 1);
        tree.AppendColumn ("Title", new Gtk.CellRendererText (), "text", 2);
 
        musicListStore.AppendValues (new Gdk.Pixbuf ("TreeViewRupertIcon.png"),
            "Rupert", "Yellow bananas");
 
        tree.Model = musicListStore;
 
        window.Add (tree);
        window.ShowAll ();
    }
}
```

