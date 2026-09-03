---
layout: page
title: SAP Fiori Entwicklung
permalink: fiori/
---

![SAP, OpenUI5](/img/fiori/logos.png){: .stack-logos}

Da alle Fiori-Projekte, die ich in den letzten Jahren abgewickelt habe, unter
NDA stehen, hier nur einige Erläuterungen zum Thema. Ich kann in persönlichen
Gesprächen in Bezug auf ihre Anforderungen ähnliche Projektaufgaben schildern,
und die entsprechenden Umsetzungen beschreiben, ohne dann auf die jeweilige
Firmenkonstellation einzugehen.

## Der Fiori-Begriff

*Fiori* wird von SAP für drei unterschiedliche Dinge verwendet, die man auseinanderhalten sollte:

1. Die **Fiori Design Guidelines** – ein Regelwerk für einheitliches UI/UX-Design.
2. **Freestyle SAP UI5-Entwicklung** – klassische, frei programmierte Frontend-Entwicklung.
3. **SAP Fiori Elements** – generierte, Template-basierte Applikationen.

### 1. Fiori Design Guidelines

Die Guidelines enthalten Richtlinien, ein SDK und Sketch-Stencils für

- Fiori-Entwicklung für Android in Java oder Kotlin,
- Fiori-Entwicklung für iOS in Objective-C oder Swift,
- Fiori-Webanwendungsentwicklung in JavaScript,
- sowie eigene Conversational Design Guidelines.

