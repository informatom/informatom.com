---
layout: page
title: Elixir und das Phoenix Framework
permalink: elixir/
---

2015 habe ich viel Zeit darauf verwendet neue und wiederentdeckte
Programmierparadigmen zu evaluieren, unter anderem anhand der
Sprachen Rust, Go und Elixir. Zunächst nur aus Interesse, in
weiterer Folge aber mit der Absicht auch ein zweites Pferd in meinem
Entwicklungs-Stall anbieten zu können, nämlich eines aus der funktionalen
Welt.

In Hinblick auf praktisch unbegrenzte Skaliierbarkeit und höhere Performance
habe ich auf die Sprache Elixir und das Webapplikationsframework Phoenix
gesetzt.

Der neue Stack setzt sich aus den gleichen Schichten wie der [Ruby On Rails Stack](/stack) zusammen,
einige der verwendeten Komponenten wurden aber ausgetauscht, zum Teil nachdem sie auch bereits
einige Jahre unter Ruby On Rails von mir eingesetzt wurden, wie KVM, PostgresQL oder nginx.

## Der Stack

![Phoenix Application Stack](/img/elixir/phoenix-application.svg)

* Hypervisor [KVM](https://www.linux-kvm.org/page/Main_Page) (optional, falls Applikation auf Hardware betrieben muss, aber nicht bare metal)
* Betriebssystem [Ubuntu Server](https://www.ubuntu.com/server)
* Proxyserver [nginx](https://nginx.org/en/)
* Applikationsserver [Cowboy](https://ninenines.eu/)
* Datenbank Management System [PostgreSQL](https://www.postgresql.org/) (Optionen: MySQL, SQLite)
* Programmiersprache [Elixir](https://elixir-lang.org/)
* Webframework [Phoenix](http://phoenixframework.org/) inklusive [Phoenix LiveViews](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html)
* CSS-Framework [tailwindcss](https://tailwindcss.com/)
* Javascript-Bibliothek [Alpine.js](https://alpinejs.dev/)
* Monitoring [Monit](https://mmonit.com/monit/)
* Test Framework [ExUnit](https://hexdocs.pm/ex_unit/1.12/ExUnit.html)
* Backup [Borgbackup](https://www.borgbackup.org/) (verschlüsselt, dedupliziert, komprimiert)
* Dokumentation in Markdown, auf Wunsch auch als stand alone statische Website in [Jekyll](https://jekyllrb.com/)

Das Versprechen von funktionalen Programmiersprachen und Elixir, das auf der
[Erlang Virtual Michine](https://en.wikipedia.org/wiki/Erlang_(programming_language)) aufsetzt,
im Speziellen, ist sehr weit skalierender, gut test- und wartbarer Code.

In meinem größten offenen Projekt, in dem ich den Stack verwende,
[Panoptikum.io](https://panoptikum.io/), zeigt sich das eindrucksvoll. Sollten Sie an Hintergrund von Panoptikum
Interesse haben, beginnen Sie am besten auf der [About-Seite](https://blog.panoptikum.io/),
im [Blog](https://blog.panoptikum.io/blog/) haben wir im ersten Jahr bereits mehr als 50 Artikel
über Panoptikum verfasst.
