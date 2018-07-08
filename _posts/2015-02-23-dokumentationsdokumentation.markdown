---
layout: post
title: Dokumentationsdokumentation
date:   2015-02-23 08:00:00 +0200
---

Die veröffentlichte Dokumentation ist nun recht umfassend, es
gibt eine
[Installationsanleitung](https://github.com/informatom/mercator/wiki/Installation-DE),
Dokumentation für alle Module, das sind

[Bechlem](https://github.com/informatom/mercator/wiki/Modul-Bechlem-DE), der
[Bestanddatenimport](https://github.com/informatom/mercator/wiki/Modul-Bestanddatenimport-DE),
[ERP](https://github.com/informatom/mercator/wiki/Modul-ERP-DE),
[Icecat](https://github.com/informatom/mercator/wiki/Modul-Icecat-DE)
und das [E-Payment](https://github.com/informatom/mercator/wiki/Modul-mPay24-DE).

Wir geben immer die Voraussetzungen, Funktionen, die Konfiguration und
die deklarierten Tasks und Jobs an.

Mittlerweile gibt es auch eine Liste der
[FAQ](https://github.com/informatom/mercator/wiki/FAQ-DE), die mit
jeder Frage, die wir bekommen, wachsen wird.

Zusätzlich haben wir eine Dokumentation für Berater jeweils im Kontext
zu einer Berutungsaufgabe begonnen, zum Beispiel wie man für die
Webseiten
[Vorlagen](https://github.com/informatom/mercator/wiki/Vorlagen-DE)
erstellt.

Wieder einmal wurden wir von der Komplexität Mercators selbst
überrascht. Um Firewall Settings empfehlen zu können, haben wir alle
Netzwerkschnittstellen zwischen den Komponenten von Mercator und den
externen Services dokumentiert. Das entsprechende Diagramm ist deutlich
umfangreicher ausgefallen, als wir gedacht hätten:

### Netzwerkdiagramm

<hr/>
![Mercator Schnittstellen](/img/blog/Mercator_Schnittstellen.png){:style="max-width: 100%"}
<hr/>

Seed Data
---------

Bei der Installation von Mercator müssen einige Tabellen mit Werten
ausgefüllt werden, damit Mercator lauffähig ist. Beispiele dafür sind
Länder mit ihren ISO-Codes, AGBs, Versandkosten und einige
Systemkonstanten wie die Auslagerungsstrategie.

Diese sogenannten Seed Data können wir ab jetzt in einem Schritt per
Script einspielen, was die Installation weniger fehleranfällig und um
rund eine Stunde schneller macht.

Wir haben mit der Installation eines Demosystems begonnen, das künftig
automatisch stündlich auf Initialwerte rückgesetzt wird. Dafür haben wir
bereits und werden künftig stündlich diese Seed Data einsetzen.

Vermischtes
-----------

-   Wir haben begonnen, das Design konsequent auf
    [Responsiveness](http://de.wikipedia.org/wiki/Responsive_Webdesign)
    umzustellen, um auch Mobiltelefone mit geringerer Displayauflösung
    zu unterstützen.
-   Das Administrationsmenü wurde vereinfacht
-   Die Aufteilung des Bildschirms im Produktmanager funktioniert nun
    auch mit Displays, die eine geringe Auflösung als Full HD aufweisen.
    Dies ist etwa für die Adminstation "on the Road" von Laptops
    aus nützlich.
-   Wir dürften auf einen Bug in der MySQL-Schnittstelle gestoßen sein.
    MySQL unterstützt bekannter maßen keine Unicode Zeichen, die in UTF8
    Kodierung vier Zeichen benötigen. Wir haben aber bereits das Problem
    bei Zeichen, die drei Byte veranschlagen. Diese Unicodezeichen
    filtern wir nun aus Bausteinen (Es betrifft bislang fünf exotische
    Sonderzeichen, für die es allesamt HTML-Entities gibt, stellt also
    kein relevantes Problem dar.)
-   Wir hatten bereits einmal zu früherer Zeit eine
    [Quellenliste](https://github.com/informatom/mercator/wiki/Quellenverzeichnis-DE) verfasst.
    Diese ist nun aktualisiert, wir verwenden aktuell 11
    Kernkomponenten, berufen uns auf 14 Sprachstandards, setzen 98
    Addons, Plugins, Gems ein, arbeiten mit 9 Tools und Editoren und
    verwenden Assets aus 2 Quellen. Was unglaublich erscheint, sorgt für
    Stabilität: Jegliche Software, die wir nicht selbst schreiben,
    sondern ausgereift beziehen und verwenden, senkt unsere
    Fehlerquote.