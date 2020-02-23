---
title: Software Entwicklung
layout: page
permalink: entwicklung/
---

Unter der Marke [mittenin.at](http://mittenin.at) entwickle ich mit
Michael Stranka **Webanwendungen**. Wir bieten **Rapid Application
Development** par excellence auf Basis des **Ruby on Rails**
Frameworks.

Durch den hohen Abstraktionsgrad der Sprache Ruby und des darauf
aufsetzenden Ruby on Rails entwickeln wir mit einer Effizienz, die von
großen Teams nicht erreicht werden kann. Wir sprechen direkt mit unseren
Kunden und setzen ohne störende Vermittler die Anforderungen unmittelbar
um.

Unsere Services enden aber nicht bei der Entwicklung, wir unterstützen
den gesamten Produktlebenszylus unserer Entwicklungen von der Konzeption
bis zum Hosting und dem Support. [Let's talk about Rails!](http://mittenin.at)

Warum Ruby on Rails?
--------------------

### Kurz zur Geschichte

Michael Stranka und ich hatten beschlossen, gemeinsam Webanwendungen zu
schreiben, wir wollten uns auch auf eine Sprache verständigen und die
Verwendung perfektionieren.

Wir wollten das Rad nicht neu erfinden, sodass schnell klar wurde, dass
wir ein Applikationsframework einsetzen wollten. Der Trend ging schon
damals weg von den monolitischen Frameworks wie .NET zu den
MVC-basierten Frameworks wie Django oder Ruby on Rails.

Nachdem ich als EDV-Lehrender unterschiedliche Sprachen gelernt und
gelehrt hatte, und mein Schwerpunkt damals auf Python und Php lag,
evaluierte ich zunächst Django und CakePHP. Auch hatten wir die
Hoffnung, Michaels VB- und .NET-Kenntnisse nutzen zu können, sodass ASP
.NET MVC von Microsoft einer genauen Evaluierung unterzogen wurde.

Letzteres schied relativ rasch aus, das Framework steckte noch sehr in
den Kinderschuhen. Auch wenn Microsoft mit zum Beispiel Codeplex in den
letzten Jahren offene Software propagiert, so ist .NET MVC und alle
darunter liegenden Komponenten noch immer nicht frei.

Das schlussendliche shootout zwischen Django und Rubyon Rails ging zu
gunsten von Rails zunächst mehr aus einer Bauchentscheidung heraus aus.
Dadurch hatte keiner von uns beiden einen entscheidenden Vorteil. Zum
Vorteil für uns beide gereit aber die Community und Infrastruktur, die
sich um Ruby on Rails ausgebildet hatte. Mit über 37 000 Bibliotheken -
in Ruby Gems genannt - gibt es einen riesigen Schatz von ausgereiften
Methoden und Komponenten.

### MVC

In vielen Kreisen sind MVC-Frameworks noch vollkomment unbekannt. Dabei
ermöglichen sie durch die Trennung in drei Komponenten model - view -
controller die Modularisierung einer Applikation.

Das Model steht für das Datenmodell, hier wird die Ablage der Daten in
der Datenbank abstrahiert. Auf die Einträge der Datenbank wird nicht
direkt, sondern über einen Objekt-Relational-Mapper zugegriffen. Zum
Beispiel kann mittels `@order.customer.address.zipcode` direkt auf die
Postleizahl des Kunden zu einer Bestellung zugegriffen werden, die
Abbildung auf SQL-Statements erfolgt im Hintergrund automatisch. Für
nicht relationale Datenstrukturen bieten sich auch ebensolche
Datenbanken an - wie key-value stores, und Anderes mehr.

Das V steht für den View, die Darstellungslogik. Wir schreiben den Code
in erb-Tamplates eine speziellen Auszeichnungssprache, die eine Mischung
aus Ruby und HTML ist. Im Hintergrund gibt es für die Darstellung
schlussendlich noch CSS-Stylesheets, für die Dynamik der Oberfläche
Javascript, etwa, um AJAX-Calls zu ermöglichen. Sie kennen diese zum
Beispiel von Google. Noch ohne, dass die Seite im Webbrowser
aktualisiert worden wäre, erhalten Sie nach den ersten Buchstaben der
Eingabe bereits dynamisch Vorschläge zu Suchbegriffen, die im
Hintergrund vom Server geholt worden sind.

Fehlt noch der Controller. Er ist die Verbindung zwischen
Darstellungslogik und Datenmodell, man kann ihn als die Businesslogik
bezeichnen.

### Ruby on Rails

Es fehlen in meiner Darstellung noch zwei wesentliche Grundsätze von
Ruby on Rails: DRY und convention over configuration

DRY steht für Don't repeat yourself, Code soll in einer Anwendung nicht
mehrfach vorkommen. Eine Duplizierung macht den Code nicht nur länger,
sondern auch fehleranfällig.

Rails ist opionated, es hat eine eigene "Meinung", die Webapplikationen
gebaut werden sollten. Dies unterstreicht das damit, dass es für alle
Einstellungen eine Voreinstellung gibt - also ein Konvention. Nur wenn
wir uns nicht an diese Konvention halten, erstellen wir einen
Konfigurationseintrag. Ruby on Rails ist mittlerweile acht Jahre alt und
kann bereits seit gut fünf Jahren als ausgereift betrachtet werden. Es
wurde von Anfang an auf Einsatz im professionellen Umfeld getrimmt und
wird kontinuierlich von einer großen Community weiterentwickelt. Das
Kernteam besteht aus großartigen Spezialisten, die den ursprünglichen
Fokus von Ruby on Rails nicht aus den Augen lassen. In den letzten
Jahren wurde der Wert besonders auf die Geschiwindigkeit des Produktes -
der Webapplikation - gelegt. Beurteilen Sie selbst an der
Ladegeschwindigkeit dieser Webseite, die von einem Server ausgeliefert
wird, der älter als Rails selbst ist.

### Ruby

Ruby ist eine dynamisch typisierte, reflexive, objektorientierte,
interpretierte Sprache, seit 1993 von Yukihiro „Matz“ Matsumoto,
mittlerweile gemeinsam mit einem Team entwickelt. Ruby Code ist "schön",
es ist sehr klar, besitzt keine unnötige Klammerung und kann auch von
Programmierlaien gut gelesen werden.

Diese gute Lesbarkeit überträgt sich auf Rails und auch auf unsere
Programme. Wir schreiben schon in unserem eigenen Interesse sehr klaren
Code, die Applikation ist schlussendlich beinahe eine DSL, eine
domänenspezifische Sprache. Ich denke, Sie wissen sofort, was gemeint
ist, wenn ich mich an der Konsole der Applikation anmelde und
`Customer.find_by_name("Stefan Haslinger").delete` eingebe. Genau! Ich
lösche mich in meinem Webshop selbst...

Falls ich ihr Interesse an Ruby geweckt habe, schauen Sie doch unten in
den Wikipedia Artikel. Doch Vorsicht: Mich hat Ruby dann nicht mehr
losgelassen!

### Rapid Application Development

Rapid Application Deleopment - also die schnelle Anwendungsentwicklung -
wird oftmals als Argument für eine bestimmte Vorgehensmethode oder
Technologie genannt. In unserem Fall wirklich zurecht. Durch die hohe
Abstraktion der Programmiersprache Ruby selbst, aber auch des Ruby on
Rails Frameworks wird in Kombination mit den Prinzpien DRY und
convention oder configuration auch nur ein minimum an Code geschrieben.
Dies wird die Verwendung von Plugins bzw. Modulen, die in Ruby Gems
genannt werden, weiter reduziert.

Als Beispiele hier die Liste der Gems, die für dieses CMS in Verwendung
sind:

-   sqlite3: Eine filebasierte, resourcenschonende Datenbank
-   devise: Bietet ein Self-Service für die Accountanlage und
    -verwaltung out of the box. Die Acocunts werden hier für das
    Zuordnen der Kommentare und damit die Verringerung des
    Spamaufkommens verwendet.
-   cancan: Zur gezielten Verrechtung der einzelnen Aktionen im CMS.
-   paperclip: Zum Upload von Bildern und Attachmens
-   ancestry: Zur hierarchischen Verwaltung der Menüeinträge und der
    Kommentare
-   will\_paginate: Zum Paginieren der Übersichsseiten
-   gravtastic: Zum Einbinden von Gravatarbildern
-   ckeditor: WYSIWYG-Editor für das Autorenbackend
-   truncate\_html: Eine kleine Helpermethode für die Vorschau von
    Artikeln und Blogposts
-   twitter: Zum Auslesen der Tweets
-   rails\_autolink: Zum Verwandeln von URLs in Tweets
-   jquery-rails: Zum Einbinden der mächtigen JQuery-Bibliothek für
    Animationen, etc.

### Ihre Vorteile

Damit ergeben sich für Sie eine Menge Vorteile, wenn Sie mit Michael
Stranka und mir ein Projekt verwirklichen:

#### Vorteil 1: Individuelle Softwarelösung passgenau zu Ihrer Anforderung

-   Die Entwicklung richtet sich ausschließlich nach Ihren Bedürfnissen.
    -   Fehlen Ihnen Funktionen zur Unterstützung Ihrer
        Geschäftsprozesse, können wir und eine ständig wachsende
        Entwicklerbasis diese umsetzen.
    -   Es gibt damit kein Lock-in zu mittenin.at . Wir sind aber
        sicher, dass Sie uns nach kurzer Zusammenarbeit gar nicht mehr
        missen wollen.
-   Kleine Anwendungen sind mit geringem Overhead umsetzbar.

#### Vorteil 2: Die schnelle Verfügbarkeit Ihrer maßgeschneiderten Lösung

-   Wir haben nur kurze Entwicklungszeiten durch hohen Abstraktionsgrad
    des Framework Ruby On Rails
    -   Die Trennung von Darstellung, Businesslogik und Datenhaltung
        ermöglicht Theming. Stylesheets lassen Anwendungen im von Ihnen
        gewünschen Look & Feel erscheinen. Entweder passt sich die
        Anwendung, an den bereits im Intra- oder Internet genutzten Stil
        an oder wir schöpfen aus dem Fundus von tausenden kommerziell
        verfügbaren Themen - etwas vom renommierten
        Hersteller ThemeForest.
    -   Sind Sie an die Zusammenarbeit mit einem bestimmten Designer
        gewöhnt, so können wir dessen CSS-Stylesheets und
        HTML-Templates verwenden.
-   Eine Besonderheit ist die einfache Bereitsstellung eines Protoypen
    zur Abstimmung der Anforderungen.
-   Echtdaten (z.B. Produktstammdaten) können bereits ab dem ersten
    Prototyp eingegeben und weiterverwendet werden.
-   Mehrere Instanzen mit geringem Aufwand erstellbar, z.B. für ein
    Testsystem, ein Quality Assurance System, ein Performance Test
    System, etc.
-   Webanwendung müssen nicht installiert werden.
    -   Die "Turnschuhadministration" mancher proprietärer Lösungen
        bleibt ihnen erspart.
    -   einfache Benutzung: Alle Mitarbeiter sind mit dem Umgang eines
        Webbrowsers vertraut. Durch die Einhaltung von Webstandards
        können alle bekannten aktuellen Webbrowser verwendet werden.
    -   keine Softwareinstallation beim Anwender bedeuetet schnellen
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
    -   zukunftssichere Technologie da Ruby On Rails kontinuierlich
        weiterentwickelt wird
    -   ständig wachsende Entwicklerbasis
-   keine Lizenzkosten
-   keine Rollout-Kosten beim Anwender durch Webanwendung

#### Vorteil 4: Zeit für's Geschäft statt Fehlersuche

-   Wir bieten durch unsere jahrelange Erfahrung eine hohe Code Qualität
    -   kompakter Code bedeutet weniger Code Zeilen. Das bedeuetet
        statistisch weniger Fehler im Code.
    -   gut lesbarer Code bedeuet einfache Reviews, kurze
        Einarbeitungszeiten
    -   zusätzliche Sprachversionen erzeugen keinen neuen Code
-   vollständige Testbarkeit
    -   Zur Qualitätssicherung kann der ganzer Code anhand der User
        Stories gestestet werden.
    -   Das Framework selbst beinhaltet einen kompletten Satz von Tests
    -   Tests können unabhängig von der Applikation durchgeführt werden
        (Blackbox Test)
    -   alle Teststrategien sind einsatzbar, etwa: functional testing,
        behaviour driven testing, unit testing, integration testing

#### Links

-   [mittenin.at](http://mittenin.at/)
-   [Ruby](http://www.ruby-lang.org/de/)
-   [Ruby on Rails](http://rubyonrails.org/) und [Ruby](http://de.wikipedia.org/wiki/Ruby_(Programmiersprache))
-   [RAD (Rapid Applikation Development)](http://en.wikipedia.org/wiki/Rapid_application_development)
-   [AJAX](http://de.wikipedia.org/wiki/Ajax_(Programmierung))
-   [Rubygems](http://rubygems.org/)
-   [MVC](http://de.wikipedia.org/wiki/Model_View_Controller)
-   [Microsoft ASP .NET MVC](http://www.asp.net/mvc)
-   [Django](https://www.djangoproject.com/)
-   [CakePHP](http://cakephp.org/)