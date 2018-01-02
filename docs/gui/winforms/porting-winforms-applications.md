---
title: Porting Winforms Applications
redirect_from:
  - /Guide%3A_Porting_Winforms_Applications/
---

by Jonathan Pobst

The amount of effort required to get an existing Winforms app running on Mono can vary greatly. Although many small apps will run on Mono unmodified, many apps will require some work on the developer's part to run smoothly on Mono. This guide will attempt to port a non-trivial open source application to document several of the issues a developer may run into while porting their app to Mono.

The Project
-----------

For this guide, the open source application NClass has been chosen. It is a UML compliant class designer that looks very much like the one that ships in Visual Studio 2005. It is licensed under the GPL and LGPL, and has not been written with Mono in mind. We will be using Mono 1.2.4 to port NClass to run on Linux.

-   NClass homepage - [http://nclass.sourceforge.net/index.html](http://nclass.sourceforge.net/index.html)
-   NClass download - [http://nclass.sourceforge.net/downloads.html](http://nclass.sourceforge.net/downloads.html) (this guide uses the "source" version)
-   [Mono 1.2.4](/download/)
-   [Mono Migration Analyzer (MoMA)](/docs/tools+libraries/tools/moma/)

NClass running on .Net with included example file: [![Msnclass.png](/archived/images/1/1c/Msnclass.png)](/archived/images/1/1c/Msnclass.png)

Getting Started
---------------

For the purpose of this guide, we will make the assumption that the developer is more familiar with Windows and Visual Studio than the Linux counterparts, given that the app is originally a Windows app.

Because we grabbed the source version, first we need to load up NClass.sln in Visual Studio and compile the solution.

[![Build.png](/archived/images/1/18/Build.png)](/archived/images/1/18/Build.png)

Once we have a compiled executable, we can run MoMA on it to give us an idea of what kinds of issues we may run into.

[![Moma1.png](/archived/images/3/35/Moma1.png)](/archived/images/3/35/Moma1.png)

[![Moma2.png](/archived/images/c/c4/Moma2.png)](/archived/images/c/c4/Moma2.png)

The results from the MoMA scan can be seen [here](http://jpobst.com/moma/nclassmoma.html).

### MoMA Summary

Methods we are using that are not in Mono 1.2.4:

-   void ListView.add_ItemSelectionChanged (ListViewItemSelectionChangedEventHandler)
-   void TreeView.set_ShowNodeToolTips (bool)
-   void TreeNode.set_ToolTipText (string)
-   void PrintDialog.set_UseEXDialog (bool)

Methods that are marked with a [MonoTODO] attribute in Mono.1.2.4:

-   void Control.set_AutoSize (bool) - This method currently does nothing
-   void ContainerControl.set_AutoScaleMode (AutoScaleMode) - Call scaling method
-   void ComboBox.set_AutoCompleteMode (AutoCompleteMode) - AutoCompletion algorithm is currently not implemented.
-   void ComboBox.set_AutoCompleteSource (AutoCompleteSource) - AutoCompletion algorithm is currently not implemented.

Looking at the report, we can immediately see several places we will most likely need to make adjustments for our program to work.

The TODOs look pretty harmless, we can infer that if we rely on AutoSize, it's probably not going to work, and we are not going to have auto completion for our ComboBox. Most of these missing methods won't be too big of a problem either once we work around them. We can expect that we will not have ToolTips in our TreeView, and we can't set our PrintDialog to use the Windows XP dialog. The missing event ListView.ItemSelectionChanged however will likely be a problem. Because that event does not exist, it will not get fired, so whatever code we are doing in the event handler will not get called.

Trying It Out
-------------

Even though MoMA shows there could be problems running the application, sometimes those problems aren't hit until certain features of the program are executed. So let's try to run the application.

Open "Mono-1.2.4 Command Prompt" that was created in the start menu by the Mono installer. Go to the directory that contains the executable "NClass.NClass.exe", and try running it with Mono using:

    mono NClass.NClass.exe

Unfortunately, nothing seemed to happen.

[![Cmd1.png](/archived/images/8/8f/Cmd1.png)](/archived/images/8/8f/Cmd1.png)

What actually happened is that the application ran, but hit an error and quit. To see the error, we need to redirect the error output to a file, so we run:

    mono NClass.NClass.exe 2> error.log

Looking at the log that was created, we see this error:

    ** (NClass.NClass.exe:38272): WARNING **: Missing method System.Windows.Forms.PrintDialog::set_UseEXDialog(bool) in assembly C:\PROGRA~1\MONO-1~1.4\lib\mono\gac\System.Windows.Forms\2.0.0.0__b77a5c561934e089\System.Windows.Forms.dll, referenced in assembly C:\NClass\src\GUI\bin\Release\NClass.NClass.exe

    Unhandled Exception: System.MissingMethodException: Method not found: 'System.Windows.Forms.PrintDialog.set_UseEXDialog'.
    at <0x00000> <unknown method>
    at NClass.GUI.MainForm.Init () [0x00000]
    at NClass.GUI.MainForm..ctor () [0x00000]
    at (wrapper remoting-invoke-with-check) NClass.GUI.MainForm:.ctor ()
    at NClass.GUI.Program.Main (System.String[] args) [0x00000]

This isn't really unexpected. It is telling us that we tried to set the property PrintDialog.UseEXDialog, which MoMA already told us didn't exist in Mono. So it's time to start porting our source code to work around these issues.

Porting Strategies
------------------

There are several approaches to porting code, depending on your goals.

-   The unsupported code can simply be removed or commented out if it is not needed.
-   Compiler conditional directives (#if) can be used to create separate executables for .Net and Mono.
-   The runtime (.Net or Mono) can be detected and use different code.
-   The code can be rewritten to use supported methods in Mono.

Here is the section of code that is setting PrintDialog.UseEXDialog in MainForm.Designer.cs:

``` csharp
  //
  // printDialog
  //
  this.printDialog.Document = this.printDocument;
  this.printDialog.UseEXDialog = true;
```

### Remove / Comment Code

If the code isn't really needed, the easiest thing to do is to remove it:

``` csharp
  //
  // printDialog
  //
  this.printDialog.Document = this.printDocument;
```

or comment it out:

``` csharp
  //
  // printDialog
  //
  this.printDialog.Document = this.printDocument;
  // this.printDialog.UseEXDialog = true;
```

However, there will be plenty of cases when this is not feasible.

### Compiler Conditionals

Another strategy is to create different assemblies for .Net and Mono. This can be done by wrapping all code that is not supported by Mono in conditional directives and compiling with and without the directive.

``` csharp
  //
  // printDialog
  //
  this.printDialog.Document = this.printDocument;
#if !MONO
  this.printDialog.UseEXDialog = true;
#endif
```

When compiling the version for Mono, we would specify the flag MONO in the Build tab of the GUI project properties.

[![Conditional.png](/archived/images/3/39/Conditional.png)](/archived/images/3/39/Conditional.png)

The downside of this approach is that we must ship separate assemblies for different platforms.

### Runtime Conditionals

In order to have only one assembly for all platforms, but run different code on different platforms, we can detect at runtime whether we are using Mono or .Net. First, create a function to detect if the assembly is running on Mono (from the [Technical FAQ](/docs/faq/technical/)):

``` csharp
  public static bool IsRunningOnMono ()
  {
    return Type.GetType ("Mono.Runtime") != null;
  }
```

Then use the function to determine which code to run:

``` csharp
  //
  // printDialog
  //
  this.printDialog.Document = this.printDocument;
  if (!IsRunningOnMono ()){
    SetupPrintDialog ();
  }
...
 
void SetupPrintDialog ()
{
   this.printDialog.UseEXDialog = true;
}
```

Notice that we moved the code into a separate function, as this will prevent the JIT engine from throwing an exception as it JITs the code and determines that the method did not exist. By moving the code into a different method we prevent the JIT engine from hitting it.

### Rewriting Code

Sometimes the best option is to simply rewrite the problem code in a way that is supported by Mono. For example, MoMA told us that this application uses the ListView.ItemSelectionChanged event, which is not implemented in Mono. However, the event ListView.SelectedIndexChanged event is implemented, and could be used for the same purpose.

Here is the problem code:

``` csharp
  this.lstItems.ItemSelectionChanged += new System.Windows.Forms.ListViewItemSelectionChangedEventHandler(this.lstItems_ItemSelectionChanged);
```

Which can be modified to:

``` csharp
  this.lstItems.SelectedIndexChanged += new System.EventHandler (this.lstItems_ItemSelectionChanged);
```

We then modify lstItems_ItemSelectionChanged from:

``` csharp
  private void lstItems_ItemSelectionChanged(object sender, ListViewItemSelectionChangedEventArgs e)
  {
    if (lstItems.SelectedItems.Count == 0)
      ClearInput();
    else
      ItemSelected();
  }
```

To:

``` csharp
  private void lstItems_ItemSelectionChanged(object sender, EventArgs e)
  {
    if (lstItems.SelectedItems.Count == 0)
      ClearInput();
    else
      ItemSelected();
  }
```

When possible (which isn't always the case), this method is the cleanest, as it uses the same code and provides the same functionality on both the Mono and .Net runtime.

Porting NClass
--------------

For our NClass application, we will comment out PrintDialog.UseEXDialog, TreeView.ShowNodeToolTips, and TreeNode.ToolTipText. We will rewrite both occurrences of ListView.ItemSelectionChanged.

MainForm.Designer.cs - Line 1196

``` csharp
  // this.printDialog.UseEXDialog = true;
```

TreeDialog.Designer.cs - Line 66

``` csharp
  // this.treOperations.ShowNodeToolTips = true;
```

TreeDialog.cs - Line 74

``` csharp
  // child.ToolTipText = operation.ToString();
```

MembersDialog.designer.cs - Line 238

``` csharp
  // this.lstMembers.ItemSelectionChanged += new System.Windows.Forms.ListViewItemSelectionChangedEventHandler (this.lstMembers_ItemSelectionChanged);
  this.lstMembers.SelectedIndexChanged += new System.EventHandler (this.lstMembers_ItemSelectionChanged);
```

Rewriting the listMembers_ItemSelectionChanged method takes a little bit more effort. One way is to change it from:

``` csharp
private void lstMembers_ItemSelectionChanged(object sender, ListViewItemSelectionChangedEventArgs e)
{
  if (e.IsSelected && e.Item.Tag is Member) {
    ShowNewMember((Member) e.Item.Tag);
 
    toolDelete.Enabled = true;
    if (e.ItemIndex < attributeCount) {
      toolMoveUp.Enabled = (e.ItemIndex > 0);
      toolMoveDown.Enabled = (e.ItemIndex < attributeCount - 1);
    }
    else {
      toolMoveUp.Enabled = (e.ItemIndex > attributeCount);
      toolMoveDown.Enabled = (e.ItemIndex < lstMembers.Items.Count - 1);
    }
  }
  else {
    toolMoveUp.Enabled = false;
    toolMoveDown.Enabled = false;
    toolDelete.Enabled = false;
  }
}
```

To:

``` csharp
private void lstMembers_ItemSelectionChanged(object sender, EventArgs e)
{
  if (lstMembers.SelectedItems.Count == 0) {
    toolMoveUp.Enabled = false;
    toolMoveDown.Enabled = false;
    toolDelete.Enabled = false;
    return;
  }
 
  ListViewItem lvi = lstMembers.SelectedItems[0];
 
  if (lvi.Tag is Member) {
    ShowNewMember ((Member)lvi.Tag);
 
    toolDelete.Enabled = true;
    if (lvi.Index < attributeCount) {
      toolMoveUp.Enabled = (lvi.Index > 0);
      toolMoveDown.Enabled = (lvi.Index < attributeCount - 1);
    }
    else {
      toolMoveUp.Enabled = (lvi.Index > attributeCount);
      toolMoveDown.Enabled = (lvi.Index < lstMembers.Items.Count - 1);
    }
  }
}
```

Also, make the changes to lstItems.ItemSelectionChanged and lstItems_ItemSelectionChanged outlined in the "Rewriting Code" section above.

With these changes made, rebuild the solution in Visual Studio. Then run the NClass.NClass.exe executable again. This time we get much better results:

[![Nclass1.png](/archived/images/3/3f/Nclass1.png)](/archived/images/3/3f/Nclass1.png)

Loading up the example file:

[![Nclass2.png](/archived/images/1/10/Nclass2.png)](/archived/images/1/10/Nclass2.png)

Class members dialog:

[![Dialog1.png](/archived/images/8/86/Dialog1.png)](/archived/images/8/86/Dialog1.png)

Continuing the Port
-------------------

Now that the application runs, you have a good starting point to work from. However, it needs to be thoroughly tested for issues that MoMA can't find. When exercising the application's code, it is possible that you will run into things that do not function as expected or the application may crash unexpectedly. If these issues are bugs in Mono, please file the bug with a small test case (not your entire application) so we can fix them. See [Bugs](/community/bugs/) for details. Other issues may just be poorly written code that can be fixed by rewriting it to be more robust and error-proof.

There are still many issues with the NClass port, but for the sake of brevity, we will not attempt to fix them in this guide.

Running on Linux
----------------

Ultimately, the goal is to run the application on Linux, so let's look at running NClass on Linux. If you already have a Linux installation, you can look for Mono packages in your distro's package repositories.

If they are not there or are out of date, there are packages for many popular distros on Mono's [Downloads](/download/) page. If you cannot find pre-made packages, you can also compile from the source code. Instructions are available [here](/docs/compiling-mono/).

If you do not have a Linux installation, another option is to run the openSUSE/Mono VMWare image. This is the method we will use, which requires the following:

-   Free VMWare Player - [http://www.vmware.com/products/player/](http://www.vmware.com/products/player/)
-   Mono 1.2.4 on openSUSE 10.2 VMWare image - [Downloads](/download/)

After installing the VMWare player and unzipping the VMWare image, start the Mono image. It should bring you to the openSUSE desktop:

[![Linux1.jpg](/archived/images/b/bc/Linux1.jpg)](/archived/images/b/bc/Linux1.jpg)

[![Linux3.jpg](/archived/images/d/db/Linux3.jpg)](/archived/images/d/db/Linux3.jpg)

Enabling User Shares

To transfer the application to the Mono image, we need to create a NClass directory and turn on directory sharing.

-   Right click the desktop, choose Create Directory, name the directory NClass.
-   Click the "Computer" menu in the bottom left, choose Control Center.
-   Choose "YaST" at the bottom, the password is "mono".
-   Choose "Network Services", then "Samba Server".
-   Check "Allow Users to Share Their Directories" on the "Shares" tab.
-   Choose "Finish".
-   Back on the desktop, Right click the "NClass" folder you created and choose "Sharing Options".
-   Check "Share this folder" and "Allow other people to write to this folder".
-   Click "Modify Share".

Now go back to Windows, and access your new share by typing "\\\\mono\\nclass" into the Run dialog. Copy your NClass project to the Mono image share.

On the Mono image desktop, double click your NClass folder, and navigate to your compiled NClass.NClass.exe application. Double click it and the application should run.

[![Linux4.png](/archived/images/0/02/Linux4.png)](/archived/images/0/02/Linux4.png)

### Linux Platform Differences

There are two classes of issues you may run into during your port. The first class are issues stemming from differences between the .Net and Mono runtime. These can be worked out while still on Windows as shown above. However, there is a second class of issues that you may come across. These are issues stemming from differences between Windows and Linux (or OSX, etc.).

Common OS Porting Issues

-   Use of Win32 P/Invokes
-   Case sensitivity in file names.
-   Use of "\\" in paths.

As an example, lets say you have a subdirectory in your application called "Sounds" that contains the file "Finished.wav". To play this sound, you have the following function:

``` csharp
[DllImport ("winmm.dll", SetLastError = true)]
static extern bool PlaySound (string pszSound, IntPtr hmod, int fdwSound);
 
public void PlayFinishedSound ()
{
  string sound = Application.ExecutablePath + @"\Sounds\finished.wav";
  PlaySound (sound, IntPtr.Zero, 0);
}
```

This function exhibits all three mentioned porting issues.

Mono has a special execution mode that will help you get your port moving faster (if you do not want to change the filename casing or path separators, see the [IOMap](/docs/advanced/iomap/) page for details.

#### Win32 P/Invokes

The PlaySound function is declared in the Win32 API dll "winmm.dll", which does not exist on Linux. There are two ways around this. One is to find the equivalent function in your target platform's API, and use runtime detection to determine which API to call. If you are lucky, the easy way is to replace your API call with managed code. In this case, we can use the System.Media.SoundPlayer class to play the sound for us, like this:

``` csharp
public void PlayFinishedSound ()
{
  string sound = Application.ExecutablePath + @"\Sounds\finished.wav";
  SoundPlayer sp = new SoundPlayer (sound);
  sp.Play ();
}
```

#### Case Sensitivity

Another difference between Windows and many other operating systems such as Linux is that the file system is case sensitive. That is, in Windows the files "readme.txt" and "README.TXT" are the same, but in Linux those are distinct files. Looking at our example, our file is called "Finished.wav", but we are referencing it in code as "finished.wav". Although this will work on Windows, it will generate a FileNotFoundException on Linux. So we must be consistent about the case of our file names:

``` csharp
public void PlayFinishedSound ()
{
  string sound = Application.ExecutablePath + @"\Sounds\Finished.wav";
  SoundPlayer sp = new SoundPlayer (sound);
  sp.Play ();
}
```

#### The Path Separator

Another issue you may run across is the path separator ("\\") used in file paths. In many other operating systems, such as Linux, the path separator is a forward slash ("/") instead of a backwards slash like Windows. In our example, we have hard coded a backwards slash that will cause our file to not be found.

We can correct this using Path.DirectorySeparatorChar:

``` csharp
public void PlayFinishedSound ()
{
  string sound = Application.ExecutablePath + string.Format ("{0}Sounds{0}Finished.wav", Path.DirectorySeparatorChar);
  SoundPlayer sp = new SoundPlayer (sound);
  sp.Play ();
}
```

or using Path.Combine:

``` csharp
public void PlayFinishedSound ()
{
  string path = Path.Combine (Application.ExecutablePath, "Sounds");
  string sound = Path.Combine (path, "Finished.wav");
  SoundPlayer sp = new SoundPlayer (sound);
  sp.Play ();
}
```

Either method will ensure that the correct path separator is used on the correct operating system.

For some more issues you might run into and a more detailed look at options for dealing with them, see [Guidelines:Application Portability](/docs/getting-started/application-portability/).

Conclusion
----------

Using this guide, we have managed to port a non-trivial winforms app to start up on Mono on Linux in a couple of hours. Although it is not complete, once the application is starting up on Mono, it's a good beginning to test and see what issues remain.

Advanced Guides
---------------

-   [Guide: Debugging With MWF](/docs/gui/winforms/debugging-with-mwf/) - Shows how to use the MWF project file from git to debug issues.


