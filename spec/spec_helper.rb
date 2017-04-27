require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'

Capybara.register_driver :selenium do |app|
  Selenium::WebDriver::Chrome.driver_path = 'C:\ChromeDriver\chromedriver.exe'
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.configure do |config|
  config.run_server = false
end

Capybara.default_driver = :selenium
Capybara.javascript_driver = :chrome

Capybara.page.driver.browser.manage.window.maximize

Capybara.default_max_wait_time = 6
