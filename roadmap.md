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

- [x] **1. Leerraum in kürzeren Boxen** — **gegenstandslos geworden, nicht umgesetzt.** Ursprüngliche
  Diagnose ging von einem dangelnden "Weiter …"-Link aus, den man per `margin-top: auto` andocken
  müsste. Dann wurden im Zuge von Schritt "Überschriften-Links" alle "Weiter …"-Links entfernt
  (Überschrift ist jetzt selbst der Link) — damit gibt's in keiner Box mehr ein Element, das
  "andocken" müsste. Verbleibender Leerraum am Ende kürzerer Karten bei durchgehend oben
  ausgerichteten Überschriften ist normales Card-Grid-Verhalten, kein Bug. Bewusst NICHT
  vertikal zentriert (`justify-content: center`) — das würde Überschriften kürzerer Boxen von der
  Oberkante wegschieben und die Zeilen-Ausrichtung zwischen Boxenpaaren zerstören.

- [x] **2. Visuelle Gewichtung der Startseiten-Kacheln** — teilweise durch andere Schritte gelöst:
  IT-Schulung hat jetzt ein großes eigenes Foto (`.box-hero-image`, volle Boxbreite) statt kleinem
  Icon, IT-Beratung ihre Logo-Reihe — beide dadurch klar unterscheidbar von den reinen Text-Boxen
  (Podcasting, Mein Blog). "Software Entwicklung" als Kerngeschäft nicht zusätzlich hervorgehoben
  (z.B. eigene Akzentfarbe) — bewusst nicht gemacht, kein Bedarf mehr gesehen.

- [x] **2b. (neu, während der Arbeit ergänzt) Redundante "Weiter …"-Links entfernt** — überall wo
  die Überschrift bereits (oder neu) verlinkt war, ist der separate "Weiter …"-Link am Boxenende
  gestrichen worden: IT-Schulung, Methodik & RAD, IT-Beratung. "Mein Blog"-Überschrift neu auf
  `/blog` verlinkt (hatte vorher gar keinen Link). "Software Entwicklung" und "Podcasting" bewusst
  unverlinkt gelassen — kein einzelnes Linkziel vorhanden. Nebeneffekt: bei IT-Beratung durfte der
  Logo-Reihen-Link NICHT mit dem Text-Link verschmolzen werden (zwei Gründe: `.content a:not(:has(img))`
  hätte die Unterstreichung verloren, sobald ein `<img>` im selben `<a>` steckt; und die Logos
  sollen ohnehin nicht klickbar sein) — jetzt zwei getrennte Elemente: `[IT-Beratung](/beratung)`
  als normaler Text-Link, danach ein `aria-hidden="true"`-Span mit den 8 Logos, ohne eigenen Link.

- [x] **3. Icon-/Logo-Sprache vereinheitlichen** — IT-Beratungs vormals 4×2-Grid-PNG durch 8
  einzelne `.stack-badge`-große SVG-Icons in einer Reihe ersetzt, exakt dieselbe Größe wie die
  Stack-Badges bei "Software Entwicklung". Damit einheitlich für diese beiden Boxen; Methodik & RAD
  hat weiterhin kein Icon (kein naheliegendes zu finden).

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
