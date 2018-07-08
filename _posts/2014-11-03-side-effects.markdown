---
layout: post
title: Side Effects
date:   2014-11-03 08:00:00 +0200
---

Die Umstellung auf den Contentmanager hat durch die Erweiterung
um die Deklaration der Platzhalter in den Templates und die
Verzeichnisstuktur einige Nabeneffekte nach sich gezogen, die wir in
dieser Woche behandelt haben.

Die Referenzsysteme sind nun auf aktuellem Stand. Ausführliches Testen
hat auch noch ein paar kleinere Fehler zu Tage gebracht, die nun
ausgeräumt sind.

Dabei haben wir gleich die Tags vereinfacht, die in den Templates
verwendet werden, mit

    <container name="«Platzhaltername»" />

wird der HTML-Inhalt eines Bausteins in eine Webseitenvorlage eingefügt
und mit

     <photo name="«Platzhaltername»" />

ein hochgeladenes Foto. Schön, wenn eine Syntax so einfach ist, dass sie
in einem Satz erklärt werden kann!

Die Pflege der Platzhalter haben wir sehr einfach gestaltet, sie werden
in einer kommaseparierten Liste gewartet.

Der Webseitenbaum wurde nun noch um die Statusinformation erweitert. So
ist auf einen Blick erkennbar, welche Webseiten publiziert sind.

### Platzhalterpflege

<hr/>
![Platzhalter](/img/blog/platzhalter.png){:style="max-width: 100%"}
<hr/>

Wir haben uns auch zu einem größeren Refactoring Schritt entschieden und
im Contentmanager die Bibliothek zur Darstellung von Nachrichten an den
Benutzer getauscht. Statt Messenger.js verwenden wir nun die an W2UI
eingebauten modalen Dialoge.

### Modaler Dialog

<hr/>
![Modal](/img/blog/modal.png){:style="max-width: 100%"}
<hr/>

Wir können damit erzwingen, dass der Administrator wichtige Meldungen
wegklicken muss und hoffen, dass er sie auch liest. ;-)

Vermischtes
-----------

-   Beim Icecat Datenimport haben sich Probleme gezeigt: Wir hatten
    vergessen, ihn für Staging Systeme zu konfigurieren.

    Zur Erläuterung: Jede Mercator Referenzinstallation besteht aus
    wenigstens zwei Systemen: Einem Produktionssystem und
    einem Stagingsystem. Während ersteres jenes ist, das produktiv
    eingesetzt wird und das öffentlich im Internet publiziert wird,
    dient das Stagingstystem zum Testen neuer Features und der Abnahme
    von Änderungen. Änderungen werden also zunächst immer nur in das
    Staging System transportiert, dort von Kunden abgenommen und dann in
    das Produktionssystem transportiert. Die beiden Systeme laufen aber
    durchaus auf der selben Hardware, ja sogar innerhalb der selben
    virtuellen Maschine. Wir verwenden hierzu das Environment-Feature
    von Rails.

    Damit alle Schnittstellen im Staging System Daten importieren
    können, mussten wir diese Woche auch die Verwaltung der
    Gems anpassen.

-   Webseiten, denen weitere Webseiten untergeordnet sind, die aktiv
    sind, erzeugen nun automatisch ein Dropdown Menü. Dies musste
    bislang mit einer Checkbox in der Administration der Webseite
    manuell gepflegt werden.