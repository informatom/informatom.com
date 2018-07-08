---
layout: post
title: Kleinvieh macht auch Mist
date:   2014-02-03 08:00:00 +0200
---

Im Gegensatz zum letzten Mal gibt es diesmal sehr viele
Fortschritte:

-   Alle notwendigen Modelle des Webshops sind angelegt und
    administrierbar: Bestellpositionen, Produkteigenschaften,
    Produkteigenschaftsgruppen, Konstanten, Zubehör, verwandte Produkte,
    Produktkategorisierungen, Bestände, Länder, Bestellungen, Bilder für
    Ausprägungen, Preise, Empfehlungen, Email-Aktivierung, Validierung
    von Zahlenwerten, Übersetzungen, Enum-Strings. Damit kann die
    Dateneingabe beginnen.
-   Das erste Refactoring des Dryml-Code hat stattgefunden. Refactoring
    bedeutet Überarbeitung des Quelltextes, um ihn übersichtlicher zu
    machen, ohne dabei an der Funktionalität etwas zu verändern.
-   Wir glauben das Berechtigungswesen nun komplett verstanden zu haben
    und haben es konsistent auf allen Modellen eingesetzt.
-   Die Befüllung mit einer realistischen Menge von Dummy-Daten zeigt
    Performance Probleme im Administrationsinterface, wenn alle Daten
    eines Modells unmittelbar geladen werden und browserseitig in einem
    Datatables Widget manipuliert werden. Daher haben wir auf
    sortierbare und durchsuchbare Tabellen per Table-Plus umgestellt.
    Das Thema Performance ist damit an dieser Stelle gelöst.
-   Admin - Subsite erstellt: Shop und Administrationsinterface sind
    damit anwendungsseitig getrennt, alle Aktionen nur im entsprechenden
    Bereich verfügbar, die Berechtigungsverwaltung wird damit deutlich
    vereinfacht.

    Die jeweils aktuelle Subsitestruktur findet man unter:
    (https://raw.githubusercontent.com/informatom/mercator/master/doc/diagrams/Mercator%20Struktur.png)

    Wir versuchen Sie auch in Zukunft aktuell zu halten.

<hr/>
![Mercator Struktur](/img/blog/Mercator_Struktur.png)
<hr/>

-   Mit einer Dryml-Erweiterung für Autocompletion haben war wieder zu
    Hobo Code beigetragen. Autocompletion ist etwa in Googles
    Suchfeldern bekannt: Nach dem Tippen der ersten Buchstaben, werden
    Worte oder Phrasen zur Vervollständigung in einem
    Dropdown angeboten. Wir verwenden es zur Länderauswahl
    auf Adressebene.

<hr/>
![Autocomplete](/img/blog/autocomplete.png)
<hr/>

-   Die Pflege der Kategorien wurde vereinfacht, Produkte sind nun
    innerhalb Kategorien sortierbar.

Wir freuen uns über diese große Zahl an Fortschritten und sehen
"Kleinvieh macht auch Mist", so gibt es bislang keinen Fortschritt
in der eigentlichen Webshop Logik, also im Verkaufsprozess. Wir haben
deutlichen Rückstand gegenüber dem Projektplan. Der erzeugte
Programmcode ist bislang übersichtlich und wir konnten alle Probleme, die
sich in den Weg gestellt haben, lösen. Wir haben das Gefühl, hier
wirklich eine solide Basis für ein Produkt zu schaffen, hinter dem wir
mit Überzeugung stehen können.

Hobo macht sich langsam bezahlt. So wie in alten Projekten Ruby On Rails
zur Selbstverständlichkeit wurde, sehen wir in anderen reinen Ruby On
Rails Projekten, dass uns dort Hobo Features fehlen (konkret die
Lifecycles).

Wir haben erfahren, dass das Hobo-Team an einem Upgrade arbeitet, dass
Rails 4 kompatibel ist. Wir bleiben dann rund zwei bis drei weitere
Jahre in der Wartung und würden auch Ruby 2.0 kompatibel.

Wir haben wieder Fahrt aufgenommen. Hoffentlich bleibt das so.