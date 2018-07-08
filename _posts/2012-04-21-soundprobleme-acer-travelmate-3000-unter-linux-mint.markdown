---
layout: post
title: Soundprobleme Acer Travelmate 3000 unter Linux-Mint behoben
date:   2012-04-21 08:00:00 +0200
---

Änderung von /etc/modprobe.d/alsa-base.conf :

    # Power down HDA controllers after 10 idle seconds
    options snd-hda-intel model=dell-3stack''

Alsa ist dann neu zu starten:

    sudo alsa force-reload