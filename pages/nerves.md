---
layout: page
title: Der Nerves/IOT-Stack
permalink: nerves/
---

Hier die Potentiale von Nerves Projeken grob umrissen:

* Mit dem Raspberry Pi eine günstige Hardwareplatform, die mit mehr als 30 Millionen verkaufen
  Geräten weit verbreitet ist.
* Weitere unterrstütze [Hardware](https://hexdocs.pm/nerves/targets.html) bis hin zum [Grisp 2](https://www.grisp.org/),
  einem Entwicklungsboard mit bare metal Erlang Virtual Machine. Es wird also kein Linux Kernel unterhalb
  der Erlang VM zum Betrieb von Nerves benötigt.

* Anschluss unzähliger Sensoren entweder
  * direkt über den [40 GPIO Port](https://projects.raspberrypi.org/en/projects/rpi-gpio-pins) am
    [Raspberry Pi](https://www.raspberrypi.com/for-industry/)
  * ohne zu Löten, aber mit standardisiertem [I2C](https://en.wikipedia.org/wiki/I%C2%B2C) Protokoll
    über [Qwiik Connect](https://www.sparkfun.com/qwiic)
  * über alternative Boards (auch mit bereits verlöteten Sensoren), siehe
    [hier](https://www.tomshardware.com/best-picks/best-raspberry-pi-hats) oder
    [hier](https://howchoo.com/pi/best-raspberry-pi-hats)
  * über Netzwerke: LAN (wired und wireless), MQTT, Bluetooth, BLE oder USB.
* Einfache Datenübertragung via HTTP zu und Verarbeitung der Daten in
  * [Phoenix Applikationen](/elixir)
  * [Ruby on Rails Applikation](/stack)
  * exstierenden Webapplikationen in beliebigen Sprachen

* in weiterer Folge Speicherung in [PostgresQL](https://www.postgresql.org/),
  [TimescaleDB](https://www.timescale.com/), [MySQL](https://www.mysql.com/) und anderen relationen und
  nicht-relationalen Datenbanksystemen
* Visualisierung mittels Graphana oder direkt aus der Phoenix-Applikation per klassischer oder
  [LiveViews](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html).

Ein ausführlichere Beschreibung meiner Entscheidung für Nerves finden sie im Blogpost:
[Meine Nerves Story](/2022/03/28/meine-nerves-story.html)

## Der Stack

![IOT Stack](/img/nerves/nerves-stack.svg)

### IOT - Nerves Applikation

#### Hardware

* Raspberry Pi als Hardware Plattform
* Qwiic Hat als Switch mit I2C Datenübertragung zu den Sensoren
* beliebige Qwiic Sensoren, die mittels I2C ausgelesen werden

#### Software

* Betriebssystem-Kern Linux, abhängig vom verwendeten Board,<br/>
  z.B. bei einem Raspberry Pi 3 ein abgespeckter 5.10 Linux Kernel mit Patches für Raspberry Pi.
* Applikationsserver [Nerves](https://ninenines.eu/)
* Programmiersprache [Elixir](https://elixir-lang.org/)
* Dokumentation in Markdown, auf Wunsch auch als stand alone statische Website in [Jekyll](https://jekyllrb.com/)

### Webkomponenten

* Elixir/Phoenix - Applikation, siehe hierzu auch meine Stack Beschreibung [Elixir und das Phoenix Framework](/elixir)
* Grafana Dashboards zur Datenvisualisierng
