#ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
#require 'rails/test_help'
#
#class ActiveSupport::TestCase
#  ActiveRecord::Migration.check_pending!
#
#  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
#  #
#  # Note: You'll currently still have to declare fixtures explicitly in integration tests
#  # -- they do not yet inherit this setting
#  fixtures :all
#
#  # Add more helper methods to be used by all tests here...
#end

require 'minitest/autorun'
require 'minitest/spec'

require 'capybara/rails'
# TODO: Including in the global scope is not recommended!
include Capybara::DSL

def create_a_new_conference_named(name)
  # Here we want to actually drive our application with capybara, so that it
  # *does* what's stated in the function name.
  # We first need to make capybara available to our test suite.
  visit '/'
  within('#new_conference_form') do
    fill_in 'name', :with => name
    click_on 'create_conference_button'
  end
end

def page_must_show_a_conference_named(name)
  page.must_have_content name
end
