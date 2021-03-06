source 'https://rubygems.org'

ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Authentication
gem 'devise'

# Authorization
gem 'cancancan'

gem "rolify"

gem 'simple_form'

# Pagination
gem 'will_paginate', '~> 3.0.6'

# You'll need to include the following dependencies of Summernote
gem 'bootstrap-sass'
gem 'autoprefixer-rails'
gem "font-awesome-rails"

# This is the right gem to use summernote editor in Rails projects.
gem 'summernote-rails'
gem 'codemirror-rails'

# File upload
gem 'rmagick'
gem 'carrierwave-aws'

# To solve the problems on the turbolinks
gem 'jquery-turbolinks'

group :production do
  gem 'rails_12factor'
end

# Development only gems
group :development do
  gem 'guard-cucumber'
  gem 'guard-rspec'
end

# Specs
group :test, :development do
  gem 'rspec-rails', '~> 3.0'
end

# Testing only gems
group :test do
  gem 'capybara'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'factory_girl_rails'
end
