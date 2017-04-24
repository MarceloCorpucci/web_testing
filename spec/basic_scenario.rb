require_relative './spec_helper'

describe "basic scenario", type: :feature do
  
  context "Given the home section" do
    before :all do
      visit "http://localhost:5000"
    end
    
    it "should contain a post in the blog" do
      find('#blog').click

      expect(page).to have_text("second entry") 
    end

  end

end