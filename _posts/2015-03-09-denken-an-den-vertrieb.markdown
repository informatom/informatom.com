---
layout: post
title: Denken an den Vertrieb
date:   2015-03-09 08:00:00 +0200
---

## Die Lizenz GPLv3 und ihre Auswirkungen

Es wird Zeit, sich intensiver mit dem Thema Vertrieb zu beschäftigen.
Ich habe daher einen Vorschlag für einen Rahmenvertrag ausgearbeitet und
diesen Ivellio-Vellin vorgelegt.

Zu einem gewissen Teil bestimmt der Rahmenvertrag zwischen Entwicklung
und Vertrieb das eigentliche Vertriebsmodell dem Endkunden gegenüber.
Teilweise wird unser Vertrag auch durch die Lizenzsituation, unter der
Mercator steht, mitbestimmt: Mercator steht unter der GPLv3. Einen guter
Artikel zur Einführung, was diese Lizenz bedeutet, stellt
https://www.gnu.org/licenses/quick-guide-gplv3.html dar. Insbesondere
verlagert sich das Geschäftsmodell weg von Lizenzkosten zu Wartungs-,
Implementierungs-, Customizing- und Supportkosten. Diese Aspekte zu
vermitteln und insbesondere, die Vorteile, die diese Lizenz den Kunden
bringt, zu vermitteln, wird eine der Hauptschwierigkeiten in der
Erklärung des Preismodells sein.

Vermischtes
-----------

-   In den letzten 8 Tagen haben wir Mercator sowohl beim Ember.js
    Meetup, das wir noch selbst hosten, als auch beim Vienna-rb
    Meetup beworben.
-   Kleinere Unzulänglichkeiten im Produktmanager und in der Darstellung
    der Konversation wurden behoben
-   Die Autocompletion Funktion in der Konversation wurde verbessert,
    sie stellt nun bis zu 20 Suchergebnisse im Dropdown dar.
-   Es gibt nun einen Job zum Auffangen verwaister Produkte aus
    der Administration. Produkte sind dann verwaist, wenn sie keiner
    Kategorie mehr zugeordnet sind.
-   Die Produktanlage aus aus den Produktmanager wurde ermöglicht - hier
    hatten wir einen schlichten Designfehler in der Navigation: Der Link
    zur entsprechenden Aktion hat gefehlt.
-   Es gab eine Schwierigkeit in der Kombination der Verwendung von in
    place Editor und Typahead. Die Autocompletion wurde nicht
    korrekt dargestellt.
-   Der Upload mehrerer Files in der Konversation wurde mit einer
    Fortschrittsansicht versehen.

### Forschrittsanzeige beim Upload mehrerer großer Dateien

<hr/>
![Upload](/img/blog/upload.png){:style="max-width: 100%"}
<hr/>
