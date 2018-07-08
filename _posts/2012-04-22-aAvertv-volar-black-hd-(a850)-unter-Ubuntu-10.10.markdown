---
layout: post
title: AverTV Volar Black HD (A850) unter Ubuntu 10.10
date:   2012-04-22 08:00:00 +0200
---

Dieser USB-TV-Stick ist unter Ubuntu durchaus zum Laufen zu
kriegen:

Download Firmware von

    http://www.otit.fi/~crope/v4l-dvb/af9015/af9015_firmware_cutter/firmware_files/4.95.0/dvb-usb-af9015.fw

nach <code>/lib/firmware</code> legen.

Neue Paketquelle hinterlegen:

    deb http://ppa.launchpad.net/yavdr/stable-vdr/ubuntu lucid main

Signierungsschlüssel einspielen:

    sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com

Quellen neu laden:

    sudo apt-get update

V4l, metv + Firmware installieren:

    sudo apt-get install v4l-dvb-dkms metv linux-firmware linux-firmware-nonfree

Sender scannen

    scan /usr/share/dvb/dvb-t/at-Official

Neustarten