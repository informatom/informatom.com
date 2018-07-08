---
layout: post
title: Money Makes the World Go Round
date:   2014-08-18 08:00:00 +0200
---

## E-Payment Modul

In dieser Woche haben wir das E-Payment Modul implementiert. Dabei haben
wir uns bislang auf den Minimalfall beschränkt (ein Payment-Provider,
minimale Datenübertragung). Wir haben aber die Schnittstelle als
eigenständiges Gem implementiert. Das bedeutet, dass wir für weitere
Zahlungsprovider das Gem als Ganzes kopieren können, die Schnittstelle
zur API des alternativen Anbieter implementieren und damit rasch eine
weiteren Payment-Anbieter einbinden können.

Templatebearbeitung
-------------------

Das Editieren der Templates mit dem von uns verwendeten WYSIWYG-Editor
CKEditor ist für die Entwickler und Designer ausgesprochen unangenehm.
Beide Gruppen wollen den Code beim Schreiben sehen, nicht die gerenderte
Voransicht. Doch auch die Quellcodeansicht ist nicht sehr angenehm: Der
Editor nicht für DRYML ausgelegt, sein Syntaxhighlighting funktioniert
daher nur beschränkt.

Wir haben daher für die Websitetemplates auf den ebenfalls
Javascript-basierten Editor Codemirror umgestellt, der sich, obwohl er
vollständig im Browser läuft und damit nichts lokal installiert werden
muss, beinahe wie ein nativ im Betriebssystem laufender Editor anfühlt.
DRYML ist ein XML-Derivat und das Syntax-Highlighting für XML
funktioniert für DRYML ausgezeichnet, so werden etwa fehlerhafte Tags
angemerkt.

### Beispiel des unterstützenden Syntaxhighlighting in Codemirror

Der Editor erkennt, dass der Tag in Zeile 18 nicht stimmt, da er nicht
zum geöffnetet `<div>` passt, des zu schließen ist und unterstreicht den
Fehler.

<hr/>
![Codemirror](/img/blog/codemirror.png){:style="max-width: 100%"}
<hr/>

Im Screenshot erkennt man etwa auch in den Zeilen 25, 26, 27 die von uns
geschriebenen DRYML-Tags `<admin /> <skype-and-tel /> <basket-info />`
die des erstellen von Webseitenvorlagen beschleunigen. Sie werden
serverseitig zunächst zu ERB und weiter zu HTML und Javascript
kompiliert und dann an den Browser ausgeliefert. Damit bietet uns DRYML
Webcomponents im Sinne der W3C Spezifikation für Custom Elements
<http://w3c.github.io/webcomponents/spec/custom/> bereits jetzt.

Friendly IDs
------------

Als neues Feature hat unsere CMS-Kompontente Friedly IDs für die
einzelnen Webseiten.

Das bedeutet, dass statt eines kryptischen URL

<code>http://shop.example.com/webpages/27</code>

nicht nur wie im Hobo-Standard der Titel der Webseite angehängt wird

<code>http://shop.example.com/webpages/27-support</code>

sondern die ID gänzlich entfallen kann:

<code>http://shop.example.com/webpages/support</code>

Der Kunde kann den dargestellten Text (in der Fachsprache slug genannt)
nun frei wählen

<code>http://shop.example.com/webpages/wir-helfen-gerne</code>

und das Routing wurde insofern geändert, dass bei Webseiten auch der
Ressourcenteil entfallen kann:

<code>http://shop.example.com/wir-helfen-gerne</code>

Vermischtes
-----------

-   Bei einer Kundenbesprechung haben wir kleinere Prozessfehler
    entdeckt, die ebenfalls diese Woche behoben wurden.
-   Im Demosystem haben wir eine Datenbereinigung durchgeführt, um
    Verwirrung bei Interessenten zu vermeiden.