# Redesign-Roadmap informatom.com

Interne Planungsseite, kein Jekyll-Page-Content (kein Front Matter, vom Build ausgeschlossen,
siehe `_config.yml`). Ziel: das visuelle Grundlayout schrittweise aus dem "Bulma-Default-Look"
herausholen, nachdem Inhalt, Barrierefreiheit, Farbschema und Dark Mode bereits überarbeitet sind.

Stand: 2026-09-06. Ursprüngliche Schritte 1–3 (Leerraum in Boxen, visuelle Gewichtung,
Icon-/Logo-Sprache) sowie die dabei entdeckte mittenin.at-Bereinigung sind erledigt und
gepusht/deployed — Details dazu in der Git-Historie, nicht mehr hier.

## Vorgehen

Kleine, einzeln umsetzbare und live verifizierbare Schritte: Änderung machen →
`bundle exec jekyll build` → gegen `localhost:4000` (Stefans laufender `jekyll serve`) per
Headless-Chrome/CDP-Screenshot in Hell **und** Dunkel prüfen → erst dann als erledigt markieren.

## Offene Schritte

- [ ] **Typografische Hierarchie** — mehr Kontrast zwischen Überschriftsebenen, mindestens eine
  bewusst größere/kräftigere Textstelle pro Seite statt gleichförmiger Fließtext-Optik.

- [ ] **(Zurückgestellt) Hero-Bereich** — wartet auf einen neuen Claim zur Neuausrichtung der Firma
  von Stefan. Nicht ohne diesen Input angehen.

## Notizen für die Weiterarbeit an einem anderen Rechner

- Lokaler Dev-Server läuft normalerweise unter `localhost:4000` (`bundle exec jekyll serve`) —
  falls nicht, Stefan bitten, ihn zu starten, bevor mit Live-Verifikation gearbeitet wird.
- Farbschema, Dark-Mode-Umschalter (`[data-theme]`, `assets/js/theme-toggle.js`) und die
  `--bulma-*`-Override-Fallstricke sind bereits dokumentiert (siehe `_sass/_overrides.scss`
  Kommentare) — vor neuen `--bulma-*`-Overrides immer die kompilierte `main.css` grep'en, nicht nur
  die Bulma-Sass-Quelle, siehe Kommentare dort. Gleiches gilt für plain CSS-Properties wie
  `list-style` — Bulmas eigene `.content ul`/`.content ol`-Selektoren sind spezifischer als eine
  einzelne Klasse und gewinnen sonst unabhängig von der Reihenfolge im Stylesheet.
- Diese Datei nach jedem erledigten Schritt aktualisieren (Checkbox abhaken, kurze Notiz was
  gemacht wurde), damit der Stand von jedem Rechner aus nachvollziehbar bleibt.
