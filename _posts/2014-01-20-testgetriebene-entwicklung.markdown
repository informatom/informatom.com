---
layout: post
title: "Testgetriebene Entwicklung"
date:   2014-01-20 08:00:00 +0200
---

Wir halten uns an den Vorsatz, ausschließlich testgetrieben zu
entwickeln. Wir bemerken die zu erwartende höhere Entwicklungzeit.
Erwarten aber auch, dass sich die nun investierte Zeit wieder rechnen
wird.

Es wurden bereits erste Fehler durch die automatischen Tests gefunden, die sonst erst
zu späterer Projektzeit gefunden worden wären.

Haben einzelne Programmierer bereits früherer mittels BDD (behaviour
driven development) end-to-end Tests geschrieben, die recht aufwändig
ausgefallen sind und zu beträchtlicher Laufzeit eines automatischen
Testlaufs geführt haben, bleiben wir derzeit bei Unit Tests auf der
Modellebene. Die Tests sind klein, testen jeweils nur genau einen Aspekt
des Modells. Es sind viele, sie laufen aber auch sehr schnell durch (die
ersten 100 Tests in rund 7 Sekunden).

Das Scaffolding mit Hobo funktioniert gut, bei jeder Abweichung merken
wir aber auch noch die mangelnde Erfahrung mit DRYML.

Für die Baumstrukturen haben wir nun eine Drag and Drop Komponente
entwickelt, die in der Hobo Entwickler-Community gut aufgenommen wurde.
Wir haben hier für uns zum ersten Mal zwei Javascript Bibliotheken
(Messenger.js und JQuery Nestable) in und mit Hobos DRYML integriert.
Die Integration war erfreulich unproblematisch und wir haben nun eine
Baumstruktur, die von ihrer Bedienbarkeit und ihrem Aussehen her absolut
Enduser-tauglich ist. Die Veröffentlichung als Gist findet man [hier]
(https://gist.github.com/haslinger/7776874/a068b4e7ef84371f5a3c1fdcc363abfd3a42e104).
Gists sind kleine Code-Repositories zur Veröffentlichung von Anleitungen
auf [Github](https://gist.github.com/).

Wir entwickeln zu unserer eigenen Überraschung bereits zwei DRYML-Stile:

-   Manche Entwickler schreiben Views in DRYML und verwenden diese dann
    wie ERB-Views.
-   Die anderen schreiben und überschreiben DRYML Tags, die in den
    automatisch generierten Views gezogen werden.

Wir sind unschlüssig, welchen Stil wir bevorzugen wollen, der erste
scheint für speziellere Aufgaben geeigneter, der zweite für
wiederverwendbare Komponenten. Beinahe jeder lernt täglich neue
Komponenten von DRYML hinzu.

DRYML ist von seiner Mächtigkeit her beinahe erdrückend. Es erscheint in
manchen Situationen aber bereits verwunderlich, wie wir ohne DRYML
auskommen konnten.

Hobo ist stabil, weitere aufgetauchte Fragen zu Unklarheiten wurden von
der Hobo Community stets innerhalb zweier Tage beantwortet.