require 'openweathermap'

class WeatherController < ApplicationController
  def current
    owm_client = OpenWeatherMap::Client::Current.new(appid: Rails.application.secrets.openweathermap)
    owm_client.city(city: params[:city], country: params[:country])

    json = if owm_client.successful?
             {
               temperature: owm_client.body.fetch('main').fetch('temp'),
               place_name: owm_client.body.fetch('name')
             }
           else
             { errors: owm_client.message }
           end

    respond_to do |format|
      format.html
      format.json { render json: json, status: owm_client.status }
    end
  end

  def random
    owm_client = OpenWeatherMap::Client::Current.new(appid: Rails.application.secrets.openweathermap)
    latitude   = Random.rand(-90..90)   # -90:90
    longitude  = Random.rand(-180..180) # -180:180
    owm_client.geocode(lat: latitude, lon: longitude)

    json = if owm_client.successful?
             {
               temperature: owm_client.body.fetch('main').fetch('temp'),
               place_name: owm_client.body.fetch('name')
             }
           else
             { errors: owm_client.message }
           end

    respond_to do |format|
      format.html
      format.json { render json: json, status: owm_client.status }
    end
  end
end
