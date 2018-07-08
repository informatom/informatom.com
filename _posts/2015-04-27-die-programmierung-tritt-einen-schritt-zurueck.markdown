---
layout: post
title: Die Programmierung tritt einen Schritt zurück
date:   2015-04-27 08:00:00 +0200
---

## Marketing und Organisation

Diese Woche hat es mit einigen organisatorische Arbeiten in sich:

-   Wir arbeiten weiter an unserer Vertriebsvereinbarung
-   Beim Darstellen des Upselling kam es zu einer Ausnahmesituation,
    wenn das Produkt ein vom Vertriebsmitarbeiter ad-hoc erfundenes
    Produkt ist
-   Beim HP Spotlight Event stellen wir Mercator in einem Vortrag vor
    und stoßen auf reges Interesse. Bemerkenswert: Seit mehr als einem
    Jahr sind wir auf keinen Menschen gestoßen, der einen mit Mercator
    vergleichbaren Webshop gesehen hat.
-   Bei der Benachrichtigung über Videochatstarts gab es einen Fehler,
    der nun behoben ist.
-   Bei der Installation eines Entwicklerlaptops sind wir auf einen
    Fehler in der Installationsanleitung gestoßen.
-   Eine Kunde äußerte den Wunsch, dass seine Kunden doch informiert
    werden sollen, wenn der Vertriebsmitarbeiter tippt. Wir stellen nun
    keine Animation dar, wie dies in anderen Chatapplikationen der Fall
    ist, sondern den bislang getippten Text. Damit hier nicht unnötig
    Daten übertragen werden, erfolgt die Übertraging throtteld,
    also gedrosselt. Der Textstring wird nur übertragen, wenn sich in
    der letzten Sekunde an seinem Inhalt etwas geändert hat und die
    Übertragung erfolgt auch nur einmal pro Sehunde.
-   Der Konversationsstart wurde neu gestaltet.
-   Ein Fehler im Algorithmus, mit dem wir nach Daten im Icecat Katalog
    gesucht haben, wurde behoben.
-   Das Schnittstellendiagramm wurde angepasst, die Darstellung rund um
    STUN/TURN Server und Palava war unvollständig.

### Schnittstellendiagramm

<hr/>
![schnittstellen](/img/blog/schnittstellen.png){:style="max-width: 100%"}
<hr/>
