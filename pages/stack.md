---
layout: page
title: Der Ruby on Rails Stack
permalink: stack/
---

![Ruby, Ruby on Rails, Apache, NginX, MySQL, SQLite](/img/stack/logos.png){: .stack-logos}

Ein kompletter, freier Applikationsstack ermöglicht mir, Software zu schreiben, die
enterprise-ready ist. Unter der Marke [mittenin.at](/entwicklung) entwickle ich dabei mit meinem
Kooperationspartner Michael Stranka. Ein Applikationsstack ist eine Ansammlung von Komponenten,
die dazu nötig ist, ein Programm auf einer bestimmten Hardware auszuführen.

Die Freiheiten, die mit freier Software verbunden sind, sind weitreichend:

1. Das Programm darf zu jedem Zweck ausgeführt werden.
2. Das Programm darf beliebig untersucht und verändert werden.
3. Das Programm darf beliebig verbreitet werden.
4. Das Programm darf verbessert werden, und diese Verbesserungen dürfen verbreitet werden, um
   damit einen Nutzen für die Gemeinschaft zu erzeugen.

Gäbe es diesen Stack nicht, gäbe es meine Firma nicht. So sitze ich als Zwerg auf den Schultern
von Riesen. Aber das ist [eine andere Geschichte](/schultern-von-riesen).

## Der Stack

* Hypervisor [KVM](https://www.linux-kvm.org/page/Main_Page) (optional, falls die Applikation auf
  eigener Hardware betrieben werden muss, aber nicht bare metal)
* Betriebssystem [Ubuntu Server](https://www.ubuntu.com/server)
* Webserver [Apache](https://httpd.apache.org/) oder [NginX](https://nginx.org/en/)
* Applikationsserver [Puma](https://puma.io/)
* Datenbank Management System [MySQL](https://www.mysql.com/) oder [SQLite](https://www.sqlite.org/)
* Programmiersprache [Ruby](https://www.ruby-lang.org/de/)
* Webframework [Ruby on Rails](https://rubyonrails.org/)
* IDE [Visual Studio Code](https://code.visualstudio.com/)
* Backup [Borgbackup](https://www.borgbackup.org/) (verschlüsselt, dedupliziert, komprimiert)
* Dokumentation in Markdown, auf Wunsch auch als stand alone statische Website in
  [Jekyll](https://jekyllrb.com/)

### Ruby und Ruby on Rails

Auf diese beiden Komponenten gehe ich auf der Unterseite [Entwicklung](/entwicklung) genauer ein.

### Links

- [KVM](https://www.linux-kvm.org/page/Main_Page)
- [Ubuntu Server](https://www.ubuntu.com/server)
- [Apache](https://httpd.apache.org/)
- [NginX](https://nginx.org/en/)
- [Puma](https://puma.io/)
- [MySQL](https://www.mysql.com/)
- [SQLite](https://www.sqlite.org/)
- [Ruby](https://www.ruby-lang.org/de/)
- [Ruby on Rails](https://rubyonrails.org/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Borgbackup](https://www.borgbackup.org/)
- [Jekyll](https://jekyllrb.com/)
- [Informatom - Entwicklung](/entwicklung)
