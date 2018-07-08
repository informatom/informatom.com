---
layout: post
title: Going Hobo - going meta
date:   2014-01-13 08:00:00 +0200
---

Dass Mercator unter Zuhilfenahme eines Webapplikationsframeworks
entstehen würde, war von Anfang an klar. Aufgrund der Erfahrungen und
der Präferenzen der Entwickler führte auch kein Web an Ruby On Rails
vorbei. Sehr wohl ist nun eine Entscheidung gefallen, die den Fortgang
des Projektes entscheidend beeinflusst: Die Verwendung von
[Hobo](http://www.hobocentral.net/), dem auf Ruby On Rails aufbauenden
Metaframework.

Zunächst zu den Features, die wir verwenden werden:

Das Berechtigungswesen und das Benutzermodell
---------------------------------------------

Es ersetzt für uns die üblicherweise verwendeten Gems Cancan für die
Berechtigungen und zum großen Teil auch Devise für die
Authentifizierung. Und alles, was wir nicht von der Pike auf selbst
schreiben, sondern jahrelang getestet ist, sollte auch annähernd
fehlerfrei sein.

Die Templatesprache DRYML
-------------------------

Sie ist vielleicht die Komponente, die, auf lange Sicht gesehen, den
meisten Benefit geben wird. Sie ermöglicht es uns, Element der Views zu
erstellen und diese weiter zu verwenden und das in einem Ausmaß, der
weit über das hinausgeht, was uns zur Zeit durch die in Ruby On Rails
eingebauten Partials möglich ist.

Man definiert hier Schlüsselwörter ähnlich HTML-Tags, die
wiederverwendbare Komponenten darstellen. Um ein Beispiel zu geben: Sehr
oft benötigen wir im Shop die Darstellung einer Adresse. Man kann nun
einen HTML-Tag <adresse> definieren, der eine formatierte Adresse
ausgibt, wenn man ihn beispielsweise in der Form <code>&lt;adresse
with="&current\_user.billing\_address"&gt;</code> aufruft. Es ist nicht
nötig, einzeln Titel, Name, Straße etc. zu übergeben, zu formatieren und
auszugeben. Diese Schlüsselwörter sind sogar in der Definition weiterer
Schlüsselwörter etwa einer <code>&lt;addresslist&gt;</code> verwendbar.

Insbesondere, wenn die Anforderungen einzelner Kunden an das
Erscheinungsbild über Änderungen des Designs hinausgehen und die
Strukturen der einzelnen Seiten grundlegend verändert werden sollen,
sollten wir damit in der Lage sein, diese Änderungen effizienter
durchführen zu können. Vielleicht können wir bei kundenspezifischen
Erweiterungen, die nur einen einzelnen Kunden betreffen, auf die
Auslagerung in kundenspezifische Module, in Ruby On Rails Gems genannt, verzichten.

Ein DRYML Beispiel, das den neuen XML-Tag <code>&lt;creator&gt;</code> definiert:

{% highlight xml %}
<def attrs='creator' tag='creator-link'>
  <% creator = this.new.lifecycle.class.can_create?(creator, current_user) %>
    <if test='&creator'>
      <a merge with='&this' action='&creator'/>
    </if>
</def>
{% endhighlight %}


Lifecyccles
-----------

Sie stellen eine Zustandsmaschine für die einzelnen Modelle zur
Verfügung und erzeugen mit ihrer Deklaration im Controller Aktionen, das
sind grundlegende Geschäftslogikschritte, und Views, das sind die
HTML-Ansichten, automatisch mit. Diese können aber selbstverständlich
auch wieder überschrieben werden. Wir hoffen damit die Modularisierung
des Codes erhöhen zu können, Tell Don't Ask praktizieren zu können, leichter den Code testen zu
können und die Integration in das
Berechtigungswesen quasi umsonst durch die zentrale Deklaration im
Modell zu bekommen.

Tell Don't Ask ist ein Programmierstil der objektorientierten
Programmierung, in dem Objekte angewiesen werden, sich auf bestimmte Art
zu verhalten. Das Objekt selbst hat dann die Verantwortung dies auf die
richtige Art und Weise zu tun. Dieser Stil wird von uns bevorzugt, da er
die Duplizierung von Programmcode vermeidet, jegliches Verhalten wird
"an dier richtigen Stelle" deklariert.

Im Gegensatz dazu steht prozeduraler Stil, in dem nach
Fallunterscheidungen "if", Objekte von außen modifiziert werden, in
dem ihre Attribute verändert werden.

Die Dokumentation
-----------------

Kein Feature im eigentlichen Sinn, aber die Verfügbarkeit des Hobo
Buches und der ausführlichen Dokumentation auf
[Hobocentral](htttp://www.hobocentral.net) sollte uns schnell produktiv machen.

Das weitreichende Scaffolding
-----------------------------

Unter Scaffolding versteht man die programmatische Erzeugung von
Programmcode. Bei Hobo handelt es sich um die Erstellung von DRYML View
Code aus der Deklaration des Modells und seiner Attribute. Ebenso werden
aus der Deklaration die Scripts zur Datenbankmigration automatisch
erzeugt. Dies sind jene Scripts, die bei Ihrer Ausführung als Rake Task
den SQL-Code zur Erstellung und Modifikation der Datenbanktabellen
erzeugen.

Übrigens: Wir sind zur Zeit jedenfalls zu den Datenbanken SQLite, MySQL
und PostgreSQL kompatibel, vermutlich auch zum MSSQL Server.

Wir werden schnell eine Administrationsoberfläche beisammen haben und
uns auf die Gechäftsprozesslogik konzentrieren können. Auch bei späterer
Änderung der Datenmodelle sollte das Scaffolding helfen, da wir nicht
jeden View manuell adaptieren müssen. Die automatische Erzeugung der
Datenbankmigrationen ist ein nettes Add-On.

Ajax
----

Unter Ajax versteht man die Aktualisierung von Teilen von Webseiten ohne
den kompletten Neuaufbau einer Seite. Aufgrund einer Interaktion mit dem
Benutzer oder Aufgrund eines Ereignisses, wie dem Ablauf einer
festgelegten Zeit, wird ein Request an den Server gestellt, der die
Anfrage bearbeitet und in der Form von JSON oder Javascript Code
beantwortet.

Diese Daten werden dann vom Browser des Benutzer per Javascript in die
Webseite eingebaut bzw. der übertragene Javascript Code wird
ausgeführt.

Eigentlich wollen wir so wenig Ajax in die Webseiten einbauen wie
möglich, um ältere Browser unterstützen zu können. Aber alleine die
Möglichkeiten zur automatischen Vervollständigung vor Eingaben sehen
sehr interessant aus. Autocompletion ist von der Google Suchmaschine
bekannt: Nach dem Tippen einiger Buchstaben schlägt Google (nach
Durchführung eines Ajax Requests) mehrere Worte zur Vervollständigung
der weitere Eingabe vor. Das ist bei uns beispielsweise auf
Produktnummern, Länder oder Kategorien übertragbar.

I18n Unterstützung
------------------

Da wir Mercator mehrsprachig auslegen, werden wir die Unterstützung zur
Lokalisierung und Internationalisierung ausnützen. Unter
Internationalisierung versteht man in der Softwareentwicklung die
Vorbereitung des Programmcodes für die Übersetzbarkeit an lokale
Gegebenheiten wie Sprache, Währung oder Zahlendarstellung.

Dabei werden alle Textbausteine für die Übersetzung in eine Textdatei
eingetragen und Datenbanktabellen für die Übersetzung von Stammdaten
vorbereitet.

Die Übersetzung des Benutzerinterfaces bzw. Regionalisierung in eine
bestimmte Sprache ist der Schritt der Lokalisierung.

Die Hobo User Group
-------------------

Hobo verwendet eine Google User Group für die Kommunikation zwischen den
Entwicklern, die Hobo verwenden und jenen, die Hobo weiterentwickeln.

Unsere ersten Fragen wurden schnell und kompetent beantwortet.

Mit dem Erlernen von Hobo ist natürlich auch Zeitaufwand für die
Programmierer verbunden. Wir sind davon überzeugt, dass dieser sich
lohnen wird.

Wir haben mit dem Hobo Core Team Kontakt aufgenommen, der Spanier
Ignacio Huerta hat uns freundlicher weise innerhalb weniger Stunden
einige grundlegende, wesentliche Fragen beantwortet.

Die Verwendung von Hobo bedeutet, dass war mit Ruby on Rails 3.2
starten. Für den bisher geschriebenen Code bedeutet das keine
Einschränkungen. Die Umstellung auf Rails 4.0 hat einige Jahre Zeit.

Sorge bereitet uns, dass Hobo keine weite Verbreitung gefunden hat. Wo
ist der Haken? Das Projekt ist mindestens fünf Jahre alt (so lange
kennen wir es schon), es wird kontinuierlich weiter entwickelt. Es ist
unheimlich mächtig. Es ist die mächtigste Ruby On Rails Erweiterung, die
wir kennen. Warum hat es sich nicht auf breiter Front in der Ruby on
Rails Szene durchgesetzt?

Hoffentlich liegt es nur an den vielen zusätzlichen Konventionen, die
eingehalten werden müssen, die auch uns bisher von der Verwendung
abgehalten haben. Andererseits wird so auch unser Programmierstil
einheitlicher.

Riskieren wir etwas? Nun, zum Teil. Allerdings kann ja Hobo auch wieder
Controller-weise und Modell-weise abgedreht werden. Das Benutzermodell
muss jedenfalls weiterverwendet werden, oder ein alternatives
Berechtigungswesen müsste eingebaut werden. Ebenso würde die Umstellung
von DRYML zurück auf ERB viel Zeit kosten.

Viele Hoffnungen sprechen wir hier aus. aber was bleibt uns in diesem
frühen Stadium des Projekts anderes übrig?