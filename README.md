# README
* Ruby version

3.4.5

* System dependencies

Rails 8.0.4

PostgreSQL 17

Puma 7.1.0

Devise 4.9

* Configuration

DB URL encrypted in credentials.yml using materkey

* Database creation

rails db:create


* Database initialization

rails db:migrate


* How to run the test suite

rails test

pushes to GitHub Repo trigger testing

* Services (job queues, cache servers, search engines, etc.)

Disabled queue, cache and cable for Render deployment

* Deployment instructions

Pushes to GitHub repo automatically deployed to Render
