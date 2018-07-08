---
layout: post
title: Native Resolution unter Ubuntu for Intellibooks
date:   2012-07-31 08:00:00 +0200
---

Ich zitiere hier nur Daily Siebler:

    sudo add-apt-repository ppa:sarvatt/cedarview
    sudo apt-get install add-apt-key
    sudo add-apt-key 0x4c96de60854c4636
    sudo apt-get update


You can try to Add <code>"video=LVDS-1:d"</code\\ to <code>GRUB\_CMDLINE\_LINUX\_DEFAULT</code> variable,

If your don't see anything remove it... on one of my Systems it's working, on a second device it doesn't.
^
    sudo vi /etc/default/grub

If you're using PAE kernel, remove it and install generic kernel
^
    sudo apt-get install linux-headers-generic linux-image-generic
    sudo apt-get remove linux-headers-generic-pae
    linux-image-generic-pae

Install the cedarview drivers
^
    sudo apt-get install cedarview-drm libva-cedarview-vaapi-driver
    cedarview-graphics-drivers

Change Option <code>"AIGLX"</code> to <code>"Off"</code> because 3D isn't working (default settion)
^
    sudo vi /usr/share/intel-cdv/X11/xorg.conf.d/61-cdv-pvr.conf

Update the Grub Bootloader
^
    sudo update-grub2

Reboot the System

### Links

-   [Ubuntu 12.04 Driver for Intel Cedarview
    Atom](http://daily.siebler.eu/2012/06/ubuntu-12-04-driver-for-intel-cedarview-atom-n2000-und-d2000-serie/)