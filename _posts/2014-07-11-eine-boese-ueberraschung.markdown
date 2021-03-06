---
layout: post
title: Eine böse Überraschung
date:   2014-07-11 08:00:00 +0200
---

## Probleme mit Active Model Serializer

Nachdem dos Vertrageswesen komplett in Mercator integriert war und auf
des Demosystem importiert war, traten unvermittelt Probleme mit
sämtlichen Autocompletion-Feldern auf. Es wurde kein Drop Down
dargestellt, obwohl wir in den Debuggingkonsolen der Browser feststellen
konnten, dass nicht nur Abfragen zum Server, sondern auch auf den ersten
Blick richtige Daten rückgesendet wurden.

Dies war aber tatsächlich bei genauerer Analyse nicht der Fall. Mit der
Vertragskomponente wurde des Gem Active Model Serializer installiert,
das die Standard-Serialisierungsform für die gesamte Applikation ändert.
So wurden beispielsweise die Länder statt in der Form
\["Schweden","Schweiz"\] nun mit einem Root-Element in der Form

<code>{countries: ["Schweden","Schweiz"]}</code>

übertragen, was von der
Drop Down-Komponente nicht interpretiert werden konnte. Einen Fehler,
den wir so nicht erwartet haben, sodass die Diagnose ein Vielfaches der
Zeit der eigentlichen Behebung den Problems in Anspruch genommen hat.

### Ein funktionierendes Drop Down Feld
<hr/>
![Dropdown](/img/blog/dropdown.png){:style="max-width: 100%"}
<hr/>

Damit ist das Thema Vertragswesen abgeschlossen und bis auf Weiteres
auch der Ausflug in die Welt der clientseitigen Javascript Frameworks.

Ein kurzes Fazit: Für die Erstellung dieser einzelnen Applikation hat
sich das Erlernen von Ember.js wohl noch nicht ausgezahlt, wir haben
damit aber auch gleichzeitig unser Portfolio um Webapplikationen
erweitert, die ausschließlich clientseitig agieren und um solche, die -
so wie es Mercator jetzt tut - über eine clientseitige und eine
serverseitige Logikkomponente verfügen.