---
title: "VMware Image"
lastmodified: '2009-06-25'
redirect_from:
  - /VMware_Image/
  - /VMWare_Image/
---

VMware Image
============

The VMware image contains some applications and development tools that will help you get started with Mono. We are interested in getting feedback about it.

Since we are not Windows developers, we want to hear frfom Windows developers what is confusing, what kind of problems they are running into, what things are not obvious, and in general, we want to get all the feedback we can about how to improve the VMware image.

Please email your suggestions to [[1]](mailto:mono@novell.com)

FAQ
---

**Do the VMware tools work?**

Yes. We install the VMware tools from VMware Workstation 6.

These Features are tested each release:

-   Copy and Paste from Host to Guest and vice versa
-   Drag and Drop files from Host to Guest and vice versa
-   Resizing the Guest OS Gui to the size of the VMware window
-   Moving the mouse from the Guest to the Host without hitting \<ctrl\>\<alt\>

**Why can't I use the image with older VMware products?**

If you get this error message:

    Unable to add virtual machine "mono.vmx" to the inventory:
    Configuration file was created by a VMware product with more features than this version

then your vmware product is too old. You must use VMware Workstation 6, VMware Server 2.0 or VMware Player. This requirement was done so that we could properly support VMware Tools.

**What does this VMware image contain?**

The VMware image contains a SUSE Linux installation with Mono and the various Mono development tools and programs needed to try out your .NET applications on Linux using the Mono runtime.

**Where do I get the image from?**

You can download the VMware image with Mono pre-installed and pre-configured from our [Downloads](/Downloads "Downloads") page.

You can download it either with HTTP (simple) or if you want to get it faster you can use BitTorrent.

**What do I do with the image?**

You can use the free VMware player to run this virtual machine: [[download](http://www.vmware.com/products/player/)] You can also use this image with any VMware product compatible with VMware Workstation.

**What is the root password for the image?**

The root password is 'mono'. The image is set up to automaticially log on as the 'rupert' user, and that account's password is also 'mono'. If you open <http://localhost> inside the image, there is a table with all accounts on the system (mysql, users, etc...).

**What's a torrent file?**

Torrent files are an efficient mechanism to distribute large files that many folks might be interested in. By using BitTorrent, we are able to distribute the bandwidth loads of the 1 GB file.

**Networking doesn't seem to be working inside the image**

Try switching from bridging to NAT or vice versa. Then click on the network icon on the image desktop and click "Wired Network" to try to reconnect.

**Network connections are slow, why?**

Most likely your DNS is not correctly setup, select "control center" from the Computer menu, and then select "System" to configure your networking.

If SLED can't find your hostname, use the ipconfig command on Windows to get your IP Address. Ipconfig will list the IP address for your VMware guest (SLED) as well.

**How to I transfer files from Windows to the VMware image?**

First you need to know the IP Address of the VMware image. To get this, right click on the network manager icon in the tray (the icon of two computers connected to each other) and then click "Connection Information". Write down the IP Address.

For this example, I will use 10.0.0.1 as the IP address for the VMware image.

In Windows, open the file explorer. In the Address bar, put \\\\10.0.0.1 and hit enter.

You should be prompted with a username and password dialog. Enter:

    User name: rupert
     Password: mono

You should now see the shares htdocs and rupert. rupert is the home directory for the default user on the VMware image (the one that automatically logs on when you start the image).

htdocs is the apache directory where you can put asp.net files.

**Will binaries from Windows work?**

Yes, they will.

See our [Guidelines:Application_Portability](/Guidelines:Application_Portability "Guidelines:Application Portability") for recommendations on how to make your software port better.

**How do I know my torrent downloaded successfully?**

Use md5sum to verify the download:

    md5sum mono1.2.5_opensuse10.2_vmware_0.zip
    b8a3c730f0d1ee2a37b508518cb987df  mono1.2.5_opensuse10.2_vmware_0.zip

    md5sum mono1.2.4_opensuse10.2_vmware_1.zip
    b8ba1e445f1d71d152b436118256c2ae  mono1.2.4_opensuse10.2_vmware_1.zip

    md5sum mono1.2.3.1_opensuse10.2_vmware_0.zip
    ae7e031f48008070d895f296a6cad8d4  mono1.2.3.1_opensuse10.2_vmware_0.zip

    md5sum mono1.2.2.1_opensuse10.2_vmware_0.zip
    b89265cb16e1cdb9e2002e1c6071fd14  mono1.2.2.1_opensuse10.2_vmware_0.zip

    md5sum mono1.2_sled10_vmware_0.zip
    b71d93ea4c5fc40a8a0d85f59a0d23c0  mono1.2_sled10_vmware_0.zip

    md5sum mono1.1.17.1_sled10_vmware_0.zip
    bf48e48a7e53a29d56dadf0c0aa1f2a0  mono1.1.17.1_sled10_vmware_0.zip

    md5sum mono1.1.16.1_sled10_vmware_2.zip
    8b0dcad3cc9a046717c4798e831a9f82  mono1.1.16.1_sled10_vmware_2.zip

**How do I update to the latest released Mono packages?**

Make sure you have a network connection.

Command line method:

1.  Open a command line and login as root (you shouldn't need to type a password):

    sudo -s

2.  List the updates available in the mono repo:

    zypper -r lu -r mono

3.  Install the updates from the mono repo:

    zypper -r up -r mono

**How do I update to the latest Mono Preview packages?**

Make sure you have a network connection.

Command line method:

1.  Open a command line and login as root (you shouldn't need to type a password):

    sudo -s

2.  Look at the installed repos (you should have a mono-preview repo and it should be disabled):

    zypper lr

3.  Enable the mono-preview repo:

    zypper mr -e mono-preview

4.  List the updates available in the mono-preview repo (you may be asked if you trust some keys, just say yes):

    zypper -r lu -r mono-preview

5.  Install the updates from the mono-preview repo:

    zypper -r up -r mono-preview

6.  Disable the mono-preview repo again (this is so that the mono previews don't show up in your updates list. Otherwise, you may upgrade to the next mono preview accidentally):

    zypper mr -d mono-preview

7.  List the repos again and make sure the mono-preview repo is disabled:

    zypper lr



