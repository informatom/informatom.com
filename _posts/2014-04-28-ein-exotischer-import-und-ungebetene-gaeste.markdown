---
layout: post
title: Ein exotischer Import und ungebetene Gäste
date:   2014-04-28 08:00:00 +0200
---

## Crossselling Informationen aus Bechlem

In den letzten 7 Tagen haben wir eine weitere Schnittstelle als Engine
und Gem entwickelt. Sie bezieht Crossselling Daten aus dem Webservice
Bechlem (<http://www.bechlem.de/de/index.html>), also zum Beispiel, die
Information welche Tintenpatronen für einen Drucker als Zubehör nötig
sind.

Die Navigation haben wir in Form von Breadcrumbs ausgeführt, die
Kategorisierung basiert auf jener von Bechlem. Bechlem ist kein
unmittelbar verwendbares Webservice, sondern stellt den Download der
Daten in Form von CSV-Dateien zur Verfügung. Diese Daten lesen wir per
Batch Job als Rake Task in eine MYSQL-Datenbank außerhalb der Mercator
Datenbank, die wir bei Bedarf in Echtzeit befragen. Wir haben damit rund
1.2 Millionen Relationen zwischen Produkten und Zubehörartikeln zur
Verfügung, stellen aber nur jene Produkte dar, die auch tatsächlich der
Kunde in seinem Produktkatalog hat.

Bechlem ist wieder als optionale Schnittstelle für Mercator ausgeführt,
wird also nur im Kundensystem installiert, falls der Kunde das Service
tatsächlich in Anspruch nehmen will.

### Crossselling

<hr/>
![Crossselling](/img/blog/crossselling.png){:style="max-width: 100%"}
<hr/>

Sowohl die Bechlem Schnittstelle als auch Elasticsearch und die
Facettensuche sind auf das Demosystem ausgerollt.

Die Namensraumproblematik, die im letzten Bericht angesprochen war, hat
uns auch hier wieder getroffen. Durch manuelle Views und manuelle
Konfiguration der Routen konnten wir der Probleme Herr werden.

Das Einspielen der SQL Daten hat überraschend Probleme bereitet, die
MYSQL Datenbank hat das Einspielen von Daten aus externen Dateien aus
Sicherheitsgründen verboten. Wir haben herausgefunden, dass es uns
möglich ist, die Datenbankverbindung von Ruby On Rails Seite her so zu
parametrisierten, dass der Import in diese Datenbank zugelassen wird.

Weiters ist der MySQL-Client von Ruby On Rails standardmäßig im Modus
"strict", was das Einfügen von NULL-Werten aus CSV-Dateien
erschwert. Dieser Parameter ist zu löschen, um einen reibungslosen
Import zu ermöglichen.

Nebenbei beherrschen wir nun auch den Download von FTP Servern und das
umgehen mit komprimierten Dateien innerhalb einer Ruby On Rails
Applikation.

Sicherheitslücke Elasticsearch
------------------------------

Die Standardinstallation von Elasticsearch, der Suchmaschine, die wir
für die Produktsuche und die Filterung der Produkteigenschaften
eingeführt haben, ist inhärent unsicher, die Suchmaschine erlaubt
Anfragen auf allen Netzwerkschnittstellen von beliebigen Adressen.
Nebenbei kann per Request beliebiger Code ausgeführt werden. Zusammen
mit dem Umstand, dass Elasticsearch authentifizierungslos ist, eine
sicherheitstechnische Katastrophe.

Als wir verdächtigen Netzwerkverkehr beobachtet haben, haben wir
unmittelbar recherchiert und entsprechende Sicherheitsvorkehrungen
getroffen. Nicht auszudenken, wäre dies auf einem Produktivsystem
passiert.

Wir sind nun wieder alamiert und mehr um die Sicherheit der
Softwarekomponenten bemüht.

An und für sich bleibt Elasticsearch eine wesentliche Komponente für uns
mit großem Potential, wir sind dabei die Produkt- und Kategoriensuche
von der Websitesuche, die in Hobo eingebaut ist, auf Elasticsearch
umstellen. Erste Tests versprechen eine deutliche
Geschwindigkeitssteigerung, nebenbei ist unsere Suche damit
tippfehlerresistent.