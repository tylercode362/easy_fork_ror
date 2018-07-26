#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
cp ../Gemfile ./Gemfile
cp ../Gemfile.lock ./Gemfile.lock
echo "COPY database.example.yml to database.yml"
cp ../config/database.example.yml ../config/database.yml
cp ../config/app.example.yml ../config/app.yml
sudo rm -rf ../tmp/pids/server.pid
docker-compose build && docker-compose up