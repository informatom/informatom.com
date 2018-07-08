---
layout: post
title: Gute Beziehungen
date:   2014-12-01 08:00:00 +0200
---

In der Serie der Administrationsoberflächen haben wir diese
Woche eine weitere erstellt.

Der Relations Manager komplettiert für's erste diese Serie.

### Relations Manager

<hr/>
![Relation Manager](/img/blog/relation_manager.png){:style="max-width: 100%"}
<hr/>

-   In der linken Spalte in der oberen Liste werden alle Kategorien
    dargestellt, zu denen das im Produktmanager ausgewählte Produkt
    zugeordnet worden ist.
-   Diese sogenannten Kategorisierungen können hier ausgewählt und
    gelöscht werden.
-   Im Baum darunter findet man alle Kategorien. Wählt man eine aus,
    kann das Produkt dieser Kategorie zugeordnet werden.
-   In der mittleren Spalte werden die unterschiedlichen Beziehungen
    zwischen dem ausgewählten Produkt und anderen dargestellt.
-   In der oberen Liste sind das die Artikelzuordnungen, sie sind etwa
    für ein Feature wie *Kunden kauften auch* verwendbar.
-   In der mittleren Liste werden Empfehlungen zu einem Produkt
    ausgesprochen (evtl, das nächste bessere / größere / schnellere
    Produkt ist ...)
-   In der unteren Liste wird das Zubehör zum Produkt verwaltet.
-   Zuordnungen können nach Auswahl durch Buttonklick gelöscht werden.
-   In der Liste in der rechten Spalte findet man alle aktiven (siehe
    auch unten) Produkte.
-   Wählt man ein Produkt aus, so kann durch Buttonklick eine Zuordnung
    in eine der drei Kategorien erfolgen.
-   Bei der Anlage einer Empfehlung wird man zur Eingabe eines
    Grundes aufgefordert.

Eine recht große Herausforderung stellte sich der Kundenwunsch dar, dass
automatisch zunächst in der Liste rechts nur alle aktiven Produkte
dargestellt werden sollen. Die Lösung erfolgte schlussendlich mit einer
Anpassung der erweiterten Suche von w2ui:

### Filterung

<hr/>
![Filter](/img/blog/filter.png){:style="max-width: 100%"}
<hr/>

Im Screenshot ist zu sehen, dass für den Status gerade mehrere Werte
abgefragt werden sollen. Dies erledigt w2ui über einen Feldtyp **enum**.
Werte können durch Klick auf das kleine x auch wieder bequem entfernt
werden.

Ruft man die Seite das erste mal auf, so ist der Filter auf 'nur aktive
Produkte' gesetzt. Man kann im gezeigten Filterdialog oder per Button
'Filter entfernen' diesen Löschen oder ändern.

Die Filtersettings sind wieder mit den Grid-Einstellungen speicherbar.

Wir sprechen hier immer von "Produkten". Ist es in der Branche aber
zum Beispiel üblich, von "Artikeln" zu sprechen, so stellt das kein
Problem dar:

Wir können in der Lokalisierung der Begriffe ins Deutsche den Begriff
Artikel verwenden. Der gesamte Webshop ist zunächst sprachagnostisch und
spricht erst durch die Lokalisierung in einer Sprache.

Bei den Tests ist uns aber aufgefallen, dass wir ein fundamentales
Problem mit der Übersetzung der Administationsoberflächen haben. Der
Grund und die Auflösung hierfür folgt (hoffentlich) nächste Woche, wenn
wir die Übersetzung der Administration umgestellt haben. Die Werte für
die Stati im Filterdialog sind aktuell daher noch hard codiert, aber wir
wissen immerhin schon, wie wir das Dilemma lösen (wollen ;-) ).

Features im Eigenschaftenmanager
--------------------------------

Im Eigenschaftenmanager können nun auch die Features gepflegt werden.

### Features

<hr/>
![Features](/img/blog/features.png){:style="max-width: 100%"}
<hr/>

-   Features können gelöscht werden
-   Bei der Neuanlage erscheint ein modales Fenster zur Eingabe der
    Texte
-   Die Texte können in der Liste editiert werden und anschließend
    gespeichert werden.