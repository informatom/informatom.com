---
layout: post
title: Blindentaugliches WLAN-Radio
date:   2012-04-24 08:00:00 +0200
---

Diese Anleitung beinhaltet die Umwandlung eines EEEPC701 in eine
WLAN-Appliance, die ohne Unterstützung eines Displays bedient werden
kann. Die Tasten der Laptop-Tastatur dienen zum Großteil als
Stationstasten, sowie zur Lautstärkeregelung. Zur Identifikation der
Sender, d.h. der Funktion der einzelnen Tasten dient die integrierte
Sprachausgabe der Sendernamen.

Installation von Easypeasy

Medibuntu Repoistory hinzufügen

    sudo wget --output-document=/etc/apt/sources.list.d/medibuntu.list http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list
    sudo apt-get --quiet update
    sudo apt-get --yes --quiet --allow-unauthenticated install medibuntu-keyring
    sudo apt-get --quiet update

unnötige Pakete entfernen, benötigte hinzufügen:

    apt-get remove gnome* openoffice* firefox* skype* pidgin* xorg* bluez* compiz* evolution* cups* gcc xsane
    apt-get install openssh vnc-server player lame w32codecs
    apt-get autoremove
    apt-get autoclean

Automatischer Konsolen-Login:

    apt-get install rungetty console-terminus hotkey-setup pm-utils console-tools libconsole

in <code>/etc/event.d/tty1</code>

    exec /sbin/getty 38400 tty1

durch

    exec /sbin/rungetty --autologin BENUTZERNAME tty1

ersetzen. Am Ende von <code>/home/BENUTZERNAME/.profile</code>

    cd /media/sd
    ./radio.py

hinzufügen.

Automount der SD-Karte: In <code>etc/fstab</code> die Zeile

    /dev/sdb1 /media/sd vfat defaults 0 0

hinzufügen.

Für Mplayer IP6 verhindern: Am Ende von <code>/etc/mplayer/mplayer.conf</code>
sowie in <code>~/.mplayer/config</code> des ausführenden Users

    prefer-ipv4 = yes

einfügen.

mp3-Sprachfiles und radio.py auf die SD-Karte kopieren: [.zip-Archiv](/materials/blindradio.zip)

Die Appliance hat mittlerweile Produktionsqualität. Mein blinder Vater
verwendet sie seit vier Jahren täglich wie ein tragbares Radio. Er hat
mir bislang von keinem Absturz berichtet.

Für die Zukunft plane ich die Integration der CD-Bibliothek in die
Appliance. Da der EEPC nicht über ein CD-Rom Laufwerk verfügt und der
CD-Wechsel ohnehin lästig wäre, werde ich die CDs wohl als MP3s
digitatisieren und dann diese Files zum Abspielen anbieten.

Ich wäre sehr an Feedback und Verbesserungsvorschlägen interessiert.