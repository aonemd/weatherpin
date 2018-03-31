require "application_system_test_case"

class WelcomeTest < ApplicationSystemTestCase
  test 'visit the homepage' do
    visit root_path

    assert_selector 'h1', text: 'Weatherpin'
  end
end
