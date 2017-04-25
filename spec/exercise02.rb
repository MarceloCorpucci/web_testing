require_relative './spec_helper'

describe "create a new entry", type: :feature do

  context "Given I'm logged into the blog" do
    before :each do
      @login_page = PageObjects::Login.new
      @login_page.load
      @home_page = @login_page.login('admin1@gmail.com', 'admin1')
      @entry_creation_page = @home_page.go_to_create_post
    end

    it "should be able to add a new entry in the blog section" do
      @entry_creation_page.create
      expect(@entry_creation_page.notification).to have_text("Entry 'this is my post' created successfully.")
    end

    after :each do
      @admin_home_page = PageObjects::AdminHome.new
      @admin_home_page.load
      @admin_entry_page = @admin_home_page.go_to_entry
      @admin_entry_page.delete_most_recent_one
    end

  end

end