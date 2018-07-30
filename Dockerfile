FROM ruby:2.4.1
RUN apt-get update -qq \
    && apt-get install -y build-essential libpq-dev nodejs imagemagick libmagick++-dev \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /rikitter

WORKDIR /rikitter

ADD Gemfile /rikitter/Gemfile

ADD Gemfile.lock /rikitter/Gemfile.lock

RUN bundle install

ADD . /rikitter

RUN cd /rikitter