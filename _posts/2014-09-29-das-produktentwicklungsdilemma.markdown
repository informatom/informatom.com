---
layout: post
title: Das Produktentwicklungsdilemma
date:   2014-09-29 08:00:00 +0200
---

In dieser Woche wurde an mehreren, sehr unterschiedlichen
Bereichen gearbeitet, wir beginnen daher zur Abwechslung mit dem
Vermischten.

Vermischtes
-----------

-   Die E-Payment Schnittstelle wurde weiterentwickelt. Vor einiger Zeit
    haben wir ein E-Mail des Payment Providers erhalten, in dem er uns
    motivieren möchte, vom Rest- Interface auf Webservices umzustellen.
    Er argumentiert mit einer "moderneren" Schnittstelle. Wir sehen
    keine Veranlassung, den Modus zu ändern, insbesondere, da weltweit
    ein Trend weg von SOAP Webservices in Richtung zu Restservices zu
    beobachten ist.

-   Die Erstellung von Webseitenvorlagen wurde vereinfacht, indem wir
    neue DRYML-Tags erstellt haben, die häufig benötigte Komponenten zur
    Verfügung stellen. Beispiele dafür sind ein Tag für die
    Kurzdarstellung des Warenkorbes (Anzahl der Positionen,
    aktuelle Rechnungssumme). Ein weiteres die Darstellung des Namen des
    angemeldeten Benutzers. Auch für die Menüs gibt es nun einfache
    Tags, mit denen sie eingebettet werden können.

-   Die Migration von Twitter Bootstrap 3 zu Twitter Bootstrap 3
    ist vorangeschritten. Zum einen haben wir einige der Ansichten
    verschönert, zum anderen kleinere Unzulänglichkeiten am Gem der
    Bootstrap Integration in Hobo beseitigt und diese veröffentlicht,
    was uns Lob durch den Hobo Maintainer einbrachte. Mit der nächsten
    Hobo Version soll unsere Arbeit in den Hobo Standard einfließen und
    damit allen Hobo Projekten zu Gute kommen.

-   Für des Frontend haben wir nach einem Kundenwunsch einen speziellen
    Slider als Komponente entwickelt, der mit anderen Teilen der
    Ansicht kommuniziert. Per Mausklick auf ein Element der Seite wird
    der Slider zu einem bestimmten Bild gesteuert, umgekehrt kann er bei
    Klick auf ihn selbst andere Elemente verändern.

-   Es gibt eine neue Brotkrumen-Navigation für die Webseiten des
    Contentmanagement-Teiles und neue Mausover-Effekte für Elemente, die
    für die Startseite gedacht sind.

-   Neben der bisher vorhandenen Kategoriennavigation im Brotkrumen +
    Dropdown Stil gibt es nun auch einen klassischen Kategorienbaum. Im
    Zuge dessen wurde die Ansicht einer Produktkategorie umgebaut.


### Die Kategorienansicht mit den erwähnten Menüs und Komponenten

<hr/>
![Kategorienansicht](/img/blog/kategorienansicht.png){:style="max-width: 100%"}
<hr/>

Ausblick: Produktentwicklung
----------------------------

Das aktuell schwierigste Thema liegt im Bereich Strategie der
Produktentwicklung. Zunächst: Unter Produkt verstehen wir in unserem
Zusammenhang eine Software, die es in einer bestimmten
Standardausprägung gibt. In dieser Ausprägung kann sie gemäß einer
Anleitung installiert werden und verhält sich dann genauso wie in der
Dokumentation beschrieben.

Um das Thema Installation nehmen wir uns erstmals nächste Woche an, durch die Anzahl der eingesetzten Komponenten ist sie derzeit nicht
einfach durchführbar.

Ein weiterer Aspekt steckt im Widerspruch zwischen Generalisierung und
Spezialisierung. Viele Aspekte eines Webshops sind nun in der Software
in einer grundlegenden Art und Weise vorweggenommen. Bei jeder
Anforderungsänderung durch einen der Referenzkunden stehen wir vor einer
Entscheidung: Eine Option ist es, die Anforderung für alle Kunden zu
übernehmen, eine weitere eine Option zu schaffen, die Anforderung
irgendwie nur für diesen Kunden zu übernehmen, eine dritte - bisher noch
nie zur Anwendung gekommene - die Anforderung abzulehnen.

Das Übernehmen für den einzelnen Kunden kann wieder auf mehrere Arten
passieren. Einerseits kann es sich um einen einfachen Schalter handeln, mit dem eine Option ein- und ausgeschaltet werden kann, oder einen
Parameter, mit dem ein gewisser Wert festgelegt werden kann. Eventuell
kann eine Komponente entwickelt werden, die zwar mit allen
Installationen ausgeliefert wird, aber nur in dieser einen Installation
zur Anwendung kommt. Oder wir müssen ein getrenntes Modul in Form eines
Gems entwickeln, das pro Installation optional installiert werden kann.
Zur Zeit haben wir 7 derartige Module entwickelt, und es werden wohl
noch einige hinzukommen. Dabei wird es sich weniger um neue Funktionen
handeln. Eher werden bestehende Funktionen aus der Applikation in Gems
herausgezogen. Um diese Refaktorierungen durchführen zu können, werden
wir allerdings unsere Testabdeckung erhöhen müssen und neben den bislang
fast ausschließlich getesteten Modellen und ihren Methoden auch die
Controller mit deren Methoden testen.

Stets ist aber die Frage zu stellen, ob sich der Aufwand lohnt, bzw. ob
die Modularisierung überhaupt nötig ist, da eventuell zunächst
getroffene Annahmen falsch sind. Es kann auch einfacher sein, kleine
Komponenten in mehreren Varianten zu implementieren und auch in Folge zu
warten, als eine große, hoch konfigurierbare Komponente.
