FROM ruby:2.5.3

RUN apt-get update -qq && \
  apt-get install -y build-essential \
  mysql-server\
  mysql-client
RUN apt-get update -qq && apt-get install -y nodejs
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs

WORKDIR /fitO2

COPY Gemfile /fitO2/Gemfile
COPY Gemfile.lock /fitO2/Gemfile.lock

RUN gem install bundler
RUN bundle install

RUN mkdir -p tmp/sockets
