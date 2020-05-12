source 'https://rubygems.org'
git_source(:github) { |repo| 'https://github.com/#{repo}.git' }

ruby '2.6.5'

gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.2'

gem 'bootstrap_form', '~> 4.0'
gem 'jbuilder', '~> 2.7'
gem 'rails-i18n', '~> 6.0.0'
gem 'sass-rails', '>= 6'
gem 'twitter-bootstrap-rails'
gem 'webpacker', '~> 4.0'

gem 'activeadmin'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise'

gem 'phonelib'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'database_cleaner'
  gem 'factory_bot'
  gem 'factory_bot_rails'
  gem 'faker'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'

  gem 'rspec'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end
