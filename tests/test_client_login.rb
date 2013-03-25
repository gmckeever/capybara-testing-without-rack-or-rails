require './tests/helper.rb'

class TestClientLogin < IHomeTest

	def test_can_login
		home_page = get_home_page
		login_page = home_page.links.find {|l| l.text == 'Client Login'}.click
		login_form = login_page.forms.first
		login_form['Username']=ENV['IHOME_USER']
		login_form['Password']=ENV['IHOME_PASSWORD']
		login_form['ClientID']=ENV['IHOME_CLIENT_ID']
		redirect_page = login_form.submit
		passed = redirect_page.search("b.headline").any? {|elt| elt.text == 'WELCOME TO YOUR CONTROL PANEL'}
		debug_page(redirect_page.body) if !passed
		assert(passed, "Unable to login.")
	end

	def test_whatever
	end


end

