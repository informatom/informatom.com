---
layout: post
title: Kundenfeedback und Datenimport
date:   2014-02-10 08:00:00 +0200
---

Eine ausführliche Besprechung für den ersten Referenzkunden vor
zwei Wochen zeigt, dass wir dringend Echtdaten benötigen. Wir ziehen
also das Erstellen von Importscripts vor. Nicht nur wird damit
Entwicklungszeit benötigt, wir sehen auch, dass die bestehende
Legacy-Datanbank keineswegs in sich konsistent ist.

Damit haben wir nun Importscripts für alle relevanten Modelle (Produkte, Kategorien, Kategorisierungen, Eigenschaften, Bildimport, Assets, Anhänge, Webseiteelemente, Websitestruktur, Länder, Webseitenvorlagen, Produktübersichten, Zubehöre, Produktrelationen, Empfehlungen und alle
Übersetzungstabellen) und ein Konzept, weitere Datenbanken anzubinden, Daten auch inkrementell importieren zu können: Wir merken uns stets den
primären Schlüssel des originären Datensatzes in der Quelldatenbank als
legacy\_id in unserer Datenbank. Die Bezüge zu den alten Datensätzen
bleiben also erhalten. Unser Kategorisierungsmodell erweitern wir um
Bilder, der Upload mehrerer Tausend Bilder mittels wget und Paperclip
klappt problemlos.

Das Datenmodell für die CMS-Komponente aus Vorlagen, Webseiten und
Webseitenelementen steht. Es ist sehr einfach, ermöglicht aber beliebige
Spezialitäten, da der Inhalt der Elemente unverändert gerendert wird.
Der Websiteentwickler des Kunden hat damit aber auch eine große
Verantwortung zu tragen. Es wird Kunden zu vermitteln sein, dass sie für
den Inhalt auf den Webseiten auch selbst verantwortlich sind (Tracking
Cookings, Einbettung von Javascript, etc.)

Wir haben nun alle kundenspezifischen Konfigurationseinstellungen, die
nicht in der Datenbank liegen, in eine Konfigurationsdatei ausgelagert, um die Software auf Github gemäß unserer Lizenz veröffentlichen zu
können. Diese Veröffentlichung führen wir sogleich durch, auch wenn wir
bislang nur über einen Prototypen verfügen. "Release early, release
often" soll unser Motto sein. Wir integrieren Github in unseren
Versionierungsworkflow.

Wir aktualisieren Ruby auf Version 2 und Ruby On Rails auf Entwicklungs-
und QA-System. Wir bleiben bei Ruby On Rails aber natürlich innerhalb
der 3.2.x Linie (aktuell 3.2.16).

In unserer Kombination aus mehrsprachiger Webseite und Seite mit
Subsites (siehe eines der letzten Protokolle zum Thema Admin-Subsite)
gibt es einen Fehler in einem Feature Hobos, das während der
Entwicklungszeit hilft, dem "Benutzerwechsler". Diesen Fehler
beheben wir und veröffentlichen den Code dem Hobo-Projekt gegenüber.

Durch den Datenimport sind wir weiter im Rückstand gegenüber dem
Projektplan. Die Aufgaben wurden aus dem Modul der
Referenzkundenimplementierungen vorgezogen.

Der vollständig vorhandene Produktkatalog aus knapp 4000 Produkten und
80000 Produkteigenschaften macht einen sehr guten Eindruck. Wir spüren
den Stolz des verantwortlichen Entwicklers und freuen uns mit ihm.

### Update

Der Importer ist nun ein eigenes Gem namens mercator\_legacy\_importer, publiziert unter:
https://github.com/informatom/mercator\_legacy\_importer und
https://rubygems.org/gems/mercator\_legacy\_importer
