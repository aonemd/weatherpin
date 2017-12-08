require 'openweathermap'

module Api
  module V1
    class WeatherController < ActionController::API
      def current
        owm_client.city(city: params[:city], country: params[:country])

        json = parse_owm_response(owm_client)

        render json: json, status: owm_client.status
      end

      def random
        grg_service = GenerateRandomGeolocation.new.call
        owm_client.geocode(lat: grg_service.latitude, lon: grg_service.longitude)

        json = parse_owm_response(owm_client)

        render json: json, status: owm_client.status
      end

      private

      def owm_client
        @owm_client ||=
          OpenWeatherMap::Client::Current.new(appid: Rails.application.secrets.openweathermap)
      end

      def parse_owm_response(owm_client)
        if owm_client.successful?
          {
            temperature: owm_client.body.fetch('main').fetch('temp'),
            place_name: owm_client.body.fetch('name')
          }
        else
          { errors: owm_client.message }
        end
      end
    end
  end
end
