module PageObjects
  class AdminHome < SitePrism::Page
    set_url '/admin'
    element :entry_link, 'body > div > div > div > ul:nth-child(2) > li:nth-child(2) > a'

    def go_to_entry
      entry_link.click
      PageObjects::AdminEntry.new
    end

  end
end