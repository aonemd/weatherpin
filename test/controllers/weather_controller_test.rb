require 'test_helper'

class WeatherControllerTest < ActionDispatch::IntegrationTest
  def test_current_success
    stub_request(:get, "http://api.openweathermap.org/data/2.5/weather?APPID=12345678&q=Cairo,EG&units=metric")
      .to_return(status: 200, body: "{ \"main\": { \"temp\": 16 }, \"cod\": 200, \"name\": \"Cairo\" }", headers: {})

    get '/current.json', params: { city: 'Cairo', country: 'EG' }
    assert_response :success
    assert_equal %w[temperature place_name], json_response.keys
  end
end
