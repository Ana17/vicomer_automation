
class LandingPage
  include PageObject
  page_url 'http://www.vicomer.com/'

  element(:get_started_btn, :xpath => '//*[@id="main_content"]/div/div/div[1]/div/a')

  def click_get_started
    sleep 5
    self.get_started_btn_element.click
  end

end
