---
layout: post
title: "Technische Überlegungen zur Entwicklung einer Trainingsdokumetation"
date:   2019-04-11 13:00:00 +0200
---

Als Softwareentwickler habe ich natürlich immer sofort die Architektur einer Anwendung im Kopf, 
und die Implikationen, die sich aus der Wahl ergeben, sowohl für die Features, die man gerade
plant, als auch für jene, die noch in weiterer Ferne erscheinen. Und so ist die Planung einer
Anwendung "auf der grünen Wiese" zwar einerseits eine große Freude, kann man doch den geeigneten
Stack selbst bestimmen, andererseits aber auch eine Belastung, legt man sich doch gleichzeitig
auf einen fest. Und so ist es auch diesmal:

Wie bereits im letzten Post besprochen, ist Stefan (der andere ;-), Stefan Dillinger) hier ja mit
von der Partie, also im Team und ich möchte ihn soweit wie möglich in die Entwicklung einbinden.
Was weiss ich denn von ihm? Er ist grundsätzlich technikaffin, ist er doch das technische 
Mastermind hinter dem Podcast [The Random Scientists](https://therandomscientist.de/). Er ist weiters
studierter Biochemiker - also Naturwissenschaftler, doch wenn mich nicht alles täuscht, kam in 
seinem Studium die Entwicklung mit der aktuell in den Naturwissenschaften beliebtesten Sprache,
Python, nicht allzu intensiv vor. Ich selbst habe mal Python im Mittelschulrahmen unterrichtet 
(und dafür auch zuvor gelernt :-) ). Das ist allerdings schon 15 Jahre her. Meine Erinnerungen an
Python sind durchwegs positiv, auch wenn die vielleicht interessanteste Art für unser Projekt mit 
Python zu interagieren, damals noch gar nicht gab: Jupyther Notebooks. Wir könnten darin quasi in
einer Art wissenschaftlichem Paper unsere Dokumentation erläutern und auch gleich anhand der echten
Daten implementieren. Es gibt sogar eine Python Bibliothek zum Import von Daten auf .fit-files.
Zur Erinnerung: Das sind die Dateien, die die Garmin Uhren erzeugen. Allerdings hat dieser Importer
bei meinem Test Probleme mit den Stryd Erweiterungen im File - nun, we are digging into a rabbit hole
already, würden englischsprachige Entwickler jetzt sagen, wir gehen eventuell mit den Überlegungen
schon zu sehr in die Details. Wesentlicher ist allerdings folgendes: Juypther Notebooks lassen sich 
auch im Web publizieren, allerdings sind die meisten User sie wohl nicht gewohnt. Es wäre vielleicht
ein interessanter Einstieg in wissenschaftliche, akademische Bereiche der Leistungsanalyse, John Doe
Normaluser ist aber zunächst vermutlich einfach nur überfordert. Im Gegensatz dazu wäre eine 
Erweiterung, etwa um neue Algorithmen, wohl ein Einfaches. Aber wollen wir uns in eine 
wissenschaftliche Nische begeben?

Meine Haus- und Hofsprache war für lange Zeit Ruby. Mit Ruby on Rails gibt es ein hervorragendes
Webframework, das ich fast 8 Jahre lang ausschließlich verwendet habe. Es gibt einen .fit-Parser
(der wieder seine Probleme mit Stryd Daten hat), Teile meiner Tracker Software ließen sich sogar
wieder verwenden. Stefan hat von Ruby (außer durch mich) noch nix gehört, und ob er in eine 
Sprache, die er wohl zu keinem anderen Zweck je wieder verwenden wird, lernen würde?

Warum würde ich ihn eigentlich in die Entwicklung reinziehen wollen? Geteilte Arbeit ist halbe 
Arbeit. Und es macht auch wesentlich mehr Spaß und Probleme in der Entwicklung sind so leichter
zu argumentieren.

Aktuell verwende ich Ruby on Rails für neue Projekte eigentlich nicht mehr. Ich setze für 
Webanwendungen auf Elixir und Phoenix. .fit-Parser gäbe es hier noch keinen, er ließe sich aber
jedenfalls Entwickeln. Phoenix Applikationen skalieren hervorragend - aber um wieviele User geht
es eigentlich? Wir hatten doch von self hosting gesprochen: Nur in welchem Sinne. 3 Schweinehunde
für ihre Community oder jede:r Läufer:in für sich selbst? Auch hier gilt: Stefan bringt wohl 
keine Erfahrung mit, bei mir sind es etwa 2 Jahre. Noch einen Haken gibt es: Phoenix Applikationen
sind zwar nicht allzu schwer zu hosten, allerdings gibt es relatix wenige Provider, die es "out of
the box" anbieten. Für Ruby ist dies wohl etwas besser, für Python wieder etwas verbreiteter,
jedenfalls aber kein Vergleich etwa zu PHP, das annähernd jeder Provider anbietet.

