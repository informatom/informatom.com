---
layout: post
title: Immer schneller
date:   2015-01-05 08:00:00 +0200
---

## Social Media Fähigkeiten

Mercator hat in dieser Woche einige Fähigkeiten im Bezug auf die
Interaktion mit den Besuchern der Seite bekommen.

Wir haben nun eine einfach Blogging-Engine geschrieben, die ein
hierarchisches Kommentarsystem beinhaltet. Da sich User nicht
langmächtig anmelden wollen, haben wir ein minimales Anmeldeformular
(mit den Feldern E-Mail Adresse, Vorname und Familienname)
implementiert. Nach Ausfüllen und Absenden erhält die Person ein E-Mail
mit Freischaltlink. Nach Anklicken dessen kann unmittelbar kommentiert
werden.

### Minimales Anmeldeformular

<hr/>
![Anmeldeformular](/img/blog/anmeldeformular.png){:style="max-width: 100%"}
<hr/>


### Kommentarfeld

<hr/>
![Kommentarfeld](/img/blog/kommentarfeld.png){:style="max-width: 100%"}
<hr/>

Es besteht nun auch die Möglichkeit, sich unmittelbar auf der Startseite
anzumelden.

Der Blog verwendet die altbekannten Bausteine aus dem CMS, die ab nun
nicht nur per WYSIWYG-Editor, sondern auch im Plaintext-Editor
[Codemirror](http://codemirror.net/) erstellt werden können. Neben
HTML unterstützen wir nun Textile und Markdown als weitere
Markupsprachen. All diese Artikel sind in Textile verfasst, wir können
sie damit einfach in Mercator übernehmen und publizieren.

Blogposts können mit Schlagworten versehen und kategorisiert werden.
Nebenbei unterstützen wir nun auch mehrere Contentslider. Das sind
Javascript Bibliotheken, mit denen meist Diashow-ähnliche Vorführungen
auf Startseiten von Webauftritten implementiert werden.

Performance
-----------

Fast durch Zufall ist uns eine deutliche Performance Steigerung
gelungen. Das erste Referenzsystem haben wir in Rails Stagingumgebung
genannt (staging) und nicht als Produktivumgebung (production). Die
Konfigurationseinstellungen haben wir vom Produktionssystem übernommen.
Dabei haben wir nicht bedacht, das manche Konfigurationsoptionen den
Namen auf "production" explizit abfragen. Damit haben wir unnötige
Einträge (die Entwickler nennen das Loglärm) im Logfile erzeugt. Das ist
unnötig und nervt beim Debuggen, kostet aber kaum Performance.

Sehr wohl aber war es ungünstig, alle Assets (Bilder, CSS-Files und
Javascript-Files) vom Applikationsserver ausliefern zu lassen, anstelle
vorzukompilieren und unmittelbar vom Webserver auszuliefern.

Diesen Fehler (wer ihn ursprünglich eingebaut hatten, wollen wir gar
nicht wissen...) haben wir behoben. Damit reduziert sich die Serverlast
seitens des Applikationsservers auf etwa die Hälfte, womit doppelt so
viele Requests abgearbeitet werden können. Nebenbei werden die Assets
vom Webserver an alle modernen Browser auch on the fly komprimiert
(gezippt), womit die Menge der übertragenen Daten bei CSS und Javascript
etwa auf 20% reduziert wird. (Bilder in den üblichen Webformaten gif,
png oder jpeg lassen sich de facto nicht oder kaum komprimieren). Auch
waren nicht alle Cacheheader richtig gesetzt. Damit wurden manche Assets
von Browsern bei jedem Seitenwechsel neu geladen, statt aus dem
Browsercache bezogen.

Wir sehen damit Ladezeiten einer typischen Startseite von unter einer
Sekunde beim ersten Aufruf, bei weiteren unter einer halben Sekunde. Das
war eine erfreuliche Neujahrsüberraschung.

Vermischtes
-----------

-   Der Importjob für Legacy Datenbanken wurde im Bereich
    Kategorienimport und Produktzuordnung erweitert. Dieser Job wird für
    das zweite produktive Referenzsystem benötigt.
-   Im Contentmanager haben wir die Selektion per Drag & Drop
    verbessert.