class DashboardPage
  include PageObject

  element(:sign_up_upper_btn, :xpath => '//*[@id="root"]/div/div/div/div[1]/a/button/span[1]')
  element(:sign_up_lower_btn, :xpath => '//*[@id="root"]/div/div/div/form/div[2]/button/span[1]')

  element(:name_field, :css => '#name')
  element(:email_field, :css => '#email')
  element(:password_field, :css => '#password')

  def click_sign_up_upper_btn
    self.sign_up_upper_btn_element.click
  end

  def sign_up(name, email, password)
    self.name_field_element.send_keys(name)
    self.email_field_element.send_keys(email)
    self.password_field_element.send_keys(password)
    self.sign_up_lower_btn_element.click
  end


end
