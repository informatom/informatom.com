---
layout: post
title: Kennwort vergessen
date:   2014-06-02 08:00:00 +0200
---

## Anmeldung per E-Mail

Wir kennen die Situation selbst nur zu gut: Man muss sich auf einer
Webseite wieder anmelden, auf der man sich vor Jahren registriert hat
und kennt das Kennwort nicht mehr.

Meist kann man sich dann einen Link zusenden lassen, dann das Kennwort
neu eingeben, evtl. ein weiteres Email bestätigen und sich dann neu
anmelden.

Wir haben nun eine ebenso sichere, aber wesentlich schnellere Lösung für
die Kunden implementiert. Man gibt bei der Anmeldung wahlweise nur seine
E-Mail Adresse ein und erhält einen Login-Link per E-Mail der 5 Minuten
Gültigkeit hat. Klickt man im E-Mail Client auf den Link, landet man
angemeldet im Shop. Wir verzichten weiters darauf, den User zu zwingen,
sein Kennwort zu ändern, er kann dies aber natürlich freiwillig tun.

Wir haben bereits diese Funkion für Test-User schätzen gelernt und
nutzen sie so selbst regelmäßig.

### Login Link

<hr/>
![Login Link](/img/blog/login-link.png){:style="max-width: 100%"}
<hr/>

Wir haben uns dazu entschlossen, die E-Mailadresse als die
User-Identifikation zu verwenden. Wollen Kunden meherere Accouts
parrellel benutzen, können Sie dies mit mehreren E-Mail Adressen bequem
tun. Die Kennwortverschlüsselung ist per Salt gesichert, des bedeutet,
dass jedes Kennwort vor der Verschlüsselung nochmals mit einem
Zufallsstring modifiziert wird. Sollte unsere verschlüsselte
Kennwortdatenbank in fremde Hände gelangen, ist damit eine
Entschlüsselung über Rainbow Tables ausgeschlossen. Unter Rainbow Tables
versteht man Wörterbücher, die zu Kennwörtern und
Verschlüsselungsalgorithmen Hashtabellen verzeichnen. Man könnte damit,
kennt man ein Kennwort und seinen Hash aus der Tabelle aller Hashes alle
Kennwörter unmittelbar entschlüsseln.

Javascript Frontend Framework
-----------------------------

Für die Kalkulation komplexerer Angebote ist der aktuell implementierte
Mechanismus unpraktisch bis nicht tauglich: Jede Änderung, die vom
Vertriebsmitarbeiter durchgeführt wird, wird zum Server übertragen. Die
Position und das Angebot wird am Server neu berechnet und das Ergebnis
wird zu den Browsern von Vertriebsmitarbeiter und Kunde übertragen und
die Ansicht aktualisiert.

Um die Sache möglichst flüssig und schnell zu gestalten, verwenden wir
keine klassischen Formulare, die per Post Requests gesendet werden.
Dabei würde anschließend nach ablauf der Controller-Logik die gesamte
Webseite am Server neu generiert und dann an die beiden Browser
übermittelt. Wir verwenden schon jetzt Ajax-Requests, bei denen nur die
geänderten Seitenteile ("Partials") übertragen werden und dann vom
Browser an die entsprechenden Stellen auf der Webseite eingebaut werden.

Für komplexe Angebote, bei denen viele Parameter für den
Kundenmitarbeiter zu berücksichtigen sind, ist dieser Vorgang dennoch zu
langsam und die Kalkulation am Server mühselig. Wir werden vermutlich
für diesen Fall ein clientseitiges Javascript Framework einsetzen. Die
Evaluierung der unterschiedlichen Frameworks ist derzeit im Gang. Wir
müssen besonders auf die Kompatibilität zu unserer Hobo-Anwendung
achten, möchten wir doch möglichst wenig der existierenden Anwendung
ändern und eine möglichst einfache Weiterentwicklung betreiben.

So ein Framework wird es im Gegensatz zu den bisher erstellten Seiten
dem Browser ermöglichen, die Struktur der Daten zu verstehen und den
Server Arbeit abnehmen können. Erst die Ergebnisse werden dann an den
Server übertragen, überprüft und auf die Datenbank persistiert sowie zum
Kunden übertragen.

Weiteres
--------

Die Installation des ersten Referenzsystems hat begonnen.