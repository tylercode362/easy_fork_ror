FROM ruby:2.5
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
ENV APP_HOME /apps
WORKDIR /apps
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev git
RUN apt-get install build-essential patch ruby-dev zlib1g-dev liblzma-dev
RUN curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh
RUN /bin/bash nodesource_setup.sh
RUN apt-get install -y nodejs
RUN npm install -g n
RUN n stable
RUN alias nodejs=node
RUN npm install -g yarn
COPY ./Gemfile Gemfile
COPY ./Gemfile.lock Gemfile.lock
RUN bundle
CMD bash -c "bundle install && bundle exec rake assets:precompil && rails db:setup"
