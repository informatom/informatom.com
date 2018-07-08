---
layout: post
title: Den Chef kochen oder die Puppen tanzen lassen
date:   2014-09-22 08:00:00 +0200
---

Diese Woche stand im Zeichen der Recherche der Automatisierungs-
und Optimierungsmöglichkeiten im operativen Betrieb. Wir haben viele
Komponenten evaluiert und getestet.

Hypervisor Plattform
--------------------

Zur Zeit laufen alle Serverinstallationen (im Gegensatz zu jenen auf den
Rechnern der Entwickler) unter dem Hypervisor KVM. Sie sind vollwertige
virtuelle Maschinen mit Ubuntu Linux als Betriebssystem. Für jede
weitere Instanz nehmen wir eine weitere virtuelle Maschine mit der
kompletten Installation in Betrieb.

Wir haben Docker und CoreOS als Alternative evaluiert.

Docker setzte ursprünglich auf Linux Container, implementiert aber nun
einen eigenen, sehr ähnlichen Ansatz. Die Virtualisierung passiert auf
Prozessebene, die in einzelnen Containern laufen. Diesen Containern
können - wie virtuellen Maschinen mit KVM - Ressourcen zugewiesen werden
und Netzwerkbrücken eröffnet werden. Der große Unterschied besteht
darin, dass nur ein Betriebssystem und damit auch nur ein Kernel läuft.
Pro virtueller Maschine würden wir rund 250MB RAM (plus ungenutzte
Reserven) sparen.

Bei einem Einsatz von CoreOS als Basismaschine würden weniger Services
laufen, da hier nur die Grundlagen für Docker Container bereitgestellt
werden, aber die weiteren üblichen Services eines Linuxservers nicht
laufen. Die Situation wäre für die Basismaschine damit vergleichbar zu
einem Hypervisor wie VmWare ESX oder Microsoft Hyper-V.

Wir bleiben bis auf weiteres bei KVM, werden aber Docker in Zukunft
testen, wenn wir eine größere Anzahl virtueller Maschinen zu betreiben
hätten.

### Vergleich VM/Docker Architektur

<hr/>
![Docker](/img/blog/docker.png){:style="max-width: 100%"}<hr/>
https://www.informatom.com/system/content_elements/photos/000/000/152/original/menue.png?1421233559

Devops Automatisierung
----------------------

Unter diesem Begriff fassen wir die Automatisierung der Installation,
des Upgrades, des Deployments neuer Softwareversionen und der
Konfiguration aller Komponenten zusammen.

Zur Verwaltung der Betriebssystemkomponenten und Services haben wir
Puppet und Chef evaluiert, die gleich mächtig, aber auch etwa gleich
komplex zu erlernen sind.

Zur Installation der Applikation selbst würde sich Capistrano anbieten,
das aber auch in den Systembetrieb (Services, Bestriebssystemkomponenten) hineinspielt.

Für die Gleichschaltung der Entwicklungsmaschinen bieten sich virtuelle
Maschinen mittels Vagrant und Veewee an.

Wir werden einen weiteren Test mit Puppet wagen, beim Deployment einer
virtuellen Maschine für den nächsten Referenzkunden nehmen wir den
Overhead der Erstellung von Puppet Modulen auf uns.

Vermutlich wird damit die Erstellung einer virtuellen Referenzmaschine
obsolet, da sie jederzeit aus den Puppet Modulen in 15-30 Minuten
automatisch erzeugt werden kann.


### Puppet Datenfluss

<hr/>
![Docker Datenfluss](/img/blog/docker-flow.png){:style="max-width: 100%"}
<hr/>

Gegen Chef spricht mehr ein Bauchgefühl als seriöse Argumente, Capistrano
und das früher evaluierte Whiskey Disk werden wir bis auf
weiteres nicht einsetzen. Es ist aber gut zu wissen, dass wir Optionen
zu Puppet in der Hinterhand haben. Dies sollte unsere Evaluierung
vorurteilsfrei ablaufen lassen.


Produktentwicklungsstrategie
----------------------------

Im Bereich der technischen Produktentwicklung überlegen wir unsere
Ausrichtung anzupassen. (Dies hat keinen Einfluss auf des Marketing
unseres Produktes, es geht hier rein um Entwicklungsstrategie und
Softwarearchitektur.)

Derzeit setzen wir auf eine große Applikation und fünf kleine Gems als
Engines für die optionalen Komponenten.

Kundenspezifische Features haben wir, wenn auch nicht zentral in der
Datenbank, sondern durch die Installation der Gems gesteuert, als
Featureflags abgebildet.

Für kundenspezifische Entwicklung überlegten wir das Branching im
Versionierungssystem.

Ein weniger intensiver Produktansatz, sondern eher ein Serviceansatz
wäre die Aufspaltung in mehr und kleinere Microservices, eventuell sogar
in eigene Applikationen im Sinne einer serviceorientierten Architektur.

Dazu könnten neben den jetzt verwendeten Engines, leichtgewichtigere
Sinatra- und Padrinoapplikationen, aber auch ganze Rails- und
Hoboapplikationen dienen.

Für jegliche Strategieänderung benötigen wir für die Refaktiorierung
eine größere Testabdeckung. Diese ist ohnehin in den nächsten Wochen und
Monaten geplant.

Als Abschluss der Woche haben wir in einem Meetup mit Entwicklern
anderer Firmen die obengenannten Themen diskutiert was zu den bereits
oben genannten Schlussfolgerungen geführt hat.

P.S. zum Titel: Die Scripts unter Chef (dem Chefkoch) heißen Recipies,
deren Sammlungen Cookbooks. Die Koch-Metapher wird hier verwendet,
analog verwendet Puppet die Metapher der Puppen, die man tanzen lässt,
der Server ist etwa der Puppet Master.