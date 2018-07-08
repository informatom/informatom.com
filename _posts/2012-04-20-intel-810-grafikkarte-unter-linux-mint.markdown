---
layout: post
title: Intel 810 Grafikkarte mit Auflösung 1024x800 unter Linux Mint Fluxbox Edition
date:   2012-04-20 08:00:00 +0200
---

Standardmäßig wird nur 800x600 untestützt.

Um auch 1024x800 zur Verfügung zu haben, erstellt man manuell eine
<code>/etc/X11/xorg.conf</code> mit dem Inhalt

{% highlight shell %}

Section "ServerLayout"
  Identifier "X.org Configured"
  Screen 0 "Screen0" 0 0
  InputDevice "Mouse0" "CorePointer"
  InputDevice "Keyboard0" "CoreKeyboard"
EndSection

Section "Files"
  ModulePath "/usr/lib/xorg/modules"
  FontPath "/usr/share/fonts/X11/misc"
  FontPath "/usr/share/fonts/X11/cyrillic"
  FontPath "/usr/share/fonts/X11/100dpi/:unscaled"
  FontPath "/usr/share/fonts/X11/75dpi/:unscaled"
  FontPath "/usr/share/fonts/X11/Type1"
  FontPath "/usr/share/fonts/X11/100dpi"
  FontPath "/usr/share/fonts/X11/75dpi"
  FontPath "/var/lib/defoma/x-ttcidfont-conf.d/dirs/TrueType"
  FontPath "built-ins"
EndSection

Section "Module"
  Load "dri2"
  Load "dbe"
  Load "extmod"
  Load "glx"
  Load "record"
  Load "dri"
EndSection

Section "InputDevice"
  Identifier "Keyboard0"
  Driver "kbd"
EndSection

Section "InputDevice"
  Identifier "Mouse0"
  Driver "mouse"
  Option "Protocol" "auto"
  Option "Device" "/dev/input/mice"
  Option "ZAxisMapping" "4 5 6 7"
EndSection

Section "Monitor"
  Identifier "Monitor0"
  Option "DPMS"
  HorizSync 28-51
  VertRefresh 43-60
EndSection

Section "Device"
  ### Available Driver options are:-
  ### Values: : integer, : float, : "True"/"False",
  ### : "String", : " Hz/kHz/MHz"
  ### [arg]: arg optional
  #Option "NoAccel" # []
  #Option "SWcursor" # []
  #Option "ColorKey" #
  #Option "CacheLines" #
  #Option "Dac6Bit" # []
  #Option "DRI" # []
  #Option "NoDDC" # []
  #Option "ShowCache" # []
  #Option "XvMCSurfaces" #
  #Option "PageFlip" # []
  Identifier "Card0"
  Driver "intel"
  VendorName "Intel Corporation"
  BoardName "82815 Chipset Graphics Controller (CGC)"
  BusID "PCI:0:2:0"
EndSection

Section "Screen"
  Identifier "Screen0"
  Device "Intel Corporation 82852/855GM Integrated Graphics Device"
  Monitor "Monitor0"
  DefaultDepth 24
  SubSection "Display"
    Depth 24
    Modes "1024x768" "800x600" "640x480"
  EndSubSection
EndSection
{% endhighlight %}

Nach Neustart des X-Servers durch <kbd>STRG</kbd> + <kbd>BACKSPACE</kbd> ist das Problem behoben.
