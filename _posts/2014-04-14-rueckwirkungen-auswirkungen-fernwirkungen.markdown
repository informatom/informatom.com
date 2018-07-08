---
layout: post
title: Rückwirkungen, Auswirkungen, Fernwirkungen
date:   2014-04-14 08:00:00 +0200
---

## Icecat

In der letzten Woche haben wir ein weiteres Gem entwickelt, es dient zum
Import von Produktstammdaten (und Bildern) aus der Produktdatenbank
Icecat (<ttp://icecat.at/>).

Wir importieren nun folgende Daten komplett oder auch inkrementell
(Icecat stellt Änderungen tagesaktuell zum Download zur Verfügung):

-   Produktnamen, Produkteigenschaften, Eigenschaftsgruppen,
    mehrsprachige Beschreibungstexte, Garantieinformationen,
Einige Zeit haben uns Probleme beim XML-Import gequält. Zunächst schien
es so, als käme der von uns verwendete XML-Parser Nokogiri mit
Dokumenten ab einer gewissen Größe nicht mehr klar.

Das Einlesen der Dateien kam zu keinem Ende. Nokogiri liest Daten
zunächst komplett ein und baut dann die Datenstruktur im Speicher auf.

Wir haben ihn gegen den Parser Saxerator, der zeilenweise agiert, getauscht,
woraufhin das Problem klar wurde. In den insgesamt 1.2 GB
Daten, die wir gelesen haben, fanden sich ganze acht Zeichen, die nicht
Unicode standardkonform waren. Erst das Entfernen dieser Zeichen führte
zum Erfolg: Knapp über 1000 Eigenschaftenkategorien, 1600 Eigenschaften,
und knapp über 100 000 Werte sind erfolgreich geparst und importiert.

1.  Wir lesen dabei zunächst den Katalog aller verfügberen Produkte der
    angebotenen Marken ein.
2.  Im nächsten Schritt vergleichen wir die tatsächlich geführten
    Artikel und kennzeichnen sie.
3.  Schritt 3 ist der Download der Metadaten zu diesen Produkten.
4.  Schritt 4 parsen wir diese und speichern die Daten in unserer
    Datenbank.

    Dieser Schritt zerlegt sich wieder in einige Unterschritte:

    1.  Aktualisierung der Texte
    2.  Aktualisierung der Bilder
    3.  Eigenschaften, Eigenschaftengruppen und Werte
    4.  Produktrelationen.

Wir halten uns an die Strukturen, die in in Icecat vorgegeben sind und
ignorieren, dass wir Eigenschaftengruppen gleicher Namen zusammenfassen
könnten. Dies wird uns später bei der Filterung helfen.

Nun hatten wir ein Problem mit dem Handling von Namespaces in Hobo
Modellen und Controllern und jenem in Engines. Hier schien eine
generelle Inkompatibilität vorzuliegen und wir haben wieder den Hobo
Maintainer in Spanien kontaktiert. Dieser zeigte sich verwundert, räumte
aber ein, dass diese Inkompatibilität bestehen könnte. Nun waren wir
angespornt, der Sache auf den Grund zu gehen, mit dem Ergebnis, dass es
eine kleine Unverträglichkeit gibt, diese sich aber nur im Bereich der
Erzeugung der Views mittels DRYML befindet. Wenn wir für die Modelle in
der Engine die Views explizit schreiben und nicht erzeugen lassen, sind
wir voll kompatibel.

Zusammengefasst bedeutet dies nur einen minimalen Mehraufwand (etwa 3
Prozent der Entwicklungszeit) in der Engine, und wir können weiterhin
alle Komponenten nach Wunsch kapseln.

Die Entwicklungen wurden selbstverständlich wieder auf das Demosystem
übertragen und laufen nun dort im Produktivmodus von Ruby On Rails. Wir
haben auch wieder ein Gem erstellt und dieses auf Github und Rubygems
publiziert.

Deployment Szenario
-------------------

Mit der Zunahme der Anzahl der Komponenten nimmt auch der Aufwand für
des Ausbringen auf die einzelnen Entwicklungsmaschinen und das
Demosystem höher. Wir haben unterschiedliche Verfahren evaluiert und
schwanken nunmehr zwischen zwei Varianten: Capistrano
(<http://capistranorb.com/>) und Whiskey Disk
(<https://github.com/flogic/whiskey\_disk>). Capistrano ist ein mächtiges
Automatisierungswerkzeug, das auch Deployment beherrscht und einiges an
Lernaufwand voraussetzt. Whiskey Disk ist viel einfacher, dafür auch
schneller zu lernen. Wir vertagen die Entscheidung, noch ist der
Leidensdruck nicht groß genug ;-) .

Dedizierter STUN/TURN Server
----------------------------

Wir wollten zur Initiierung der Videochatverbindungen auf unseren
eigenen dedizierten STUN/TURN Server umsteigen, die Installation machte
allerdings größere Probleme als erwartet, sodass wir weiterhin ein
externes Service verwenden.

Der Messaging Server läuft nun in einer dedizierten virtuellen Maschine
auf einer getrennten und dedizierten Subdomain
http://faye.informatom.com auf Port 80, um den in einem früheren Bericht
genannten Problem der eingeschränkten Netzneutralität in Firmennetzen
vorzubeugen. Die an und für sich rasche und problemlose Installation
hatte zwei Stunden Debugging zur Folge. Ein DNS-Problem, das wir
zunächst bei uns geglaubt hatten, lag beim Telekom Anbieter. Es war
überraschend zu sehen, die die DNS-Auflösung jeweils ca. 5 Sekunden
funkionierte, dann ebensolange wieder scheiterte.

Mesonic Schnittstelle
---------------------

-   Zahlungsarten und Versandkosten sind nun kundenspezifisch (beim
    Zurückenden der Zahlungsart gibt es aber noch ein Problem).
    Zusätzlich haben wir eine Installationsanleitung für die
    Schnittstelle geschrieben.
-   Der Updatejob der Bestände wurde deutlich beschleunigt und erfolgt
    am Demosystem automatisch.
-   Vor jedem Job findet nun ein Test der Netzwerkverbindung zum
    ERP-System statt.
-   Die einzelnen Schritte aller Jobs loggen wir nun in ein Joblog, aus
    dem unmittelbar erkennbar ist, ob Jobs abgebrochen sind.

Das aktuelle Datenbankschema
----------------------------

Zur Evaluation haben wir uns das aktuelle Datenbankschema genauer
angesehen und auch grafisch dargestellt:

<hr/>
![ERD](/img/blog/Mercator_ERD_incl_Gems.png){:style="max-width: 100%"}
<hr/>

Diverse Änderungen
------------------

-   Ein Update der Attachment und Asset- Komponente Paperclip zwingt uns
    nun dazu, die erlaubten hochladbaren Dateitypen zu deklarieren.
-   Verwaiste Accounts werden nun automatisch gelöscht.