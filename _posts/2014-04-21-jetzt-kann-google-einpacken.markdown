---
layout: post
title: Jetzt kann Google einpacken
date:   2014-04-21 08:00:00 +0200
---

Zugegeben, die Formulierung ist übertrieben, aber Mercator wird
nun von einer Suchmaschine beschleunigt:

Facettet Search mit Elastic Search
----------------------------------

<hr/>
![Facetted Search](/img/blog/facetted_search.png){:style="max-width: 100%"}
<hr/>

Wir verwenden die lokal installierte Suchmaschine Elastic Search um eine
schnelle Filterung von Artikeln nach Produkteigenschaften zu
ermöglichen. Auf Ruby On Rails Seite verbinden wir die zu indizierenden
Modelle mit der Bibliothek Searchkick mit Elasticsearch. Wir indizieren
zu jedem Produkt aus den Tabellen der Produkteigenschaften und der Werte
die entsprechenden Ausprägungen der Daten in einen Index.

Parallel dazu merken wir uns pro Kategorie die Namen aller Eigenschaften
aller Artikel der Gruppe und die Namen der zugehörigen
Eigenschaftsgruppen.

Navigiert nun ein Kunde in eine Kategorie des Produktkataloges ermitteln
wir aus dem Index in Elasticsearch alle Ausprägungen (d.h. alle
unterschiedlichen auftretenden Werte) aller Eigenschaften der Artikel
dieser Gruppe und die Anzahl (absolute Häufigkeiten). Die Werte können
dann vom Kunden angeklickt werden, um nach diesen zu Filtern.

Damit wird die Darstellung auf Artikel mit diesem Wert eingeschränkt.
Ebenso wird die Darstellung der Filter auf diese Produkte passend
eingeschränkt. Filter können beliebig hinzugefügt und entfernt werden.
Da sie ausschließlich im URL des GET-Requests gespeichert werden, können
die Links weiterhin als Lesezeichen verwendet und zum Beispiel per
E-Mail versandt werden. Diese Art der Filterung bezeichnet man als
Facetted Search.

Dieser komplex zu beschreibende Vorgang läuft in rund fünf Millisekunden
ab und verzögert die Ladezeit daher kaum (die Darstellung der Filter als
HTML benötigt länger als die Suche in Elasticsearch).

Produkte werden automatisch mit jeder Änderung in der Mercator Datenbank
in Elastic Search aktualisiert, die Indizierung der Kategorien erfolgt
per Cronjob nach jedem Produktupdate aus dem ERP-System.

Bestellprozess
--------------

Bei dieser Besprechung haben wir den Bestellprozess rekapituliert. Er
sieht in Diagrammform so aus:

<hr/>
![Mercator Prozess](/img/blog/Mercator_Prozess.png){:style="max-width: 100%"}
<hr/>

Weiteres
--------

-   Wir haben recherchiert, in wieweit wir mobile Endgeräte als Pager
    für neu hereinkommende Kundenanfragen verwenden können.
-   Einige kleinere Arbeiten für die Icecat Schnittstelle sind noch
    angefallen, eventuell werden wir noch unseres selbst geschriebenen
    Mini-Parser für die korrupten UTF8 Unicode Zeichen durch eine
    Fremdbibliothek ersetzen.
-   Wir haben den Produktkatalog für den ersten Referenzkunden um die
    bislang fehlenden Bilder aus Icecat ergänzt.
-   Wir nützen nun die Informationen in Icecat über ähnliche Produkte
    und Zuberhörrelationen.