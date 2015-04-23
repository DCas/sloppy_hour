source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass'
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass'
gem 'font-awesome-sass'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use RABL for convenient JSON API building
gem 'rabl'
# Use OJ as JSON parser with RABL
gem 'oj'

# Use Redis for caching
gem 'redis-namespace'
gem 'redis-rails'

# Use Figaro for secure app configuration
gem 'figaro'

# Use Seed Dump for generating seeds.rb from data in db
gem 'seed_dump'

# SimpleForm for form templating
gem 'simple_form'

#devise for authentication
gem 'devise'

# Use Geocoder for geocoding model objects, requests, etc.
gem 'geocoder'
# Use Google Places API for Geocoder geolocation searches
gem 'google_places'
# Use Chronic for convenient date parsing
gem 'chronic'
# Use IceCube for managing recurrence rules
gem 'ice_cube'
# Use Schedulable for generating/caching event occurrences
gem 'schedulable'
# Use ActsAsTaggableOn for contextualized object tagging
gem 'acts-as-taggable-on', '~> 3.4'

group :test do
  gem 'shoulda-matchers', require: false
end

group :development do
  # Use Guard/Guard plugins to handle events on file system changes
  gem 'guard'
  gem "rack-livereload"
  gem 'guard-livereload', '~> 2.4', require: false
  # Use Quiet Assets to disable asset pipeline logging in development
  gem 'quiet_assets'
  # Use Annotate to generate useful annotation comments
  gem 'annotate', '~> 2.6.6'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Use AwesomePrint for pretty printing
  gem 'awesome_print'
  # Use RSpec for testing
  gem 'rspec-rails'
  # Use Capybara for integration testing
  gem 'capybara'
  # Use FactoryGirl for generating test data
  gem 'factory_girl_rails'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Use Pry for debugging goodness
  gem 'pry-rails'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  # Use Rails12Factor to enable certain heroku integration features
  gem 'rails_12factor'
end

# Specify Ruby version here for Heroku
ruby "2.2.2"