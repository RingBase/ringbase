vagrant
====

Make sure you have [Vagrant](https://www.vagrantup.com/downloads) and [Virtualbox](https://www.virtualbox.org/wiki/Downloads) installed.

You'll only need to do this once if you haven't already.
`vagrant box add precise64 http://files.vagrantup.com/precise64.box`

Now run `vagrant up` and you're all set.

To access the Vim run `vagrant ssh`.

Final Note
If you want to start Cassandra run `sudo sh ~/apache-cassandra-2.0.5/bin/cassandra`

Control Cassandra from CLI `~/apache-cassandra-2.0.5/bin/cqlsh`