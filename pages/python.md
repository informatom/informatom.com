---
layout: page
title: Python
permalink: python/
---

<div class="columns">
<div class="column" markdown="1">

Nachdem ich vor zwei Jahrzehnten als Mittelschullehrer Python unterrichtet habe,
entwickle ich seit einiger Zeit auch wieder vermehrt mit Python. Es eignet sich
vorzüglich im wissenschaftlichen Umfeld (Datenanalyse, Big Data KI, AI) zum
Scripten, aber auch für serverseitige Webapplikationen.

Manchmal muss man einfach ein wenig über den eigenen Tellerrand hinausdenken,
um die Möglichkeiten dieser Sprache auszunutzen. Ein kleines Beispiel gefällig?

## Blindengerechtes Wifi-Radio

Mein blinder Vater hatte seinen Leben lang nie Personal Computer verwendet,
er hielt sich nicht über das Internet sondern über viele weltweite
Radiostationen up to date. Doch die internationalen Mittel- und Langwellensender
wurden immer weniger. Da hatte ich eine Idee.

Ich funktionierte einen alten Laptop in ein blindengerechtes Wifi-Radio um,
indem ich eine minimale Linux-Distribution ohne graphisches Nutzerinterface
installierte. Mein Vater erhielt einen Account, der automatisch beim Booten des
Geräts angemeldet wird. Unmittelbar wird ein Python-Skript gestartet, dass
jede Tastaturinteraktion abfängt und für jede Taste einen anderen Internetradio-Stream
startet, der über Kopfhörer oder die eingebauten Lautsprecher des Laptops
wiedergegeben wird. Da es sich um einen Laptop handelt, ist die Lösung innerhalb
der Reichweite des Wlans mobil.

Das kleine Script, von dem sie alle wesentlichen Komponenten hier sehen,
ist seit Jahren im täglichen Einsatz. Hin und wieder verstirbt die Hardware
des Laptops, dann setze ich eine idente Umgebung wieder auf und mein Vater
hat wieder 40 Radiostationen at his finger tip. Um sich nicht die Position aller
Sender merken zu müssen, sagt das Script auch mit jedem Tastendruck, welcher
Sender nun gestartet wird.

Beim Neustart des Rechners wird das Script über das Internet neu bezogen,
sodass es mir möglich ist, die Senderliste aus der Ferne aktuell zu halten, wenn
sich der URL eines Streams ändert.

### Jupyter

Für die Erarbeitung von wissenschaftlichen Artikeln stellen die Jupyter Notebooks
eine hervorragenede interaktive Umgebung dar. Gab es ursprünglich nur den
Python Kernel, kann heute mittlerweile Code von mehr als 100 verschiedenen
Sprachen in Jupyter Notebooks ausgeführt und visualisiert werden.

Eine JupyterLab - Instanz ist immer auf meinem Laptop installiert.

### Eine ganze Distribution - Anaconda

Um kurz Wikipedia zu zitieren: 

> Anaconda ist eine Freemium-Open-Source-Distribution für die Programmiersprachen
> Python und R, die unter anderem die Entwicklungsumgebung Spyder, den
> Kommandozeileninterpreter IPython, und ein webbasiertes Frontend für Jupyter
> enthält. Der Fokus liegt vor allem auf der Verarbeitung von großen
> Datenmengen, Vorhersageanalyse und wissenschaftlichem Rechnen. Das Ziel der
> Distribution ist die Vereinfachung von Paketmanagement und Softwareverteilung.

Anaconda zählt mehrere hundert spezielle Python Pakete, die
[Liste der Pakete ](https://docs.anaconda.com/anaconda/packages/py3.7_linux-64/)
ist schier unglaublich.

### Links

* Den kompletten Quellcode und die Senderkennungsfiles finden Sie 
im Github-Repo [internet_radio](https://github.com/haslinger/internet_radio).
* [Project Jupyter](https://jupyter.org/)
* [Anaconda](https://www.anaconda.com/) Python Distribution


</div>
<div class="column is-half" markdown="1">

### Quellcode

```python
#!/usr/bin/python
# -*- coding: utf-8 -*-

# Module importieren
import os
import sys
import curses
import time

def tune_in(text, url):
  os.system('killall mplayer')
  ansage(text)
  time.sleep(4)
  play(url)

def play(url):
  os.system('mplayer -really-quiet -nolirc -ao alsa -cache 128 ' + url +
  ' < /dev/null > /dev/null &')

def ansage(text):
  play('~/internet_radio/ansagen/' + text + '.mp3')

#Lautstaerke setzen
volume = 50 
os.system('amixer set Master ' + str(volume))
# Curses Modus starten
stdscr = curses.initscr()
curses.noecho()
curses.cbreak()
stdscr.keypad(1)
# Standardsender OE1
tune_in('oe1', 'http://mp3stream3.apasf.apa.at:8000')

# Texthilfe
pad = curses.newpad(30,10)

while True:
  c = stdscr.getch()

# lauter
 if c == curses.KEY_RIGHT:
      if volume < 80:
        volume = volume + 5
        ansage('lauter')
        os.system('amixer set Master ' + str(volume))
# leister
  elif c == curses.KEY_LEFT:
      if volume > 0:
        volume = volume - 5
        ansage('leiser')
        os.system('amixer set Master ' + str(volume))
# Sender je nach gedrueckter Taste abspielen
  elif c == ord('1'):
    tune_in('oe1',
            'http://mp3stream3.apasf.apa.at:8000')
  elif c == ord('2'):
    tune_in('radio_wien',
            '-playlist https://oe2wshoutcast.sf.apa.at/listen.pls')
  elif c == ord('3'):
    tune_in('oe3',
            '-playlist http://mp3stream7.apasf.apa.at:8000/listen.pls')
  elif c == ord('4'):
    # weitere Sender folgen hier...

# Wartungsmodus mit PAGE DOWN (d.h. Programm sauber beenden)
  elif c == curses.KEY_NPAGE:
    os.system('killall mplayer')
    break
# Curses Modus sauber beenden
curses.nocbreak()
stdscr.keypad(0)
curses.echo()
curses.endwin()

```

</div></div>
