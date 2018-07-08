---
layout: post
title: Getrennte Wege
date:   2014-12-29 08:00:00 +0200
---

## Die Produktentwicklungsstrategie

Pünktlich mit dem Installationsbeginn für des dritte Referenzsystem
konnten wir eine Lösung unseres Hauptproblems in der Strategie der
Produktentwicklung lösen.

Das Problem besteht kurz zusammengefasst darin, dass es möglich sein
soll Features kundenübergreifend aber auch kundenspezifisch entwickeln
zu können. Ebenso müssen gewisse Konfigurationen (wie Layout, Styling, etc)
kundenübergreifend durchzuführen sein, andere kundenspzifisch.

Einen Teil dieses Problems hatten wir damit gelöst, dass wir einzelne
Module (in Form von Rubygems und Rails Engines ausgeführt) erstellt
haben, wie die ERP-Schnittstelle. Schon beim zweiten Referenzsystem
hatten wir aber die Schwierigkeit,
dass alle Gems installiert werden müssen, da des Gemfile "mitten" in
der Applikation liegt und damit kundenübergreifend ist.

Wir haben die Steuerung zunächst über Rails Environments zu trennen
versucht, aber auch dabei müssen in allen Systemen alle Gems installiert
werden. Das Thema unterschiedlichen Layouts (CSS Files, DRYML Tags) hatten wir
überhaupt noch ignoriert.

Wir haben auch versucht, möglichst viele Einstellungen in die Datenbank
zu verlegen. Bei den oben genannten Beispielen ist dies aber nicht
möglich. Wir haben damit nur bei etwa 10 Dateien ein Problem, diese bei jedem
Update manuell systemspezifisch einzuspielen, ist aber einfach zu viel
Aufwand und zu fehleranfällig.

Doch dann kam die Erleuchtung in Form von Symlinks und
systemspezifischen Code-Repositiories. Das bedarf einer Erklärung, da
der Ansatz eigentlich sehr einfach, aber nicht verbreitet ist.
Die genannten 5-10 Dateien, werden in der Applikation durch symbolische
Link auf Dateien innerhalb eines kunden- oder systemspezifischen
Verzeichnisses (/vendor/customer) ersetzt.

Dieses Verzeichnis ist in einem getrennten Code-Repository. Damit
reduziert das Deployment, das wir ohnehin per Git durchführen auf einen
zweiten Pull-Vorgang, der auch per Script automatisiert
werden könnte.

Auf Entwicklungsrechnern kann damit sogar rasch zwischen mehreren
Systemen durch eine weitere Indirektion gewechselt werden:
Pro System gibt es ein Verzeichnis innerhalb von <code>/vendor/customers</code>
- man bemerke das 's'!). Und /vendor/customer linkt immer aus des gerade
betrachtete System.

<hr/>
![Indirektion](/img/blog/indirection.png){:style="max-width: 100%"}
<hr/>

Im Zuge dessen haben wir die Repositories für alle 6 Systeme (3
Referenzsysteme mit je einem Entwicklungs- und einem Stagingsystem)
angelegt und tranportiert.

Wir haben das System nun auf allen Rechnern und Servern getestet, es
funktioniert problemlos.

Damit können wir weitere Modularisierungen, wie etwa die Umwandlung der
eigentlichen Applikation in eine Engine auf einen wesentlich späteren
Zeitpunkt verschieben evtl sogar ganz absagen.

Vermischtes
-----------

Für das erste Referenzsystem wurden einige Arbeiten durchgeführt:

-   kleine Layoutanpassungen
-   Erstellung eines alternativen Importjobs für Kategorien
-   Es gibt ein Script zum Testen der Vollständigkeit der Kategorien
    (gibt es für jedes Produkt wenigstens eine Kategorie, in der es
    zugeordnet ist?)
-   Neuimport der Produkte
-   Ein Systemupdate auf eine neuere Betriebssystemversion wurde
    durchführt (Ubuntu 12.04 auf Ubuntu 14.04). Es gab hierbei
    keinerlei Probleme. Mercator ist mit beiden Versionen
    voll kompatibel.
-   Das zweite Referenzsystem ist nun installiert und kann mit Daten
    befüllt werden.
-   Wir haben ein Modul zum Tracken der User installiert. Damit werden
    wir etwa verfolgen können, ab Benutzer im Shop herumirren oder
    effektiv Produkte finden und bestellen können.