ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/pride"

class ActiveSupport::TestCase
    ActiveRecord::Migration.check_pending!

    # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  # fixtures :all

  def create_user(options = {})
    default_options = { full_name: "Jorghay" }
    User.create!(default_options.merge(options))
  end

  def create_group(options = {})
    default_options = { name: "Turing 1408" }
    Group.create!(default_options.merge(options))
  end

  # Add more helper methods to be used by all tests here...
end
