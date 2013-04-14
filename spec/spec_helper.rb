require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'capybara/rspec'
require 'capybara/poltergeist'

Dir.glob(File.dirname(__FILE__) + '/factories/*', &method(:require))

Capybara.javascript_driver = :poltergeist
Capybara.save_and_open_page_path = File.dirname(__FILE__) + '/../snapshots'

# This will ensure we are connecting to a remote server
Capybara.run_server = false

# Set the base URL for all our tests
Capybara.app_host = 'http://www.google.com'

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

#This will including the Capybara DSL in the tests, and not in a global scope
module GoogleTests
	include Capybara::DSL

	def teardown
    Capybara.reset_sessions!    # Forget the (simulated) browser state
    Capybara.use_default_driver # Revert Capybara.current_driver to Capybara.default_driver
  end
end