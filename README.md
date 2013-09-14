[![Build Status](https://travis-ci.org/adamzaninovich/rally_rampage.png?branch=master)](https://travis-ci.org/adamzaninovich/rally_rampage)

# README

* Managed with [Pivotal Tracker](https://www.pivotaltracker.com/s/projects/902628)

## Setting up the database

1. Install Postgres. For mac, use [postgres.app](http://postgresapp.com).
2. `bundle install`
3. Recreate Database: `rake db:create db:migrate db:seed db:test:prepare`

