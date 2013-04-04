begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara-webkit'
require 'launchy'
Capybara.default_driver = :webkit
Capybara.app_host = 'http://www.google.com'
World(Capybara)

def debug_page(body)
		`mkdir -p /tmp/ihome`
		file = File.new("/tmp/ihome/#{Time.now.to_i}.html", 'w')
        file.write body
        Launchy.open "file://#{file.path}"
end

def teardown
		`rm -rf /tmp/ihome`
end