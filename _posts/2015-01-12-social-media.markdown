---
layout: post
title: Social Media
date:   2015-01-12 08:00:00 +0200
---

## Weitere Social Media Features

-   Es gibt nun die Möglichkeit, Podcasts in Mercator
    zu veröffentlichen. Wir haben dazu einen [Podlove
    Webplayer](http://podlove.org/podlove-web-player/) integriert, der
    die Kapitelinformationen aus der Mercator-Datenbank in sein
    Interface aufnimmt und es damit dem Besucher der Webseite
    ermöglicht, ein benanntes Kapitel direkt aufzurufen. Man kann zu
    einem Podcasts Shownotes hinterlegen. Podcasts verwenden wie
    Blogposts die Kommentarengine. Wir erzeugen zusätzlich zwei
    RSS-Streams, einen für mp3-Podcasts, einen für solche im
    offenen ogg-Format. Der erste Stream ist kompatibel zum Itunes
    Podcastverzeichnis von Apple, womit die Podcasts über Itunes oder
    direkt vom Stream der Webseite importiert werden können

-   Als kleines Add-On gibt es ein Archiv Widget mit dem in Archiv der
    älteren Episoden gebrowst werden kann.

-   Podcasts werden erst mit der Hinterlegung eines
    Veröffentlichungsdatums gepublished.

### Ein Podcast

<hr/>
![Podcasts](/img/blog/podcasts.png){:style="max-width: 100%"}
<hr/>


Google Maps
-----------

Der Site-Admin kann ab jetzt eine Google Map, also eine Landkarte, in
die Webseite infgrieren, etwa um den Firmenstandort zu visualisieren.
Die dazu nötige Bibliothek ist in die Rails Asset Pipeline integriert.

Dabei ist uns ein kleiner Design Fehler aufgefallen, den wir zunächst
nicht verstanden haben. Genauere Analysen haben gezeigt, das mehrere
Entwickler Twitter Bootstrap mitunterschiedlichen Modifikatonen
eingeführt haben. Zum Glück waren diese noch gering und einfach zu
vereinheitlichen.

Seiteneffekt war die doppelte Einbindung des Frameworks auf der Seite,
auf der der Fehler aufgetreten ist. Mit der Bereinigung ist nun nicht
nur der Fehler behoben, sondern auch die Javascript-Datei, die am
Frontend ausgeliefert wird am über 100 Kilobyte kleiner geworden, was
die Downloadzeit verringert und den Seitenaufbau beschleunigt, da
Bootstrap nicht mehr doppelt vom Browser in den Speicher gelesen wird.

Diverses
--------

-   Bei der minimales Anmeldung aus der letzten Woche gab es
    Kinderkrankheiten, die beseitigt wurden.
-   Update: Wir haben Rails auf Version 4.0.13 aktualisiert und erfahren
    bei dieser Gelegenheit, dass der Core-Entwickler von Hobo bereits an
    der Kompatibilität zu Rails 4.2 arbeitet. Nebenbei haben wir auch
    einige andere Gems aktualisiert.
-   Die Daten aus einem Legacy System wurden in die
    Mercator-Installation geladen.

Ein Jahr Mercator
-----------------

Mittlerweile läuft die Entwicklung an Mercator ein Jahr! Wir feiern dies
allerdings (noch) nicht. Eine Feier planen wir nach der Produktivsetzung
der ersten fünf Systeme.

Mit dieser Woche ist das erste aus der Serie der fünf Referenzsysteme in
Produktion gegangen: [Informatom](http://informatom.com) in dem wir
diese Artikel als
[Entwicklungsblog](http://www.informatom.com/blogposts)
publizieren.

Wir haben nun noch unmittelbare Entwicklung von geschätzt fünf Wochen
vor uns, nach der wir ein technisches Resumee (hier in den Artikeln)
ziehen werden. Momentan läuft die Entwicklung weiter auf vollen
Touren.