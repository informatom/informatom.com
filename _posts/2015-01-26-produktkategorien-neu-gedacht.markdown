---
layout: post
title: Produktkategorien neu gedacht
date:   2015-01-26 08:00:00 +0200
---

## Semantisch/logische Produktkategorien

Im Zuge einer neuen Kundenanforderung haben wir im Bereich der
Produktkategorien eine Umstellung durchgeführt:

Der Kunde wünschte sich, Produkte, nach Kriterien, die in seinem ERP
hinterlegt sind, zusammenfassen zu können, etwa alle Produkte aus einer
Kategorien und ihren Unterkategorien im ERP.

Wir haben bislang derartige Sonderwünsche explizit im Importjob
berücksichtigt, in dem wir die entsprechenden Abfragen in der
ERP-Schnittstelle implementiert haben. Das hatte allerdings zur Folge,
dass jede Änderung eine Änderung im Code und damit eine Intervention von
uns benötigt hat.

Nun haben wir ein weiteres Attribut in der Produktkategorie eingeführt,
mit der vom Produktmanager des Kunden eine logische Bedingung hinterlegt
werden kann, die im Importjob evaluiert und berücksichtigt wird.

So sucht

    (preisdatumVON <= Time.now) & (preisdatumBIS >= Time.now)

etwa nach Aktionen,

    (artikeluntergruppe <= '00060-00090-00090-00000-00000') & (artikeluntergruppe >= '00060-00090-00000-00000-00000')

nach Artikeln in gewissen Artikelgruppen oder

    kennzeichen == 'S'

nach besonders gekennzeichneten Artikeln im ERP. Die hier zu verwendende
Abfragesprache ähnelt SQL und stammt aus dem [Squeel
Gem](https://github.com/activerecord-hackery/squeel). Wir geben auf
diese Weise nicht beliebige SQL Konstrukte frei, sondern erlauben nur
Lesezugriffe in der ERP-Datenbank.

Weiters kennzeichnen wir Kategorien nun semantisch in der Datenbank, ob
es sich um eine einfache Kategorie, eine mit Squeel-Bedingung, die
Kategorie der Aktionen oder etwa eine Mercator-Systemkategorie handelt.
Ein Beispiel für die letzte Gruppe sind die "Waisen", in der per Job
Produkte gesammelt werden, die keiner anderen Kategorie zugeordnet sind
oder nicht zugeordnet werden können.

### Semantische Kategorienkennzeichnung

<hr/>
![Semantische Kategorien](/img/blog/semantische_kategorien.png){:style="max-width: 100%"}
<hr/>

Diverses
--------

-   Wir haben gelernt, dass Truetypeschriften (.ttf) ein
    Berechtingungskonzept kennen. Schriften können als nicht für den
    Download lizenziert gekennzeichnet werden. Das verhindert im
    Microsoft Internet Explorer den Download während sich Mozilla
    Firefox und Google Chrome nicht daran halten.
-   Der Importjob für Kategorien aus dem Mercator-Legacy-Importer wurde
    um einen Importjob in der ERP-Schnittstelle
    Mercator-Mesonic ergänzt.
-   Im Bereich SEO haben wir eine Verbesserung durchgeführt, Webseiten
    im CMS können nun beschlagwortet werden.