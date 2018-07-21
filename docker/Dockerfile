FROM ruby:2.5
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs git
ENV APP_HOME /apps
WORKDIR /apps
COPY ./Gemfile Gemfile
COPY ./Gemfile.lock Gemfile.lock
RUN bundle