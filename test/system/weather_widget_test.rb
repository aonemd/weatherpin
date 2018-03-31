require "application_system_test_case"

class WeatherWidgetTest < ApplicationSystemTestCase
  test 'widget exists' do
    visit weather_show_path

    has_css? 'weather-widget'
    assert_selector 'h1', 'Weatherpin'
  end

  test 'get weather' do
    visit weather_show_path

    fill_in 'City', with: 'Cairo'
    fill_in 'Country Code', with: 'Eg'
    click_button 'Get Weather'

    assert_no_text 'h1', 'Weatherpin'
    assert_selector 'small', text: 'Cairo'
  end

  test 'get random weather' do
    visit weather_show_path

    click_button 'Feeling Lucky?'

    assert_no_text 'h1', 'Weatherpin'
  end
end
