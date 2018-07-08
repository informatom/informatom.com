---
layout: post
title: Pixelschubsen
date:   2014-11-10 08:00:00 +0200
---

## Design

Als Pixelschubsen bezeichnen unsere Entwickler despektierlich die
Anpassung des User Interfaces an die Gestaltungsrichtlinien, die durch
den Designer vorgegeben werden.

(... obwohl sie im direkten Gespräch zugeben, dass nur dadurch die Seite
ansehnlich wird.)

In dieser Woche haben wir also um ein konsistentes Look & Feel für alle
Teile gekümmert, die die Endkunden zu sehen bekommen. Das betrifft:

-   die Konversationen, die ab jetzt Beratungssessions heissen,
-   der Videochat,
-   das Feedback Formular,
-   das Benutzerprofil,
-   die Produktdetailansicht,
-   die Kategorienansicht ,
-   die Filternavigation ,
-   das Angebot in HTML und PDF Format,
-   die Cobrosingsessions inklusive dem Textchat und
-   den Produktvergleich.

### Konsistenz des Userinterfaces muss z.B. auch das Userprofil umfassen

<hr/>
![Konsistenz](/img/blog/konsistenz.png){:style="max-width: 100%"}
<hr/>

Update
------

Zum darüber Streuen mussten wir diese Woche aus Sicherheitsgründen
sowohl Ruby als auch Ruby on Rails auf allen Demo, Staging- und
Entwicklungssystemen aktualisieren. Ruby gar zweimal, zunächst auf
Version 2.1.4, dann auf 2.1.5. Angenehmer weise gab es dabei keine
relevanten Probleme, die Updates benötigten aber doch einige Stunden an
Zeit. Als Spinoff haben wir alle RVM-Installationen aufgeräumt (RVM ist
der von uns verwendete Ruby Versionsmanager) und die Kurzanleitung zum
Update überarbeitet. Es war erfreulich festzustellen, dass wir die
Infrastruktur doch gut im Griff haben, es gab keinerlei Downtime.

Video-Chat
----------

Mit der Video Chat Komponente hatten wir bislang eine Art Leiche im
Keller. Wir verwenden für den Videochat selbst WebRTC
(http://www.webrtc.org/), das ist standardisiert und soweit in Ordnung.
Für die Initialisierung setzen wir JQuery Plugin, das auf einen von der
Firma Fresh Tilled Soil (http://www.freshtilledsoil.com/) betriebenen
Signalling Server aufbaut.

Zur Erläuterung: Dieser Server und eine weitere Komponente namens STUN &
TURN-Server helfen den beteilten Browsern einander im Internet zu
finden. Wenn sie einander gefunden haben, erfolgt die Kommunikation auf
der direkten Route zwischen den Kommunikationspartnern und ist auf den
Signalling Server nicht mehr angewiesen. Das sorgt für die geringe
Latenz in WebRTC Kommunikationen.

Fresh Tilled Soil gestattet und ermutigt diesen Server zu verwenden.
Sollte Fresh Tilled Soil allerdings dieses Service einstellen, würden
die Browser einander nicht mehr finden, wir haben hier also einen Single
Point of Failure. Oder besser gesagt: Wir hatten...

Wir haben diesbezüglich recherchiert und können auf EasyRTC wechseln
(<http://www.easyrtc.com/>), bei dieser Lösung können wir alle benötigten
Komponenten selbst installieren und betreiben.

Es gibt allerdings leider weiterhin keine Unterstützung für WebRTC
seitens des Microsoft Internet Explorers. Es gibt aber, und das ist die
erfreuliche Nachricht in diesem Zusammenhang eine
[Ankündigung von Microsoft](http://blogs.msdn.com/b/ie/archive/2014/10/27/bringing-interoperable-real-time-communications-to-the-web.aspx)
vom 27.10., dass sich das ändern wird.