---
layout: post
title: Es klingelt
date:   2014-09-08 08:00:00 +0200
---

## Erweiterung im Messaging

Die Benachrichtigungsfunktionalität bei Eingang einer neuen
Kundenanfrage haben wir auf Wunsch eines Kunden deutlich erweitert.
Bislang erfolgte einfach eine Benachrichtigung für alle
Vertriebsmitarbeiter am Dashboard, dass eine neue Anfrage für eine
Beratungssession vorliegt. Das stört potentiell alle Mitarbeiter und es
ist unklar, wer die Beratung übernehmen soll oder bereits übernommen
hat. Ab jetzt erfolgt die Benachrichtigung reihum um 5 Sekunden-Takt für
alle angemeldeten Vertriebsmitarbeiter geordnet gemäß einer hinterlegten
Priorisierung in den Stammdaten der Mitarbeiter. Sind weniger als fünf
Mitarbeiter angemeldet, beginnt die Benachrichtigung wieder reihum.

Somit wird immer nur ein Mitarbeiter im Tagesgeschäft gestört und er
kann unmittelbar durch Klick entscheiden, ob er die Anfrage annehmen
kann.

### Nachricht an den Vertriebsmitbeiter

<hr/>
![Message](/img/blog/message.png){:style="max-width: 100%"}
<hr/>

Reagiert nach fünf Versuchen keiner der Mitarbeiter, so erhält der Kunde
eine sprechende, konfigurierbare Mitteilung. Fordert er außerhalb der in
der Konfiguration hinterlegten Arbeitszeiten eine Beratungssession an,
erhält er ebenso eine Nachricht. In beiden Fällen hat er die
Möglichkeit, eine Nachricht zu hinterlassen.

### Nachricht, wenn kein Mitarbeiter verfügbar

<hr/>
![Nachricht](/img/blog/nachricht.png){:style="max-width: 100%"}
<hr/>

Sämtliche Nachrichten sind wie immer internationalisiert. Diese Popups,
die wir mittels Messenger.js erstellen, können wir nun für beliebige
Nachrichten verwenden. Damit ließe sich auch leicht ein firmeninterner
Chat, etwa zwischen mehreren Standorten realisieren. Es ist vielleicht
in diesem Zusammenhang erwähnenswert, dass die Vertriebsmitarbeiter in
Mercator nicht ortsgebunden sind. Das Benachrichtigungswesen
funktioniert an beliebigen Rechnern mit Internetanbindung.

### Vermischtes

-   Die Produktkategorienansicht verfügt nun über einen Preisfilter: Per
    Schieberegler kann eine untere und eine obere Grenze für die
    darzustellenden Produkte gewählt werden. Der Preisfilter schränkt
    auch die anderen dargestellten Filterkriterien passend ein.
-   Im Zuge der Umstellung des Frontends auf Twitter Bootstrap 3 haben
    wir die Produktsuche verbessert und die Darstellung der
    Suchergebnisse übersichtlicher gemacht.