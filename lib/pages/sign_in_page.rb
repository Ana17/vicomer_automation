
class SignInPage
  include PageObject
  page_url 'https://dashboard.branch.io/login'

  text_field(:email, :css => 'input[name="email"]')
  text_field(:password, :css => 'input[name="password"]')
  button(:login_btn, :css => 'button[data-testid="btn-sign-in"]')

  def login(email, password)
    self.email_element.send_keys(email)
    self.password_element.send_keys(password)
    self.login_btn_element.click
  end

end
