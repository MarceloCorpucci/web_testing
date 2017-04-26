module PageObjects
  class Login < SitePrism::Page
    set_url '/login'
    element :user_login, 'input#email'
    element :user_password, 'input#password'
    element :submit, 'button#btn-submit'

    def login(user, pass)
      user_login.set(user)
      user_password.set(pass)
      submit.click

      PageObjects::Home.new
    end
  
  end
end
