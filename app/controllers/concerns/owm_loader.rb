module OWMLoader
  extend ActiveSupport::Concern

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