Ach ja, ich vergaß: Zu Python gibt es auch Webframeworks, das bekannteste unter ihnen Django,
das ähnliche Prinzipien verfolgt wie Ruby on Rails, mir also von den Konzepten vertraut ist.
So könnten Teile des Jupyther Notebooks auch in einer Multiuser Webapplikationen verwendet werden.

Bislang sprach ich von Webapplikationen, also Software, die man auf einem Webserver installiert
und die dann im Browser (ruhig auch auf einem Smartphone) aufgerufen werden. Aber es gäbe auch 
einen ganz anderen Ansatz: Den Weg einer mobilen App zu gehen.

Ich habe mich im letzten Jahr mit der Entwicklung von Android Applikationen mittels der Sprache
Kotlin beschäftigt. Mit Kotlin Native verspricht die Firma Jetbrains dann auch die Entwicklung
von Cross Plattform Mobile Apps, also auch für iOS zu ermöglichen. Allerdings ist dies bislang
bestenfalls im Prototypen Stadium. Daher ware ich mit Kotlin bisher recht zögerlich.

Vor kurzem aber tat sich eine weitere Option auf: Das Farmework Flutter, das von Google entwickelt,
für die cross plattform Entwicklung (Android + iOS) entwickelt wird. Es ist noch recht neu, aber
ich lerne gerade, dass mittlerweile alle Bibliotheken, die wir benötigen würden, wohl verfügbar 
wären - mit Ausnahme des .fit-Parsers. Der wäre aber auch in Kotlin selbst zu schreiben...
Also etwa die Abfrage von APIs (Daten aus Strava, ...) ist möglich - ich nenne Garmin hier bewusst
nicht, denn man glaubt bei Garmin für den API Zugriff auch die eigenen Daten 5000 EUR verlangen
zu können).

Also statt eines Webservers, die eigenen Laufdaten komplett auf dem Handy? Kann das gehen?
Ja: Flutter apps kompilieren zu nativem Code, d.h. sie laufen direkt auf der Hardware (etwa
im Gegensatz zu Javascript in einer Webseite, das einen Interpreter benötigt). Auch die Datenhaltung
in einer Datenbank ist durch SQLite möglich. Dazu eine kurze Abschätzung: Wir laufen in der 
Vorbereitung auf den Münchenmarathon (den letzten Post haben Sie gelesen?) etwa 150 Läufe. Nehmen
wir an, jeder Lauf benötigt im Schnitt rund eine Stunde. Wir sammeln in jeder Sekunde des Laufes
einen Datenpunkt (oder Datensatz) der aus Rund 20 Werten besteht.
8 Bytes * 20 Werte * 3600 Sekunden * 150 Läufe = 83 MB
Nehmen wir noch einige MB an Daten für die Metadaten auf Laufebene und Läufer:innenebene hinzu,
landen wir vielleicht bei 100 MB. Das könnte ein gebräuchliches Smartphone sogar im Speicher halten.
Die Speicherung der Daten einer Läufer:in in einer SQLite Datenbank ist kein technisches Problem.

Aber wie würden Läufer:innen dann ihre Daten publizieren? Dazu spontan 2 Ideen:
* Es gibt mehrere Static Site Generator für Dart, die Webseite könnte also am Smartphone erstellt
und dann auf einen Webserver geschoben werden.
* Wir erstellen auch eine minimaltische Webapplikation zur Darestellung, in die die Smartphones
dann ihre Daten senden.

Das waren mal die rudimentären technischen Überlegungen, die ich bislang noch nirgendwo 
geäußert habe. Mal sehen was Stefan dazu sagt :-) Alle anderen bitte ich wieder um Kommentare
per Email an <stefan@3-schweinehun.de>.

Ja ich weiß, auf die Anforderungen Stefans in seinem Blogpost bin ich diesmal wieder nicht 
eingegangen, das werde ich im nächsten Post machen. Ich glaube aktuell noch, dass diese unabhängig
von den hier geschilderten Ansätzen sind und in allen Varianten realisiert werden können.
Wir werden sehen...
