#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
echo "copy Gemfile"
cp ../Gemfile ./Gemfile
cp ../Gemfile.lock ./Gemfile.lock

if [ ! -f ../config/database.yml ]; then
  cp ../config/database.example.yml ../config/database.yml
  echo "COPY database.example.yml to database.yml"
fi
if [ ! -f ../config/app.yml ]; then
  cp ../config/app.example.yml ../config/app.yml
  echo "COPY app.example.yml to app.yml"
fi
docker-compose build --no-cache && docker-compose up