---
layout: post
title: Die Puppen tanzen
date:   2014-10-06 08:00:00 +0200
---

Diese Woche wollten wir dem Entwicklungsalltag entfliehen und
heben eine Woche eingeschoben, in der wir uns um die Automatisierung der
Installation und Wartung kümmern wollen, also mehr "Devops"
Tätigkeiten verrichten.

Für den Bereich der automatischen Installation und der Automatisierung
der Wartungstätigkeiten haben wir uns nun auf die
Automatisierungssoftware Puppet (http://puppetlabs.com/) festgelegt.
Puppet ist ein weiterer Dienst, der auf der virtuellen Maschine
installiert wird und zeit- oder durch Randbedingungen gesteuert,
Aufgaben durchführen kann.

Ein Argument für Puppet lag darin, dass es in Ruby programmiert werden
kann, der Programmiersprache, in der wir über das größte Know How
verfügen.

Allerdings hilft uns Puppet wenig beim Bootstrapping, also, wenn wir uns
Münchhausen gleich, am Beginn der Installation an der eigenen
Stiefelschlaufe aus dem Sumpf ziehen müssen. Wir verwenden dazu
ebenfalls eine auf Ruby basierende Software Veewee
(<https://github.com/jedi4ever/veewee>). Mit Veewee programmierten wir die
Erzeugung virtueller Maschinen für unterschiedliche Hypervisor
(Virtualbox, KVM, VmWare und Parallels). Es kann in diesen dann auch
automatisiert das Betriebssystem (in unserem Fall Ubuntu Linux)
installieren. Auch nach der Basisistallation kann Veewee noch weitere
Aufgaben durchführen, wie etwa Puppet installieren, das dann die weitere
Installation, Konfiguration und Wartung übernimmt.

Veewee selbst bedient sich bei der Erstellung der virtuellen Maschine
eines weiteren Tools: Vagrant (<https://www.vagrantup.com/>). Wie alle
anderen Komponenten ist Vagrant Open Source, sodass wir am Schluss eine
Guided Selling Lösung mit einem komplett freien Softwarestack
implementiert haben werden.

Die erzeugten Festplattien-Images können dann für praktisch alle
Hypervisor konvertiert werden.

### Beispielscript Installation rvm mit Veewee

{% highlight shell %}
# Install dependencies
apt-get -y install bash curl git-core build-essential bison openssl libreadline6 libreadline6-dev zlib1g zlib1g-dev
apt-get -y install libssl-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev curl git-core libyaml-dev libxslt-dev
apt-get -y install autoconf libmysqlclient-dev libreadline5 libltdl-dev libncurses5-dev libserf1-dbg libsvn1 libtool
apt-get -y install subversion libgdbm-dev pkg-config libffi-dev gawk

# Install rvm
curl -L get.rvm.io | bash -s stable
usermod --append --groups rvm vagrant

# Install Ruby
RVM=/usr/local/rvm/bin/rvm
$RVM install 2.1.2
$RVM alias create default 2.1.2
$RVM rubygems current
{% endhighlight %}

Puppet
------

Wir haben ein Script erstellt, das uns Entwicklungsmaschinen und
Demomaschinen für Referenzkunden und Marketingtermine auf Knopfdruck
erstellen kann.

Bei den weiteren Installationsschritten mittels Puppet haben wir Erfolge
erzielt, aber auch mit einem Problem zu kämpfen.

Das Positive: Wir können problemlos den Webserver Apache, die Datenbank
MySQL und deren Verwaltungstool PHPMyadmin und den Ruby Versionsmanager
RVM installieren.

Bei der Installation von Ruby selbst und Ruby On Rails haben wir mit der
Problematik zu tun, dass wir gewöhnlich Ruby und Rails unter einem
niedrig privilegierten User "rails" installieren. Puppet kommt mit
einem eigenen Benutzer "puppet", sodass wir mit jedem Script
zunächst den Benutzer wechseln müssten. Eine Alternative wäre auf
vorgefertigte Ruby und Ruby On Rails Pakete umzusteigen, hier haben wir
uns noch nicht entschieden.

Wir können zum Beispiel auch die Mercator Applikation selbst mit allen
ihren Modulen aus den Repositories automatisch installieren.

### Beispielscript Installation Mercator

{% highlight ruby %}
class mercator {
  file { "/var/rails":
         ensure => "directory",
         owner => "rails",
         group => "rails",
         mode => 770 }

  exec { 'init git repo':
         cwd => '/var/rails',
         command => '/usr/bin/sudo -u rails /usr/bin/git clone ssh://git@mittenin.at/var/git/mercator.git && rm /var/rails/mercator/Gemfile.lock',
         creates => '/var/rails/mercator',
         require => File['/home/rails/.ssh/id_rsa'],
         logoutput => true }

  exec { 'init git repo mercator_bechlem':
         cwd => '/var/rails/mercator/vendor/engines',
         command => '/usr/bin/sudo -u rails /usr/bin/git clone ssh://git@mittenin.at/var/git/mercator_bechlem.git',
         creates => '/var/rails/mercator/vendor/engines/mercator_bechlem/Gemfile',
         require => File['/home/rails/.ssh/id_rsa'],
         logoutput => true }

  exec { 'init git repo mercator_icecat':
         cwd => '/var/rails/mercator/vendor/engines',
         command => '/usr/bin/sudo -u rails /usr/bin/git clone ssh://git@mittenin.at/var/git/mercator_icecat.git',
         creates => '/var/rails/mercator/vendor/engines/mercator_icecat/Gemfile',
         require => File['/home/rails/.ssh/id_rsa'],
         logoutput => true }

  exec { 'init git repo mercator_legacy_importer':
          cwd => '/var/rails/mercator/vendor/engines',
          command => '/usr/bin/sudo -u rails /usr/bin/git clone ssh://git@mittenin.at/var/git/mercator_legacy_importer.git',
          creates => '/var/rails/mercator/vendor/engines/mercator_legacy_importer/Gemfile',
          require => File['/home/rails/.ssh/id_rsa'],
          logoutput => true }

  exec { 'init git repo mercator_mesonic':
         cwd => '/var/rails/mercator/vendor/engines',
         command => '/usr/bin/sudo -u rails /usr/bin/git clone ssh://git@mittenin.at/var/git/mercator_mesonic.git',
         creates => '/var/rails/mercator/vendor/engines/mercator_mesonic/Gemfile',
         require => File['/home/rails/.ssh/id_rsa'],
         logoutput => true }

  exec { 'init git repo mercator_mpay24':
         cwd => '/var/rails/mercator/vendor/engines',
         command => '/usr/bin/sudo -u rails /usr/bin/git clone ssh://git@mittenin.at/var/git/mercator_mpay24.git',
         creates => '/var/rails/mercator/vendor/engines/mercator_mpay24/Gemfile',
         require => File['/home/rails/.ssh/id_rsa'],
         logoutput => true }

  exec { 'bundle install':
         cwd => '/var/rails/mercator',
         command => '/usr/local/rvm/bin/rvmsudo /usr/local/rvm/gems/ruby-2.1.2@global/bin/bundle install',
         creates => '/var/rails/mercator/Gemfile.lock',
         require => Exec['init git repo'],
         logoutput => true,
         user  => 'rails' }
}

class {'phpmyadmin':
       ensure => present,
       root_password => '*enter*password*here*' }
}
{% endhighlight %}