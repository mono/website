---
title: WinForms Getting Started Guide
redirect_from:
  - /WinForms_Getting_Started_Guide/
---

### Installation

System.Windows.Forms is part of a standard Mono installation.

### WinForms Example

As there are plenty of great articles and books on Windows Forms programming, the topic will not be covered in-depth. The following is just a simple Winforms program to test with.

``` csharp
using System;
using System.Drawing;
using System.Windows.Forms;
 
public class HelloWorld : Form
{
    static public void Main ()
    {
        Application.Run (new HelloWorld ());
    }
 
    public HelloWorld ()
    {
        Button b = new Button ();
        b.Text = "Click Me!";
        b.Click += new EventHandler (Button_Click);
        Controls.Add (b);
    }
 
    private void Button_Click (object sender, EventArgs e)
    {
        MessageBox.Show ("Button Clicked!");
    }
}
```

If you save this code as hello.cs, you would compile it like this:

    csc hello.cs -r:System.Windows.Forms.dll

The compiler will create "hello.exe", which you can run using:

    mono hello.exe

NOTE: on macOS you’ll have to wait around a minute the very first time you run this command.

[![Helloworld.png](/archived/images/f/f5/Helloworld.png)](/archived/images/f/f5/Helloworld.png)

Results running on openSUSE 10.2

