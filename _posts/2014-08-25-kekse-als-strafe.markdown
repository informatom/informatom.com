---
layout: post
title: Kekse als Strafe
date:   2014-08-25 08:00:00 +0200
---

## Authentifizierung über mehrere Domains hinweg

Manchmal glaubt man als Entwickler die Welt nicht mehr zu verstehen.
Manche Browser schienen hin und wieder grundlos die Anmeldeinformationen
in Mercator zu verlieren. Und noch merkwürdiger: Manchmal schienen diese
Anmeldeinformationen auch wieder zurückzukommen. Als einer unserer
Entwickler wider diese Situation erlebt hat, ist er der Sache auf den
Grund gegangen:

Wir verwenden zur Wiedererkennung angemeldeter Benutzer Cookies. Diese
Cookies enthalten Informationen zur Session und sind domainspezifisch, worin der Schlüssel des Problems liegt.

### Beispiel-Cookie

<hr/>
![Cookie](/img/blog/cookie.png){:style="max-width: 100%"}
<hr/>

Die Mercator-Instanz, bei der das Problem wieder aufgetreten ist, ist
ein Staging System bei einem Kunden, der unterschiedliche Domains für
Webshop und sonstige Domain verwendet, also etwa:
`http://company-shop.com` und `http://company.com`.

Bislang waren alle Systeme derart beschaffen, dass die beiden Teile auf
unterschiedlichen Subdomains der selben Domain gelaufen sind, also
`http://shop.company.com` und `http://www.company.com`. Wir haben die
Cookies der Applikation - um dies zu ermöglichen - richtiger Weise
domainspezifisch konfiguriert und nicht subdomainspezifisch.

Ein Teilen eines Cookies über Domaingrenzen hinweg - und des würden wir
hier benötigen - ist aber aus Sicherheitsgründen technisch im Standard
für Cookies verboten.

Die Situation ist in sofern nicht dramatisch, als der einzig relevante
Störfall jener ist, wo ein Kunde eines Shops sich einen oder mehrere
Artikel in den Warenkorb legt und sich in Folge auf den CMS-Seiten
informiert. Dann ist der Warenkorb plötzlich wieder leer (da der Konnex
zum User in der Datenbank nicht mehr hergestellt werden kann). Bewegt er
sich wieder in den Shopbereich, ist auch der Warenkorb wieder gefüllt.
(Wir haben in weiterer Folge auch tatsächlich Webshops 'in the wild'
gefunden, die dieses Problem haben.) Es ist aber jedenfalls verwirrend.

Wir benötigen, um die Situation wirklich zu bereinigen eine Form von
Single Sign On zwischen den beiden Domains, aus Browsersicht zwischen
den beiden Domains. Eine echte SSO Infrastruktur aufzuziehen, erfordert
einiges an Aufwand, wir müssten hier Hobo deutlich erweitern. Nach
einiger Recherche sind wir zu einer Lösung ohne allzu großen Aufwand
gekommen:

Wechselt ein User zwischen der Bereichen durch Klick auf einen Link, so
leiten wir ihn auf die richtige Domain in der Applikation um. Wir kennen
zu diesen Zeitpunkt noch die korrekten Anmeldeinformationen. Wir können
daher zu diesem Zeitzunkt ein zeitlich begrenzt gültiges Token
erstellen, das wir dem umgeleiteten URL hintanstellen und in der
Datenbank ablegen. Dieses Token verwenden wir beim Behandeln des
nächsten, des umgeleiteten Requests zu korrekten Anmeldung des Users
womit er auch ein Cookie für die zweite Domain erhält. Damit ist er an
jeder Stelle der Applikation korrekt angemeldet.

### Remember Token

<hr/>
![Token](/img/blog/token.png){:style="max-width: 100%"}
<hr/>

### Vermischtes

-   Wir haben Fortschritte bei Portierung auf Twitter Bootstrap 3
    gemacht und verwenden es nun im Frontend und im Backend komplett.
-   Wir haben einige DRYML-Helpertags erstellt, um die
    Templateerstellung weiter zu vereinfachen.