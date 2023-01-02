source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.7'
gem 'bootstrap', '~> 5.2.2'
gem 'stimulus-rails'
gem 'pagy'
gem 'ransack', github: 'activerecord-hackery/ransack', branch: 'main'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4'
gem 'pg' , '~> 1.4.5'

# Use Puma as the app server
gem 'puma', '~> 5.0'
gem 'rolify'
gem 'devise'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
gem 'image_processing', '~>1.9.3'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '~> 4.2'
  gem 'rack-mini-profiler', '~> 3.0'
  gem 'listen', '~> 3.7'
  gem 'spring'
  gem 'rubocop', '~> 1.23', require: false
  gem 'brakeman', require: false
  gem 'letter_opener'
  gem 'annotate'
  gem 'bullet'
end

group :development, :test do
  gem 'byebug'
  gem 'pry-rails'
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 5.1', '>= 5.1.2'
  gem 'factory_bot_rails'
  gem 'faker'
end

group :test do
  gem 'simplecov', '~> 0.17.1', require: false
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'shoulda-matchers'
  gem 'rails-controller-testing'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'pundit', '~> 2.3'
