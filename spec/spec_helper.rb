require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

Capybara.configure do |config|
  config.run_server = false
end

Capybara.default_driver = :selenium
Capybara.javascript_driver = :firefox

Capybara.page.driver.browser.manage.window.maximize

Capybara.default_max_wait_time = 6
