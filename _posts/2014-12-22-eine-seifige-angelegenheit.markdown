---
layout: post
title: Eine seifige Angelegenheit
date:   2014-12-22 08:00:00 +0200
---

## Umstellung der Payment Schnittstelle auf SOAP

Mit Seife hat SOAP eigentlich nichts zu tun, dennoch hatten wir einige
Tage das Gefühl mehr zu schlittern denn zu programmieren. Doch der Reihe
nach:

SOAP ist die Abkürzung für Simple Object Access Protocol, es handelt
sich dabei um ein Netzwerkprotokoll, mit dem Daten zwischen Systemen
ausgetauscht werden und Aktionen angestoßen werden können.

Die bisherige Implementierung der E-Payment Schnittstelle ist nicht
besonders sicher, deshalb haben wir uns zu einer Umstellung
entschlossen.

Bislang kommunizieren wir mit dem Testsystem unseres Zahlungsproviders
und können darin Zahlungen veranlassen.

Die größte Hürde stellten zwei Probleme dar, zum einen erhielten wir
zunächst falsche Daten für den Zugang in das Testsystem. Zum anderen
hatte die Dokumentation der SOAP Schnittstelle einen erheblichen
Fehler.

Nach mehrmaliger Kommunikation mit dem Provider haben wir nun aber diese
Probleme gelöst.

Das Templatesystem
------------------

Wir haben unsere Templatesprache erweitert: Photos können nun in allen
automatisch erstellten Größen unmittelbar ausgegeben werden.

Zum Beispiel erzeugt man ein kleines "daumennagelgroßes" Bild von
100 Pixel Kantenlänge mittels

    <photo name="«Platzhaltername»" size="thumb" />

Die weiteren Größen sind small (250 Pixel Kantenlänge) und medium (500
Pixel Kantenlänge).

Die Templatesprache ist nun auch im System in Form eines
selbsterklärenden Templates dokumentiert, Anregungen zu Verbesserung
werden gerne entgegen genommen. ;-)

{% highlight xml %}
<!-- Dieses Template dient zur Erklärung, wie Templates möglichst einfach erstellt werden können.-->

<!-- Kommentare:
     Templates können Kommentare enthalten, dies und der Kommentar darüber ist ein Beispiel für die Syntax.
     Kommentare können auch mehrzeilig sein.

     Zweck von Templates:
     Um die Struktur gleich aufgebauter Webseiten nicht auf jeder Webseite neu definieren zu müssen, gibt es Templates.
     Für jede Webseite der Website ist ein Template zuzuweisen.
     Templates können in beliebig vielen Webseiten verwendet werden.

     Platzhalter:
     Um an gewissen Stellen des Templates Inhalt webseitenspezifisch zuzuweisen, werden Platzhalter verwendet.
     Diese Platzhalter sind in der Liste der Platzhalter in der Templatepflege durch Beistriche getrennt anzugeben.
     In diesen Template verwenden wir die Platzhalter beispielbild, beispieltext1 und beispieltext2.

     DRYML:
     Templates können in ERB oder in DRYML erfasst werden.
     Da die Erstellung in DRYML einfacher ist, werden wir sie hier vorziehen.
     Um ein DRYML Template zu erstellen klickt man die Checkboy DRYML oben an.

     DRYML ist im Prinzip HTML, mit 2 Unterschieden.
     1 Tags, die keinen Inhalt haben, müssen geschlossen werden.
       zum Beispiel ist nur der Tag <br/> gültig, nicht aber <br>
     2 Es gibt neue Tags, die in Mercator definiert wurden, um die Einbindung von Inhalten zu vereinfachen.
       Konkret weisen wir in der Webseitenpflege jedem Platzhalter genau einen Baustein zu.

     Bootstrap 3:
     Unsere Templateengine versteht alle Komponenten des Twitter Bootstrap Frameworks in der Version 3:
     http://getbootstrap.com/
     Damit können viele unterschiedliche Komponenten mit geringem Aufwand eingabaut werden.

     Der Inhalt eine Seite wird im content:-Tag des page-Tags definiert
     (Der Doppelpunkt hinter content ist wesentlich.) -->


<page title="Home">
  <content:>

    <!-- Das Grid:
         Inhalt wird zunächst zeilen- und dann innerhalb spaltenweise definiert.
         Beginnen wir mit dem einfachen Fall: Eine Zeile mit einer Spalte mit einem Beispieltext. -->

    <!-- Wir eröffnen eine Zeile: -->
      <div class="row">

        <!-- Eine Zeile ist 12 Einheiten breit, unser Element soll über die gesamte Breite gehen -->
        <div class="col-lg-12">

          <!-- Um textlichen Inhalt einzubetten, verwenden wir den Container-Tag,
               im Attribut name geben wir den Namen des Platzhalters an -->
          <container name='beispieltext1'/>
        </div>
      </div>


    <!-- Als nächstes Beispiel stellen wir zwei unterschiedlich breite Spalten dar,
         im linken Drittel den beispieltext2, im Rest wieder den beispieltext1 -->
    <div class="row">
      <div class="col-lg-4">
        <container name='beispieltext2'/>
      </div>
      <div class="col-lg-8">
        <container name='beispieltext1'/>
      </div>
    </div>

    <!-- Zum Abschluss drei Spalten mit einem Beispielbild in der Mitte
         der Tag heisst photo, der name des Platzhalters ist wieder im name Attribut anzugeben. -->
    <div class="row">
      <div class="col-lg-4">
        <container name='beispieltext2'/>
      </div>
      <div class="col-lg-4">
        <photo name='beispielbild' width="100%"/>
        <!-- Wir geben 100% als Breite an, damit das Bild die gesamte Spalte ausfüllt.
             Würden wir die Breite nicht angeben, würde es in Originialgröße dargestellt,
             damit könnte es kleiner als die Spaltenbreite sein, aber auch über die Spalte hinausstehen. -->
      </div>
      <div class="col-lg-4">
        <container name='beispieltext1' />
      </div>
    </div>
  <!-- Wir müssen noch die geöffneten Tags content: und page schliessen. -->
  </content:>

</page>
{% endhighlight %}


Vermischtes
-----------

-   Als weitere externe Datenquelle haben wir eine Produktsyndikation
    eines Hardwareherstellers eingebunden.<br/>
    Der Aufwand dafür ist mit der Erstellung eines DRYML-Tags
    überschaubar geblieben.
-   Es gab eine Überarbeitung des XML-Updatejobs.
-   Der Artikelimport wurde optimiert
-   Die Jobs zur automatischen Löschung veralteter Benutzer und leerer
    Warenkörbe wurde überarbeitet.