---
layout: post
title: Die Phasen vermischen sich
date:   2014-03-10 08:00:00 +0200
---

Phase 1 und 2 werden nun praktisch parallel bearbeitet, auch da
aus dem Gespräch mit dem ersten Referenzkunden einige Anforderungen
erwachsen sind, die mit der bisherigen Implementierung nicht realisiert
werden können.

-   Versandkosten sind nun länderweise pflegbar.
-   Rechnungsadressen haben nun eine E-Mail-Adresse, die gleich in den
    automatisch angelegten Benutzerstamm mit übernommen wird.
-   Lieferzeiten sind jetzt konfigurierbar.
-   Per Batchjob haben wir nun Dummy-Inventar und Preise für alle
    Produkte des ersten Referenzkunden erstellt.
-   Rechnungsadressen sind nun doch änderbar und pflegbar
    wie Lieferadressen.
-   Endbenutzertests fordern eine intuitivere Auswahl von Liefer- und
    Rechnungsart, die wir sogleich implementieren.

Ein besonderes Zuckerl haben wir beim Fileupload implementiert.
Vertriebsmitarbeiter recherchieren oft live während der Beratungssession
nach Daten, die den Kunden demonstriert werden sollen, allerdings darf
nicht der gesamte Inhalt des Bildschirms übertragen werden. Unter
Zuhilfenahme eines externen Screnncapturingtools kann der Mitarbeiter
einen beliebigen Ausschnitt des Bildschirminhalts in die Zwischenablage
kopieren. Diesen Inhalt kann er nun auf der Beratungssicht unmittelbar
in die Konversation kopieren. Beim Upload wird sofort ein verkleinerte
Voransicht erstellt und dieser dem Kunden präsentiert. Der Kunde erhält
nach Klick auf den Thumbnail den hochgeladenen Bildschirmausschnitt des
Vertriebsmitarbeiters in voller Größe präsentiert.

-   Um diese Funktionalität zu ermöglichen haben wir die Fine Uploader
    Javascript Bibliothek kompiliert, installiert und in
    Hobo eingebettet.
-   Wir haben kleinere Verfeinerungen im Beratungsprozess durchgeführt.

Ein heikles Thema stellen die AGBs dar:

-   AGBs haben nun ein Gültigkeitsdatum
-   Wir speichern auf Userebene ab, wann er die AGBs angenommen hat und
    um welche Version der AGBs es sich gehandelt hat.
-   Die Annahme der AGBs erfolgt nun zum spätest möglichen Zeitpunkt.

<!-- -->

-   Der Warenkorb wird bei jeder Änderung neu berechnet, Mehrwertsteuern
    auf Gruppenebene ausgewiesen.
-   Wir haben nun eine Funktion hinzugefügt, die es uns jederzeit
    ermöglicht, zum Startpunkt des letzten Interaktionsschritts
    zu gelangen. Es ist dies quasi ein verbesserter Backbutton, den wir
    können auch mehrere Schritte auf einmal zurück gehen.

<hr/>
![Warenkorb](/img/blog/warenkorb.png)
<hr/>

Mercator hat in den letzten 7 Tagen deutlich an Reife gewonnen, das
Vertrauen in unsere eigene Entwicklung nimmt zu - wir sind allerdings
noch immer hinter dem Zeitplan.