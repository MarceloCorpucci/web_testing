require_relative './spec_helper'

describe "create a new entry in draft mode", type: :feature do

  context "Given I'm logged into the blog" do
    before :each do
      visit "http://localhost:5000/login"
      fill_in 'email', with: 'admin1@gmail.com'
      fill_in 'password', with: 'admin1'
      find_by_id('btn-submit').click
      find('#create_post > a').click
    end

    it "should be able to add a new entry with draft state" do
      fill_in 'title', with: 'this is my post'
      fill_in 'body', with: 'this is the post content. See u!'
      select 'Draft', from: 'status'
      find('#post').click

      page.should have_content("Entry 'this is my post' created successfully.")

      find('#blog > a').click

      page.all('content_title').each do |p|
        expect(page).to have_link('/entries/this-is-my-post/') if p.has_text?('this is my post')
      end
    end

    it "should be able to see the post in the admin site" do
      fill_in 'title', with: 'this is my post'
      fill_in 'body', with: 'this is the post content. See u!'
      select 'Draft', from: 'status'
      find('#post').click

      page.should have_content("Entry 'this is my post' created successfully.")

      visit "http://localhost:5000/admin/entry"

      expect(page).to have_css('td', :text => 'this is my post')
      expect(page).to have_css('td', :text => 'Draft')
    end

    after :each do
      visit "http://localhost:5000/admin/entry"
      find('body > div > table > thead > tr > th.column-header.col-created_timestamp > a').click
      find('body > div > table > thead > tr > th.column-header.col-created_timestamp > a').click
      find('body > div > table > tbody > tr:nth-child(1) > td.list-buttons-column > form > button > i').click
      page.driver.browser.switch_to.alert.accept
    end
  
  end

  context "Given I'm logged into the app" do
    before :each do
      visit "http://localhost:5000/login"
      fill_in 'email', with: 'admin1@gmail.com'
      fill_in 'password', with: 'admin1'
      find_by_id('btn-submit').click
      find('#create_post > a').click
    end

    it "should not be visible for the rest of the users" do
      fill_in 'title', with: 'this is another post'
      fill_in 'body', with: 'this is the post content. See u!'
      select 'Draft', from: 'status'
      find('#post').click

      page.should have_content("Entry 'this is another post' created successfully.")

      find('#logout > a').click
      page.should have_content("You have been logged out.")
      
      find('#login > a').click
      fill_in 'email', with: 'admin2@gmail.com'
      fill_in 'password', with: 'admin2'
      find_by_id('btn-submit').click
       
      find('#blog > a').click

      expect(page).not_to have_text('this is another post')
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