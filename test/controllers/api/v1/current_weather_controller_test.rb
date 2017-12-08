require 'test_helper'

module Api
  module V1
    class CurrentWeatherControllerTest < ActionDispatch::IntegrationTest
      def test_current_success
        stub_request(:get, "http://api.openweathermap.org/data/2.5/weather?APPID=12345678&q=Cairo,EG&units=metric")
          .to_return(status: 200,
                     body: "{ \"main\": { \"temp\": 16 }, \"cod\": 200, \"name\": \"Cairo\" }",
                     headers: {})

        get '/api/v1/current.json', params: { city: 'Cairo', country: 'EG' }
        assert_response :success
        assert_equal %w[temperature place_name], json_response.keys
      end
    end
  end
end
