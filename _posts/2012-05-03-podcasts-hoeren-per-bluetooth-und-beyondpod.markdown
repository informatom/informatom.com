---
layout: post
title: Podcasts hören per Bluetooth und Beyondpod
date:   2012-05-03 08:00:00 +0200
---

Da hat man sein nettes Smartphone - in meinem Fall ein Samsung
Galaxy S2 und kann partout per Bluetooth keine Podcasts hören.
Hintergrund: Die Bluetooth Spec sagt, dass nur Stereo-Headsets dafür
geeigenet sein.

Mit dem Bluetooth Audio Widget gehört dieses Problem der Vergangenheit
an, er möglich das Routen des Tons auf Mono-Headsets. Ich verwende ein
Plantronics M20 und die Audioqualität ist OK, wenn auch nicht
berauschend.

Dies funktioniert instantan für den eingebauten Mediaplayer, nicht aber
für meinen Podcast Client BeyondPod. Dafür ist ein weiterer Hack nötig,
den der Entwickler von Beyondpod im Forum erklärt:

> I added a small change in the latest build that can force BeyondPod to
> ignore the "rejection of audio focus" and start playback. To turn it
> on, you need to install the latest beta version (2.9.15) from our web
> site, Open it and then navigate to the Advanced settings ( Menu &gt;
> More &gt; About BeyondPod &gt; long press on the line that shows the
> version number &gt; Advanced settings).<br/>
> Once in the advanced settings screen check "Hide unsupported Media", then tap on
> "Supported File Types". Append ",ignorefocus" after
> the last extension (so it should look like ...,png,bmp,ignorefocus) and
> press OK.<br/>
> This should allow the playback to start when BTMono is active.

Damit steht dem Podcasthören per Bluetooth Headset nichts mehr im Weg.

### Links

-   [Bluetooth Audio Widget](http://de.androidzoom.com/android_applications/music_and_audio/bluetooth-audio-widget_luox.html)
-   [Artikel im BeyondPod Forum](https://groups.google.com/forum/?fromgroups#!topic/beyondpod/iIeE5UEmIf8)