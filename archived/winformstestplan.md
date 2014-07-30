---
title: "WinFormsTestPlan"
lastmodified: '2007-03-12'
permalink: /archived/WinFormsTestPlan/
redirect_from:
  - /WinFormsTestPlan/
---

WinFormsTestPlan
================

This is a basic test plan for verifying that a core set of WinForms applications do not majorly regress in functionality between releases of mono.

NUnit 2.2.x
-----------

-   Remove your old mono registry.

-   Run nunit-gui.exe

Expected result: Control layout should be approximately like the following image from MS.NET: [![Nunit-gui-2.2.5-msnet.PNG]({{ site.github.url }}/images/3/31/Nunit-gui-2.2.5-msnet.PNG)]({{ site.github.url }}/images/3/31/Nunit-gui-2.2.5-msnet.PNG)

-   Focus should be on the Errors and Failures tab

-   Pressing the right arrow key should focus on the Tests Not Run tab.

-   Pressing the right arrow key five times more should keep the focus on the Console.Error tab.

-   Pressing Shift+Tab puts (non-visible) focus onto the disabled Run button.

-   Pressing Shift+Tab again puts focus on the Tests tab.

-   Pressing the right arrow key should move focus to the Categories tab and put it's contents on top.

-   Pressing Shift+Tab again should take the focus to the empty Console.Error tab. Focus is represented by a blinking cursor.

-   Click File-\>Open, and select nunit.framework.tests.dll

Expected result: Screenshot should look approximately like the following image from MS.NET: [![Nunit-gui-2.2.5-msnet tests-loaded.PNG]({{ site.github.url }}/images/0/0b/Nunit-gui-2.2.5-msnet_tests-loaded.PNG)]({{ site.github.url }}/images/0/0b/Nunit-gui-2.2.5-msnet_tests-loaded.PNG)

-   Focus should remain in the Console.Error tab contents, represented by a blinking cursor in the blank space.

-   Click on the Errors and Failures tab.

-   Press Alt+R to run the tests.

Expected result: Modulo some tests ignored (yellow) due to platform, it should be similar to the following image from MS.NET: [![Nunit-gui-2.2.5-msnet tests-run.PNG]({{ site.github.url }}/images/7/7b/Nunit-gui-2.2.5-msnet_tests-run.PNG)]({{ site.github.url }}/images/7/7b/Nunit-gui-2.2.5-msnet_tests-run.PNG)

-   Focus should remain on the Errors and Failures tab after the run is complete.


