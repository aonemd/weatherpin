require 'httpclient'

module OpenWeatherMap
  BASE_URL = 'http://api.openweathermap.org/data/2.5/'.freeze

  module Client
    class Client
      attr_reader :body, :status, :message

      def initialize(appid:, units: :metric)
        @appid = appid
        @units = units
      end

      def call(params: {})
        ::Rails.logger.info "\nCalling Openweathermap API..\n"
        res = HTTPClient.get url, params.merge(APPID: @appid, units: @units)
        parse_respone(res.body)
        self
      end

      def successful?
        @status == 200
      end

      def failed?
        !successful?
      end

      private

      def parse_respone(response)
        @body    = JSON.parse(response)
        @status  = @body.fetch('cod', 404)
        @message = @body.fetch('message', nil)
      end

      protected

      def url
        @url ||= OpenWeatherMap::BASE_URL
      end
    end

    class Current < Client
      URL = (OpenWeatherMap::BASE_URL + 'weather?').freeze

      def city(city:, country: nil)
        params = { q: [city, country].compact.join(',') }
        call(params: params)
      end

      def geocode(lat:, lon:)
        params = { lat: lat, lon: lon }
        call(params: params)
      end

      protected

      def url
        @url ||= OpenWeatherMap::BASE_URL + 'weather?'
      end
    end

    # TODO
    class Forecast < Client
    end
  end
end
