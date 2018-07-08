---
layout: post
title: Blindentaugliches Wlan-Radio, die Zweite
date:   2012-04-27 08:00:00 +0200
---

Dieser Artikel ist eine Erweiterung und Ergänzung zu FIXME!
Blindentaugliches WLAN-Radio

Diesmal geht es einem Sony VPC11S1E an den Kragen. Ein etwas
merkwürdiges Gerät, was einige Komponenten angeht. So booten viele neue
Distributionen überhaupt nicht mehr, Grub lässt sich oftmals auf der
verbauten SSD nicht installieren, etc.

Die Basis bildet Ubuntu Server 11.10: Download der CD, mittels
Unetbootin auf einen USB-Stick und auf die lokale
Platte installieren.

Zunächst schreibt die Standardinstallation den Bootsektor auf den
USB-Stick, das muss behoben werden, anschließend Aktualisierung und
Aufräumen

<!-- -->
    sudo grub-install /dev/sda
    sudo apt-get update
    sudo apt-get autoremove
    sudo apt-get autoclean

Medibuntu Repository hinzufügen

<!-- -->
    sudo -E wget --output-document=/etc/apt/sources.list.d/medibuntu.list http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list
    sudo apt-get --quiet update
    sudo apt-get --yes --quiet --allow-unauthenticated install medibuntu-keyring
    sudo apt-get --quiet update
    sudo apt-get dist-upgrade

Installation ssh-Server mp3 Codec, automatischen Consolen-Login ermöglichen

<!-- -->
    sudo apt-get install openssh-server lame rungetty console-terminus
    sudo apt-get install pm-utils libconsole mplayer alsa-utils w32codecs
    sudo apt-get remove plymouth-theme-ubuntu-text

in <code>/etc/init/tty1.conf</code>

<!-- -->
    plymouth-theme-ubuntu-text
    exec /sbin/getty -8 38400 tty1

ersetzen durch

<!-- -->
    exec /sbin/rungetty --autologin USERNAME tty1

-   Am Ende von /home/BENUTZERNAME/.profile

<!-- -->
    cd /media/sd
    ./radio.py

hinzufügen.

mp3-Sprachfiles und radio.py nach /var/radio kopieren und verrechten:
[.zip-Archiv](/materials/blindradio2.zip)

<!-- -->
    mkdir /var/radio
    chown -r BENUNTZERNAME radio

Plymouth loswerden, dazu Paketquellen in <code>/etc/apt/sources.list</code> hinzufügen.

<!-- -->
    deb http://ppa.launchpad.net/dtl131/mediahacks/ubuntu oneiric main
    deb-src http://ppa.launchpad.net/dtl131/mediahacks/ubuntu oneiric main

    apt-get update
    apt-get dist-upgrade
    apt-get remove plymouth

Wireless Konfiguration:

<!-- -->
    sudo apt-get install wpa-supplicant wireless-tools

Erstellen einer <code>/etc/wpa-supplicant/wpa-supplicant.conf</code>

<!-- -->
    ctrl_interface=/var/run/wpa_supplicant
    eapol_version=1
    # 1: wpa_supplicant kümmert sich um das Scannen von Netzen und die AP-Auswahl.
    ap_scan=1

    network={
            ssid=\"SSID\"
            scan_ssid=1
            proto=WPA
            key_mgmt=WPA-PSK
            pairwise=CCMP
            group=TKIP
            psk=\"SCHLÜSSEL\"
    }

Update der <code>/etc/network/interfaces</code> - Auskommentieren von eth0

<!-- -->
    # WLAN
    auto wlan0
    iface wlan0 inet dhcp
    wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf

Herunterfahren mittels Power-Knopf

<!-- -->
    sudo apt-get install acpid

Für Mplayer IP6 verhindern: Am Ende von <code>/etc/mplayer/mplayer.conf</code>
sowie in <code>~/.mplayer/config</code> des ausführenden Users

<!-- -->
    prefer-ipv4 = yes