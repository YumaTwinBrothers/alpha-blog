FROM ruby:2.6.4
RUN apt-get update -qq && apt-get install -y build-essential nodejs

ENV RAILS_ROOT /var/www/app
ARG environment

RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT

# Adding gems
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install --path vendor/bundle;

# Adding project files
COPY . .
