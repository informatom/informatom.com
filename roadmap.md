# Redesign-Roadmap informatom.com

Interne Planungsseite, kein Jekyll-Page-Content (kein Front Matter, vom Build ausgeschlossen,
siehe `_config.yml`). Ziel: das visuelle Grundlayout schrittweise aus dem "Bulma-Default-Look"
herausholen, nachdem Inhalt, Barrierefreiheit, Farbschema und Dark Mode bereits überarbeitet sind.

Stand: 2026-09-06, nach ausführlicher Content-/A11y-/Design-Session (siehe Git-Historie).

## Kontext / Ausgangsbefund

Die Seite ist inhaltlich und in den Details (Farben, Kontrast, Dark Mode, Ausrichtung) bereits
überarbeitet, aber die grundlegende Layout-Struktur der Startseite ist noch weitgehend
unverändertes Bulma-Standard-Komponenten-Layout, nur eingefärbt. Konkret bemängelt:

1. Kein Hero-Bereich – Startseite beginnt direkt mit einer grauen Box und reinem Fließtext-Titel,
   kein Claim, kein Foto, kein Call-to-Action.
2. Sechs fast identische weiße Kacheln im Grid ("Software Entwicklung", "IT-Schulung",
   "Podcasting", "Mein Blog", "Methodik & RAD", "IT-Beratung") – gleiche Gewichtung für
   Kerngeschäft und Nebenthemen, nichts sticht hervor.
3. Boxen mit weniger Text als ihr Zeilenpartner enden in totem Leerraum statt dass ihr
   "Weiter …"-Link unten andockt (Bulmas Gleiche-Höhe-Stretch pro Zeile funktioniert bereits
   korrekt, live nachgemessen — das ist kein Bug, nur die Innenverteilung).
4. Drei verschiedene visuelle Sprachen für Logos/Icons auf einer Seite (kleine Stack-Badges in der
   nummerierten Liste, großes 4×2-Logo-Grid bei IT-Beratung, kein Icon bei Methodik & RAD).
5. Flache Typografie – eine Größe/Stärke für praktisch alle Überschriften, keine großen,
   selbstbewussten Textmomente.

**Zwischendurch erledigt (nicht Teil der ursprünglichen Design-Kritik, aber während dieser Arbeit
aufgefallen):** die "Mittenin.at"-Kooperation mit Michael Stranka besteht seit 2023 nicht mehr
(Stefan entwickelt seither allein) — die gesamte Website ist daraufhin durchsucht und bereinigt
worden (index.md-Box umbenannt zu "Methodik & RAD", entwicklung.md komplett auf Solo-"ich"
umgeschrieben und in "Methodik & RAD" umbenannt, stack.md- und cv.md-Erwähnungen korrigiert, cv.md
hat jetzt eine eigene abgeschlossene Zeile "02/2011-2023" für die Kooperation). Alte
Talk-Präsentationsfolien unter `/presentations/*`, die mittenin.at erwähnen, wurden bewusst nicht
angefasst — die sind Zeitzeugnisse, keine aktuellen Aussagen.

## Vorgehen

Kleine, einzeln umsetzbare und live verifizierbare Schritte, wie im Rest des Projekts auch:
Änderung machen → `bundle exec jekyll build` → gegen `localhost:4000` (Stefans laufender
`jekyll serve`) per Headless-Chrome/CDP-Screenshot in Hell **und** Dunkel prüfen → erst dann als
erledigt markieren.

## Schritte

- [ ] **1. Leerraum in kürzeren Boxen fixen** — `.boxed` als Flex-Column, letztes Element
  (üblicherweise der "Weiter …"-Link) per `margin-top: auto` an den unteren Rand andocken, statt
  dass er irgendwo nach dem Fließtext hängt und der Rest der (schon gleich hohen) Box leer bleibt.

- [ ] **2. Visuelle Gewichtung der Startseiten-Kacheln** — "Software Entwicklung" ist inhaltlich
  das Kerngeschäft, sieht aber genauso aus wie die Nebenthemen-Boxen (Podcasting, Blog). Optionen
  zum Abwägen: eigene Akzentfarbe/Rahmen, größere Spaltenbreite, oder Position/Reihenfolge im
  Grid. Entscheidung gemeinsam treffen, bevor umgesetzt wird.

- [ ] **3. Icon-/Logo-Sprache vereinheitlichen** — aktuell unterschiedliche Darstellungen (kleine
  `.stack-badge`-Icons in der nummerierten Liste, großes Logo-Grid bei IT-Beratung, gar kein Icon
  bei Methodik & RAD). Gemeinsames Format/Größe für "hier sind Partner-/Tech-Logos" finden.

- [ ] **4. Typografische Hierarchie** — mehr Kontrast zwischen Überschriftsebenen, mindestens eine
  bewusst größere/kräftigere Textstelle pro Seite statt gleichförmiger Fließtext-Optik.

- [ ] **5. (Zurückgestellt) Hero-Bereich** — wartet auf einen neuen Claim zur Neuausrichtung der
  Firma von Stefan. Nicht ohne diesen Input angehen.

## Notizen für die Weiterarbeit an einem anderen Rechner

- Lokaler Dev-Server läuft normalerweise unter `localhost:4000` (`bundle exec jekyll serve`) —
  falls nicht, Stefan bitten, ihn zu starten, bevor mit Live-Verifikation gearbeitet wird.
- Farbschema, Dark-Mode-Umschalter (`[data-theme]`, `assets/js/theme-toggle.js`) und die
  `--bulma-*`-Override-Fallstricke sind bereits dokumentiert (siehe `_sass/_overrides.scss`
  Kommentare) — vor neuen `--bulma-*`-Overrides immer die kompilierte `main.css` grep'en, nicht
  nur die Bulma-Sass-Quelle, siehe Kommentare dort.
- Diese Datei nach jedem erledigten Schritt aktualisieren (Checkbox abhaken, kurze Notiz was
  gemacht wurde), damit der Stand von jedem Rechner aus nachvollziehbar bleibt.
