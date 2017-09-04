class LiveviewPage
  include PageObject

  elements(:rows, :css => 'tr.liveview-row')
  element(:clicks_tab, :css => 'div[data-testid="top-nav-tabs-title-clicks"]')

  def switch_tab_to_clicks
    self.clicks_tab_element.click
  end

  def get_last_row_url_links
    sleep 2
    last_row = rows_elements.first
    last_row.element[-1].text
  end

  def get_last_row_clicks_url
    sleep 2
    last_row = rows_elements.first
    last_row.element[-2].text
  end

  def get_last_row_OS
    sleep 2
    last_row = rows_elements.first
    last_row.element[-3].text
  end

end
