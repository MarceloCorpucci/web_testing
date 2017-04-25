require_relative './spec_helper'

describe "create a new entry", type: :feature do

  context "Given I'm logged into the blog" do
    before :each do
      visit "http://localhost:5000/login"
      fill_in 'email', with: 'admin1@gmail.com'
      fill_in 'password', with: 'admin1'
      find_by_id('btn-submit').click
      find('#create_post > a').click
    end

    it "should be able to add a new entry in the blog section" do
      fill_in 'title', with: 'this is my post'
      fill_in 'body', with: 'this is the post content. See u!'
      find('#post').click

      expect(page).to have_text("Entry 'this is my post' created successfully.")
    end

    after :each do
      visit "http://localhost:5000/admin/entry"
      find('body > div > table > thead > tr > th.column-header.col-created_timestamp > a').click
      find('body > div > table > thead > tr > th.column-header.col-created_timestamp > a').click
      find('body > div > table > tbody > tr:nth-child(1) > td.list-buttons-column > form > button > i').click
      page.driver.browser.switch_to.alert.accept
    end

  end

end