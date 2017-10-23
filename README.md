# Rails CI Image

## Backround

This image provides a base image for preforming various continuous integration tasks for Ruby on Rails applications.

## Flavors

This image comes in the following flavors:

- `latest` (see [ruby:latest](https://hub.docker.com/_/ruby/))
- `ruby-2.3` (see [ruby:2.3](https://hub.docker.com/_/ruby/))
- `ruby-2.4` (see [ruby:2.4](https://hub.docker.com/_/ruby/))

All images contain:

- Official Apt Repos
  - MariaDB
  - Postgres
  - ZeroMQ
- Packages
  - curl
  - ca-certificates
  - bzip2
  - imagemagick
  - jq
  - libfontconfig
  - libzmq3-dev
  - libmariadbd-dev
  - libpq-dev
  - mariadb-client
  - net-tools
  - postgresql-client
  - tcpdump
  - xz-utils
- [docker](https://www.docker.com/)
- [node](https://nodejs.org/)
- [phantomjs](http://phantomjs.org/)
- [bundler config](https://bundler.io/v1.15/man/bundle-config.1.html)
  - `disable_exec_load=true` (see [bundler/bundler#5005](https://github.com/bundler/bundler/issues/5005))
  - `github.https=true`
- ENV
  - `RAILS_ENV=test`
  - `RACK_ENV=test`

## Gitlab CI Example

I have included a [Gitlab CI](https://about.gitlab.com/features/gitlab-ci-cd/) configuration example [here](.gitlab-ci.yaml) from a Ruby on Rails 5.1 project using Postgres.
