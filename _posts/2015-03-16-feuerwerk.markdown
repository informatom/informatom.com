---
layout: post
title: Feuerwerk
date:   2015-03-16 08:00:00 +0200
---

## Miranda World

Diese Woche stand ganz im Zeichen der Erstellung des Shops für Miranda
World. Über den Webshop werden Feuerwerksartikel als auch
Faschingsartikel, Kostüme und Masken verkauft werden.

Deshalb wurden einige neue Features implementiert:

-   Produktvarianten
-   Da es sich um einen B2C Shop handelt, muss das Lesen weiterer
    gesetzlich vorgeschriebener Informationon vom Kunden
    bestätigt werden.
-   Die Datenbankverbindung zum ERP Mesonic ist ähnlich der bereits
    implementierten Verbindung. Einige weitere Attribute müssen
    berücksichtigt werden.
-   So dürfen etwa Feuerwerksartikel zwar bestellt, nicht aber
    versandt werden.

Zudem haben wir den Produktkatalog aus dem ERP importiert, sowie
Bestände und Preise angelegt.

### Produktvarianten

<hr/>
![Konfiguration](/img/blog/konfiguration.png){:style="max-width: 100%"}
<hr/>

Vermischtes
-----------

-   Wir haben wieder einen Vortrag über Mercator gehalten, diesmal vor
    der IT-Alliance, einem Verein von mehr als 50 IT-Firmen.
-   Im Bereich der Asset Pipeline gab es einen Konfigurationsfehler, der
    nun beheben ist. Manche Dateien wurden nicht auf produktive Systeme
    kopiert.