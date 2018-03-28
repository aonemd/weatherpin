require 'openweathermap'

module Api
  module V1
    class CurrentWeatherController < ActionController::API
      include Owmable

      def show
        json = if params[:query_type] == 'by_coord'
                 Rails.cache.fetch("current_weather/by_coord/#{params[:lat]}/#{params[:lon]}",
                                   expires_in: 10.minutes) do
                   owm_client.geocode(lat: params[:lat], lon: params[:lon])
                   parse_owm_response(owm_client)
                 end
               else
                 Rails.cache.fetch("current_weather/by_city/#{params[:city]}/#{params[:country]}",
                                   expires_in: 10.minutes) do
                   owm_client.city(city: params[:city], country: params[:country])
                   parse_owm_response(owm_client)
                 end
               end

        render json: json, status: owm_client.status
      end
    end
  end
end
