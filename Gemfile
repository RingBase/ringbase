source 'https://rubygems.org'

ruby '2.1.0'

gem 'rails', '4.0.0'

gem 'pg'

gem 'therubyracer', platforms: :ruby

gem 'bcrypt-ruby', '~> 3.0.0'

group :assets do
  gem 'jquery-rails'
  gem 'sass-rails', '~> 4.0.0'
  gem 'uglifier', '>= 1.3.0'
  gem 'coffee-rails', '~> 4.0.0'
end

group :development, :test do
  gem 'sqlite3'

  gem 'letter_opener'    # Preview emails in browser instead of sending
  gem 'launchy', '2.3.0' # Open browser to show rendering

  gem 'better_errors'
  gem 'binding_of_caller'

end

group :test do
  gem 'guard-rspec', '~> 4.2.5'
  gem 'rspec-rails', '~> 2.14.1'
  gem 'factory_girl_rails', '~> 4.3.0'
  gem 'faker', '~> 1.2.0'
  gem 'database_cleaner', '~> 1.2.0' # Clear data for each spec run
  gem 'coveralls', '~> 0.7.0', require: false
end
