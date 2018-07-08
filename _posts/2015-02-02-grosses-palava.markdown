---
layout: post
title: Großes Palava
date:   2015-02-02 08:00:00 +0200
---

## WEBRTC

Wie in einem Artikel vor einigen Wochen beschrieben, funktioniert unser
WEBRTC Client in der letzten Version von Firefox nicht mehr.

Wir haben diese Woche einen Ersatz implementiert: Wir ersetzen die
Bibliothek Webrtc Jquery Plugin durch den [Palava
Client](https://github.com/palavatv/palava-client). Damit ist auch die
Verwendung des STUN-TURN Servers von Freshtilledsoil obsolet. Wir haben
unseren eigenen installiert, genannt [Palava
Machine](https://github.com/palavatv/palava-machine). Wie bereits im
Artikel [Kein Anschluss unter dieser
Nummer](/2015/01/19/kein-anschluss-unter-dieser-nummer.html) angekündigt, haben wir
uns im Bereich Websockets schlau machen müssen. Zur Erklärung:

Klassischen Webrequests (das, was ein Browser ausführt, wenn ein Link
oder ein Button angeklickt werden) werden vom Client (das heißt dem
Browser) initiiert. Der Server erhält den Request, bearbeitet ihn und
erstellt einen Response, den er zum Client sendet. Ist das erledigt, hat
der Server keine Möglichkeit mehr, Daten zum Client zu senden. Er kann
auch von sich aus keine Verbindung aufbauen.

Das wäre für unseren Videochat und WEBRTC zu wenig. Klinkt sich ein
weiterer Supportmitarbeiter in das Gespräch ein, müssen die Webbrowser
von Kunde und erstem Vertriebsmitarbeiter benachrichtigt werden und zum
Beispiel ein neues Videofenster darstellen. Diese Möglichkeit bieten
Websockets, eine Verbindung zwischen Browser und Webserver, bei der
beide Partner auch in späterer Folge Daten senden können.

Moderne Browser beherrschen dies out of the Box, nicht aber unser
Proxyserver Apache. Wir verwenden Apache, um nicht für jede Applikation
eine eigene IP-Adresse zu vergeuden oder gar eine eigene virtuelle
Maschine installieren zu müssen. Es gibt zwar ein Add-On Modul für
Apache, das wird aber nicht mit Ubuntu ausgeliefert. So müssten wir bei
jedem Apache Update Apache neu kompilieren und das Modul dabei
einbinden. Das ist zu mühsam und langwierig.

Wir verwenden daher zum ersten mal auf einem Server anstelle von Apache
den Webserver [Nginx](https://de.wikipedia.org/wiki/Nginx), eine
Software aus ursprünglich russischer Entwicklung, der für Websockets als
Proxy fungieren kann. Wir können damit auch den Faye Messagingserver,
den wir für die Textnachrichten, das Co-Browsing, u.a. verwenden, auf
die gleiche virtuelle Maschine legen und hinter Nginx betreiben. Die
Kommunikation der Browser über Faye basiert ebenso auf Websockets wie
die von Palava.

### Palava Video

<hr/>
![Palava Video](/img/blog/palava-video.png){:style="max-width: 100%"}
<hr/>

Das erste Referenzsystem ist nun auf Palava umgestellt.

Bug in Zip::ZipFile
-------------------

Bei einer Routinekontrolle haben wir festgestellt, dass der Bechlem
Produktkatalog nicht mehr korrekt implementiert wurde. Wir haben einen
Blick in das entpackte Zip-File geworfen und unmittelbar festgestellt,
dass ein Hersteller in der Hersteller - Datei nicht mehr aufgeführt ist.
Also Support-Ticket aufgemacht und eine zunächst seltsame Diskussion mit
dem Dienstleister geführt, der zwar nie behauptete, dass sich seine
Datenstruktur geändert hätte, diese Änderung aber auch nicht erklären
wollte. In eine Nebensatz kam im dritten Anlauf die Bemerkung, dass der
Hersteller doch aufgeführt sei, was uns dann wirklich stutzig gemacht
hat.

Nun ging es ans Eingemachte. Tatsächlich wurde des Zipfile von der in
Ruby mitgelieferten Klasse `Zip::ZipFile` nicht mehr richtig entpackt,
allerdings auch ohne eine Fehlermeldung oder Warnung auszugeben. Erst
die Umstellung auf das [Gem
Rubyzip](https://github.com/rubyzip/rubyzip) konnte die Datei korrekt
entpacken, womit auch die Importschnittstelle wieder korrekt
funktionierte.

Logging
-------

Ruby on Rails loggt standardmäßig in eine Textdatei. Zwar wird in einer
Produktivumgebung wesentlich weniger protokolliert, als in einem
Entwicklungssystem. Dennoch hatten wir uns von Anfang an entschlossen,
Jobs nicht in diese Datei loggen zu lassen, sondern in eine davon
getrennte Datei. Wir haben diese Woche begonnen, erste Jobs von Mercator
Administratoren aus dem Webinterface steuern zu lassen. Dabei will der
Administrator dann üblicherweise den Loginhalt lesen. Mit der
Überlegung, wie wir die Logdatei der Jobs nun am Günstigsten darstellen,
kam der Entschluss Jobs nicht mehr in eine getrennte Logdatei, sondern
in eine Tabelle in der Datenbank schreiben zu lassen. Diese Tabelle kann
dann im Administrationsinterface bequem analysiert werden.

### Logviewer

<hr/>
![Logadmin](/img/blog/logadmin.png){:style="max-width: 100%"}
<hr/>

Wir haben dabei die Menge des Loggings auf das Wesentliche reduziert.

Jobs die aus dem Admininterface gestartet werden, werden sofort in einen
Hintergrundprozess geschoben, der als Delayed-Job ausgeführt ist.

Diverses
--------

-   Wir verwenden für die konsistente optische Gestaltung der
    HTML-Seiten das [Twitter Bootstrap
    Framework](http://getbootstrap.com/), das [responsives
    Design](https://de.wikipedia.org/wiki/Responsive_Webdesign) unterstützt.
    Eine einfache Implementierung dessen in unseren Vorlagen haben wir
    nun dokumentiert.
-   In einem Referenzsystem fehlte der Link zum Produktvergleich, der
    Fehler ist nun behoben.