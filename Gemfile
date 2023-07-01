# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |_repo| "https://github.com/#{repo}.git" }

ruby File.read('.tool-versions').split("\n").find { |x| x.include? 'ruby' }.split(' ').last

gem 'bootsnap', require: false
gem 'cssbundling-rails'
gem 'jsbundling-rails'
gem 'pg', '~> 1.1'
gem 'propshaft'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.4'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 6.0.0'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'devise', '~> 4.9'

gem 'factory_bot', '~> 6.2'

gem 'factory_bot_rails', '~> 6.2'

gem 'rubocop', '~> 1.53'

gem 'faker', '~> 3.2'

gem 'pry-rails', '~> 0.3.9'

gem 'static_association', '~> 0.1.0'
