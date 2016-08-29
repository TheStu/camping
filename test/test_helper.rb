ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/rails/capybara"
require 'minitest/reporters'
# require 'webmock/minitest'

# WebMock.allow_net_connect!

Capybara.javascript_driver = :webkit
reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

Capybara::Webkit.configure do |config|
  config.block_unknown_urls
  #config.allow_url("*.stripe.com/*")
end

#Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end