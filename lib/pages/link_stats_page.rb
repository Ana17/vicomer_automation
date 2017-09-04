class LinkStatsPage
  include PageObject

  element(:android_click_stats, :css => '#android-click-flow tbody tr:nth-child(3) td')

  def num_of_clicks
    return android_click_stats
  end
  
end
