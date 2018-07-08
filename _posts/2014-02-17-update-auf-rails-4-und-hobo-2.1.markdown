---
layout: post
title: Das Update auf Rails 4 und Hobo 2.1
date:   2014-02-17 08:00:00 +0200
---

Wir haben in der letzten Woche den Schritt gewagt und die
Applikation auf Ruby On Rails Rails 4.0 umgestellt. Damit einhergegangen
ist die Umstellung von Hobo auf die letzte Version 4 Hobo 2.1.0. Die
Umstellungen waren nicht friktionsfrei, die Zusammenarbeit mit Herrn
Huerta vom Hobo Projekt unbezahlbar. Wir konnten auf Probleme mit Listen
in der Applikation und in den Standardsortierreihenfolgen hinweisen, die
innerhalb eines Tages behoben wurden.

Die Entscheidung, ob wir überhaupt aktualisieren sollten, war nicht
umstritten. Aussschlaggebend war die Hoffnung, damit bei zukünftigen
Problemen mit Hobo stets kurzfristigen Support aus der Community
bekommen zu können.

Wir sind nun eine der wenigen größeren Applikationen, die bereits auf
Hobo 2.1.0 gewechselt haben. Da wir noch nicht produktiv laufen, sparen
wir uns ein Update aller Kunden im Produktivbetrieb.

Im Zuge der Umstellung ist ein Problem mit de Autovervollständigung
aufgetreten, das mehrere Manntage Debugging benötigt hat. Wer
verzweifelte, frustrierte Entwickler sehen wollte, war hier an der
richtigen Stelle. Kritische Kommentare waren nicht gerne gehört.
Kurzfristig stand gar in der Verzweiflung eine Abkehr von Hobo zur
Diskussion.

Zum Glück haben sich alle Probleme in Wohlgefallen aufgelöst. Diesmal
wir sie nur indirekt gelöst, nämlich mit einem beherzten Schritt der
Aktualisierung der zu Grunde liegenden Javascript Bibliothek JQuery. Wir
vermuten, dass die darauf aufsetzende Bibliothek, die die Autocompletion
in Hobo ermöglicht, nicht mit der verwendeten JQuery Version kompatibel
war. Jetzt läuft jedenfalls alles fehlerfrei. Wir haben gelernt, in
Zukunft bei ähnlichen Problemen sehr genau auf die verwendeten Versionen
aller eingesetzer Komponenten zu achten, auch jener, die als praktisch
unfehlbar gelten. (JQuery hat in manchen Statistiken einen Markanteil
jenseits der 85% - etwa in
http://w3techs.com/technologies/overview/javascript\_library/all).

Produktrelationen können nun jedenfalls wieder über Autocompletions
befüllt werden. Ein Beispiel für funktionierende Autocompletions haben
wir wieder veröffentlicht: https://gist.github.com/haslinger/7931286

Wir sind nun sowohl zu MySQL als auch zu PostgreSQL kompatibel. Die
Migration auf MySQL für einen Referenzkunden war eine Kundenanforderung.
Sie war bis auf die Migration der Bestandsdaten zwischen PostgreSQL und
MySQL friktionsfrei. Wir haben die Bestandsdaten mit unseren vorhandenen
Scripts neu importiert. Es sind keine Performanceunterschiede zwischen
den beiden Datenbankengines zu bemerken.

Die Übersetzung von Enum Strings (Felder, die anstelle von
Datenbanktabellen für kleine Dropdowneintragslisten verwendet werden)
bereitete heftige Probleme, wir alle haben beim Lesen der Dokumentation
unterschiedlichen Interpretationen der Schlüssel, mit denen gelesen
wurde, interpretiert, allerdings hatte niemand recht und erst eine
Debuggingsession führte zum Erfolg. Unsere Erkenntnisse haben wir unter
https://gist.github.com/haslinger/7909337 publiziert.

Das Fazit der letzten beiden Wochen: Unser Fundament ist solide und wir
halten auch in kritischen Situationen zusammen und durch.