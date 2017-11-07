source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'
gem 'figaro'
gem 'faraday'
gem 'travis'
gem 'brakeman'
gem 'database_cleaner'
gem 'jquery-rails'
gem 'will_paginate'
gem 'faker'
gem 'shoulda-matchers', '~> 3.1'
gem 'simplecov'
gem "factory_bot_rails", "~> 4.0"
gem "rake", '~> 12.2.1'
gem 'bootstrap-will_paginate'
gem 'stripe'
gem 'groupdate'
gem 'chartkick'
gem 'chart-js-rails'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy'
end

group :development do
  gem 'newrelic_rpm', '4.0.0.332'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
