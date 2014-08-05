---
title: "Accessibility: Client"
lastmodified: '2009-06-17'
redirect_from:
  - /Accessibility:_Client/
---

Accessibility: Client
=====================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#getting-started-with-uiautomationclient">1 Getting Started With UIAutomationClient</a>
<ul>
<li><a href="#for-developers">1.1 For Developers</a>
<ul>
<li><a href="#winforms-support">1.1.1 Winforms Support</a>
<ul>
<li><a href="#using-uia-verify">1.1.1.1 Using UIA Verify</a></li>
</ul></li>
<li><a href="#gtk-and-other-at-spi-support">1.1.2 GTK+ and other at-spi Support</a></li>
</ul></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Getting Started With UIAutomationClient
=======================================

As part of the second phase, the Mono Accessibility team is implementing full support for the UIAutomationClient API.

For Developers
--------------

You can read about the architecture at [Accessibility:\_Client\_Implementation]({{ site.github.url }}/Accessibility:_Client_Implementation "Accessibility: Client Implementation"), if you are interested in how we are implementing this API.

You will need to install UIAutomation from uia2atk trunk.

TODO: Add content similar to [Accessibility:\_Moonlight]({{ site.github.url }}/Accessibility:_Moonlight "Accessibility: Moonlight") and [Accessibility:\_Getting\_Started\_With\_Development]({{ site.github.url }}/Accessibility:_Getting_Started_With_Development "Accessibility: Getting Started With Development")

### Winforms Support

Install UiaDbusCoreBridge and DbusCoreUiaSource from uia2atk trunk.

#### Using UIA Verify

TODO: Overwrite our WindowsBase with the one from Olive, apply patch to UIA Verify code

### GTK+ and other at-spi Support

TODO: Tips for installing at-spi-sharp and at-spi-dbus

