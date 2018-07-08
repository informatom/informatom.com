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

* Hypervisor [KVM](https://www.linux-kvm.org/page/Main_Page)
* Betriebssystem [Ubuntu Server](https://www.ubuntu.com/server)
* Webserver [nginx](https://nginx.org/en/)
* Applikationsserver [Cowboy](https://ninenines.eu/)
* Datenbankserver [PostgreSQL](https://www.postgresql.org/)
* Programmiersprache [Elixir](https://elixir-lang.org/)
* Webframework [Phoenix](http://phoenixframework.org/)
* Vanilla Javascript [ES6](http://es6-features.org/#Constants) am Frontend


Das Versprechen von funktionalen Programmiersprachen und Elixir, das auf der
[Erlang Virtual Michine](https://en.wikipedia.org/wiki/Erlang_(programming_language)) aufsetzt,
im Speziellen, ist sehr weit skalierender, gut test- und wartbarer Code.

In meinem bislang größten Projekt, in dem ich den Stack verwende,
[Panoptikum.io](https://panoptikum.io/), zeigt sich das eindrucksvoll. Sollten Sie an Panoptikum
Interesse haben, beginnen Sie am besten auf der [About-Seite](https://blog.panoptikum.io/),
im [Blog](https://blog.panoptikum.io/blog/) haben wir im ersten Jahr bereits mehr als 50 Artikel
über Panoptikum verfasst.