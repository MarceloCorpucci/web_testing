module PageObjects
  class Home < SitePrism::Page
    element :notification, 'div#notification'
    element :create_a_post_link, '#create_post > a'

    def go_to_create_post
      create_a_post_link.click
      PageObjects::EntryCreation.new
    end

  end
end