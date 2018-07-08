---
layout: post
title: Kaffee gefällig?
date:   2014-06-16 08:00:00 +0200
---

## Migration zu Coffeescript

Wir haben im Zuge des Schreibens der Ember.js-Applikation Javascript in
der Form von CoffeeScript geschrieben. CoffeeScript ist eine Sprache, die
mittels Preprocessor vor der Auslieferung von der Asset Pipeline
nach Javascript kompiliert wird. CoffeeScript-Unterstützung ist in Ruby
On Rails seit einigen Versionen implementiert, wir haben aber alle
bislang auf eine konsequente Verwendung verzichtet.

Interessanterweise hat uns der Umstand, nun mehr Javascript schreiben zu
müssen, dazu gebracht, uns darauf zu einigen, es wieder mit CoffeeScript
zu versuchen. Unten ein Beispiel zur Verdeutlichung der Vorteile:

-   Es werden deutlich weniger Klammern benötigt, diese werden durch
    semantisch bedeutsame Einrückung ersetzt.
-   Funktionen werden durch einen -&gt; Operator gekennzeichnet
-   Hashes können durch Einrückung ersetzt werden
-   Variablen müssen vor ihrer Verwendung nicht mehr deklariert werden.
-   Der letzte Rückgabewert eines Aufrufs innerhalb einer Funktion wird
    als Rückgabewert der Funktion automatisch zurückgegeben.

    Das hat einen psychologisch interessanter Aspekt: Dieses Verhalten,
    das uns anfangs unheimlich erschien, sind wir in Ruby seit Jahren
    gewöhnt und schätzen es dort.

### Vergleich Javascript (links) mit Coffeescript (rechts)

<hr/>
![JS2Coffee](/img/blog/js2coffee.png){:style="max-width: 100%"}
<hr/>

Wir hatten in dieser Woche einige kleinere Probleme mit der
Datenbindung.

Größere Probleme bereitet uns noch das Konzept der asynchronen
Programmierung mittels Promises, auf die wir in einem späteren Artikel
zurück kommen werden, wenn unser Wissen gefestigt ist.

Die Applikation funktioniert nun stand alone im Großen und Ganzen als
clientseitige Ember.js-Applikation und muss noch in die serverseitige
Hobo Applikation integriert werden.

Ember.js hat sich doch als grundverschieden zu Rails erwiesen, was
seinen MVC (Teilung der Logik in Datenmodellierung, Datenbeschaffung und
Darstellung)-Ansatz angeht. Die Controller haben hier eine größere Rolle
als in Rails. Im Detail hat Ember.js meh einen "RMCVLTCT"-Ansatz
mit den Bestandteilen: Router - Model - Controller - View - Layout -
Template - Components -Template in eben dieser Hierarchie. Dies ist
zunächst verwirrend, in Folge aber nützlich, denn es ermöglicht eine
stärkere Modularisierung der Business Logik.