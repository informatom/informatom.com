---
layout: post
title: Unbrauchbar!
date:   2014-10-20 08:00:00 +0200
---

Bei der Einschulung eines Referenzkunden zur Verwendung des
Administationsinterfaces zeigte sich, dass dieses für ihn weder intuitiv
noch schnell zu bedienen war.

Im Sinne von YAGNI - "You ain't gonna need it" haben wir diesem
Bereich bislang wenig Aufmerksamkeit geschenkt. Unter gewissen
Randbedingungen hatte der Administrator gar bis zu 11 Sekunden auf die
Auffrischung einer Seite zu warten.

Wir haben den ersten Teil des Problems - eine ungünstige
Datenbankabfrage - innerhalb weniger Stunden gelöst, was die maximale
Wartezeit auf 2 Sekunden reduziert hat. Damit ist zwar die Wartezeit
erträglich, die Administration bleibt aber weiterhin unpraktisch. Eine
alternative Lösung muss her!

User erster Ansatz war - ähnlich wie wir es in der Vertragskalkulierung
begonnen haben, eine clientseitige Applikation zu schreiben. Dies wäre
aber mit einigen Wochen Aufwand verbunden gewesen, da uns Ember bei der
Erstellung das Interfaces nicht sehr hilft, erst dann bei der
Businesslogik, die wir aber nicht großartig ändern wollen. Das bisher
verwendete Twitter Bootstrap bietet zwar hübsche Kompontenten, für
Interaktivität zwischen diesen gibt es aber keine Unterstützung. Wir
haben daher kurzfristig recherchiert

