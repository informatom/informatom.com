---
layout: post
title: Erntezeit
date:   2014-03-03 08:00:00 +0200
---

In Anbetracht der letzten Wochen, in denen wir kontinuierlich
gegenüber dem Zeitplan zurückgefallen sind, scheinen die letzte Woche
wie ein Wunder.

An allen Fronten gibt es große Fortschritte. Was in den letzten Wochen
an Recherche und Lernen investiert wurde, konnte nun geerntet werden:

Guided Selling Modul
--------------------

-   Für das Guided Selling Modul wurde die
    Beratungssubseite konfiguriert. Hier gewinnen wir damit eine
    Vereinfachung der Konfiguration der Berechtigungen von
    Vertriebsmitarbeiter, Vertriebsleiter und Kunde.
-   Die einzelnen Beratungssessions sind nun im Modell
    Konversationen abgelegt. Innerhalb einer Beratungssession
    funktioniert nun Textchat, Upload von Bildern, Produktempfehlung und
    Produktvergleich, -   Beratungssicht und Kundensicht sind ähnlich, aber aus
    Sicherheitsgründen als zwei Sichten ausgeführt, jeweils mit einer
    Controller-Aktion in der entsprechenden Subsite.
-   Downloads für Bilder (inklusive Generierung von Thumbnails) und
    beliebige Dokumente sind implementiert.
-   Der Videochat per WEBRTC funktioniert stabil Peer to Peer. Es wird
    damit keinerlei Serverlast bei uns erzeugt, die Kommunikation
    erfolgt auf direktem Weg zwischen den beiden beteiligten Computern,
    was auch die Latenz der Verbindung auf ein Minimum reduziert.
-   Textnachrichten und Chat sind implementiert.
-   Für die Darstellung zusammengehörender Elemente haben wir DRYML-Tags
    definiert, mit denen wir den Quellcode der eigentlichen Ansichten
    kompakt halten.
-   rudimentäre Angebote können gelegt (aber noch nicht angenommen)
    werden
-   Die Anzahl der Anmeldungen und der Anmeldezustand jedes einzelnen
    Benutzers werden erfasst, um Kundenbetreuer zuordnen zu können.
-   Wir haben nun ebenfalls die automatische Aktualisierung der
    Beratungssichten per Ajax-Pull Mechanismus. Hier zeigt sich eine
    Sättigung eines Prozessor-Cores bei etwa 20 Benutzern bei
    Aktualisierung alle 3 Sekunden. Wir aktualisieren dabei nur den Teil
    der Seite, in dem sich Inhalte geändert haben. Konkret sind dies die
    Textnachrichten, Downloads und Angebote.

### Screenshot einer Beratungssession


<hr/>
![Beratung](/img/blog/beratung.png)
<hr/>

Basisshopmodul
--------------

Auch in der Basis gibt es große Fortschritte:

-   Treeviews wurden mit Status Icons versehen. Dazu wurden
    Hilfsfunktionon für vektorbasierte Fontawesome-Icons geschrieben.
    Die Baumansichten wunden damit wesentlich übersichtlicher.
-   Staffelpreise sind nun implementiert
-   Die Editiersicht des Warenkorb wurde erstellt
-   Diverse Übersetzungen wurden durchgeführt
-   Der Kunde kann nun Produkte vergleichen, der Vergleich ist
    allerdings nicht sonderlich performant, werden mehrere Produkte
    verglichen, die jeweils über 100 Eigenschaften aufweisen. Hier haben
    wir vermutlich eine Designschwäche im Datenmodell,
    Produkteigenschaften sind derzeit nicht produktübergreifend und
    müssen daher für den Aufbau der Vergleichstabelle iterativ
    verglichen werden.
-   Für Gäste der Webseite werden automatisch User in der Datenbank
    erzeugt, um alle gesetzten Aktionen tracken zu können.
-   Der Benutzeraktivierungsprozess wurde dazu angepasst.
-   Temporär generierte, aber nicht verwendete Accounts und deren
    Warenkörbe werden automatisch per Cron-Job aufgeräumt.
-   Alte und neue Warenkörbe werden automatisch zusammengeführt. Der
    betroffene Kunde wird per Flash-Message davon benachrichtigt.
-   Benutzer können eine Rechnungsadresse und beliebig viele
    Lieferadressen angeben und letztere auch selbst verwalten.
-   Der Produktkatalog verfügt nun über eine Kategorienansicht und
    eine Produktansicht.
-   Benutzer können Produkte aus der Detailansicht eines Produktes und
    aus der Kategoriensicht in den Warenkorb legen.
-   Webseiten unterliegen nun einem Publishing Lifecycle, d.h. sie
    können deaktiviert und wieder aktiviert werden.
-   Für effiziente Navigation wurde eine kompakte Kategoriennavigation
    geschrieben, die an jeder Stelle der Applikation verwendet
    werden kann.
-   Benutzer können Ihren eigenen Account verwalten.
-   Einige kleinere Korrekturen im Berechtigungswesen
    wurden durchgeführt.
-   Page Templates werden von den Webseiten unmittelbar ohne dazwischen
    liegende Layouts verwendet.

Zum Darüberstreuen haben wir noch einen Vortrag zum Thema Hobo mit
einigen Verweisen auf Mercator beim Ruby Meetup Wien gehalten, der gut
aufgenommen worden ist. Grundtenor war auch hier: Und warum verwenden so
wenige Ruby On Rails Entwickler Hobo?

Die Folien zur Presentation haben wir veröffentlicht unter
<http://informatom.com/presentations/hobo/index.html>

Entsprechend zum großen Fortschritt ist auch die Stimmung unter den
Projektmitgliedern gestiegen. Hoffentlich geht es so weiter!