---
layout: post
title: Und dann noch schnell ein CMS
date:   2014-02-24 08:00:00 +0200
---

![Inline Editor](/img/blog/inlineeditor.png)
<hr/>

Das CMS nimmt nun stabile Formen an, die WYSIWYG-Komponente CKEditor
haben wir aktualisiert, die Datenstruktur des CMS vereinfacht, ohne
Funktionalität zu beschneiden. Auch Inlineediting funktionert weiter, nach Klick auf ein Textelement öffnet sich der (funktional auf
gelegentliche Benutzer abgestimmte) CKEditor. Seitenelemente können nun
Text oder Bilder sein oder beides zugleich sein.

Für den ersten Referenzkunden haben wir Empfehlungen, Zubehör und
zugeordnete Produkte importiert, ebenso die vorhandenen Inhalte seines
CMS. Parallel dazu wurden einige Validierungen im Datenmodell
gelockert.

Die Produkteigenschaften wurden nun erweitert, es gibt nun zusätzliche
Eigenschaften für die Produktübersichtsseiten. Diese sind quasi die
Core-Features eines Produktes, während die bisherigen Eigenschaften die
technischen Spezifikationen eines Produktes im Detail darstellen.

Nach dem Update letzte Woche haben nun wieder alle Tests nachgezogen und
sie laufen erfolgreich durch. Die Performance hat unter dem
Versionswechsel der drei Kernkomponenten Ruby, Ruby On Rails und Hobo
nicht gelitten.

Wir können (und müssen) uns in Folge um den Bestellprozess und das
Beratungsmodul, das eigentliche Herzstück von Mercator, kümmern. Urlaube
einiger Mitarbeiter hat die Entwicklungsgeschwindigkeit etwas
gedämpft.