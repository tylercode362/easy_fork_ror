#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
cp ../Gemfile ./Gemfile
cp ../Gemfile.lock ./Gemfile.lock
rm -rf ../tmp/pids/server.pid
docker-compose build --no-cache && docker-compose up --force-recreate