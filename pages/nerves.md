---
layout: page
title: Der Nerves/IOT-Stack
permalink: nerves/
---

In den letzten Jahren steigerte sich mein Interesse für IOT-Projekte. Ich lernte zu löten,
habe mir [Raspberry Pi]es herumgespielt, diese aber zumeist als NAS, oder Proxies (Pi-Hole) verwendet.
Später folgte ein [Airrohr-Feinstaubsensor]((https://sensor.community/de/sensors/airrohr/))
auf Basis eines ESP8266], der seit Jahren gute Dienste leistet und seine Daten an
<https://luftdaten.info/> übermittelt.
Die Daten können [hier](http://deutschland.maps.sensor.community/#14/48.2265/16.4151) eingesehen werden.

Etwa Mitte 2021 bin ich dann auf das [Nerves Project](https://www.nerves-project.org/)
gestoßen, implementiert in der von meiner geschätzten Programmiersprache
[Elixir](https://elixir-lang.org/), ein ausgereiftes Frameworks zur Entwicklung von IOT-Anwendungen.
Als ich dann von
[Build a Weather Station with Elixir and Nerves](https://pragprog.com/titles/passweather/build-a-weather-station-with-elixir-and-nerves/)
war ich doppelt interessiert und habe versucht, mir die benötigten Sensoren zu beschaffen, was nur
zum Teil gelang. Anhand dieses Projektes werde ich nun die Möglichkeiten, die sich durch Nerves bieten,
erläutern.

## Der Stack

![IOT Stack](/img/nerves/stack.svg)

* Betriebssystem-Kern Linux, abhängig vom verwendeten Board, z.B. bei einem Raspberry Pi 3 ein
  abgespeckter 5.10 mit Patches für Raspberry Pi.
* Applikationsserver [Nerves](https://ninenines.eu/)
* Programmiersprache [Elixir](https://elixir-lang.org/)
* Dokumentation in Markdown, auf Wunsch auch als stand alone statische Website in [Jekyll](https://jekyllrb.com/)
