FROM ubuntu:14.04

RUN set -x \
  && apt-get update -y \
  && apt-get install -y git-all curl wget vim build-essential libyaml-dev libssl-dev zlib1g-dev python-dev python2.7 python-pip \
  && cd /tmp \
  && wget https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.2.tar.gz \
  && tar -zxvf ruby-2.4.2.tar.gz \
  && cd ruby-2.4.2 \
  && ./configure && make && make install \
  && gem install bundler

RUN mkdir /code
WORKDIR /code
COPY ./Gemfile /Gemfile
RUN bundle install
