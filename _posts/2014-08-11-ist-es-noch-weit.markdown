---
layout: post
title: Ist es noch weit?
date:   2014-08-11 08:00:00 +0200
---

## ERP-Schnittstelle

Die ERP Schnittstelle beherrscht nun auch die Anlage von Bestellungen im
ERP-Produktivsystem. Dies umfasst auch die Anlage der entsprechenden
Bestellpositionen inklusive der Position der Versandkosten.

Im Zuge dessen haben wir auch eine weitere Mailing-Funktion
konfiguriert: Kunde und Vertriebsoffice des Shopbetreibers werden per
E-Mail in Form der Bestellbestätigung über den Erfolg der Bestellung
benachrichtigt.

Im Zuge der Tests sind wir auf einen Designfehler der Schnittstelle
gestoßen: Wurden Interessenten seitens des ERP-Systems in Kunden
umgewandelt, so haben wir die Referenz am Shop auf den korrekten
Kundenaccount insofern verloren, als wir auf einen Datensatz zeigten,
den es in dieser Form im ERP nicht mehr gibt. Wir können aber die
korrekte Referenzierung wieder herstellen, indem wir aus Mercator über
die Kontaktinformationen im ERP die Referenz ermitteln und diese in
Mercator aktualisieren. Das erledigen wir per Job täglich. Zusätzlich
kontrollieren vor der Anlage einer Bestellung die Richtigkeit der
Referenz und korrigieren sie gegebenenfalls.

Im Zuge dessen haben wir die Benutzeraccountdarstellung in Mercator
verbessert.

Stimmung im Team
----------------

In den letzten Wochen sind in diesen Artikeln nicht auf die Stimmung im
Team eingegangen. Dies ist insofern stimmig, als wir uns auch im
Projektverlauf nicht mit den Befindlichkeiten der Mitarbeiter näher
beschäftigt haben. Die Entwicklung schritt voran und wir waren tief in
den Problemen und Aufgaben der Entwicklung und des Testens gefangen.

In den letzten Tagen fällt nun zusehens auf, dass wir den ersten
Produktiveinsatz von Mercator herbeisehnen, die offenen Aufgaben öfters
zählen und die Zeit bis zum möglichen Produktivstart schätzen.

Ganz konkret fehlt für den ersten Produktiveinsatz

-   die E-Payment Schnittstelle
-   die optische Anpassung der Anwendung die Corporate Identity des
    ersten Referenzkunden.
-   einige E-Mail Benachrichtigungen
-   Tests und Freigabe durch den Kunden
-   Das Kopieren des Staging Systems auf der virtuellen Maschine beim
    Kunden auf das Produktivsystem

Wir sind so nahe bei diesem Milestone wie noch nie und gleichzeitig auch
so ungeduldig wie noch nie. Hinzu kommt die allgemeine Ferienzeit und
-stimmung unserer Umgebung. Wir befinden uns in einer interessanten und
spannenden Situation im Projektverlauf.

Mit der Annäherung an den Produktiveinsatz testen wir wieder intensiver.
Dabei haben wir auch einige kleinere Fehler und Unzulänglichkeiten
gefunden, die wir allesamt mit relativ geringem Aufwand beheben konnten.
Von einigen dieser Fehler wussten wir, haben sie aber nicht ausreichend
dokumentiert und daher in Folge übersehen bzw. vergessen. Hier haben wir
Verbesserungsbedarf.

Hobo-Einsatz
------------

In dieser Situation der Analyse betrachten wir auch wieder des System
als Ganzes. Zwei wesentliche Erkenntnisse aus der Vergangenheit finden
sich bestätigt:

1.  Die Entwicklung mittels Hobo ist Goldes Wert, die Einschränkung
    durch die zusätzlichen Konventionen hält den
    Programmcode konsistent. Code anderer Entwickler lässt sich deutlich
    einfacher lesen, als wir das aus alten Ruby On Rails
    Anwendungen kennen.
2.  Die Anzahl der verwendeten Komponenten ist sehr groß. Bei Durchsicht
    können wir aber ad hoc auf keine der Abhängigkeiten verzichten.
    Eigentlich hat die Einbindung der Komponenten erst eine Entwicklung
    eines Systems in dieser Größe für ein derart kleines Team, wie wir
    es darstellen, ermöglicht.