---
title: Methodik & RAD
layout: page
permalink: methodik-rad/
---

Ich biete **Rapid Application Development** par excellence auf Basis des **Ruby on Rails**
Frameworks.

Durch den hohen Abstraktionsgrad der Sprache Ruby und des darauf aufsetzenden Ruby on Rails
entwickle ich mit einer Effizienz, die von großen Teams nicht erreicht werden kann. Ich spreche
direkt mit meinen Kunden und setze ohne störende Vermittler die Anforderungen unmittelbar um.

Meine Services enden aber nicht bei der Entwicklung, ich unterstütze den gesamten
Produktlebenszyklus meiner Entwicklungen von der Konzeption bis zum Hosting und dem Support.
[Let's talk about Rails!](/kontakt)

Warum Ruby on Rails?
--------------------

### MVC

In vielen Kreisen sind MVC-Frameworks noch vollkommen unbekannt. Dabei ermöglichen sie durch die
Trennung in drei Komponenten model - view - controller die Modularisierung einer Applikation.

Das Model steht für das Datenmodell, hier wird die Ablage der Daten in der Datenbank abstrahiert.
Auf die Einträge der Datenbank wird nicht direkt, sondern über einen Objekt-Relational-Mapper
zugegriffen. Zum Beispiel kann mittels `@order.customer.address.zipcode` direkt auf die
Postleitzahl des Kunden zu einer Bestellung zugegriffen werden, die Abbildung auf SQL-Statements
erfolgt im Hintergrund automatisch. Für nicht relationale Datenstrukturen bieten sich auch
ebensolche Datenbanken an - wie key-value stores, und Anderes mehr.

Das V steht für den View, die Darstellungslogik. Ich schreibe den Code in erb-Templates, einer
speziellen Auszeichnungssprache, die eine Mischung aus Ruby und HTML ist. Im Hintergrund gibt es
für die Darstellung schlussendlich noch CSS-Stylesheets, für die Dynamik der Oberfläche
Javascript, etwa, um AJAX-Calls zu ermöglichen. Sie kennen diese zum Beispiel von Google. Noch
ohne, dass die Seite im Webbrowser aktualisiert worden wäre, erhalten Sie nach den ersten
Buchstaben der Eingabe bereits dynamisch Vorschläge zu Suchbegriffen, die im Hintergrund vom
Server geholt worden sind.

Fehlt noch der Controller. Er ist die Verbindung zwischen Darstellungslogik und Datenmodell, man
kann ihn als die Businesslogik bezeichnen.

### Ruby on Rails

Es fehlen in meiner Darstellung noch zwei wesentliche Grundsätze von Ruby on Rails: DRY und
convention over configuration.

DRY steht für Don't repeat yourself, Code soll in einer Anwendung nicht mehrfach vorkommen. Eine
Duplizierung macht den Code nicht nur länger, sondern auch fehleranfällig.

Rails ist opinionated, es hat eine eigene "Meinung", wie Webapplikationen gebaut werden sollten.
Dies unterstreicht das damit, dass es für alle Einstellungen eine Voreinstellung gibt - also eine
Konvention. Nur wenn ich mich nicht an diese Konvention halte, erstelle ich einen
Konfigurationseintrag. Ruby on Rails ist mittlerweile über zwanzig Jahre alt und gilt schon lange
als ausgereift. Es wurde von Anfang an auf Einsatz im professionellen Umfeld getrimmt und wird
kontinuierlich von einer großen Community weiterentwickelt. Das Kernteam besteht aus großartigen
Spezialisten, die den ursprünglichen Fokus von Ruby on Rails nicht aus den Augen lassen. In den
letzten Jahren wurde der Wert besonders auf die Geschwindigkeit des Produktes - der Webapplikation
- gelegt.

### Ruby

Ruby ist eine dynamisch typisierte, reflexive, objektorientierte, interpretierte Sprache, seit
1993 von Yukihiro „Matz“ Matsumoto, mittlerweile gemeinsam mit einem Team entwickelt. Ruby Code
ist "schön", es ist sehr klar, besitzt keine unnötige Klammerung und kann auch von
Programmierlaien gut gelesen werden.

Diese gute Lesbarkeit überträgt sich auf Rails und auch auf meine Programme. Ich schreibe schon in
meinem eigenen Interesse sehr klaren Code, die Applikation ist schlussendlich beinahe eine DSL,
eine domänenspezifische Sprache. Ich denke, Sie wissen sofort, was gemeint ist, wenn ich mich an
der Konsole der Applikation anmelde und `Customer.find_by_name("Stefan Haslinger").delete`
eingebe. Genau! Ich lösche mich in meinem Webshop selbst...

Falls ich Ihr Interesse an Ruby geweckt habe, schauen Sie doch unten in den Wikipedia Artikel.
Doch Vorsicht: Mich hat Ruby dann nicht mehr losgelassen!

### Rapid Application Development

Rapid Application Development - also die schnelle Anwendungsentwicklung - wird oftmals als
Argument für eine bestimmte Vorgehensmethode oder Technologie genannt. In meinem Fall wirklich
zurecht. Durch die hohe Abstraktion der Programmiersprache Ruby selbst, aber auch des Ruby on
Rails Frameworks wird in Kombination mit den Prinzipien DRY und convention over configuration nur
ein Minimum an Code geschrieben. Dies wird durch die Verwendung von Plugins bzw. Modulen, die in
Ruby Gems genannt werden, weiter reduziert.

### Ihre Vorteile

Damit ergeben sich für Sie eine Menge Vorteile, wenn Sie mit mir ein Projekt verwirklichen:

#### Vorteil 1: Individuelle Softwarelösung passgenau zu Ihrer Anforderung

-   Die Entwicklung richtet sich ausschließlich nach Ihren Bedürfnissen.
    -   Fehlen Ihnen Funktionen zur Unterstützung Ihrer
        Geschäftsprozesse, kann ich und eine ständig wachsende
        Entwicklerbasis diese umsetzen.
    -   Es gibt damit kein Lock-in an mich als Einzelperson. Ich bin aber
        sicher, dass Sie mich nach kurzer Zusammenarbeit gar nicht mehr
        missen wollen.
-   Kleine Anwendungen sind mit geringem Overhead umsetzbar.

#### Vorteil 2: Die schnelle Verfügbarkeit Ihrer maßgeschneiderten Lösung

-   Ich habe nur kurze Entwicklungszeiten durch hohen Abstraktionsgrad
    des Framework Ruby On Rails
    -   Die Trennung von Darstellung, Businesslogik und Datenhaltung
        ermöglicht Theming. Stylesheets lassen Anwendungen im von Ihnen
        gewünschen Look & Feel erscheinen. Entweder passt sich die
        Anwendung an den bereits im Intra- oder Internet genutzten Stil
        an, oder ich schöpfe aus dem Fundus von tausenden kommerziell
        verfügbaren Themen.
    -   Sind Sie an die Zusammenarbeit mit einem bestimmten Designer
        gewöhnt, so kann ich dessen CSS-Stylesheets und
        HTML-Templates verwenden.
-   Eine Besonderheit ist die einfache Bereitstellung eines Prototypen
    zur Abstimmung der Anforderungen.
-   Echtdaten (z.B. Produktstammdaten) können bereits ab dem ersten
    Prototyp eingegeben und weiterverwendet werden.
-   Mehrere Instanzen mit geringem Aufwand erstellbar, z.B. für ein
    Testsystem, ein Quality Assurance System, ein Performance Test
    System, etc.
-   Webanwendungen müssen nicht installiert werden.
    -   Die "Turnschuhadministration" mancher proprietärer Lösungen
        bleibt Ihnen erspart.
    -   einfache Benutzung: Alle Mitarbeiter sind mit dem Umgang eines
        Webbrowsers vertraut. Durch die Einhaltung von Webstandards
        können alle bekannten aktuellen Webbrowser verwendet werden.
    -   keine Softwareinstallation beim Anwender bedeutet schnellen
        Rollout: Jeder hat jederzeit die aktuellste Version zur
        Verfügung
    -   Zugang über Internet (B2B, B2C) oder Intranet: Soll der Zugang
        auf das System Externen ermöglicht werden, so können dafür
        bereits existente Kanäle genutzt werden - z.B. VPN-Verbindungen
        zu Tochterfirmen, Lieferanten oder Kunden.

#### Vorteil 3: Nachhaltige und ressourcenschonende Umsetzung

-   Geringer Entwicklungsaufwand
    -   kostengünstige Neu- und Weiterentwicklung
-   Die Verwendung des Standard Frameworks Ruby On Rails hat selbst
    viele Vorteile
    -   einfache Neu- und Weiterentwicklung
    -   langfristige Wartbarkeit
    -   zukunftssichere Technologie, da Ruby On Rails kontinuierlich
        weiterentwickelt wird
    -   ständig wachsende Entwicklerbasis
-   keine Lizenzkosten
-   keine Rollout-Kosten beim Anwender durch Webanwendung

#### Vorteil 4: Zeit für's Geschäft statt Fehlersuche

-   Ich biete durch meine jahrelange Erfahrung eine hohe Code-Qualität
    -   kompakter Code bedeutet weniger Code-Zeilen. Das bedeutet
        statistisch weniger Fehler im Code.
    -   gut lesbarer Code bedeutet einfache Reviews, kurze
        Einarbeitungszeiten
    -   zusätzliche Sprachversionen erzeugen keinen neuen Code
-   vollständige Testbarkeit
    -   Zur Qualitätssicherung kann der ganze Code anhand der User
        Stories getestet werden.
    -   Das Framework selbst beinhaltet einen kompletten Satz von Tests
    -   Tests können unabhängig von der Applikation durchgeführt werden
        (Blackbox Test)
    -   alle Teststrategien sind einsetzbar, etwa: functional testing,
        behaviour driven testing, unit testing, integration testing

#### Links

-   [Ruby](http://www.ruby-lang.org/de/)
-   [Ruby on Rails](http://rubyonrails.org/) und [Ruby](http://de.wikipedia.org/wiki/Ruby_(Programmiersprache))
-   [RAD (Rapid Applikation Development)](http://en.wikipedia.org/wiki/Rapid_application_development)
-   [AJAX](http://de.wikipedia.org/wiki/Ajax_(Programmierung))
-   [Rubygems](http://rubygems.org/)
-   [MVC](http://de.wikipedia.org/wiki/Model_View_Controller)
