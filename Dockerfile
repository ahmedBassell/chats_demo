FROM ruby:latest

RUN apt-get update

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -y nodejs

RUN gem install bundler
RUN gem install rails
RUN gem install mini_magick


WORKDIR /usr/src/app/

COPY . /usr/src/app/


RUN bundle install
