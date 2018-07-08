---
layout: post
title: Kein Anschluss unter dieser Nummer
date:   2015-01-19 08:00:00 +0200
---

Die Woche brachte einen Rückschlag, den wir eigentlich erwartet,
dessen proaktive Verhinderung wir allerdings vertagt haben. Im Zuge
dessen gab es auch etwas mehr Rückbesinnung als in durchschnittlichen
Wochen.

Eigentlich waren wir dabei, die Videochatseite für ein Referenzsystem
optisch zu gestalten, als uns aufgefallen ist, dass der Videochat nicht
mehr funktioniert.

Wir hatten Ähnliches erwartet, und zwar, wie früher beschrieben, aus
folgendem Grund: Die Initialisierung der Kommunikation zwischen den
beiden Kommunikationspartnern erfolgt über einen Stun & Turn Server, der
nicht von uns betrieben wird. Wird dieses Service eingestellt, finden
einander die Kommunikationspartner nicht mehr und es kommt nicht zum
Verbindungsaufbau. Bildlich gesprochen ist das Fräulein vom Amt nicht
mehr an ihrem Platz.

Wieder folgte eine Fehleranalyse, die Problematik ist aber anders
gelagert, als eben beschrieben: Google Chrome Browser können sehr wohl
noch miteinander kommunizieren, ist aber ein Firefox Browser beteiligt,
klappt es nicht mehr. Die Schlussfolgerung: Die Javascript Bibliothek
(ein JQuery Plugin) ist nicht mehr zu Firefox kompatibel. Eigentlich
haben wir daher eher die Situation: Kein Anschluss mit so einem
"Apparat"!

Nun zeigen sich alle Stärken und Schwächen des freien
Softwareentwicklungsmodells: Die Publizierung des Plugins und die
Kommunikation darüber erfolgt über Github
(https://github.com/freshtilledsoil/webrtc-jquery-plugin). Wir sehen
dort in den Issues nach und finden sogar einen Fehlerbericht. Dieser
wurde aber, da der Einreichende kein Beispiel als Beleg geliefert hat,
nach einigen Tagen wieder geschlossen. Wir haben also einen neuen
[Fehlerbericht](https://github.com/freshtilledsoil/webrtc-jquery-plugin/issues/11)
erstellt und zwar mit einem Link zum ersten Referenzsystem. Leider wurde
dieser Sache aber seit Einmeldung von den Entwicklern nicht mehr
nachgegangen.

Generell scheint die Entwicklung des Plugins mehr oder weniger
eingeschlafen zu sein. Dieses Szenario ist bei beim
Softentwicklungsmodell "Basar"
(<https://de.wikipedia.org/wiki/Die\Kathedrale\und\der\Basar>)
durchaus zu erwarten. Uns fehlen aber bei diesem Problem die Ressourcen
und das Know How selbst zu recherchieren, das Problem zu beheben oder
gar die Wartung des Plugins zu übernehmen.

Wir haben uns daher nach einer Alternative umgesehen und einige
gefunden, WEBRTC hat sich noch nicht auf breiter Front durchgesetzt, die
Adoption Rate ist aber doch bemerkenswert. Eine Grundbedingung für uns
ist, dass wir von keinen externen Services mehr abhängig sein wollen, um
das oben beschriebene Risiko auszuschließen. Die beiden Alternative in
der engeren Auswahl sind im Detail:

-   [Palava](http://palava.tv)
-   [EasyRTC](http://www.easyrtc.com/)

Wir tendieren zur Zeit Richtung Palava, die Lösung scheint kleiner, ist
in "unseren" Sprachen Ruby und Coffeescript geschrieben. Der Stun &
Turn Server ist eine Sinatra Applikation. Sinatra ist wie Ruby on Rails
ein Ruby Web Applikations Framework. Wir sehen uns zwar nicht als
Sinatra Spezialisten, die Ähnlichkeiten zu Rails sind aber groß genug,
um Code lesen und unmittelbar verstehen zu können. Die Entwickler von
Palava befinden sich großenteils in Deutschland, also in unserer Nähe
und das Projekt befindet sich in kontinuierlicher Entwicklung und - das
war ja der eigentliche Grund für die Suche - funktioniert auch mit der
aktuellen Firefox Version. Die API ist klar verständlich, sodass wir den
Beispielcode für die die Integration des Clients in eine Webseite sofort
verstehen. Es gibt zur Zeit keine unbehandelten Fehlerbericht auf
Github, das Projekt macht einen "gesunden" und gepflegten Eindruck.

Wir planen die Umstellung in den nächsten Wochen und müssen uns dazu
etwas [Websockets-Know How](https://de.wikipedia.org/wiki/WebSocket)
aneignen.

### Palava in Firefox

<hr/>
![Palava](/img/blog/palava.png){:style="max-width: 100%"}
<hr/>

EASYRTC wirkt wesentlich wuchtiger, wir werden es als Option in der
Hinterhand behalten und weiter beobachten.

### Weiteres

-   Im CMS-Teil von Mercator kann nun auch ein klassisches
    Kontaktformular untergebracht werden, wenn Kunden die
    Beratungsfunktion nicht von Anfang an einsetzen möchten.<br/>
    An die in Mercator hinterlegte Service E-Mail Adresse wird bei
    Absenden des Kontaktformulars ein E-Mail gesendet.