---
layout: post
title: "Mercator Kick off: Protokollieren einmal anders"
date:   2014-01-07 08:00:00 +0200
---

Das Projektteam hat sich eingefunden, das Kickup Meeting geht
los. Die Rollen werden nochmals dezidiert definiert. Business as usual.
Und das Protokoll?

Protokolle von Besprechungen sind ungeliebte Kinder, sie sind nötig,
aber weder ihre Erstellung noch dis spätere Lesen bereitet Freude.
Deshalb werden wir einen anderen Weg einschlagen: Wir werden die
erledigten Aufgaben zusammenfassen, und die sich stellenden
Herausforderungen beleuchten.

Insbesondere werden wir uns auf die Lessons Learned und die daraus
resultierenden Aufgaben im Projekt fokussieren. Auch das Format soll
etwas Neues darstellen. Warum nicht mal in der Form von Artikeln, die
sich als Blogposts veröffentlichen lassen, protokollieren?

Das bedeutet einerseits, die Protokolle müssen für sich alleine gelesen
verständlich sein, was Projektmitarbeitern, die nicht teilnehmen
konnten, ein klares Bild vermittelt.

Andererseits sind die Protokolle auch als Texte zur Veröffentlichung für
die teilnehmenden Personen (gegebenenfalls in leicht abgewandelter Form)
verwendbar. Und es ist sichergestellt, dass potentielle Kunden den
Spirit und den Projektfortschritt verfolgen können. Auch die anderen
Stakeholder - wie etwa das Projektcontrolling - langweilt sich nicht zu
Tode.

<hr/>
![Überblick](/img/blog/ueberblick.png)
<hr/>

Der Ort der Protokollierung ist neben ihrer Form nicht zu unterschätzen.
Wir werden an zwei Orten dokumentieren und dann versuchen, die
erstellten Texte an mehreren Stellen einzusetzen oder wenigstens
ausschnittweise wiederzuverwenden, um nicht das Rad mehrmals neu zu
erfinden.

Ein Ort ist die webbasierte Projektmanagament-Applikation Redmine. Alle
Texte werden, soweit möglich, nicht in Dokumenten erfasst, sondern
inline in einem Wiki, aus dem Texte und Textbausteine einfach kopiert
werden können. In Redmine gibt es neben einer Zeiterfassung, dem
angesprochenen Wiki, Filestorage, einem einfachen Dokumentenmanagement
und Todo Listen (durch ein Add-On) auch die Einbindung des Git
Repositories des Quellcodes. Damit kann der Code ohne weitere Tools mit
allen seinen Versionen gelesen und analysiert werden. Git ist das von
uns verwendete Versionierungssystem.

Der zweite Ort der Dokumentation ist der Quellcode selbst. Hier
versuchen wir die Dokumentation inline in Form von Kommentarzeilen
gering zu halten. Kommentare deuten auf unverständlichen Code hin und
gelten daher als "Code smell". Also eine Stelle, wo etwas faul ist.
Sehr nützlich sind aber zum Beispiel Verweise auf Fremdartikel, etwa zu
Verfahren, also weiterführenden Quellen zum Code. Daher werden wir auch
fremde Entwickler nicht von Kommentaren abraten, sondern sie als
Information, die das 'Warum?' erklärt, verwenden. Das 'Wie?' soll stets
der Code selbst erledigen, lieber drei Zeilen mehr, um eine Stelle zu
erklären, als trickreich, elegant oder clever zu sein. Wir müssen
unseren Code auch Jahre später noch warten und verstehen können, und
zwar von allen Teammitgliedern.

Jedenfalls zu unterlassen ist die Variante bei einer Refaktorierung (der
Überarbeitung) alte, nicht mehr verwendete Codezeilen als Kommentare in
den Files zu belassen. Das ist wegen der Verwendung einer
Versionierungssoftware überflüssig und lenkt vom gültigen Code ab.

<hr/>
![Versionsvergleich](/img/blog/versionsvergleich.png)
<hr/>
;

Nun nochmal die Klarstellung: Mercator wird zwar eine Webshop Software.
Aber eben auch viel mehr: Leider haben wir derzeit keinen besseren
Ausdruck als das sperrige "Guided Selling Lösung".

Vertriebsmitarbeiter sollen in der Software eine Unterstützung ihrer
Tätigkeit finden, sie darf nie behindern, sondern soll die wertvollen
Kräfte im Unternehmen unterstützen und den Kunden eine angenehme
Beratungssituation ermöglichen.

Auf zum ersten Modul - die nötige Infrastruktur aufsetzen und
loslegen!