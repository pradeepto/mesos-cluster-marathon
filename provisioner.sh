#!/bin/bash

set -x

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF
DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]')
CODENAME=$(lsb_release -cs)

# Add the repository
echo "deb http://repos.mesosphere.io/${DISTRO} ${CODENAME} main" | sudo tee /etc/apt/sources.list.d/mesosphere.list

sudo apt-get -y update

echo $HOSTNAME


if [[ $HOSTNAME =~ .*master.* ]]
then
   sudo apt-get install mesosphere -y
elif [[ $HOSTNAME =~ .*slave.* ]]
then
   sudo apt-get install mesos -y
   sudo apt-get install ruby1.9.1 ruby-dev -y
   sudo gem install bundler
fi