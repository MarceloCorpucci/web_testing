module PageObjects
  class EntryCreation < SitePrism::Page
    set_url '/entries/create/'

    element :notification, 'div#notification'
    element :title, 'input#title'
    element :body, 'textarea#body'
    element :post_button, 'button#post'

    def create
      title.set 'this is my post'
      body.set 'this is the post content. See u!'
      post_button.click
    end

  end
end