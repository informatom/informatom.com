---
layout: post
title: So viele Zahlen!
date:   2014-11-17 08:00:00 +0200
---

## Produkt Manager und Property Manager

In dieser Woche haben der Product und der Property Manager das Licht der
Welt erblickt.

### Produkt Manager

<hr/>
![Produktmanager](/img/blog/product_manager.png){:style="max-width: 100%"}
<hr/>

Der Product Manager ist bislang nur rudimentär fertiggestellt. Er dient
bislang

-   zur Navigation im Produktkatalog, der in der linken Spalte
    dargestellt wird. Er dient später dazu, die Kategorien und in ihnen
    die Produkte zu verwalten
-   Pflege der filterbaren Eigenschaften auf Kategorienebene in der
    rechten Spalte: Klickt man auf eine Eigenschaft so wird sie von
    filterbar zu nicht filterbar und umgekehrt.
-   Kontrolle der Eigenschaften der Produktkategorien in den Liste oben
    in der mittleren Spalte
-   Kontrolle der Produkte einer Kategorie im Grid unten in der
    mittleren Spalte.
-   Wählt man dort ein Produkt aus, kann man in den Property Manager
    (und später auch in andere Administrationsansichten zum Produkt)
    navigieren.

### Property Manager

<hr/>
![Property Manager](/img/blog/property_manager.png){:style="max-width: 100%"}
<hr/>

Der Property Manager ist das neue Administrationsinterface zur Pflege
der Werte der Eigenschaften der einzelnen Produkte. Er ist bereits in
einem verwendbaren Zustand.

-   In der linken Spalte sieht man alle Attribute des ausgewählten
    Produktes dargestellt.
-   In der mittleren Spalte findet man oben den Baum der Eigenschaften
    eines Produktes. Die Eigenschaften sind in Gruppen kategorisiert.
    Der Screenshot zeigt die Navigation in der Eigenschaftengruppe
    "Speicher".<br/>
    Derzeit ist die Eigenschaft "Interner Speichertyp" selektiert,
    sie hat den orange dargestellten Wert "DDR3-SDRAM" für das
    betrachtete Produkt.
-   Der ausgewählte Wert ist im Formular unten in allen
    Attributen dargestellt.
-   Er kann dort geändert werden, das heißt gespeichert oder
    gelöscht werden.
-   Um die Übersicht über die existierenden Eigenschaften und
    Eigenschaftengruppen zu bewahren, sind diese in den Spalten 3 und
    4 dargestellt. Die Selektion liegt auf den richtigen Instanzen
    "Speicher" und "Interner Speichertyp".
-   In diesen beiden Spalten können Eigenschaften und -gruppen
    gepflegt werden. Das heisst es können existierende Werte geändert
    und, sofern sie nicht referenziert werden, gelöscht werden.
-   Weiters können neue Eigenschaften und -gruppen angelegt werden.
    Hierbei kommen die bereits existierenden Pflegedialoge
    zur Verwendung. Wir haben nur die Navigation soweit angepasst, dass
    man nach der Pflege wieder hierher in den Property Manager
    zurück gelangt.
-   Die Eigenschaften und -gruppen können auch umsortiert werden: Die
    Werte der Spalte Reihung sind editierbar. Hier macht sich wieder die
    Effizienz von Ajax und JSON bezahlt, das Aktualisieren aller
    dargestellter Daten gelingt auch bei 70 Eigenschaftengruppen und
    mehr als 1600 Eigenschaften in deutlich unter einer Sekunde.
-   Man kann neue Werte anlegen, dazu sind lediglich eine
    Eigenschaftengruppe und eine Eigenschaft auszuwählen und *Wert
    erzeugen* zu klicken. Dann kann man die Attribute eintragen und den
    Wert speichern. Der Wertebaum wird dann wieder
    automatisch aktualisiert.

Die Wertepflege ist damit verwendbar, für mehr als 100 000 Werte erweist
sie sich in einem Referenzsystem als ausreichend schnell.

### Vermischtes

-   Wir hatten im Frontend vergessen, in der Kategorie "empfohlene
    Produkte" den jeweiligen Grund der Empfehlung auszugeben. Dieser
    Fehler ist behoben.
-   In der Definition useres Gems
    [hobo\_w2ui](http://rubygems.org/gems/hobo\_w2ui) zur einfachen
    Installation von W2UI hatte sich ein Fehler eingeschlichen, der nun
    ebenfalls behoben ist. Im Zuge dessen haben wir auch einen CSS
    Fehler in der eigentlichen Bibliothek W2UI gefunden, den der
    Entwickler nun behoben hat.