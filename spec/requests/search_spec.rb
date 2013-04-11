require File.dirname(__FILE__) + '/../spec_helper'

describe "The iHomefinder Site", :js => true do
  it "should sign me in" do
    visit('/')
    click_link('Client Login')
  end
end