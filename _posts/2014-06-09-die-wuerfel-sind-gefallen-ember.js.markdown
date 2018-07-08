---
layout: post
title: Die Würfel sind gefallen - Ember.js
date:   2014-06-09 08:00:00 +0200
---

## Das Javascript Framework Ember.js

Wie bereits im letzten Artikel angekündigt, haben wir uns für ein
Javascript Framework entschieden: Ember.js (<http://emberjs.com/>).

Bei Ember handelt es sich - nicht unähnlich zu Ruby on Rails - um ein
MVC Framework, nur dass dieses im Browser des Benutzers läuft und nicht
am Server.

Es gibt gravierende Unterschiede in den beiden Frameworks, sodass eine
steile Lernkurve auf uns wartet, die Vorteile der neuen Komponente
werden aber unseren Aufwand rechtfertigen.

Die wichtigsten Gründe für Ember und gegen die großen anderen Javascript
Frameworks (wie Angular, Backbone, Meteor, Knockout, Dojo, React, ...)
sind für uns:

-   Der Projektleiter Yehuda Katz ist uns persönlich bekannt, wir haben
    bei einer Rails Konferenz vor über zwei Jahren in Berlin mit
    ihm gesprochen. Seine Ankündigungen von damals wurden vom
    Projektteam von Ember.js nicht nur wahr gemacht,
    sondern übertroffen.
-   Die stabile Version Ember.js 1.0 ist nun mehrere Monate im Umlauf
    und ausreichend im Einsatz
-   Die Dokumentation von Ember.js ist vollständing (Guides + API) und
    verständlich
-   Die Rails - Integration von Ember.js mittels des Ember-Rails Gems
    ist vom Ember.js Core Team unterstützt
-   Yehuda Katz selbst war Ruby On Rails Core Entwickler und Lead
    Entwickler von Ruby On Rails 3.0
-   Die Firma hinter Ember.js, Tilde.io vertreibt als Hauptprodukt ein
    Ruby On Rails Monitoring Service, Ruby On Rails Unterstützung ist
    daher für die Zukunft gewährleistet.
-   Ember.js verfolgt den Framework Ansatz (im Gegensatz zu
    einer Bibliothek) und ist von keinen weiteren Komponenten (außer
    JQuery, das wir ohnehin für Ruby On Rails und Twitter Bootstrap
    benötigen und verwenden) abhängig.
-   Der Hype um Ember.js ist wesentlich geringer als der um Angular oder
    Meteor, es geht mehr um die Tauglichkeit im Business Einsatz als um
    die Verwendung der neuesten Technologie
-   Ember.js ist testbar
-   Ember.js ist problemlos mit Bootstrap verwendbar, wir können bereits
    Twitter Bootstrap 3 lernen und verwenden, ohne die Rails Applikation
    zu stören.

Wir werden im ersten Schritt die Vertragskalkulation in Ember.js
abbilden und erst dann die Ruby On Rails Integration in Angriff nehmen.

Die Datenmodelle, die war in Ruby On Rails benötigen, pflegen wir
synchron: Verträge, Vertragspositionen und Verbräuche.

Wir benötigen unmittelbar eine Datepickerkomponente zur bequemen Eingabe
von Daten, die wir uns selbst in Form eines Viewhelpers schreiben und
als JSBin unter <http://emberjs.jsbin.com/sotuf/10/edit> veröffentlichen.

### Datepicker

<hr/>
![JSBin](/img/blog/jsbin.png){:style="max-width: 100%"}
<hr/>

Wir beschließen, für's erste keine Unittests zu schreiben, um die
Lernkurve flacher zu halten. Wir erstellen, wie üblich, die
Hobo-seitigen Modeltests.

Die Übertragung sämtlicher Formeln aus einer Beispielkalkulation des
ersten Referenzkunden nach Javascript funktionieren problemlos. Die
Performance ist ausgezeichnet, das Gefühl der Benutzer ist noch
unmittelbarer als bei früher verwendeten Excel-Sheets, da die Daten bei
jedem Tastendruck aktualisiert werden.

Wir verwenden wie üblich sprechende Variablennamen, womit die
Kalkulationen wesentlich einfacher zu verstehen sind, als in den
originalen Excel-Sheets mit ihren Zellenreferenzen.

Für die Darstellung verwenden wir erstmals Bootstrap 3 und beschließen
möglichst bald auch den restlichen Shop zu Twitter Bootstrap 3 zu
aktualisieren. Hobo unterstützt derzeit allerdings nur Twitter Bootstrap
2.3.2.

Trotz des Umfangs des neu verwendeten Frameworks erreichen wir innerhalb
dieser Woche einen Fortschritt, der uns selbst überrascht.