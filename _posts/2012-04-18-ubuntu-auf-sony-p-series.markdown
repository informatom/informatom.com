---
layout: post
title: Ubuntu auf Sony P-series (VPCP11S1E/D)
date:   2012-04-18 08:00:00 +0200
---

Heute ein technische Tipp für Besitzer eine Laptops der Sony
P-Serie. Diese kleinen stylischen Notwbooks sind durchaus auch für Linux
geeignet.

-   Um die Grafikkarte voll zu unterstützen fügt man ein weiteres
    Repository hinzu

<!-- -->
    sudo add-apt-repository ppa:gma500/ppa && sudo apt-get update

-   Der entsprechende Schhlüssel wird hinzugefügt:

<!-- -->
    sudo gpg –keyserver keyserver.ubuntu.com –recv C6598A30

-   Schließlich werden die eigentlichen Treiber installiert:

<!-- -->
    sudo apt-get install poulsbo-driver-2d poulsbo-driver-3d poulsbo-config

-   Die Grafikkarte wird im Gegensatz zu der Beschreibung unter
    `http://www.datenteiler.de/ubuntu-auf-dem-sony-vaio-p/`, die aber
    dennoch sehr nützlich war, nach Reboot erkannt.
-   Um das UMTS-Modem zu verwenden ein Verzeichnis im home erstellen und
    hinein wechseln:

<!-- -->
    mkdir 3g
    cd 3g

-   Anschließend Download, Installation und Reboot:

<!-- -->
    wget http://www.logic.at/people/preining/software/sony-laptop-zseries-0.9np7.tar.gz
    tar xfvz sony-laptop-zseries-0.9np7.tar.gz
    cd sony-laptop-zseries-0.9np7
    make
    sudo make install
    sudo reboot

### Warnung!

Trotz diverser Anleitungen für 11.04 bin ich auf 10.10 zurückgestiegen:
Nur hier funktioniert bei mir der Grafiktreiber. Mittlerweile kann ich
sagen, dass auch fullHD problemlos funktioniert.