# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV']      ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'database_cleaner'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include OmniAuthUser

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.infer_spec_type_from_file_location!

  Capybara.register_driver :selenium_firefox do |app|
    Capybara::Selenium::Driver.new(app, :browser => :firefox)
  end
  Capybara.javascript_driver = :selenium_firefox

  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do |example|
    DatabaseCleaner.strategy= example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end
