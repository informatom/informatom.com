---
layout: post
title: Das erste Schmuckstück
date:   2014-04-04 08:00:00 +0200
---

Es ist vollbracht: Mit der Schnittstelle ins ERP-System Mesonic
ist unser erstes Gem veröffentlicht:

-   Auf Rubygems: <https://rubygems.org/gems/mercator\_mesonic>
-   Auf Github: <https://github.com/informatom/mercator\_mesonic>

Mesonic Schnittstelle
---------------------

Das Modul hat gleich einiges an Funktionalität:

-   Das gesamte Modul befindet sich - bis auf die Erweiterung zweier
    Klassen - in einem eigenen Namensraum MercatorMesonic
-   Benutzerstämme (inklusive Kontaktestamm, Kontenstamm für
    Fakturierung und Finanzbuchhaltung) und Rechnungsadressen können
    angelegt oder auch aus Mesonic importiert werden. Hierzu haben wir
    unsere Adressen um eine c/o Zeile erweitert.
-   Kunden können in ihre offenen Rechnungen, alle Lieferungen und
    jemals getätigten Bestellungen Einsicht nehmen.
-   Artikel können rudimentär importiert werden (in Mesonic stehen keine
    Produktabbildungen oder fremdsprachigen Texte zur Verfügung) und
    aktualisiert werden.
-   Die benutzer- und gruppenspezifische Preisfindung ist implementiert,
    Listenpreise werden importiert in die Bestände von Mercator. Die
    gesamte Preisfindung ist nun "DRY". DRY steht für "don't
    repeat yourself". Jede Ermittlung eines Preises verwendet nun die
    selbe Methode, das heisst bei einer spätere Überarbeitung kann keine
    Stelle übersehen werden und jede Ermittlung wird
    konsistent erfolgen.
-   Bestellungen und Bestellpositionen werden nach Mesonic exportiert.
-   Texte aus Artikelstämmen werden durch solche aus
    Inventaren überschrieben.
-   Sämtlicher ERP-spezifischer Code ist im Gem ausgelagert und
    "verunreinigt" nicht die Applikation. Wir verwenden hierzu das
    in Rails 4 neu eingeführte Konzept der Concerns, bei dem für die
    Erweiterung einer Klasse um Klassenmethoden die Klasse nicht per
    dependendency Injection untergraben wird, sondern innerhalb eines
    Concerns erweitert wird.
-   In Rails erfolgt das Mapping zwischen Objekten und Datenbanken durch
    den Objekt-Relational-Mapper Activerecord klassenweise. Alle
    Verbindungen zu Tabellen, in die wir nicht schreiben wollen, sind
    ausschließlich lesend gemappt.
-   Empfehlungen zu ähnlichen Produkten werden importiert, ebenso
    Neuheiten, Topseller und Aktionen.
-   Bestände können inkrementell importiert werden, das bedeutet, dass
    nur die Änderungen gegenüber dem letzten Import übertragen und
    aktualisiert werden.
-   Am Demosystem schreibt die Schnittstelle nicht in ein ERP-System,
    dies wird mit dem Rollout zum ersten Referenzkunden aktiviert.

Legacy Importer
---------------

Im Zuge der Entwicklung der Schnittstelle haben war gleich eine weitere
Engine extrahiert: Die Klassen und Methoden zur Altdatenübernahme
befinden sich nun im Gem MercatorLegacyImporter.

Für beide Gems arbeiten wir nun in dedizierten Git-Repositories. Die
Demoinstanz wurde sogleich auf diese Gems umgestellt und funktioniert
weiterhin stabil. Damit haben wir eigentlich schon zwei Schmuckstücke.

Jobs
----

Wir haben nun auch einige Servicejobs geschrieben: Verwaiste Bestände
und Preise können wir per Rake Task löschen. Weitergehend können nun
Artikel automatisch deaktiviert werden, wenn sie nicht mehr über
Bestände verfügen. Ebenso können Kategorien im Produktkatalog
automatisch deaktiviert werden, wenn alle ihre Artikel inaktiv sind und
alle ihre Unterkategorien inaktiv sind.

