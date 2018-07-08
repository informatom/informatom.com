---
layout: page
title: Der Stack
permalink: stack/
---

Ein kompletter, freier Applikationsstack ermöglicht uns Software zu
schreiben, die enterprise-ready ist. Wir, das ist mein kongenialer
Kooperationspartner Michael Stranka und ich. Ein Applikationsstack ist
eine Ansammlung von Komponenten, die dazu nötig ist, eine Programm auf
einer bestimmten Hardware auszuführen.

Die Freiheiten, die mit freier Software verbunden sind, sind
weitreichend:

1.  Das Programm darf zu jedem Zweck ausgeführt werden.
2.  Das Programm darf beliebig untersucht und veränder werden.
3.  Das Programm darf beliebig verbreitet werden.
4.  Das Programm darf verbessert und diese Verbesserungen dürfen
    verbreiten werden, um damit einen Nutzen für die Gemeinschaft
    zu erzeugen.

Gäbe es diesen Stack nicht, gäbe es meine Firma nicht. So sitze ich als
Zwerg auf den Schultern von Riesen. Aber das ist [eine andere
Geschichte](/schultern-von-riesen) .

Sehen wir uns diesen Stack in Ruhe an, indem wir ihn von unten nach oben
durcharbeiten.

### Hypervisor Virtualbox

Der Hypervisor ist die Softwarekomponente, auf der das Betriebssystem
läuft. Er virtualisiert die Hardware. Oracle Virtualbox kann unter
Linux, Microsoft Windows, Mac OSX und Oracle Opensolaris installiert
werden. Es ist eine ausgezeichnete Möglichkeit, um Software zu testen,
was bis zum Betriebssystem hinunter geschehen kann.

Virtual Box bietet einen nahtlosen Modus, in dem Applikationsfenster im
virtuellen Betriebssystem neben Fenstern aus dem nativen Betriebssystem
(also dem Betriebssystem, das direkt auf der Hardware installiert ist)
dargestellt werden können. Leider kann es nicht bare metal, also direkt
auf der Hardware installiert werden, sondern benötigt ein weiteres
Betriebssystem. Es wird damit als Type 2 Hypervisor bezeichnet.<br/>
VirtualBox ist GPL V2 lizensiert.

Neben Oracle Virtualbox unterstütze ich aufgrund der Nachfrage aus den
Betrieben auch die Produkte von VmWare: ESXi, den VmWare Player, VmWare
Workstation und VmWare Server, die leider nicht in freier Form
vorliegen. ESXi kann unter bestimmten Einschränkungen kostenlos
verwendet werden.

### Betriebssystem Ubuntu

Ubuntu ist eine von der Firma Canonical zusammengestellte Distribution,
die auf Debian Linux basiert. Es liegt neben einer Desktopversion auch
in einer von mir sehr gerne verwendeten Serverversion vor, die
ressourcensparend mit der Hardware umgeht, da zum Beispiel standardmäßig
keine grafische Benutzeroberfläche installiert wird. Auf Wunsch gibt es
für Ubuntu auch kommerziellen Support von Canonical. Am Desktop verwende
ich zumeist Linux Mint, eine Distribution, die entweder auf Ubuntu oder
direkt auf Debian aufbaut. Ich verwende derzeit den Zweig, der auf
Ubuntu aufbaut.

Ich besitze ältere Laptops, deren Hauptspeicher-Ausstattung noch mäßig
ist (256MB). Auf diesen Rechnern ist Gnome als Desktopoberfläche nicht
zu empfehlen, daher habe ich dort Crunchbang Linux installiert. Diese
Distribution basiert direkt auf Debian und verwendet als Desktop
Umgebung das Ressourcen sparende Openbox.

### Webserver Apache oder NginX

Als Webserver für die von mir entwickelten Applikationen verwende ich
den Apache HTTP Server. Er ist der Webserver mit der größten
Marktdurchdringung. Durch viele Jahre der Entwicklung ist er zu einem
sehr großen Server geworden, des Konfiguration nicht gerade trivial ist.
Aber seine Stabilität spricht einfach für ihn.

