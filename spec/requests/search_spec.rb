require File.dirname(__FILE__) + '/../spec_helper'

describe "The iHomefinder Site", :js => true do
	include IhomefinderTests

  it "should sign me in" do
    visit('/')
    #click_on('Client Login')
    find('#menu-item-47').click
  end
end