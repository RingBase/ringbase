#!/usr/bin/env bash

sudo apt-get update
sudo apt-get upgrade

# Install Java
sudo apt-get install -y openjdk-7-jdk

# Downloads Cassandra
sudo wget http://www.us.apache.org/dist/cassandra/2.0.5/apache-cassandra-2.0.5-bin.tar.gz
sudo tar -xvzf apache-cassandra-2.0.5-bin.tar.gz

# Insuring Cassandra has access permissions
sudo mkdir /var/lib/cassandra
sudo mkdir /var/log/cassandra
sudo chown -R $USER:$GROUP /var/lib/cassandra
sudo chown -R $USER:$GROUP /var/log/cassandra

# Exporting variables
export CASSANDRA_HOME=~/apache-cassandra-2.0.5
export PATH=$PATH:$CASSANDRA_HOME/bin
