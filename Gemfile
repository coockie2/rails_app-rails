source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem "rails", "8.0.2"

gem "mysql2", ">= 0.5.5"

gem "puma"

# Run against this stable release
group :development, :test do
  gem "rspec-rails", "~> 7.1.1"
  gem "standard"
end

group :test do
  gem "factory_bot_rails"
  gem "database_cleaner"
end
