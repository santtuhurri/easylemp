#!/bin/bash
# Copyright 2018 Tero Karvinen http://TeroKarvinen.com GPL 3

echo "Easy installer for LEMP  Starting... santtuhurri/easylamp"

echo "Installing Salt and Git..."
sudo apt-get update
sudo apt-get -y install git salt-minion

echo "Retrieving and Applying Settings..."
git clone https://github.com/santtuhurri/easylemp.git
cd easylemp/

sudo cp -R nginx /srv/salt/
sudo cp -R mariadb /srv/salt/
sudo cp -R php /srv/salt/
sudo cp top.sls /srv/salt/top.sls

echo "You can now try the state with 'sudo salt-call --local state.apply'"
echo "Done."
