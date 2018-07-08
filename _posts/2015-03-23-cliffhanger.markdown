---
layout: post
title:
date:   2015-03-23 08:00:00 +0200
---

## Performance

Eine Woche, die von Tagesgeschäft dominiert war, aber doch auch einige
Fortschritte gebracht hat:

Eine Webseite im Frontend hat sich beim Test der Responsiveness
merkwürdig verhalten. Irgendwie untypisch... Wir sind der Sache
nachgegangen und haben festgestellt, dass wir das Twitter Bootstrap
Framework nicht nur kundenübergreifend, sondern auch kundenspezifisch in
zwei voneinander abweichenden, wenn auch sehr nahe zusammen liegenden
Versionen eingebunden haben. Das doppelte Laden der leicht abweichend
definierten CSS Klassen hat dieses eigenartige Verhalten hervorgerufen.

Nun zwei Fliegen mit einer Klappe geschlagen! Das merwürdige Verhalten
verschwindet, die Ladezeit der Seite sinkt, denn der Code für CSS und
Javascript des Frameworks wird nur mehr einmal geladen. Allerdings, und
das war unun wirklich verwunderlich, plötzlich sind einige
Modifikationen verschwunden. Wieder folgt eine kurze Recherche und wir
finden, dass Twitter Bootstrap auch in der Version des
Administrationsinterfaces nochmals im Frontend eingebunden ist. -&gt;
Erneut Entfernung des Codes, weitere Verringerung der Ladezeit und
endlich ist die Webseite so responsive, wie wir uns das vorstellen.

### Reponsive Ansicht der Kategorienübersicht

<hr/>
![Responsive](/img/blog/responsive.png){:style="max-width: 100%"}
<hr/>

Im Admininterface selbst haben wir die Breite des Bildschirms bei
Monitoren über 1200 Pixel horizontaler Auflösung nicht voll ausgenützt.
Diese Unzulänglichkeit wurde beseitigt.

Weiteres
--------

-   Das Miranda Testsystem ist nun voll an die Mesonic Datenbank
    angebunden
-   Der Dateninput für Miranda wurde überarbeitet und an die
    Erfordernisse dieser Instanz angepasst und hinsichtlich Performance
    optimiert.