Die Dokumentation dazu findet sich unter [Fiori Design](https://experience.sap.com/fiori-design/).

### 2. Freestyle SAP UI5-Entwicklung

SAP UI5 (und die quelloffene Variante OpenUI5) ist ein klassisches MVC-Frontend-Framework mit
one- und twoway Data-Binding. Views lassen sich in XML, JavaScript, JSON oder HTML schreiben, als
Datenmodelle kommen oData, JSON, XML und – für die Internationalisierung – Resource-Models zum
Einsatz.

oData-Datenquellen liegen dabei irgendwo zwischen REST und GraphQL, quasi "REST on Steroids": Ein
Service-Definitionsdokument (`/$metadata`) beschreibt die Schnittstelle. oData ist auch außerhalb
von SAP ein Microsoft-Standard, etwa für die Office 365 API.

Freestyle-Entwicklung bringt mit:

- mehr als 500 fertige Komponenten, bis zum 3D-Viewer, und die Möglichkeit, eigene Komponenten zu
  bauen,
- [UI5 Web Components](https://sap.github.io/ui5-webcomponents/), die sich auch aus beliebigen
  anderen Frontend-Frameworks heraus nutzen lassen, etwa via
  [React-Unterstützung](https://github.com/SAP/ui5-webcomponents-react) von SAP selbst,
- Entwicklungs- und Debugging-Tooling inklusive Mocking-Server sowie einem Proxyserver zur
  CORS-Mitigation, manuell oder über die Business Technology Platform (BTP),
- Unit-Testing mit QUnit und Integrationstests mit OPA – Test-Driven Development ist also möglich,
- Entwicklung lokal oder in der Cloud (SAP Business Application Studio),
- Einsatz von Drittanbieter-Tools wie jQuery, Jenkins, NPM, Visual Studio Code, Git oder AWS – SAP
  selbst veröffentlicht mehr als 200 Repositories auf GitHub.

Ein Wermutstropfen: Große Teile der Dokumentation beziehen sich noch auf die ältere SAP Web IDE
und sind entsprechend veraltet, und auch Performance kann bei größeren Freestyle-Apps zum Thema
werden.

### 3. SAP Fiori Elements

Fiori Elements dreht das Prinzip um: Statt Code zu schreiben, wählt man eines von sechs Floorplans
(Templates) als Ausgangspunkt:

- Initial Page (leere Seite)
- List Report (Listenansicht)
- Object Page (Anzeigen / Bearbeiten / Löschen / Anlegen / Kopieren)
- Analytical List Page (Liste mit Charts, filterbar über den Kopfbereich)
- Overview Page (Dashboard aus Cards wie Chart-, Table-, List- oder Quick-View-Cards)
- Wizard (geführte Prozesse)

dazu kommt die Worklist Page für einfache Massenaktionen auf Listen (Freigabe, Kommissionierung,
Filter & Suche) sowie vier verschiedene Layouts.

Diese Floorplans sind Applikationsvorlagen, die beim ersten Aufruf im Browser zu vollwertigen
SAPUI5-Apps inklusive XML-Views kompiliert werden. Angepasst wird nicht der generierte Code,
sondern über **Annotationen** – Konfigurationseinträge im `manifest.json` und in eigenen
Annotationsdateien (JSON/XML). Diese Annotationen tragen die semantische Bedeutung, verknüpfen
Backend und Frontend und steuern zum Beispiel, ob Daten editierbar sind, ein durchaus
security-relevantes Detail.

SAP nennt das "Codeless Programming": Man konfiguriert statt zu programmieren – vergleichbar mit
Customizing, wenn auch weniger eindeutig – und bekommt dafür laut SAP ein konsistentes,
responsives UI, das bei künftigen SAP-Updates automatisch mitaktualisiert wird, solange kein
Custom Code im Spiel ist. Laut SAP werden inzwischen 80% der eigenen Fiori-Apps auf diese Art
gebaut.

Wie kompakt das werden kann, zeigt ein Beispiel aus einem aktuellen Fiori-Kurs: Die
travellist-App generiert aus einer Handvoll serverseitiger Annotationsdateien über 1700 Zeilen
XML-Konfiguration für den Mock-Service – handgeschriebenes JavaScript entfällt komplett zugunsten
der Annotationen. Ein Bild, das die Sache gut trifft: Fiori Elements verhält sich zu Freestyle
SAPUI5 wie ein Lego-Set aus vorgefertigten Formteilen zu einem Set aus klassischen Bausteinen –
schneller fertig, aber mit weniger Freiheitsgraden.

Generierte Apps lassen sich trotzdem erweitern: über wiederverwendbare, View- und
Controller-basierte Fragments (klassischer SAPUI5-Freestyle-Code) an definierten
**Extension Points**, oder per ganzen Custom Pages an bestimmten Stellen – dort trägt man dann
selbst die Verantwortung für UI/UX, auch bei künftigen Upgrades.

Als Datenquelle dienen bestehende SAP oData Services oder
[SAP CDS Views](https://blogs.sap.com/2019/10/21/part1.-sap-cds-views-demystification/), je nach
Entwicklungsmodell restful (RAP, ab Release 7.54), cloud-basiert (CAP), ABAP for Fiori (vor 7.5)
oder klassisch ABAP (vor 7.4). Woher die Daten letztlich kommen, ist dabei zweitrangig – es kann
genauso gut ein SAP BW oder ein Drittsystem sein.

Ergänzend dazu setzt SAP mit dem Cloud Application Programming Model auf ein der
Freestyle-Entwicklung ähnliches Modell, bei dem Datenmodellierung und -migration aber direkt aus
der Applikation heraus erfolgen, siehe den Kurs
[Building hana-opensap-cloud-2020](https://www.youtube.com/watch?v=GSNQpfxPuLU&list=PL6RpkC85SLQAHZ_V3cZsTok0T6BvI4HT1)
von Thomas Jung, aufbauend auf
[Software Development on SAP HANA](https://open.sap.com/courses/hana7).

## Chancen für Ihr Unternehmen

Aus diesen drei Kontexten ergeben sich für mich als Entwickler ganz unterschiedliche
Einsatzmöglichkeiten:

- Bestehende Fiori Elements Apps ersetzen oder side-by-side erweitern (Side-by-Side
  Extensibility, Adaptation Projects)
- Neue Fiori Elements Apps rasch erstellen
- Custom Apps unter Einsatz Ihres kundenspezifischen Prozesswissens, side-by-side zum Standard
- Custom Screens zu bestehenden Fiori Elements Apps hinzufügen, siehe mein Code-Beispiel
  [fiori-my.manage.products](https://github.com/informatom/fiori-my.manage.products/commits/master)
  auf GitHub
- SAPUI5 Freestyle Apps dort, wo Fiori Elements zu einschränkend oder – etwa auf mobilen Geräten –
  zu leistungshungrig sind
- Performance-Optimierungen, Fehlerbehebungen und genauere SPA-Proxy-Spezifikation
- Upgrades bestehender Apps auf neue Releases, etwa im Zuge einer HANA-Migration
- Produktentwicklung eigener, nicht kundenspezifischer "Z"-Applikationen
- Integration von Drittsystemen in die SAP-UX

Und nicht zuletzt Schulungen – für Key User (Anpassung bestehender Apps für gruppenspezifische
Anwendungen), End User (individuelle Anwendungen) sowie für Ihre in-house Entwickler
(unternehmensweite Anwendungen). Mehr zu meinem Schulungsangebot generell auf der Seite
[IT-Schulung](/schulung).

### Links

- [Fiori Design Guidelines](https://experience.sap.com/fiori-design/)
- [UI5 Web Components](https://sap.github.io/ui5-webcomponents/)
- [UI5 Web Components React-Unterstützung](https://github.com/SAP/ui5-webcomponents-react)
- [SAP CDS Views Demystification](https://blogs.sap.com/2019/10/21/part1.-sap-cds-views-demystification/)
- [Building hana-opensap-cloud-2020 (YouTube-Kurs)](https://www.youtube.com/watch?v=GSNQpfxPuLU&list=PL6RpkC85SLQAHZ_V3cZsTok0T6BvI4HT1)
- [Software Development on SAP HANA (openSAP-Kurs)](https://open.sap.com/courses/hana7)
- [Code-Beispiel: fiori-my.manage.products](https://github.com/informatom/fiori-my.manage.products/commits/master)
- [code.informatom.com/informatom](https://code.informatom.com/informatom)
- [github.com/informatom](https://github.com/informatom/)
