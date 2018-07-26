#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
sudo apt-get update -qq && sudo  apt-get install -y build-essential libpq-dev git
curl -sL https://deb.nodesource.com/setup_8.x -o /tmp/nodesource_setup.sh
/bin/bash /tmp/nodesource_setup.sh
sudo  apt-get install -y nodejs
sudo npm install -g n
sudo n stable
sudo npm install -g yarn