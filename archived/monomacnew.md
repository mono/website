---
title: "MonoMacNew"
lastmodified: '2010-10-17'
redirect_from:
  - /MonoMacNew/
---

MonoMacNew
==========

[Get MonoMac](#getting-monomac)

Getting Started

[API Documentation](http://docs.go-mono.com/N:MonoMac)

\<div style="clear: both;"/\>

### Getting MonoMac

To develop applications with MonoMac, you will need to install the [Mono Runtime](/download/) and the [MonoDevelop IDE](http://www.monodevelop.com).

Since MonoMac is currently under development, you must install the add-in separately from MonoDevelop, this is how you install it:

1.  Open the **Add-in Manager** from the *Tools-\>Add-in Manager* menu.
2.  Click the *Install add-ins* button to open the **Add-in Installation dialog**.
3.  Click the *Repositories* button to open the **Add-in Repository Management** dialog.
4.  Click the *Add* button, ensure the *Register an on-line repository* option is selected, and enter the URL ``

    ``` nowiki
    http://addins.monodevelop.com/Alpha/Mac/2.4
    ```

    then press *Ok*.

5.  Click the *Close* button to return to the installation dialog.
6.  Expand the *Mac development* category, and check the *MonoMac development* addin.
7.  Press the *Forward* button. You will be shown a page confirming that the *MonoMac development* addin will be installed. Press *Forward* again, then when the installation finishes click *Close*.
8.  Restart MonoDevelop

When the MonoMac addin is installed, a *MonoMac Project* template will become available in the **New Solution** dialog.

NOTE: You may also wish to add the repository URLs

``

``` nowiki
http://addins.monodevelop.com/Stable/Mac/2.4
```

and ``

``` nowiki
http://addins.monodevelop.com/Beta/Mac/2.4
```

in order to download other available addins. In future versions of MonoDevelop the addins.monodevelop.com repositories will be registered by default.

