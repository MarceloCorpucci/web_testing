require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'site_prism'
require_relative '../common/all_page_objects'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :selenium
  config.app_host = 'http://localhost:5000'
end

Capybara.page.driver.browser.manage.window.maximize

SitePrism.configure do |config|
  config.use_implicit_waits = true
end
