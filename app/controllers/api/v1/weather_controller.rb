require 'openweathermap'

module Api
  module V1
    class WeatherController < Api::ApiController
      def current
        owm_client = OpenWeatherMap::Client::Current.new(appid: Rails.application.secrets.openweathermap)
        owm_client.city(city: params[:city], country: params[:country])

        if owm_client.successful?
          temperature = owm_client.body.fetch('main').fetch('temp')
          render json: { temperature: temperature }
        else
          errors = owm_client.message, owm_client.status
          render json: { errors: errors[0] }, status: errors[1]
        end
      end
    end
  end
end