und unsere Lösungsansätze in früheren Applikationsentwicklungen
evaluiert und sind schlussendlich bei W2UI (http://w2ui.com/web/)
gelandet.

Es handelt sich bei W2UI um eine Javascript Bibliothek, die
Benutzerinterface-Komponenten grafisch konsistent darstellt und die
darin dargestellten Daten per Ajax in JSON Form lesen kann, anschließend
effizient im Speicher des Browsers verwaltet, im Browserfenster
darstellt und Aktualisierungen wieder per Ajax an den Server übertragen
kann.

Konkret beherrscht W2UI Layouts (Grids), Formulare, Menüleisten
(Toolbars) und Menüs, Sidebars mit Bäumen, Datentabellen (Grids),
Registerreiter (Tabs), Dialoge (Modals) und einige andere nützliche
Javascript-Eerweiterungen wie Datumsformatierung. Das Framework ist
eventorientiert implementiert und ermöglich damit kurz gesagt,
Oberflächen mit dem Look and Feel einen Windows Explorer zu
implementieren.

Wir sehen allerdings schnell, dass uns zwei Aspekte in Zusammenhang mit
Drag and Drop fehlen. Baumstrukturen werden wir über das in der letzten
Woche erwähnte Fancytree implementieren, andere Drag and Drop
Funktionalität mit JQueryUI und den dort enthaltenen Komponenten
Draggable and Droppable. JQueryUI haben wir mit Hobo ohnehin bereits zur
Verfügung.

Das erste Benutzerinterface ist in dieser Woche implementiert worden, es
fehlt zwar noch einiges an Businesslogik hinter dem Interface, wir sind
aber sehr zuversichtlich, dass wir nun auch ein effizientes
Administrationsinterface bauen können.

### Der Contentmanager

<hr/>
![Contentmanager](/img/blog/contentmanager.png){:style="max-width: 100%"}
<hr/>

Der Contentmanager dient dazu, Webseiteinhalte zu organisieren. Jede
einzelne Webseite des Contentmanagement - Teils unserer Applikation
basiert auf einer Webseitenvorlage. In dieser Vorlage gibt es
Platzhalter für Inhalte. Es geht nun darum, dass die Person des Content
Managers Inhalte für diese Platzhalter effizient erzeugen und verwalten
können soll. Eine typischen Webseite beinhaltet um die 1000 Elemente -
teils archiviert, von denen rund 250 auf etwa 100 Seiten aufgeteilt
verwendet werden. Die Aufgabe ist, diese Zuordnungen effizient zu
verwalten und den Überblick zu behalten.

Wir haben nun - durch des Kundenfeedback inspiriert - folgende
Änderungen und Erweiterungen implementiert:

-   Die Elemente selbst können in einer Verzeichnisstruktur verwaltet
    werden (der Verzeichnisbaum ist in der Mitte des
    Screenshots zusehen). Damit sind die Elemente kategorisier-
    und archiverbar.
-   Die Webseitenvorlagen wissen nun von den in ihnen
    verwendeten Platzhaltern.
-   Auf der linken Seite des Screenshots sieht man den Baum der
    Webseiten, geordnet - wie er dem Besucher der Webseite präsentiert
    werden soll.
-   Wählt man eine Webseite aus, sieht man in der zweiten Spalte oben
    die Attribute der Seite, unten die verwendeten Platzhalter und deren
    zugeordnete Elemente (in Orange am Screenshot).
-   Fehlt eine Zuordnung, ist dies am fett gedruckten Text "keine
    Zuordnung" zu erkennen.

Die Person des Content Manager kann nun in den Verzeichnissen nach einem
passenden Element suchen: Wählt er ein Verzeichnis, erhält er in der
rechten Spalte die Liste aller Content Elemente dieses Verzeichnisses,
mit einer Voransicht des Textes, etc. Am unteren Bildschirmrand sieht er
eine Voransicht aller Bilder dieser Content Elemente. Er kann durch
Klicken eine Vorschau an Originalgröße erhalten.

Die Elemente sind nun einfach pflegbar. Klickt man ein Element in der
Liste an, ist es ausgewählt und man hat als Optionen verfügbar:

-   Löschen des Elements
-   Pflegen des Elements auf der schen existierenden Ansicht mit WYSIWYG
    Editor
-   Anlegen eines neuen Elements
-   Verschieben des Elements in ein anderes Verzeichnis
-   Zuordnen des Elements zu einem Platzhalter der Webseitenvorlage der
    ausgewählten Webseite.

Um klar zu machen, was mögliche Drag and Drop Ziele sind, sind diese
orange eingefärbt. Die Anfasser der Elemente, die gezogen werden können,
sind grün eingefärbt.

Im Screenshot sieht man oberhalb der Mitte den Mauszeiger, an dem ein
ausgewähltes Element hängt, das gerade per Drag and Drop gezogen wird.
Befindet sich der Mauszeiger an einer Stelle, an der das Element fallen
gelassen werden kann, färbt sich das Ziel von Orange zu Dunkelorange um
(was am Screenshot nicht zu sehen ist).

Im Contentmanager können darüber hinaus Verzeichnisse

-   neu angelegt werden
-   bearbeitet werden
-   gelöscht werden (sofern sie keine Elemente beinhalten oder
    Unterverzeichnisse haben)

Ebenso können Webseiten

-   gelöscht werden
-   bearbeitet werden
-   neu angelegt werden

Der Content Manager ist damit die zentrale Pflegeansicht für die Content
Management-Komponente von Mercator.

Es ist besonders erfreulich, dass der Content Manager auch ausgesprochen
performant ist. Dies hat mehrere Gründe:

-   Der HTML Code der Webseite wird nicht am Server zusammengebaut,
    sondern erst im Browser des Client aus Javascript generiert.
-   Die dargestellten Daten werden erst bei Bedarf vom Server gelesen
    und dann im effizienten JSON Format
-   Die Berechtigungsprüfung erfolgt einmal bei der Anforderung und
    nicht elementweise, wie in Hobo sonst üblich
-   Bilder werden zunächst nur als Thumbnails geladen und erst bei
    Bedarf in voller Größe
-   Wir aktualisieren nur veränderte Daten in der Datenbank und achten
    darauf, Relationen effizient vorzuladen.

Das konkret genannte Beispiel einer Neuaufbauzeit von 12 Sekunden konnte
mit all diesen Maßnahmen unter 100 Millisekunden gedrückt werden.

Damit wurden aus "Unbrauchbar!" "Echt schnell".