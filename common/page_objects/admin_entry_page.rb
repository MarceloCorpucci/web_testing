module PageObjects
  class AdminEntry < SitePrism::Page
  	element :creation_date_header, 'body > div > table > thead > tr > th.column-header.col-created_timestamp > a'
    element :delete_icon, 'body > div > table > tbody > tr:nth-child(1) > td.list-buttons-column > form > button > i'

    def delete_most_recent_one
      creation_date_header.click
      creation_date_header.click
      delete_icon.click
      
      page.driver.browser.switch_to.alert.accept
    end

  end
end