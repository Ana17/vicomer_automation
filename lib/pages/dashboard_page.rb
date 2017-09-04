class DashboardPage
  include PageObject

  element(:liveview_button, :css => 'a[data-testid="sidebar-link-liveview"]')

  def click_liveview
    self.liveview_button_element.click
  end

end
