require 'openweathermap'

module Api
  module V1
    class CurrentWeatherController < ActionController::API
      include Owmable

      def show
        if params[:query_type] == 'by_coord'
          owm_client.geocode(lat: params[:lat], lon: params[:lon])
        else
          owm_client.city(city: params[:city], country: params[:country])
        end

        json = parse_owm_response(owm_client)

        render json: json, status: owm_client.status
      end
    end
  end
end
