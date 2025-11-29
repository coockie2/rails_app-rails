# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails', '8.0.3'

gem 'mysql2', '>= 0.5.5'

gem 'puma'

gem 'bootstrap', '~> 5.3.3' # Bootstrapが必要なら
gem 'dartsass-sprockets'
gem 'importmap-rails'
gem 'sprockets-rails'

# for user password
gem 'bcrypt', '~> 3.1', '>= 3.1.12'

# Run against this stable release
group :development, :test do
  gem 'capybara'
  gem 'rspec-rails', '~> 8.0.2'
  gem 'rubocop', require: false # https://docs.rubocop.org/rubocop/1.81/index.html
end

group :development do
  gem 'brakeman', require: false
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
end

gem 'sidekiq', '~> 8.0'
