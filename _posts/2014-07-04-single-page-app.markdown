---
layout: post
title: Single Page App
date:   2014-07-04 08:00:00 +0200
---

## Vertragswesen

In dieser Woche haben wir das Vertragswesen auf eine Single Page App
umgestellt.

Damit werden je nach Auswahl Seitenelemente ein- und wieder
ausgeblendet, stets hat man dabei die Übersicht, in welchem Vertrag,
welcher Position bzw. welchem Verbrauch man sich gerade befindet.

Wir sind nun in der Lage, Aktionen zu definieren und clientseitig zu
handeln oder Datensätze zu kennzeichnen, etwa, wenn sie 'dirty', also
vom Vertriebsmitarbeiter geändert sind, er aber noch nicht die
Speicherung auf den Server veranlasst hat. Wir können Datensätze
asynchron am Server anlegen, aktualisieren und auch wieder löschen, kurz
alles, was für Single Page Apps relvant ist.

Prinzipiell könnten wir damit auch andere Frontendteile von Mercator als
clientseitige Applikationen implementieren und von den Vorteilen, die
wir im Vertragswesen genießen, profitieren:

-   Extrem schnelle Responses, z.B. Positionsneuanlagen von unter 200ms
    Roundtrip vom Browser zum Server, Verarbeitung am Server und wieder
    Response zum Client. Und das gelingt bei einer Datenübertragung von
    weniger als 2kB.
-   Sehr flexible Userinterfaces, die komplexe Rechenvorgänge erlauben,
    ohne permanent am Server Neuberechnungen größerer Datenmengen
    durchführen zu müssen. (Während der Client sich seinen Status merkt
    und daher nur Änderungen gerechnet werden müssen, ist der Status der
    Applikation eines Servers zustandslos. Das bedeutet, es muss bei
    jedem Request wieder die gesamte Datenumgebung zur Kalkulation des
    Vertrages geladen und errechnet werden.)
-   Auslagerung von Rechenlast vom Server zum Client
-   viele weitere Vorteile, die wir hier nicht aufzählen, finden Sie in
    unserer Präsentation zu Ember unter <http://at.mittenin.at/36>

Dabei dürfen aber auch die Nachteile nicht vernachlässigt werden:

-   Erheblicher Implementierungsaufwand
-   Erheblicher Lernaufwcand
-   Der Download des gesamten Frameworks inklusive Applikationslogik
    beim ersten Request: Auf Produktivsystemen sind dies immerhin 330
    KB, die wir aber noch durch serverseitige Komprimierung
    verringern können.
-   Bislang haben wir nur eine Komponente umgestellt, die die
    Vertriebsmitarbeiter betrifft, nicht die Kunden im Webshop. Das
    bedeutet, es handelt betrifft nur die Rechner, die in unmittelbaren
    Zugriff des Betreibers des Webshops stehen. Das heißt insbesondere,
    dass ein Webbrowser oder zumindest eine Version vorgegeben
    werden könnte. Das wäre bei Kundenrechnern nicht der Fall, womit
    wesentlich umfangreichere Browsertests nötig würden.
-   Die Validierung (Gültigkeit bezüglich Inhalt und Form) von Daten,
    die Authentifizierung (Echtheitsüberprüfung) und die
    Authorisierungslogik (Berechtigungsüberprüfung) muss ohnehin am
    Server implementiert werden.

Damit sieht es derzeit nicht so aus, als würden wir in nächster Zeit
einen weiteren Teil des Frontends umstellen.

### Das Vertragswesen als Single Page App

<hr/>
![single page app](/img/blog/single-page.png){:style="max-width: 100%"}
<hr/>
