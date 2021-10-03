FROM ruby:2.5.3

RUN apt-get update -qq && \
  apt-get install -y build-essential \
  mysql-server\
  mysql-client
RUN apt-get update -qq && apt-get install -y nodejs
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs

WORKDIR /BestMap

COPY Gemfile /BestMap/Gemfile
COPY Gemfile.lock /BestMap/Gemfile.lock

RUN gem install bundler
RUN bundle install

RUN mkdir -p tmp/sockets
