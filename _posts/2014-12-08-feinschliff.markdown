---
layout: post
title: Feinschliff
date:   2014-12-08 08:00:00 +0200
---

Wir haben mal wieder eine Woche hinter uns, in der wir an vielen
Fronten kleine Verbesserungen durchgeführt haben.

Produktmanager
--------------

### Editieren der Kategorien im Produktkatalog

<hr/>
![katalog](/img/blog/katalog.png){:style="max-width: 100%"}
<hr/>

-   Die wesentlichen Felder der Kategorien sind nun unmittelbar im
    Produktkatalog editierbar.
-   Insbesondere der Status der Kategorie ist nun per Dropdown Feld
    editierbar.<br/>
    Das ist insofern bemerkenswert, als dies von Hobo Seite für den
    Status eines Modells explizit unterbunden wird. Es war uns aber
    durch Studium des Hobo- und des Rails-Quellcodes möglich, dieses
    Verhalten aufzuheben. Es ist dies wieder ein Fall, in dem uns die
    Lizenz der Frameworks als quelloffene Software unmittelbar zu Gute
    gekommen ist.
-   Darüber hinaus kann ein Produkt in eine andere Kategorie des
    Produktkataloges per Drag and Drop (siehe Screenshot, rechts oben)
    verschoben werden. Dabei wird die Kategorisierung gesucht, die zur
    Darstellung des Produktes in der Liste der Artikel geführt hat und
    die Kategorie geändert. Alle anderen Kategorisierungen des Produktes
    bleiben unberührt.
-   Die Liste der Produkte hier stellt nun standardmäßig auch nur die
    aktiven Produkte dar. Der Filter kann entfernt oder in der
    erweiterten Suche der Liste userspezifisch auf andere Stati
    gesetzt werden.

Vermischtes
-----------

-   Ein Referenzkunde hat völlig zu Recht gemeint, dass, wenn Mercator
    die Preise aus einem ERP-System importiert, diese im
    Administrationsbackend nicht editierbar sein dürfen. Wir haben nun
    eine Einstellung in der Administration eingeführt, mit der
    entschieden werden kann, ab Preise editierbar sein sollen
    oder nicht.

### Das ERP führt, die Preise sind in diesem System nicht mehr editierbar, die Bestände nur mehr beschränkt.

<hr/>
![Editierbarkeit](/img/blog/editierbarkeit.png){:style="max-width: 100%"}
<hr/>

-   Mit der Übersetzung der Administrationsoberfläche haben wir
    begonnen, die Lösung scheint aber nicht stabil.
-   In einem Referenzsystem haben wir eine Änderungen in der Navigation
    und bei den Vorlagen für die Webseiten durchgeführt.
-   Der Produktvergleich wurde neu gestaltet.
-   Im Job, der aus einer fremden Datenbank Zubehörinformationen
    einliest, kam es zu einem Problem, wenn eine Datei leer war. Dieser
    Fehler ist nun abgefangen.
-   Das Logging aller Jobs ist nun weniger "noisy", wir loggen
    weniger Erfolgsmeldung (und dafür mehr Fehlerfälle).
-   Alle Überschriften aller Administrationsseiten sind nun einheitlich.
-   In der Benutzerverwaltung haben wir die Rolle des Produktmanagers
    eingeführt, der die Produkt- und Kategorienpflege durchführen kann.
    Bisher war das nur mit vollen Administrationsrechten möglich.
-   Die Preisbestimmung für die Suchmaschinenindizierung scheiterte
    manchmal beim Import der Daten. Wir haben nun einen Dummy-User
    eingeführt, mit dem die Preisbestimmung verlässlich durchgeführt
    werden kann.
