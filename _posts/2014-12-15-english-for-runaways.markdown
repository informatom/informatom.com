---
layout: post
title: English for Runaways
date:   2014-12-15 08:00:00 +0200
---

Der Titel stammt von einem heiteren Buch über zu wörtliche
Übersetzungen ("Englisch für Fortgeschrittene"), uns war mit dem
Problem, dass die Administrationsoberfläche scheinbar willkürlich die
Sprache wechselte, eher zum Fortlaufen...

Übersetzung der Adminoberflächen
--------------------------------

Die anspruchsvollste Aufgabe dieser Woche war die in der vorletzen Woche
angedeutete Lösung des Problems der Übersetzung der
Administrationsoberfläche.

Zunächst waren wir überrascht, dass die Sprache scheinbar völlig
zufällig wechselte und nicht mehr mit der aktuellen Spracheinstellung
des Benutzers übereinstimmte.

Bei genauerem Nachdenken wurde der Grund klar:

Die Javascript Files, aus denen die Interfaces mit w2ui gebaut werden,
werden vom Browser des Benutzers beim Rendern der HTML Seite über die
Rails Asset Pipeline angefordert.

Diese liefert die (am Server vorkompilierten) Assets aus. Die momentan
aktuelle Sprache beim Kompilierungszeitpunkt entscheidet daher über die
verwendete Sprache beim Parsen der js-erb-Templates (Javascript +
Embedded Ruby).

Kurz haben wir überlegt, hier auf die Übersetzung zu verzichten. Aber
wir haben bereits einiges an Mühe und Zeit in die vollständige
Übersetzbarkeit investiert.

Eine Alternative wäre gewesen, die Asset Pipeline nicht mehr zu
verwenden. Allerdings hätten wir dann die Aufgaben der Kompilierung
selbst durchführen müssen oder auf ein riesiges, praktisch unwartbares
Javascript-File pro Administrationsschirm wechseln müssen. Da die
Auslieferung nicht über die Assetpipeline (und damit produktiv direkt
per Apache Webserver), sondern per Templates und damit über den
Applikationsserver erfolgt wäre, hätten wir auch Performance eingebüsst.

Die Rettung war ein Gem names i18n-js. Es ermöglicht, den Zeitpunkt der
Übersetzung zu ändern. Das funktioniert, indem man zunächst
konfiguriert, welche Bereiche der yml-Überstezungsdateien überhaupt
benötigt werden. Aus diesen generiert die Asset Pipeline dann Files, in
denen alle Strings in allen Übersetzungen als Javascript Hashes abgelegt
sind.

Dies sind pro Administrationsseite etwa 100 Strings und damit gerade mal
ein paar Kilobyte Text, der sich gut für die Übertragung komprimieren
lässt.

Die Webseite lädt nun den nicht übersetzte Javascript Code, die Strings
und eine kleine Javascript Bibliothek zum Übersetzen in den Browser und
dieser übersetzt on the Fly vor der Darstellung. Das ist schnell und wir
haben nun wieder eine vollständig lokalisierte Applikation.

Netterweise ist auch die Syntax annähernd gleich, statt
`<%= I18n.t('mercator.are_you_sure\") %>` steht einfach
`I18n.t('mercator.are_you_sure\")` im erb-File. Das ist im Allgemeinen
sogar weniger Tipparbeit.

Ein einziges Mal war die Erstellung schwer, nämlich beim dynamischen
Zusammenbauen der Stati

{% highlight ruby %}
items: <%= a = Category::Lifecycle.states.*[0].map {
  |state| \"{id: '\" + state.to_s + \"', text: I18n.t('mercator.states.\" + state.to_s + \"')}\"
}.to_s.gsub('\"','') %>
{% endhighlight %}

Die korrekte Interpolation der Strings (man beachte die interessante
Schachtelung der Anführungszeichen) hat einige Knoten in den Gehirnen
erzeugt.

Vermischtes
-----------

-   Wir haben die Jobs der Artikelpflege (aus ERP und Herstellerkatalog)
    überarbeitet und beschleunigt und die Protokolle auf
    Fehler überprüft.
-   Der Tag, die eine übersichtliche Selektion eines Wertes aus einer
    Baumstruktur ermöglicht, <tree-select-one /> hatte einen Fehler.

<hr/>
![Tree select one](/img/blog/tree-select-one.png){:style="max-width: 100%"}
<hr/>

-   Wir haben begonnen, die Payment Schnittstelle von einfachen Web
    Requests auf SOAP umzustellen. Der höhere Implementierungsaufwand
    wird sich in der weitreichenderen API und in einer Erhöhung der
    Zuverlässigkeit der Schnittstelle rechnen.
-   Aus dem Produktmanager können nun auch die Produktkategorien
    gepflegt werden, die meisten Eigenschaften per Formular, alle
    Eigenschaften können über einen Link zur bestehenden
    Kategorienpflege erreicht werden. Nach Speichern der Änderungen
    kehrt die Navigation automatisch in den Produktmanager in die
    richtige Kategorie zurück.
-   Im Content Manager können die wesentlichen Eigenschaften der
    Webseite unmittelbar per Formular gepflegt werden.
