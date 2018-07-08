---
layout: post
title: Unicode schlägt zurück
date:   2015-03-02 08:00:00 +0200
---

## Unicode Probleme

In dieser Woche hat sich ein Fehler, den wir bei der Erstellung einer
Datenbanktabelle vor mehr als eine Jahr begangen haben, gerächt. Eine
Tabelle, war fälschlicherweise statt als Unicode als ASCII-Zeichenformat
deklariert. Wir sind über dieses Problem vor langer Zeit schon einmal
gestolpert, haben es aber missverstanden. Beim Import von XML-Daten
dachten wir an eine fehlerhafte Zeichenkodierung und das bekannte
Problem, dass MySQL Datenbank Unicode Zeichen nur dann problemlos
ablegen können, wenn diese weniger als 4 Byte zur Deklarationen in UTF-8
benötigen. Bei unserer Analyse damals haben wir falsche Schlüsse gezogen
und einen Workaround implementiert, den wir nun wieder entfernen
konnten. Die Daten sind sauber nach UTF-8 migriert und der XML-Import
läuft nun problemlos durch.

### Vermischtes

-   Die Arbeit am Demosystem wurde fortgesetzt, es verfügt nun über ein
    eigenes Code-Repository.
-   Im Bereich des Fileuploads hatten wir ein Problem mit dem damals
    selbst kompilierten Fineuploader. Ein amerikanischer Entwickler hat
    uns schon damals auf jQuery-Upload
    <https://blueimp.github.io/jQuery-File-Upload/> aufmerksam gemacht,
    das wir nun statt Fineuploader verwenden. Wir verlieren die
    Möglichkeit des Copy & Paste, gewinnen dafür aber Drag & Drop. Es
    können nun mehrere Dateien auf einmal aus dem Dateimanager des
    Betriebssystems in das Beratungsfenster gezogen und damit
    hochgeladen werden.
-   Für die Installation des Systems für Miranda-World haben wir die
    noch nötigen Aufgaben der Entwicklung ermittelt. Die größten Brocken
    sind dabei die Umstellung auf Bruttopreise (der Shop für Miranda
    wird ein B2C Shop) und die Entwicklung von konfigurierten Artikel
    (Kostüme können in unterschiedlichen Farben und Größen
    bestellt werden).
-   Für die Wiener PHP User Group haben wir einen Vortrag gehalten, in
    dem wir Mercator ausführlich erwähnt haben. Für die nächsten Wochen
    sind bereits einige weitere Vorträge geplant.
-   Wir haben zur besseren Verdeutlichung ein Diagramm des
    Verkaufsprozesses erstellt:

<hr/>
![Verkaufsprozessdiagramm](/img/blog/Verkaufsprozessdiagramm.png){:style="max-width: 100%"}
<hr/>

-   Einige Aufgaben für die Datenpflege und den Datenimport haben wir
    mit Rake Tasks automatisiert.
-   Wir hatten wieder einmal eine Regression im Anmeldeprozess: Erfolgt
    die Anmeldung von einer ursprünglich nicht dafür vorgesehenen Seite
    (einem Formular auf der Startseite), so wird eine Variable der
    Session nicht korrekt gefüllt. Dieser Fehler ist nun behoben.
-   Ein Fehler ist beinahe erheiternd: Es läutet auch beim Kunden, wenn
    dieser eine neue Beratungssession anfordert (und nicht nur bei den
    Beratern, die die Session übernehmen sollen). Auch dieser Fehler ist
    selbstverständlich behoben.