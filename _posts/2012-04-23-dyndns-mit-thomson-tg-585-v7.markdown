---
layout: post
title: Dyndns mit Thomson TG 585 v7 ADSL-Modem bei AON ADSL-Zugang
date:   2012-04-23 08:00:00 +0200
---

Das Modem ist im ausgelieferten Zustand dürftig konfiguriert. Um
Dyndns und Always On zu aktivieren sind folgende Schritte nötig:

    telnet 10.0.0.138

user bleibt leer, passwort bleibt leer:

    ppp ifdetach intf INTERNET
    ppp rtdelete intf INTERNET
    ppp rtadd intf INTERNET dst 0.0.0.0/0
    ppp ifconfig intf INTERNET demanddial disabled restart enabled
    dyndns service modify name=dyndns server=members.dyndns.org port=www-http request=/nic/update updateinterval=2097120 retryinterval=30 max_retry=5
    ppp ifattach intf INTERNET
    saveall

Will man Port 3 und 4 statt für IPTV als normale LAN-Switchports
verwenden, ist noch durchzuführen:

    eth bridge vlan ifadd name=default intf=ethport3
    eth bridge vlan ifdelete name=IPTV_vlan intf=ethport3
    eth bridge vlan ifadd name=default intf=ethport4
    eth bridge vlan ifdelete name=IPTV_vlan intf=ethport4

Ich möchte mich noch bei [Flo83](http://flo83.at/?p=651) bedanken.