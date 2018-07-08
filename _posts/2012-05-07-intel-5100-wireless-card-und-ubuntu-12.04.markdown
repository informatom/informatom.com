---
layout: post
title: Intel 5100 Wireless Card und Ubuntu 12.04
date:   2012-05-07 08:00:00 +0200
---

Ich besitze einen No-Name Laptop mit einer Intel 5100 Wireless
Card, die bislang unter allen Linux Distributionen reibungslos
funktionierte. Mit der neuen Ubuntu 12.04 aber auch mit der neuen
Crunchbang 11 funktioniert diese plätzlich nicht mehr. Das Phänomen ist
merkwürdig: Die Verbindung zum Wlan erfolgt, eine IP ist zugewiesen, aber es erfolgt keine
 Nutzdatenübertragung.

Dieses Problem lässt sicht beheben, indem man den 11n-Modus deaktiviert.
Man erstellt eine Datei zur Deaktivierung, aktualisiert die Ramdisk und
lädt das Modul nach:

    sudo nano /etc/modprobe.d/intel_11n_disable.conf
^
    options iwlagn 11n_disable=1
^
    sudo update-initramfs -u
    sudo modprobe -r iwlagn && sudo modprobe iwlagn