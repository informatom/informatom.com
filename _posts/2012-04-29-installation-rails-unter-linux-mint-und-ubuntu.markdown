---
layout: post
title: Installation von Rvm, Ruby und Ruby on Rails unter Linux Mint oder Ubuntu
date:   2012-04-29 08:00:00 +0200
---

Immer wieder lese ich Artikel, dass es schwer sei Ruby on Rails
unter Linux Mint oder Ubuntu zu installieren. Dass dem nicht so ist, möchte ich mit diesem Blogpost zeigen. Durch die Verwendung von rvm
lässt sich die gewünschte Ruby-Version explizit auswählen bzw. auch
mehrere Ruby-Versionen sind parallel installierbar.

Curl und git installieren

    sudo apt-get install curl git-core

Abhändigkeiten vorinstallieren:

    sudo apt-get install bash curl git-core build-essential bison openssl libreadline6 libreadline6-dev zlib1g zlib1g-dev libssl-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev curl git-core libyaml-dev libxslt-dev autoconf libmysqlclient16-dev libreadline5

Installation rvm (Ruby Version Manager):

    bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)

Am Ende der <code>/home/(username)/.profile</code> und der <code>/home/(username)/.bashrc</code>
fügt man ein (Ersteres war bei mir das letzte Mal automatisch erledigt) :

    [[ -s \"$HOME/.rvm/scripts/rvm\" ]] && . \"$HOME/.rvm/scripts/rvm\"  # This loads RVM into a shell session.

Dann startet man die Shell neu und überprüft:

    type rvm | head -n1

Die Ausgabe muss lauten: *rvm ist eine Funktion*, sonst ist rvm nicht korrekt lauffähig!

Ruby 1.9.2 installieren:

    rvm install ruby-1.9.2

Ruby 1.9.2 standardmäßig verwenden

    rvm --default 1.9.2

Die aktuelle, stabile Version von Rails installieren:

    gem install rails

Fertig!