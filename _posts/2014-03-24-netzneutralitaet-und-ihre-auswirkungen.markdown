---
layout: post
title: Netzneutralität und ihre Auswirkungen
date:   2014-03-24 08:00:00 +0200
---

Wir haben wieder eine sehr produktive Woche hinter uns:

Ein spannender Aspekt, von dem wir nie erwartet hätten, dass er uns
trifft, ist das Thema Netzneutralität.

Bei einer Demonstration der automatischen Aktualisierung bei einem
Referenzkunden gab es plötzlich Probleme mit der automatischen
Aktualisierung. Ein kurzes Debugging ergab, dass die Internetverbindung
zunächst per W-LAN zu einem W-LAN-Router hergestellt wurde und dann
weiter per UMTS-Verbindung zum Provider. Diese UMTS-Verbindung hat unser
Lauschen auf den Kanälen des Messaging-Servers nicht zugelassen:
technisch sind das HTTP-Requests auf Port 9200. Wir müssen hier nun
unsere Infrastruktur umstellen und den Messaging Server auf einer
getrennten virtuellen Maschine mit dedizierter IP-Adresse auf Port 80
laufen lassen, um auch im Fall beschnittener Netzneutralität alle
Funktionen von Mercator anbieten zu können.

Diesmal war die Teambesprechung besonders ausführlich, da wir alle
Prozesse in einer Demo durchgegangen sind.

Wir haben auch den Designer eingebunden und sind erfreut, dass die
Kommunikation zu ihm reibungslos erfolgt und die vorgeschlagenen
Änderungen im Design kompatibel zu den von uns verwendeten Frameworks -
insbesondere Twitter Bootstrap - sind.

Wir haben auch ein Review durchgeführt, und dokumentiert, wie viele
Komponenten und Technologien wir nun im Zuge von Mercator verwenden. Es
handelt sich derzeit um die erschreckende Zahl von 66.

Wie bereits im letzten Protokoll angekündigt, werden wir die Suche noch
ändern. Statt einer Volltektsuche auf der Datenbank werden wir eine
Suchmaschine (Apache Lucene) mit entsprechender Analyse Plattform darauf
(Elasticsearch) verwenden, die sich ausgezeichnet in die Ruby On
Rails-Applikation integriert.

Kurz zur Funktionsweise: Die Suchmaschine ermittelt die zum
Abfragestring am besten passenden Datensätze. Diese werden dann wie
gewohnt von der Datenbank geholt. Damit gewinnen wir Features wie
Facettet Search (z.B. Laptops mit mind. 4 GB RAM), "Meinten Sie
...", und können auch Suchergebnisse bei Tippfehlern (z.B. Suche nach
Labtop) oder nach Synonymen (z.B. Suche nach Notebook) liefern.

Wir können nun beliebige Views als PDFs exportierten, den Anfang macht
das PDF-Angebot.

Der Warenkorb aktualisiert sich nun automatisch, z.B. auch, wenn er sich
auf einem weiteren Browsertab oder -fenster befindet.

Angebote können als Komplettangebot gelegt werden, das bedeutet der
Kunde kann sie nur komplett in den Warenkorb übernehmen.

Im Fall normaler Angebote kann der Kunde einzelne Angebotspositionen
beliebig oft in den Warenkorb übernehmen.

### Ein Angebot aus Vertriebsmitarbeitersicht

<hr/>
![Angebot](/img/blog/angebot.png)
<hr/>

Kunden haben nun eine übersichtlichere Darstellung aller ihrer Daten, Angebote und Bestellungen, quasi ein kleines Dashboard.


### Das Dashboard

<hr/>
![Dashboard](/img/blog/dashboard.png)
<hr/>

Wir haben die Rolle des Verkaufsleiters eingeführt, der Angebote
freigeben kann, für die vom Vertriebsmitarbeiter eine Freigabe
angefordert worden ist. Der Kunde kann Angebote in diesem Zustand zwar
sehen (der Vertriebsmitarbeiter hat sie gemeinsam mit ihm im Cobrowsing
erarbeitet), aber noch nicht annehmen. Angebote haben ein
Gültigkeitsdatum, sie können bei Überschreitung nicht angenommen werden.
Angebote können für ungültig erklärt werden.

Am Vertriebsdashboard gibt es eine Audiobenachrichtigung, wenn ein Kunde
eine neue Beratungssession startet.

Die Erstellung von Angebotspositionen ist jetzt flexibel, sie kann
manuell oder per Produktkatalog erfolgen. Die Suchhilfe nach der
Artikelnummer ermöglich rasches Einfügen von Listenpreis, Beschreibungtext, Steuersatz und Produktbild.

Die Angebotszusammenfassung gibt die Mehrwertsteuer nach Steuersätzen
gruppiert aus.

Positionsmenge, Artikel, Preis, Beschreibung, Steuersatz und
Artikelnummer sind durch den Vertriebsmitarbeiter überschreibbar.

Der Angebotskopf kann bequem inline (durch Anklicken, ohne
Seitenwechsel) editiert werden.

### Der Angebotskopf inline editierbar

<hr/>
![inline Kopf](/img/blog/inline_kopf.png)
<hr/>

Besonders das Problem mit der Netzneutralität hat uns überrascht. Eine
kurze Analyse hat ergeben, dass dies die einzige Stelle ist, bei der wir
eine http-Kommunikation initiieren, die nicht auf Port 80 stattfindet.
Weitere Überraschungen dieser Art sollten uns also erspart bleiben.
Zumindest in diesem Bereich...