Ich verwende auch gerne den NginX Webserver, eine neuere, leichtere und
schnellere Alternative. Sowohl mittels Apache als auch mit NginX lassen
sich mehrere Domains auf einem Server hosten.

### Applikationsserver Phusion Passenger

Zu diesem Hosten von mehreren Applikationen, möglichweise auch noch mit
unterschiedlichen Rails-Version, verwende ich Phusion Passenger. Er
ermöglicht es unter anderem, Applikationen vorzuladen oder auch bei
Pause der Verwendung diese wieder aus dem RAM zu entladen. Bei
Entwicklungssystemen verwende ich das mit Rails gelieferte Webrick
sowohl als Applikationsserver als auch als Webserver.

### Datenbankserver MySQL oder SQLite

Das Datenbank kommt bei mir zumeist das mächte MySQL zum Einsatz. Dies
ist die Datenbanksoftware, auf der die meisten Webappliaktionen gehostet
werden und auch die populärste Open Source Datenbank.

Für kleinere Projekte mit geringerer Last ist durchaus die Verwendung
einer filebasierten SQLite Datenbank möglich. Der Vorgänger diser
Webseite lief mehrere Jahre problemlos unter SQLite und benötigte damit
keinen Datenbank Server.

### Scriptsprache Ruby und Webframework Ruby on Rails

Auf diese beiden Komponenten gehe ich auf der Unterseite [Entwicklung](entwicklung)
genauer ein.

### weitere Tools und Dienste

Viele andere Tools gehören auch zum Stack, auch wenn Sie im Diagramm
nicht erwähnt wurden:

-   Mailserver Exim, Dovecot, Roundcube Webmail
-   Gedit stellt einen freien Editor dar, der für die meisten Projekte
    ausreichend ist, insbesondere, wenn man ihn um das Plugin
    GMate erweitert.
-   Als IDE setze ich regelemäßig das kommerzielle Rubymine das auf dem
    freien IntelliJIdea aufbaut. Es bietet Features wie Code Completion
    oder komfortablere Suche im Projekt.
-   Früher habe ich auch Aptana Radrails eingesetzt, ich hatte aber
    Probleme mit dem Betrieb des Debuggers unter Ruby 1.9

#### Links

-   [Virtualbox](https://www.virtualbox.org/)
-   [GPL](http://www.gnu.org/licenses/gpl-2.0.html)
-   [Hypervisor](http://de.wikipedia.org/wiki/Hypervisor)
-   [VmWare ESXi](http://www.vmware.com/products/vsphere-hypervisor/overview.html)
-   [VmWare Player](http://www.vmware.com/at/products/desktop_virtualization/player/overview.html)
-   [VmWare Server](http://www.vmware.com/at/products/datacenter-virtualization/server/overview.html)
-   [OpenSolaris](http://hub.opensolaris.org/bin/view/Main/)
-   [Canonical](http://www.canonical.com/)
-   [Ubuntu](http://www.ubuntu.com/)
-   [Ubuntu Server Edition](http://www.ubuntu.com/business/server/overview)
-   [Linux Mint](http://linuxmint.com/)
-   [Crunchbang Linux](http://crunchbanglinux.org/)
-   [Debian](http://www.debian.org/)
-   [Apache](http://httpd.apache.org/)
-   [NginX](http://wiki.nginx.org/NginxDe)
-   [Phusion Passenger](http://www.modrails.com/)
-   [MySQL](http://www.mysql.de/)
-   [SQLite](http://www.sqlite.org/)
-   [Exim](http://www.exim.org/)
-   [Dovecot](http://www.dovecot.org/)
-   [Roundcube](http://roundcube.net/)
-   [Gedit](http://projects.gnome.org/gedit/)
-   [GMate](https://github.com/gmate/gmate)
-   [Rubymine](http://www.jetbrains.com/ruby/)
-   [IntelliJIdea](http://www.jetbrains.com/idea/)
-   [Informatom - Entwicklung](/entwicklung)
-   [Aptana RadRails](http://www.aptana.com/products/radrails)