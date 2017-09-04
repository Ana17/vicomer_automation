class QuickLinksPage
  include PageObject

  elements(:rows, :css => '.quick-links tbody tr')
  element(:quick_links_side_button, :css => 'a[data-testid="sidebar-link-quick-links"]')
  element(:action_btn, :css => 'button[data-testid="btn-action-menu"]')
  element(:view_stats_btn, :partial_link_text => 'View stats')

  def click_quick_links
    self.quick_links_side_button_element.click
  end

  def get_last_row_url_quick_links
    sleep 2
    last_row = rows_elements.first
    last_row.element[-9].text
  end

  def click_action_btn
    self.action_btn_element.click
  end

  def click_view_stats
    self.view_stats_btn_element.click
  end

end
