---
layout: post
title: Echtzeitkommunikation nun über einen Messagingserver
date:   2014-03-17 08:00:00 +0200
---

Wir haben nun das Messaging auf eine solide und zeitgemäße Basis
gestellt: den Messaging Server Faye. Alle Browserferster abonnieren nun
Nachtichtenkanäle ihrer Inhalte über einen lange laufenden Ajax Request.
Sie erzeugen damit, solange sich die für sie relevanten Informationen
nicht ändern, auch keine Serverlast.

Erst wenn sich etwas ändert, erfährt das Fenster, welche Komponente
aktualisiert werden soll, und stellt dann einen gezielten Request auf
genau diese Inhalte.

Wir planen zur Zeit nur eine Instanz des Messagingservers für alle
Shopinstanzen zu betreiben, die Lastanalyse wird zeigen, ob dies
ausreicht.

Der Berater, also der Vertriebsmitarbeiter kann nun den Kunden per
Cobrowsing auf andere Inhalte führen. Bei Inhalten innerhalb der Domäne
unter der Mercator installiert ist, werden die Inhalte in einer Lightbox
eingeblendet, bei Inhalten von anderen Domänen in einem I-Frame
innerhalb der Lightbox.

Um den Upload von Screenshots noch schneller zu machen, fragen wir nun
nicht mehr nach einem Dateinamen, sondern vergeben einen Standardnamen,
der im Anschluss in aller Ruhe geändert werden kann.

Kunden können nun nach ihrer Beratungssession ein Feedback abgeben und
dabei entscheiden, ob sie und/oder der Berater dabei anonym bleiben
sollen. Diese Anonymität ist durch die Datenstruktur tatsächlich
gewährleistet.

Es gibt nun die Ansicht der Überprüfung des Warenkorbes vor dem
eigentlichen Bestellvorgang.

Der Text der Seite, in dem sich der Shopbesitzer für die Bestellung
bedankt, ist für den Kunden frei konfigurierbar und jederzeit änderbar.
Der Bestellprozess ist damit für das Erste komplett.

Wir sind nun in der Lage, falls Mercator als B2B Shop eingesetzt wird, die
Eingabe einer UID-Nummer zu erzwingen und diese gegenüber dem
Webservice der Europäischen Kommission unter
<http://ec.europa.eu/taxation\_customs/vies/viesspec.do> zu verproben. Wir
könnten in Folge auch den Erfolg der Validierung in Form des
Bestätigungscodes des Service in der Datenbank ablegen und damit dem
Shopbetreiber den Beweis der Überprüfung der VAT-Nummer erleichtern.

Wir mischen nun alte bestehende Warenkörbe nicht mehr automatisch hinzu.
Der Kunde erhält die Möglichkeit, alte - wir nennen sie geparkte -
Warenkörbe positionsweise in den aktiven Warenkorb zu übernehmen und sie
im Anschluss zu archivieren.

Für jede Position des Warenkorbes gibt es nun Upselling, das bedeutet,
der Kunde kann sich passende Zubehörartikel zu einem Artikel einblenden
und diese unmittelbar in den Warenkorb legen, ohne dazu die Ansicht
verlassen zu müssen. Das ist eine Komfortfunktion für den Kunden, die
das Produktmanagement nach unserer Meinung erfunden hat und ein
Alleinstellungsmerkmal von Mercator darstellt. Zumindest haben wir
dieses Feature noch in keinem anderen Webshop gesehen.

Es gibt nun eine Volltextsuche auf Artikelebene im gesamten Shop. In der
Administrationssicht ist der Produktindex sortierbar und durchsuchbar.

Bei der Suche nach Artikeln (z.B. in der Beratungssicht für die
Erstellung von Produktvergleichen) haben wir die Autocompletion von
Produktnamen auf Artikelnummern umgestellt.

Wir haben die Performance der Produktdetailansicht analysiert. Die
Laufzeiten von 3-4 Sekunden ergeben sich interessanter weise nicht durch
die Datenbankabfrage (70ms) sondern durch den Aufbau der Webseite, in
dem bei bis zu 100 Detailinformationen pro Artikel verarbeitet, aufbereitet
und ausgegeben werden. Wir überlegen die Option, etwa die
Zubehörartikel erst bei Bedarf, das heißt, wenn der entsprechende
Registerreiter auch vom Kunden aufgerufen wird, nachzuladen.

Das Thema Performance des Produktvergleiches haben wir gelöst, indem wir
die Datenbankstruktur umgestellt haben. Produkteigenschaften und
Produkteigenschaftengruppen gelten nun übergreifend über alle Produkte,
erst die Werte dieser Eigenschaften sind produktspezifisch.

Diese Umstellung, die im ersten Moment nach Haarspalterei klingt,
viertelt die Menge der Daten, die in diesem Bereich in der Datenbank
abgelegt und halbiert den Code zur Darstellung des Vergleichs. So
nebenbei wurde auch noch ein Fehler im alten Code entdeckt.

### Der Produktvergleich

<hr/>
![Produktvergleich](/img/blog/produktvergleich.png)
<hr/>

Ein minimalistischer Parser erkennt beim Import numerische und boolsche
(ja/nein) Eigenschaften.

Bei den Überlegungen und ersten Versuchen zur Filterung nicht
Produkteigenschaften dürften wir auf einem Holzweg sein, hier laufen die
Recherchen noch.

Insgesamt haben wir wieder erfolgreich zwei Wochen hinter uns, in denen
wir gegenüber dem Plan aufgeholt haben.