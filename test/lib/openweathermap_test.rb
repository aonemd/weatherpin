require 'test_helper'
require 'openweathermap'

module OpenWeatherMap
  module Client
    class CurrentTest < ActiveSupport::TestCase
      def setup
        @success_body = "{ \"main\": { \"temp\": 16 }, \"cod\": 200 }"

        @failure_body = <<-EOF
          {
          \"cod\":401,
          \"message\": \"Invalid API key. Please see http://openweathermap.org/faq#error401 for more info.\"
          }
        EOF
      end

      def test_successfull_call
        stub_request(:get, "http://api.openweathermap.org/data/2.5/weather?APPID=123&units=metric")
          .to_return(status: 200, body: @success_body, headers: {})

        client = OpenWeatherMap::Client::Current.new(appid: '123').call

        assert_equal JSON.parse(@success_body), client.body
        assert_equal 200, client.status
        assert_equal true, client.successful?
        assert_nil client.message
      end

      def test_failed_call
        stub_request(:get, "http://api.openweathermap.org/data/2.5/weather?APPID=123&units=metric")
          .to_return(status: 401, body: @failure_body, headers: {})

        client = OpenWeatherMap::Client::Current.new(appid: '123').call

        assert_equal JSON.parse(@failure_body), client.body
        assert_equal 401, client.status
        assert_equal false, client.successful?
        assert_not_nil client.message
      end
    end
  end
end
