require 'openweathermap'

class WeatherController < ApplicationController
  def current
    owm_client = OpenWeatherMap::Client::Current.new(appid: Rails.application.secrets.openweathermap)
    owm_client.city(city: params[:city], country: params[:country])

    json = if owm_client.successful?
             { temperature: owm_client.body.fetch('main').fetch('temp') }
           else
             { errors: owm_client.message }
           end

    respond_to do |format|
      format.html
      format.json { render json: json, status: owm_client.status }
    end
  end
end
