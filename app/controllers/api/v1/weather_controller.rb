require 'openweathermap'

module Api
  module V1
    class WeatherController < Api::ApiController
      def current
        # TODO: implement me
        render json: { hello: 'world' }
      end
    end
  end
end
