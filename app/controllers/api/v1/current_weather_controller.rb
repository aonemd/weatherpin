require 'openweathermap'

module Api
  module V1
    class CurrentWeatherController < ActionController::API
      include Owmable

      def show
        owm_client.city(city: params[:city], country: params[:country])

        json = parse_owm_response(owm_client)

        render json: json, status: owm_client.status
      end
    end
  end
end
