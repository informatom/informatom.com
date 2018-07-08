---
layout: post
title: Refactoring
date:   2014-09-01 08:00:00 +0200
---

## Erweiterung im Benutzer- und Adresswesen

Der Name des Benutzers wurde auf mehrere Felder aufgeteilt und einige
Felder wurden hinzugefügt. Neu sind: Vorname, Familienname, Titel,
Anrede, Geschlecht, Firmenbezeichnung und Telefonnummer

Diese Änderungen, die an sich harmlos klingen, stellen ein nicht
unbeträchtlichen Arbeitsaufwand dar.

Zwar hilft und wieder einmal DRYML durch die automatische Generierung
der CRUD-Views - das sind die Ansichten für Erzeugung, Änderung,
Darstellung und Löschen eines Datensatzes sowie der Datensatzliste. Alle
Views, die wir darüber hinaus erstellt haben, waren aber manuell
anzupassen und teilweise neu zu gestalten.

### Beispieladress"aufkleber" im neuen Format

<hr/>
![Adressen](/img/blog/adressen.png){:style="max-width: 100%"}
<hr/>

Ja, nach dem Titel sollte nicht umgebrochen werden ;-).

Wir haben im Zuge dieser Auftrennung auch die Rechnungsadressen und die
Lieferadressen um einige Felder erweitert. Um die Konsistenz der
Darstellung in Zukunft zu garantieren, haben wir wieder einige
Helpertags geschrieben und damit mehrfaches Auftreten von identem oder
nahezu identem Programmcode entfernt.

Vermischtes
-----------

-   Beim Löschen von Daten aus hierarchischen Strukturen (der
    Webseitenbaum und die Produktkategorien sind Beispiele) sind wir auf
    einen Fehler im verwendeten Gem Ancestry gestoßen. Wir haben einen
    Patch verfasst und diesen mit zwei Tests belegt und beim
    holländischen Entwickler eingereicht. Am nächsten Tag war er
    bereits aufgenommen. So kommt die von uns aufgewendete Mühe und Zeit
    allen Benutzern von Ancestry zu Gute und wir konnten wieder einen
    Beitrag für die Ruby On Rails-Community leisten.

-   Twitter Bootstrap 3 hat einige Änderungen in unseren modalen
    Dialogen nötig gemacht. Diese führen zu je einem Patch im Hhobo
    Bootstrap Gem und im Hobo Bootstrap Ui Gem, die wir nach der
    vollständigen Migration einreichen werden.

-   Mercator ist nun auch ohne ERP-Integration wieder voll lauffähig,
    einige kleinere Probleme dazu wurden behoben.

-   Wir lernen eifrig CSS, um unsere angestaubten Kenntnisse auf CSS3
    Niveau zu bringen, die aktuelle Version von CSS. Wir können nun
    Elemente relativ zum von Twitter Bootstrap 3 vorgegebenen Gitter
    beliebig positionieren.