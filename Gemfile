source "https://rubygems.org"

gem "redcarpet"
gem "rake","11.1.2"
gem "rails", "4.2.6"
gem "pg"
gem "sass-rails", "~> 5.0"
gem "foundation-rails"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.1.0"
gem "jquery-rails"
gem "jbuilder", "~> 2.0"
gem "sdoc", "~> 0.4.0", group: :doc
gem "bcrypt", "~> 3.1.7"
gem "rack", "1.6.4"

group :development, :test do
  gem "byebug"
end

group :development do
  gem "spring"
end

group :development, :test do
  gem "pry-rails"
  gem "rspec-rails"
end

group :test do
  gem "coveralls", require: false
  gem "factory_girl_rails"
  gem "capybara"
  gem "launchy"
  gem "valid_attribute"
  gem "shoulda-matchers"
end

group :production do
  gem "puma"
  gem "rails_12factor"
end
