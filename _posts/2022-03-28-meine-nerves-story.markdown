---
layout: post
title: Meine Nerves Story
date: 2022-03-28 08:00:00 +0200
---

In den letzten Jahren steigerte sich mein Interesse für IOT-Projekte. Ich lernte zu löten,
habe mir [Raspberry Pi]es herumgespielt, diese aber zumeist als NAS, oder Proxies (Pi-Hole) verwendet.
Später folgte ein [Airrohr-Feinstaubsensor]((https://sensor.community/de/sensors/airrohr/))
auf Basis eines ESP8266], der seit Jahren gute Dienste leistet und seine Daten an
<https://luftdaten.info/> übermittelt.
Die Daten können [hier](http://deutschland.maps.sensor.community/#14/48.2265/16.4151) eingesehen werden.

Etwa Mitte 2021 bin ich dann auf das [Nerves Project](https://www.nerves-project.org/)
gestoßen, implementiert in der von meiner geschätzten Programmiersprache
[Elixir](https://elixir-lang.org/), ein ausgereiftes Frameworks zur Entwicklung von IOT-Anwendungen.
Als ich dann von
[Build a Weather Station with Elixir and Nerves](https://pragprog.com/titles/passweather/build-a-weather-station-with-elixir-and-nerves/)
war ich doppelt interessiert und habe versucht, mir die benötigten Sensoren zu beschaffen, was nur
zum Teil gelang.

## Die Komponenten der Wetterstation

Das Projekt besteht aus einer Wetterstation in Form dreier Hardwaresensoren, die über das
[Qwiic Connect System](https://www.sparkfun.com/qwiic) von [Sparkfun](https://www.sparkfun.com/)
per Kabel in einer Daisy Chain an einen
[Qwiik Hat](https://www.sparkfun.com/products/retired/15351), der
auf einem [Raspberry Pi](https://www.raspberrypi.org/) aufgesetzt ist. Ich verwende noch den pHat in
Version 1, was aber für das Projekt keinen Unterschied macht, da das Rely am pHat Version nicht
verwendet wir, mittlerweile ist dieser nicht mehr in Produktion und durch Version 2 ersetzt.
Im Prinzip kann jeder Raspberry Pi verwendet werden, der über einen 40pin GPIO Port verfügt,
ich verwende einen [Raspberry Pi 3 Model B](https://www.raspberrypi.com/products/raspberry-pi-3-model-b/),
der für diese Zwecke eigentlich überdimensioniert ist.

Die verwendeten Sensoren sind ein VEML6075 UV-Sensor, ein Environmental Combo Breakout CCS811/BME280
mit Temperatur-, barometrischer Luftdruck-, Luftfeuchtigkeits- und VOC-Gassensor
(volatile organic compoints = flüchtige organische Verbindungen). Weiters kommt ein SGP30
Luftgütesensor zum Einsatz.

Alle Sensoren verwende ich als Qwiic Sensoren von Sparkfun. Links zur Dokumentation aller Sensoren
dieses Projekte, und einiger weiterer Sensoren, die sich in meinem Besitz befinden,  finden sich im
[Wiki des Projektes](https://code.informatom.com/Informatom/iot_demo_nerves/wiki/Home).

## Kein Löten, nur Stecken

Die beschrieben Kombination kommt ohne jegliches Löten aus, was ich auch für einen Prototypen, der
in nicht hardwarenahen Firmen präsentiert werden soll, essentiell halte. Ich möchte nicht durch zu
lötende Kompontent abschrecken. Genau das ist mit SparkFuns Qwiik Platform möglich, die
Steckverbindungen und Kabel sind genormt, die Stecker sogar verpolungssicher.

Ich bin aber mit Nerves als IOT Platform nicht auf diese Sensorplatform beschränkt. Sensoren lassen
sich auch direkt mit dem 40Pin GPIO Connector des Raspberry Pi verbinden, wenn sie durch dieses
Interface angebunden werden können. Es gibt auch zahlreiche andere Hats, die entweder andere
Sensoranschlüsse bieten oder Sensoren gleich direkt verbaut haben. Einige
[Nerves Case Studies](https://www.nerves-project.org/case-studies.html) lassen sich auf der Nerves
Webseite nachlesen.

## Meinen eigenen Hardwaretreiber schreiben

Der VEML6075 ist allerdings nicht der Sensor, der im Buch für das Projekt vorgeschlagen wird,
dort kommt ein VEML6030 zum Einsatz. Ich dachte naiver weise, ist halt ein neueres Modell,
der Treiber wird schon passen; das war aber nicht der Fall.

So stand ich vor der Aufgabe, da ich in meinem Leben noch keinen Hardwaretreiber geschrieben
habe, die Datenblätter, die mit den Sensoren mitgeliefert waren zu verstehen, ebenso
den Treiber, der im Buch für den VEML6030 entwickelt. Und hier besteht halt die große Stärke
von Open Source und freien Informationen. Ich hatte nach 2h Lernaufwand erstmal erfolgreich Daten
vom VEML6075 ausgelesen, nach weiteren 2h einen Treiber, der sogar eine Spur mehr konnte, als
der für den VEML6030 im Buch entwickelte. Das macht einen dann auch ein Bisschen stolz.

## Schnelle Fortschritte

Die beiden anderen Sensoren ließen sich wie im Buch beschrieben, über öffentliche Elixir Pakete
(Hex Packages) rasch einbinden. Der nächste Schritt war in einer virtuellen Maschine eine kleine
Phoenix-Applikation zu schreiben, die einen JSON-Endpoint zum Annehmen der Daten vom Nerves-Pi
anbietet.

Das klappte ganz vorzüglich. Ich konnte mich aber nicht mit dem Gedanken anfreunden, dass dieser
Endponti völlig offen ist, selbst wenn ich das Projekt nur in WLANs von Firmen präsentieren will,
ist ein offener Endpunkt für mich gefühlt nicht in Ordnung und ich habe eine kleine
Token-Authentifizierung dazu geschrieben. Hier kommen wieder die Stärken von Open Source und
dem Elixir/Phoenix Stack zum tragen. Gerade mal eine zusätzliche Zeile, nämlich die fünfte im
folgenden Block ist für ein hard codiertes Token im Nerves Projekt nötig

```elixir
result =
  Finch.build(:post, state.weather_tracker_url,
    [
      {"Content-Type", "application/json"},
      {"authorization", "my_secret_token"}
    ],
    Jason.encode!(state.measurements)
  )
  |> Finch.request(WeatherTrackerClient)
```

Auf Seiten der Phoenix Applikation sind es gerade mal fünf zusätzliche Zeilen, um das Token zu
überprüfen:

```elixir
if List.first(get_req_header(conn, "authorization")) == "my_secret_token" do
  # do the regular stuff
else
  put_status(conn, :unprocessable_entity)
  |> json(%{message: "Auth token not valid"})
end
```

## Datenablage

Die Datenablage erfolgt aus der Phoenix-Applikation in eine [Timescale-DB](https://www.timescale.com/)
Bei Timescale handelt es sich um ein Add-On zu [PostgresQL](https://www.postgresql.org/), sodass
in Richting der Phoenix Applikation keine Adaption des Codes erforderlich ist und der standard relational
Mapper postgrex verwendet werden kann.

In Richtung der Visualisierung durch Grafana (Details im nächsten Abschnitt) ist ebenfalls keine
spezielle Anpassung nötig, da Grafana out of the box Timescale Datenbanken unterstützt.

Timescale verbessert das Handling von Zeitreihendaten hinsichtlich Speicherung, Geschwindigkeit und Analyse.
Einen Überblick über die Funktionalität bietet die [Dokumentation von Timescale](https://docs.timescale.com/timescaledb/latest/overview).

## Visualisierung

Zur Visualisierung der Daten wird nicht die Funktionalität von Phoenix zur Erstellung von Webseiten
vorgeschlagen, sondern eine Installation von [Grafana](https://grafana.com/).

Um eine Timescale Datenbank aber auch Grafana rasch zu installieren habe ich, wie auch im Buch zum
Projekt vorgeschlagen, zwei Docker Container verwendet. Somit ist auch die komplette Konfiguration
[Infrastructure as Code](nfrastructure as Code), also nicht durch menschliche Intervention durchzuführen,
sondern völlig gescripted. Das [docker-compose file](https://code.informatom.com/Informatom/iot_demo_phoenix/src/branch/master/docker-compose.yml)
ist dabei noch überraschend kompakt.

![Grafana Dashboard](/img/nerves/grafana.png)

Grafana kann eine breite Platte an Visualisierungen von Daten bieten. Ein
[einfaches Dashboard für unsere Daten](https://code.informatom.com/Informatom/iot_demo_phoenix/src/branch/master/grafana_dashboard.json)
besteht zwar persistiert aus knapp 100 Zeilen json, diese werden aber nicht von Hand geschrieben,
sondern über die Weboberfläche von Grafana erzeugt. Schlussendlich ist aber damit auch wieder nur
Infrastructure as Code und gesamte Code für beide Plattformen kann über Git-Repos geshared werden:

* Repo der [Nerves Applikation](https://code.informatom.com/Informatom/iot_demo_nerves) inklusive des
selbst geschriebenen Treibers
* Repo der [Phoenix Applikation](https://code.informatom.com/Informatom/iot_demo_phoenix) inklusive
Grafana und Docker Konfiguration
