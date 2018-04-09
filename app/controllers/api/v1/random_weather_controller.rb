require 'openweathermap'

module Api
  module V1
    class RandomWeatherController < BaseController
      include OWMLoader

      def show
        grg_service = GenerateRandomGeolocation.new.call
        owm_client.geocode(lat: grg_service.latitude, lon: grg_service.longitude)

        json = parse_owm_response(owm_client)

        render json: json, status: owm_client.status
      end
    end
  end
end
