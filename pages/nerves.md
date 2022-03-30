---
layout: page
title: Der Nerves/IOT-Stack
permalink: nerves/
---

[Nerves](https://www.nerves-project.org/) ist - nach Eigendefinition - eine quelloffene
Infrastruktur und Plattform, um die Software für eine Flotte von IOT-Geräten (zu entwickeln, zu
verteilen und sicher zu verwalten.

Hier die Potentiale von Nerves Projekten grob umrissen:

* Mit dem <b>Raspberry Pi</b> setzt sie auf eine günstige Hardwareplatform, die mit mehr als 30 Millionen
  verkaufen Geräten weit verbreitet ist. Laut [Electronics Weekly](https://www.electronicsweekly.com/news/business/raspberry-pi-popular-sbc-2021-09/)
  ist es - vor Arduino und BeagleBone - sogar die am weitesten verbreitete SBC (Single Board Computer).
* Es gibt auch auch noch weitere unterstütze [Hardwareplattformen](https://hexdocs.pm/nerves/targets.html)
  bis hin zum [Grisp 2](https://www.grisp.org/), einem Entwicklungsboard mit bare metal Erlang
  Virtual Machine.

* Anschluss <b>unzähliger Sensoren</b> entweder
  * direkt über den [40 GPIO Port](https://projects.raspberrypi.org/en/projects/rpi-gpio-pins) am
    [Raspberry Pi](https://www.raspberrypi.com/for-industry/)
  * ohne zu Löten und mit standardisiertem [I2C](https://en.wikipedia.org/wiki/I%C2%B2C) Protokoll
    über die [Qwiik Connect](https://www.sparkfun.com/qwiic) Schnittstelle von SparkFun
  * über alternative Boards (auch mit bereits verlöteten Sensoren), siehe
    [hier](https://www.tomshardware.com/best-picks/best-raspberry-pi-hats) oder
    [hier](https://howchoo.com/pi/best-raspberry-pi-hats)
  * über Netzwerke: LAN (wired und wireless), MQTT, Bluetooth, BLE oder USB.
* <b>Einfache Datenübertragung</b> via JSON oder XML über HTTPS zu und Verarbeitung der Daten in

  * [Phoenix Applikationen](/elixir)
  * [Ruby on Rails Applikation](/stack)
  * exstierenden Webapplikationen in beliebigen Sprachen

* in weiterer Folge <b>Speicherung</b> in [PostgresQL](https://www.postgresql.org/),
  [TimescaleDB](https://www.timescale.com/), [MySQL](https://www.mysql.com/) und anderen relationen und
  nicht-relationalen Datenbanksystemen
* <b>Visualisierung</b> mittels [Graphana](https://grafana.com/) oder direkt aus der
  Phoenix-Applikation per klassischer Views oder
  [LiveViews](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html).
* Dabei können beliebige Charting-Bibliotheken verwendet werden, ich habe in letzter Zeit mit
  [ApexCharts](https://apexcharts.com/),
  [Apache ECharts](https://echarts.apache.org/en/index.html) und
  [Vega Lite](https://vega.github.io/vega-lite/) gearbeitet.

Ein ausführlichere Beschreibung meiner Entscheidung für Nerves finden sie im Blogpost:
[Meine Nerves Story](/2022/03/28/meine-nerves-story.html)

## Der Stack

Die Visualisierung des einfachsten Stacks, der Datenfluss vom Sensor über die Datenbank bis zum
Webbrowser ist durch Verbindungslinien gezeichnet. Grün sind Komponenten, die nicht unmittelbar
im Stack zu finden sind, aber für einen zuverlässigen, nachhaltigen Betrieb einer IOT-Plattform 
nötig sind.

![IOT Stack](/img/nerves/nerves-stack.svg)

### IOT - Nerves Applikation

#### Hardware

* Raspberry Pi als Hardware Plattform
* Qwiic Hat als Switch mit I2C Datenübertragung zu den Sensoren
* beliebige Qwiic Sensoren, die mittels I2C ausgelesen werden
* Beliebige Serverhardware für die Datenpersistierung, auch virtuelle Maschinen oder Docker Container

#### Software

* Betriebssystem-Kern Linux, abhängig vom verwendeten Board,<br/>
  z.B. bei einem Raspberry Pi 3 ein abgespeckter 5.10 Linux Kernel mit Patches für Raspberry Pi.
* Applikationsserver [Nerves](https://ninenines.eu/)
* Programmiersprache [Elixir](https://elixir-lang.org/)
* Dokumentation in Markdown, auf Wunsch auch als stand alone statische Website in [Jekyll](https://jekyllrb.com/)

### Webkomponenten

* Elixir/Phoenix - Applikation, siehe hierzu auch meine detaillierte Stack Beschreibung
  [Elixir und das Phoenix Framework](/elixir) für Webapplikationsentwicklung
* [Graphana](https://grafana.com/) Dashboards zur Datenvisualisierung
