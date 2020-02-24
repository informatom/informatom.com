---
layout: page
title: Dart
permalink: dart/
---
<div class="columns">
<div class="column" markdown="1">

Ende 2017 wollte ich mein Portfolio um native, mobile Anwendungen erweitern.
Ich konnte bis dahin serverseitige Webandwendungen in Ruby on Rails und
Elixir & Phoenix entwickeln, deren responsive Views auf Smartphones und
Tablets gut funktioniert haben.

Für manche Anwendungsfälle ist das jedoch zu wenig. Will man auf die Sensoren
der Endgeräte (GPS, Kamera, Kompass, Thermometer, ...) zugreifen, ist entweder
eine native Applikation (die nicht im Webbrowser des Geräts läuft) oder
ein Framework wie Ionic nötig, das hybride Anwendungen erstellt. Hybride
Anwendungen können meist für mehrere Plattformen kompiliert werden, bieten
aber meist eine eingeschränkte User Experience, entweder schon was den
Look & Feel angeht, spätestens aber, wenn es um rechenintensivere Aufgaben geht.

Ich habe also Ende 2017 begonnen, die nativen Möglichkeiten zu analysieren
und wieder meine Java-Kenntnisse auf Vordermann gebraucht. Mit Java konnte
ich native Android-Applikationen erstellen, iOS, also Apple-Geräte wie iPhones
und iPads blieben außen vor.

Zu jener Zeit wurde Kotlin bekannter. Es ist eine Programmiersprache mit
moderner Syntax und Architektur und versprach native Entwicklung für Android
und iOS. Ich erlernte also Kotlin, wurde aber beim ersten größeren Projekt
enttäuscht, denn spätestens bei nativen GUIs ist es mit der interoperabilität
vorbei: Für iOS ist ein Objective C oder Swift Projekt zu erstellen. Eine mehr
als unerfreuliche Erkenntnis.

Doch es kam - zu meinem Glück - eine weiter Alternative in meinen Fokus, deren
Möglichkeiten ich bis zu Mitte 2018 unterschätzt hatte: Das Flutter Framework,
das auf Dart aufsetzt.

Ursprünglich wollte Google mit der Entwicklung der Programmiersprache Dart
Javascript im Browser ersetzen, was bis heute nicht gelungen ist.
Mit dem Flutter Framework hat eine andere Gruppe innerhalb Google den Traum
von der echten Cross-Plattform Entwicklung für Android und iOS geschaffen.

Flutter kompiliert zu nativem Code (also Maschinensprache) und liefert eine
2D-Grafikbibliothek mit, die sowohl auf Android als auch auf iOS nativ
aussehende Applikationen ermöglicht. Die Performance von Flutter Anwendungen
ist fast unglaublich, wir tragen mit unseren Smart Phones schon beeindruckende
Computer mit uns herum.

Aktuell entwickle ich mit der Open Source Anwendung Encrateia eine Anwendung,
mit der sie die Daten, die von den Activity Trackern Garmin Forerunner 235 und
Stryd Powersensor erzeugt und auf Strava hochgeladen wurden, lokal auf dem
Smart Phone analysieren lassen.

Noch befindet sich die Applikation in einem frühen Stadium, aber die
Screenshots zeigen schon jetzt, was alles möglich ist, egal ob eine
on the fly berechnete Power Duration Curve oder andere aussagekräftige
Diagramme.

### Links

* [Ionic](https://docs.anaconda.com/anaconda/packages/py3.7_linux-64/)
* [Kotlin](https://kotlinlang.org/)
* [Dart](https://dart.dev/)
* [Flutter](https://flutter.dev/)
* [Encrateia](https://github.com/3schweinehunde/enkrateia)

</div>
<div class="column is-one-quarter" markdown="1">

![Activity list](/img/flutter/1.png)
![Power per heart rate for several runs](/img/flutter/2.png)
</div>
<div class="column is-one-quarter" markdown="1">
![Power duration curve](/img/flutter/3.png)
![Heart rate](/img/flutter/4.png)

</div>
