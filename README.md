# Rails Blog

By Tony Maseda

## Ruby version

2.0.0

## System dependencies

* Ruby on Rails 4.1.4
* PostgreSQL

## Configuration

Install required gems.
```
$ bundle install
```

## Database creation

```
$ rake db:create
```

## Database initialization

```
# Development
$ rake db:migrate

# Production
$ heroku run rake db:migrate
```

## How to run the test suite

```
$ bundle exec rspec
```

## Services

None at this time.

## Deployment instructions

```
# Production
$ git push heroku master
```

## TODO

```
1. Associate user with comment ( comment.user )
2. In Heroku, Carrierwave uploads must be stored on S3 and cannot be cached in the public directory
3. Make iHover elements links
```
