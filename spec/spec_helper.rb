# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)

ActionMailer::Base.delivery_method = :test
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.default_url_options[:host] = "test.com"

Rails.backtrace_cleaner.remove_silencers!

# Configure capybara for integration testing
require "capybara/rspec"
require 'capybara/rails'

Capybara.default_driver   = :rack_test
Capybara.default_selector = :css

require 'rspec/rails'

require 'mongoid'
require 'database_cleaner'
require 'fabrication'
require 'faker'

RSpec.configure do |config|
  
  config.include Rails.application.routes.url_helpers

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end
  
  config.before(:each) do
    DatabaseCleaner.start
  end
  
  config.after(:each) do
    DatabaseCleaner.clean
  end
end

Fabrication.configure do |config|
  config.path_prefix = Tabloids::Engine.root
end