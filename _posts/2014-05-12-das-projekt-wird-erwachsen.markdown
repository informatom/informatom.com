---
layout: post
title: Das Projekt wird erwachsen
date:   2014-05-12 08:00:00 +0200
---

## Änderungen an vielen Stellen

Mercator wird von Woche zu woche besser, es wird aber auch von Woche zu
Woche größer.

Wir merken, dass das Know How der einzelnen Entwickler bei Weitem nicht
mehr die ganze Anwendung umfasst, bei Erweiterungen oder bei Problemen
muss immer mehr untereinander kommuniziert werden. Oft müssen dann
selbst die Entwickler recherchieren, warum sie einen gewissen Punkt in
der Applikation auf eine bestimmte Weise realisiert haben, insbesondere,
wenn die Art der Realisierung nicht trivial oder naheliegend ist.

-   Technisch wurde die Sitesuche neu mittels Ajax-Request
    implementiert, womit der Benutzer - schließt er das Suchergebnis,
    wieder auf die Seite zurück gelang, von der er gesucht hat.
-   Wir suchen nun nicht mehr nur nach Produkten, sondern auch nach
    Kategorien und stellen diese nach Relevanz sortiert dar. Die
    Relevanz ermittelt sich aus der Treffgenauigkeit und der
    Trefferhäufigheit der Suchbegriffe im Suchresultat.
-   Kunden können nun auch Produktdatenblätter der Hersteller zu den
    einzelnen Artikeln herunterladen, sofern sich diese in einer
    Produktdatenbank von rund 250 Herstellern befindet.
-   Die Hobo Site-Suche wurde komplett zugunsten der Suche in der
    Suchmaschine aufgegeben, im Administrationsbereich können einzelne
    Modelle (konkret User und Artikel) über Filter rasch
    gefunden werden.
-   Wir haben festgestellt, dass einige alte importierte Bilder einen
    falschen Mimetype aufweisen und haben einen Job geschrieben, die
    diesen Datentyp in der Datenbank richtig stellt. Wir greifen dabei
    auf die für die Erstellung der Thumbnails (das sind die
    verkleinerten Bildvorschaudateien) bereits verwendete Bibliothek
    Imagemagick zurück.
-   Einige kleinere Bugs und Unzulänglichkeiten wurden behoben, dies
    geschah als gemeinname Anstrengung unter Beteiligung aller
    Entwickler, womit auch wieder das Wissen über Applikationsteile, an
    denen man nicht oder nur wenig selbst gebaut hat, gestiegen ist.
-   Kunden können nun die Geschäftsbedingungen bereits aus dem Warenkorb
    abhaken, ohne sie lesen zu müssen. Die Option zu lesen, besteht
    selbstverständlich weiterhin.

### AGBs

<hr/>
![AGB](/img/blog/agb.png){:style="max-width: 100%"}
<hr/>

-   Wir haben ein Script geschrieben, mit der wir unsere Länderdarenbank
    auf weitere Sprachen einfach erweitern können.
-   Wir wissen damit, dass die Erde derzeit 245 Staaten aufweist und
    kennen ihre englischen Namen: ;-)

*Afghanistan, Albania, Algeria, American Samoa, Andorra, Angola, Anguilla,
 Antarctica, Antigua and Barbuda, ..., Vietnam, Virgin Islands, British, Virgin Islands,
 U.S., Wallis and Futuna Islands, Western Sahara, Yemen, Zambia, Zimbabwe*

-   Damit können wir zugleich die korrekten Ländercodes in das
    angeschlossene ERP-System übertragen.
-   Ein Entwickler aus Mauritius hat mit uns Kontakt aufgenommen. Er
    will zwar Mercator nicht unbedingt einsetzen. Aufgrund der
    Publikation des Quellcodes war es ihm aber möglich, einige
    Entwicklungsmuster zu lernen. Sein Dank hat uns gefreut und
    motiviert.