---
layout: post
title: Subsistenz
date:   2015-02-16 08:00:00 +0200
---

In dieser Woche haben wir alle laufenden Referenzsysteme auf
Palava umgestellt, sodass wir uns nun in einer Position wiederfinden,
die es bislang noch nicht gab. Wir sind "self-contained" oder
"subsistent".

Das bedeutet, es gibt keine externe Infrastruktur, von der Mercator
abhängig ist, denn wir betreiben nun auch den Stun & Turn Server selbst
und auf unserer eigenen Infrastruktur.

Natürlich ist zu sagen, dass einige Schnittstellen - wie die zu den
externen Produktkatalogen - ihren Sinn verlieren, ohne deren
Serviceanbieter. Auch besteht die Möglichkeit des E-Payments nur in
Zusammenarbeit mit einem externen Dienstleister. Die eigentliche
Funktionalität von Mercator, das Guided Selling System also, läuft aber
vollständig auf unserer eigenen Infrastruktur.

Nebenbei sind wir durch die Umstellung auf Palava in der optischen
Gestaltung des Videochat nun nicht mehr durch das alte jQuery Plugin
eingeschränkt, sondern können das Videofenster einbetten, wie wir es
möchten.

Weiters lief der Faye Messaging Server in Entwicklermodus statt in
Produktionsmodus, was wir beseitigt haben. Dies scheint keine
Auswirkungen auf die Performance zu haben, aber wir haben gesehen, dass
aufgrund unserer mangelhaften Dokumentation der Installation von Faye
diese Unsauberkeit mehrere Monate nicht bemerkt haben.

Vorträge
--------

Innerhalb der nächsten sechs Wochen bieten sich für Stefan Haslinger von
Informatom Gelegenheiten zu 5 Vorträgen, in denen Mercator stets erwähnt
und beworben werden kann.

Er wird sprechen bei

-   Ember-js-Vienna, [24.Februar](http://www.meetup.com/Ember-js-Vienna-Meetup/events/220028985/)
-   Vienna-RB, [5.März](http://www.meetup.com/vienna-rb/events/219357990/)
-   Vienna PHP, [10.März](http://www.meetup.com/viennaphp/events/219443548/)
-   IT-Alliance, 11.März (geschlossene Veranstaltung nur für Mitglider
    der IT-Alliance)
-   [Freelancer Meetup](http://www.meetup.com/Freelancing-in-Vienna/), (Termin
    steht noch nicht fest).

Sollten Sie diesen Artikel noch vor den verlinkten Terminen lesen,
sind sie natürlich gerne eingeladen, mit uns über Mercator
zu diskutieren.

Dokumentation
-------------

In den nächsten Wochen verlagert sich ein Teil unserer Projektzeit mehr
in Richtung Dokumentation und Marketing.

Wir haben beschlossen, die in unserem privaten Projektwiki vorhandene
Dokumentation zu überarbeiten und zu veröffentlichen.

Dies wird auf den Github-Seite von Mercator passieren. Wenn Sie diesen
Text lesen, finden Sie die Dokumentation bereits
[online](https://github.com/informatom/mercator/wiki/Dokumentation-DE).

### Verkaufs- und Beratungsprozessdiagramm

Wir haben im Zuge dessen auch das Verkaufs- und Beratungsprozessdiagramm
überarbeitet.

<hr/>
![Verkaufsprozessdiagramm](/img/blog/Verkaufsprozessdiagramm.png){:style="max-width: 100%"}
<hr/>

Vermischtes
-----------

-   Unsere erst vor kurzem erstellte Twitter Integration ist gebrochen,
    das verwendete Modul hat seine API verändert. Wir haben diese
    Änderung nun in unserem Code nachvollzogen und können wieder Twitter
    Feeds einlesen.
-   Die Anmeldemöglichkeit per E-Mail wurde auf alle Referenzsysteme
    ausgerollt.