require_relative './spec_helper'

describe "create a new entry using tags", type: :feature do

  context "Given I've created an entry including a tag" do
    before :each do
      visit "http://localhost:5000/login"
      fill_in 'email', with: 'admin1@gmail.com'
      fill_in 'password', with: 'admin1'
      find_by_id('btn-submit').click
      find('#create_post > a').click

      fill_in 'title', with: 'this is my post'
      fill_in 'body', with: 'this is the post content. See u!'
      fill_in 'tags', with: 'mytag'
      find('#post').click

      page.should have_content("Entry 'this is my post' created successfully.")
    end

    it "should be able to show the tag when the entry is listed" do
      find('#blog > a').click
      page.all('a', :text => 'this is my post')[0].click
      
      expect(page).to have_link('mytag', :href => '/entries/tags/mytag/')
    end

    it "should be able to show the tag in the tag section" do
      find('#tags > a').click
      
      expect(page).to have_link('mytag', :href => '/entries/tags/mytag/')
    end

    it "should be able to show a tagged entry if its tag is selected" do
      find('#tags > a').click
      page.all('a', :text => 'mytag')[0].click
      
      expect(page).to have_link('this is my post', :href => '/entries/this-is-my-post/')
    end

    it "should be able to show the list of available tags in the admin site" do
      visit "http://localhost:5000/admin/tag"
      expect(page).to have_text('mytag')
    end

    it "should be able to show the entry tag in the admin site" do
      visit "http://localhost:5000/admin/entry"
      expect(page).to have_css('td', :text => 'this is my post')
      expect(page).to have_css('td', :text => 'mytag')
    end    

    after :each do
      visit "http://localhost:5000/admin/entry"
      find('body > div > table > thead > tr > th.column-header.col-created_timestamp > a').click
      find('body > div > table > thead > tr > th.column-header.col-created_timestamp > a').click
      find('body > div > table > tbody > tr:nth-child(1) > td.list-buttons-column > form > button > i').click
      page.driver.browser.switch_to.alert.accept

      find('body > div > div.navbar > div > ul:nth-child(2) > li:nth-child(3) > a').click
      find('body > div > table > tbody > tr > td.list-buttons-column > form > button > i').click
      page.driver.browser.switch_to.alert.accept
    end

  end
end