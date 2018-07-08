---
layout: post
title: Javascript for Dummies
date:   2014-09-15 08:00:00 +0200
---

## JQuery erleichtert das clientseitige Eventhandling

Beim Umsetzen einiger Wünsche mittels eines Contentsliders auf der
Startseite hat uns der Einsatz von JQuery und Twitter Bootstrap wieder
viel Zeit gespart.

Ein Seitenbereich soll, je nach dem, auf welchem Triggerfeld der
Webseite sich der Mauszeiger befindet, einen entsprechenden Detailtext
stabil zeigen. Ist die Maus nicht auf einem der Triggerfelder, sollen
die Detailtexte automatisch durchscrollen. Bei Klick auf eines der
Triggerfelder soll zur entsprechenden

Detailseite gesprungen werden.

Wir verwenden den eingebauten Slider von Twitter Bootstrap, genannt
Carousel, und implementieren die Logik mit JQuery. Für Trigger Feld 8
sieht das dann so aus:

{% highlight javascript %}
$("#trigger8").hover(function() { $('#carousel').carousel(8)
                                  $('#carousel').carousel('pause') },
                     function() { $('#carousel').carousel('cycle') })
$('#trigger8').click(function() { location.href = "kundenzufriedenheit" })
{% endhighlight %}

Durch den effizienten Selektor von JQuery und die klare API von Twitter
Bootstrap erhalten wir beeindruckend kurzes und lesbares Javascript, das
in einen Javascript for Dummies Kurs passen würde.

Backgroundjobs
--------------

Für Backgroundjobs ist nun auf den Servern Delayed Job installiert.
Damit können wir ressourcenintensivere Prozesse in den Hintergrund
auslagern und asynchron durchführen. Der Benutzer muss damit nicht auf
die Fertigstellung der Aufgabe, zum Beispiel den Versand des E-Mails
warten. Wir können aus dem Backgroundjob über unseren Messagingserver
Faye aber weiterhin mit den Browsersessions kommunizieren und den
Benutzer in weiterer Folge über die Fertigstellung benachrichtigen. Ein
weiteres Beispiel wäre das manuelle Anstoßen der sonst nur täglichen
Updates der externen Datenquellen aus dem Administrations-Interface.

Für das Monitoring der Jobs wurde ein Webinterface eingerichtet.
Scheiternde Jobs werden in exponentiell wachsenden Abständen erneut
versucht.

Vermischtes
-----------

-   Neben der breadcrumbartigen Navigation für Kategorien gibt es nun
    auch eine klassische Baumansicht

### Baumnavigation

<hr/>
![Menü](/img/blog/menue.png){:style="max-width: 100%"}
<hr/>

-   Die Mailingkomponente ist ferfiggestellt, sämtliche Standardmails
    sind konfiguriert.
-   Ein Problem mit der Preisfindung im ERP-System wurde behoben.
-   Wir sind weiters einem mysteriösen Bug auf die Schliche gekommen.
    Rails scheint Ports von Requests über mehrere Requests hinweg zu
    cachen sofern diese einmal von Port 80 abweichen und in Folge nicht
    mehr angegeben werden.