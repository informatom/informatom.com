---
layout: post
title: Schnittstellengeschnetzeltes
date:   2014-03-31 08:00:00 +0200
---

## Schnittstelle zu Mesonic

Die letzte Wochen stand im Zeichen der ersten Schnittstelle. Es geht um
die Anbindung an das ERP-System Mesonic (<http://www.mesonic.at/>), das
von zwei Referenzkunden und von einigen potentiellen Kunden eingesetzt
wird, da Ivellio-Vellin auch Vertriebspartner von Mesonic ist. Diese
Schnittstelle besteht im Kern aus einer Schnittstelle zu einem Microsoft
SQL Server 2013.

Obwohl wir die Nomenklatur der Datenbankstruktur kennen - die Benennung
von Tabellen und Spalten ist nicht sprechend - benötigen wir zunächst
einen komfortablen Datenbankbrowser, den wir uns als getrennte Hobo
Applikation generieren. Dies gelingt innerhalb zweier Tage, womit wir
sicher sind, dass wir die Schnittstelle zur Datenbank implementieren
können, in der wir nur auf etwa 10 Tabellen zugreifen werden. Die
generierte Applikation greift auf alle Spalten aller Tabellen des ERP zu
und zeigt dabei keine Performance Probleme.

Die Testsysteme auf den Rechnern der Entwickler befindet sich zwei
SSH-Tunnel und damit drei Network-Hops vom Datenbankserver entfernt, die
Datenübertragung ist dennoch ausreichend schnell, die Latenz gering
genug. Produktivstysteme werden sich stets nur einen Hop vom
Datenbankserver des ERP-Systems entfernt befinden, damit wird die Latenz
grob gedrittelt.

Wir haben kleine Probleme mit der automatischen Generierung der
Datenbankmigrationen von Hobo erlebt, konnten diese aber ohne fremde
Hilfe durch lesen des Quellcodes beheben. Hier kam uns die Open Source
Lizenz und Natur von Hobo zu Gute.

Es geht nun in Folge an die Implementierung der Schnittstelle in die
Applikation. Zielsetzung ist, die Schnittstelle so modular zu gestalten,
dass sie nicht nur ein- und ausgeschaltet werden kann, sondern, dass sie
nicht mal installiert werden muss, sollte ein anderes ERP-System
eingebunden werden. Dazu gibt es in Ruby on Rails das Konzept der
Engines, das sind im Prinzip eigenständige Applikationen, die sich in
eine Applikation einklinken lassen. Leichte Sorge bereitet uns, dass
Hobo zwar selbst eine Engine darstellt, die Einbindung weiterer Engines
aber in der Dokumentation aber nicht erwähnt wird.

In weiterer Folge sind diese Engines in sogenannte Gems verpackbar,
vielleicht am besten als Softwarepaket beschreibbar. Diese Gems lassen
sich dann einfach etwa auf den Plattformen Rubygems und Github
publizieren und auf Servern installieren. Dabei werden
Versionsabhängigkeiten überprüft.

Wir machen also jetzt den Sprung von der Entwicklung einer relativ
großen, aber doch einzelnen Applikation, in die einer Software- und
Servicearchitektur aus Anwendung und Gems. Unsere Gems werden aber nicht
als eigenständige Services lauffähig sein, dieser Aufwand rechnet sich
für uns nicht.

Cobrowsing
----------

Auch an anderen Stellen geht die Entwicklung weiter, das Cobrowsing
erfolgt nun für den Benutzer weniger aufdringlich, in dem eine Animation
den Darstellungsbereich flüssig ein- und ausblendet.

Wir arbeiten daran, die Beratungssituation für den Benutzer angenehmer
zu machen: Zum Beispiel mit einem Photo des Beraters. Bei der
Implementierung sind wir auf einen Bug in der Codegenerierung Hobos für
Sidebars gestoßen, den wir eingemeldet haben. Wir müssen nicht auf eine
Behebung warten, da wir mit dem Debugging auch sofort einen Workaround
gefunden haben, der vermutlich in die Codebasis von Hobo einfließen
wird.

Rabatte
-------

Bestellpositionen haben nun einen Positionsrabatt, der aus dem Rabatt
der Angebotsposition ermittelt wird. Für Komplettangebote gibt es auch
einen Kopfrabatt. Zu klären ist hier noch das Verhalten bei Kopie in
eine Bestellung.

Der Kunde kann nun die Lieferart vor der Zahlungsart auswählen. - Sie
steht bei ihm im Vordergrund. Die Versandspesen wurden nicht immer
korrekt ermittelt, dieses Fehlverhalten ist nun behoben.

Die Pflege seiner Adressen wunde für den Kunden nun deutlich
vereinfacht, er hat eine übersichtliche Darstellung aller seiner
Adressen in seinem Benutzerprofil.

Upselling
---------

Im Warenkorb besteht nun für den Kunden eine einfache Möglichkeit des
Upsellings: Jeder Artikel, für den passendes Zubehör bestellt werden
kann, hat im Warenkorb einen Button, über den dieses Zubehör ohne
Seitenwechsel eingeblendet und auch unmittelbar bestellt werden kann.

Komponenten
-----------

Wir haben im Zuge dieser Besprechung einen Blick auf die aktuelle
Architektur von Mercator geworfen. Die Anzahl der verwendeten
Technologien, Sprachen, Bibliotheken und Services hat uns selbst
überrascht.

### Architekturdiagramm

Um den Überblick zu behalten, die Darstellung in Form eines Diagramms:

<hr/>
![Mercator Architektur](/img/blog/Mercator_Architektur.png){:style="max-width: 100%"}
<hr/>
