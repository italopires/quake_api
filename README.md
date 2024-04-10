# README

### Ruby on Rails
This application requires:
* ruby 3.3.0

### Database
This application uses Postgresql with ActiveRecord

### Development
* Testing Framework: RSpec and Factory Bot

## Build and Up Docker container.

```console
docker-compose build
docker-compose run web rails db:create db:migrate
docker-compose up
```
## Deploy local through RVM and Ruby
```
rvm install 3.3.0
```
Learn more about [RVM](https://rvm.io/rvm/install) installation

### Install dependencies
Using [Bundler](https://github.com/bundler/bundler)
```
gem install bundler
bundle
```
### Task for initial development setup

```
rails db:create
rails db:migrate
```
### Start rails server
```
rails s -b 0.0.0.0 -p 3000
```
### To run the tests, execute the command bellow
```
rspec
```

### API Endpoints

## Open it on your best browser

Watch the documentation [Documentation](https://documenter.getpostman.com/view/34024629/2sA3BgAasi)
