require 'capybara'
require 'launchy'
require	'test/unit'

class IHomeTest < Test::Unit::TestCase
  include Capybara::DSL
	def debug_page(body)
		`mkdir -p /tmp/ihome`
		file = File.new("/tmp/ihome/#{Time.now.to_i}.html", 'w')
        file.write body
        Launchy.open "file://#{file.path}"
	end
  
  def get_home_page
    Capybara.current_driver = :selenium
		Capybara.app_host = 'http://ihomefinder.com'
  end
  
  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
    `rm -rf /tmp/ihome`
  end
  
end 

__END__
require 'mechanize'
require 'launchy'
require	'test/unit'

class IHomeTest < Test::Unit::TestCase
	def debug_page(body)
		`mkdir -p /tmp/ihome`
		file = File.new("/tmp/ihome/#{Time.now.to_i}.html", 'w')
        file.write body
        Launchy.open "file://#{file.path}"
	end

	def setup
		@agent= Mechanize.new
	end

	def teardown
		`rm -rf /tmp/ihome`
	end

	def get_home_page
		@agent.get('http://ihomefinder.com/')
	end
  
  def get_op_page
    @agent.get('http://59736.ihf-omnipress.com/')
  end

end