Es werden ausschließlich aktive Artikel und Kategorien im Shop
dargestellt.

Diese Jobs wurden sogleich im Demosystem angewandt und funktionieren
einwandfrei.

Ausschnitt aus dem Joblog, der erste Job \#3940 ist gescheitert, er ist
nicht durch eine Endmeldung abgeschlossen:

    I, [2014-05-04T16:23:48.532997 #3940]  INFO -- : ==================================================
    I, [2014-05-04T16:23:48.533091 #3940]  INFO -- : Started Job: icecat:metadata:import_daily
    I, [2014-05-04T16:24:35.170422 #3964]  INFO -- : ==================================================
    I, [2014-05-04T16:24:35.170511 #3964]  INFO -- : Started Job: icecat:catalog:download_daily
    I, [2014-05-04T16:24:35.951602 #3964]  INFO -- : Finished Job: icecat:catalog:download_daily
    I, [2014-05-04T16:24:35.951706 #3964]  INFO -- : ==================================================
    I, [2014-05-04T16:24:55.809280 #3994]  INFO -- : ==================================================
    I, [2014-05-04T16:24:55.809366 #3994]  INFO -- : Started Job: icecat:metadata:import_daily
    I, [2014-05-04T16:24:55.857106 #3994]  INFO -- : Metadatum CHP113 updated.
    I, [2014-05-04T16:24:55.879306 #3994]  INFO -- : Metadatum Q6496A updated.
    I, [2014-05-04T16:24:55.896156 #3994]  INFO -- : Metadatum C9360AE updated.
    I, [2014-05-04T16:24:55.912482 #3994]  INFO -- : Metadatum C4814AE updated.
    I, [2014-05-04T16:24:56.004722 #3994]  INFO -- : Metadatum Q6003A updated.
    I, [2014-05-04T16:24:58.544765 #3994]  INFO -- : Metadatum U4QV8E updated.
    I, [2014-05-04T16:24:58.556298 #3994]  INFO -- : Metadatum U1RH7PE updated.
    I, [2014-05-04T16:24:58.570898 #3994]  INFO -- : Metadatum U0SW1PE updated.
    I, [2014-05-04T16:24:58.580056 #3994]  INFO -- : Metadatum U4NS7E updated.
    I, [2014-05-04T16:24:58.601706 #3994]  INFO -- : Metadatum F6X25EA created.
    I, [2014-05-04T16:24:58.628970 #3994]  INFO -- : Metadatum G7Z49A created.
    I, [2014-05-04T16:24:58.652549 #3994]  INFO -- : Metadatum G7Z52A created.
    I, [2014-05-04T16:24:58.674400 #3994]  INFO -- : Metadatum G7Z50A created.
    I, [2014-05-04T16:24:58.694974 #3994]  INFO -- : Metadatum G7Z54A created.
    I, [2014-05-04T16:24:58.713625 #3994]  INFO -- : Metadatum G7Z53A created.
    I, [2014-05-04T16:24:58.734259 #3994]  INFO -- : Metadatum G7Z51A created.
    I, [2014-05-04T16:24:58.757422 #3994]  INFO -- : Metadatum G7Z48A created.
    I, [2014-05-04T16:24:58.781183 #3994]  INFO -- : Metadatum G7Z56A created.
    I, [2014-05-04T16:24:58.783294 #3994]  INFO -- : Finished Job: icecat:metadata:import_daily
    I, [2014-05-04T16:24:58.783356 #3994]  INFO -- : ==================================================

weitere Features
----------------

Bestände können nun auch unendlich sein, damit sind nicht
bestandsgeführte, beliebig verfügbare Artikel wie Lizenzen abbildbar.

Wir haben einen Migrationsversuch von Twitter Bootstrap 2.3.2 zu Version
3 gestartet. Schnell hat sich jedoch gezeigt, dass sich der Aufwand
nicht nur auf die in Tutorials angegebenen Updateschritte beschränkt.
Wir haben das Update daher auf unbestimmte Zeit verschoben.