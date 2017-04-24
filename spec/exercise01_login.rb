require_relative './spec_helper'

describe "basic scenario", type: :feature do
  
  context "Given the home section" do
    before :each do
      visit "http://localhost:5000/login"
    end

    #Example, in this case is before :all
    it "should login using proper credentials" do
      fill_in 'email', with: 'admin1@gmail.com'
      fill_in 'password', with: 'admin1'
      find_by_id('btn-submit').click

      expect(page).to have_text('Successfully logged in as admin1@gmail.com.')
    end

    #Exercise 1 - solution
    it "should show a message in case of invalid user" do
      fill_in 'email', with: 'blah@gmail.com'
      fill_in 'password', with: 'admin1'
      find_by_id('btn-submit').click

      expect(page).to have_text('Invalid email or password.')
    end

  end

end