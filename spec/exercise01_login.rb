require_relative './spec_helper'

describe "basic scenario", type: :feature do
  
  context "Given the home section" do
    before :each do
      @login_page = PageObjects::Login.new
      @login_page.load
    end

    it "should login using proper credentials" do
      @home_page = @login_page.login('admin1@gmail.com', 'admin1')

      expect(@home_page.notification).to have_text('Successfully logged in as admin1@gmail.com.')
    end

    it "should show a message in case of invalid user" do
      @home_page = @login_page.login('blah@gmail.com', 'admin1')

      expect(page).to have_text('Invalid email or password.')
    end

  end

end