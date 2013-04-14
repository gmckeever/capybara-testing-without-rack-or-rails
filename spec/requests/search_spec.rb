require File.dirname(__FILE__) + '/../spec_helper'

describe "The Google Page", :js => true do
	include GoogleTests

  it "loads" do
    visit('/')
  end
end