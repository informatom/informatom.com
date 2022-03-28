---
layout: page
title: Der Nerves/IOT-Stack
permalink: nerves/
---

Hier sind nur die Potentiale von Nerves Projeken grob umrissen.

Ein ausführlichere Beschreibung findet sich im Blog Post [Meine Nerves Story](/2022/03/28/meine-nerves-story.html)

## Der Stack

![IOT Stack](/img/nerves/stack.svg)

### IOT - Nerves Applikation

#### Hardware

* Raspberry Pi als Hardware Plattform
* Qwiic Hat als Switch mit I2C Datenübertragung zu den Sensoren
* beliebige Qwiic Sensoren, die mittels I2C ausgelesen werden

#### Software

* Betriebssystem-Kern Linux, abhängig vom verwendeten Board, z.B. bei einem Raspberry Pi 3 ein
  abgespeckter 5.10 mit Patches für Raspberry Pi.
* Applikationsserver [Nerves](https://ninenines.eu/)
* Programmiersprache [Elixir](https://elixir-lang.org/)
* Dokumentation in Markdown, auf Wunsch auch als stand alone statische Website in [Jekyll](https://jekyllrb.com/)

### Webkomponenten

* Elixir/Phoenix - Applikation, siehe hierzu auch meine Stack Beschreibung [Elixir und das Phoenix Framework](/elixir)
* Grafana Dashboards zur Datenvisualisierng
