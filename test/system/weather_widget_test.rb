require "application_system_test_case"

class WeatherWidgetTest < ApplicationSystemTestCase
  test 'widget exists' do
    visit root_url

    has_css? 'weather-widget'
    assert_selector 'h1', 'Weatherpin'
  end

  test 'get weather' do
    visit root_url

    fill_in 'City', with: 'Cairo'
    fill_in 'Country Code', with: 'Eg'
    click_button 'Get Weather'

    assert_no_text 'h1', 'Weatherpin'
  end

  test 'get random weather' do
    visit root_url

    click_button 'Feeling Lucky?'

    assert_no_text 'h1', 'Weatherpin'
  end
end
