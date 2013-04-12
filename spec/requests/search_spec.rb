require File.dirname(__FILE__) + '/../spec_helper'

describe "The iHomefinder Site", :js => true do
	include IhomefinderTests

  it "signs me into the control panel" do
    visit('/')
    first(:link, 'Client Login').click
    fill_in('Username', :with=>ENV['IHOME_USER'])
    fill_in('Password', :with=>ENV['IHOME_PASSWORD'])
    fill_in('ClientID', :with=>ENV['IHOME_CLIENT_ID'])
    click_button('Enter')
    page.should have_content('WELCOME TO YOUR CONTROL PANEL')
  end
end