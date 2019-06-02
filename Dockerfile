FROM ruby:latest
RUN mkdir -p /opt/boliche
WORKDIR /opt/boliche
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ADD Gemfile /opt/boliche/Gemfile
RUN gem install rubocop
RUN bundle install
ADD . /opt/boliche
EXPOSE 3000