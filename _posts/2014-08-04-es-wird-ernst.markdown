---
layout: post
title: Es wird ernst
date:   2014-08-04 08:00:00 +0200
---

## ERP-Schnittstelle im Echtbetrieb

Zum ersten Mal betreiben wir des System gegen ein produktives
ERP-System. Das Anlegen und Modifizieren von Daten will also nun wohl
überlegt sein. Vorweg genommen, alle Modifikationen im ERP-System sind
erfolgreich.

Beim ERP System handelt es sich um ein Mesonic-System, wir kommunizieren
unmittelbar mit der zugrunde liegenden Datenbank, einem Microsoft SQL
Server. Wir verwenden als Datenbankadapter das Activerecord
SQLAdapter-Gem
(<https://github.com/rails-sqlserver/activerecord-sqlserver-adapter>) mit
dem wir in allen Tests bislang gute Erfahrungen gemacht haben.
Allerdings waren auch alle Schreibtests aus Rails 3.x Systemen. Und
prompt gibt es Schwierigkeiten. Activerecord-SQLAdapter ist eigentlich
nur der Vermittler zwischen dem Rails Modul Activerecord und dem Ruby
Datenbanktreiber Addon TinyTDS
(<https://github.com/rails-sqlserver/tiny\_tds>), was die Abstraktion
erhöht, das Debuggen aber erschwert.

Ein Blick in die Github Issues zum Gem rettet uns schließlich, andere
Entwickler haben bereits das selbe Problem erfahren und einen Workaround
entwickelt, den auch wir erfolgreich einsetzen können.

Weiteres
--------

Da wir zunächst gehofft hatten, nur einen Versionskonflikt der
beteiligten Komponenten vor uns zu haben, haben wir nun auch alle
Systemkomponenten auf Letztstand gebracht, voraussichtlich zum
vorletzten Mal vor dem Produktivstart.

Konkret können wir nun Accounts aus Mercator nach Mesonic übertragen,
für Mesonic gesprochen bedeutet dies, dass wir einen Interessent
anlegen.

Wir laden allgemeine, gruppen- und personenspezifische Preise und
Versandkosten. Weiters importieren wir den aktuellen Stand der
Rechnungsadressen.

Ein etwas merkwürdiger Fehler im Berechtigungswesen lässt uns kurz an
uns selbst zweifeln: Je höher die Rolle in Mercator, desto geringer
hatten wir die Berechtigung vergeben.

Darüber hinaus machen wir eine Menge Performancetests und sehen keine
Probleme diesbezüglich für den Produktivbetrieb auf uns zu kommen.

Das installierte System reagiert nun korrekt auf die Aufrufe der zum
Einsatz kommenden Domains für Shop und Webseite der Firma, auch die
gewünschten Weiterleitungen funktionieren.

Obwohl wir mit dem System bereits hinter einer Firewall geschützt sind,
konfigurieren wir auf der virtuellen Maschine selbst eine solche, vor
allem als Referenz für zukünftige Systeme, die unmittelbar ungeschützt
mit dem Internet verbunden sind. Auch alle Entwicklungssysteme erhalten
eine analoge Firewallkonfiguration. Diese weniger aus
Sicherheitsgründen, sondern um alle verwendeten Netzwerkverbindungen zu
alle Fremdsystemen zu testen (die da sind: ERB, Produktdatenbank,
Zubehörkatalog, Messagingserver, Suchmaschine)

Um Logfiles in handlichen Größen zu halten, verwenden wir ab jetzt auf
allen Systemen Logfilerotation. Das bedeutet, dass im Tages- oder
Wochentakt neue Logfiles erstellt werden und die alten komprimiert
werden, um Festplattenplatz zu sparen (Logfiles lassen sich aufgrund
Ihrer Natur als reine Textfiles gewöhnlich um einen Faktor 10
komprimieren).

#### Typisches Log-Verzeichnis

<hr/>
![Logfile Rotation](/img/blog/logfile-rotation.png){:style="max-width: 100%"}
<hr/>
