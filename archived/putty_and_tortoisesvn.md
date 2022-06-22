---
title: "Putty and TortoiseSVN"
lastmodified: '2007-03-12'
redirect_from:
  - /Putty_and_TortoiseSVN/
  - /Putty_and_TortoiseSvn/
---

Putty and TortoiseSVN
=====================

This section discusses how to use Subversion to access the [Mono SVN](/SourceCodeRepository) repository.

Mono's subversion repository is only available through a secure shell connection (ssh). To access the repository, you must use TortoiseSVN as well as Putty (an SSH client).

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#install-puttygen">1 Install PuttyGen</a>
<ul>
<li><a href="#generate-a-ppk">1.1 generate a .ppk</a></li>
</ul></li>
<li><a href="#install-putty">2 Install Putty</a></li>
<li><a href="#install-pageant">3 Install Pageant</a>
<ul>
<li><a href="#run-the-ageant">3.1 Run the ageant</a></li>
<li><a href="#add-your-ppk-to-the-ageant">3.2 Add your .ppk to the ageant</a></li>
</ul></li>
<li><a href="#install-plink">4 Install Plink</a></li>
<li><a href="#install-tortoisesvn">5 Install TortoiseSVN</a>
<ul>
<li><a href="#configure-mr-turtle">5.1 Configure Mr. Turtle</a></li>
<li><a href="#check-sumfin-out">5.2 Check sumfin' out</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Install PuttyGen
----------------

[puttygen.exe](http://the.earth.li/~sgtatham/putty/latest/x86/puttygen.exe)

### generate a .ppk

Convert your id_[dr]sa private key to a .ppk using PuttyGen

-   run puttygen
-   select the **Load** button
-   browse to and select your private RSA or DSA ssh key
-   enter your password when prompted
-   read the presented dialogue
-   click the **Save private key** button
-   enter a filename for your new .ppk file when prompted
-   press **Save**

Install Putty
-------------

[putty.exe](http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe)

-   Create session called mono-cvs.ximian.com
    -   open putty.exe
    -   under **Host Name (or IP address)**, enter \$USER@mono-cvs.ximian.com (where \$USER is your username)
    -   under **Saved Sessions**, enter "mono-cvs.ximian.com"
    -   click the **Save** button
-   Select .ppk file for authentication
    -   in the **Category** tree, select **Connection**-\>**SSH**-\>**Auth**
    -   in the field under **Authentication Parameters**, click the **Browse...** button
    -   browse to and select your .ppk file
-   Save your session information
    -   in the **Category** tree, select **Session**
    -   under **Load, save or delete a stored session**, select **mono-cvs.ximian.com**
    -   click the **Save** button

Install Pageant
---------------

[pageant.exe](http://the.earth.li/~sgtatham/putty/latest/x86/pageant.exe)

### Run the ageant

-   double-click on pageant.exe
-   you should now see a computer with a *black hat* in the tray

### Add your .ppk to the ageant

-   right-click on the computer with the black hat in your taskbar
-   select **Add Key** from the context menu
-   browse to your recently-created .ppk file and select it
-   click **Open**
-   enter your password when prompted
-   verify that your key has been added by double-clicking on the computer with the black hat

Install Plink
-------------

[plink.exe](http://the.earth.li/~sgtatham/putty/latest/x86/plink.exe)

Install TortoiseSVN
-------------------

[TortoiseSVN download page](http://tortoisesvn.net/downloads)

### Configure Mr. Turtle

This is the part we've all been waiting for. You need to tell TortoiseSVN to use TortoisePlink to handle its SSH traffic. To do this see the following steps:

-   right-click on an explorer window somewhere
-   hover over **TortoiseSVN** in the context menu
-   select **Settings** from the sub-menu
-   select **Network** from the list on the left
-   under the **SSH** box in the right side, click the **Browse...** button
-   browse to and select **TortoisePlink.exe** (mine is in c:\\Program Files\\TortoiseSVN\\bin\\TortoisePlink.exe)
-   click **Open**
-   click **Apply**

### Check sumfin' out

-   In the explorer, under your source tree (mine is C:\\Documents and Settings\\\$USER\\Desktop\\src\\svn\\mono), right-click on some empty space
-   Select **SVN Checkout...**
-   under **URL of repository:**, enter the following
    -   svn+ssh://\$USER@mono-cvs.ximian.com/source/trunk/mono
-   under **Checkout directory:**, enter something similar to the following
    -   C:\\Documents and Settings\\\$USER\\Desktop\\src\\svn\\mono\\mono
-   click the **OK** button
-   When prompted whether you want to create the non-existent directory, say yes
