---
layout: post
title: Zwischenspurt
date:   2015-04-20 08:00:00 +0200
---

## Vielschichtige Verbesserungen

Scheinbar immer, wenn wir eine ruhigere Woche erwarten, wird dieselbe
vielseitiger und intensiver als erwartet. Diese Woche sind
Verbesserungen in der Usability gelungen, die wir nicht in dieser Menge
und Qualität erwartet haben.

-   Aus vergangenen Konversation ist es nun per Mausklick für den Kunden
    möglich, nach einem Berater zu rufen.
-   Die Navigation für den Konversationsstart wurde verändert.
-   Wir haben die Konversationsliste für den Vertrieb verbessert, indem
    wir sie durchsuchbar und filterbar gemacht haben und die Auswahl der
    dargestellten Spalten überarbeitet haben.
-   Es ist nun möglich, aus Icecat produktweise einen manuellen
    Import auszulösen.
-   Beim Debuggen mussten wir feststellen, dass Icecat bei einem
    Referenzkunden nicht zu allen Produkten vollständige Daten liefert.
    Diese müssen vom Kunden manuell ergänzt werden, was im
    Produktmanager aber problemlos möglich ist.
-   Der Designer hatte Verbindungsprobleme, die in fehlerhafter lokaler
    DNS-Auflösung lagen, wir hatten ein Routingproblem im
    Shop befürchtet.
-   Für den Icecat Import lässt sich die Artikelnummer, mit der bei
    Icecat gesucht wird, nun produktweise im Feld alternative
    Artikelnummer überschreiben.
-   Das Routing für die Bechloem-Verbrauchsmaterialiensicht
    wurde geändert.
-   Angebote und Konversationen erscheinen nun sowohl für Berater als
    auch für Kunde übersichtlicher in separaten Registern im Browser.
-   Beim Eintreffen eines neuen Videochatpartners läutet es nun bei den
    angemeldeten Vertriebsmitarbeitern genauso reihum wie
    beim Konversationsstart.
-   Der Button zum Hinzufügen eines Artikels in den Warenkorb wurde neu
    gestaltet und wird nun über die gesamte Applikation hinweg
    konsistent verwendet.
-   Kategorien werden nun automatisch reaktiviert, sobald im Update Job
    ein neues aktives Produkt zugeordnet wird. Dies ist nicht der Fall,
    wenn die Kategorie sich im Status abgeschaltet befindet.
-   Produkte aus den Produktvorschlägen können nun durch Klick auf einen
    Button in das zuletzt aufgerufene Angebot übernommen werden.
-   Beim Kopieren eines Komplettangebots ist ein Fehler aufgetreten,
    wenn in wenigstens einer der Angebotspositionen ein Artikel ad hoc
    vom Vertriebsmitarbeiter erfunden wurde.
-   Der Kopfteil einer Konversation wurde übersichtlicher gestaltet.
-   Für Download link haben wir die Content Type Spoofing
    Detection deaktiviert. Dieses Feature dient in Rails dazu, dass
    Seiten nicht in andere Webseiten eingebaut werden dürfen. Eben genau
    dies möchten wir aber mit dem Cobrowsing auch für die Seiten im
    CMS erlauben.
-   Im Bereich der Shop Domain gab es einen Routingfehler, den wir
    behoben haben.
-   Sessions haben nun eine Gültigkeitsdauer von einem Monat. Bislang
    wurden Session Cookies mit dem Schließen des Browsers deaktiviert.
    Das ist für Kunden unpraktisch und wurde daher geändert.
-   Beim Löschen von veralteten Usern und Bestellungen wurde zu
    aggressiv vorgegangen. Ein Entwickler hatte die Methoden delete und
    destroy verwechselt. Destroy löscht - obwohl der Name dramatischer
    wirkt - Datensätze unter Berücksichtigung der Restriktionen, die in
    den Relationen des Modells definiert sind. Delete löscht ohne
    Rücksicht auf Konsequenzen. Dies ist ein Fehler, der in einem
    Produktsystem zu sehr unangenehmen Situationen geführt hätte.
    Benutzer hätten ihre Accounts und damit den Zugang zu Ihren alten
    Bestellungen verloren. (Es lag aber wenigstens keine
    Sicherheitslücke vor, die abhängigen Datensätze waren
    'nur' verwaist).
-   Die Produkt- und die Kategorienansicht sind nun voll responsive.
-   Unsere Vertriebskostenplanung schreitet voran.
-   Für ein Referenzsystem wurden einige Designänderungen durchgeführt.
-   Ein Bug beim Update von Beschreibung und Lieferzeit in Angeboten
    wurde behoben. Nur die Artikelnummer und der Preis wurden
    richtig ermittelt.
-   Auf allen Sichten werden nun Angebote unmittelbar aktualisiert, wenn
    diese von Vertriebsmitarbeiter geändert werden.
-   Bei der Kundensicht des Angebots hatte sich ein Darstellungsfehler
    beim Rabatt eingeschlichen.
-   Der Kopfrabatt wird nun nach der Summe der Positionen ausgewiesen.
-   Im Angebot haben wir auf den Live-Editor umgestellt und ersparen den
    Vertriebsmitarbeitern damit einige Klicks.
-   Angemeldete User mit der Rolle Contentmanager sehen Webseiten, die
    sich im Status "in Arbeit" befinden, in der Navigationsleiste
    und können diese auch aufrufen und damit testen, bevor sie
    veröffentlicht werden.
-   Vertriebsmitarbeitern können nun Artikel aus dem Produktkatalog in
    den Produktvorschlag übermitteln. Damit haben wir hier eine
    deutliche Beschleunigung des Workflows erreicht.

### Mit einem Klick werden Artikel vorgeschlagen...

<hr/>
![Vorschlagen](/img/blog/vorschlagen.png){:style="max-width: 100%"}
<hr/>

### ...mit einem weiteren angeboten

<hr/>
![Anbieten](/img/blog/anbieten.png){:style="max-width: 100%"}
<hr/>

Zur Erhöhung des Vertrauens in die Applikation kann per Button
"Kundensicht" diese dargestellt werden (s.o.).