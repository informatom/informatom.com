---
layout: post
title: Volldampf
date:   2015-03-30 08:00:00 +0200
---

## Verbesserung an vielen Stellen

Nachdem die Woche gefühlt relativ wenig Fortschritt gebracht hat, sind
wir in diesen Woche an vielen Fronten weiter gekommen:

-   Im Importjob gab es einen Fehler bei der Ersetzung von Zeichen. Im
    Zusammenhang mit dem im Artikel gemachten Fortschritt 'Unicode
    schlägt zurück' konnten wir diesen Teil des Jobs ersatzlos
    streichen, da wir alle in Icecat verwendeten Unicode Zeichen nun
    problemlos importieren können.
-   Sowohl beim Importjob der Icecat-Daten und als auch bei dem aus
    Mercator haben wir Verbesserungen durchgeführt, insbesondere loggen
    wir nun weniger Erfolgsmeldungen, aber mehr Fehler- und
    Warnmeldungen, was die Lesbarkeit des Logs deutlich erhöht.
-   Die Benachrichtigung, dass eine Webseite einen Platzhalter aus der
    Vorlage nicht befüllt, erfolgt nun nicht mehr für alle sichtbar auf
    den Webseite, sondern nur mehr als Kommentar, das heißt, sie ist für
    Entwickler noch im Quelltext der Webseite zu finden.
-   In B2C Shops, also solche, die (auch) an Privatkunden verkaufen,
    werden nun die gesetzlich vorgeschriebenen Informationen aus dem
    FAGG (Fern- und Auswärtsgeschäfte-Gesetz) dargestellt und das Lesen
    ist vom Kunden durch Anklicken einer Checkbox und Absendes des
    Formulars durch Klick auf einen Button zu bestätigen.
-   Die Preisfindung berücksichtigt nun konfigurierte Artikel korrekt.
-   Artikel können als *nicht versendbar* gekennzeichnet werden. Dann
    ist nur die Abholung in einer Filiale für den Kunden im
    Webshop auswählbar.
-   Bestellungen führen in ihren Positionen nun die Information, aus
    welchem Inventar bestellt wird.
-   In der Produktansicht und in der Katalogansicht sind Inventare
    selektierbar, sofern der Shop entsprechend konfiguriert ist.
-   Die E-Paymentfunktion ist einfach deaktivierbar.
-   Auf den Seiten des CMS steht ein weiterer Slider zur Verfügung.
-   Shops können - je nach Konfigurationseinstellung - Brutto-Preise
    oder Netto- und Brutto-Preise darstellen
-   Sessions des Nachrichtensystems sind nun systemspezifisch. Anders
    formuliert wird unser Messagingserver damit mandantenfähig. Wieder
    anders formuliert benötigen wir damit für all unsere installierten
    Instanzen von Mercator nur einen Faye-Messagingserver.
-   Systeme haben nun eine System ID und einen Systemschlüssel. Damit
    können durch Unbefugte keine Nachrichten an Messagingserver, die
    nicht unter Ihrer Kontrolle stehen, gesendet werden.
-   Die Konfiguration des Miranda-Webshops wurde fortgesetzt und für's
    erste (das heisst bis auf weitere Kundenanforderungen)
    abgeschlossen.

### Die unscheinbare Checkbox 'nicht versendbar' steuert einen bedeutenden Workflow auf Produktebene

<hr/>
![nicht vensendbar](/img/blog/nicht-vensendbar.png){:style="max-width: 100%"}
<hr/>
