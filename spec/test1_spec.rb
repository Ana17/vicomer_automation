require 'spec_helper'

describe 'Branch Home Challenge:' do

  it 'Create marketing link thru API & check on UI if it shows up & click on the link
  thru API & check if click shows up' do

    random_link_name = (0...5).map { ('a'..'z').to_a[rand(26)] }.join

    # create marketing link thru API
    link_client = LinkClient.new
    api_link = link_client.create_marketing_link(random_link_name)

    # sign in & go to dashboard
    sign_in_page = visit SignInPage
    sign_in_page.login('nasyrova.ana@gmail.com', 'BranchTest123')

    dashboard = on DashboardPage

    # check if API link shows up in live view-links tab
    dashboard.click_liveview
    live_view_page = on LiveviewPage
    ui_link = ""

    WaitUtil.wait_for_condition("live view-links LINK to show up", timeout_sec: 40, delay_sec: 3, verbose: true) do
      @browser.navigate.refresh
      ui_link = live_view_page.get_last_row_url_links
      api_link.include?(ui_link)
    end
    puts "API URL: #{api_link}"
    puts "UI URL FROM LIVE VIEW LINKS : #{ui_link}"
    puts 'LINKS MATCHED, YAY!'

    # click on link using android user agent
    puts 'CLICKING ON LINK USING ANROID USER AGENT...'
    link_client = LinkClient.new
    response = link_client.click_link(api_link)
    puts "HTTP STATUS CODE: #{response.code}"

    # check if click entry is on liveview-clicks tab w Android OS
    live_view_page.switch_tab_to_clicks

    WaitUtil.wait_for_condition("live view- clicks OS & CLICK to show up", timeout_sec: 40, delay_sec: 3, verbose: true) do
      @browser.navigate.refresh
      clicks_page_url = live_view_page.get_last_row_clicks_url
      clicks_page_url.include?(api_link)

      click_OS = live_view_page.get_last_row_OS
      click_OS == 'Android'
    end
    puts 'LIVE VIEW CLICKS PAGE CONFIRMED OS=ANDROID & CLICK'

    # go to quick links & check if link is there
    quick_links_page = on QuickLinksPage
    quick_links_page.click_quick_links
    quick_links_url = quick_links_page.get_last_row_url_quick_links

    puts "QUICK LINKS URL #{quick_links_url}"
    expect(quick_links_url).to include api_link

    # check if link stats are correct
    quick_links_page.click_action_btn
    quick_links_page.click_view_stats

    link_stats_page = on LinkStatsPage

    WaitUtil.wait_for_condition("link stats # of clicks to show up", timeout_sec: 40, delay_sec: 3, verbose: true) do
      @browser.navigate.refresh
      clicks_num = link_stats_page.num_of_clicks.to_i
      clicks_num == 1
    end

    puts 'ANDROID CLICKS NUM = 1 SO YAY'

  end
end
