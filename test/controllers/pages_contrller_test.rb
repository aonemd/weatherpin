require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get weatjer" do
    get pages_weather_url
    assert_response :success
  end
end
