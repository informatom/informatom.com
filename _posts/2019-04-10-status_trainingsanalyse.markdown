---
layout: post
title: "Trainingsdokumetation und -analyse: Mein Status"
date:   2019-04-10 08:00:00 +0200
---

Nach beinahe vier Jahren des Schlafens erwacht nun dieser Blog wieder zu neuem Leben. Dies ist
hauptsächlich Dr.Stefan Dillinger zu verdanken, dessen Blog
[Podcast | Running | Science](https://raincastle.blog) in Folge noch Erwähnung finden wird.

## 3 Schweinehunde

Es geht nun nicht mehr um die Entwicklung von Mercator, jenes Projekt ist aktuell nicht in Wartung.
Auch sonst hat sich in meinem Leben so einiges verändert. Insbesondere für diesen (und vermutlich
auch einige folgende) Posts relevant ist Wissenschaftspodcastkonferenz Ganzohr, und davon die
[Ausgabe im Jahr 2017](https://wissenschaftspodcasts.de/blog/wisspod/ganzohr2017-treffen-der-wissenschaftspodcasterinnen-in-innsbruck/).
Bei jener saß ich mit 3 weiteren Herren abends in einem netten Innsbrucker Lokal an einem Tisch.
Als wir gerade (wieder einmal zuviel) gegessen hatten, meinte einer,
[Dr.Dominic Helm](https://twitter.com/hellmue?lang=de), er sollte wieder zu trainieren beginnen.
Der oben bereits genannte [Dr. Stefan Dillinger](https://twitter.com/johndillinger15) bot an,
ihn zu trainieren. Sowohl ich als auch [Tobias Lakemann-Grömcke](https://thetj.eu/impressum/)
wollten auch wieder zu trainieren beginnen. Innerhalb weniger weiterer Minuten war dazu ein
Podcastprojekt entstanden, die [3 Schweinehunde](https://3-schweinehun.de/). In dessen
[Nullnummer](https://3-schweinehun.de/2017/09/23/episode0.html#0d7cf0f6) - gleich im Lokal
aufgenommen - kann man noch nachhören, wie sich das zugetragen hat und lernen, dass wir uns
commited haben, monatlich über unseren Trainingsfortschritt am Weg zum Halbmarathon 2019 im
Oktober in München zu berichten.

## Leistungserfassung

Gut 1 1/2 Jahre später stecken wir voll im Training, auch ich bin noch mit Begeisterung dabei.
Ich laufe aktuell bis zu vier mal in der Woche, und zeichne zum Beweis - und zur Analyse - meine
Läufe auf. Dazu verwende ich eine
[Garmin Forerunner 235](https://www.garmin.com/de-AT/learning-center/forerunner-235), die meinen
Puls und meinen GPS Track aufzeichnet. Weiters kommt ein [Stryd Powersensor](https://www.stryd.com/)
zum Einsatz. Mit diesem wird unter anderem die sekündlich die gemessene Leistung an die Uhr
übertragen. Es werden auch noch weitere Werte, wie die Bodenkontaktzeit ermittelt, diese werden,
falls sie in späteren Posts eine Rolle spielen, dann dort erläutert.

## Auswertung

Die erfassten Daten übertrage ich, sobald ich wieder zu Hause bin, zu Garmin per Android App
übertragen. Von dort lasse ich Daten weiter zu Strava senden, wo wir eine
[Laufclub 3 Schweinehunde](https://www.strava.com/clubs/3schweinehunde) gegründet haben, dem die
geschätzten Leser:innen gerne beitreten dürfen.

Das ist noch nicht alles, die Daten werden auch an Stryd gesendet, auf der Webseite des
Stryd Powercenter können die Leistungswerte analysiert werden. Dies ist übrigens bei Strava nicht
möglich. Bei Garmin sollten Sehhöhe, Geschwindigkeit, Herzfrequenz, Leistung, Kadenz,
Bodenkontaktzeit, Vertikale Bewegung pro Schritt, Beinfedersteifigkeit dargestellt werden,
dies ist allerdings nicht bei allen Läufen der Fall, ich kann derzeit kein Muster erkennen, wann
es funktioniert und wann nicht.

Die Aktivitäten erzeugen auf dem internen Speicher der Uhr auch .fit-Files. Dabei handelt es sich um
ein komplexes, binäres, aber dokumentiertes Datenformat. Die Dateien lassen sich auch ohne weitere
Software per Datenkabel von der Uhr direkt auf einen Computer übertragen. Ich mache dies und
importiere die Daten dann in [Golden Cheetah](https://www.goldencheetah.org/), eine
quelloffene, freie Leistungsanlysesoftware von beeindruckender Komplexität, die ich zwar regelmäßig
verwende, die ich aber noch bei weitem nicht vollständig ausnutze. Ich habe mit ihr aktuell auch
ein Problem, die Daten des Leistungsmodelles werden nicht kontinuierlich aktualisiert.

Ich habe zeitweilig auch das Webservice [Runalyze](https://runalyze.com) zur Leistungsanalyse
verwendet, mache das aber aktuell nicht mehr. Ebenso verwende ich das Webservice
[Trainingpeaks](https://trainingpeaks.com/) aktuell nicht mehr.

Ich trage rudimentäre Daten absolvierter Läufe in einen Trainingsplan in Form eines Spreadshirts ein.
Diesen Trainingsplan hat uns dankenswerter Weise Stefan erstellt und sogar persönlich an uns
angepasst.

Vor einigen Monaten habe ich den Static Site Generator [Jekyll](https://jekyllrb.com/) um
die Möglichkeit erweitert, Trainingsdaten zu publizieren. Dies Projekt nannte ich
[Tracker](https://github.com/haslinger/tracker). Die Software ist frei und open source, es gibt
auch eine [Demosite](https://haslinger.github.io/tracker/), auf der einige meiner Läufe publiziert
sind. Das Projekt war aber mehr ein Spaßprojekt, es war noch ohne Leistungsanalysemessung
und ich habe es nie ernst zur Analyse verwendet. Ich fand es aber sehr erfreulich, dass mit
relativ geringem Aufwand eine recht hübsche (siehe
[Beispiel](https://haslinger.github.io/tracker/2018/11/05/14-57.html)) Dokumetation der Läufe
selbst gehostet stattfinden kann, ohne sich auf proprietäre, kommerzielle Services wie Strava
stützen zu müssen.

Insgesamt habe ich aktuell einen sehr guten Plan, auch gute Kenntnis über meinen Leistungsstand,
meine Publikation per Strava stellt mich aber nicht zufrieden. Auch meine private Dokumentation
ist verbesserungswürde, so erfasse ich aktuell etwa nicht, welche Schuhe eigentlich wie lange
benützt wurden und ob sie etwa schon zu ersetzen wären.

Immer wieder erzähte ich in letzter Zeit Stefan von der Idee, die Analyse und Dokumatation auf
eine bessere Basis zu stellen. Bei einer weiteren Podcastingkonferenz, der
[Subscribe 10](https://das-sendezentrum.de/subscribe/sub10/) war er plötzlich von der Idee angetan.
Und das so sehr, dass er einen ausführlichen Blogpost mit seinen
[Anforderungen an eine selbst gebaute Trainingsdokumentations und -analyse Software](https://raincastle.blog/?p=807)
erstellte.

Auf diese Anforderungen gehe ich heute noch nicht ein. Dies war einmal nur die Vorgeschichte.
Im nächsten Post wird es um einige technische und strategische Überlegungen gehen, die ich
in den letzten Wochen angestellt habe.

Bis dahin viel Freude mit dem Lesen von Stefan's Post, dem Grübeln über eigene Anforderungen.
Feedback bitte gerne an mich per Email an <stefan@3-schweinehun.de>.
