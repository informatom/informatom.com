---
layout: post
title: SEO for CEOs
date:   2014-05-26 08:00:00 +0200
---

Search Engine Optimization
--------------------------

Die Optimierung der Firmenwebseite und insbesondere des Firmenwebshops
sollte eigentlich nicht nur für den CEO ein Thema sein ...

Wir generieren nun im Shop den Canonical Tag, den Description Tag und
den Title Tag automatisch aus den Stammdaten des entsprechenden
Produktes beziehungsweise der Kategorie.

### SEO-relevante HTML Tags im Header

<hr/>
![SEO Header](/img/blog/seo-header.png){:style="max-width: 100%"}
<hr/>

Damit wird die Indizierung für Google erleichert und das Suchranking
verbessert.

Wir unterstützen nun auch eine Domaintrennung zwischen Shop- und CMS-
Bereich mit automatischer Weiterleiterung.

Da diese Weiterleitung korrekt mit Statuscode 301 erfolgt, aktualisieren
Suchmaschinen damit ihren Index, vormals potentiell doppelt bei einer
Suchmaschine indizierter Inhalt ist damit nur mehr einfach indiziert.
Auch diese Maßnahme verbessert das Suchmaschinenranking.

Codemirror für Webtemplates
---------------------------

Bisher mussten die Webseitenvorlagen in der HTML-Sicht des
WYSIWYG-Editors berarbeitet werden. Um den Komfort für den Gestalter der
Vorlagen zu erhöhen haben wir den Editor für die Webseitenvorlagen
ausgetaucht und verwenden nun Codemirror. Dieser Editor zeigt nicht nur
Zeilennummern und beherrscht Syntax-Highlighting, er unterstützt auch
die Tastenkürzel der großen Editoren Emacs, VIM und Textmate je nach
Kundenwunsch.

### Template Editor

<hr/>
![Template Editing](/img/blog/template-editing.png){:style="max-width: 100%"}
<hr/>

Weiteres
--------

-   Die Daten aus der Icecat Produktdatenbank werden täglich per
    Job aktualisiert.
-   Unser Menü ist nun responsive, das heisst auf schmalen Displays wie
    Smartphones klappt es in ein Drop-Down Menü um und verbraucht nicht
    wertvollen Bildschirmplatz.
-   Ein interessanter Fehler hat uns einige Zeit beschäftigt: Die Bilder
    innerhalb der Webseiten und auch des Shops werden nicht durch die
    Applikation geroutet, sondern unmittelbar vom
    Webserver ausgeliefert. Dies gilt übrigens für alle Assets, d.h.
    auch für CSS-Files, Javascript-Files, Filme. etc. und spart so
    Bearbeitungszeit am Server, da nur der Webserver, nicht aber der
    Applikationsserver mit der Auslieferung der Daten beschäftigt ist.

    Dennoch gab es ein Performanceproblem einer bestimmten Produktseite.
    Ein defektes PNG hat hohe Systemlast erzeugt und einen Thread des
    Webservers permanent belegt. Dieses Verhalten ist überraschend, da
    wir als Webserver den weltweit meist eingesetzten Webserver,
    Apache, verwenden.
-   Angebote können nun durch den Kunden auch als pdf-Download lokal und
    in Papierform abgelegt werden.