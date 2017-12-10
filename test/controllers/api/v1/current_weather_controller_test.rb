require 'test_helper'

module Api
  module V1
    class CurrentWeatherControllerTest < ActionDispatch::IntegrationTest
      def setup
        @appid = Rails.application.secrets.openweathermap
      end

      def test_by_city_success
        stub_request(:get,
                     "http://api.openweathermap.org/data/2.5/weather?APPID=#{@appid}&q=Cairo,EG&units=metric")
          .to_return(status: 200,
                     body: "{ \"main\": { \"temp\": 16 }, \"cod\": 200, \"name\": \"Cairo\" }",
                     headers: {})

        get '/api/v1/current/by_city.json', params: { city: 'Cairo', country: 'EG' }
        assert_response :success
        assert_equal %w[temperature place_name], json_response.keys
      end

      def test_by_coord_success
        stub_request(:get, "http://api.openweathermap.org/data/2.5/weather?APPID=#{@appid}&lat=3.33&lon=3&units=metric")
          .to_return(status: 200,
                     body: "{ \"main\": { \"temp\": 16 }, \"cod\": 200, \"name\": \"Cairo\" }",
                     headers: {})

        get '/api/v1/current/by_coord.json', params: { lat: 3.33, lon: 3 }
        assert_response :success
        assert_equal %w[temperature place_name], json_response.keys
      end
    end
  end
end
