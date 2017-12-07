require 'openweathermap'

class Api::V1::WeatherController < Api::ApiController
  def current
    # TODO: implement me
    render json: { hello: 'world' }
  end
end
