---
layout: post
title: To update or not to update
date:   2014-07-18 08:00:00 +0200
---

## Migrationsversuch Twitter Bootstrap

Als Nebeneffekt haben wir nun die Vorzüge von
[Twitter Bootstrap Version 3](http://getbootstrap.com/)
kennen gelernt und wir sind auch von den designmäßigen Änderungen gegenuber
[Bootstrap 2](http://getbootstrap.com/2.3.2/) angetan. Wir würden nun gerne die
restliche Applikation ebenso aktualisieren, das entsprechende Gem
[Hobo Bootstrap](https://github.com/Hobo/hobo\_bootstrap) hält allerdings noch
an Bootstrap 2.3.2 fest.

Wir haben nun den Versuch unternommen, ein Update dutchzuführen. Die
Komponenten, die uns selbst betreffen zu aktualisieren gelang uns
relativ schnell, nicht aber das gesamte Gem und das daran hängende Hobo
Bootstrap Ui-Gem. Somit können wir unsere Migration nicht publizieren
und hängen mit unserem Demosystem weiter an Version 2.3.2. Wir müssen
die geleisteten Arbeiten aber nicht verwerfen, sondern heben diese in
unserer Versionierungssoftware in einem getrennten Zweig auf und werden
die Portierung bei Gelegenheit fortsetzen.

Derzeit hat aber die Produktivsetzung des ersten Referenzsystems
Priorität.

### Beispielseite Bootstrap 2

<hr/>
![Bootstrap 2](/img/blog/bootstrap2.png){:style="max-width: 100%"}
<hr/>

### Beispielseite Bootstrap 3

<hr/>
![Bootstrap 3](/img/blog/bootstrap3.png){:style="max-width: 100%"}
<hr/>


Weiteres
--------

Die Datenmigration in das erste Referenzsystem ist in vollem Gang. Wir
richten parallel zum Erstimport die täglichen Importjobs ein und testen
sie ausführlich.

Das System läuft mit allen seinen Komponenten stabil, wie wir es auch
vom Demosystem gewohnt waren.

Die Installation wird in Hinblick auf eine zu erstellende, allgemein
verständliche Installationsanleitung dokumentiert. Wir merken dabei,
dass wir weiter von einer Automatisiertung entfernt sind als wir
ursprünglich dachten. Für eine Automatisierung sind daher jedenfalls
Tools wie [Capistrano](http://capistranorb.com/) und [Chef](http://www.getchef.com/chef/)
oder [Puppet](http://puppetlabs.com/puppet) zu
evaluieren, die die Aktualisierung (Capistrano) und die Installation und
Wartung (Chef und Puppet) automatisieren. Eventuell ist eine
leichtgewichtigere Lösung wie
[Whiskey Disk](https://github.com/flogic/whiskey\_disk) denkbar, selbstgeschriebene
Scripts sind vermutlich zu wenig fehlertolerant.
