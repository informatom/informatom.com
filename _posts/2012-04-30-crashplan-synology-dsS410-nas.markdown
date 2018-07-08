---
layout: post
title: Crashplan auf einem Synology DS410 NAS
date:   2012-04-30 08:00:00 +0200
---

Relativ lange habe ich nach einer Möglichkeit gesucht, den
Headless Client, den es von Synology gibt, auf meinem NAS, einem
Synology DS410 zu installieren. Ich besitze das NAS bereits gut zwei
Jahre und bin mit ihm ausgesprochen zufrieden. Backups fahre ich bisher
mittels Freefilesync und Rsync-Scripts. Mit gefällt ebenso bereits seit
einigen Jahren die Backup-Lösung von Crashplan, auch wenn Sie einige
Aspekte aufweist, die mir weniger gefallen.

Crashplan auf dem NAS zu installieren scheitert an zwei Hürden. Zum
einen daran, dass es keine Java Embedded Version als Synology oder
ipkg-Paket für den verbauten Prozessortyp gibt, die Oracle Version eine
libc-Bibliothek verlangt, die in der benötigten Version nicht portiert
wurde. Umso mehr freut es mich, dass es mir nun gelungen ist Crashplan
zu installieren. Ermöglicht wurde dies von Christophe, der nicht nur
eine klomplette Debian - Bootstrap Lösung entwickelt hat, sondern diese
auch in seinem Artikel erklärt und zum Download anbietet. Vorraussetzung
ist eine laufende ipkg-Installation, die im Synology-Wiki erklärt wird.

Nach dem Download und Entpacken reicht das Erstellen zweier init-Scripts
für das Starten des Debian-Bootstraps sowie des Crashplan Services. Alle
benötigten Komponenten sind mit dem Sownload bereits vorhanden.

Schlussendlich verbindet man sich von einem Crahplan, das auf einem
Desktop installiert ist gegen den Headless Client und konfiguriert
diesen. Nach einem Reboot des NAS startet der Head Client automatisch.
Soll es aus dem Internet erreichbar sein, ist Port 4242 freizuschalten.
Die Backupraten sind ordentlich, der Client ist bisher absolut stabil.

### Links

-   [Synology DS 410](http://www.synology.com/products/product.php?product_name=DS410&lang=deu)
-   [Freefilesync](http://sourceforge.net/projects/freefilesync/)
-   [Crashplan](http://www.crashplan.com/)
-   [ipkg](http://de.wikipedia.org/wiki/IPKG)
-   [IPKG-Installation](http://www.synology-wiki.de/index.php/IPKG)
-   [Christophes Artikel](http://chreggy.fr/thegeek/2012/01/10/crashplan-sur-un-synology-powerpc-ds109/)
-   [Download der Bootstrap-Lösung](http://dl.dropbox.com/u/56228689/bootstrap-powerpc.tgz)
-   [Verbindung zu einer Headless Crashplan Installation](http://support.crashplan.com/doku.php/how_to/configure_a_headless_client)
-   [Router Konfiguration für Crashplan hinter NAT](http://support.crashplan.com/doku.php/client/troubleshooting/troubleshoot_network_connection")