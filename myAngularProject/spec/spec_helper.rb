
# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require_relative 'support/controllers_helpers'
require 'devise'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rails'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.include ControllerHelpers, type: :controller
  Warden.test_mode!

  config.include FactoryGirl::Syntax::Methods
  config.include Devise::TestHelpers, type: :controller
  config.include Warden::Test::Helpers

  config.after do
    Warden.test_reset!
  end

  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation
    DatabaseCleaner.clean_with :transaction
  end

  config.after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  config.around(:each, type: :feature, js: true) do |ex|
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
    self.use_transactional_fixtures = false
    ex.run
    self.use_transactional_fixtures = true
    DatabaseCleaner.clean
  end

  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
end