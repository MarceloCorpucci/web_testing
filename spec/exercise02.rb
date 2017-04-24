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
      visit "http://localhost:5000/admin"
      find('body > div > div.navbar > div > ul:nth-child(2) > li:nth-child(2) > a').click
      
      page.all('body > div > table > tbody').each do |tr|
        if tr.has_text?('this is my post') 
        	tr.all('td')[1].click_button('Delete record')
        end
      end
    end

  end

end