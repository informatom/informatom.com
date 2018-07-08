---
layout: post
title: Geld Geld Geld
date:   2015-02-09 08:00:00 +0200
---

## E-Payment

Diese Woche stand im Zeichen der Neuentwicklung der E-Payment
Schnittstelle. Wir hatten bereits vor Weihnachten vor, die E-Payment
Schnittstelle auf das SOAP Interface des Payment Providers umzustellen, erst diese Woche konnten wir die nötige Entwicklungszeit aufbringen. Es
geht uns dabei nicht um die Verwendung einer bestimmten Technologie, sondern um die Verbesserung der Qualität der Schnittstelle.

Sehen wir uns einen Zahlungsvorgang genauer an (es handelt sich um einen
Bazahlvorgang gegen das MPay24 Testsytem, die Daten sind also nicht
geheim ;-) ):

### 1. Bestellung bereit zur Zahlung

<hr/>
![Bestellung bereit](/img/blog/bestellung_bereit.png){:style="max-width: 100%"}
<hr/>

### 2. Die Eingabe der Zahlungsdaten

Wir können nun nicht nur den Betrag übergeben, sondern die Zahlung in
ihre einzelnen Positionen aufschlüsseln. Wir könnten auch die optische
Gestaltung dieser Seite ändern, halten aber eine klare optische Trennung
zwischen Mercator und dem Zahlungsprovider für sinnvoll und empfehlen
das auch unseren Kunden.

<hr/>
![Zahlung](/img/blog/zahlung.png){:style="max-width: 100%"}
<hr/>

### 3. Zurück in Mercator

In diesem Entwicklungssystem ist keine Erfolgsmeldung hinterlegt, die
Weiterleitung ist aber korrekt erfolgt, und Mercator erkennt, dass die
Bestellung bezahlt worden ist. Das geschieht dadurch, dass sich der
Status der Bestellung geändert hat, als MPay24 an Mercator eine
Zahlungsbestätigung übermittelt hat, die wir der richtigen Zahlung und
weiter der richtigen Bestellung zugeordnet haben. Zeitgleich wurde die
Bestellung an das ERP übermittelt.

Sollte die Bestätigung noch nicht angekommen sein, erkennt dies Mercator
ebenso, wartet fünf Sekunden und aktualisiert gegebenenfalls die Seite.
Bei einem abgebrochenen oder gescheiterten Bezahlungsvorgang wird die
Möglichkeit gegeben, eine neue Zahlung auszulösen. Gab es aus irgend
einem Grund eine Unterbrechung der Netzwerkverbindung zwischen der
Mercator Installation und dem Zahlungsprovider, können Bestätigungen zu
Bezahlungen auch manuell aus dem Administationsinterface angefordert
werden (siehe 2 Screenshots weiter unten: Link "Status bei MPay24
abfragen")

<hr/>
![zurüeck in Mercator](/img/blog/zurueck_in_mercator.png){:style="max-width: 100%"}
<hr/>

### Bestellungen aus Administratorsicht

Die Bestellungen können übersichtlich vom Vertrieb überwacht und
verwaltet werden.

<hr/>
![Administration Bezahlungen](/img/blog/admin_bezahlungen.png){:style="max-width: 100%"}
<hr/>

### Die bezahlte Bestellung

Die Bestellung wurde bezahlt. Wir gestatten Bestätigungen nur von den
von uns registrierten IP-Adressen des Zahlungsproviders. Es darf aber
auch nicht möglich sein, per
[IP-Spoofing](https://de.wikipedia.org/wiki/IP-Spoofing),
Bestätigungen auszulösen. Im Screenshot ist das entsprechende
Sicherheitsfeature zu erkennen: In der blauen Zeile in der Spalte
`User Field Hash` befindet sich ein Einmal-Token, das wir beim Auslösen
der Bezahlung an MPay24 übermitteln. Das gleiche Token sieht man in der
Bestätigungszeile unter `User Field`. Es wurde von MPay24 bei der
Bestätigung an uns zurück übermittelt.

<hr/>
![Bestellung bezahlt](/img/blog/bestellung_bezahlt.png){:style="max-width: 100%"}
<hr/>

### Eine Bestellung mit Zahlungsproblemen

Der Kunde hatte offensichtlich Probleme mit der Bezahlung, es gibt
unzählige Versuche, alle sind fehlgeschlagen.

Eine derartige unbezahlte Bestellung mit gescheiterten Zahlungsversuchen
wird täglich per E-Mail an die Vertriebsabteilung berichtet. Diese hat
damit de Möglichkeit, bei einer Bestellung von Relevanz mit den Kunden
Kontakt aufzunehmen und etwa eine andere Art der Bezahlung zu
vereinbaren.

<hr/>
![Zahlingsprobleme](/img/blog/zahlingsprobleme.png){:style="max-width: 100%"}
<hr/>