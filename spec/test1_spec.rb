require 'spec_helper'

describe 'Vicomer' do
  it 'Tralala' do

    random_num = (0...5).map { ('0'..'9').to_a[rand(10)] }.join

    landing_page = visit LandingPage
    # binding.pry
    WaitUtil.wait_for_condition("get started button shows up", timeout_sec: 40, delay_sec: 7, verbose: true) do
      landing_page.get_started_btn_element.visible?
    end
    landing_page.click_get_started


    dashboard_page = on DashboardPage
    dashboard_page.click_sign_up_upper_btn # doesn't get clicked - why?
    dashboard_page.sign_up("automation_name_#{random_num}", "automation_email_#{random_num}@gmail.com", 'automation_password')

    sleep 10

    # check if API link shows up in live view-links tab
    # dashboard.click_liveview
    # live_view_page = on LiveviewPage
    # ui_link = ""

    # WaitUtil.wait_for_condition("live view-links LINK to show up", timeout_sec: 40, delay_sec: 3, verbose: true) do
    #   @browser.navigate.refresh
    #   ui_link = live_view_page.get_last_row_url_links
    #   api_link.include?(ui_link)
    # end
    # puts "API URL: #{api_link}"
    # puts "UI URL FROM LIVE VIEW LINKS : #{ui_link}"
    # puts 'LINKS MATCHED, YAY!'
    #
    # # click on link using android user agent
    # puts 'CLICKING ON LINK USING ANROID USER AGENT...'
    # link_client = LinkClient.new
    # response = link_client.click_link(api_link)
    # puts "HTTP STATUS CODE: #{response.code}"
    #
    # # check if click entry is on liveview-clicks tab w Android OS
    # live_view_page.switch_tab_to_clicks
    #
    # WaitUtil.wait_for_condition("live view- clicks OS & CLICK to show up", timeout_sec: 40, delay_sec: 3, verbose: true) do
    #   @browser.navigate.refresh
    #   clicks_page_url = live_view_page.get_last_row_clicks_url
    #   clicks_page_url.include?(api_link)
    #
    #   click_OS = live_view_page.get_last_row_OS
    #   click_OS == 'Android'
    # end
    # puts 'LIVE VIEW CLICKS PAGE CONFIRMED OS=ANDROID & CLICK'
    #
    # # go to quick links & check if link is there
    # quick_links_page = on QuickLinksPage
    # quick_links_page.click_quick_links
    # quick_links_url = quick_links_page.get_last_row_url_quick_links
    #
    # puts "QUICK LINKS URL #{quick_links_url}"
    # expect(quick_links_url).to include api_link
    #
    # # check if link stats are correct
    # quick_links_page.click_action_btn
    # quick_links_page.click_view_stats
    #
    # link_stats_page = on LinkStatsPage
    #
    # WaitUtil.wait_for_condition("link stats # of clicks to show up", timeout_sec: 40, delay_sec: 3, verbose: true) do
    #   @browser.navigate.refresh
    #   clicks_num = link_stats_page.num_of_clicks.to_i
    #   clicks_num == 1
    # end
    #
    # puts 'ANDROID CLICKS NUM = 1 SO YAY'

  end
end
