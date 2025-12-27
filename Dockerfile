FROM ruby:3.3.1

RUN apt-get update -qq && \
  apt-get install -y nodejs postgresql-client file vim curl gzip && \
  rm -rf /var/lib/apt/lists /var/cache/apt/archives

# RUN gem update --system --no-document && \
#   gem install -N bundler -v 2.1.4

WORKDIR /sextou-app

COPY Gemfile /sextou-app/Gemfile

COPY Gemfile.lock /sextou-app/Gemfile.lock

RUN bundle install

COPY . .

RUN bin/rails fly:build

# Default server start instructions.  Generally Overridden by fly.toml.
ENV PORT 8080
ARG SERVER_COMMAND="bin/rails fly:server"
ENV SERVER_COMMAND ${SERVER_COMMAND}
CMD ${SERVER_COMMAND}
