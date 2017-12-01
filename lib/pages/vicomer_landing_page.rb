
class VicomerLandingPage
  include PageObject
  page_url 'http://www.vicomer.com/'

  # text_field(:email, :css => 'input[name="email"]')
  # text_field(:password, :css => 'input[name="password"]')
  element(:get_started_btn, :css => '#main_content > div > div > div.cta_button_area > div > a')

  def click_get_started
    sleep 5
    self.get_started_btn_element.click
  end

end
