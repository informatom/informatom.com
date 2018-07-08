---

layout: post
title: Wieder mal Kleinvieh
date:   2015-04-06 08:00:00 +0200
---

Bugsquashing
------------

Einer unserer Referenzkunden hat diese Woche gleich mehrere Leute zum
Test seiner Mercator-Instanz involviert und uns eine stattliche Liste
geliefert:\ gleich 51 Fehler, Unzulänglichkeiten und Änderungswünsche. Das ist
einerseits viel, andererseits ist nun die gesamte Applikation von
mehreren Personen, die nicht im Projekt involviert sind, ausgiebig
getestet worden.

Alle Fehler konnten bereits diese Woche behoben werden. Eine derartige
intensive Phase der Fehlerbehebung wird wenig charmant als
"Bugsquashing" bezeichnet.

Auch der Großteil der Unzulänglichkeiten ist behoben, bei den
Änderungswünschen haben wir uns auf jene beschränkt, für die wir einen
Kundennutzen auch für andere Kunden erkennen können. Für die anderen
Wünsche haben wir den Aufwand geschätzt, verpreist und angeboten. Es
darf geraten werden, mit wie vielen kostenpflichtig Änderungen wir
beauftragt wurden. ;-)

Die relevanten Änderungen
-------------------------

-   Suchergebnisse wurden fälschlicherweise rechtsbündig dargestellt.
-   Verbesserungen am Layout des Contentmanager wurden durchgeführt.
-   Partner Logos können nun auf mehrere Arten eingebunden werden: Im
    Footer; an den Inhalt der Seite relativ gebunden; und an fixer
    Position am Bildschirm. Sie verschwinden bei zu schmalem Bildschirm
    (zum Beispiel am Smartphone dann hinter dem wichtigeren Inhalt
    der Seite).
-   Bei den Twitter Boostrap Assets haben wir einige Dateien aus dem
    Code Repository entfernen können.
-   Bei Berechtigung der Konversationserzeugung ist eine Regression
    aufgetreten, interessanter weise diesmal nicht bei uns, sondern im
    Hobo Framework. Wir haben den Fehler eingemeldet und die Behebung
    ist bereits in Arbeit. Mittlerweile haben wir einen Workaround mit
    gerade mal 3 zusätzlichen Zeilen Code in unserer Applikation. Das
    Schreiben der Zeilen hat weniger Zeit benötigt als das Berichten
    hier in diesem Artikel. Viel mehr Zeit hat das Auffinden des Fehlers
    benötigt, da wir sehr lange geglaubt haben, dass der Fehler bei uns
    liegen muss. Vielleicht ist etwas mehr Selbstvertrauen angebracht!
-   Formulare, die per Ajax abgesendet wurden, wurden mit dem Absenden
    nicht geleert. Zum Beispiel blieb nach dem Senden einer
    Chatnachricht diese im Formularfeld steht, was störend und
    verwirrend ist.
-   Leere Registerreiter in der Produktdetailsicht werden
    nun ausgeblendet.
-   Es gibt eine zusätzliche Navigation zu den Registerreitern vom
    oberen Teil der Produktansicht.
-   Die Größe der Photos in Produkt- und Kategorienansicht
    wurde angepasst.
-   Die Produkt Mini Card wurde besser gestaltet, es handelt sich dabei
    um die Produktdarstellungen in den Relationen zu Zubehör, verwandten
    Produkten, etc.
-   Versteckte und archivierte Seiten wurden fälschlicherweise in der
    Navigation eingeblendet.
-   Archivierte Seiten konnten bei Aufruf per URL noch
    dargestellt werden.
-   Die Darstellung der Navigationsleiste wurde verbessert.
-   Der Video Chat Link und der Link zum Starten einer Konversation
    wurden als Tags implementiert und werden nun einheitlich in der
    gesamten Anwendung verwendet.
-   Langtexte können nun gekürzt dargestellt werden. Dazu gibt es eine
    Einstellungsmöglichkeit im Administrationsinterface.
-   Der Platzhalter für fehlende Bilder wurde durch ein transparentes
    Bild ersetzt.
-   Administrationsbereich und Vertriebsbereich sind nun
    voll responsive.
-   Untermenüs werden nun auch in der responsiven Darstellung
    korrekt angezeigt.

### Responsives Submenü mit den neuen einheitlichen Buttons für Chat und Beratungsstart

<hr/>
![responsives Untermenu](/img/blog/responsive-submenu.png){:style="max-width: 100%"}
<hr/>

-   Die Navigation im Administrationsbereich, im Vertriebsbereich und im
    Vertragsbereich wurde überarbeitetet, vereinheitlicht
    und vereinfacht.
-   Ein Routingfehler wurde behoben: Beim Aufrufen der Shopdomain wurde
    auf die CMS-Domain umgeleitet statt auf die Kategorienübersicht.
-   Kategorien können nun auch temporär stillgelegt werden. Sie werden
    dann auch durch das Vorhandensein von aktiven Produkten beim
    nächsten Updatejob nicht mehr aktiviert.
-   Weitere Ajax Forms wurden beim Absenden nicht aktualisiert.