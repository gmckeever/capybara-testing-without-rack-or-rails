require 'rubygems'
require 'bundler/setup'
#require 'ruby-debug'
require 'rspec'
require 'capybara/rspec'

Dir.glob(File.dirname(__FILE__) + '/factories/*', &method(:require))

# Capybara configuration
Capybara.default_driver = :selenium
Capybara.save_and_open_page_path = File.dirname(__FILE__) + '/../snapshots'

# We will not run our own server; we will connect to a remote server
Capybara.run_server = false

# Set the base URL for all our tests
Capybara.app_host = 'http://www.ihomefinder.com'

# RSpec configuration
RSpec.configure do |config|
  config.before(:all) do
    # Create fixtures
  end
  config.after(:all) do
    # Destroy fixtures
  end
  config.around(:each) do |example|
    begin
      example.run
    rescue Exception => ex
      save_and_open_page
      raise ex
    end
  end
end

module IhomefinderTests
	include Capybara::DSL

	def teardown
    Capybara.reset_sessions!    # Forget the (simulated) browser state
    Capybara.use_default_driver # Revert Capybara.current_driver to Capybara.default_driver
  end
end