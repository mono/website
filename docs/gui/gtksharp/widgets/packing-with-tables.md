---
title: "GtkSharp: Packing with Tables"
redirect_from:
  - /GtkSharp%3A_Packing_with_Tables/
---

## Using Tables

In addition to packing using HBox and VBox, you can pack using the [Table](http://docs.go-mono.com/index.aspx?link=T:Gtk.Table) object; this lets you create a grid for placing widgets. The first thing to look at is the Table constructor:

``` csharp
Table table1 = new Table(int rows, int columns, bool homogeneous);
```

The first argument is the number of rows to make in the table, while the second, obviously, is the number of columns. The homogeneous argument has to do with how the table's boxes are sized. If homogeneous is true, the table boxes are resized to the size of the largest widget in the table. If homogeneous is false, the size of a table boxes is dictated by the tallest widget in its same row, and the widest widget in its column. The rows and columns are laid out from 0 to n, where n was the number specified in the call to Table(). So, if you specify rows = 2 and columns = 2, the layout would look something like this:

     0          1          2
    0+----------+----------+
     |          |          |
    1+----------+----------+
     |          |          |
    2+----------+----------+

Note that the coordinate system starts in the upper left hand corner. To place a widget into a box, use the following function:

``` csharp
table1.Attach (        Widget            child,
                       int               leftAttach,
                       int               rightAttach,
                       int               topAttach,
                       int               bottomAttach,
                       Gtk.AttachOptions xOptions,
                       Gtk.AttachOptions yOptions,
                       int               xPadding,
                       int               yPadding );
```

The first argument (child) is the widget you wish to place in the table. The left and right attach arguments specify where to place the widget, and how many boxes to use. If you want a button in the lower right table entry of our 2x2 table, and want it to fill that entry only, leftAttach would be = 1, rightAttach = 2, topAttach = 1, bottomAttach = 2. Now, if you wanted a widget to take up the whole top row of our 2x2 table, you'd use leftAttach = 0, rightAttach = 2, topAttach = 0, bottomAttach = 1.

The xOptions and yOptions parameters are used to specify packing options and may be bitwise OR'ed together to allow multiple options. These options are:

`Gtk.AttachOptions.Fill`

If the table box is larger than the widget, and Fill is specified, the widget will expand to use all the room available.

`Gtk.AttachOptions.Shrink`

If the table widget was allocated less space then was requested (usually by the user resizing the window), then the widgets would normally just be pushed off the bottom of the window and disappear. If Shrink is specified, the widgets will shrink with the table.

`Gtk.AttachOptions.Expand`

This will cause the table to expand to use up any remaining space in the window.

Padding is just like in boxes, creating a clear area around the widget specified in pixels. Gtk.Table.Attach() has a lot of options. So, there's a shortcut:

``` csharp
table1.AttachDefaults(          Widget widget,
                                int       leftAttach,
                                int       rightAttach,
                                int       topAttach,
                                int       bottomAttach );
```

The X and Y options default to Gtk.AttachOptions.Fill \| Gtk.AttachOptions.Expand, and X and Y padding are set to 0. The rest of the arguments are identical to the previous function.

We also have SetRowSpacing() and SetColSpacing(). These places spacing between the rows at the specified row or column.

``` csharp
table1.SetRowSpacing(int row, int spacing);
table1.SetColSpacing(int column, int spacing);
```

Note that for columns, the space goes to the right of the column, and for rows, the space goes below the row. You can also set a consistent spacing of all rows and/or columns with:

``` csharp
table1.SetRowSpacing(int spacing);
table1.SetColSpacings(int spacing);
```

Note that with these calls, the last row and last column do not get any spacing.

## Example

Here we make a window with three buttons in a 2x2 table. The first two buttons will be placed in the upper row. A third, the quit button, is placed in the lower row, spanning both columns. It should look something like this:

\[Image:tables.png\]

``` csharp
// /samples/tutorial/table/table.cs - Gtk# Tutorial example
//
// Author: Johannes Roith <johannes@jroith.de>
//
// (c) 2002 Johannes Roith
 
namespace GtkSharpTutorial {
 
 
        using Gtk;
        using System;
        using System.Drawing;
 
 
        public class table
        {
 
                /* Our new improved callback.  The data passed to this function
                 * is printed to stdout. */
 
                static void callback( object obj, EventArgs args)
                {
                        Button mybutton = (Button) obj;
                        Console.WriteLine("Hello again - {0} was pressed", (string) mybutton.Label);
                        // Have to figure out, how to recieve button name
                }
 
                /* another event */
                static void delete_event (object obj, DeleteEventArgs args)
                {
                Application.Quit();
                }
 
                static void exit_event (object obj, EventArgs args)
                {
                        Application.Quit();
                }
 
                public static void Main(string[] args)
                {
 
 
 
                        Application.Init ();
 
 
                        /* Create a new window */
                        Window window = new Window ("Table");
 
 
                        /* Set a handler for delete_event that immediately
                         * exits GTK. */
                        window.DeleteEvent += delete_event;
 
                        /* Sets the border width of the window. */
                        window.BorderWidth= 20;
 
                        /* Create a 2x2 table */
                        Table table = new Table (2, 2, true);
 
                        /* Put the table in the main window */
                        window.Add(table);
 
                        /* Create first button */
                        Button button = new Button("button 1");
 
                        /* When the button is clicked, we call the "callback" function
                         * with a pointer to "button 1" as its argument */
                        button.Clicked += callback;
 
 
                        /* Insert button 1 into the upper left quadrant of the table */
                        table.Attach(button, 0, 1, 0, 1);
 
                        button.Show();
 
                        /* Create second button */
 
                        Button button2 = new Button("button 2");
 
                        /* When the button is clicked, we call the "callback" function
                         * with a pointer to "button 2" as its argument */
 
                        button2.Clicked += callback;
 
                        /* Insert button 2 into the upper right quadrant of the table */
                        table.Attach(button2, 1, 2, 0, 1);
 
                        button2.Show();
 
                        /* Create "Quit" button */
                        Button quitbutton = new Button("Quit");
 
                        /* When the button is clicked, we call the "delete_event" function
                         * and the program exits */
                        quitbutton.Clicked += exit_event;
 
                        /* Insert the quit button into the both
                         * lower quadrants of the table */
                        table.Attach(quitbutton, 0, 2, 1, 2);
 
                        quitbutton.Show();
 
                        table.Show();
                        window.ShowAll();
 
                        Application.Run();
 
                }
        }
}
```
